-- MAIN MENU --

local allweapons = {
    "WEAPON_UNARMED",
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
    "WEAPON_POOLCUE",
    "WEAPON_PIPEWRENCH",
    

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
    

    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_RAYPISTOL",
    

    "WEAPON_MICROSMG",
    "WEAPON_MINISMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_RAYCARBINE",
    

    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",
    

    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SWEEPERSHOTGUN",
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
    "WEAPON_MARKSMANRIFLE_MK2",
    

    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_FIREWORK",
    "WEAPON_RAILGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_RAYMINIGUN",
}

local singleweapons = {
	{"WEAPON_KNIFE", "Knife"},
	{"WEAPON_BAT", "Baseball Bat"},
	{"WEAPON_MACHETE", "Machete"},
    {"WEAPON_PISTOL", "Pistol"},
    {"WEAPON_COMBATPISTOL", "Combat Pistol"},
    {"WEAPON_REVOLVER", "Revolver"},
    {"WEAPON_PISTOL50", "Pistol .50"},
    {"WEAPON_STUNGUN", "Tazer"},
    {"WEAPON_MICROSMG", "Micro SMG"},
    {"WEAPON_MINISMG", "Mini SMG"},
    {"WEAPON_SMG", "SMG"},
    {"WEAPON_ASSAULTSMG", "Assault SMG"},
    {"WEAPON_ASSAULTRIFLE", "Assault Rifle"},
    {"WEAPON_SNIPERRIFLE", "Sniper Rifle"},
    {"WEAPON_RPG", "RPG"},
    {"WEAPON_FIREWORK", "Firework Launcher"},
    {"WEAPON_MOLOTOV", "Molotov"},
    {"WEAPON_STICKYBOMB", "Sticky Bomb"}
}

local killmenu_value = false

local YKyAw = {r = 225, g = 55, b = 55, a = 255}

-- SELF MENU --

local godmode = false
local invisible = false
local noclip = false
local NoclipSpeed = 1
local oldSpeed = 0

-- VISUAL MENU --

local blips = false
local nametags = false
local forcemap = false
local crosshair = false

-- MAIN THREAD --

Citizen.CreateThread(function()

	print('Server IP: ' .. GetCurrentServerEndpoint())

	ESX.ShowNotification("🔒 WIZARD MENU ~r~[ ~s~1.0 ~r~] 🔒")

	while true do

		Citizen.Wait(0)

		if killmenu_value then
			blips = false
			nametags = false
			isBlips()
			isNametags()
			break
		end

		EnableControlAction(0, 178, true)
		if IsControlJustReleased(0, 178) then
			if IsEntityDead(GetPlayerPed(-1)) then
				RevivePed()
			end
			OpenBypassMenu()
		end

		-- THREAD TIME --
		isNoclipping()
		isBlips()
		isNametags()
		isForce()
		isCrosshair()

	end

end)

function OpenBypassMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wizard_menu', { title = 'WizardMenu BY Niplix#4968', align = 'top-left', 
		elements = {
			{label = 'Self Menu', value = 'self_menu'},
			{label = 'Online Menu', value = 'online_menu'},
			{label = 'Weapon Menu', value = 'weapon_menu'},
			{label = 'Vehicle Menu', value = 'vehicle_menu'},
			{label = 'Server Menu', value = 'server_menu'},
			{label = 'Visual Menu', value = 'visual_menu'},
			{label = 'Objects Menu', value = 'objects_menu'},
			{label = '<span style="color:red;">Kill Menu', value = 'kill_menu'}
	}}, function(data, menu)
		if data.current.value == 'self_menu' then
			OpenSelfMenu()
		elseif data.current.value == 'online_menu' then
			OpenOnlineMenu()
		elseif data.current.value == 'weapon_menu' then
			OpenWeaponMenu()
		elseif data.current.value == 'vehicle_menu' then
			OpenVehicleMenu()
		elseif data.current.value == 'server_menu' then
			OpenServerMenu()
		elseif data.current.value == 'visual_menu' then
			OpenVisualMenu()
		elseif data.current.value == 'objects_menu' then
			OpenObjectsMenu()
		elseif data.current.value == 'kill_menu' then
			killmenu_value = true
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)

