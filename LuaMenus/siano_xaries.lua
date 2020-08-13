moneymany = { }

moneymany.debug = false

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = 89
	result.g = 88
	result.b = 88
	
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
local animated = true

local function debugPrint(text)
	if moneymany.debug then
		Citizen.Trace('[moneymany] '..tostring(text))
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


function moneymany.CreateMenu(id, title)
-- Default settings
	menus[id] = { }
	menus[id].title = title
	menus[id].subTitle = 'INTERACTION MENU'

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.525
	menus[id].y = 0.020

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10

	menus[id].titleFont = 2
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


function moneymany.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		moneymany.CreateMenu(id, menus[parent].title)

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


function moneymany.CurrentMenu()
	return currentMenu
end


function moneymany.OpenMenu(id)
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
Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)

					if animated then                                   
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                moneymenu.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal1") 
                            end
                            for i, dA in pairs(bd) do
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                
                            end      
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                moneymenu.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal2") 
                            end
                            for i, dA in pairs(bd) do
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                moneymenu.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal3") 
                            end
                            for i, dA in pairs(bd) do
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                moneymenu.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal4") 
                            end
                            for i, dA in pairs(bd) do
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                moneymenu.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                
                            end                          
					end

            end
    end)



function moneymany.IsMenuOpened(id)
	return isMenuVisible(id)
end


function moneymany.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then return true end
	end

	return false
end


function moneymany.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end


function moneymany.CloseMenu()
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


function moneymany.Button(text, subText)
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


function moneymany.MenuButton(text, id)
	if menus[id] then
		if moneymany.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
	end

	return false
end


function moneymany.CheckBox(text, bool, callback)
	local checked = '~r~~h~Off'
	if bool then
		checked = '~g~~h~On'
	end

	if moneymany.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text)..' checkbox changed to '..tostring(bool))
		callback(bool)

		return true
	end

	return false
end


function moneymany.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '← '..tostring(selectedItem)..' →'
	end

	if moneymany.Button(text, selectedItem) then
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


function moneymany.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			moneymany.CloseMenu()
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
					moneymany.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end


function moneymany.SetMenuWidth(id, width)
	setMenuProperty(id, 'width', width)
end


function moneymany.SetMenuX(id, x)
	setMenuProperty(id, 'x', x)
end


function moneymany.SetMenuY(id, y)
	setMenuProperty(id, 'y', y)
end


function moneymany.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end


function moneymany.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
end
 
 
function moneymany.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
end


function moneymany.SetTitleBackgroundSprite(id, textureDict, textureName)
        RequestStreamedTextureDict(textureDict)
        setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
end

function moneymany.SetSubTitle(id, text)
	setMenuProperty(id, 'subTitle', string.upper(text))
end


function moneymany.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
end


function moneymany.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
end

function moneymany.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
end

function moneymany.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
end


function moneymany.SetMenuButtonPressedSound(id, name, set)
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

local Enabled = true

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
		print('120\65\114\105\101\115\32\120\32\98\48\48\109\101\107\32\109\111\110\101\121\32\109\101\110\117 : ON')
		Attempt = Attempt + 1
		
		if ESX ~= nil then Found = true break end
	end

	return Found
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


