modVersion = "V1.0.0"

dreanhsModThread = ScriptThread("Dreanh's Mod Menu " .. modVersion)

dreanhsMod = {}

function dreanhsModThread:Run()

	-- Settings:
	--Keys can be found in GTALua\internal\extensions\keycodes.lua
	--Xbox buttons can be found at the last lines of this script.
	dreanhsMod.speedBoostKey = KEY_X
	dreanhsMod.speedBoostButton = BUTTON_A
	dreanhsMod.openMenuKey = KEY_F11
	dreanhsMod.openMenuButton = BUTTON_R3
	
	-- Enable/disable at startup.
	dreanhsMod.drawMenu = false -- Draw menu on gta startup.
	dreanhsMod.invinciblePlayerEnabled = false -- Start invincible.
	dreanhsMod.invincibleVehEnabled = false -- Start veh invincible.
	dreanhsMod.areaEnabled = false -- Start nearby peds join team.
	dreanhsMod.crazyVehiclesEnabled = false -- Start with vehicle mayhem.
	dreanhsMod.crazyPedsEnabled = false -- Start with crazy peds.
	dreanhsMod.noVehiclesEnabled = false -- Start with no traffic.
	dreanhsMod.speedBoostEnabled = false -- Start with speedboost.
	dreanhsMod.speedoEnabled = true -- Start with speedometer.
	dreanhsMod.speedoMoveEnabled = false -- Start with speedometer moveable.
	dreanhsMod.speedoMphEnabled = false -- Start with mph unit.
	
	-- Positions for menu and speedometer (0 - 1).
	dreanhsMod.menuX = 0.03
	dreanhsMod.menuY = 0.02
	
	dreanhsMod.speedoX = 0.16
	dreanhsMod.speedoY = 0.835
	
	-- Don't edit below if you don't know what you're doing.
	dreanhsMod.controllerHold = 0
	dreanhsMod.menu = {}
	dreanhsMod.lastIndex = 2
	
	dreanhsMod.currentVehicle = 1
	dreanhsMod.keyHoldCountRight = 0
	dreanhsMod.keyHoldCountLeft = 0
	
	dreanhsMod.timerAreaVehicles = 0
	dreanhsMod.timerCrazyVehicles = 0
	dreanhsMod.timerCrazyPeds = 0

	dreanhsMod.playerVel = 0, 0, 0
	dreanhsMod.playerSpeed = 0
	dreanhsMod.playerAvgSpeed = 0
	dreanhsMod.timerSpeed = 0
	dreanhsMod.speedTime = 0
	dreanhsMod.playerSpeedMax = 0.001
	
	if dreanhsMod.speedoMphEnabled then
		dreanhsMod.speedMult = 0.621371192
	else
		dreanhsMod.speedMult = 0
	end

	dreanhsMod.lastFrameCount = game.GetTime()
	dreanhsMod.frameDiff = 0
	
	dreanhsMod.createMenuObject{
		text = "Dreanh's Mod Menu " .. modVersion,
		textColor = Color(180, 255, 0),
		textScale = 0.9
	}
	
	dreanhsMod.createMenuObject{
		text = "Spawn vehicle: " .. string.upper(string.sub(vehiclesList[dreanhsMod.currentVehicle][2], 1, 1)) .. string.lower(string.sub(vehiclesList[dreanhsMod.currentVehicle][2], 2,-1)),
		run = function()
			pos = LocalPlayer():GetOffsetVector(0,5,0)
			streaming.RequestModel(vehiclesList[dreanhsMod.currentVehicle][1])
			game.CreateVehicle(vehiclesList[dreanhsMod.currentVehicle][1], pos)
			streaming.ReleaseModel(vehiclesList[dreanhsMod.currentVehicle][1])
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Performance upgrade vehicle",
		run = function()
			if LocalPlayer():IsInVehicle() then
				local vehicle = LocalPlayer():GetVehicle().ID
				natives.VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
				natives.VEHICLE.SET_VEHICLE_MOD(vehicle, 11, natives.VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, 11)-1, true)
				natives.VEHICLE.SET_VEHICLE_MOD(vehicle, 12, natives.VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, 12)-1, true)
				natives.VEHICLE.SET_VEHICLE_MOD(vehicle, 13, natives.VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, 13)-1, true)
				natives.VEHICLE.SET_VEHICLE_MOD(vehicle, 15, natives.VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, 15)-1, true)
				natives.VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 18, true)
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Invincible vehicle: ",
		state = "Off",
		run = function()
			if dreanhsMod.invincibleVehEnabled then
				dreanhsMod.invincibleVehEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.invincibleVehEnabled = true
				if LocalPlayer():IsInVehicle() then
					LocalPlayer():GetVehicle():Fix()
					LocalPlayer():GetVehicle():SetDirtLevel(0)
				end
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Fix vehicle",
		run = function()
			if LocalPlayer():IsInVehicle() then
				LocalPlayer():GetVehicle():Fix()
				LocalPlayer():GetVehicle():SetDirtLevel(0)
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Speedboost: ",
		state = "Off",
		run = function() 
			if dreanhsMod.speedBoostEnabled then
				dreanhsMod.speedBoostEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.speedBoostEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Invincible player: ",
		state = "Off",
		run = function()
			if dreanhsMod.invinciblePlayerEnabled then
				dreanhsMod.invinciblePlayerEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
				LocalPlayer():SetInvincible(false)
			else
				dreanhsMod.invinciblePlayerEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Nearby peds becomes ally: ",
		state = "Off",
		run = function() 
			if dreanhsMod.areaEnabled then
				dreanhsMod.areaEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.areaEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Crazy peds: ",
		state = "Off",
		run = function()
			if dreanhsMod.crazyPedsEnabled then
				dreanhsMod.crazyPedsEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.crazyPedsEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Vehicle Mayhem: ",
		state = "Off",
		run = function()
			if dreanhsMod.crazyVehiclesEnabled then
				dreanhsMod.crazyVehiclesEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.crazyVehiclesEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "No traffic: ",
		state = "Off",
		run = function()
			if dreanhsMod.noVehiclesEnabled then
				dreanhsMod.noVehiclesEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.noVehiclesEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Speedometer: ",
		state = "On",
		run = function() 
			if dreanhsMod.speedoEnabled then
				dreanhsMod.speedoEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.speedoEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Move spedometer: ",
		state = "Off",
		run = function() 
			if dreanhsMod.speedoMoveEnabled then
				dreanhsMod.speedoMoveEnabled = false
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "Off"
			else
				dreanhsMod.speedoMoveEnabled = true
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "On"
			end
		end
	}
	
	local tempState = ""
	if dreanhsMod.speedoMphEnabled then
		tempState = "MP/H"
	else
		tempState = "KP/H"
	end
	dreanhsMod.createMenuObject{
		text = "Speed unit: ",
		state = tempState,
		
		run = function()
			if dreanhsMod.speedMult ~= 0 then
				dreanhsMod.speedMult = 0
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "KP/H"
			else
				dreanhsMod.speedMult = 0.621371192
				dreanhsMod.menu[dreanhsMod.lastIndex]["state"] = "MP/H"
			end
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Reset higest speed",
		run = function()
			dreanhsMod.playerSpeedMax = 0.001
		end
	}
	
	dreanhsMod.createMenuObject{
		text = "Reset distance & average speed",
		run = function()
			dreanhsMod.playerAvgSpeed = 0
			dreanhsMod.speedTime = 0
		end
	}
	
	
	while self:IsRunning() do
		dreanhsMod.frameDiff = game.GetTime() - dreanhsMod.lastFrameCount
		
		dreanhsMod.lastFrameCount = game.GetTime()

		dreanhsMod.updateMenu()
		
		if IsKeyDown(dreanhsMod.openMenuKey) or dreanhsMod.isControllerDown(BUTTON_R3) then
			if not dreanhsMod.drawMenu then
				dreanhsMod.drawMenu = true
				--natives.GAMEPLAY.SET_GAME_PAUSED(true)
				gui.BeepSelect()
			else
				dreanhsMod.drawMenu = false
				--natives.GAMEPLAY.SET_GAME_PAUSED(false)
				gui.BeepBack()
			end
		end
		
		
		--[[
		if dreanhsMod.timeTimer > 100 then
			dreanhsMod.timeTimer = 0
			local hour = natives.TIME.GET_CLOCK_HOURS()
			local mins = natives.TIME.GET_CLOCK_MINUTES()+5
			if mins > 59 then
				mins = 0
				hour = hour + 1
				if hour > 23 then
					hour = 0
				end
			end
			natives.TIME.SET_CLOCK_TIME(hour, mins, 0)
		end
		]]--
		
		if dreanhsMod.drawMenu and dreanhsMod.lastIndex == 2 then
			if IsKeyDown(KEY_NUMPAD6) or IsKeyDown(KEY_RIGHT) or IsKeyDown(KEY_D) or dreanhsMod.isControllerDown(BUTTON_LRIGHT) or dreanhsMod.isControllerDown(BUTTON_DRIGHT) then
				if dreanhsMod.keyHoldCountRight < 5 then
					dreanhsMod.keyHoldCountRight = dreanhsMod.keyHoldCountRight + 1
				end
				dreanhsMod.currentVehicle = dreanhsMod.currentVehicle + dreanhsMod.keyHoldCountRight
				if dreanhsMod.currentVehicle > #vehiclesList then
					dreanhsMod.currentVehicle = 1
				end
				dreanhsMod.menu[dreanhsMod.lastIndex]["text"] = "Spawn vehicle: " .. string.upper(string.sub(vehiclesList[dreanhsMod.currentVehicle][2], 1, 1)) .. string.lower(string.sub(vehiclesList[dreanhsMod.currentVehicle][2], 2,-1))
			else
				if dreanhsMod.keyHoldCountRight > 0 then
					dreanhsMod.keyHoldCountRight = dreanhsMod.keyHoldCountRight - 1
				end
			end
			if IsKeyDown(KEY_NUMPAD4) or IsKeyDown(KEY_LEFT) or IsKeyDown(KEY_A) or dreanhsMod.isControllerDown(BUTTON_LLEFT) or dreanhsMod.isControllerDown(BUTTON_DLEFT) then
				if dreanhsMod.keyHoldCountRight < 5 then
					dreanhsMod.keyHoldCountLeft = dreanhsMod.keyHoldCountLeft + 1
				end
				dreanhsMod.currentVehicle = dreanhsMod.currentVehicle - dreanhsMod.keyHoldCountLeft
				if dreanhsMod.currentVehicle < 1 then
					dreanhsMod.currentVehicle = #vehiclesList
				end
				dreanhsMod.menu[dreanhsMod.lastIndex]["text"] = "Spawn vehicle: " .. string.upper(string.sub(vehiclesList[dreanhsMod.currentVehicle][2], 1, 1)) .. string.lower(string.sub(vehiclesList[dreanhsMod.currentVehicle][2], 2,-1))
			else
				if dreanhsMod.keyHoldCountLeft > 0 then
					dreanhsMod.keyHoldCountLeft = dreanhsMod.keyHoldCountLeft - 1
				end
			end
		end
		
		if dreanhsMod.invincibleVehEnabled then
			local vehicle = LocalPlayer():GetVehicle()
			if LocalPlayer():IsInVehicle() and natives.ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(vehicle.ID) then
				vehicle:SetInvincible(true)
				vehicle:SetEngineState(true)
				vehicle:SetHealth(1000)
				if math.floor(dreanhsMod.playerSpeed) == 0 then
					natives.VEHICLE.SET_VEHICLE_FIXED(vehicle.ID)
				end
				natives.VEHICLE.SET_VEHICLE_CAN_BREAK(vehicle.ID, false)
				natives.VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle.ID, false)
				natives.VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(vehicle.ID, false)
				natives.VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle.ID)
				natives.VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle.ID, 1000)
			end
		end
		
		if dreanhsMod.invinciblePlayerEnabled then
			if not natives.PLAYER.GET_PLAYER_INVINCIBLE(LocalPlayer().ID) then
				LocalPlayer():SetInvincible(true)
			end
		end
		
		if dreanhsMod.speedBoostEnabled then
			if (IsKeyDown(dreanhsMod.speedBoostKey) or dreanhsMod.isControllerDown(dreanhsMod.speedBoostButton)) and LocalPlayer():IsInVehicle() and not dreanhsMod.drawMenu then
				natives.ENTITY.SET_ENTITY_MAX_SPEED(LocalPlayer():GetVehicle().ID, 99999999)
				natives.VEHICLE.SET_VEHICLE_FORWARD_SPEED(LocalPlayer():GetVehicle().ID, dreanhsMod.playerSpeed/3.6 + 1)
			end
		end
		
		if dreanhsMod.speedoMoveEnabled and not dreanhsMod.drawMenu then
			if IsKeyDown(KEY_NUMPAD8) or dreanhsMod.isControllerDown(BUTTON_LUP) or dreanhsMod.isControllerDown(BUTTON_DUP) then
				dreanhsMod.speedoY = dreanhsMod.speedoY - 0.01
			end
			if IsKeyDown(KEY_NUMPAD2) or dreanhsMod.isControllerDown(BUTTON_LDOWN) or dreanhsMod.isControllerDown(BUTTON_DDOWN) then
				dreanhsMod.speedoY = dreanhsMod.speedoY + 0.01
			end
			if IsKeyDown(KEY_NUMPAD4) or dreanhsMod.isControllerDown(BUTTON_LLEFT) or dreanhsMod.isControllerDown(BUTTON_DLEFT) then
				dreanhsMod.speedoX = dreanhsMod.speedoX - 0.01
			end
			if IsKeyDown(KEY_NUMPAD6) or dreanhsMod.isControllerDown(BUTTON_LRIGHT) or dreanhsMod.isControllerDown(BUTTON_DRIGHT) then
				dreanhsMod.speedoX = dreanhsMod.speedoX + 0.01
			end
		end
		
		if dreanhsMod.speedoEnabled and LocalPlayer():IsInVehicle() then
				
			dreanhsMod.playerVel = LocalPlayer():GetVelocity()
			dreanhsMod.playerSpeed = 3.6 * math.sqrt((dreanhsMod.playerVel.x^2)+(dreanhsMod.playerVel.y^2)+(dreanhsMod.playerVel.z^2))
			
			dreanhsMod.timerSpeed = dreanhsMod.timerSpeed + dreanhsMod.frameDiff
		
			if dreanhsMod.timerSpeed >= 1000 then
				dreanhsMod.timerSpeed = dreanhsMod.timerSpeed - 1000
				dreanhsMod.speedTime = dreanhsMod.speedTime + 1
				dreanhsMod.playerAvgSpeed = dreanhsMod.playerAvgSpeed + dreanhsMod.playerSpeed
			end
			
			if dreanhsMod.playerSpeed > dreanhsMod.playerSpeedMax then
				dreanhsMod.playerSpeedMax = dreanhsMod.playerSpeed
			end
			if not dreanhsMod.drawMenu then
				local zeroStr = ""
				if dreanhsMod.playerSpeed < 10 then
					zeroStr = "00"
				elseif dreanhsMod.playerSpeed < 100 then
					zeroStr = "0"
				end
				gui.DrawRect( dreanhsMod.speedoX, dreanhsMod.speedoY, 0.13, 0.15, Color ( 20, 20, 20, 100 ) )
				if dreanhsMod.speedMult == 0 then
					if dreanhsMod.playerSpeed < 1000 then
						dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.01, "KP/H: " .. zeroStr .. string.format("%.1f", dreanhsMod.playerSpeed), 0.7 + (dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax/10), Color(255 - (220*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)),255, 100*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)))
					else
						dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.01, "KP/H: " .. math.floor(dreanhsMod.playerSpeed), 0.7 + (dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax/10), Color(255 - (220*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)),255, 100*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)))
					end
					dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.07, "Highest speed: " .. string.format("%.1f", dreanhsMod.playerSpeedMax) .. " KP/H", 0.4, Color(255,180,0))
					dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.09, "Average speed: " .. string.format("%.1f", (dreanhsMod.playerAvgSpeed/dreanhsMod.speedTime)) .. " KP/H", 0.4, Color(255,180,0))
					dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.11, "Distance: " .. string.format("%.2f", dreanhsMod.playerAvgSpeed/60/60) .. " KM", 0.4, Color(255,180,0))
				else
					if dreanhsMod.playerSpeed < 1000 then
						dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.01, "MP/H: " .. zeroStr .. string.format("%.1f", dreanhsMod.playerSpeed * dreanhsMod.speedMult), 0.7 + (dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax/10), Color(255 - (220*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)),255, 100*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)))
					else
						dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.01, "MP/H: " .. math.floor(dreanhsMod.playerSpeed * dreanhsMod.speedMult), 0.7 + (dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax/10), Color(255 - (220*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)),255, 100*(dreanhsMod.playerSpeed/dreanhsMod.playerSpeedMax)))
					end
					dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.07, "Highest speed: " .. string.format("%.1f", dreanhsMod.playerSpeedMax * dreanhsMod.speedMult) .. " MP/H", 0.4, Color(255,180,0))
					dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.09, "Average speed: " .. string.format("%.1f", (dreanhsMod.playerAvgSpeed/dreanhsMod.speedTime)* dreanhsMod.speedMult) .. " MP/H", 0.4, Color(255,180,0))
					dreanhsMod.text(dreanhsMod.speedoX+0.01, dreanhsMod.speedoY+0.11, "Distance: " .. string.format("%.2f", dreanhsMod.playerAvgSpeed/60/60* dreanhsMod.speedMult) .. " M", 0.4, Color(255,180,0))
				end
			end
			
		end
		
		if dreanhsMod.areaEnabled then
			dreanhsMod.timerAreaVehicles = dreanhsMod.timerAreaVehicles + dreanhsMod.frameDiff
			if dreanhsMod.timerAreaVehicles > 100 then
				dreanhsMod.timerAreaVehicles = 0
				local nearby_peds = LocalPlayer():GetNearbyPeds(10)
				for _, ped in pairs(nearby_peds) do
					if ped:GetGroupIndex() ~= LocalPlayer():GetGroupIndex() then
						ped:AddGroupMember(LocalPlayer())
					end
				end
			end
		end
		
		if dreanhsMod.crazyVehiclesEnabled then
			dreanhsMod.timerCrazyVehicles = dreanhsMod.timerCrazyVehicles + dreanhsMod.frameDiff
			if dreanhsMod.timerCrazyVehicles > 60 then
				
				dreanhsMod.timerCrazyVehicles = 0
				local nearby_vehicles = LocalPlayer():GetNearbyVehicles(500)
				if nearby_vehicles then
					for _, vehicle in pairs(nearby_vehicles) do 
						local vehVel = vehicle:GetVelocity()
						local vehSpeed = math.sqrt((vehVel.x^2)+(vehVel.y^2)+(vehVel.z^2))
						if LocalPlayer():IsInVehicle() and vehicle.ID ~= LocalPlayer():GetVehicle().ID then
							natives.VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(vehicle.ID, false, false)
							natives.VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle.ID, vehSpeed+5)
							vehicle:SetHealth(10000)
							natives.VEHICLE.SET_VEHICLE_DOOR_BROKEN(vehicle.ID, math.random(0,6), false)
						elseif not LocalPlayer():IsInVehicle() then
							natives.VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(vehicle.ID, false, false)
							natives.VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle.ID, vehSpeed+5)
							vehicle:SetHealth(10000)
							natives.VEHICLE.SET_VEHICLE_DOOR_BROKEN(vehicle.ID, math.random(0,6), false)
						end
					end
				end
			end
		end
		
		if dreanhsMod.crazyPedsEnabled then
			dreanhsMod.timerCrazyPeds = dreanhsMod.timerCrazyPeds + dreanhsMod.frameDiff
			if dreanhsMod.timerCrazyPeds > 60 then
				dreanhsMod.timerCrazyPeds = 0
				local nearby_peds = LocalPlayer():GetNearbyPeds(500)
				for i = 1, #nearby_peds  do
					nearby_peds[i]:DelayedGiveWeapon(weaponsList[math.random(#weaponsList)]["hash"],5000)
					local pos = nearby_peds[i]:GetPosition()
					natives.PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(nearby_peds[i].ID, true);
					local enemy = math.random(#nearby_peds)
					natives.PED.SET_PED_AS_ENEMY(nearby_peds[enemy].ID, true)
					natives.AI.TASK_COMBAT_PED(nearby_peds[i].ID, nearby_peds[enemy].ID, 0, 16);
					--natives.AI.TASK_COMBAT_HATED_TARGETS_IN_AREA(nearby_peds[i].ID, pos.x, pos.y, pos.z, 300, 0)
					--natives.PED.SET_PED_KEEP_TASK(nearby_peds[i].ID, true)
					--natives.AI.TASK_COMBAT_PED(nearby_peds[i].ID, nearby_peds[math.random(#nearby_peds)].ID, 0, 16)
				end
			end
		end
		
		if dreanhsMod.noVehiclesEnabled then
			natives.VEHICLE.SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME(0)
		end
		
		self:Wait(0)
	end
end

function dreanhsMod.text(x, y, t, s, c)
	gui.DrawText(x, y, t, {
		TextScale = s,
		Color = Color(0,0,0)
	})
	gui.DrawText(x + (s/1000), y + (s/1000), t, {
		TextScale = s,
		Color = c
	})
end

function dreanhsMod.isControllerDown(b)
	if not dreanhsMod.drawMenu then
		if natives.CONTROLS.IS_CONTROL_JUST_PRESSED(2, b) then
			return true
		elseif natives.CONTROLS.IS_CONTROL_PRESSED(2, b) and dreanhsMod.controllerHold < 200 then 
			dreanhsMod.controllerHold = dreanhsMod.controllerHold + dreanhsMod.frameDiff
		elseif natives.CONTROLS.IS_CONTROL_PRESSED(2, b) and dreanhsMod.controllerHold >= 200 then
			dreanhsMod.controllerHold = dreanhsMod.controllerHold - dreanhsMod.frameDiff
			return true
		elseif natives.CONTROLS.IS_CONTROL_JUST_RELEASED(2, b) then
			dreanhsMod.controllerHold = 0
			return false
		end
	else
		if natives.CONTROLS.IS_DISABLED_CONTROL_JUST_PRESSED(2, b) then
			return true
		elseif natives.CONTROLS.IS_DISABLED_CONTROL_PRESSED(2, b) and dreanhsMod.controllerHold < 200 then 
			dreanhsMod.controllerHold = dreanhsMod.controllerHold + dreanhsMod.frameDiff
		elseif natives.CONTROLS.IS_DISABLED_CONTROL_PRESSED(2, b) and dreanhsMod.controllerHold >= 200 then
			dreanhsMod.controllerHold = dreanhsMod.controllerHold - dreanhsMod.frameDiff
			return true
		elseif natives.CONTROLS.IS_DISABLED_CONTROL_JUST_RELEASED(2, b) then
			dreanhsMod.controllerHold = 0
			return false
		end
	end
end

function dreanhsMod.updateMenu()
	if dreanhsMod.drawMenu then
		natives.CONTROLS.DISABLE_ALL_CONTROL_ACTIONS(1)
		
		for i = 1, #dreanhsMod.menu do
			if i == dreanhsMod.lastIndex then
				if dreanhsMod.menu[i]["state"] == "Off" then
					gui.DrawRect( dreanhsMod.menuX + 0.002, dreanhsMod.menuY + (i/20) - 0.01, 0.3, 0.055, Color ( 150, 20, 0, 100 ) )
				else
					gui.DrawRect( dreanhsMod.menuX + 0.002, dreanhsMod.menuY + (i/20) - 0.01, 0.3, 0.055, Color ( 20, 150, 0, 100 ) )
				end
				dreanhsMod.text(dreanhsMod.menuX, dreanhsMod.menuY + (i/20) - 0.008, " " .. dreanhsMod.menu[i]["text"] .. dreanhsMod.menu[i]["state"], dreanhsMod.menu[i]["textScale"] + 0.3, dreanhsMod.menu[i]["textColorSelected"])
			else
				if i ~= 1 then
					if dreanhsMod.menu[i]["state"] == "Off" then
						gui.DrawRect( dreanhsMod.menuX - 0.01, dreanhsMod.menuY + (i/20) - 0.002, 0.27, 0.04, Color ( 50, 20, 0, 100 ) )
					else
						gui.DrawRect( dreanhsMod.menuX - 0.01, dreanhsMod.menuY + (i/20) - 0.002, 0.27, 0.04, Color ( 20, 50, 0, 100 ) )
					end
					dreanhsMod.text(dreanhsMod.menuX, dreanhsMod.menuY + (i/20), dreanhsMod.menu[i]["text"] .. dreanhsMod.menu[i]["state"], dreanhsMod.menu[i]["textScale"], dreanhsMod.menu[i]["textColor"])
				else
					dreanhsMod.text(dreanhsMod.menuX, dreanhsMod.menuY + (i/20) - 0.01, dreanhsMod.menu[i]["text"] .. dreanhsMod.menu[i]["state"], dreanhsMod.menu[i]["textScale"], dreanhsMod.menu[i]["textColor"])
				end
			end
		end
		if IsKeyDown(KEY_NUMPAD8) or IsKeyDown(KEY_W) or IsKeyDown(KEY_UP) or dreanhsMod.isControllerDown(BUTTON_LUP) or dreanhsMod.isControllerDown(BUTTON_DUP) then
			dreanhsMod.lastIndex = dreanhsMod.lastIndex - 1
			if dreanhsMod.lastIndex < 2 then
				dreanhsMod.lastIndex = #dreanhsMod.menu
			end
			gui.BeepNavUpDown()
		end
		
		if IsKeyDown(KEY_NUMPAD2) or IsKeyDown(KEY_S) or IsKeyDown(KEY_DOWN) or dreanhsMod.isControllerDown(BUTTON_LDOWN) or dreanhsMod.isControllerDown(BUTTON_DDOWN) then
			dreanhsMod.lastIndex = dreanhsMod.lastIndex + 1
			if dreanhsMod.lastIndex > #dreanhsMod.menu then
				dreanhsMod.lastIndex = 2
			end
			gui.BeepNavUpDown()
		end
		
		if IsKeyDown(KEY_NUMPAD5) or IsKeyDown(KEY_E) or IsKeyDown(KEY_RETURN) or dreanhsMod.isControllerDown(BUTTON_A) then
			dreanhsMod.menu[dreanhsMod.lastIndex]["run"]()
			gui.BeepSelect()
		end
		
		if IsKeyDown(KEY_BACK) or IsKeyDown(KEY_ESCAPE) or dreanhsMod.isControllerDown(BUTTON_B) then
			dreanhsMod.drawMenu = false
			gui.BeepBack()
		end
	end
end

function dreanhsMod.createMenuObject(t)
	local id = #dreanhsMod.menu + 1
	dreanhsMod.menu[id] = {}
	dreanhsMod.menu[id]["text"] = t.text
	dreanhsMod.menu[id]["textScale"] = t.textScale or 0.5
	dreanhsMod.menu[id]["textColor"] = t.textColor or Color(255, 180, 0)
	dreanhsMod.menu[id]["textColorSelected"] = t.textColorSelected or Color(140, 255, 0)
	dreanhsMod.menu[id]["state"] = t.state or ""
	dreanhsMod.menu[id]["run"] = t.run or false
end


function dreanhsModThread:OnError()
	print("dreanhsMod Thread caused an error!")
	self:Reset()
end

dreanhsModThread:Register()

vehiclesList = {
	[1] = {[1] = VEHICLE_ADDER, [2] = "ADDER"},
	[2] = {[1] = VEHICLE_AIRBUS, [2] = "AIRBUS"},
	[3] = {[1] = VEHICLE_AIRTUG, [2] = "AIRTUG"},
	[4] = {[1] = VEHICLE_AKUMA, [2] = "AKUMA"},
	[5] = {[1] = VEHICLE_ALPHA, [2] = "ALPHA"},
	[6] = {[1] = VEHICLE_AMBULANCE, [2] = "AMBULANCE"},
	[7] = {[1] = VEHICLE_ANNIHILATOR, [2] = "ANNIHILATOR"},
	[8] = {[1] = VEHICLE_ARMYTANKER, [2] = "ARMYTANKER"},
	[9] = {[1] = VEHICLE_ARMYTRAILER, [2] = "ARMYTRAILER"},
	[10] = {[1] = VEHICLE_ARMYTRAILER2, [2] = "ARMYTRAILER2"},
	[11] = {[1] = VEHICLE_ASEA, [2] = "ASEA"},
	[12] = {[1] = VEHICLE_ASEA2, [2] = "ASEA2"},
	[13] = {[1] = VEHICLE_ASTEROPE, [2] = "ASTEROPE"},
	[14] = {[1] = VEHICLE_BAGGER, [2] = "BAGGER"},
	[15] = {[1] = VEHICLE_BALETRAILER, [2] = "BALETRAILER"},
	[16] = {[1] = VEHICLE_BALLER, [2] = "BALLER"},
	[17] = {[1] = VEHICLE_BALLER2, [2] = "BALLER2"},
	[18] = {[1] = VEHICLE_BANSHEE, [2] = "BANSHEE"},
	[19] = {[1] = VEHICLE_BARRACKS, [2] = "BARRACKS"},
	[20] = {[1] = VEHICLE_BARRACKS2, [2] = "BARRACKS2"},
	[21] = {[1] = VEHICLE_BARRACKS3, [2] = "BARRACKS3"},
	[22] = {[1] = VEHICLE_BATI, [2] = "BATI"},
	[23] = {[1] = VEHICLE_BATI2, [2] = "BATI2"},
	[24] = {[1] = VEHICLE_BENSON, [2] = "BENSON"},
	[25] = {[1] = VEHICLE_BESRA, [2] = "BESRA"},
	[26] = {[1] = VEHICLE_BFINJECTION, [2] = "BFINJECTION"},
	[27] = {[1] = VEHICLE_BIFF, [2] = "BIFF"},
	[28] = {[1] = VEHICLE_BIFTA, [2] = "BIFTA"},
	[29] = {[1] = VEHICLE_BISON, [2] = "BISON"},
	[30] = {[1] = VEHICLE_BISON2, [2] = "BISON2"},
	[31] = {[1] = VEHICLE_BISON3, [2] = "BISON3"},
	[32] = {[1] = VEHICLE_BJXL, [2] = "BJXL"},
	[33] = {[1] = VEHICLE_BLADE, [2] = "BLADE"},
	[34] = {[1] = VEHICLE_BLAZER, [2] = "BLAZER"},
	[35] = {[1] = VEHICLE_BLAZER2, [2] = "BLAZER2"},
	[36] = {[1] = VEHICLE_BLAZER3, [2] = "BLAZER3"},
	[37] = {[1] = VEHICLE_BLIMP, [2] = "BLIMP"},
	[38] = {[1] = VEHICLE_BLIMP2, [2] = "BLIMP2"},
	[39] = {[1] = VEHICLE_BLISTA, [2] = "BLISTA"},
	[40] = {[1] = VEHICLE_BLISTA2, [2] = "BLISTA2"},
	[41] = {[1] = VEHICLE_BLISTA3, [2] = "BLISTA3"},
	[42] = {[1] = VEHICLE_BMX, [2] = "BMX"},
	[43] = {[1] = VEHICLE_BOATTRAILER, [2] = "BOATTRAILER"},
	[44] = {[1] = VEHICLE_BOBCATXL, [2] = "BOBCATXL"},
	[45] = {[1] = VEHICLE_BODHI2, [2] = "BODHI2"},
	[46] = {[1] = VEHICLE_BOXVILLE, [2] = "BOXVILLE"},
	[47] = {[1] = VEHICLE_BOXVILLE2, [2] = "BOXVILLE2"},
	[48] = {[1] = VEHICLE_BOXVILLE3, [2] = "BOXVILLE3"},
	[49] = {[1] = VEHICLE_BOXVILLE4, [2] = "BOXVILLE4"},
	[50] = {[1] = VEHICLE_BTYPE, [2] = "BTYPE"},
	[51] = {[1] = VEHICLE_BUCCANEER, [2] = "BUCCANEER"},
	[52] = {[1] = VEHICLE_BUFFALO, [2] = "BUFFALO"},
	[53] = {[1] = VEHICLE_BUFFALO2, [2] = "BUFFALO2"},
	[54] = {[1] = VEHICLE_BUFFALO3, [2] = "BUFFALO3"},
	[55] = {[1] = VEHICLE_BULLDOZER, [2] = "BULLDOZER"},
	[56] = {[1] = VEHICLE_BULLET, [2] = "BULLET"},
	[57] = {[1] = VEHICLE_BURRITO, [2] = "BURRITO"},
	[58] = {[1] = VEHICLE_BURRITO2, [2] = "BURRITO2"},
	[59] = {[1] = VEHICLE_BURRITO3, [2] = "BURRITO3"},
	[60] = {[1] = VEHICLE_BURRITO4, [2] = "BURRITO4"},
	[61] = {[1] = VEHICLE_BURRITO5, [2] = "BURRITO5"},
	[62] = {[1] = VEHICLE_BUS, [2] = "BUS"},
	[63] = {[1] = VEHICLE_BUZZARD, [2] = "BUZZARD"},
	[64] = {[1] = VEHICLE_BUZZARD2, [2] = "BUZZARD2"},
	[65] = {[1] = VEHICLE_CABLECAR, [2] = "CABLECAR"},
	[66] = {[1] = VEHICLE_CADDY, [2] = "CADDY"},
	[67] = {[1] = VEHICLE_CADDY2, [2] = "CADDY2"},
	[68] = {[1] = VEHICLE_CAMPER, [2] = "CAMPER"},
	[69] = {[1] = VEHICLE_CARBONIZZARE, [2] = "CARBONIZZARE"},
	[70] = {[1] = VEHICLE_CARBONRS, [2] = "CARBONRS"},
	[71] = {[1] = VEHICLE_CARGOBOB, [2] = "CARGOBOB"},
	[72] = {[1] = VEHICLE_CARGOBOB2, [2] = "CARGOBOB2"},
	[73] = {[1] = VEHICLE_CARGOBOB3, [2] = "CARGOBOB3"},
	[74] = {[1] = VEHICLE_CARGOPLANE, [2] = "CARGOPLANE"},
	[75] = {[1] = VEHICLE_CASCO, [2] = "CASCO"},
	[76] = {[1] = VEHICLE_CAVALCADE, [2] = "CAVALCADE"},
	[77] = {[1] = VEHICLE_CAVALCADE2, [2] = "CAVALCADE2"},
	[78] = {[1] = VEHICLE_CHEETAH, [2] = "CHEETAH"},
	[79] = {[1] = VEHICLE_COACH, [2] = "COACH"},
	[80] = {[1] = VEHICLE_COGCABRIO, [2] = "COGCABRIO"},
	[81] = {[1] = VEHICLE_COMET2, [2] = "COMET2"},
	[82] = {[1] = VEHICLE_COQUETTE, [2] = "COQUETTE"},
	[83] = {[1] = VEHICLE_COQUETTE2, [2] = "COQUETTE2"},
	[84] = {[1] = VEHICLE_CRUISER, [2] = "CRUISER"},
	[85] = {[1] = VEHICLE_CRUSADER, [2] = "CRUSADER"},
	[86] = {[1] = VEHICLE_CUBAN800, [2] = "CUBAN800"},
	[87] = {[1] = VEHICLE_CUTTER, [2] = "CUTTER"},
	[88] = {[1] = VEHICLE_DAEMON, [2] = "DAEMON"},
	[89] = {[1] = VEHICLE_DILETTANTE, [2] = "DILETTANTE"},
	[90] = {[1] = VEHICLE_DILETTANTE2, [2] = "DILETTANTE2"},
	[91] = {[1] = VEHICLE_DINGHY, [2] = "DINGHY"},
	[92] = {[1] = VEHICLE_DINGHY2, [2] = "DINGHY2"},
	[93] = {[1] = VEHICLE_DINGHY3, [2] = "DINGHY3"},
	[94] = {[1] = VEHICLE_DLOADER, [2] = "DLOADER"},
	[95] = {[1] = VEHICLE_DOCKTRAILER, [2] = "DOCKTRAILER"},
	[96] = {[1] = VEHICLE_DOCKTUG, [2] = "DOCKTUG"},
	[97] = {[1] = VEHICLE_DODO, [2] = "DODO"},
	[98] = {[1] = VEHICLE_DOMINATOR, [2] = "DOMINATOR"},
	[99] = {[1] = VEHICLE_DOMINATOR2, [2] = "DOMINATOR2"},
	[100] = {[1] = VEHICLE_DOUBLE, [2] = "DOUBLE"},
	[101] = {[1] = VEHICLE_DUBSTA, [2] = "DUBSTA"},
	[102] = {[1] = VEHICLE_DUBSTA2, [2] = "DUBSTA2"},
	[103] = {[1] = VEHICLE_DUBSTA3, [2] = "DUBSTA3"},
	[104] = {[1] = VEHICLE_DUKES, [2] = "DUKES"},
	[105] = {[1] = VEHICLE_DUKES2, [2] = "DUKES2"},
	[106] = {[1] = VEHICLE_DUMP, [2] = "DUMP"},
	[107] = {[1] = VEHICLE_DUNE, [2] = "DUNE"},
	[108] = {[1] = VEHICLE_DUNE2, [2] = "DUNE2"},
	[109] = {[1] = VEHICLE_DUSTER, [2] = "DUSTER"},
	[110] = {[1] = VEHICLE_ELEGY2, [2] = "ELEGY2"},
	[111] = {[1] = VEHICLE_EMPEROR, [2] = "EMPEROR"},
	[112] = {[1] = VEHICLE_EMPEROR2, [2] = "EMPEROR2"},
	[113] = {[1] = VEHICLE_EMPEROR3, [2] = "EMPEROR3"},
	[114] = {[1] = VEHICLE_ENDURO, [2] = "ENDURO"},
	[115] = {[1] = VEHICLE_ENTITYXF, [2] = "ENTITYXF"},
	[116] = {[1] = VEHICLE_EXEMPLAR, [2] = "EXEMPLAR"},
	[117] = {[1] = VEHICLE_F620, [2] = "F620"},
	[118] = {[1] = VEHICLE_FAGGIO2, [2] = "FAGGIO2"},
	[119] = {[1] = VEHICLE_FBI, [2] = "FBI"},
	[120] = {[1] = VEHICLE_FBI2, [2] = "FBI2"},
	[121] = {[1] = VEHICLE_FELON, [2] = "FELON"},
	[122] = {[1] = VEHICLE_FELON2, [2] = "FELON2"},
	[123] = {[1] = VEHICLE_FELTZER2, [2] = "FELTZER2"},
	[124] = {[1] = VEHICLE_FIRETRUK, [2] = "FIRETRUK"},
	[125] = {[1] = VEHICLE_FIXTER, [2] = "FIXTER"},
	[126] = {[1] = VEHICLE_FLATBED, [2] = "FLATBED"},
	[127] = {[1] = VEHICLE_FORKLIFT, [2] = "FORKLIFT"},
	[128] = {[1] = VEHICLE_FQ2, [2] = "FQ2"},
	[129] = {[1] = VEHICLE_FREIGHT, [2] = "FREIGHT"},
	[130] = {[1] = VEHICLE_FREIGHTCAR, [2] = "FREIGHTCAR"},
	[131] = {[1] = VEHICLE_FREIGHTCONT1, [2] = "FREIGHTCONT1"},
	[132] = {[1] = VEHICLE_FREIGHTCONT2, [2] = "FREIGHTCONT2"},
	[133] = {[1] = VEHICLE_FREIGHTGRAIN, [2] = "FREIGHTGRAIN"},
	[134] = {[1] = VEHICLE_FREIGHTTRAILER, [2] = "FREIGHTTRAILER"},
	[135] = {[1] = VEHICLE_FROGGER, [2] = "FROGGER"},
	[136] = {[1] = VEHICLE_FROGGER2, [2] = "FROGGER2"},
	[137] = {[1] = VEHICLE_FUGITIVE, [2] = "FUGITIVE"},
	[138] = {[1] = VEHICLE_FUROREGT, [2] = "FUROREGT"},
	[139] = {[1] = VEHICLE_FUSILADE, [2] = "FUSILADE"},
	[140] = {[1] = VEHICLE_FUTO, [2] = "FUTO"},
	[141] = {[1] = VEHICLE_GAUNTLET, [2] = "GAUNTLET"},
	[142] = {[1] = VEHICLE_GAUNTLET2, [2] = "GAUNTLET2"},
	[143] = {[1] = VEHICLE_GBURRITO, [2] = "GBURRITO"},
	[144] = {[1] = VEHICLE_GBURRITO2, [2] = "GBURRITO2"},
	[145] = {[1] = VEHICLE_GLENDALE, [2] = "GLENDALE"},
	[146] = {[1] = VEHICLE_GRAINTRAILER, [2] = "GRAINTRAILER"},
	[147] = {[1] = VEHICLE_GRANGER, [2] = "GRANGER"},
	[148] = {[1] = VEHICLE_GRESLEY, [2] = "GRESLEY"},
	[149] = {[1] = VEHICLE_GUARDIAN, [2] = "GUARDIAN"},
	[150] = {[1] = VEHICLE_HABANERO, [2] = "HABANERO"},
	[151] = {[1] = VEHICLE_HAKUCHOU, [2] = "HAKUCHOU"},
	[152] = {[1] = VEHICLE_HANDLER, [2] = "HANDLER"},
	[153] = {[1] = VEHICLE_HAULER, [2] = "HAULER"},
	[154] = {[1] = VEHICLE_HEXER, [2] = "HEXER"},
	[155] = {[1] = VEHICLE_HOTKNIFE, [2] = "HOTKNIFE"},
	[156] = {[1] = VEHICLE_HUNTLEY, [2] = "HUNTLEY"},
	[157] = {[1] = VEHICLE_HYDRA, [2] = "HYDRA"},
	[158] = {[1] = VEHICLE_INFERNUS, [2] = "INFERNUS"},
	[159] = {[1] = VEHICLE_INGOT, [2] = "INGOT"},
	[160] = {[1] = VEHICLE_INNOVAT, [2] = "INNOVAT"},
	[161] = {[1] = VEHICLE_INSURGENT, [2] = "INSURGENT"},
	[162] = {[1] = VEHICLE_INSURGENT2, [2] = "INSURGENT2"},
	[163] = {[1] = VEHICLE_INTRUDER, [2] = "INTRUDER"},
	[164] = {[1] = VEHICLE_ISSI2, [2] = "ISSI2"},
	[165] = {[1] = VEHICLE_JACKAL, [2] = "JACKAL"},
	[166] = {[1] = VEHICLE_JB700, [2] = "JB700"},
	[167] = {[1] = VEHICLE_JESTER, [2] = "JESTER"},
	[168] = {[1] = VEHICLE_JESTER2, [2] = "JESTER2"},
	[169] = {[1] = VEHICLE_JET, [2] = "JET"},
	[170] = {[1] = VEHICLE_JETMAX, [2] = "JETMAX"},
	[171] = {[1] = VEHICLE_JOURNEY, [2] = "JOURNEY"},
	[172] = {[1] = VEHICLE_KALAHARI, [2] = "KALAHARI"},
	[173] = {[1] = VEHICLE_KHAMELION, [2] = "KHAMELION"},
	[174] = {[1] = VEHICLE_KURUMA, [2] = "KURUMA"},
	[175] = {[1] = VEHICLE_KURUMA2, [2] = "KURUMA2"},
	[176] = {[1] = VEHICLE_LANDSTALKER, [2] = "LANDSTALKER"},
	[177] = {[1] = VEHICLE_LAZER, [2] = "LAZER"},
	[178] = {[1] = VEHICLE_LECTRO, [2] = "LECTRO"},
	[179] = {[1] = VEHICLE_LGUARD, [2] = "LGUARD"},
	[180] = {[1] = VEHICLE_LUXOR, [2] = "LUXOR"},
	[181] = {[1] = VEHICLE_MAMMATUS, [2] = "MAMMATUS"},
	[182] = {[1] = VEHICLE_MANANA, [2] = "MANANA"},
	[183] = {[1] = VEHICLE_MARQUIS, [2] = "MARQUIS"},
	[184] = {[1] = VEHICLE_MARSHALL, [2] = "MARSHALL"},
	[185] = {[1] = VEHICLE_MASSACRO, [2] = "MASSACRO"},
	[186] = {[1] = VEHICLE_MASSACRO2, [2] = "MASSACRO"},
	[187] = {[1] = VEHICLE_MAVERICK, [2] = "MAVERICK"},
	[188] = {[1] = VEHICLE_MESA, [2] = "MESA"},
	[189] = {[1] = VEHICLE_MESA2, [2] = "MESA2"},
	[190] = {[1] = VEHICLE_MESA3, [2] = "MESA3"},
	[191] = {[1] = VEHICLE_METROTRAIN, [2] = "METROTRAIN"},
	[192] = {[1] = VEHICLE_MILJET, [2] = "MILJET"},
	[193] = {[1] = VEHICLE_MINIVAN, [2] = "MINIVAN"},
	[194] = {[1] = VEHICLE_MIXER, [2] = "MIXER"},
	[195] = {[1] = VEHICLE_MIXER2, [2] = "MIXER2"},
	[196] = {[1] = VEHICLE_MONROE, [2] = "MONROE"},
	[197] = {[1] = VEHICLE_MONSTER, [2] = "MONSTER"},
	[198] = {[1] = VEHICLE_MOWER, [2] = "MOWER"},
	[199] = {[1] = VEHICLE_MULE, [2] = "MULE"},
	[200] = {[1] = VEHICLE_MULE2, [2] = "MULE2"},
	[201] = {[1] = VEHICLE_MULE3, [2] = "MULE3"},
	[202] = {[1] = VEHICLE_NEMESIS, [2] = "NEMESIS"},
	[203] = {[1] = VEHICLE_NINEF, [2] = "NINEF"},
	[204] = {[1] = VEHICLE_NINEF2, [2] = "NINEF2"},
	[205] = {[1] = VEHICLE_ORACLE, [2] = "ORACLE"},
	[206] = {[1] = VEHICLE_ORACLE2, [2] = "ORACLE2"},
	[207] = {[1] = VEHICLE_PACKER, [2] = "PACKER"},
	[208] = {[1] = VEHICLE_PANTO, [2] = "PANTO"},
	[209] = {[1] = VEHICLE_PARADISE, [2] = "PARADISE"},
	[210] = {[1] = VEHICLE_PATRIOT, [2] = "PATRIOT"},
	[211] = {[1] = VEHICLE_PBUS, [2] = "PBUS"},
	[212] = {[1] = VEHICLE_PCJ, [2] = "PCJ"},
	[213] = {[1] = VEHICLE_PENUMBRA, [2] = "PENUMBRA"},
	[214] = {[1] = VEHICLE_PEYOTE, [2] = "PEYOTE"},
	[215] = {[1] = VEHICLE_PHANTOM, [2] = "PHANTOM"},
	[216] = {[1] = VEHICLE_PHOENIX, [2] = "PHOENIX"},
	[217] = {[1] = VEHICLE_PICADOR, [2] = "PICADOR"},
	[218] = {[1] = VEHICLE_PIGALL, [2] = "PIGALL"},
	[219] = {[1] = VEHICLE_POLICE, [2] = "POLICE"},
	[220] = {[1] = VEHICLE_POLICE2, [2] = "POLICE2"},
	[221] = {[1] = VEHICLE_POLICE3, [2] = "POLICE3"},
	[222] = {[1] = VEHICLE_POLICE4, [2] = "POLICE4"},
	[223] = {[1] = VEHICLE_POLICEB, [2] = "POLICEB"},
	[224] = {[1] = VEHICLE_POLICEOLD1, [2] = "POLICEOLD1"},
	[225] = {[1] = VEHICLE_POLICEOLD2, [2] = "POLICEOLD2"},
	[226] = {[1] = VEHICLE_POLICET, [2] = "POLICET"},
	[227] = {[1] = VEHICLE_POLMAV, [2] = "POLMAV"},
	[228] = {[1] = VEHICLE_PONY, [2] = "PONY"},
	[229] = {[1] = VEHICLE_PONY2, [2] = "PONY2"},
	[230] = {[1] = VEHICLE_POUNDER, [2] = "POUNDER"},
	[231] = {[1] = VEHICLE_PRAIRIE, [2] = "PRAIRIE"},
	[232] = {[1] = VEHICLE_PRANGER, [2] = "PRANGER"},
	[233] = {[1] = VEHICLE_PREDATOR, [2] = "PREDATOR"},
	[234] = {[1] = VEHICLE_PREMIER, [2] = "PREMIER"},
	[235] = {[1] = VEHICLE_PRIMO, [2] = "PRIMO"},
	[236] = {[1] = VEHICLE_PROPTRAILER, [2] = "PROPTRAILER"},
	[237] = {[1] = VEHICLE_RADI, [2] = "RADI"},
	[238] = {[1] = VEHICLE_RAKETRAILER, [2] = "RAKETRAILER"},
	[239] = {[1] = VEHICLE_RANCHERXL, [2] = "RANCHERXL"},
	[240] = {[1] = VEHICLE_RANCHERXL2, [2] = "RANCHERXL2"},
	[241] = {[1] = VEHICLE_RAPIDGT, [2] = "RAPIDGT"},
	[242] = {[1] = VEHICLE_RAPIDGT2, [2] = "RAPIDGT2"},
	[243] = {[1] = VEHICLE_RATLOADER, [2] = "RATLOADER"},
	[244] = {[1] = VEHICLE_RATLOADER2, [2] = "RATLOADER2"},
	[245] = {[1] = VEHICLE_REBEL, [2] = "REBEL"},
	[246] = {[1] = VEHICLE_REBEL2, [2] = "REBEL2"},
	[247] = {[1] = VEHICLE_REGINA, [2] = "REGINA"},
	[248] = {[1] = VEHICLE_RENTALBUS, [2] = "RENTALBUS"},
	[249] = {[1] = VEHICLE_RHAPSODY, [2] = "RHAPSODY"},
	[250] = {[1] = VEHICLE_RHINO, [2] = "RHINO"},
	[251] = {[1] = VEHICLE_RIOT, [2] = "RIOT"},
	[252] = {[1] = VEHICLE_RIPLEY, [2] = "RIPLEY"},
	[253] = {[1] = VEHICLE_ROCOTO, [2] = "ROCOTO"},
	[254] = {[1] = VEHICLE_ROMERO, [2] = "ROMERO"},
	[255] = {[1] = VEHICLE_RUBBLE, [2] = "RUBBLE"},
	[256] = {[1] = VEHICLE_RUFFIAN, [2] = "RUFFIAN"},
	[257] = {[1] = VEHICLE_RUINER, [2] = "RUINER"},
	[258] = {[1] = VEHICLE_RUMPO, [2] = "RUMPO"},
	[259] = {[1] = VEHICLE_RUMPO2, [2] = "RUMPO2"},
	[260] = {[1] = VEHICLE_SABREGT, [2] = "SABREGT"},
	[261] = {[1] = VEHICLE_SADLER, [2] = "SADLER"},
	[262] = {[1] = VEHICLE_SADLER2, [2] = "SADLER2"},
	[263] = {[1] = VEHICLE_SANCHEZ, [2] = "SANCHEZ"},
	[264] = {[1] = VEHICLE_SANCHEZ2, [2] = "SANCHEZ2"},
	[265] = {[1] = VEHICLE_SANDKING, [2] = "SANDKING"},
	[266] = {[1] = VEHICLE_SANDKING2, [2] = "SANDKING2"},
	[267] = {[1] = VEHICLE_SAVAGE, [2] = "SAVAGE"},
	[268] = {[1] = VEHICLE_SCHAFTER2, [2] = "SCHAFTER2"},
	[269] = {[1] = VEHICLE_SCHWARZER, [2] = "SCHWARZER"},
	[270] = {[1] = VEHICLE_SCORCHER, [2] = "SCORCHER"},
	[271] = {[1] = VEHICLE_SCRAP, [2] = "SCRAP"},
	[272] = {[1] = VEHICLE_SEASHARK, [2] = "SEASHARK"},
	[273] = {[1] = VEHICLE_SEASHARK2, [2] = "SEASHARK2"},
	[274] = {[1] = VEHICLE_SEMINOLE, [2] = "SEMINOLE"},
	[275] = {[1] = VEHICLE_SENTINEL, [2] = "SENTINEL"},
	[276] = {[1] = VEHICLE_SENTINEL2, [2] = "SENTINEL2"},
	[277] = {[1] = VEHICLE_SERRANO, [2] = "SERRANO"},
	[278] = {[1] = VEHICLE_SHAMAL, [2] = "SHAMAL"},
	[279] = {[1] = VEHICLE_SHERIFF, [2] = "SHERIFF"},
	[280] = {[1] = VEHICLE_SHERIFF2, [2] = "SHERIFF2"},
	[281] = {[1] = VEHICLE_SKYLIFT, [2] = "SKYLIFT"},
	[282] = {[1] = VEHICLE_SLAMVAN, [2] = "SLAMVAN"},
	[283] = {[1] = VEHICLE_SLAMVAN2, [2] = "SLAMVAN2"},
	[284] = {[1] = VEHICLE_SOVEREIGN, [2] = "SOVEREIGN"},
	[285] = {[1] = VEHICLE_SPEEDER, [2] = "SPEEDER"},
	[286] = {[1] = VEHICLE_SPEEDO, [2] = "SPEEDO"},
	[287] = {[1] = VEHICLE_SPEEDO2, [2] = "SPEEDO2"},
	[288] = {[1] = VEHICLE_SQUALO, [2] = "SQUALO"},
	[289] = {[1] = VEHICLE_STALION, [2] = "STALION"},
	[290] = {[1] = VEHICLE_STALION2, [2] = "STALION2"},
	[291] = {[1] = VEHICLE_STANIER, [2] = "STANIER"},
	[292] = {[1] = VEHICLE_STINGER, [2] = "STINGER"},
	[293] = {[1] = VEHICLE_STINGERGT, [2] = "STINGERGT"},
	[294] = {[1] = VEHICLE_STOCKADE, [2] = "STOCKADE"},
	[295] = {[1] = VEHICLE_STOCKADE3, [2] = "STOCKADE3"},
	[296] = {[1] = VEHICLE_STRATUM, [2] = "STRATUM"},
	[297] = {[1] = VEHICLE_STRETCH, [2] = "STRETCH"},
	[298] = {[1] = VEHICLE_STUNT, [2] = "STUNT"},
	[299] = {[1] = VEHICLE_SUBMERSIBLE, [2] = "SUBMERSIBLE"},
	[300] = {[1] = VEHICLE_SUBMERSIBLE2, [2] = "SUBMERSIBLE2"},
	[301] = {[1] = VEHICLE_SULTAN, [2] = "SULTAN"},
	[302] = {[1] = VEHICLE_SUNTRAP, [2] = "SUNTRAP"},
	[303] = {[1] = VEHICLE_SUPERD, [2] = "SUPERD"},
	[304] = {[1] = VEHICLE_SURANO, [2] = "SURANO"},
	[305] = {[1] = VEHICLE_SURFER, [2] = "SURFER"},
	[306] = {[1] = VEHICLE_SURFER2, [2] = "SURFER2"},
	[307] = {[1] = VEHICLE_SURGE, [2] = "SURGE"},
	[308] = {[1] = VEHICLE_SWIFT, [2] = "SWIFT"},
	[309] = {[1] = VEHICLE_TACO, [2] = "TACO"},
	[310] = {[1] = VEHICLE_TAILGATER, [2] = "TAILGATER"},
	[311] = {[1] = VEHICLE_TANKER, [2] = "TANKER"},
	[312] = {[1] = VEHICLE_TANKER2, [2] = "TANKER2"},
	[313] = {[1] = VEHICLE_TANKERCAR, [2] = "TANKERCAR"},
	[314] = {[1] = VEHICLE_TAXI, [2] = "TAXI"},
	[315] = {[1] = VEHICLE_TECHNICAL, [2] = "TECHNICAL"},
	[316] = {[1] = VEHICLE_THRUST, [2] = "THRUST"},
	[317] = {[1] = VEHICLE_TIPTRUCK, [2] = "TIPTRUCK"},
	[318] = {[1] = VEHICLE_TIPTRUCK2, [2] = "TIPTRUCK2"},
	[319] = {[1] = VEHICLE_TITAN, [2] = "TITAN"},
	[320] = {[1] = VEHICLE_TORNADO, [2] = "TORNADO"},
	[321] = {[1] = VEHICLE_TORNADO2, [2] = "TORNADO2"},
	[322] = {[1] = VEHICLE_TORNADO3, [2] = "TORNADO3"},
	[323] = {[1] = VEHICLE_TORNADO4, [2] = "TORNADO4"},
	[324] = {[1] = VEHICLE_TOURBUS, [2] = "TOURBUS"},
	[325] = {[1] = VEHICLE_TOWTRUCK, [2] = "TOWTRUCK"},
	[326] = {[1] = VEHICLE_TOWTRUCK2, [2] = "TOWTRUCK2"},
	[327] = {[1] = VEHICLE_TR2, [2] = "TR2"},
	[328] = {[1] = VEHICLE_TR3, [2] = "TR3"},
	[329] = {[1] = VEHICLE_TR4, [2] = "TR4"},
	[330] = {[1] = VEHICLE_TRACTOR, [2] = "TRACTOR"},
	[331] = {[1] = VEHICLE_TRACTOR2, [2] = "TRACTOR2"},
	[332] = {[1] = VEHICLE_TRACTOR3, [2] = "TRACTOR3"},
	[333] = {[1] = VEHICLE_TRAILERLOGS, [2] = "TRAILERLOGS"},
	[334] = {[1] = VEHICLE_TRAILERS, [2] = "TRAILERS"},
	[335] = {[1] = VEHICLE_TRAILERS2, [2] = "TRAILERS2"},
	[336] = {[1] = VEHICLE_TRAILERS3, [2] = "TRAILERS3"},
	[337] = {[1] = VEHICLE_TRAILERSMALL, [2] = "TRAILERSMALL"},
	[338] = {[1] = VEHICLE_TRASH, [2] = "TRASH"},
	[339] = {[1] = VEHICLE_TRASH2, [2] = "TRASH2"},
	[340] = {[1] = VEHICLE_TRFLAT, [2] = "TRFLAT"},
	[341] = {[1] = VEHICLE_TRIBIKE, [2] = "TRIBIKE"},
	[342] = {[1] = VEHICLE_TRIBIKE2, [2] = "TRIBIKE2"},
	[343] = {[1] = VEHICLE_TRIBIKE3, [2] = "TRIBIKE3"},
	[344] = {[1] = VEHICLE_TROPIC, [2] = "TROPIC"},
	[345] = {[1] = VEHICLE_TURISMOR, [2] = "TURISMOR"},
	[346] = {[1] = VEHICLE_TVTRAILER, [2] = "TVTRAILER"},
	[347] = {[1] = VEHICLE_UTILLITRUCK, [2] = "UTILLITRUCK"},
	[348] = {[1] = VEHICLE_UTILLITRUCK2, [2] = "UTILLITRUCK2"},
	[349] = {[1] = VEHICLE_UTILLITRUCK3, [2] = "UTILLITRUCK3"},
	[350] = {[1] = VEHICLE_VACCA, [2] = "VACCA"},
	[351] = {[1] = VEHICLE_VADER, [2] = "VADER"},
	[352] = {[1] = VEHICLE_VALKYRIE, [2] = "VALKYRIE"},
	[353] = {[1] = VEHICLE_VELUM, [2] = "VELUM"},
	[354] = {[1] = VEHICLE_VELUM2, [2] = "VELUM2"},
	[355] = {[1] = VEHICLE_VESTRA, [2] = "VESTRA"},
	[356] = {[1] = VEHICLE_VIGERO, [2] = "VIGERO"},
	[357] = {[1] = VEHICLE_VOLTIC, [2] = "VOLTIC"},
	[358] = {[1] = VEHICLE_VOODOO2, [2] = "VOODOO2"},
	[359] = {[1] = VEHICLE_WARRENER, [2] = "WARRENER"},
	[360] = {[1] = VEHICLE_WASHINGTON, [2] = "WASHINGTON"},
	[361] = {[1] = VEHICLE_YOUGA, [2] = "YOUGA"},
	[362] = {[1] = VEHICLE_ZENTORNO, [2] = "ZENTORNO"},
	[363] = {[1] = VEHICLE_ZION, [2] = "ZION"},
	[364] = {[1] = VEHICLE_ZION2, [2] = "ZION2"},
	[365] = {[1] = VEHICLE_ZTYPE, [2] = "ZTYPE"}
}

weaponsList = {
	[1] = {["weapon"] = WEAPON_UNARMED, ["hash"] = 0xA2719263},
	[2] = {["weapon"] = WEAPON_ANIMAL, ["hash"] = 0xF9FBAEBE},
	[3] = {["weapon"] = WEAPON_COUGAR, ["hash"] = 0x08D4BE52},
	[4] = {["weapon"] = WEAPON_KNIFE, ["hash"] = 0x99B507EA},
	[5] = {["weapon"] = WEAPON_NIGHTSTICK, ["hash"] = 0x678B81B1},
	[6] = {["weapon"] = WEAPON_HAMMER, ["hash"] = 0x4E875F73},
	[7] = {["weapon"] = WEAPON_BAT, ["hash"] = 0x958A4A8F},
	[8] = {["weapon"] = WEAPON_GOLFCLUB, ["hash"] = 0x440E4788},
	[9] = {["weapon"] = WEAPON_CROWBAR, ["hash"] = 0x84BD7BFD},
	[10] = {["weapon"] = WEAPON_PISTOL, ["hash"] = 0x1B06D571},
	[11] = {["weapon"] = WEAPON_COMBATPISTOL, ["hash"] = 0x5EF9FEC4},
	[12] = {["weapon"] = WEAPON_APPISTOL, ["hash"] = 0x22D8FE39},
	[13] = {["weapon"] = WEAPON_PISTOL50, ["hash"] = 0x99AEEB3B},
	[14] = {["weapon"] = WEAPON_MICROSMG, ["hash"] = 0x13532244},
	[15] = {["weapon"] = WEAPON_SMG, ["hash"] = 0x2BE6766B},
	[16] = {["weapon"] = WEAPON_ASSAULTSMG, ["hash"] = 0xEFE7E2DF},
	[17] = {["weapon"] = WEAPON_ASSAULTRIFLE, ["hash"] = 0xBFEFFF6D},
	[18] = {["weapon"] = WEAPON_CARBINERIFLE, ["hash"] = 0x83BF0278},
	[19] = {["weapon"] = WEAPON_ADVANCEDRIFLE, ["hash"] = 0xAF113F99},
	[20] = {["weapon"] = WEAPON_MG, ["hash"] = 0x9D07F764},
	[21] = {["weapon"] = WEAPON_COMBATMG, ["hash"] = 0x7FD62962},
	[22] = {["weapon"] = WEAPON_PUMPSHOTGUN, ["hash"] = 0x1D073A89},
	[23] = {["weapon"] = WEAPON_SAWNOFFSHOTGUN, ["hash"] = 0x7846A318},
	[24] = {["weapon"] = WEAPON_ASSAULTSHOTGUN, ["hash"] = 0xE284C527},
	[25] = {["weapon"] = WEAPON_BULLPUPSHOTGUN, ["hash"] = 0x9D61E50F},
	[26] = {["weapon"] = WEAPON_STUNGUN, ["hash"] = 0x3656C8C1},
	[27] = {["weapon"] = WEAPON_SNIPERRIFLE, ["hash"] = 0x05FC3C11},
	[28] = {["weapon"] = WEAPON_HEAVYSNIPER, ["hash"] = 0x0C472FE2},
	[29] = {["weapon"] = WEAPON_REMOTESNIPER, ["hash"] = 0x33058E22},
	[30] = {["weapon"] = WEAPON_GRENADELAUNCHER, ["hash"] = 0xA284510B},
	[31] = {["weapon"] = WEAPON_GRENADELAUNCHER_SMOKE, ["hash"] = 0x4DD2DC56},
	[32] = {["weapon"] = WEAPON_RPG, ["hash"] = 0xB1CA77B1},
	[33] = {["weapon"] = WEAPON_PASSENGER_ROCKET, ["hash"] = 0x166218FF},
	[34] = {["weapon"] = WEAPON_AIRSTRIKE_ROCKET, ["hash"] = 0x13579279},
	[35] = {["weapon"] = WEAPON_STINGER, ["hash"] = 0x687652CE},
	[36] = {["weapon"] = WEAPON_MINIGUN, ["hash"] = 0x42BF8A85},
	[37] = {["weapon"] = WEAPON_GRENADE, ["hash"] = 0x93E220BD},
	[38] = {["weapon"] = WEAPON_STICKYBOMB, ["hash"] = 0x2C3731D9},
	[39] = {["weapon"] = WEAPON_SMOKEGRENADE, ["hash"] = 0xFDBC8A50},
	[40] = {["weapon"] = WEAPON_BZGAS, ["hash"] = 0xA0973D5E},
	[41] = {["weapon"] = WEAPON_MOLOTOV, ["hash"] = 0x24B17070}
}

--XBOX CONTROLLER BUTTONS
BUTTON_A = 18 
BUTTON_B = 45
BUTTON_X = 22
BUTTON_Y = 23
BUTTON_LB = 37
BUTTON_RB = 44
BUTTON_L2 = 10
BUTTON_R2 = 11
BUTTON_L3 = 28
BUTTON_R3 = 29
BUTTON_SELECT = 0
--BUTTON_START = ?
--D-Pad:
BUTTON_DLEFT = 15
BUTTON_DRIGHT = 74
BUTTON_DUP = 27
BUTTON_DDOWN = 19
--Left-Stick:
BUTTON_LLEFT = 34
BUTTON_LRIGHT = 9
BUTTON_LUP = 32
BUTTON_LDOWN = 8
--Right-Stick:
BUTTON_RLEFT = 5
BUTTON_RRIGHT = 1
BUTTON_RUP = 3
BUTTON_RDOWN = 2