end

function OpenSelfMenu()

	local elements = {
		{label = 'GodMode Player ' .. BooleanToString(godmode), value = 'godmode'},
		{label = 'Invisible Player ' .. BooleanToString(invisible), value = 'invisible'},
		{label = 'NoClip Player ' .. BooleanToString(noclip), value = 'noclip'},
		{label = 'ESX Revive Player', value = 'revive'},
		{label = 'Teleport Into Vehicle', value = 'teleport_into_players_vehicle'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'self_menu', { title = 'Self Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'godmode' then
			if godmode then
				SetPlayerInvincible(PlayerId(), false)
				SetEntityInvincible(PlayerPedId(-1), false)
				SetEntityProofs(PlayerPedId(), false, false, false, false, false)
				ESX.ShowNotification('GodMode ~r~désactivé')
				godmode = false
			else
				SetPlayerInvincible(PlayerId(), true)
				SetEntityInvincible(PlayerPedId(-1), true)
				SetEntityProofs(PlayerPedId(), true, true, true, true, true)
				ESX.ShowNotification('GodMode ~g~activé')
				godmode = true
			end
		elseif data.current.value == 'invisible' then
			if invisible then
				SetEntityVisible(PlayerPedId(), true)
				ESX.ShowNotification('Invisible ~r~désactivé')
				invisible = false
			else
				SetEntityVisible(PlayerPedId(), false)
				ESX.ShowNotification('Invisible ~g~activé')
				invisible = true
			end
		elseif data.current.value == 'noclip' then
			if noclip then
				FreezeEntityPosition(PlayerId(), false)
				SetEntityInvincible(PlayerId(), false)
				SetEntityCollision(PlayerId(), true, true)

				SetEntityVisible(PlayerPedId(), true)
				SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true)

				SetEveryoneIgnorePlayer(PlayerId(), false)
				SetPoliceIgnorePlayer(PlayerId(), false)
				ESX.ShowNotification('NoClip ~r~désactivé')
				noclip = false
			else
				FreezeEntityPosition(PlayerId(), true)
				SetEntityInvincible(PlayerId(), true)
				SetEntityCollision(PlayerId(), false, false)

				SetEntityVisible(PlayerPedId(), false)

				SetEveryoneIgnorePlayer(PlayerId(), true)
				SetPoliceIgnorePlayer(PlayerId(), true)
				ESX.ShowNotification('NoClip ~g~activé')
				noclip = true
			end
		elseif data.current.value == 'revive' then
			RevivePed()
		elseif data.current.value == 'teleport_into_players_vehicle' then
			local veh = ESX.Game.GetClosestVehicle()
			if IsVehicleSeatFree(veh, 0) then
				SetPedIntoVehicle(PlayerPedId(), veh, -1)
			end
		end

		menu.close()
		OpenSelfMenu()

	end, function(data, menu)
		menu.close()
	end)

end

function OpenOnlineMenu()

	local elements = {}

	local playerlist = GetActivePlayers()
	for i = 1, #playerlist do
		local currPlayer = playerlist[i]
		table.insert(elements, {label = 'ID: [' .. GetPlayerServerId(currPlayer) .. '] - ' .. GetPlayerName(currPlayer), value = '' .. GetPlayerServerId(currPlayer)})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'online_menu', { title = 'Online Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		OpenSubOnlineMenu(data.current.value)

	end, function(data, menu)
		menu.close()
	end)

end

function OpenSubOnlineMenu(plyId)

	local selectedPlayer = GetPlayerFromServerId(tonumber(plyId))

	local elements = {
		{label = 'Teleport To Player', value = 'teleport_to_player'},
		{label = 'Teleport Into Vehicle', value = 'teleport_into_players_vehicle'},
		{label = 'Kick From Vehicle', value = 'kick_from_vehicle'},
		{label = 'Copy Skin Player', value = 'copy_skin_player'},
		{label = 'Give Single Weapon', value = 'give_single_weapon'},
		{label = 'Give All Weapons', value = 'give_all_weapons'},
		{label = 'Remove All Weapons', value = 'remove_all_weapons'},
		{label = 'Troll Kill Player', value = 'troll_kill_player'},
		{label = 'Troll Taze Player', value = 'troll_taze_player'},
		{label = 'ESX Revive Player', value = 'esx_revive_player'},
		{label = 'Police Handcuff Player', value = 'police_handcuff_player'},
		{label = 'Police Unrestrain Player', value = 'police_handcuff2_player'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_menu', { title = 'PLAYER: ' .. '[' .. GetPlayerServerId(selectedPlayer) .. '] ' .. GetPlayerName(selectedPlayer), align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'teleport_to_player' then
			TeleportToPlayer(selectedPlayer)
		elseif data.current.value == 'teleport_into_players_vehicle' then
			if not IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0) then
				ESX.ShowNotification("Player Not In Vehicle!")
			else
				local veh = GetVehiclePedIsIn(GetPlayerPed(selectedPlayer), 0)
				if IsVehicleSeatFree(veh, 0) then
					SetPedIntoVehicle(PlayerPedId(), veh, 0)
				end
			end
		elseif data.current.value == 'kick_from_vehicle' then
			KickFromVeh(selectedPlayer)
		elseif data.current.value == 'copy_skin_player' then
			ClonePed(selectedPlayer)
			TriggerEvent('esx_skin:requestSaveSkin', true)
		elseif data.current.value == 'give_single_weapon' then
			OpenSubWeaponMenu(selectedPlayer)
		elseif data.current.value == 'give_all_weapons' then
			GiveAllWeapons(selectedPlayer)
		elseif data.current.value == 'remove_all_weapons' then
			StripPlayer(selectedPlayer)
		elseif data.current.value == 'esx_revive_player' then
			TriggerServerEvent('esx_ambulancejob:revive', tonumber(GetPlayerServerId(selectedPlayer)))
			TriggerServerEvent('esx_ambulancejob:revivveux2', tonumber(GetPlayerServerId(selectedPlayer)))
		elseif data.current.value == 'troll_kill_player' then
			AddExplosion(GetEntityCoords(GetPlayerPed(selectedPlayer)), 33, 101.0, false, true, 0.0)
		elseif data.current.value == 'troll_taze_player' then
			shootAt(GetPlayerPed(selectedPlayer), "WEAPON_STUNGUN")
		elseif data.current.value == 'police_handcuff_player' then
			TriggerServerEvent('cuffServer', GetPlayerServerId(selectedPlayer))
			TriggerServerEvent('esx_policejob:requestarrest', GetPlayerServerId(selectedPlayer), GetEntityHeading(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(-1)), GetEntityForwardVector(PlayerPedId()))
			Wait(5000)
			TriggerServerEvent('esx_policejob:handcuffPasta', GetPlayerServerId(closestPlayer))
			TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
			ESX.ShowNotification('Handcuff ~g~activé')
		elseif data.current.value == 'police_handcuff2_player' then
			TriggerServerEvent('unCuffServer', GetPlayerServerId(selectedPlayer))
			TriggerServerEvent('esx_policejob:requestrelease', GetPlayerServerId(selectedPlayer), GetEntityHeading(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(-1)), GetEntityForwardVector(PlayerPedId()))
			Wait(5000)
			TriggerServerEvent('esx_policejob:handcuffPasta', GetPlayerServerId(closestPlayer))
			TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
			ESX.ShowNotification('Handcuff ~r~désactivé')
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenWeaponMenu()

	local elements = {
		{label = 'Give Single Weapon', value = 'give_single_weapon'},
		{label = 'Give All Weapons', value = 'give_all_weapons'},
		{label = 'Remove All Weapons', value = 'remove_all_weapons'},
		{label = 'Give Max Ammo', value = 'give_max_ammo'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_menu', { title = 'Weapon Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'give_single_weapon' then
			OpenSubWeaponMenu(PlayerId())
		elseif data.current.value == 'give_all_weapons' then
			GiveAllWeapons(PlayerId())
		elseif data.current.value == 'remove_all_weapons' then
			StripPlayer(PlayerId())
		elseif data.current.value == 'give_max_ammo' then
			GiveMaxAmmo(PlayerId())
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenSubWeaponMenu(plyId)

	local elements = {}
	for i = 1, #singleweapons do
		table.insert(elements, {label = '' .. singleweapons[i][2] .. '', value = '' .. singleweapons[i][1] .. ''})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'subweapon_menu', { title = 'Sub Weapon Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		GiveWeapon(plyId, data.current.value)

	end, function(data, menu)
		menu.close()
	end)

end

function OpenVehicleMenu()

	local elements = {
		{label = 'Vehicle Spawner', value = 'vehicle_spawner'},
		{label = 'Repair Vehicle', value = 'repair_vehicle'},
		{label = 'Delete Vehicle', value = 'delete_vehicle'},
		{label = 'Max All Tuning', value = 'max_all_tuning'},
		{label = 'Vehicle Boost Menu', value = 'vehicle_boost_menu'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_menu', { title = 'Vehicle Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'vehicle_spawner' then
			local model = GetKeyboardInput("Enter Model Name:")
			SpawnVeh(model, true, true)
		elseif data.current.value == 'repair_vehicle' then
			SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
			SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
			SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
			SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
			Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
		elseif data.current.value == 'delete_vehicle' then
			DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
		elseif data.current.value == 'max_all_tuning' then
			engine1(GetVehiclePedIsUsing(PlayerPedId()))
		elseif data.current.value == 'vehicle_boost_menu' then
			OpenBoostVehicleMenu()
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenBoostVehicleMenu()

	local elements = {
		{label = 'Engine Power boost RESET', value = 'engine_power_boost_reset'},
		{label = 'Engine Power boost x2', value = 'engine_power_boost_x2'},
		{label = 'Engine Power boost x4', value = 'engine_power_boost_x4'},
		{label = 'Engine Power boost x8', value = 'engine_power_boost_x8'},
		{label = 'Engine Power boost x16', value = 'engine_power_boost_x16'},
		{label = 'Engine Power boost x32', value = 'engine_power_boost_x32'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boost_vehicle_menu', { title = 'Boost Vehicle Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'engine_power_boost_reset' then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
		elseif data.current.value == 'engine_power_boost_x2' then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
		elseif data.current.value == 'engine_power_boost_x4' then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
		elseif data.current.value == 'engine_power_boost_x8' then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
		elseif data.current.value == 'engine_power_boost_x16' then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
		elseif data.current.value == 'engine_power_boost_x32' then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenServerMenu()

	local elements = {
		{label = 'Taze All', value = 'taze_all'},
		{label = 'Kill All', value = 'kill_all'},
		{label = 'Teleport All', value = 'teleport_all'},
		{label = 'Destroy Map', value = 'destroy_map'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'server_menu', { title = 'Server Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'taze_all' then
			local playerlist = GetActivePlayers()
			for i = 1, #playerlist do
				shootAt(GetPlayerPed(playerlist[i]), "WEAPON_STUNGUN")
			end
		elseif data.current.value == 'kill_all' then
			local playerlist = GetActivePlayers()
			for i = 1, #playerlist do
				AddExplosion(GetEntityCoords(GetPlayerPed(playerlist[i])), 33, 101.0, false, true, 0.0)
			end
		elseif data.current.value == 'teleport_all' then
			local playerlist = GetActivePlayers()
			for i = 1, #playerlist do
				TriggerServerEvent('esx_policejob:requestarrest', GetPlayerServerId(playerlist[i]), GetEntityHeading(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(-1)), GetEntityForwardVector(PlayerPedId()))
				Wait(500)
				TriggerServerEvent('esx_policejob:handcuffPasta', GetPlayerServerId(playerlist[i]))
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(playerlist[i]))
			end
		elseif data.current.value == 'destroy_map' then

		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenVisualMenu()

	local elements = {
		{label = 'Blips ' .. BooleanToString(blips), value = 'blips'},
		{label = 'Nametags ' .. BooleanToString(nametags), value = 'nametags'},
		{label = 'Force Map ' .. BooleanToString(forcemap), value = 'forcemap'},
		{label = 'Crosshair ' .. BooleanToString(crosshair), value = 'crosshair'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'visual_menu', { title = 'Visual Menu BY Niplix#4968', align = 'top-left', elements = elements }, function(data, menu)

		if data.current.value == 'blips' then
			if blips then
				ESX.ShowNotification('Blips ~r~désactivé')
				blips = false
			else
				ESX.ShowNotification('Blips ~g~activé')
				blips = true
			end
		elseif data.current.value == 'nametags' then
			if nametags then
				ESX.ShowNotification('Nametags ~r~désactivé')
				nametags = false
			else
				ESX.ShowNotification('Nametags ~g~activé')
				nametags = true
			end
		elseif data.current.value == 'forcemap' then
			if forcemap then
				ESX.ShowNotification('Force Map ~r~désactivé')
				forcemap = false
			else
				ESX.ShowNotification('Force Map ~g~activé')
				forcemap = true
			end
		elseif data.current.value == 'crosshair' then
			if crosshair then
				ESX.ShowNotification('Crosshair ~r~désactivé')
				crosshair = false
			else
				ESX.ShowNotification('Crosshair ~g~activé')
				crosshair = true
			end
		end

		menu.close()
		OpenVisualMenu()

	end, function(data, menu)
		menu.close()
	end)

end

function OpenObjectsMenu()
	-- body
end

-- UTILS FUNCTIONS --

function BooleanToString(boolean)
	if boolean then
		return "ON"
	else
		return "OFF"
	end
end

function isNoclipping()
	if noclip then
		local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
        local k = nil
        local x, y, z = nil
        
        if not isInVehicle then
            k = PlayerPedId()
            x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
        else
            k = GetVehiclePedIsIn(PlayerPedId(), 0)
            x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
        end
        
        if isInVehicle and GetSeatPedIsIn(PlayerPedId()) ~= -1 then RequestControlOnce(k) end
        
        local dx, dy, dz = GetCamDirection()
        SetEntityVisible(PlayerPedId(), 0, 0)
        SetEntityVisible(k, 0, 0)
        
        SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
        
        if IsDisabledControlJustPressed(0, 21) then -- Change speed
            oldSpeed = NoclipSpeed
            NoclipSpeed = NoclipSpeed * 2
        end
        if IsDisabledControlJustReleased(0, 21) then -- Restore speed
            NoclipSpeed = oldSpeed
        end
        
        if IsDisabledControlPressed(0, 32) then -- MOVE FORWARD
            x = x + NoclipSpeed * dx
            y = y + NoclipSpeed * dy
            z = z + NoclipSpeed * dz
        end
        
        if IsDisabledControlPressed(0, 269) then -- MOVE BACK
            x = x - NoclipSpeed * dx
            y = y - NoclipSpeed * dy
            z = z - NoclipSpeed * dz
        end
		
		if IsDisabledControlPressed(0, 22) then -- MOVE UP
            z = z + NoclipSpeed
        end
        
		if IsDisabledControlPressed(0, 36) then -- MOVE DOWN
            z = z - NoclipSpeed
        end
        
        SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
    end
end

function GetCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(pitch * math.pi / 180.0)
    
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    
    return x, y, z
end

function GetSeatPedIsIn(ped)
    if not IsPedInAnyVehicle(ped, false) then return
    else
        veh = GetVehiclePedIsIn(ped)
        for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
            if GetPedInVehicleSeat(veh) then return i end
        end
    end
end

function RequestControlOnce(entity)
    if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

function isNametags()
	for i = 0, 255 do
        if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
            ped = GetPlayerPed(i)
            blip = GetBlipFromEntity(ped)
            idTesta = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), false, false, "", false)
            if nametags then
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, true)
                if NetworkIsPlayerTalking(i) then
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, true)
                else
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                end
            else
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, false)
            end
        end
    end
end

function isBlips()
	for i = 0, 255 do
        if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
            ped = GetPlayerPed(i)
            blip = GetBlipFromEntity(ped)
            idTesta = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), false, false, "", false)
            if blips then
                if not DoesBlipExist(blip) then
                    blip = AddBlipForEntity(ped)
                    SetBlipSprite(blip, 1)
                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                else
                    veh = GetVehiclePedIsIn(ped, false)
                    blipSprite = GetBlipSprite(blip)
                    if not GetEntityHealth(ped) then
                        if blipSprite ~= 274 then
                            SetBlipSprite(blip, 274)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                        end
                    elseif veh then
                        calsseVeicolo = GetVehicleClass(veh)
                        modelloVeicolo = GetEntityModel(veh)
                        if calsseVeicolo == 15 then
                            if blipSprite ~= 422 then
                                SetBlipSprite(blip, 422)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif calsseVeicolo == 16 then
                            if modelloVeicolo == GetHashKey("besra") or modelloVeicolo == GetHashKey("hydra") or modelloVeicolo == GetHashKey("lazer") then
                                if blipSprite ~= 424 then
                                    SetBlipSprite(blip, 424)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif blipSprite ~= 423 then
                                SetBlipSprite(blip, 423)
                                Citizen.InvokeNative (0x5FBCA48327B914DF, blip, false)
                            end
                        elseif calsseVeicolo == 14 then
                            if blipSprite ~= 427 then
                                SetBlipSprite(blip, 427)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif modelloVeicolo == GetHashKey("insurgent") or modelloVeicolo == GetHashKey("insurgent2") or modelloVeicolo == GetHashKey("limo2") then
                            if blipSprite ~= 426 then
                            	SetBlipSprite(blip, 426)
                            	Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif modelloVeicolo == GetHashKey("rhino") then
                        	if blipSprite ~= 421 then
                        		SetBlipSprite(blip, 421)
                        		Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                        	end
                        elseif blipSprite ~= 1 then
                        	SetBlipSprite(blip, 1)
                        	Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
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
                        distanza = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
                        if distanza < 0 then
                        	distanza = 0
                        elseif distanza > 255 then
                        	distanza = 255
                        end
                        SetBlipAlpha(blip, distanza)
                    end
                end
            else
            	RemoveBlip(blip)
            end
        end
    end
end

function isForce()
	if forcemap then
		DisplayRadar(true)
	end
end

function TeleportToPlayer(target)
    local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

function KickFromVeh(target)
    local ped = GetPlayerPed(target)
    if IsPedInAnyVehicle(ped, false) then
        ClearPedTasksImmediately(ped)
    end
end

function ClonePed(target)
        local ped = GetPlayerPed(target)
        local me = PlayerPedId()

        hat = GetPedPropIndex(ped, 0)
        hat_texture = GetPedPropTextureIndex(ped, 0)

        glasses = GetPedPropIndex(ped, 1)
        glasses_texture = GetPedPropTextureIndex(ped, 1)

        ear = GetPedPropIndex(ped, 2)
        ear_texture = GetPedPropTextureIndex(ped, 2)

        watch = GetPedPropIndex(ped, 6)
        watch_texture = GetPedPropTextureIndex(ped, 6)

        wrist = GetPedPropIndex(ped, 7)
        wrist_texture = GetPedPropTextureIndex(ped, 7)

        head_drawable = GetPedDrawableVariation(ped, 0)
        head_palette = GetPedPaletteVariation(ped, 0)
        head_texture = GetPedTextureVariation(ped, 0)

        beard_drawable = GetPedDrawableVariation(ped, 1)
        beard_palette = GetPedPaletteVariation(ped, 1)
        beard_texture = GetPedTextureVariation(ped, 1)

        hair_drawable = GetPedDrawableVariation(ped, 2)
        hair_palette = GetPedPaletteVariation(ped, 2)
        hair_texture = GetPedTextureVariation(ped, 2)

        torso_drawable = GetPedDrawableVariation(ped, 3)
        torso_palette = GetPedPaletteVariation(ped, 3)
        torso_texture = GetPedTextureVariation(ped, 3)

        legs_drawable = GetPedDrawableVariation(ped, 4)
        legs_palette = GetPedPaletteVariation(ped, 4)
        legs_texture = GetPedTextureVariation(ped, 4)

        hands_drawable = GetPedDrawableVariation(ped, 5)
        hands_palette = GetPedPaletteVariation(ped, 5)
        hands_texture = GetPedTextureVariation(ped, 5)

        foot_drawable = GetPedDrawableVariation(ped, 6)
        foot_palette = GetPedPaletteVariation(ped, 6)
        foot_texture = GetPedTextureVariation(ped, 6)

        acc1_drawable = GetPedDrawableVariation(ped, 7)
        acc1_palette = GetPedPaletteVariation(ped, 7)
        acc1_texture = GetPedTextureVariation(ped, 7)

        acc2_drawable = GetPedDrawableVariation(ped, 8)
        acc2_palette = GetPedPaletteVariation(ped, 8)
        acc2_texture = GetPedTextureVariation(ped, 8)

        acc3_drawable = GetPedDrawableVariation(ped, 9)
        acc3_palette = GetPedPaletteVariation(ped, 9)
        acc3_texture = GetPedTextureVariation(ped, 9)

        mask_drawable = GetPedDrawableVariation(ped, 10)
        mask_palette = GetPedPaletteVariation(ped, 10)
        mask_texture = GetPedTextureVariation(ped, 10)

        aux_drawable = GetPedDrawableVariation(ped, 11)
        aux_palette = GetPedPaletteVariation(ped, 11)
        aux_texture = GetPedTextureVariation(ped, 11)

        SetPedPropIndex(me, 0, hat, hat_texture, 1)
        SetPedPropIndex(me, 1, glasses, glasses_texture, 1)
        SetPedPropIndex(me, 2, ear, ear_texture, 1)
        SetPedPropIndex(me, 6, watch, watch_texture, 1)
        SetPedPropIndex(me, 7, wrist, wrist_texture, 1)

        SetPedComponentVariation(me, 0, head_drawable, head_texture, head_palette)
        SetPedComponentVariation(me, 1, beard_drawable, beard_texture, beard_palette)
        SetPedComponentVariation(me, 2, hair_drawable, hair_texture, hair_palette)
        SetPedComponentVariation(me, 3, torso_drawable, torso_texture, torso_palette)
        SetPedComponentVariation(me, 4, legs_drawable, legs_texture, legs_palette)
        SetPedComponentVariation(me, 5, hands_drawable, hands_texture, hands_palette)
        SetPedComponentVariation(me, 6, foot_drawable, foot_texture, foot_palette)
        SetPedComponentVariation(me, 7, acc1_drawable, acc1_texture, acc1_palette)
        SetPedComponentVariation(me, 8, acc2_drawable, acc2_texture, acc2_palette)
        SetPedComponentVariation(me, 9, acc3_drawable, acc3_texture, acc3_palette)
        SetPedComponentVariation(me, 10, mask_drawable, mask_texture, mask_palette)
        SetPedComponentVariation(me, 11, aux_drawable, aux_texture, aux_palette)
end

function GiveAllWeapons(target)
    local ped = GetPlayerPed(target)
    for i = 0, #allweapons do
        GiveWeaponToPed(ped, GetHashKey(allweapons[i]), 9999, false, false)
    end
end

function StripPlayer(target)
    local ped = GetPlayerPed(target)
    RemoveAllPedWeapons(ped, false)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned')
end

function RevivePed()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = ESX.Math.Round(coords.x, 1),
		y = ESX.Math.Round(coords.y, 1),
		z = ESX.Math.Round(coords.z, 1)
	}

	RespawnPed(playerPed, formattedCoords, 0.0)

	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end

function shootAt(target, weapon)
    if IsPedInAnyVehicle(target, true) then
        ClearPedTasksImmediately(target)
    end
    local v1phsaBMVn16OJ = GetPedBoneCoords(target, SKEL_ROOT, 0, 0, 0)
    local d666AsUSlPa0z5 = GetPedBoneCoords(target, SKEL_R_Hand, 0, 0, 0.2)
    local I8 = GetHashKey(weapon)
    ShootSingleBulletBetweenCoords(
        d666AsUSlPa0z5.x,
        d666AsUSlPa0z5.y,
        d666AsUSlPa0z5.z,
        v1phsaBMVn16OJ.x,
        v1phsaBMVn16OJ.y,
        v1phsaBMVn16OJ.z,
        1,
        0,
        I8,
        PlayerPedId(),
        false,
        false,
        1
    )
end

function GiveMaxAmmo(target)
    local ped = GetPlayerPed(target)
    for i = 1, #allweapons do
        AddAmmoToPed(ped, GetHashKey(allweapons[i]), 9999)
    end
end

function GiveWeapon(target, weapon)
    local ped = GetPlayerPed(target)
    GiveWeaponToPed(ped, GetHashKey(weapon), 9999, false, false)
end

function GetKeyboardInput(text)
	if not text then text = "Input" end
    DisplayOnscreenKeyboard(0, "", "", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
		DrawTxt(text, 0.32, 0.37, 0.0, 0.4)
        DisableAllControlActions(0)

        if IsDisabledControlPressed(0, 322) then return "" end
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        Wait(0)
        return result
    end
end

 function SpawnVeh(model, PlaceSelf, SpawnEngineOn)
    RequestModel(GetHashKey(model))
    Wait(500)
    if HasModelLoaded(GetHashKey(model)) then
        local coords = GetEntityCoords(PlayerPedId())
        local xf = GetEntityForwardX(PlayerPedId())
        local yf = GetEntityForwardY(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        local veh = CreateVehicle(GetHashKey(model), coords.x + xf * 5, coords.y + yf * 5, coords.z, heading, 1, 1)
        if PlaceSelf then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
        if SpawnEngineOn then SetVehicleEngineOn(veh, 1, 1) end
        return veh
    else
    	ESX.ShowNotification("~r~Model not recognized (Try Again)")
    end
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

function DrawTxt(text, x, y, scale, size)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(scale, size)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function DelVeh(veh)
	SetEntityAsMissionEntity(Object, 1, 1)
	DeleteEntity(Object)
	SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
	DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function drawTextCrosshairs(_Jvt13x6Un9RPE, nPIyrvZsPssLdH2IN, g3IXCgquUds95a)
    SetTextColour(YKyAw.r, YKyAw.g, YKyAw.b, 255)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(_Jvt13x6Un9RPE)
    DrawText(nPIyrvZsPssLdH2IN, g3IXCgquUds95a)
end

function isCrosshair()
	if crosshair then
		drawTextCrosshairs("+", 0.495, 0.484, 1, 0.3, YKyAw)
	end
end