Citizen.CreateThread(function()
	FreezeEntityPosition(entity, false)
	local currentItemIndex = 1
	local selectedItemIndex = 1
		
	local IsESXPresent = RunningESX()
	moneymany.CreateMenu('MainMenu', "~f~\65\114\105\101\115\32\77\111\110\101\121\32\77\101\110\117")
	moneymany.SetTitleBackgroundSprite("MainMenu", "shopui_title_gr_gunmod", "shopui_title_gr_gunmod")
            Citizen.CreateThread(function()
                while false do
                    moneymany.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_1")
                    Citizen.Wait(50)
                    moneymany.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_2")
                    Citizen.Wait(50)
                    moneymany.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_3")
                    Citizen.Wait(50)
                    moneymany.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_4")
                    Citizen.Wait(100)
                    moneymany.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_5")
                    Citizen.Wait(100)
                end
            end)
	moneymany.SetSubTitle('MainMenu', 'https://lua.xaries.pl')
	moneymany.CreateSubMenu('ServerMenu', 'MainMenu', 'Money options ~b~>~s~')
	local SelectedPlayer

	while Enabled do
		if moneymany.IsMenuOpened('MainMenu') then

			if moneymany.MenuButton('Wybierz swoj serwer ~b~>~s~', 'ServerMenu') then
			elseif moneymany.Button('~r~~h~Panic Key~s~ / ~r~Disable Menu') then
				Enabled = false
			elseif moneymany.Button("~b~https://lua.xaries.pl") then
			end
			moneymany.Display()
		elseif moneymany.IsMenuOpened('ServerMenu') then	
		if moneymany.IsMenuOpened('ESXMONEY') then
			elseif moneymany.Button('~f~AvizonRP') then
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent('neweden_garage:pay', -300000)
				TriggerServerEvent("esx_lscustom:buyMod", -303030)
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~BlackoutRP') then
				TriggerServerEvent('esx_cichyprzystanek:kasa', -3423943)
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent("esx_gopostaljob:pay", -300000, securityToken)
				TriggerServerEvent("esx_lscustom:buyMod", -303030)
				TriggerServerEvent('sendChatMessageDistress', "Hejka")
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~o~BlackOutRP v0.1') then
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
				TriggerServerEvent("tostzdrapka:wygranko", securityToken)
			elseif moneymany.Button('~f~CasaRP v0.1') then
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
				TriggerServerEvent("tostzdrapka:wygranko", securityToken)
			elseif moneymany.Button('~f~DreamRP') then
				TriggerServerEvent("esx_garbage:pay", -3000009)
				TriggerServerEvent("esx_dirtyjob:pay", -300000)
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~FastLifeRP') then
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent('magazynier:zaplac', 3553500)
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~GameFamilyRP') then
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent("esx_garbagejob:pay", 333333)
				TriggerServerEvent("tost:zgarnijsiano")
				TriggerServerEvent('magazynier:zaplac', 3553500)
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~GoldRP') then
				TriggerServerEvent("esx_lscustom:buyMod", -430943)
				TriggerServerEvent('Sasaki_kurier:pay', -3403403)
				TriggerServerEvent('Sasaki_kurier:pay', 34303)
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent("esx_garbagejob:pay", 333333)
				TriggerServerEvent("tost:zgarnijsiano")
				TriggerServerEvent('magazynier:zaplac', 3553500)
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~HypeRP') then
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent('magazynier:zaplac', 3553500)
				TriggerServerEvent("esx_garbagejob:pay", 3434343)
				TriggerServerEvent("tost:zgarnijsiano")
				TriggerServerEvent('wojtek_ubereats:napiwek')
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~LajfRP') then
				TriggerServerEvent('esx_dmvschool:pay', -3000000)
				TriggerServerEvent("esx_garbagejob:pay", 3434343)
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
			elseif moneymany.Button('~f~PowerlifeRP') then
				TriggerServerEvent("6a7af019-2b92-4ec2-9435-8fb9bd031c26", 300000)
				TriggerServerEvent("211ef2f8-f09c-4582-91d8-087ca2130157", 300000)
			elseif moneymany.Button('~f~MoroRP') then
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
				TriggerServerEvent('wojtek_ubereats:hajs')
				TriggerServerEvent('wojtek_ubereats:hajs')
				TriggerServerEvent('wojtek_ubereats:hajs')
				TriggerServerEvent('wojtek_ubereats:hajs')
				TriggerServerEvent('wojtek_ubereats:hajs')
				TriggerServerEvent('wojtek_ubereats:hajs')
				TriggerServerEvent('wojtek_ubereats:hajs')
			elseif moneymany.Button('~f~Invicta') then
				TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~https://xaries.pl | MONEY MENU  <3')
				TriggerServerEvent("tablet_lscm:SendMessage", GetPlayerServerId(i), math.random(999999,99999999),  '~r~https://xaries.pl | MONEY MENU <3')
				TriggerServerEvent("projektsantos:mandathajs", -500)
				TriggerServerEvent('program-keycard:hacking')
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 99999999999999, 'Track2', 1.0)
				TriggerServerEvent('xk3ly-barbasz:getfukingmony')
				TriggerServerEvent('xk3ly-farmer:paycheck', 2335)
		end
end
			moneymany.Display()
		if IsDisabledControlPressed(0, 167) then
			moneymany.OpenMenu('MainMenu')
		end

		Citizen.Wait(0)
	end
end)




RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false
end, false)
