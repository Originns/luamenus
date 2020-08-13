WarMenu = { }

WarMenu.debug = false

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = 0
	result.g = 242
	result.b = 255
	
	return result
end

TriggerEvent('HCheat:TempDisableDetection', true)

local menus = { }
local keys = { up = 172, down = 173, left = 174, right = 175, select = 176, back = 177 }
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local menuWidth = 0.24
local titleHeight = 0.11
local titleYOffset = 0.045
local titleScale = 1.0

local buttonHeight = 0.050
local buttonFont = 6
local buttonScale = 0.390
local buttonTextXOffset = 0.008
local buttonTextYOffset = 0.001


local function debugPrint(text)
	if WarMenu.debug then
		Citizen.Trace('[WarMenu] '..tostring(text))
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
			drawRect(x, y, 0, titleHeight, menus[currentMenu].titleBackgroundColor)
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
		drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, 0.4, false)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(tostring(menus[currentMenu].currentOption)..' / '..tostring(optionCount), menus[currentMenu].x + menuWidth, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, 0.4, false, false, true)
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
		drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, 0.5, false, shadow)

		if subText then
			drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, 0.5, false, shadow, true)
		end
	end
end


function WarMenu.CreateMenu(id, title)
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

	menus[id].titleFont = 4
	menus[id].titleColor = { r = 255, g = 251, b = 0, a = 255 }
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local ra = RGBRainbow(1.0)
			menus[id].titleBackgroundColor = { r = ra.r, g = ra.g, b = ra.b, a = 255 }
			menus[id].menuFocusBackgroundColor = { r = ra.r, g = ra.g, b = ra.b, a = 100 }
		end
	end)
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
	menus[id].menuSubTextColor = { r = 189, g = 189, b = 189, a = 255 }
	menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].menuFocusBackgroundColor = { r = 76, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = { r = 255, g = 203, b = 219, a = 240 }

	menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 130 }

	menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

	debugPrint(tostring(id)..' menu created')
end


function WarMenu.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		WarMenu.CreateMenu(id, menus[parent].title)

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


function WarMenu.CurrentMenu()
	return currentMenu
end


function WarMenu.OpenMenu(id)
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


function WarMenu.IsMenuOpened(id)
	return isMenuVisible(id)
end


function WarMenu.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then return true end
	end

	return false
end


function WarMenu.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end


function WarMenu.CloseMenu()
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


function WarMenu.Button(text, subText)
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


function WarMenu.MenuButton(text, id)
	if menus[id] then
		if WarMenu.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
	end

	return false
end


function WarMenu.CheckBox(text, bool, callback)
	local checked = '~r~~h~Off'
	if bool then
		checked = '~g~~h~On'
	end

	if WarMenu.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text)..' checkbox changed to '..tostring(bool))
		callback(bool)

		return true
	end

	return false
end


function WarMenu.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '← '..tostring(selectedItem)..' →'
	end

	if WarMenu.Button(text, selectedItem) then
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


function WarMenu.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			WarMenu.CloseMenu()
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
					WarMenu.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end


function WarMenu.SetMenuWidth(id, width)
	setMenuProperty(id, 'width', width)
end


function WarMenu.SetMenuX(id, x)
	setMenuProperty(id, 'x', x)
end


function WarMenu.SetMenuY(id, y)
	setMenuProperty(id, 'y', y)
end


function WarMenu.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end


function WarMenu.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
end
 
 
function WarMenu.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
end


function WarMenu.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
end


function WarMenu.SetSubTitle(id, text)
	setMenuProperty(id, 'subTitle', string.upper(text))
end


function WarMenu.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
end


function WarMenu.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
end

function WarMenu.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
end

function WarMenu.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
end


function WarMenu.SetMenuButtonPressedSound(id, name, set)
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
		drawNotification("~r~Pon el punto en el mapa primero")
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
				drawNotification("~g~Teletransportado!")
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
		print('Osquerna Menu : ON')
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

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	if not HideHud then
		SetTextFont(4)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x - width/2, y - height/2 + 0.005)
	end
end

function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
	if not HideHud then
		SetTextFont(6)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x - width/2, y - height/2 + 0.005)
	end
end

Citizen.CreateThread(function()
	local currentPlayer = PlayerId()

	while Enabled do
		Citizen.Wait(0)

		local players = GetPlayers()
		
		SetPlayerInvincible(PlayerId(), Godmode)
		SetEntityInvincible(PlayerPedId(), Godmode)
		if esp then
			for player = 0, 64 do
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

		if Ragedoll then
			local playerPed = GetPlayerPed(-1)
			local playerID = PlayerId()
			if playerPed then
				SetPedToRagdoll(playerPed, 1000, 1000, 0, 0, 0, 0)
			end
		end

		if RainbowVeh then
			local ra = RGBRainbow(1.0)
			SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
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

		-- New HUD display

	if DisplayInfo then

		local x = 1.000
		local y = 1.000
		local border_r = 255
		local border_g = 255
		local border_b = 255
		local border_a = 100
		local dir_r = 255
		local dir_g = 255
		local dir_b = 255
		local dir_a = 255
		local curr_street_r = 240
		local curr_street_g = 200
		local curr_street_b = 80
		local curr_street_a = 255
		local str_around_r = 255
		local str_around_g = 255 
		local str_around_b = 255
		local str_around_a = 255
		local town_r = 255
		local town_g = 255
		local town_b = 255
		local town_a = 255
		
		local checkForVehicle = true


		local ped = GetPlayerPed()
		local vehicle = GetVehiclePedIsIn(ped, false)
		local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 
		local pos = GetEntityCoords(PlayerPedId())
			local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))
			for k,v in pairs(directions)do
				direction = GetEntityHeading(PlayerPedId())
				if(math.abs(direction - k) < 22.5)then
					direction = v
					break
				end
			end
			
			if GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z) then
				if GetStreetNameFromHashKey(var1) then
					if direction == 'N' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.306, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'NE' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
						drawTxt2(x-0.277, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1),curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'E' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.309, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
						drawTxt2(x-0.288, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'SE' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.275, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'S' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.307, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'SW' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.292, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.270, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'W' then 
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.303, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then 
							drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else
							drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.280, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					elseif direction == 'NW' then
							drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.290, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
							drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
						if GetStreetNameFromHashKey(var2) == "" then
							drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, GetStreetNameFromHashKey(var2) .. ", " .. GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z)), str_around_r, str_around_g, str_around_b, str_around_a)
						end 
							drawTxt2(x-0.266, y+0.42, 1.0,1.0,0.55, GetStreetNameFromHashKey(var1), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
					end
				end
			end
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
			for id = 0, 128 do
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
			for id = 0, 128 do
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
			for player = 0, 128 do
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

local therm = false
local bTherm = false;



Citizen.CreateThread(function()
	FreezeEntityPosition(entity, false)
	local currentItemIndex = 1
	local selectedItemIndex = 1
		
	local IsESXPresent = RunningESX()
	local player = GetPlayerName(PlayerId())

	WarMenu.CreateMenu('MainMenu', '~w~Osquerna')
	WarMenu.SetSubTitle('MainMenu', 'Bienvenido al menu traducido por Osquerna '..player..'.')
	WarMenu.CreateSubMenu('SelfMenu', 'MainMenu', 'Self Options ~b~>~s~')
    WarMenu.CreateSubMenu('VehMenu', 'MainMenu', 'Vehicle Options ~b~>~s~')
-- Vehicule mod
	WarMenu.CreateSubMenu('VehMenu2', 'MainMenu', 'Vehicle Custom ~b~>~s~')
	WarMenu.CreateSubMenu('Transmission', 'VehMenu2', 'Engine Custom ~b~>~s~')
	WarMenu.CreateSubMenu('Turbo', 'VehMenu2', 'Engine Custom ~b~>~s~')
-- Vehicule boost
	WarMenu.CreateSubMenu('BoostMenu', 'MainMenu', 'Vehicle Boost ~b~>~s~')
	WarMenu.CreateSubMenu('PowerBoostMenu', 'BoostMenu', 'Power Boost ~b~>~s~')
	WarMenu.CreateSubMenu('TorqueBoostMenu', 'BoostMenu', 'Torque Boost ~b~>~s~')
-- Other	
	WarMenu.CreateSubMenu('ServerMenu', 'MainMenu', 'Server Specific Options ~b~>~s~')
	WarMenu.CreateSubMenu('PlayerMenu', 'MainMenu', 'Player Options ~b~>~s~')
	WarMenu.CreateSubMenu('OnlinePlayerMenu', 'PlayerMenu', 'Online Player Menu ~b~>~s~')
	WarMenu.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options ~b~>~s~')
	WarMenu.CreateSubMenu('SingleWepPlayer', 'OnlinePlayerMenu', 'Single Weapon Menu ~b~>~s~')
	WarMenu.CreateSubMenu('WepMenu', 'MainMenu', 'Weapon Menu ~b~>~s~')
	WarMenu.CreateSubMenu('SingleWepMenu', 'WepMenu', 'Single Weapon Menu ~b~>~s~')
	WarMenu.CreateSubMenu('ESXOptions', 'ServerMenu', 'ESX Specific Options ~b~>~s~')
	WarMenu.CreateSubMenu('ESXdrugs', 'ServerMenu', 'ESX Drugs ~b~>~s~')
	WarMenu.CreateSubMenu('MiscServerOptions', 'ServerMenu', 'Misc Server Options ~b~>~s~')
	WarMenu.CreateSubMenu('VRPOptions', 'ServerMenu', 'VRP Specific Options ~b~>~s~')
	WarMenu.CreateSubMenu('CreditMenu', 'MainMenu', 'Credits ~b~>~s~')
-- Misc
	WarMenu.CreateSubMenu('MiscMenu', 'MainMenu', 'Misc options ~b~>~s~')
	WarMenu.CreateSubMenu('OFFMENU', 'MainMenu', 'Misc options ~b~>~s~')

	local SelectedPlayer
	

	while Enabled do
		if WarMenu.IsMenuOpened('MainMenu') then

			drawNotification("∑ Hola ~g~" .. player .. " ~s~! Ver ~r~1.0 BETA~s~ ∑")
			drawNotification("~p~¦ Estas usando el menu de Osquerna ~b~ Disfrutalo ;)")
			if WarMenu.MenuButton('Opciones propias ~b~>~s~', 'SelfMenu') then
            elseif WarMenu.MenuButton('Opciones de vehiculos ~b~>~s~', 'VehMenu') then
			elseif WarMenu.MenuButton('Tunear vehiculos ~b~>~s~', 'VehMenu2') then
			elseif WarMenu.MenuButton('Turbo del vehiculo ~b~>~s~', 'BoostMenu') then
			elseif WarMenu.MenuButton('Opciones de jugador ~b~>~s~', 'PlayerMenu') then
			elseif WarMenu.MenuButton('Menu de Armas ~b~>~s~', 'WepMenu') then
			elseif WarMenu.MenuButton('Menu ESX / VRP ~b~>~s~', 'ServerMenu') then
			elseif WarMenu.MenuButton('Opciones ~b~>~s~', 'MiscMenu') then
			elseif WarMenu.MenuButton('Creditos ~b~>~s~', 'CreditMenu') then
			elseif WarMenu.Button('~r~Quitar Osquerna Menu') then
				Enabled = false
			elseif WarMenu.Button("Traducido y modificado por Osquerna ") then
			end

-- Credit Menu			

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("CreditMenu") then
			if WarMenu.Button("Flamantes ~b~>~s~ 5$ De donacion !") then
			end

-- Misc Menu

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("MiscMenu") then
			if WarMenu.CheckBox('Mostrar informacion', DisplayInfo, function(enabled)
				DisplayInfo = enabled
			end) then
			elseif WarMenu.CheckBox('Vision Termica', bTherm, function(bTherm) end) then
				therm = not therm
				bTherm = therm
				SetSeethrough(therm)
			end

-- Self Menu			

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('SelfMenu') then
			if WarMenu.CheckBox('Modo dios', Godmode, function(enabled)
					Godmode = enabled
				end) then
			elseif WarMenu.Button('Darte vida') then
				SetEntityHealth(PlayerPedId(), 200)
			elseif WarMenu.Button('Darte armadura') then 
				SetPedArmour(PlayerPedId(), 200)
			elseif WarMenu.CheckBox('Forzar volteretas ~r~~h~FUN', Ragedoll, function(enabled)
				Ragedoll = enabled
				
			end) then
			elseif WarMenu.Button('Teletransporte al punto del mapa') then
				TeleportToWaypoint()
			elseif WarMenu.Button('Suicidarse') then
				SetEntityHealth(PlayerPedId(), 0)
				drawNotification("~r~Te has suicidado, recuerda suscribirte a it_osquerna.")
			elseif WarMenu.CheckBox('Stamina infinita', Stamania, function(enabled)
					Stamania = enabled
					
				end) then
			elseif WarMenu.CheckBox('Mantener limpio', KeepClean, function(enabled)
					KeepClean = enabled
					
				end) then
			elseif WarMenu.CheckBox('Volar', Noclip, function(enabled)
					Noclip = enabled
				
				end) then
			end

-- Weapon menu


			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("WepMenu") then
			if WarMenu.Button("Dar todas las armas") then
				for player=1, #allWeapons do
					GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[player]), 1000, false, false)
				end
			elseif WarMenu.Button('Quitar todas las armas') then
				for player=1, #allWeapons do
					RemoveWeaponFromPed(PlayerPedId(), GetHashKey(allWeapons[player]))
				end
			elseif WarMenu.Button('Tirar tu arma') then				
				local ped = GetPlayerPed(-1)
				local wep = GetSelectedPedWeapon(ped)
				SetPedDropsInventoryWeapon(GetPlayerPed(-1), wep, 0, 2.0, 0, -1)
			elseif WarMenu.Button('Darte municion') then
				for player=1, #allWeapons do
					AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[player]), 200)
				end
			elseif WarMenu.MenuButton('Darte un arma especifica', "SingleWepMenu") then
			elseif WarMenu.ComboBox('Weapon/Melee Damage', { "1x (Default)", "2x", "3x", "4x", "5x" }, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
					currentItemIndex = currentIndex
					selectedItemIndex = selectedIndex

					SetPlayerWeaponDamageModifier(PlayerId(), selectedItemIndex)
					SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedItemIndex)

				end) then
			elseif WarMenu.CheckBox('Municion Infinita', InfAmmo, function(enabled)
					InfAmmo = enabled
					
					SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
				end) then
			elseif WarMenu.CheckBox('Trigger Bot ~h~~r~[SOLO JUGADORES]', TriggerBot, function(enabled)
					TriggerBot = enabled
				end) then
			elseif WarMenu.CheckBox('Aim Bot ~h~~r~[SOLO JUGADORES]', AimBot, function(enabled)
					AimBot = enabled
				end) then
			end
			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("SingleWepMenu") then
			for player=1, #allWeapons do
				if WarMenu.Button(allWeapons[player]) then
					GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[player]), 1000, false, false)
				end
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('VehMenu') then
			if WarMenu.Button('Spawnear coche') then
				local ModelName = KeyboardInput("Pon el nombre del vehiculo", "", 100)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)

					SetPedIntoVehicle(PlayerPedId(), veh, -1)
				else
					drawNotification("~r~~y~Te has equivocado de modelo idiota XD")
                end
			elseif WarMenu.Button('Tunear motor transmision y turbo al maximo') then
				MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
			elseif WarMenu.Button('Ensuciar el vehiculo') then
				Clean(GetVehiclePedIsUsing(PlayerPedId()))
				drawNotification("~y~ Pa que te metes por caminos de tierra macho mira como me lo has dejao")
			elseif WarMenu.Button('Limpiar el coche') then
				Clean2(GetVehiclePedIsUsing(PlayerPedId()))
				drawNotification("~y~No veas 3 euracos por limpiar el coche")
			elseif WarMenu.CheckBox('No Caer Off', Nofall, function(enabled)
					Nofall = enabled

					SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
				end) then

			elseif WarMenu.CheckBox('Vehiculo modo dios', VehGod, function(enabled)
					VehGod = enabled
				end) then
					
			elseif WarMenu.CheckBox('Vehiculo Turbosupra (Num9 + Num6)', VehSpeed, function(enabled)
					VehSpeed = enabled
				end) then

			elseif WarMenu.CheckBox('Color Cambiante', RainbowVeh, function(enabled)
					RainbowVeh = enabled
				end) then

			elseif WarMenu.Button('Reparar el coche') then
				SetVehicleFixed(GetVehiclePedIsUsing(PlayerPedId()))
			end
			











			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("BoostMenu") then
			if WarMenu.MenuButton('Modificar poder ~b~>~s~', 'PowerBoostMenu') then
			elseif WarMenu.MenuButton('Modificar torque ~b~>~s~', 'TorqueBoostMenu') then
			end


			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('PowerBoostMenu') then 
			if WarMenu.Button('Dejarlo de serie') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif WarMenu.Button('Turbo ~h~~g~x2') then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x4') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x8') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x16') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x32') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x64') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x128') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x256') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 256.0 * 20.0)
			elseif WarMenu.Button('Turbo  ~h~~g~x512') then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('TorqueBoostMenu') then 
			if WarMenu.CheckBox('Empuje ~h~~g~x2', Torque2, function(enabled)
				Torque2 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x4', Torque4, function(enabled)
				Torque4 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x8', Torque8, function(enabled)
				Torque8 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x16', Torque16, function(enabled)
				Torque16 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x32', Torque32, function(enabled)
				Torque32 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x64', Torque64, function(enabled)
				Torque64 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x128', Torque128, function(enabled)
				Torque128 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x256', Torque256, function(enabled)
				Torque256 = enabled
			end) then
			elseif WarMenu.CheckBox('Empuje ~h~~g~x512', Torque512, function(enabled)
				Torque512 = enabled
			end) then
			end






			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('VehMenu2') then
			if WarMenu.MenuButton('Modificar  ( BETA ) ~b~>~s~', 'Engine') then
			elseif WarMenu.MenuButton('Modificar frenos', 'Brake') then
			elseif WarMenu.MenuButton('Modificar transmision ~b~>~s~', 'Transmission') then
			elseif WarMenu.MenuButton('Turbo ON OFF ~b~>~s~', 'Turbo') then
			end
            
            WarMenu.Display()
		elseif WarMenu.IsMenuOpened('Engine') then 
			if WarMenu.Button('~g~Motor Nivel 1') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 1, 0)
			elseif WarMenu.Button('~g~Motor Nivel 2') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 2, 0)
			elseif WarMenu.Button('~g~Motor Nivel 3') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 3, 0)
			elseif WarMenu.Button('~g~Motor Nivel 4') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 4, 0)
			elseif WarMenu.Button('~g~Motor Nivel 5') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 11, 5, 0)
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('Brake') then 
			if WarMenu.Button('~g~Frenos Nivel 1') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 1, 0)
			elseif WarMenu.Button('~g~Frenos Nivel 2') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 2, 0)
			elseif WarMenu.Button('~g~Frenos Nivel 3') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 3, 0)
			elseif WarMenu.Button('~g~Frenos Nivel 4') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 4, 0)
			elseif WarMenu.Button('~g~Frenos Nivel 5') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 12, 5, 0)
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('Transmission') then 
			if WarMenu.Button('~g~Transmision nivel 1') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 1, 0)
			elseif WarMenu.Button('~g~Transmision nivel 2') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 2, 0)
			elseif WarMenu.Button('~g~Transmision nivel 3') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 3, 0)
			elseif WarMenu.Button('~g~Transmision nivel 4') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 4, 0)
			elseif WarMenu.Button('~g~Transmision nivel 5') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				SetVehicleMod(veh, 13, 5, 0)
			end
		
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('Turbo') then 
			if WarMenu.Button('~g~Turbo ON') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				ToggleVehicleMod(veh, 18, 1, 0)
			elseif WarMenu.Button('~g~Turbo OFF') then
				local veh = GetVehiclePedIsUsing(PlayerPedId())
				ToggleVehicleMod(veh, 18, 0, 0)
			end

			

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('ServerMenu') then
			if WarMenu.MenuButton('ESX Opciones del servidor ~b~>~s~', 'ESXOptions') then
			elseif WarMenu.MenuButton('ESX Drogas ~b~>~s~', 'ESXdrugs') then
			elseif WarMenu.MenuButton('VRP Opciones especificas ~b~>~s~', 'VRPOptions') then
			elseif WarMenu.MenuButton('Mas opciones ~b~>~s~', 'MiscServerOptions') then
			end
				
				
			WarMenu.Display()	
		elseif WarMenu.IsMenuOpened('ESXOptions') then
			if WarMenu.Button('~g~Poner la comida al 1000%') then
				TriggerEvent("esx_status:set", "hunger", 10000000)
			elseif WarMenu.Button('~g~Poner el agua al 1000%') then
			TriggerEvent("esx_status:set", "thirst", 10000000)
			elseif WarMenu.Button('~o~Revivirte') then
				TriggerEvent('esx_ambulancejob:revive')
			elseif WarMenu.Button('~g~Mecano : Pescar') then
				TriggerServerEvent('esx_mecanojob:onNPCJobCompleted')
			elseif WarMenu.Button('~g~Get all Driver lisence ~h~~r~[BETA]') then
				TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive_bike')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive_truck')
			elseif WarMenu.Button('~o~ 10 000$') then
				TriggerServerEvent('esx_jobs:caution', 'give_back', 10000)
			elseif WarMenu.Button('~o~25 000$') then
				TriggerServerEvent('esx_jobs:caution', 'give_back', 25000)
			elseif WarMenu.Button('~o~100 000$') then
				TriggerServerEvent('esx_jobs:caution', 'give_back', 100000)
			elseif WarMenu.Button('~g~Farmear Fixkit') then
				TriggerServerEvent('esx_mechanicjob:startHarvest')
			elseif WarMenu.Button('~g~Craftear Fixkit') then
				TriggerServerEvent('esx_mechanicjob:startCraft')
			end

			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('MiscServerOptions') then 
			if WarMenu.Button('Enviar un mensaje de Discord (DiscordBot)') then
				local Message = KeyboardInput("Enter message to send", "", 100)
				TriggerServerEvent('DiscordBot:playerDied', Message, '1337')
				drawNotification("The message:~n~"..Message.."~n~Has been ~g~sent!")
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('VRPOptions') then 
			if WarMenu.Button('Dar dinero ( payGarage ) 100$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -100})
			elseif WarMenu.Button('Dar dinero ~y~( payGarage ) 1000$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -1000})
			elseif WarMenu.Button('Dar dinero ~y~( payGarage ) 10 000$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -10000})
			elseif WarMenu.Button('Dar dinero ~y~( payGarage ) 100 000$') then
				TriggerServerEvent('lscustoms:payGarage', {costs = -100000})
			elseif WarMenu.Button('Obtener carnet de conducir') then
				TriggerServerEvent('dmv:success')
			elseif WarMenu.Button('Deposito en el banco 100 000$') then
				TriggerServerEvent('bank:deposit', 100000)
			elseif WarMenu.Button('Transferencia de 100 000$') then
				TriggerServerEvent('bank:withdraw', 100000)
			elseif WarMenu.Button('Maquina tragaperras (como tu madre) 1000$') then
				TriggerServerEvent('vrp_slotmachine:server:2', 1000 )
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('ESXdrugs') then
			if WarMenu.Button('Farmear maria ~c~(x5)') then 
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
				TriggerServerEvent('esx_drugs:startHarvestWeed')
			elseif WarMenu.Button('Transformar maria ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
				TriggerServerEvent('esx_drugs:startTransformWeed')
			elseif WarMenu.Button('Vender maria ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
				TriggerServerEvent('esx_drugs:startSellWeed')
			elseif WarMenu.Button('Farmear coca ~c~(x5)') then 
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
				TriggerServerEvent('esx_drugs:startHarvestCoke')
			elseif WarMenu.Button('Transformar coca ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
				TriggerServerEvent('esx_drugs:startTransformCoke')
			elseif WarMenu.Button('Vender coca ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
				TriggerServerEvent('esx_drugs:startSellCoke')
			elseif WarMenu.Button('Farmear meta ~c~(x5)') then 
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
				TriggerServerEvent('esx_drugs:startHarvestMeth')
			elseif WarMenu.Button('Transformar meta ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
				TriggerServerEvent('esx_drugs:startTransformMeth')
			elseif WarMenu.Button('Vender meta ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
				TriggerServerEvent('esx_drugs:startSellMeth')
			elseif WarMenu.Button('Farmear Opio ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
				TriggerServerEvent('esx_drugs:startHarvestOpium')
			elseif WarMenu.Button('Transformar Opio ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
				TriggerServerEvent('esx_drugs:startTransformOpium')
			elseif WarMenu.Button('Vender Opio ~c~(x5)') then
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
				TriggerServerEvent('esx_drugs:startSellOpium')
			elseif WarMenu.Button('Blanchiment ~c~(x10)') then
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
			elseif WarMenu.Button('Parar todo ~c~(Drugs)') then
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
				drawNotification("Ya es suficiente no quiero volverme adicto.")
			end
					
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('PlayerMenu') then
			if WarMenu.CheckBox('ESP', esp, function(enabled)
					esp = enabled
				end) then
			elseif WarMenu.CheckBox('Player Blips Method 1', blips1, function(enabled)
					blips1 = enabled
				end) then
			elseif WarMenu.CheckBox('Player Blips Method 2', blips2, function(enabled)
					blips2 = enabled
					drawNotification("~r~Desmarque el Método 2 para hacer clic en blips")
				end) then
			elseif WarMenu.CheckBox('ESP : INFO', info, function(enabled)
					info = enabled
				end) then
			elseif WarMenu.CheckBox('ESP : 3D BOX', box, function(enabled)
					box = enabled
				end) then
			elseif WarMenu.CheckBox('ESP : SNAPLINES', lines, function(enabled)
					lines = enabled
				end) then
			elseif WarMenu.MenuButton("Jugadores online ~b~>~s~", "OnlinePlayerMenu") then
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("OnlinePlayerMenu") then
			for i = 0, 64 do
				if GetPlayerServerId(i) ~= 0 and WarMenu.MenuButton(GetPlayerName(i).." ~p~["..GetPlayerServerId(i).."]~s~ ~y~["..i.."]~s~ "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~[DEAD]" or "~g~[ALIVE]"), 'PlayerOptionsMenu') then
					SelectedPlayer = i
				end
			end
			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("PlayerOptionsMenu") then
			WarMenu.SetSubTitle("Menu de jugadores online", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
			if WarMenu.Button('Observar', (Spectating and "~g~[SPECTATING]")) then
				SpectatePlayer(SelectedPlayer)
			elseif WarMenu.Button('Teleportarse a el') then
				local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
				SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
			elseif WarMenu.Button('Dar vueltas ~r~FUN') then
				local ped = GetPlayerPed(SelectedPlayer)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
			elseif WarMenu.Button('Dar todas las armas') then
				for player=1, #allWeapons do
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
				end
			elseif WarMenu.MenuButton('Dar un arma especifica', 'SingleWepPlayer') then
			elseif WarMenu.Button('Dar vehiculo') then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = KeyboardInput("Pon el nombre del coche", "", 100)

				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
				else
					drawNotification("~r~Tas equivocao paleto")
				end
			elseif WarMenu.Button("Esposar jugador") then
				TriggerServerEvent('BsCuff:Cuff696999', GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("CheckHandcuff", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent('unCuffServer', GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("uncuffGranted", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("police:cuffGranted", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent('esx_handcuffs:unlocking', GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
			elseif WarMenu.Button("Hecharlo del coche") then
				ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
			elseif WarMenu.Button("Revivir jugador ~r~( ESX_AMBULANCE )") then
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
			end
			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened("SingleWepPlayer") then
			for player=1, #allWeapons do
				if WarMenu.Button(allWeapons[player]) then
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[player]), 1000, false, true)
				end
			end
			


			WarMenu.Display()
		elseif IsDisabledControlPressed(0, 48) and IsDisabledControlPressed(0, 21) then
			WarMenu.OpenMenu('MainMenu')
		end

		Citizen.Wait(0)
	end
end)

RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false
end, false)