WarMenu = { } WarMenu.debug = false local menus = { } local keys = { up = 172, down = 173, left = 174, right = 175, select = 176, back = 177 } local optionCount = 0 local currentKey = nil local currentMenu = nil local titleHeight = 0.11 local titleXOffset = 0.5 local titleSpacing = 2 local titleYOffset = 0.03 local titleScale = 1.0 local buttonHeight = 0.038 local buttonFont = 0 local buttonScale = 0.365 local buttonTextXOffset = 0.005 local buttonTextYOffset = 0.005 local function debugPrint(text) if WarMenu.debug then Citizen.Trace('[WarMenu] '..tostring(text)) end end local function setMenuProperty(id, property, value) if id and menus[id] then menus[id][property] = value debugPrint(id..' menu property changed: { '..tostring(property)..', '..tostring(value)..' }') end end local function isMenuVisible(id) if id and menus[id] then return menus[id].visible else return false end end local function setMenuVisible(id, visible, holdCurrent) if id and menus[id] then setMenuProperty(id, 'visible', visible) if not holdCurrent and menus[id] then setMenuProperty(id, 'currentOption', 1) end if visible then if id ~= currentMenu and isMenuVisible(currentMenu) then setMenuVisible(currentMenu, false) end currentMenu = id end end end local function drawText(text, x, y, font, color, scale, center, shadow, alignRight) SetTextColour(color.r, color.g, color.b, color.a) SetTextFont(font) SetTextScale(scale, scale) if shadow then SetTextDropShadow(2, 2, 0, 0, 0) end if menus[currentMenu] then if center then SetTextCentre(center) elseif alignRight then SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menus[currentMenu].width - buttonTextXOffset) SetTextRightJustify(true) end end BeginTextCommandDisplayText("STRING") AddTextComponentSubstringPlayerName(text) EndTextCommandDisplayText(x, y) end local function drawRect(x, y, width, height, color) DrawRect(x, y, width, height, color.r, color.g, color.b, color.a) end local function drawTitle() if menus[currentMenu] then local x = menus[currentMenu].x + menus[currentMenu].width / 2 local xText = menus[currentMenu].x + menus[currentMenu].width * titleXOffset  local y = menus[currentMenu].y + titleHeight * 1/titleSpacing if menus[currentMenu].titleBackgroundSprite then DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., 255, 255, 255, 255) else drawRect(x, y, menus[currentMenu].width, titleHeight, menus[currentMenu].titleBackgroundColor) end drawText(menus[currentMenu].title, xText, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true) end end local function drawSubTitle() if menus[currentMenu] then local x = menus[currentMenu].x + menus[currentMenu].width / 2 local y = menus[currentMenu].y + titleHeight + buttonHeight / 2 local subTitleColor = { r = menus[currentMenu].titleBackgroundColor.r, g = menus[currentMenu].titleBackgroundColor.g, b = menus[currentMenu].titleBackgroundColor.b, a = 255 } drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleBackgroundColor) drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false) if optionCount > menus[currentMenu].maxOptionCount then drawText(tostring(menus[currentMenu].currentOption)..' / '..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true) end end end local function drawButton(text, subText) local x = menus[currentMenu].x + menus[currentMenu].width / 2 local multiplier = nil if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then multiplier = optionCount elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount) end if multiplier then local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2 local backgroundColor = nil local textColor = nil local subTextColor = nil local shadow = false if menus[currentMenu].currentOption == optionCount then backgroundColor = menus[currentMenu].menuFocusBackgroundColor textColor = menus[currentMenu].menuFocusTextColor subTextColor = menus[currentMenu].menuFocusTextColor else backgroundColor = menus[currentMenu].menuBackgroundColor textColor = menus[currentMenu].menuTextColor subTextColor = menus[currentMenu].menuSubTextColor shadow = true end drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor) drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow) if subText then drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true) end end end function WarMenu.CreateMenu(id, title) menus[id] = { } menus[id].title = title menus[id].subTitle = 'INTERACTION MENU' menus[id].visible = false menus[id].previousMenu = nil menus[id].aboutToBeClosed = false menus[id].x = 0.0175 menus[id].y = 0.025 menus[id].width = 0.23 menus[id].currentOption = 1 menus[id].maxOptionCount = 10 menus[id].titleFont = 1 menus[id].titleColor = { r = 0, g = 0, b = 0, a = 255 } menus[id].titleBackgroundColor = { r = 245, g = 127, b = 23, a = 255 } menus[id].titleBackgroundSprite = nil menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 } menus[id].menuSubTextColor = { r = 189, g = 189, b = 189, a = 255 } menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 } menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 } menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 160 } menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 255 } menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } debugPrint(tostring(id)..' menu created') end function WarMenu.CreateSubMenu(id, parent, subTitle) if menus[parent] then WarMenu.CreateMenu(id, menus[parent].title) if subTitle then setMenuProperty(id, 'subTitle', string.upper(subTitle)) else setMenuProperty(id, 'subTitle', string.upper(menus[parent].subTitle)) end setMenuProperty(id, 'previousMenu', parent) setMenuProperty(id, 'x', menus[parent].x) setMenuProperty(id, 'y', menus[parent].y) setMenuProperty(id, 'maxOptionCount', menus[parent].maxOptionCount) setMenuProperty(id, 'titleFont', menus[parent].titleFont) setMenuProperty(id, 'titleColor', menus[parent].titleColor) setMenuProperty(id, 'titleBackgroundColor', menus[parent].titleBackgroundColor) setMenuProperty(id, 'titleBackgroundSprite', menus[parent].titleBackgroundSprite) setMenuProperty(id, 'menuTextColor', menus[parent].menuTextColor) setMenuProperty(id, 'menuSubTextColor', menus[parent].menuSubTextColor) setMenuProperty(id, 'menuFocusTextColor', menus[parent].menuFocusTextColor) setMenuProperty(id, 'menuFocusBackgroundColor', menus[parent].menuFocusBackgroundColor) setMenuProperty(id, 'menuBackgroundColor', menus[parent].menuBackgroundColor) setMenuProperty(id, 'subTitleBackgroundColor', menus[parent].subTitleBackgroundColor) else debugPrint('Failed to create '..tostring(id)..' submenu: '..tostring(parent)..' parent menu doesn\'t exist') end end function WarMenu.CurrentMenu() return currentMenu end function WarMenu.OpenMenu(id) if id and menus[id] then PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) setMenuVisible(id, true) debugPrint(tostring(id)..' menu opened') else debugPrint('Failed to open '..tostring(id)..' menu: it doesn\'t exist') end end function WarMenu.IsMenuOpened(id) return isMenuVisible(id) end function WarMenu.IsAnyMenuOpened() for id, _ in pairs(menus) do if isMenuVisible(id) then return true end end return false end function WarMenu.IsMenuAboutToBeClosed() if menus[currentMenu] then return menus[currentMenu].aboutToBeClosed else return false end end function WarMenu.CloseMenu() if menus[currentMenu] then if menus[currentMenu].aboutToBeClosed then menus[currentMenu].aboutToBeClosed = false setMenuVisible(currentMenu, false) debugPrint(tostring(currentMenu)..' menu closed') PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) optionCount = 0 currentMenu = nil currentKey = nil else menus[currentMenu].aboutToBeClosed = true debugPrint(tostring(currentMenu)..' menu about to be closed') end end end function WarMenu.Button(text, subText) local buttonText = text if subText then buttonText = '{ '..tostring(buttonText)..', '..tostring(subText)..' }' end if menus[currentMenu] then optionCount = optionCount + 1 local isCurrent = menus[currentMenu].currentOption == optionCount drawButton(text, subText) if isCurrent then if currentKey == keys.select then PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true) debugPrint(buttonText..' button pressed') return true elseif currentKey == keys.left or currentKey == keys.right then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) end end return false else debugPrint('Failed to create '..buttonText..' button: '..tostring(currentMenu)..' menu doesn\'t exist') return false end end function WarMenu.MenuButton(text, id) if menus[id] then if WarMenu.Button(text) then setMenuVisible(currentMenu, false) setMenuVisible(id, true, true) return true end else debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist') end return false end function WarMenu.CheckBox(text, checked, callback) if WarMenu.Button(text, checked and 'On' or 'Off') then checked = not checked debugPrint(tostring(text)..' checkbox changed to '..tostring(checked)) if callback then callback(checked) end return true end return false end function WarMenu.ComboBox(text, items, currentIndex, selectedIndex, callback) local itemsCount = #items local selectedItem = items[currentIndex] local isCurrent = menus[currentMenu].currentOption == (optionCount + 1) if itemsCount > 1 and isCurrent then selectedItem = tostring(selectedItem) end if WarMenu.Button(text, selectedItem) then selectedIndex = currentIndex callback(currentIndex, selectedIndex) return true elseif isCurrent then if currentKey == keys.left then if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end elseif currentKey == keys.right then if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end end else currentIndex = selectedIndex end callback(currentIndex, selectedIndex) return false end function WarMenu.Display() if isMenuVisible(currentMenu) then if menus[currentMenu].aboutToBeClosed then WarMenu.CloseMenu() else ClearAllHelpMessages() drawTitle() drawSubTitle() currentKey = nil if IsControlJustReleased(1, keys.down) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if menus[currentMenu].currentOption < optionCount then menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1 else menus[currentMenu].currentOption = 1 end elseif IsControlJustReleased(1, keys.up) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if menus[currentMenu].currentOption > 1 then menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1 else menus[currentMenu].currentOption = optionCount end elseif IsControlJustReleased(1, keys.left) then currentKey = keys.left elseif IsControlJustReleased(1, keys.right) then currentKey = keys.right elseif IsControlJustReleased(1, keys.select) then currentKey = keys.select elseif IsControlJustReleased(1, keys.back) then if menus[menus[currentMenu].previousMenu] then PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) setMenuVisible(menus[currentMenu].previousMenu, true) else WarMenu.CloseMenu() end end optionCount = 0 end end end function WarMenu.SetMenuWidth(id, width) setMenuProperty(id, 'width', width) end function WarMenu.SetMenuX(id, x) setMenuProperty(id, 'x', x) end function WarMenu.SetMenuY(id, y) setMenuProperty(id, 'y', y) end function WarMenu.SetMenuMaxOptionCountOnScreen(id, count) setMenuProperty(id, 'maxOptionCount', count) end function WarMenu.SetTitle(id, title) setMenuProperty(id, 'title', title) end function WarMenu.SetTitleColor(id, r, g, b, a) setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a }) end function WarMenu.SetTitleBackgroundColor(id, r, g, b, a) setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a }) end function WarMenu.SetTitleBackgroundSprite(id, textureDict, textureName) RequestStreamedTextureDict(textureDict) setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName }) end function WarMenu.SetSubTitle(id, text) setMenuProperty(id, 'subTitle', string.upper(text)) end function WarMenu.SetMenuBackgroundColor(id, r, g, b, a) setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a }) end function WarMenu.SetMenuTextColor(id, r, g, b, a) setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a }) end function WarMenu.SetMenuSubTextColor(id, r, g, b, a) setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a }) end function WarMenu.SetMenuFocusColor(id, r, g, b, a) setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a }) end function WarMenu.SetMenuButtonPressedSound(id, name, set) setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set }) end Tools = {} local IDGenerator = {} function Tools.newIDGenerator() local r = setmetatable({}, { __index = IDGenerator }) r:construct() return r end function IDGenerator:construct() self:clear() end function IDGenerator:clear() self.max = 0 self.ids = {} end function IDGenerator:gen() if #self.ids > 0 then return table.remove(self.ids) else local r = self.max self.max = self.max+1 return r end end function IDGenerator:free(id) table.insert(self.ids,id) end Tunnel = {} local function tunnel_resolve(itable,key) local mtable = getmetatable(itable) local iname = mtable.name local ids = mtable.tunnel_ids local callbacks = mtable.tunnel_callbacks local identifier = mtable.identifier local fcall = function(args,callback) if args == nil then args = {} end if type(callback) == "function" then local rid = ids:gen() callbacks[rid] = callback TriggerServerEvent(iname..":tunnel_req",key,args,identifier,rid) else TriggerServerEvent(iname..":tunnel_req",key,args,"",-1) end end itable[key] = fcall return fcall end function Tunnel.bindInterface(name,interface) RegisterNetEvent(name..":tunnel_req") AddEventHandler(name..":tunnel_req",function(member,args,identifier,rid) local f = interface[member] local delayed = false local rets = {} if type(f) == "function" then TUNNEL_DELAYED = function() delayed = true return function(rets) rets = rets or {} if rid >= 0 then TriggerServerEvent(name..":"..identifier..":tunnel_res",rid,rets) end end end rets = {f(table.unpack(args))} end if not delayed and rid >= 0 then TriggerServerEvent(name..":"..identifier..":tunnel_res",rid,rets) end end) end function Tunnel.getInterface(name,identifier) local ids = Tools.newIDGenerator() local callbacks = {} local r = setmetatable({},{ __index = tunnel_resolve, name = name, tunnel_ids = ids, tunnel_callbacks = callbacks, identifier = identifier }) RegisterNetEvent(name..":"..identifier..":tunnel_res") AddEventHandler(name..":"..identifier..":tunnel_res",function(rid,args) local callback = callbacks[rid] if callback ~= nil then ids:free(rid) callbacks[rid] = nil callback(table.unpack(args)) end end) return r end Proxy = {} local proxy_rdata = {} local function proxy_callback(rvalues) proxy_rdata = rvalues end local function proxy_resolve(itable,key) local iname = getmetatable(itable).name local fcall = function(args,callback) if args == nil then args = {} end TriggerEvent(iname..":proxy",key,args,proxy_callback) return table.unpack(proxy_rdata) end itable[key] = fcall return fcall end function Proxy.addInterface(name, itable) AddEventHandler(name..":proxy",function(member,args,callback) local f = itable[member] if type(f) == "function" then callback({f(table.unpack(args))}) else end end) end function Proxy.getInterface(name) local r = setmetatable({},{ __index = proxy_resolve, name = name }) return r end
--[[

	WarMenu by Warxander
	https://github.com/warxander

	vRP Tunnel and Proxy libraries by ImagicTheCat
	https://github.com/ImagicTheCat/vRP/tree/master/vrp



		Anyone is free to use this menu and modify it as they please. All I ask in return is that
			you do not try to monetize this release - I made this because I was tired of seeing
			people trying to sell the same old reused code and charging ridiculous amounts for it.



  /\   _____  ______          _____         _____  _      ______           _____ ______   /\
 |/\| |  __ \|  ____|   /\   |  __ \       |  __ \| |    |  ____|   /\    / ____|  ____| |/\|
      | |__) | |__     /  \  | |  | |      | |__) | |    | |__     /  \  | (___ | |__
      |  _  /|  __|   / /\ \ | |  | |      |  ___/| |    |  __|   / /\ \  \___ \|  __|
      | | \ \| |____ / ____ \| |__| |      | |    | |____| |____ / ____ \ ____) | |____
      |_|  \_\______/_/    \_\_____/       |_|    |______|______/_/    \_\_____/|______|

]]

-- CONFIG

--[[
	Add your name or don't - I don't care.
]]
developers = {
"tommyakshot - Joeyarrabi#7440", -- Out of respect for this free release, please leave my name somewhere in here.
"Kirtle - Kirtle#0498", -- Helped across the board, also made the infamous theme and misc WarMenu adjustments (for themes/controls)
"Erwin Rommel - Erwin Rommel#4860", -- Made weather functions and provided some nice links to obj/ped dbs
"Sef - TRAPNK"
}

menuName = "Sef Menu"		-- The name of the menu
version = "2.1"				-- Keep it simple
theme = "infamous"				-- Feel free to make your own
themes = {"infamous", "basic", "dark", "skid"} -- Add themes here if you want them to be in the theme selector
mpMessage = false			-- Whether or not to use the big mp message
menuKeybind = "DELETE"		-- Key to open the menu. Supported ones are shown below - Find new ones at https://docs.fivem.net/game-references/controls/
noclipKeybind = "PAGEDOWN"		-- Key to toggle Noclip
teleportkeybind = "PAGEUP"
startMessage = "∑ ~b~Welcome Player "..GetPlayerName(PlayerId()).."'s to Sef Menu."	-- The message that is shown when the menu is opened
subMessage = "~w~Press ~b~"..menuKeybind.."~w~ to open the menu." -- subtitle of opening message
motd = "∑ Press ~b~"..noclipKeybind.."~w~ to toggle noclip!"
motd = "∑ Press ~b~"..teleportkeybind.."~w~ to teleport to waypoint!" -- motd

-- Add any new menus to this list (for theme changer/textures)
menulist = {

-- MAIN SUBMENUS
'skid',
'player',
'self',
'weapon',
'vehicle',
'world',
'misc',
'custom',

-- PLAYER SUBMENUS
'allplayer',
'playeroptions',

-- SELF SUBMENUS
'appearance',

-- WEAPON SUBMENUS
'weaponspawner',

-- WEAPON SPAWNER SUBMENUS
'melee',
'pistol',
'shotgun',
'smg',
'assault',
'sniper',
'thrown',
'heavy',

-- VEHICLE SUBMENUS
'vehiclespawner',
'vehiclemods',
'vehiclecolors',
'vehiclecolors_primary',
'vehiclecolors_secondary',
'primary_classic',
'primary_matte',
'primary_metal',
'secondary_classic',
'secondary_matte',
'secondary_metal',

-- VEHICLE SPAWNER SUBMENUS
'compacts',
'sedans',
'suvs',
'coupes',
'muscle',
'sportsclassics',
'sports',
'super',
'motorcycles',
'offroad',
'industrial',
'utility',
'vans',
'cycles',
'boats',
'helicopters',
'planes',
'service',
'commercial',


-- WORLD SUBMENUS
'objectspawner',
'objectlist',
'weather',
'time',

-- MISC SUBMENUS
'credits',

-- CUSTOM SUBMENUS
'esx',
'vrp',
'other'


}


-- END CONFIG


-- Noclip Speed Options
NoclipSpeedOps = {1, 5, 10, 20, 30}
-- Default Noclip Speed
NoclipSpeed = 1
oldSpeed = nil

-- Forcefield Radius Options
ForcefieldRadiusOps = {5.0, 10.0, 15.0, 20.0, 50.0}
-- Default Forcefield Radius
ForcefieldRadius = 5.0

-- Object Rotation Options
RotationOps = {0, 45, 90, 135, 180}
-- Default Rotation
ObjRotation = 90

-- Gravity options
GravityOps = {0.0, 5.0, 50.0, 100.0, 200.0, 500.0, 1000.0, 9999.9}
-- Default
GravAmount = 50.0

-- Clothing Slots
ClothingSlots = {1, 2, 3, 4, 5}

-- Ped Attack Types
PedAttackOps = {"All Weapons", "Melee Weapons", "Pistols", "Heavy Weapons"}
--Default
PedAttackType = 1

-- Objects to spawn
-- https://cdn.rage.mp/public/odb/index.html
objs_tospawn = {
"stt_prop_stunt_track_start",
"prop_container_01a",
"prop_contnr_pile_01a",
"ce_xr_ctr2",
"stt_prop_ramp_jump_xxl",
"hei_prop_carrier_jet",
"prop_parking_hut_2",
"csx_seabed_rock3_",
"db_apart_03_",
"db_apart_09_"
}

-- WEAPONS LISTS
local allweapons = {
--Melee
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

--Thrown
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

--Pistols
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

-- SMGs / MGs
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

-- Assault Rifles
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

--Shotguns
"WEAPON_PUMPSHOTGUN",
"WEAPON_PUMPSHOTGUN_MK2", 
"WEAPON_SWEEPERSHOTGUN",
"WEAPON_SAWNOFFSHOTGUN",
"WEAPON_BULLPUPSHOTGUN",
"WEAPON_ASSAULTSHOTGUN",
"WEAPON_MUSKET",
"WEAPON_HEAVYSHOTGUN",
"WEAPON_DBSHOTGUN",

--Sniper Rifles
"WEAPON_SNIPERRIFLE",
"WEAPON_HEAVYSNIPER",
"WEAPON_HEAVYSNIPER_MK2",
"WEAPON_MARKSMANRIFLE",
"WEAPON_MARKSMANRIFLE_MK2",

--Heavy Weapons
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

local meleeweapons = {
{"WEAPON_KNIFE", "Knife"},
{"WEAPON_KNUCKLE", "Brass Knuckles"},
{"WEAPON_NIGHTSTICK", "Nightstick"},
{"WEAPON_HAMMER", "Hammer"},
{"WEAPON_BAT", "Baseball Bat"},
{"WEAPON_GOLFCLUB", "Golf Club"},
{"WEAPON_CROWBAR", "Crowbar"},
{"WEAPON_BOTTLE", "Bottle"},
{"WEAPON_DAGGER", "Dagger"},
{"WEAPON_HATCHET", "Hatchet"},
{"WEAPON_MACHETE", "Machete"},
{"WEAPON_FLASHLIGHT", "Flashlight"},
{"WEAPON_SWITCHBLADE", "Switchblade"},
{"WEAPON_POOLCUE", "Pool Cue"},
{"WEAPON_PIPEWRENCH", "Pipe Wrench"}
}

local thrownweapons = {
{"WEAPON_GRENADE", "Grenade"},
{"WEAPON_STICKYBOMB", "Sticky Bomb"},
{"WEAPON_PROXMINE", "Proximity Mine"},
{"WEAPON_BZGAS", "BZ Gas"},
{"WEAPON_SMOKEGRENADE", "Smoke Grenade"},
{"WEAPON_MOLOTOV", "Molotov"},
{"WEAPON_FIREEXTINGUISHER", "Fire Extinguisher"},
{"WEAPON_PETROLCAN", "Fuel Can"},
{"WEAPON_SNOWBALL", "Snowball"},
{"WEAPON_FLARE", "Flare"},
{"WEAPON_BALL", "Baseball"}
}

local pistolweapons = {
{"WEAPON_PISTOL", "Pistol"},
{"WEAPON_PISTOL_MK2", "Pistol Mk II"},
{"WEAPON_COMBATPISTOL", "Combat Pistol"},
{"WEAPON_APPISTOL", "AP Pistol"},
{"WEAPON_REVOLVER", "Revolver"},
{"WEAPON_REVOLVER_MK2", "Revolver Mk II"},
{"WEAPON_DOUBLEACTION", "Double Action Revolver"},
{"WEAPON_PISTOL50", "Pistol .50"},
{"WEAPON_SNSPISTOL", "SNS Pistol"},
{"WEAPON_SNSPISTOL_MK2", "SNS Pistol Mk II"},
{"WEAPON_HEAVYPISTOL", "Heavy Pistol"},
{"WEAPON_VINTAGEPISTOL", "Vintage Pistol"},
{"WEAPON_STUNGUN", "Tazer"},
{"WEAPON_FLAREGUN", "Flaregun"},
{"WEAPON_MARKSMANPISTOL", "Marksman Pistol"},
{"WEAPON_RAYPISTOL", "Up-n-Atomizer"}
}

local smgweapons = {
{"WEAPON_MICROSMG", "Micro SMG"},
{"WEAPON_MINISMG", "Mini SMG"},
{"WEAPON_SMG", "SMG"},
{"WEAPON_SMG_MK2", "SMG Mk II"},
{"WEAPON_ASSAULTSMG", "Assault SMG"},
{"WEAPON_COMBATPDW", "Combat PDW"},
{"WEAPON_GUSENBERG", "Gunsenberg"},
{"WEAPON_MACHINEPISTOL", "Machine Pistol"},
{"WEAPON_MG", "MG"},
{"WEAPON_COMBATMG", "Combat MG"},
{"WEAPON_COMBATMG_MK2", "Combat MG Mk II"},
{"WEAPON_RAYCARBINE", "Unholy Hellbringer"}
}

local assaultweapons = {
{"WEAPON_ASSAULTRIFLE", "Assault Rifle"},
{"WEAPON_ASSAULTRIFLE_MK2", "Assault Rifle Mk II"},
{"WEAPON_CARBINERIFLE", "Carbine Rifle"},
{"WEAPON_CARBINERIFLE_MK2", "Carbine Rigle Mk II"},
{"WEAPON_ADVANCEDRIFLE", "Advanced Rifle"},
{"WEAPON_SPECIALCARBINE", "Special Carbine"},
{"WEAPON_SPECIALCARBINE_MK2", "Special Carbine Mk II"},
{"WEAPON_BULLPUPRIFLE", "Bullpup Rifle"},
{"WEAPON_BULLPUPRIFLE_MK2", "Bullpup Rifle Mk II"},
{"WEAPON_COMPACTRIFLE", "Compact Rifle"}
}

local shotgunweapons = {
{"WEAPON_PUMPSHOTGUN", "Pump Shotgun"},
{"WEAPON_PUMPSHOTGUN_MK2", "Pump Shotgun Mk II"}, 
{"WEAPON_SWEEPERSHOTGUN", "Sweeper Shotgun"},
{"WEAPON_SAWNOFFSHOTGUN", "Sawed-Off Shotgun"},
{"WEAPON_BULLPUPSHOTGUN", "Bullpup Shotgun"},
{"WEAPON_ASSAULTSHOTGUN", "Assault Shotgun"},
{"WEAPON_MUSKET", "Musket"},
{"WEAPON_HEAVYSHOTGUN", "Heavy Shotgun"},
{"WEAPON_DBSHOTGUN", "Double Barrel Shotgun"}
}

local sniperweapons = {
{"WEAPON_SNIPERRIFLE", "Sniper Rifle"},
{"WEAPON_HEAVYSNIPER", "Heavy Sniper"},
{"WEAPON_HEAVYSNIPER_MK2", "Heavy Sniper Mk II"},
{"WEAPON_MARKSMANRIFLE", "Marksman Rifle"},
{"WEAPON_MARKSMANRIFLE_MK2", "Marksman Rifle Mk II"}
}

local heavyweapons = {
{"WEAPON_GRENADELAUNCHER", "Grenade Launcher"},
{"WEAPON_RPG", "RPG"},
{"WEAPON_MINIGUN", "Minigun"},
{"WEAPON_FIREWORK", "Firework Launcher"},
{"WEAPON_RAILGUN", "Railgun"},
{"WEAPON_HOMINGLAUNCHER", "Homing Launcher"},
{"WEAPON_COMPACTLAUNCHER", "Compact Grenade Launcher"},
{"WEAPON_RAYMINIGUN", "Widowmaker"}
}
-- END WEAPONS LISTS

-- VEHICLES LISTS

local compacts = {
"BLISTA",
"BRIOSO",
"DILETTANTE",
"DILETTANTE2",
"ISSI2",
"ISSI3",
"ISSI4",
"ISSI5",
"ISSI6",
"PANTO",
"PRAIRIE",
"RHAPSODY"
}

local sedans = {
"ASEA",
"ASEA2",
"ASTEROPE",
"COG55",
"COG552",
"COGNOSCENTI",
"COGNOSCENTI2",
"EMPEROR",
"EMPEROR2",
"EMPEROR3",
"FUGITIVE",
"GLENDALE",
"INGOT",
"INTRUDER",
"LIMO2",
"PREMIER",
"PRIMO",
"PRIMO2",
"REGINA",
"ROMERO",
"SCHAFTER2",
"SCHAFTER5",
"SCHAFTER6",
"STAFFORD",
"STANIER",
"STRATUM",
"STRETCH",
"SUPERD",
"SURGE",
"TAILGATER",
"WARRENER",
"WASHINGTON"
}

local suvs = {
"BALLER",
"BALLER2",
"BALLER3",
"BALLER4",
"BALLER5",
"BALLER6",
"BJXL",
"CAVALCADE",
"CAVALCADE2",
"CONTENDER",
"DUBSTA",
"DUBSTA2",
"FQ2",
"GRANGER",
"GRESLEY",
"HABANERO",
"HUNTLEY",
"LANDSTALKER",
"MESA",
"MESA2",
"PATRIOT",
"PATRIOT2",
"RADI",
"ROCOTO",
"SEMINOLE",
"SERRANO",
"TOROS",
"XLS",
"XLS2"
}

local coupes = {
"COGCABRIO",
"EXEMPLAR",
"F620",
"FELON",
"FELON2",
"JACKAL",
"ORACLE",
"ORACLE2",
"SENTINEL",
"SENTINEL2",
"WINDSOR",
"WINDSOR2",
"ZION",
"ZION2"
}

local muscle = {
"BLADE",
"BUCCANEER",
"BUCCANEER2",
"CHINO",
"CHINO2",
"CLIQUE",
"COQUETTE3",
"DEVIANT",
"DOMINATOR",
"DOMINATOR2",
"DOMINATOR3",
"DOMINATOR4",
"DOMINATOR5",
"DOMINATOR6",
"DUKES",
"DUKES2",
"ELLIE",
"FACTION",
"FACTION2",
"FACTION3",
"GAUNTLET",
"GAUNTLET2",
"HERMES",
"HOTKNIFE",
"HUSTLER",
"IMPALER",
"IMPALER2",
"IMPALER3",
"IMPALER4",
"IMPERATOR",
"IMPERATOR2",
"IMPERATOR3",
"LURCHER",
"MOONBEAM",
"MOONBEAM2",
"NIGHTSHADE",
"PHOENIX",
"PICADOR",
"RATLOADER",
"RATLOADER2",
"RUINER",
"RUINER2",
"RUINER3",
"SABREGT",
"SABREGT2",
"SLAMVAN",
"SLAMVAN2",
"SLAMVAN3",
"SLAMVAN4",
"SLAMVAN5",
"SLAMVAN6",
"STALION",
"STALION2",
"TAMPA",
"TAMPA3",
"TULIP",
"VAMOS",
"VIGERO",
"VIRGO",
"VIRGO2",
"VIRGO3",
"VOODOO",
"VOODOO2",
"YOSEMITE"
}

local sportsclassics = {
"ARDENT",
"BTYPE",
"BTYPE2",
"BTYPE3",
"CASCO",
"CHEBUREK",
"CHEETAH2",
"COQUETTE2",
"DELUXO",
"FAGALOA",
"FELTZER3",
"GT500",
"INFERNUS2",
"JB700",
"JESTER3",
"MAMBA",
"MANANA",
"MICHELLI",
"MONROE",
"PEYOTE",
"PIGALLE",
"RAPIDGT3",
"RETINUE",
"SAVESTRA",
"STINGER",
"STINGERGT",
"STROMBERG",
"SWINGER",
"TORERO",
"TORNADO",
"TORNADO2",
"TORNADO3",
"TORNADO4",
"TORNADO5",
"TORNADO6",
"TURISMO2",
"VISERIS",
"Z190",
"ZTYPE"
}

local sports = {
"ALPHA",
"BANSHEE",
"BESTIAGTS",
"BLISTA2",
"BLISTA3",
"BUFFALO",
"BUFFALO2",
"BUFFALO3",
"CARBONIZZARE",
"COMET2",
"COMET3",
"COMET4",
"COMET5",
"COQUETTE",
"ELEGY",
"ELEGY2",
"FELTZER2",
"FLASHGT",
"FUROREGT",
"FUSILADE",
"FUTO",
"GB200",
"HOTRING",
"ITALIGTO",
"JESTER",
"JESTER2",
"KHAMELION",
"KURUMA",
"KURUMA2",
"LYNX",
"MASSACRO",
"MASSACRO2",
"NEON",
"NINEF",
"NINEF2",
"OMNIS",
"PARIAH",
"PENUMBRA",
"RAIDEN",
"RAPIDGT",
"RAPIDGT2",
"RAPTOR",
"REVOLTER",
"RUSTON",
"SCHAFTER2",
"SCHAFTER3",
"SCHAFTER4",
"SCHAFTER5",
"SCHLAGEN",
"SCHWARZER",
"SENTINEL3",
"SEVEN70",
"SPECTER",
"SPECTER2",
"SULTAN",
"SURANO",
"TAMPA2",
"TROPOS",
"VERLIERER2",
"ZR380",
"ZR3802",
"ZR3803"
}

local super = {
"ADDER",
"AUTARCH",
"BANSHEE2",
"BULLET",
"CHEETAH",
"CYCLONE",
"DEVESTE",
"ENTITYXF",
"ENTITY2",
"FMJ",
"GP1",
"INFERNUS",
"ITALIGTB",
"ITALIGTB2",
"LE7B",
"NERO",
"NERO2",
"OSIRIS",
"PENETRATOR",
"PFISTER811",
"PROTOTIPO",
"REAPER",
"SC1",
"SCRAMJET",
"SHEAVA",
"SULTANRS",
"T20",
"TAIPAN",
"TEMPESTA",
"TEZERACT",
"TURISMOR",
"TYRANT",
"TYRUS",
"VACCA",
"VAGNER",
"VIGILANTE",
"VISIONE",
"VOLTIC",
"VOLTIC2",
"XA21",
"ZENTORNO"
}

local motorcycles = {
"AKUMA",
"AVARUS",
"BAGGER",
"BATI",
"BATI2",
"BF400",
"CARBONRS",
"CHIMERA",
"CLIFFHANGER",
"DAEMON",
"DAEMON2",
"DEFILER",
"DEATHBIKE",
"DEATHBIKE2",
"DEATHBIKE3",
"DIABLOUS",
"DIABLOUS2",
"DOUBLE",
"ENDURO",
"ESSKEY",
"FAGGIO",
"FAGGIO2",
"FAGGIO3",
"FCR",
"FCR2",
"GARGOYLE",
"HAKUCHOU",
"HAKUCHOU2",
"HEXER",
"INNOVATION",
"LECTRO",
"MANCHEZ",
"NEMESIS",
"NIGHTBLADE",
"OPPRESSOR",
"OPPRESSOR2",
"PCJ",
"RATBIKE",
"RUFFIAN",
"SANCHEZ",
"SANCHEZ2",
"SANCTUS",
"SHOTARO",
"SOVEREIGN",
"THRUST",
"VADER",
"VINDICATOR",
"VORTEX",
"WOLFSBANE",
"ZOMBIEA",
"ZOMBIEB"
}

local offroad = {
"BFINJECTION",
"BIFTA",
"BLAZER",
"BLAZER2",
"BLAZER3",
"BLAZER4",
"BLAZER5",
"BODHI2",
"BRAWLER",
"BRUISER",
"BRUISER2",
"BRUISER3",
"BRUTUS",
"BRUTUS2",
"BRUTUS3",
"CARACARA",
"DLOADER",
"DUBSTA3",
"DUNE",
"DUNE2",
"DUNE3",
"DUNE4",
"DUNE5",
"FREECRAWLER",
"INSURGENT",
"INSURGENT2",
"INSURGENT3",
"KALAHARI",
"KAMACHO",
"MARSHALL",
"MENACER",
"MESA3",
"MONSTER",
"MONSTER3",
"MONSTER4",
"MONSTER5",
"NIGHTSHARK",
"RANCHERXL",
"RANCHERXL2",
"RCBANDITO",
"REBEL",
"REBEL2",
"RIATA",
"SANDKING",
"SANDKING2",
"TECHNICAL",
"TECHNICAL2",
"TECHNICAL3",
"TROPHYTRUCK",
"TROPHYTRUCK2"
}

local industrial = {
"BULLDOZER",
"CUTTER",
"DUMP",
"FLATBED",
"GUARDIAN",
"HANDLER",
"MIXER",
"MIXER2",
"RUBBLE",
"TIPTRUCK",
"TIPTRUCK2"
}

local utility = {
"AIRTUG",
"CADDY",
"CADDY2",
"CADDY3",
"DOCKTUG",
"FORKLIFT",
"TRACTOR2",
"TRACTOR3",
"MOWER",
"RIPLEY",
"SADLER",
"SADLER2",
"SCRAP",
"TOWTRUCK",
"TOWTRUCK2",
"TRACTOR",
"UTILLITRUCK",
"UTILLITRUCK2",
"UTILLITRUCK3",
"ARMYTRAILER",
"ARMYTRAILER2",
"FREIGHTTRAILER",
"ARMYTANKER",
"TRAILERLARGE",
"DOCKTRAILER",
"TR3",
"TR2",
"TR4",
"TRFLAT",
"TRAILERS",
"TRAILERS4",
"TRAILERS2",
"TRAILERS3",
"TVTRAILER",
"TRAILERLOGS",
"TANKER",
"TANKER2",
"BALETRAILER",
"GRAINTRAILER",
"BOATTRAILER",
"RAKETRAILER",
"TRAILERSMALL"
}

local vans = {
"BISON",
"BISON2",
"BISON3",
"BOBCATXL",
"BOXVILLE",
"BOXVILLE2",
"BOXVILLE3",
"BOXVILLE4",
"BOXVILLE5",
"BURRITO",
"BURRITO2",
"BURRITO3",
"BURRITO4",
"BURRITO5",
"CAMPER",
"GBURRITO",
"GBURRITO2",
"JOURNEY",
"MINIVAN",
"MINIVAN2",
"PARADISE",
"PONY",
"PONY2",
"RUMPO",
"RUMPO2",
"RUMPO3",
"SPEEDO",
"SPEEDO2",
"SPEEDO4",
"SURFER",
"SURFER2",
"TACO",
"YOUGA",
"YOUGA2"
}

local cycles = {
"BMX",
"CRUISER",
"FIXTER",
"SCORCHER",
"TRIBIKE",
"TRIBIKE2",
"TRIBIKE3"
}

local boats = {
"DINGHY",
"DINGHY2",
"DINGHY3",
"DINGHY4",
"JETMAX",
"MARQUIS",
"PREDATOR",
"SEASHARK",
"SEASHARK2",
"SEASHARK3",
"SPEEDER",
"SPEEDER2",
"SQUALO",
"SUBMERSIBLE",
"SUBMERSIBLE2",
"SUNTRAP",
"TORO",
"TORO2",
"TROPIC",
"TROPIC2",
"TUG"
}

local helicopters = {
"AKULA",
"ANNIHILATOR",
"BUZZARD",
"BUZZARD2",
"CARGOBOB",
"CARGOBOB2",
"CARGOBOB3",
"CARGOBOB4",
"FROGGER",
"FROGGER2",
"HAVOK",
"HUNTER",
"MAVERICK",
"POLMAV",
"SAVAGE",
"SEASPARROW",
"SKYLIFT",
"SUPERVOLITO",
"SUPERVOLITO2",
"SWIFT",
"SWIFT2",
"VALKYRIE",
"VALKYRIE2",
"VOLATUS"
}


local planes = {
"ALPHAZ1",
"AVENGER",
"AVENGER2",
"BESRA",
"BLIMP",
"BLIMP2",
"BLIMP3",
"BOMBUSHKA",
"CARGOPLANE",
"CUBAN800",
"DODO",
"DUSTER",
"HOWARD",
"HYDRA",
"JET",
"LAZER",
"LUXOR",
"LUXOR2",
"MAMMATUS",
"MICROLIGHT",
"MILJET",
"MOGUL",
"MOLOTOK",
"NIMBUS",
"NOKOTA",
"PYRO",
"ROGUE",
"SEABREEZE",
"SHAMAL",
"STARLING",
"STRIKEFORCE",
"STUNT",
"TITAN",
"TULA",
"VELUM",
"VELUM2",
"VESTRA",
"VOLATOL"
}

local service = {
"AIRBUS",
"BRICKADE",
"BUS",
"COACH",
"PBUS2",
"RALLYTRUCK",
"RENTALBUS",
"TAXI",
"TOURBUS",
"TRASH",
"TRASH2",
"WASTELANDER",
"AMBULANCE",
"FBI",
"FBI2",
"FIRETRUK",
"LGUARD",
"PBUS",
"POLICE",
"POLICE2",
"POLICE3",
"POLICE4",
"POLICEB",
"POLICEOLD1",
"POLICEOLD2",
"POLICET",
"POLMAV",
"PRANGER",
"PREDATOR",
"RIOT",
"RIOT2",
"SHERIFF",
"SHERIFF2",
"APC",
"BARRACKS",
"BARRACKS2",
"BARRACKS3",
"BARRAGE",
"CHERNOBOG",
"CRUSADER",
"HALFTRACK",
"KHANJALI",
"RHINO",
"SCARAB",
"SCARAB2",
"SCARAB3",
"THRUSTER",
"TRAILERSMALL2"
}

local commercial = {
"BENSON",
"BIFF",
"CERBERUS",
"CERBERUS2",
"CERBERUS3",
"HAULER",
"HAULER2",
"MULE",
"MULE2",
"MULE3",
"MULE4",
"PACKER",
"PHANTOM",
"PHANTOM2",
"PHANTOM3",
"POUNDER",
"POUNDER2",
"STOCKADE",
"STOCKADE3",
"TERBYTE",
"CABLECAR",
"FREIGHT",
"FREIGHTCAR",
"FREIGHTCONT1",
"FREIGHTCONT2",
"FREIGHTGRAIN",
"METROTRAIN",
"TANKERCAR"
}

-- END VEHICLES LISTS

-- VEHICLE MODS LIST (this is going to take a while...)

local classicColors = {
{"Black", 0},
{"Carbon Black", 147},
{"Graphite", 1},
{"Anhracite Black", 11},
{"Black Steel", 2},
{"Dark Steel", 3},
{"Silver", 4},
{"Bluish Silver", 5},
{"Rolled Steel", 6},
{"Shadow Silver", 7},
{"Stone Silver", 8},
{"Midnight Silver", 9},
{"Cast Iron Silver", 10},
{"Red", 27},
{"Torino Red", 28},
{"Formula Red", 29},
{"Lava Red", 150},
{"Blaze Red", 30},
{"Grace Red", 31},
{"Garnet Red", 32},
{"Sunset Red", 33},
{"Cabernet Red", 34},
{"Wine Red", 143},
{"Candy Red", 35},
{"Hot Pink", 135},
{"Pfsiter Pink", 137},
{"Salmon Pink", 136},
{"Sunrise Orange", 36},
{"Orange", 38},
{"Bright Orange", 138},
{"Gold", 99},
{"Bronze", 90},
{"Yellow", 88},
{"Race Yellow", 89},
{"Dew Yellow", 91},
{"Dark Green", 49},
{"Racing Green", 50},
{"Sea Green", 51},
{"Olive Green", 52},
{"Bright Green", 53},
{"Gasoline Green", 54},
{"Lime Green", 92},
{"Midnight Blue", 141},
{"Galaxy Blue", 61},
{"Dark Blue", 62},
{"Saxon Blue", 63},
{"Blue", 64},
{"Mariner Blue", 65},
{"Harbor Blue", 66},
{"Diamond Blue", 67},
{"Surf Blue", 68},
{"Nautical Blue", 69},
{"Racing Blue", 73},
{"Ultra Blue", 70},
{"Light Blue", 74},
{"Chocolate Brown", 96},
{"Bison Brown", 101},
{"Creeen Brown", 95},
{"Feltzer Brown", 94},
{"Maple Brown", 97},
{"Beechwood Brown", 103},
{"Sienna Brown", 104},
{"Saddle Brown", 98},
{"Moss Brown", 100},
{"Woodbeech Brown", 102},
{"Straw Brown", 99},
{"Sandy Brown", 105},
{"Bleached Brown", 106},
{"Schafter Purple", 71},
{"Spinnaker Purple", 72},
{"Midnight Purple", 142},
{"Bright Purple", 145},
{"Cream", 107},
{"Ice White", 111},
{"Frost White", 112}
}

local matteColors = {
{"Black", 12},
{"Gray", 13},
{"Light Gray", 14},
{"Ice White", 131},
{"Blue", 83},
{"Dark Blue", 82},
{"Midnight Blue", 84},
{"Midnight Purple", 149},
{"Schafter Purple", 148},
{"Red", 39},
{"Dark Red", 40},
{"Orange", 41},
{"Yellow", 42},
{"Lime Green", 55},
{"Green", 128},
{"Forest Green", 151},
{"Foliage Green", 155},
{"Olive Darb", 152},
{"Dark Earth", 153},
{"Desert Tan", 154}
}

local metalColors = {
{"Brushed Steel", 117},
{"Brushed Black Steel", 118},
{"Brushed Aluminum", 119},
{"Chrome", 120},
{"Pure Gold", 158},
{"Brushed Gold", 159}
}

-- END VEHICLE MODS LIST

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["INSERT"] = 121,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118,
  ["MOUSE1"] = 24
}

-- Get ESX shared object
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(c) ESX = c end)
        Citizen.Wait(1000)
    end
end)

function GetPlayers()
    local players = {}

    for i = 0, 63 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

local cL = true
local cM = false
local cN = true
local cO = true
local nameabove = true
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


-- Get vRP object
vRP = {}
vRP = Proxy.getInterface("vRP")

-- Adapted from Force Mod by Ideo - https://www.gta5-mods.com/scripts/force-mod
local function ForceMod()
	ForceTog = not ForceTog

	if ForceTog then

	Citizen.CreateThread(function()
	ShowInfo("Force ~g~ENABLED ~r~\nPress E to use")

	local ForceKey = Keys["E"]
	local Force = 0.5
	local KeyPressed = false
	local KeyTimer = 0
	local KeyDelay = 15
	local ForceEnabled = false
	local StartPush = false

	function forcetick()

	if (KeyPressed) then
		KeyTimer = KeyTimer + 1
		if(KeyTimer >= KeyDelay) then
			KeyTimer = 0
			KeyPressed = false
		end
	end



	if IsControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
		KeyPressed = true
		ForceEnabled = true
	end

	if (StartPush) then

		StartPush = false
		local pid = PlayerPedId()
		local CamRot = GetGameplayCamRot(2)

		local force = 5

		local Fx = -( math.sin(math.rad(CamRot.z)) * force*10 )
		local Fy = ( math.cos(math.rad(CamRot.z)) * force*10 )
		local Fz = force * (CamRot.x*0.2)

		local PlayerVeh = GetVehiclePedIsIn(pid, false)

		for k in EnumerateVehicles() do
			SetEntityInvincible(k, false)
			if IsEntityOnScreen(k) and k ~= PlayerVeh then
				ApplyForceToEntity(k, 1, Fx, Fy,Fz, 0,0,0, true, false, true, true, true, true)
			end
		end

		for k in EnumeratePeds() do
			if IsEntityOnScreen(k) and k ~= pid then
				ApplyForceToEntity(k, 1, Fx, Fy,Fz, 0,0,0, true, false, true, true, true, true)
			end
		end

	end


	if IsControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
		KeyPressed = true
		StartPush = true
		ForceEnabled = false
	end

	if (ForceEnabled) then
		local pid = PlayerPedId()
		local PlayerVeh = GetVehiclePedIsIn(pid, false)

		Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)

		DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 180, 0, 0, 35, false, true, 2, nil, nil, false)

		for k in EnumerateVehicles() do
			SetEntityInvincible(k, true)
			if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
				RequestControlOnce(k)
				FreezeEntityPosition(k, false)
				Oscillate(k, Markerloc, 0.5, 0.3)
			end
		end

		for k in EnumeratePeds() do
			if IsEntityOnScreen(k) and k ~= PlayerPedId() then
				RequestControlOnce(k)
				SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
				FreezeEntityPosition(k, false)
				Oscillate(k, Markerloc, 0.5, 0.3)
			end
		end

	end

	end

	while ForceTog do forcetick() Wait(0) end
end)
else ShowInfo("Force ~r~Disabled") end

end

-- Some functions adapted from MenyooSP (Massive Headache) - https://github.com/MAFINS/MenyooSP
-- MENYOO/CAMERA FUNCTIONS
function GetSeatPedIsIn(ped)
	if not IsPedInAnyVehicle(ped, false) then return
	else
		veh = GetVehiclePedIsIn(ped)
		for i=0, GetVehicleMaxNumberOfPassengers(veh) do
			if GetPedInVehicleSeat(veh) then return i end
		end
	end
end

function GetCamDirFromScreenCenter()
	local pos = GetGameplayCamCoord()
	local world = ScreenToWorld(0, 0)
	local ret = SubVectors(world, pos)
	return ret
end

function GenerateRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000
    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
    return result
end


function ScreenToWorld(screenCoord)
	local camRot = GetGameplayCamRot(2)
	local camPos = GetGameplayCamCoord()

	local vect2x = 0.0
	local vect2y = 0.0
	local vect21y = 0.0
	local vect21x = 0.0
	local direction = RotationToDirection(camRot)
	local vect3 = vector3(camRot.x + 10.0, camRot.y + 0.0, camRot.z + 0.0)
	local vect31 = vector3(camRot.x - 10.0, camRot.y + 0.0, camRot.z + 0.0)
	local vect32 = vector3(camRot.x, camRot.y + 0.0, camRot.z + -10.0)

	local direction1 = RotationToDirection(vector3(camRot.x, camRot.y + 0.0, camRot.z + 10.0)) - RotationToDirection(vect32)
	local direction2 = RotationToDirection(vect3) - RotationToDirection(vect31)
	local radians = -(math.rad(camRot.y))

	vect33 = (direction1 * math.cos(radians)) - (direction2 * math.sin(radians))
	vect34 = (direction1 * math.sin(radians)) - (direction2 * math.cos(radians))

	local case1, x1, y1 = WorldToScreenRel(((camPos + (direction * 10.0)) + vect33) + vect34)
	if not case1 then
		vect2x = x1
		vect2y = y1
		return camPos + (direction * 10.0)
	end

	local case2, x2, y2 = WorldToScreenRel(camPos + (direction * 10.0))
	if not case2 then
		vect21x = x2
		vect21y = y2
		return camPos + (direction * 10.0)
	end

	if math.abs(vect2x - vect21x) < 0.001 or math.abs(vect2y - vect21y) < 0.001 then
		return camPos + (direction * 10.0)
	end

	local x = (screenCoord.x - vect21x) / (vect2x - vect21x)
	local y = (screenCoord.y - vect21y) / (vect2y - vect21y)
	return ((camPos + (direction * 10.0)) + (vect33 * x)) + (vect34 * y)

end

function WorldToScreenRel(worldCoords)
	local check, x, y = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)
	if not check then
		return false
	end

	screenCoordsx = (x - 0.5) * 2.0
	screenCoordsy = (y - 0.5) * 2.0
	return true, screenCoordsx, screenCoordsy
end

function RotationToDirection(rotation)
	local retz = math.rad(rotation.z)
	local retx = math.rad(rotation.x)
	local absx = math.abs(math.cos(retx))
	return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function GetCamDirection()
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

-- END MENYOO/CAMERA FUNCTIONS

-- MENYOO/ENTITY FUNCTIONS

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
		tick = tick+1
		Wait(0)
	end
	return tick <= 12
	end)
end

function Oscillate(entity, position, angleFreq, dampRatio)
	local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq*angleFreq))
	local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
	local targetPos = SubVectors(pos1, pos2)

	ApplyForce(entity, targetPos)
end

-- END MENYOO/ENTITY FUNCTIONS

-- DRAWING FUNCTIONS

function ShowMPMessage(message, subtitle, ms)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		function Initialize(scaleform)
				local scaleform = RequestScaleformMovie(scaleform)
				while not HasScaleformMovieLoaded(scaleform) do
						Citizen.Wait(0)
				end
				PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
				PushScaleformMovieFunctionParameterString(message)
				PushScaleformMovieFunctionParameterString(subtitle)
				PopScaleformMovieFunctionVoid()
				Citizen.SetTimeout(6500, function()
						PushScaleformMovieFunction(scaleform, "SHARD_ANIM_OUT")
						PushScaleformMovieFunctionParameterInt(1)
						PushScaleformMovieFunctionParameterFloat(0.33)
						PopScaleformMovieFunctionVoid()
						Citizen.SetTimeout(3000, function() EndScaleformMovieMethod() end)
				end)
				return scaleform
		end

		scaleform = Initialize("mp_big_message_freemode")

		while true do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 150, 0)
		end
	end)
end

function ShowInfo(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, false)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

-- END DRAWING FUNCTIONS

-- UTILITY FUNCTIONS

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
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

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function AddVectors(vect1, vect2)
	return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end

function SubVectors(vect1, vect2)
	return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

function ScaleVector(vect, mult)
	return vector3(vect.x*mult, vect.y*mult, vect.z*mult)
end


local function GetKeyboardInput()
	DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
		-- Dont crash the menu when user hits esc
		if IsDisabledControlPressed(0, Keys["ESC"]) then return "" end
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
		return result
    end
end

-- END UTILITY FUNCTIONS

-- MENU FUNCTIONS

local function SpectatePlayer(id)
	spectating = not spectating
	local player = GetPlayerPed(id)
	if spectating then
		RequestCollisionAtCoord(GetEntityCoords(player))
		NetworkSetInSpectatorMode(true, player)
	else
		RequestCollisionAtCoord(GetEntityCoords(player))
		NetworkSetInSpectatorMode(false, player)
	end
end

local function FixVeh(veh)
	SetVehicleEngineHealth(veh, 1000)
	SetVehicleFixed(veh)
end

local function ExplodePlayer(target)
	local ped = GetPlayerPed(target)
	local coords = GetEntityCoords(ped)
	AddExplosion(coords.x+1, coords.y+1, coords.z+1, 4, 100.0, true, false, 0.0)
end

local function ExplodeAll(self)
	local plist = GetActivePlayers()
	for i=0, #plist do
		if not self and i == PlayerId() then i=i+1 end
		ExplodePlayer(i)
	end
end

-- Thanks to Fallen#0811 for the idea
local function PedAttack(target, attackType)
	local coords = GetEntityCoords(GetPlayerPed(target))
	
	if attackType == 1 then weparray = allweapons
	elseif attackType == 2 then weparray = meleeweapons
	elseif attackType == 3 then weparray = pistolweapons
	elseif attackType == 4 then weparray = heavyweapons
	end
	
	for k in EnumeratePeds() do
		if k ~= GetPlayerPed(target) and not IsPedAPlayer(k) and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) < 2000 then
			local rand = math.ceil(math.random(#weparray))
			if weparray ~= allweapons then GiveWeaponToPed(k, GetHashKey(weparray[rand][1]), 9999, 0, 1)
			else GiveWeaponToPed(k, GetHashKey(weparray[rand]), 9999, 0, 1) end
			ClearPedTasks(k)
			TaskCombatPed(k, GetPlayerPed(target), 0, 16)
			SetPedCombatAbility(k, 100)
			SetPedCombatRange(k, 2)
			SetPedCombatAttributes(k, 46, 1)
			SetPedCombatAttributes(k, 5, 1)
		end
	end
end

-- Rocket functions unused
--[[
local function RocketPlayer(target, force)
	ClearPedTasksImmediately(GetPlayerPed(target))
	RequestControlOnce(GetPlayerPed(target))
	ApplyForceToEntity(GetPlayerPed(target), 3, 0, 0, force, 0, 0, 0, 0, false, true, true, false, true)
end

local function RocketAllPlayers(self)
	local plist = GetActivePlayers()
	for i=0, #plist do
		if not self and i == PlayerId() then i=i+1 end
		RequestControlOnce(GetPlayerPed(plist[i]))
		ApplyForceToEntity(GetPlayerPed(plist[i]), 3, 0, 0, 15.0, 0, 0, 0, 0, false, true, true, false, true)
	end
end
]]

--[[ OLD FORCEFIELD (Might still be useful at some point?)
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
]]


-- Adapted from Shockwave by scmorio - https://www.gta5-mods.com/scripts/shockwave
function ApplyShockwave(entity)
	local pos = GetEntityCoords(PlayerPedId())
	local coord=GetEntityCoords(entity)
	local dx=coord.x - pos.x
	local dy=coord.y - pos.y
	local dz=coord.z - pos.z
	local distance=math.sqrt(dx*dx+dy*dy+dz*dz)
	local distanceRate=(50/distance)*math.pow(1.04,1-distance)
	ApplyForceToEntity(entity, 1, distanceRate*dx,distanceRate*dy,distanceRate*dz, math.random()*math.random(-1,1),math.random()*math.random(-1,1),math.random()*math.random(-1,1), true, false, true, true, true, true)
end

local function DoForceFieldTick(radius)
		local player = PlayerPedId()
		local coords = GetEntityCoords(PlayerPedId())
		local playerVehicle = GetPlayersLastVehicle()
		local inVehicle=IsPedInVehicle(player,playerVehicle,true)

		DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, radius, radius, radius, 180, 80, 0, 35, false, true, 2, nil, nil, false)

		for k in EnumerateVehicles() do
			if (not inVehicle or k ~= playerVehicle) and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) <= radius*1.2 then
				RequestControlOnce(k)
				ApplyShockwave(k)
			end
		end

		for k in EnumeratePeds() do
			if k~= PlayerPedId() and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) <= radius*1.2 then
				RequestControlOnce(k)
				SetPedRagdollOnCollision(k,true)
				SetPedRagdollForceFall(k)
				ApplyShockwave(k)
			end
		end
end

local function DoRapidFireTick()
	DisablePlayerFiring(PlayerPedId(), true)
	if IsDisabledControlPressed(0, Keys["MOUSE1"]) then
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

local function StripPlayer(target)
	local ped = GetPlayerPed(target)
	RemoveAllPedWeapons(ped, false)
end

local function StripAll(self)
	local plist = GetActivePlayers()
	for i=0, #plist do
		if not self and i == PlayerId() then i=i+1 end
		StripPlayer(i)
	end
end

local function KickFromVeh(target)
	local ped = GetPlayerPed(target)
	if IsPedInAnyVehicle(ped, false) then
		ClearPedTasksImmediately(ped)
	end
end

local function KickAllFromVeh(self)
	local plist = GetActivePlayers()
	for i=0, #plist do
		if not self and i == PlayerId() then i=i+1 end
		KickFromVeh(i)
	end
end

local function CancelAnimsAll(self)
	local plist = GetActivePlayers()
	for i=0, #plist do
		if not self and i == PlayerId() then i=i+1 end
		ClearPedTasksImmediately(GetPlayerPed(plist[i]))
	end
end

local function RandomClothes(target)
	local ped = GetPlayerPed(target)
	SetPedRandomComponentVariation(ped, false)
	SetPedRandomProps(ped)
end

local function GiveAllWeapons(target)
	local ped = GetPlayerPed(target)
	for i=0, #allweapons do
		GiveWeaponToPed(ped, GetHashKey(allweapons[i]), 9999, false, false)
	end
end

local function GiveAllPlayersWeapons(self)
	local plist = GetActivePlayers()
	for i=0, #plist do
		if not self and i == PlayerId() then i=i+1 end
		GiveAllWeapons(i)
	end
end

local function GiveWeapon(target, weapon)
	local ped = GetPlayerPed(target)
	GiveWeaponToPed(ped, GetHashKey(weapon), 9999, false, false)
end

local function GiveMaxAmmo(target)
	local ped = GetPlayerPed(target)
	for i=1, #allweapons do
		AddAmmoToPed(ped, GetHashKey(allweapons[i]), 9999)
	end
end

local function TeleportToPlayer(target)
	local ped = GetPlayerPed(target)
	local pos = GetEntityCoords(ped)
	SetEntityCoords(PlayerPedId(), pos)
end

local function RefuelCar()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then
	    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	    FiveM.TriggerCustomEvent(false, 'advancedFuel:setEssence', 100, GetVehicleNumberPlateText(vehicle),
	    GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	    SetVehicleEngineOn(vehicle, true, false, false)
	    SetVehicleUndriveable(vehicle, false)
	end
end 




local function TeleportToWaypoint()  -- TP to Waypoint by samyh89 - https://gist.github.com/samyh89/32a780abcd1eea05ab32a61985857486
	local entity = PlayerPedId()
	if IsPedInAnyVehicle(entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end
	local success = false
	local blipFound = false
	local blipIterator = GetBlipInfoIdIterator()
	local blip = GetFirstBlipInfoId(8)

	while DoesBlipExist(blip) do
		if GetBlipInfoIdType(blip) == 4 then
			cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())) --GetBlipInfoIdCoord(blip)
			blipFound = true
			break
		end
		blip = GetNextBlipInfoId(blipIterator)
		Wait(0)
	end

	if blipFound then
		local groundFound = false
		local yaw = GetEntityHeading(entity)
		
		for i = 0, 1000, 1 do
			SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
			SetEntityRotation(entity, 0, 0, 0, 0 ,0)
			SetEntityHeading(entity, yaw)
			SetGameplayCamRelativeHeading(0)
			Wait(0)
			if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then
				cz = ToFloat(i)
				groundFound = true
				break
			end
		end
		if not groundFound then
			cz = -300.0
		end
		success = true
	else
		ShowInfo('~r~Blip not found')
	end

	if success then
		SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
		SetGameplayCamRelativeHeading(0)
		if IsPedSittingInAnyVehicle(PlayerPedId()) then
			if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
				SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
			end
		end
	end
	
end

local function ToggleGodmode(tog)
	local ped = PlayerPedId()
	SetEntityProofs(ped, tog, tog, tog, tog, tog)
	SetPedCanRagdoll(ped, not tog)
end


local function ToggleNoclip()
	Noclipping = not Noclipping
	if Noclipping then SetEntityVisible(PlayerPedId(), false, false) else
	ClearPedTasksImmediately(PlayerPedId()) SetEntityVisible(PlayerPedId(), true, false) end
end

local function ShootAt(target, bone)
	local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, bone), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), boneTarget, true)
end

local function ShootAt2(target, bone, damage)
	local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, bone), 0.0, 0.0, 0.0)
	local _, weapon = GetCurrentPedWeapon(PlayerPedId())
	ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0,0,0.1)), boneTarget, damage, true, weapon, PlayerPedId(), true, true, 1000.0)
end

local function ShootAimbot(k)
	if IsEntityOnScreen(k) and HasEntityClearLosToEntityInFront(PlayerPedId(), k) and
	not IsPedDeadOrDying(k) and not IsPedInVehicle(k, GetVehiclePedIsIn(k), false) and IsControlPressed(0, Keys["MOUSE1"]) then
		local x,y,z = table.unpack(GetEntityCoords(k))
		local _,_x,_y = World3dToScreen2d(x,y,z)
		if _x > 0.25 and _x < 0.75 and _y > 0.25 and _y < 0.75 then
			local _, weapon = GetCurrentPedWeapon(PlayerPedId())
			ShootAt2(k, "SKEL_HEAD", GetWeaponDamage(weapon, 1))
		end
	end
end

local function RageShoot(target)
	if not IsPedDeadOrDying(target) then
		local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, "SKEL_HEAD"), 0.0, 0.0, 0.0)
		local _, weapon = GetCurrentPedWeapon(PlayerPedId())
		ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0,0,0.1)), boneTarget, 9999, true, weapon, PlayerPedId(), false, false, 1000.0)
		ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0,0.1,0)), boneTarget, 9999, true, weapon, PlayerPedId(), false, false, 1000.0)
		ShootSingleBulletBetweenCoords(AddVectors(boneTarget, vector3(0.1,0,0)), boneTarget, 9999, true, weapon, PlayerPedId(), false, false, 1000.0)
	end
end

local function SpawnVeh(model, PlaceSelf, SpawnEngineOn)
	RequestModel(GetHashKey(model))
	Wait(500)
	if HasModelLoaded(GetHashKey(model)) then
		local coords = GetEntityCoords(PlayerPedId())
		local xf = GetEntityForwardX(PlayerPedId())
		local yf = GetEntityForwardY(PlayerPedId())
		local heading = GetEntityHeading(PlayerPedId())
		local veh = CreateVehicle(GetHashKey(model), coords.x+xf*5, coords.y+yf*5, coords.z, heading, 1, 1)
		if PlaceSelf then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
		if SpawnEngineOn then SetVehicleEngineOn(veh, 1, 1) end
		return veh
	else ShowInfo("~r~Model not recognized (Try Again)") end
end

local function SpawnPlane(model, PlaceSelf, SpawnInAir)
	RequestModel(GetHashKey(model))
	Wait(500)
	if HasModelLoaded(GetHashKey(model)) then
		local coords = GetEntityCoords(PlayerPedId())
		local xf = GetEntityForwardX(PlayerPedId())
		local yf = GetEntityForwardY(PlayerPedId())
		local heading = GetEntityHeading(PlayerPedId())
		local veh = nil
		if SpawnInAir then 
			veh = CreateVehicle(GetHashKey(model), coords.x+xf*20, coords.y+yf*20, coords.z+500, heading, 1, 1)
		else 
			veh = CreateVehicle(GetHashKey(model), coords.x+xf*5, coords.y+yf*5, coords.z, heading, 1, 1) 
		end
		if PlaceSelf then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
	else ShowInfo("~r~Model not recognized (Try Again)") end
end

--[[
0 - Head
1 - Beard
2 - Hair
3 - Torso
4 - Legs
5 - Hands
6 - Foot
7 - None?
8 - Accessories like parachute, scuba tank
9 - Accessories like bags, mask, scuba mask
10- Decals and mask
11 - Auxiliary parts for torso
]]
local function GetCurrentOutfit(target)
	local ped = GetPlayerPed(target)
	outfit = {}
	
	outfit.hat = GetPedPropIndex(ped, 0)
	outfit.hat_texture = GetPedPropTextureIndex(ped, 0)
	
	outfit.glasses = GetPedPropIndex(ped, 1)
	outfit.glasses_texture = GetPedPropTextureIndex(ped, 1)
	
	outfit.ear = GetPedPropIndex(ped, 2)
	outfit.ear_texture = GetPedPropTextureIndex(ped, 2)
	
	outfit.watch = GetPedPropIndex(ped, 6)
	outfit.watch_texture = GetPedPropTextureIndex(ped, 6)
	
	outfit.wrist = GetPedPropIndex(ped, 7)
	outfit.wrist_texture = GetPedPropTextureIndex(ped, 7)
	
	outfit.head_drawable = GetPedDrawableVariation(ped, 0)
	outfit.head_palette = GetPedPaletteVariation(ped, 0)
	outfit.head_texture = GetPedTextureVariation(ped, 0)
	
	outfit.beard_drawable = GetPedDrawableVariation(ped, 1)
	outfit.beard_palette = GetPedPaletteVariation(ped, 1)
	outfit.beard_texture = GetPedTextureVariation(ped, 1)
	
	outfit.hair_drawable = GetPedDrawableVariation(ped, 2)
	outfit.hair_palette = GetPedPaletteVariation(ped, 2)
	outfit.hair_texture = GetPedTextureVariation(ped, 2)
	
	outfit.torso_drawable = GetPedDrawableVariation(ped, 3)
	outfit.torso_palette = GetPedPaletteVariation(ped, 3)
	outfit.torso_texture = GetPedTextureVariation(ped, 3)
	
	outfit.legs_drawable = GetPedDrawableVariation(ped, 4)
	outfit.legs_palette = GetPedPaletteVariation(ped, 4)
	outfit.legs_texture = GetPedTextureVariation(ped, 4)
	
	outfit.hands_drawable = GetPedDrawableVariation(ped, 5)
	outfit.hands_palette = GetPedPaletteVariation(ped, 5)
	outfit.hands_texture = GetPedTextureVariation(ped, 5)
	
	outfit.foot_drawable = GetPedDrawableVariation(ped, 6)
	outfit.foot_palette = GetPedPaletteVariation(ped, 6)
	outfit.foot_texture = GetPedTextureVariation(ped, 6)
	
	outfit.acc1_drawable = GetPedDrawableVariation(ped, 7)
	outfit.acc1_palette = GetPedPaletteVariation(ped, 7)
	outfit.acc1_texture = GetPedTextureVariation(ped, 7)
	
	outfit.acc2_drawable = GetPedDrawableVariation(ped, 8)
	outfit.acc2_palette = GetPedPaletteVariation(ped, 8)
	outfit.acc2_texture = GetPedTextureVariation(ped, 8)
	
	outfit.acc3_drawable = GetPedDrawableVariation(ped, 9)
	outfit.acc3_palette = GetPedPaletteVariation(ped, 9)
	outfit.acc3_texture = GetPedTextureVariation(ped, 9)
	
	outfit.mask_drawable = GetPedDrawableVariation(ped, 10)
	outfit.mask_palette = GetPedPaletteVariation(ped, 10)
	outfit.mask_texture = GetPedTextureVariation(ped, 10)
	
	outfit.aux_drawable = GetPedDrawableVariation(ped, 11)
	outfit.aux_palette = GetPedPaletteVariation(ped, 11) 	
	outfit.aux_texture = GetPedTextureVariation(ped, 11)
	
	return outfit
end

local function SetCurrentOutfit(outfit)
	local ped = PlayerPedId()
	
	SetPedPropIndex(ped, 0, outfit.hat, outfit.hat_texture, 1)
	SetPedPropIndex(ped, 1, outfit.glasses, outfit.glasses_texture, 1)
	SetPedPropIndex(ped, 2, outfit.ear, outfit.ear_texture, 1)
	SetPedPropIndex(ped, 6, outfit.watch, outfit.watch_texture, 1)
	SetPedPropIndex(ped, 7, outfit.wrist, outfit.wrist_texture, 1)
	
	SetPedComponentVariation(ped, 0, outfit.head_drawable, outfit.head_texture, outfit.head_palette)
	SetPedComponentVariation(ped, 1, outfit.beard_drawable, outfit.beard_texture, outfit.beard_palette)
	SetPedComponentVariation(ped, 2, outfit.hair_drawable, outfit.hair_texture, outfit.hair_palette)
	SetPedComponentVariation(ped, 3, outfit.torso_drawable, outfit.torso_texture, outfit.torso_palette)
	SetPedComponentVariation(ped, 4, outfit.legs_drawable, outfit.legs_texture, outfit.legs_palette)
	SetPedComponentVariation(ped, 5, outfit.hands_drawable, outfit.hands_texture, outfit.hands_palette)
	SetPedComponentVariation(ped, 6, outfit.foot_drawable, outfit.foot_texture, outfit.foot_palette)
	SetPedComponentVariation(ped, 7, outfit.acc1_drawable, outfit.acc1_texture, outfit.acc1_palette)
	SetPedComponentVariation(ped, 8, outfit.acc2_drawable, outfit.acc2_texture, outfit.acc2_palette)
	SetPedComponentVariation(ped, 9, outfit.acc3_drawable, outfit.acc3_texture, outfit.acc3_palette)
	SetPedComponentVariation(ped, 10, outfit.mask_drawable, outfit.mask_texture, outfit.mask_palette)
	SetPedComponentVariation(ped, 11, outfit.aux_drawable, outfit.aux_texture, outfit.aux_palette)
end

local function GetResources()
	local resources = {}
	for i=0, GetNumResources() do
		resources[i] = GetResourceByFindIndex(i)
	end
	return resources
end

-- SkidMenu Functions
function WarMenu.SetFont(id, font)
	buttonFont = font
	menus[id].titleFont = font
end

function WarMenu.SetMenuFocusBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, "menuFocusBackgroundColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusBackgroundColor.a})
end

function WarMenu.SetMaxOptionCount(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end

function WarMenu.PopupWindow(x, y, title)
	-- Not yet implemented
end

-- Get colors from https://www.hexcolortool.com/
function WarMenu.SetTheme(id, theme)
	if theme == "basic" then
		WarMenu.SetMenuBackgroundColor(id, 81, 231, 251, 125)
		WarMenu.SetTitleBackgroundColor(id, 92, 212, 249, 80)
		WarMenu.SetTitleColor(id, 92, 212, 249, 230)
		WarMenu.SetMenuSubTextColor(id, 255, 255, 255, 230)
		WarMenu.SetMenuFocusColor(id, 40, 40, 40, 230)
		WarMenu.SetFont(id, 7)
		WarMenu.SetMenuX(id, .75) -- [0.0..1.0] top left corner
		WarMenu.SetMenuY(id, .1) -- [0.0..1.0] top
		WarMenu.SetMenuWidth(id, 0.23) -- 0.23
		WarMenu.SetMaxOptionCount(id, 12) -- 10
		
		titleHeight = 0.11 --0.11
		titleXOffset = 0.5 -- 0.5
		titleYOffset = 0.03 --0.03
		titleSpacing = 2 -- 2
		buttonHeight = 0.038 --0.038
		buttonScale = 0.365 --0.365
		buttonTextXOffset = 0.005 --0.005
		buttonTextYOffset = 0.005 --0.005
		
		themecolor = '~b~'
		themearrow = "+"
	elseif theme == "dark" then
		WarMenu.SetMenuBackgroundColor = GenerateRainbow
		WarMenu.SetTitleBackgroundColor(id, 180, 80, 80, 90)
		WarMenu.SetTitleColor(id, 180, 80, 80, 230)
		WarMenu.SetMenuSubTextColor(id, 255, 255, 255, 230)
		WarMenu.SetMenuFocusColor(id, 40, 40, 40, 230)
		WarMenu.SetFont(id, 1)
		WarMenu.SetMenuX(id, .75)
		WarMenu.SetMenuY(id, .1)
		WarMenu.SetMenuWidth(id, 0.23) -- 0.23
		WarMenu.SetMaxOptionCount(id, 12) -- 10
		
		titleHeight = 0.11 --0.11
		titleXOffset = 0.5 -- 0.5
		titleYOffset = 0.03 --0.03
		titleSpacing = 2 -- 2
		buttonHeight = 0.038 --0.038
		buttonScale = 0.365 --0.365
		buttonTextXOffset = 0.005 --0.005
		buttonTextYOffset = 0.005 --0.005
		
		themecolor = '~r~'
		themearrow = ">"
	elseif theme == "skid" then
		WarMenu.SetMenuBackgroundColor(id, 5, 160, 1, 125)
		WarMenu.SetTitleBackgroundColor(id, 5, 233, 1, 255)
		WarMenu.SetTitleColor(id, 5, 233, 1, 200)
		WarMenu.SetMenuSubTextColor(id, 255, 255, 255, 230)
		WarMenu.SetFont(id, 0)
		WarMenu.SetMenuX(id, .75)
		WarMenu.SetMenuY(id, .1)
		WarMenu.SetMenuWidth(id, 0.23) -- 0.23
		WarMenu.SetMaxOptionCount(id, 12) -- 10
		
		titleHeight = 0.11 --0.11
		titleXOffset = 0.5 -- 0.5
		titleYOffset = 0.03 --0.03
		titleSpacing = 2 -- 2
		buttonHeight = 0.038 --0.038
		buttonScale = 0.365 --0.365
		buttonTextXOffset = 0.005 --0.005
		buttonTextYOffset = 0.005 --0.005
		
		themecolor = '~u~'
		themearrow = "~p~>~u~>"
	elseif theme == "infamous" then
        WarMenu.SetMenuBackgroundColor(id, 17, 0, 201, 80)
        WarMenu.SetTitleBackgroundColor(id, 147, 0, 196, 170)
        WarMenu.SetTitleColor(id, 240, 240, 240, 255)
        WarMenu.SetMenuSubTextColor(id, 240, 240, 240, 255)
        WarMenu.SetMenuFocusBackgroundColor(id, 107, 216, 250, 230)
        WarMenu.SetFont(id, 4)
        WarMenu.SetMenuX(id, .725)
        WarMenu.SetMenuY(id, .1)
		WarMenu.SetMenuWidth(id, 0.25) -- 0.23
		WarMenu.SetMaxOptionCount(id, 12) -- 10
		
		titleHeight = 0.07--0.11
		titleXOffset = 0.2 -- 0.5
		titleYOffset = 0.005 --0.03
		titleScale = 0.7 -- 1.0
		titleSpacing = 1.5
		buttonHeight = 0.033 --0.038
		buttonScale = 0.360 --0.365
		buttonTextXOffset = 0.003 --0.005
		buttonTextYOffset = 0.0025 --0.005
		
        themecolor = "~s~"
		themearrow = ">>"
	end
end

function WarMenu.InitializeTheme()
	for i=1, #menulist do
		WarMenu.SetTheme(menulist[i], theme)
	end
end

-- Texture Handling
Citizen.CreateThread(function()
	local p = 1
	while true do
		if theme == "skid" then -- static effect for skid theme - https://github.com/esc0rtd3w/illicit-sprx/blob/master/main/illicit/textures.h
			if p == 5 then p = 1 else p=p+1 end
			for i=1, #menulist do
				if WarMenu.IsMenuOpened(menulist[i]) then WarMenu.SetTitleBackgroundSprite(menulist[i], 'digitaloverlay', 'static'..p) end
			end
		else -- Base textures
			for i=1, #menulist do WarMenu.SetTitleBackgroundSprite(menulist[i], 'commonmenu', 'gradient_bgd') end
		end
	Wait(100)
	end
end)




--[[
function FloatingSprite(dict, name, x, y, scalex, scaley, r, g, b, a)
	Citizen.CreateThread(function()
		local timer = 0
		while true do
			if WarMenu.IsAnyMenuOpened() then
				if timer < 1000 then timer = timer+1 end

			end
			Wait(0)
		end
	end)
end

-- Sprites
local randx = math.random()%1
local randy = math.random()%1
FloatingSprite('commonmenu', 'mp_specitem_weed', randx, randy, 0.05, 0.05, 20, 200, 20, 200)
]]

-- Initializing
Resources = GetResources()

ResourcesToCheck = {
-- ESX
"es_extended", "esx_dmvschool", "esx_policejob", "",
-- VRP
"vrp", "vrp_trucker", "vrp_TruckerJob"
}

print("\n\nRESOURCES FOUND\n________________\n")
for i=0, #Resources do
	print(Resources[i])
end
print("\n________________\nEND OF RESOURCES\n")


-- MAIN
Citizen.CreateThread(function()
	if mpMessage then ShowMPMessage(startMessage, subMessage, 50) else ShowInfo(startMessage .." ".. subMessage) end
	ShowInfo(motd)

	-- COMBO BOXES
	local currThemeIndex = 1
	local selThemeIndex = 1

	local currNoclipSpeedIndex = 1
	local selNoclipSpeedIndex = 1

	local currForcefieldRadiusIndex = 1
	local selForcefieldRadiusIndex = 1
	
	local currObjIndex = 1
	local selObjIndex = 1

	local currRotationIndex = 3
	local selRotationIndex = 3

	local currDirectionIndex = 1
	local selDirectionIndex = 1

	local Outfits = {}
	local currClothingIndex = 1
	local selClothingIndex = 1
	
	local currGravIndex = 3
	local selGravIndex = 3
	
	local currAttackTypeIndex = 1
	local selAttackTypeIndex = 1

	-- GLOBALS
	local TrackedPlayer = nil

	-- TOGGLES
	local includeself = true
	local Collision = true
	local objVisible = true
	local PlaceSelf = true
	local SpawnInAir = true
	local SpawnEngineOn = true

	-- TABLES
	SpawnedObjects = {}

	-- MAIN MENU
	WarMenu.CreateMenu('skid', menuName..' v'..version)
	WarMenu.SetSubTitle('skid', 'Unknowncheats - Namcoy')

	-- MAIN MENU SUBMENUS
	WarMenu.CreateSubMenu('player', 'skid', 'Player Options')
	WarMenu.CreateSubMenu('self', 'skid', 'Self Options')
	WarMenu.CreateSubMenu('weapon', 'skid', 'Weapon Options')
	WarMenu.CreateSubMenu('vehicle', 'skid', 'Vehicle Options')
	WarMenu.CreateSubMenu('world', 'skid', 'World Options')
	WarMenu.CreateSubMenu('misc', 'skid', 'Misc Options')
	WarMenu.CreateSubMenu('custom', 'skid', 'Custom Options')

	-- PLAYER MENU SUBMENUS
	WarMenu.CreateSubMenu('allplayer', 'player', 'All Players')
	WarMenu.CreateSubMenu('playeroptions', 'player', 'Player Options')

	-- SELF MENU SUBMENUS
	WarMenu.CreateSubMenu('appearance', 'self', 'Appearance Options')

	-- WEAPON MENU SUBMENUS
	WarMenu.CreateSubMenu('weaponspawner', 'weapon', 'Weapon Spawner')
	WarMenu.CreateSubMenu('melee', 'weaponspawner', 'Melee Weapons')
	WarMenu.CreateSubMenu('pistol', 'weaponspawner', 'Pistols')
	WarMenu.CreateSubMenu('smg', 'weaponspawner', 'SMGs / MGs')
	WarMenu.CreateSubMenu('shotgun', 'weaponspawner', 'Shotguns')
	WarMenu.CreateSubMenu('assault', 'weaponspawner', 'Assault Rifles')
	WarMenu.CreateSubMenu('sniper', 'weaponspawner', 'Sniper Rifles')
	WarMenu.CreateSubMenu('thrown', 'weaponspawner', 'Thrown Weapons')
	WarMenu.CreateSubMenu('heavy', 'weaponspawner', 'Heavy Weapons')

	-- VEHICLE MENU SUBMENUS
	WarMenu.CreateSubMenu('vehiclespawner', 'vehicle', 'Vehicle Spawner')
	WarMenu.CreateSubMenu('vehiclemods', 'vehicle', 'Vehicle Mods')
	
	-- VEHICLE SPAWNER MENU
	WarMenu.CreateSubMenu('compacts', 'vehiclespawner', 'Compacts')
	WarMenu.CreateSubMenu('sedans', 'vehiclespawner', 'Sedans')
	WarMenu.CreateSubMenu('suvs', 'vehiclespawner', 'SUVs')
	WarMenu.CreateSubMenu('coupes', 'vehiclespawner', 'Coupes')
	WarMenu.CreateSubMenu('muscle', 'vehiclespawner', 'Muscle')
	WarMenu.CreateSubMenu('sportsclassics', 'vehiclespawner', 'Sports Classics')
	WarMenu.CreateSubMenu('sports', 'vehiclespawner', 'Sports')
	WarMenu.CreateSubMenu('super', 'vehiclespawner', 'Super')
	WarMenu.CreateSubMenu('motorcycles', 'vehiclespawner', 'Motorcycles')
	WarMenu.CreateSubMenu('offroad', 'vehiclespawner', 'Off-Road')
	WarMenu.CreateSubMenu('industrial', 'vehiclespawner', 'Industrial')
	WarMenu.CreateSubMenu('utility', 'vehiclespawner', 'Utility')
	WarMenu.CreateSubMenu('vans', 'vehiclespawner', 'Vans')
	WarMenu.CreateSubMenu('cycles', 'vehiclespawner', 'Cycles')
	WarMenu.CreateSubMenu('boats', 'vehiclespawner', 'Boats')
	WarMenu.CreateSubMenu('helicopters', 'vehiclespawner', 'Helicopters')
	WarMenu.CreateSubMenu('planes', 'vehiclespawner', 'Planes')
	WarMenu.CreateSubMenu('service', 'vehiclespawner', 'Service')
	WarMenu.CreateSubMenu('commercial', 'vehiclespawner', 'Commercial')
	
	-- VEHICLE MODS SUBMENUS
	WarMenu.CreateSubMenu('vehiclecolors', 'vehiclemods', 'Vehicle Colors')
	WarMenu.CreateSubMenu('vehiclecolors_primary', 'vehiclecolors', 'Primary Color')
	WarMenu.CreateSubMenu('vehiclecolors_secondary', 'vehiclecolors', 'Secondary Color')
	
	WarMenu.CreateSubMenu('primary_classic', 'vehiclecolors_primary', 'Classic Colors')
	WarMenu.CreateSubMenu('primary_matte', 'vehiclecolors_primary', 'Matte Colors')
	WarMenu.CreateSubMenu('primary_metal', 'vehiclecolors_primary', 'Metals')
	
	WarMenu.CreateSubMenu('secondary_classic', 'vehiclecolors_secondary', 'Classic Colors')
	WarMenu.CreateSubMenu('secondary_matte', 'vehiclecolors_secondary', 'Matte Colors')
	WarMenu.CreateSubMenu('secondary_metal', 'vehiclecolors_secondary', 'Metals')

	-- WORLD MENU SUBMENUS
	WarMenu.CreateSubMenu('objectspawner', 'world', 'Object Spawner')
	WarMenu.CreateSubMenu('objectlist', 'objectspawner', 'Select To Delete')
	WarMenu.CreateSubMenu('weather', 'world', 'Weather Changer ~r~(CLIENT SIDE)')
	WarMenu.CreateSubMenu('time', 'world', 'Time Changer')

	-- MISC MENU SUBMENUS
	WarMenu.CreateSubMenu('credits', 'misc', 'Credits')

	-- CUSTOM MENU SUBMENUS
	WarMenu.CreateSubMenu('esx', 'custom', 'ESX Options')
	WarMenu.CreateSubMenu('vrp', 'custom', 'vRP Options')
	WarMenu.CreateSubMenu('other', 'custom', 'Other')

	WarMenu.CreateSubMenu('Crasher')

	WarMenu.InitializeTheme()

	while true do

		-- MAIN MENU
		if WarMenu.IsMenuOpened('skid') then
			if WarMenu.MenuButton('Player Options'..themecolor.."   "..themearrow, 'player') then
			elseif WarMenu.MenuButton('Self Options'..themecolor.."   "..themearrow, 'self') then
			elseif WarMenu.MenuButton('Weapon Options'..themecolor.."   "..themearrow, 'weapon') then
			elseif WarMenu.MenuButton('Vehicle Options'..themecolor.."   "..themearrow, 'vehicle') then
			elseif WarMenu.MenuButton('World Options'..themecolor.."   "..themearrow, 'world') then
			elseif WarMenu.MenuButton('Misc Options'..themecolor.."   "..themearrow, 'misc') then
			elseif WarMenu.MenuButton('Custom Options'..themecolor.."   "..themearrow, 'custom') then
			elseif WarMenu.Button('Exit') then WarMenu.CloseMenu()
			elseif WarMenu.Button('~r~Panic (Kill Menu)') then break
			end


		-- PLAYER OPTIONS MENU
		elseif WarMenu.IsMenuOpened('player') then
			if WarMenu.MenuButton('All Players'..themecolor.."   "..themearrow, 'allplayer') then
			else
				local playerlist = GetActivePlayers()
				for i = 1, #playerlist do
					local currPlayer = playerlist[i]
					if WarMenu.MenuButton("ID: ~y~["..GetPlayerServerId(currPlayer).."] ~s~"..GetPlayerName(currPlayer)..themecolor.."   "..themearrow, 'playeroptions') then
					selectedPlayer = currPlayer end
				end
			end


		-- ALL PLAYERS MENU
		elseif WarMenu.IsMenuOpened('allplayer') then
			if WarMenu.CheckBox("Include Self", includeself) then
				includeself = not includeself
			elseif WarMenu.Button("Explode All Players") then
				ExplodeAll(includeself)
			elseif WarMenu.CheckBox("Explode All Players ~r~(LOOP)", ExplodingAll) then
				ExplodingAll = not ExplodingAll
			elseif WarMenu.Button("Give All Players Weapons") then
				GiveAllPlayersWeapons(includeself)
			elseif WarMenu.Button("Strip All Players Weapons") then
				StripAll(includeself)
			elseif WarMenu.Button("Kick All Players From Vehicle") then
				KickAllFromVeh(includeself)
			end


		-- SPECIFIC PLAYER OPTIONS
		elseif WarMenu.IsMenuOpened('playeroptions') then
			if WarMenu.Button("~p~Selected: ".."~y~["..GetPlayerServerId(selectedPlayer).."] ~s~"..GetPlayerName(selectedPlayer)) then
			elseif WarMenu.Button("Spectate Player") then
				SpectatePlayer(selectedPlayer)
			elseif WarMenu.Button("Teleport To Player") then
				TeleportToPlayer(selectedPlayer)
			elseif WarMenu.Button("Revive") then
				TriggerServerEvent('esx_ambulancejob:revive', selectedPlayer)
			elseif WarMenu.CheckBox("Track Player", Tracking) then
				Tracking = not Tracking
				TrackedPlayer = GetPlayerPed(selectedPlayer)
			elseif WarMenu.Button("Give Health") then
				SetEntityHealth(GetPlayerPed(selectedPlayer), 200)
			elseif WarMenu.Button("Give Armor") then
				SetPedArmour(GetPlayerPed(selectedPlayer), 100)
			elseif WarMenu.Button("Explode Player") then
				ExplodePlayer(selectedPlayer)
			elseif WarMenu.CheckBox("Freeze", FreezePlayer) then
				FreezePlayer = not FreezePlayer
			elseif WarMenu.Button("Handcuff") then
				TriggerServerEvent("esx_policejob:handcuff",GetPlayerServerId(selectedPlayer))
			elseif WarMenu.Button("Jail") then
				TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(selectedPlayer),5000,"Jailed")
				TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
			elseif WarMenu.Button("Unjail") then
		        local ped = selectedPlayer
                TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(ped),0)
                TriggerServerEvent("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
			elseif WarMenu.Button("Cancel Animation/Task") then
				ClearPedTasksImmediately(GetPlayerPed(selectedPlayer))
			elseif WarMenu.Button("Nearby Peds Attack Player") then
				PedAttack(selectedPlayer, PedAttackType)
			elseif WarMenu.ComboBox("Ped Attack Type", PedAttackOps, currAttackTypeIndex, selAttackTypeIndex, function(currentIndex, selectedIndex)
					currAttackTypeIndex = currentIndex
					selAttackTypeIndex = currentIndex
					PedAttackType = currentIndex
				end) then
			--elseif WarMenu.MenuButton("Give Weapon"..themecolor.."   "..themearrow, 'weaponspawner') then --It works, but when you back out it puts you in the weapon options menu. (too lazy to fix)
			elseif WarMenu.Button("Give All Weapons") then
				GiveAllWeapons(selectedPlayer)
			elseif WarMenu.Button("Strip Weapons") then
				StripPlayer(selectedPlayer)
			elseif WarMenu.Button("Kick From Vehicle") then
				KickFromVeh(selectedPlayer)
			end


		-- SELF OPTIONS MENU
		elseif WarMenu.IsMenuOpened('self') then
			if WarMenu.MenuButton("Appearance "..themecolor.."   "..themearrow, 'appearance') then
			elseif WarMenu.Button("Heal") then
				CreatePickup(GetHashKey("PICKUP_HEALTH_STANDARD"), GetEntityCoords(GetPlayerPed(-1)))
			elseif WarMenu.Button("Armor") then
				CreatePickup(GetHashKey("PICKUP_ARMOUR_STANDARD"), GetEntityCoords(GetPlayerPed(-1)))
			elseif WarMenu.Button("Revive") then
				TriggerEvent("esx_ambulancejob:revive")
			elseif WarMenu.CheckBox("Stealth Godmode", Godmode) then
				Godmode = not Godmode
				ToggleGodmode(Godmode)
			elseif WarMenu.CheckBox("Demigod Mode", Demigod) then
				Demigod = not Demigod
			elseif WarMenu.CheckBox("Infinite Stamina", InfStamina) then
				InfStamina = not InfStamina
			elseif WarMenu.CheckBox("Invisibility", Invisibility) then
				Invisibility = not Invisibility
				SetEntityVisible(PlayerPedId(), not Invisibility)
			elseif WarMenu.CheckBox("Magneto Mode", ForceTog) then
				ForceMod()
			elseif WarMenu.CheckBox("Forcefield", Forcefield) then
				Forcefield = not Forcefield
			elseif WarMenu.ComboBox("Forcefield Radius", ForcefieldRadiusOps, currForcefieldRadiusIndex, selForcefieldRadiusIndex, function(currentIndex, selectedIndex)
					currForcefieldRadiusIndex = currentIndex
					selForcefieldRadiusIndex = currentIndex
					ForcefieldRadius = ForcefieldRadiusOps[currentIndex]
				end) then
			elseif WarMenu.CheckBox("Noclip", Noclipping) then
				ToggleNoclip()
			elseif WarMenu.ComboBox("Noclip Speed", NoclipSpeedOps, currNoclipSpeedIndex, selNoclipSpeedIndex, function(currentIndex, selectedIndex)
					currNoclipSpeedIndex = currentIndex
					selNoclipSpeedIndex = currentIndex
					NoclipSpeed = NoclipSpeedOps[currNoclipSpeedIndex]
				end) then
			elseif WarMenu.CheckBox("Never Wanted", NeverWanted) then
				NeverWanted = not NeverWanted
			elseif WarMenu.Button("Cancel Animation/Task") then
				ClearPedTasksImmediately(PlayerPedId())
			elseif WarMenu.Button("Suicide") then
				SetEntityHealth(PlayerPedId(), 0)
			end


		-- APPEARANCE MENU
		elseif WarMenu.IsMenuOpened('appearance') then
			if WarMenu.Button("Set Model") then
				local model = GetKeyboardInput()
				RequestModel(GetHashKey(model))
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
				else ShowInfo("~r~Model not recognized (Try Again)") end
			elseif WarMenu.Button("Randomize Clothing") then
				RandomClothes(PlayerId())
			elseif WarMenu.ComboBox("Save Outfit", ClothingSlots, currClothingIndex, selClothingIndex, function(currentIndex, selectedIndex)
					currClothingIndex = currentIndex
					selClothingIndex = currentIndex
				end) then
					Outfits[selClothingIndex] = GetCurrentOutfit(PlayerId())
			elseif WarMenu.ComboBox("Load Outfit", ClothingSlots, currClothingIndex, selClothingIndex, function(currentIndex, selectedIndex)
					currClothingIndex = currentIndex
					selClothingIndex = currentIndex
				end) then
					SetCurrentOutfit(Outfits[selClothingIndex])
	
			end


		-- WEAPON OPTIONS MENU
		elseif WarMenu.IsMenuOpened('weapon') then
			if WarMenu.MenuButton("Give Weapon"..themecolor.."   "..themearrow, 'weaponspawner') then
				selectedPlayer = PlayerId()
			elseif WarMenu.Button("Give All Weapons") then
				GiveAllWeapons(PlayerId())
			elseif WarMenu.Button("Strip All Weapons") then
				StripPlayer(PlayerId())
			elseif WarMenu.Button("Give Max Ammo") then
				GiveMaxAmmo(PlayerId())
			elseif WarMenu.CheckBox("Infinite Ammo", InfAmmo) then
				InfAmmo = not InfAmmo
				SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
			elseif WarMenu.CheckBox("Explosive Ammo", ExplosiveAmmo) then
				ExplosiveAmmo = not ExplosiveAmmo
			elseif WarMenu.CheckBox("Super Damage", SuperDamage) then
				SuperDamage = not SuperDamage
				if SuperDamage then
					local _,wep = GetCurrentPedWeapon(PlayerPedId(), 1)
					SetPlayerWeaponDamageModifier(PlayerId(), 200.0)
				else
					local _,wep = GetCurrentPedWeapon(PlayerPedId(), 1)
					SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
				end
			elseif WarMenu.CheckBox("Rapid Fire", RapidFire) then
				RapidFire = not RapidFire
			elseif WarMenu.CheckBox("Aimbot", Aimbot) then
				Aimbot = not Aimbot
			elseif WarMenu.CheckBox("Draw Aimbot FOV", DrawFov) then
				DrawFov = not DrawFov
			elseif WarMenu.CheckBox("Triggerbot", Triggerbot) then
				Triggerbot = not Triggerbot
			elseif WarMenu.CheckBox("~r~Ragebot", Ragebot) then
				Ragebot = not Ragebot
			end


		-- SPECIFIC WEAPON MENU
		elseif WarMenu.IsMenuOpened('weaponspawner') then
			if WarMenu.MenuButton('Melee Weapons'..themecolor.."   "..themearrow, 'melee') then
			elseif WarMenu.MenuButton('Pistols'..themecolor.."   "..themearrow, 'pistol') then
			elseif WarMenu.MenuButton('SMGs / MGs'..themecolor.."   "..themearrow, 'smg') then
			elseif WarMenu.MenuButton('Shotguns'..themecolor.."   "..themearrow, 'shotgun') then
			elseif WarMenu.MenuButton('Assault Rifles'..themecolor.."   "..themearrow, 'assault') then
			elseif WarMenu.MenuButton('Sniper Rifles'..themecolor.."   "..themearrow, 'sniper') then
			elseif WarMenu.MenuButton('Thrown Weapons'..themecolor.."   "..themearrow, 'thrown') then
			elseif WarMenu.MenuButton('Heavy Weapons'..themecolor.."   "..themearrow, 'heavy') then
		end
		
		-- MELEE WEAPON MENU
		elseif WarMenu.IsMenuOpened('melee') then
			for i=1, #meleeweapons do
				if WarMenu.Button(meleeweapons[i][2]) then
					GiveWeapon(selectedPlayer, meleeweapons[i][1])
				end
			end
		-- PISTOL MENU
		elseif WarMenu.IsMenuOpened('pistol') then
			for i=1, #pistolweapons do
				if WarMenu.Button(pistolweapons[i][2]) then
					GiveWeapon(selectedPlayer, pistolweapons[i][1])
				end
			end
		-- SMG MENU
		elseif WarMenu.IsMenuOpened('smg') then
			for i=1, #smgweapons do
				if WarMenu.Button(smgweapons[i][2]) then
					GiveWeapon(selectedPlayer, smgweapons[i][1])
				end
			end
		-- SHOTGUN MENU
		elseif WarMenu.IsMenuOpened('shotgun') then
			for i=1, #shotgunweapons do
				if WarMenu.Button(shotgunweapons[i][2]) then
					GiveWeapon(selectedPlayer, shotgunweapons[i][1])
				end
			end
		-- ASSAULT RIFLE MENU
		elseif WarMenu.IsMenuOpened('assault') then
			for i=1, #assaultweapons do
				if WarMenu.Button(assaultweapons[i][2]) then
					GiveWeapon(selectedPlayer, assaultweapons[i][1])
				end
			end
		-- SNIPER MENU
		elseif WarMenu.IsMenuOpened('sniper') then
			for i=1, #sniperweapons do
				if WarMenu.Button(sniperweapons[i][2]) then
					GiveWeapon(selectedPlayer, sniperweapons[i][1])
				end
			end
		-- THROWN WEAPON MENU
		elseif WarMenu.IsMenuOpened('thrown') then
			for i=1, #thrownweapons do
				if WarMenu.Button(thrownweapons[i][2]) then
					GiveWeapon(selectedPlayer, thrownweapons[i][1])
				end
			end
		-- HEAVY WEAPON MENU
		elseif WarMenu.IsMenuOpened('heavy') then
			for i=1, #heavyweapons do
				if WarMenu.Button(heavyweapons[i][2]) then
					GiveWeapon(selectedPlayer, heavyweapons[i][1])
				end
			end


		-- VEHICLE OPTIONS MENU
		elseif WarMenu.IsMenuOpened('vehicle') then
			if WarMenu.MenuButton("Vehicle Spawner"..themecolor.."   "..themearrow, 'vehiclespawner') then
			elseif WarMenu.MenuButton("Vehicle Mods"..themecolor.."   "..themearrow, 'vehiclemods') then
			elseif WarMenu.CheckBox("Vehicle Godmode", VehGodmode) then
				VehGodmode	= not VehGodmode
			elseif WarMenu.Button("Repair Vehicle") then
				local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
				FixVeh(veh)
				SetVehicleEngineOn(veh, 1, 1)
			elseif WarMenu.Button("Clean Vehicle") then
				local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
				SetVehicleDirtLevel(veh, 0)
			elseif WarMenu.Button("Delete vehicle") then
				DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
			elseif WarMenu.CheckBox("Collision", Collision) then
				Collision = not Collision
			elseif WarMenu.Button("Refuel Car") then
				RefuelCar()
			elseif WarMenu.CheckBox("Deadly Bulldozer", DeadlyBulldozer) then
				DeadlyBulldozer = not DeadlyBulldozer
				if DeadlyBulldozer then
					local veh = SpawnVeh("BULLDOZER", 1, SpawnEngineOn)
					SetVehicleCanBreak(veh, not DeadlyBulldozer)
					SetVehicleCanBeVisiblyDamaged(veh, not DeadlyBulldozer)
					SetVehicleEnginePowerMultiplier(veh, 2500.0)
					SetVehicleEngineTorqueMultiplier(veh, 2500.0)
					SetVehicleEngineOn(veh, 1, 1, 1)
					SetVehicleGravityAmount(veh, 50.0)
					SetVehicleColours(veh, 27, 27)
					ShowInfo("~r~Go forth and devour thy enemies!\nPress ~w~E ~r~to launch a minion!")
				elseif not DeadlyBulldozer and IsPedInModel(PlayerPedId(), GetHashKey("BULLDOZER")) then
					DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 0))
				end
			end
			
		-- VEHICLE SPAWNER MENU
		elseif WarMenu.IsMenuOpened('vehiclespawner') then
			if WarMenu.Button("Spawn Vehicle By Name") then
				local model = GetKeyboardInput()
				SpawnVeh(model, PlaceSelf, SpawnEngineOn)
			elseif WarMenu.CheckBox("Put Self Into Spawned Vehicle", PlaceSelf) then
				PlaceSelf = not PlaceSelf
			elseif WarMenu.CheckBox("Spawn Planes In Air", SpawnInAir) then
				SpawnInAir = not SpawnInAir
			elseif WarMenu.CheckBox("Spawn Vehicle With Engine : ", SpawnEngineOn) then
				SpawnEngineOn = not SpawnEngineOn
			elseif WarMenu.MenuButton('Compacts'..themecolor.."   "..themearrow, 'compacts') then
			elseif WarMenu.MenuButton('Sedans'..themecolor.."   "..themearrow, 'sedans') then
			elseif WarMenu.MenuButton('SUVs'..themecolor.."   "..themearrow, 'suvs') then
			elseif WarMenu.MenuButton('Coupes'..themecolor.."   "..themearrow, 'coupes') then
			elseif WarMenu.MenuButton('Muscle'..themecolor.."   "..themearrow, 'muscle') then
			elseif WarMenu.MenuButton('Sports Classics'..themecolor.."   "..themearrow, 'sportsclassics') then
			elseif WarMenu.MenuButton('Sports'..themecolor.."   "..themearrow, 'sports') then
			elseif WarMenu.MenuButton('Super'..themecolor.."   "..themearrow, 'super') then
			elseif WarMenu.MenuButton('Motorcycles'..themecolor.."   "..themearrow, 'motorcycles') then
			elseif WarMenu.MenuButton('Off-Road'..themecolor.."   "..themearrow, 'offroad') then
			elseif WarMenu.MenuButton('Industrial'..themecolor.."   "..themearrow, 'industrial') then
			elseif WarMenu.MenuButton('Utility'..themecolor.."   "..themearrow, 'utility') then
			elseif WarMenu.MenuButton('Vans'..themecolor.."   "..themearrow, 'vans') then
			elseif WarMenu.MenuButton('Cycles'..themecolor.."   "..themearrow, 'cycles') then
			elseif WarMenu.MenuButton('Boats'..themecolor.."   "..themearrow, 'boats') then
			elseif WarMenu.MenuButton('Helicopters'..themecolor.."   "..themearrow, 'helicopters') then
			elseif WarMenu.MenuButton('Planes'..themecolor.."   "..themearrow, 'planes') then
			elseif WarMenu.MenuButton('Service/Emergency/Military'..themecolor.."   "..themearrow, 'service') then
			elseif WarMenu.MenuButton('Commercial/Trains'..themecolor.."   "..themearrow, 'commercial') then
			end
		
		-- COMPACTS SPAWNER
		elseif WarMenu.IsMenuOpened('compacts') then
			for i=1, #compacts do
				local vehname = GetLabelText(compacts[i])
				if vehname == "NULL" then vehname = compacts[i] end -- Avoid getting NULL (for some reason GetLabelText returns null for some vehs)
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(compacts[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- SEDANS SPAWNER
		elseif WarMenu.IsMenuOpened('sedans') then
			for i=1, #sedans do
				local vehname = GetLabelText(sedans[i])
				if vehname == "NULL" then vehname = sedans[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(sedans[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- SUVs SPAWNER
		elseif WarMenu.IsMenuOpened('suvs') then
			for i=1, #suvs do
				local vehname = GetLabelText(suvs[i])
				if vehname == "NULL" then vehname = suvs[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(suvs[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- COUPES SPAWNER
		elseif WarMenu.IsMenuOpened('coupes') then
			for i=1, #coupes do
				local vehname = GetLabelText(coupes[i])
				if vehname == "NULL" then vehname = coupes[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(coupes[i], PlaceSelf, SpawnEngineOn)
				end
			end

		-- MUSCLE SPAWNER
		elseif WarMenu.IsMenuOpened('muscle') then
			for i=1, #muscle do
				local vehname = GetLabelText(muscle[i])
				if vehname == "NULL" then vehname = muscle[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(muscle[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- SPORTSCLASSICS SPAWNER
		elseif WarMenu.IsMenuOpened('sportsclassics') then
			for i=1, #sportsclassics do
				local vehname = GetLabelText(sportsclassics[i])
				if vehname == "NULL" then vehname = sportsclassics[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(sportsclassics[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- SPORTS SPAWNER
		elseif WarMenu.IsMenuOpened('sports') then
			for i=1, #sports do
				local vehname = GetLabelText(sports[i])
				if vehname == "NULL" then vehname = sports[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(sports[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- SUPER SPAWNER
		elseif WarMenu.IsMenuOpened('super') then
			for i=1, #super do
				local vehname = GetLabelText(super[i])
				if vehname == "NULL" then vehname = super[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(super[i], PlaceSelf, SpawnEngineOn)
				end
			end
		
		-- MOTORCYCLES SPAWNER
		elseif WarMenu.IsMenuOpened('motorcycles') then
			for i=1, #motorcycles do
				local vehname = GetLabelText(motorcycles[i])
				if vehname == "NULL" then vehname = motorcycles[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(motorcycles[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- OFFROAD SPAWNER
		elseif WarMenu.IsMenuOpened('offroad') then
			for i=1, #offroad do
				local vehname = GetLabelText(offroad[i])
				if vehname == "NULL" then vehname = offroad[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(offroad[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- INDUSTRIAL SPAWNER
		elseif WarMenu.IsMenuOpened('industrial') then
			for i=1, #industrial do
				local vehname = GetLabelText(industrial[i])
				if vehname == "NULL" then vehname = industrial[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(industrial[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- UTILITY SPAWNER
		elseif WarMenu.IsMenuOpened('utility') then
			for i=1, #utility do
				local vehname = GetLabelText(utility[i])
				if vehname == "NULL" then vehname = utility[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(utility[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- VANS SPAWNER
		elseif WarMenu.IsMenuOpened('vans') then
			for i=1, #vans do
				local vehname = GetLabelText(vans[i])
				if vehname == "NULL" then vehname = vans[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(vans[i], PlaceSelf, SpawnEngineOn)
				end
			end
		
		-- CYCLES SPAWNER
		elseif WarMenu.IsMenuOpened('cycles') then
			for i=1, #cycles do
				local vehname = GetLabelText(cycles[i])
				if vehname == "NULL" then vehname = cycles[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(cycles[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- BOATS SPAWNER
		elseif WarMenu.IsMenuOpened('boats') then
			for i=1, #boats do
				local vehname = GetLabelText(boats[i])
				if vehname == "NULL" then vehname = boats[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(boats[i], PlaceSelf, SpawnEngineOn)
				end
			end
		
		-- HELICOPTERS SPAWNER
		elseif WarMenu.IsMenuOpened('helicopters') then
			for i=1, #helicopters do
				local vehname = GetLabelText(helicopters[i])
				if vehname == "NULL" then vehname = helicopters[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(helicopters[i], PlaceSelf, SpawnEngineOn)
				end
			end
	
		-- PLANES SPAWNER
		elseif WarMenu.IsMenuOpened('planes') then
			for i=1, #planes do
				local vehname = GetLabelText(planes[i])
				if vehname == "NULL" then vehname = planes[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnPlane(planes[i], PlaceSelf, SpawnInAir)
				end
			end
			
		-- SERVICE SPAWNER
		elseif WarMenu.IsMenuOpened('service') then
			for i=1, #service do
				local vehname = GetLabelText(service[i])
				if vehname == "NULL" then vehname = service[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(service[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- COMMERCIAL SPAWNER
		elseif WarMenu.IsMenuOpened('commercial') then
			for i=1, #commercial do
				local vehname = GetLabelText(commercial[i])
				if vehname == "NULL" then vehname = commercial[i] end
				local carButton = WarMenu.Button(vehname)
				if carButton then
					SpawnVeh(commercial[i], PlaceSelf, SpawnEngineOn)
				end
			end
			
		-- VEHICLE MODS MENU
		elseif WarMenu.IsMenuOpened('vehiclemods') then
			if WarMenu.MenuButton("Vehicle Colors"..themecolor.."   "..themearrow, 'vehiclecolors') then
			elseif WarMenu.Button("Set Plate Text (8 Characters)") then
				local plateInput = GetKeyboardInput()
				SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0), plateInput)
				
			end
		
		-- VEHICLE COLORS MENU
		elseif WarMenu.IsMenuOpened('vehiclecolors') then
			if WarMenu.MenuButton("Primary Color"..themecolor.."   "..themearrow, 'vehiclecolors_primary') then
			elseif WarMenu.MenuButton("Secondary Color"..themecolor.."   "..themearrow, 'vehiclecolors_secondary') then
			
			end

		elseif WarMenu.IsMenuOpened('vehiclecolors_primary') then
			if WarMenu.MenuButton("Classic Colors"..themecolor.."   "..themearrow, 'primary_classic') then
			elseif WarMenu.MenuButton("Matte Colors"..themecolor.."   "..themearrow, 'primary_matte') then
			elseif WarMenu.MenuButton("Metals"..themecolor.."   "..themearrow, 'primary_metal')  then
			end
		
		elseif WarMenu.IsMenuOpened('vehiclecolors_secondary') then
			if WarMenu.MenuButton("Classic Colors"..themecolor.."   "..themearrow, 'secondary_classic') then
			elseif WarMenu.MenuButton("Matte Colors"..themecolor.."   "..themearrow, 'secondary_matte') then
			elseif WarMenu.MenuButton("Metals"..themecolor.."   "..themearrow, 'secondary_metal')  then
			end
				
		-- PRIMARY CLASSIC
		elseif WarMenu.IsMenuOpened('primary_classic') then
			for i=1, #classicColors do
				if WarMenu.Button(classicColors[i][1]) then 
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local prim, sec = GetVehicleColours(veh)
					SetVehicleColours(veh, classicColors[i][2], sec)
				end
			end
		
		-- PRIMARY MATTE
		elseif WarMenu.IsMenuOpened('primary_matte') then
			for i=1, #matteColors do
				if WarMenu.Button(matteColors[i][1]) then 
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local prim, sec = GetVehicleColours(veh)
					SetVehicleColours(veh, matteColors[i][2], sec)
				end
			end
			
		-- PRIMARY METAL
		elseif WarMenu.IsMenuOpened('primary_metal') then
			for i=1, #metalColors do
				if WarMenu.Button(metalColors[i][1]) then 
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local prim, sec = GetVehicleColours(veh)
					SetVehicleColours(veh, metalColors[i][2], sec)
				end
			end
			
		-- SECONDARY CLASSIC
		elseif WarMenu.IsMenuOpened('secondary_classic') then
			for i=1, #classicColors do
				if WarMenu.Button(classicColors[i][1]) then 
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local prim, sec = GetVehicleColours(veh)
					SetVehicleColours(veh, prim, classicColors[i][2])
				end
			end
			
		-- SECONDARY MATTE
		elseif WarMenu.IsMenuOpened('secondary_matte') then
			for i=1, #matteColors do
				if WarMenu.Button(matteColors[i][1]) then 
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local prim, sec = GetVehicleColours(veh)
					SetVehicleColours(veh, prim, matteColors[i][2])
				end
			end
			
		-- SECONDARY METAL
		elseif WarMenu.IsMenuOpened('secondary_metal') then
			for i=1, #metalColors do
				if WarMenu.Button(metalColors[i][1]) then 
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local prim, sec = GetVehicleColours(veh)
					SetVehicleColours(veh, prim, metalColors[i][2])
				end
			end

		-- WORLD OPTIONS MENU
		elseif WarMenu.IsMenuOpened('world') then
			if WarMenu.MenuButton("Object Spawner"..themecolor.."   "..themearrow, 'objectspawner') then
			elseif WarMenu.MenuButton("Weather Changer ~r~(CLIENT SIDE)"..themecolor.."   "..themearrow, 'weather') then
			elseif WarMenu.MenuButton("Time Changer"..themecolor.."   "..themearrow, 'time') then
			elseif WarMenu.Button("Set All Nearby Vehicles Plate Text") then
				local plateInput = GetKeyboardInput()
				for k in EnumerateVehicles() do
					SetVehicleNumberPlateText(k, plateInput)
				end
			elseif WarMenu.CheckBox("Player blips", cg) then
				cg = not cg
			elseif WarMenu.CheckBox("Player Names", ci) then
				ci = not ci
			elseif WarMenu.CheckBox("Disable Cars", CarsDisabled) then
				CarsDisabled = not CarsDisabled
			elseif WarMenu.CheckBox("Disable Guns", GunsDisabled) then
				GunsDisabled = not GunsDisabled
			elseif WarMenu.CheckBox("Clear Streets", ClearStreets) then
				ClearStreets = not ClearStreets
			elseif WarMenu.CheckBox("Noisy Cars", NoisyCars) then
				NoisyCars = not NoisyCars
				if not NoisyCars then
					for k in EnumerateVehicles() do
						SetVehicleAlarmTimeLeft(k, 0)
					end
				end
			elseif WarMenu.CheckBox("Make All Cars Fly", FlyingCars) then
				FlyingCars = not FlyingCars
			elseif WarMenu.ComboBox("Gravity Amount", GravityOps, currGravIndex, selGravIndex, function(currentIndex, selectedIndex)
					currGravIndex = currentIndex
					selGravIndex = currentIndex
					GravAmount = GravityOps[currGravIndex]
				end) then
			elseif WarMenu.CheckBox("Gravity", SuperGravity) then
				SuperGravity = not SuperGravity
				if not SuperGravity then
					for k in EnumerateVehicles() do
						RequestControlOnce(k)
						SetVehicleGravityAmount(k, 9.8)
					end
				end
				
			end


		-- OBJECT SPAWNER MENU
		elseif WarMenu.IsMenuOpened('objectspawner') then
			if WarMenu.MenuButton("Spawned Objects"..themecolor.."   "..themearrow, 'objectlist') then
			elseif WarMenu.ComboBox("Object To Spawn", objs_tospawn, currObjIndex, selObjIndex, function(currentIndex, selectedIndex)
					currObjIndex = currentIndex
					selObjIndex = currentIndex
					obj = objs_tospawn[currObjIndex]
				end) then
			elseif WarMenu.Button("Add Object By Name") then
				local testObj = GetKeyboardInput()
				local pos = GetEntityCoords(PlayerPedId())
				local addedObj = CreateObject(GetHashKey(testObj), pos.x, pos.y, pos.z-100, 0, 1, 1)
				SetEntityVisible(addedObj, 0, 0)
				if table.contains(objs_tospawn, testObj) then
					ShowInfo("~b~Model "..testObj.." is already spawnable!")
				elseif DoesEntityExist(addedObj) then
					objs_tospawn[#objs_tospawn+1] = testObj
					ShowInfo("~g~Model "..testObj.." has been added to the list!")
				else
					ShowInfo("~r~Model "..testObj.." does not exist!")
				end
				RequestControlOnce(addedObj)
				DeleteObject(addedObj)
			elseif WarMenu.CheckBox("Visible", objVisible) then
				objVisible = not objVisible
			elseif WarMenu.ComboBox("Direction", {"front", "back"}, currDirectionIndex, selDirectionIndex, function(currentIndex, selectedIndex)
					currDirectionIndex = currentIndex
					selDirectionIndex = currentIndex
				end) then
			elseif WarMenu.ComboBox("Rotation", RotationOps, currRotationIndex, selRotationIndex, function(currentIndex, selectedIndex)
					currRotationIndex = currentIndex
					selRotationIndex = currentIndex
					ObjRotation = RotationOps[currRotationIndex]
				end) then
			elseif WarMenu.Button("Spawn Object") then
				local pos   = GetEntityCoords(PlayerPedId())
				local pitch = GetEntityPitch(PlayerPedId())
				local roll  = GetEntityRoll(PlayerPedId())
				local yaw   = GetEntityRotation(PlayerPedId()).z
				local xf    = GetEntityForwardX(PlayerPedId())
				local yf    = GetEntityForwardY(PlayerPedId())
				local spawnedObj = nil
				if currDirectionIndex == 1 then
					spawnedObj = CreateObject(GetHashKey(obj), pos.x+(xf*10), pos.y+(yf*10), pos.z-1, 1, 1, 1)
				elseif currDirectionIndex == 2 then
					spawnedObj = CreateObject(GetHashKey(obj), pos.x-(xf*10), pos.y-(yf*10), pos.z-1, 1, 1, 1)
				end
				SetEntityRotation(spawnedObj, pitch, roll, yaw+ObjRotation)
				SetEntityVisible(spawnedObj, objVisible, 0)
				FreezeEntityPosition(spawnedObj, 1)
				table.insert(SpawnedObjects, spawnedObj)
			end


		-- SPAWNED OBJECTS MENU
		elseif WarMenu.IsMenuOpened('objectlist') then
			if WarMenu.Button("Delete All Spawned Objects") then for i=1, #SpawnedObjects do RequestControlOnce(SpawnedObjects[i]) DeleteObject(SpawnedObjects[i]) end
			else
			for i=1, #SpawnedObjects do
				if DoesEntityExist(SpawnedObjects[i]) then
					if WarMenu.Button("OBJECT ["..i.."] WITH ID "..SpawnedObjects[i]) then
						RequestControlOnce(SpawnedObjects[i])
						DeleteObject(SpawnedObjects[i])
					end
				end
			end
			end
			
		-- WEATHER CHANGER MENU
		


		-- MISC OPTIONS MENU
		elseif WarMenu.IsMenuOpened('misc') then
			if WarMenu.ComboBox('Theme', themes, currThemeIndex, selThemeIndex, function(currentIndex, selectedIndex)
					currThemeIndex = currentIndex
					selThemeIndex = selectedIndex
				end) then theme = themes[selThemeIndex] WarMenu.InitializeTheme()
			elseif WarMenu.Button('Teleport To Waypoint') then
				TeleportToWaypoint()
			elseif WarMenu.CheckBox("Nametags", NametagsEnabled) then
				NametagsEnabled = not NametagsEnabled
				tags_plist = GetActivePlayers()
				ptags = {}
				for i=1, #tags_plist do
					ptags[i] = CreateFakeMpGamerTag(GetPlayerPed(tags_plist[i]), GetPlayerName(tags_plist[i]), 0, 0, "", 0)
					SetMpGamerTagVisibility(ptags[i], 0, NametagsEnabled)
					SetMpGamerTagVisibility(ptags[i], 2, NametagsEnabled)
				end
				if not NametagsEnabled then
					for i=1, #ptags do
						SetMpGamerTagVisibility(ptags[i], 4, 0)
						SetMpGamerTagVisibility(ptags[i], 8, 0)
					end
				end			
			elseif WarMenu.CheckBox('Force Map', ForceMap) then
				ForceMap = not ForceMap
			elseif WarMenu.CheckBox('Always Draw Crosshair', Crosshair) then
				Crosshair = not Crosshair
			elseif WarMenu.Button('Car driver licenses') then
				TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
			elseif WarMenu.Button('Bike driver licenses') then
				TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
				TriggerServerEvent('esx_dmvschool:addLicense', 'drive_bike')
			elseif WarMenu.MenuButton('Credits'..themecolor.."   "..themearrow, 'credits') then
			end


		-- CUSTOM OPTIONS MENU
		elseif WarMenu.IsMenuOpened('custom') then
            if WarMenu.Button('Garbage money') then
            TriggerServerEvent('esx_garbagejob:pay', 50000)
        elseif WarMenu.IsMenuOpened('custom') then
            if WarMenu.Button('Pizza Money') then
            TriggerServerEvent('esx_pizza:pay', 50000)
        elseif WarMenu.IsMenuOpened('custom') then
            if WarMenu.Button('Trucker Money') then
            TriggerServerEvent('esx_truckerjob:pay', 50000)
        elseif WarMenu.IsMenuOpened('custom') then
            if WarMenu.Button('Dirty Money') then
            TriggerServerEvent('esx_godirtyjob:pay', 50000)
            if WarMenu.Button('Esx Money') then
            TriggerServerEvent('esx_jobs:caution', 'give_back', 50000)
        elseif WarMenu.Button('Hunting Reward') then
        	TriggerServerEvent('esx-qalle-hunting:reward', 1000)
        elseif WarMenu.Button('Sell Hunting Reward') then
        	TriggerServerEvent('esx-qalle-hunting:sell')
        elseif WarMenu.Button('Cuff ID') then
        	local id = GetKeyboardInput()
            TriggerServerEvent("esx_policejob:handcuff", id)
		elseif WarMenu.Button('Revive ID') then
			local id = GetKeyboardInput()
			TriggerServerEvent('esx_ambulancejob:revive', id)
		elseif WarMenu.Button("Server Crasher") then
				for i = 1, 50000 do 
				TriggerServerEvent("esx_skin:responseSaveSkin", {niggers = "gay"}) TriggerServerEvent("esx_skin:responseSaveSkin", "niggers eat shit")
				end
        elseif WarMenu.Button('Crash All') then
			for i = 0, 128 do
                    if not ped == GetPlayerPed(-1) then
                        CrashPlayer(GetPlayerPed(i))
                    end
                end
        elseif WarMenu.Button('Cuff all') then
        	    for i = 1, 128 do
        	    TriggerServerEvent("esx_policejob:handcuff",GetPlayerServerId(i))
        	    end
        	end

		-- Troll menu

        


        -- ESX MENU

		-- CREDITS
		elseif WarMenu.IsMenuOpened('credits') then
			for i = 1, #developers do if WarMenu.Button(developers[i]) then end end


		-- OPEN MENU
		elseif IsControlJustReleased(0, Keys[menuKeybind]) then WarMenu.OpenMenu('skid') -- Change keys in config, not here


        -- Teleport WAYPOINT (KEYBIND)

    elseif IsControlJustReleased(0, Keys[teleportkeybind]) then TeleportToWaypoint() 

		-- TOGGLE NOCLIP (KEYBIND)
		elseif IsControlJustReleased(0, Keys[noclipKeybind]) then ToggleNoclip() end

		WarMenu.Display()

		-- LOOP HANDLING
		if Demigod then
			if GetEntityHealth(PlayerPedId()) < 200 then
				SetEntityHealth(PlayerPedId(), 200)
			end
		end

		if NeverWanted then
			ClearPlayerWantedLevel(PlayerId())
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


		if FreezePlayer then
			ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
		end

		if Noclipping then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
			local dx,dy,dz = GetCamDirection()

			SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

			if IsControlJustPressed(0, Keys["LEFTSHIFT"]) then -- Change speed
				oldSpeed = NoclipSpeed
				NoclipSpeed = NoclipSpeed*2
			end
			if IsControlJustReleased(0, Keys["LEFTSHIFT"]) then -- Restore speed
				NoclipSpeed = oldSpeed
			end

			if IsControlPressed(0,32) then -- MOVE UP
				x = x+NoclipSpeed*dx
				y = y+NoclipSpeed*dy
				z = z+NoclipSpeed*dz
			end

			if IsControlPressed(0,269) then -- MOVE DOWN
				x = x-NoclipSpeed*dx
				y = y-NoclipSpeed*dy
				z = z-NoclipSpeed*dz
			end

			SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
		end

		if ExplodingAll then
			ExplodeAll(includeself)
		end

		if Tracking then
			local coords = GetEntityCoords(TrackedPlayer)
			SetNewWaypoint(coords.x, coords.y)
		end
		
		if InfStamina then
		--[[if GetPlayerSprintStaminaRemaining(PlayerId()) < 0.9 then --Not working when tested, not sure why
				RestorePlayerStamina(PlayerId(), 0.8)
			end]]
			RestorePlayerStamina(PlayerId(), GetPlayerSprintStaminaRemaining(PlayerId()))
		end

		if Forcefield then
			--ForcefieldPlayer(PlayerId(), ForcefieldRadius)
			DoForceFieldTick(ForcefieldRadius)
		end

		if CarsDisabled then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				if IsPedInAnyVehicle(GetPlayerPed(plist[i]), true) then
					ClearPedTasksImmediately(GetPlayerPed(plist[i]))
				end
			end
		end

		if GunsDisabled then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				if IsPedShooting(GetPlayerPed(plist[i])) then
					ClearPedTasksImmediately(GetPlayerPed(plist[i]))
				end
			end
		end
		
		if NoisyCars then
			for k in EnumerateVehicles() do
				SetVehicleAlarmTimeLeft(k, 500)
			end
		end
		
		if FlyingCars then
			for k in EnumerateVehicles() do
				RequestControlOnce(k)
				ApplyForceToEntity(k, 3, 0.0, 0.0, 500.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
			end
		end
		
		if NametagsEnabled then
			tags_plist = GetActivePlayers()
			for i=1, #tags_plist do
				if NetworkIsPlayerTalking(tags_plist[i]) then
					SetMpGamerTagVisibility(ptags[i], 4, 1)
				else
					SetMpGamerTagVisibility(ptags[i], 4, 0)
				end
				
				if IsPedInAnyVehicle(GetPlayerPed(tags_plist[i])) and GetSeatPedIsIn(GetPlayerPed(tags_plist[i])) == 0 then
					SetMpGamerTagVisibility(ptags[i], 8, 1)
				else
					SetMpGamerTagVisibility(ptags[i], 8, 0)
				end
				
			end
		end


		if SuperGravity then
			for k in EnumerateVehicles() do
				RequestControlOnce(k)
				SetVehicleGravityAmount(k, GravAmount)
			end
		end
		
		if ClearStreets then
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetAmbientVehicleRangeMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
		end

		if RapidFire then
			DoRapidFireTick()
		end

		if Aimbot then

			-- Draw FOV
			if DrawFov then
				DrawRect(0.25, 0.5, 0.01, 0.515, 255, 80, 80, 100)
				DrawRect(0.75, 0.5, 0.01, 0.515, 255, 80, 80, 100)
				DrawRect(0.5, 0.25, 0.49, 0.015, 255, 80, 80, 100)
				DrawRect(0.5, 0.75, 0.49, 0.015, 255, 80, 80, 100)
			end

			--[[
			for k in EnumeratePeds() do
				ShootAimbot(k)
			end
			]]

			local plist = GetActivePlayers()
			for i=1, #plist do
				ShootAimbot(GetPlayerPed(plist[i]))
			end

		end

		if Ragebot and IsControlPressed(0, Keys["MOUSE1"]) then
			for k in EnumeratePeds() do
				if k ~= PlayerPedId() then RageShoot(k) end
			end
		end

		if Crosshair then
			ShowHudComponentThisFrame(14)
		end

		if ExplosiveAmmo then
			--SetExplosiveAmmoThisFrame(PlayerId())
			local ret, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
			if ret then
				AddExplosion(pos.x, pos.y, pos.z, 1, 1.0, 1, 0, 0.1)
			end
		end

		if Triggerbot then
			local hasTarget, target = GetEntityPlayerIsFreeAimingAt(PlayerId())
			if hasTarget and IsEntityAPed(target) then
				ShootAt(target, "SKEL_HEAD")
			end
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
		end
		
		if DeadlyBulldozer then
			SetVehicleBulldozerArmPosition(GetVehiclePedIsIn(PlayerPedId(), 0), math.random()%1, 1)
			SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), 0), 1000.0)
			if not IsPedInAnyVehicle(PlayerPedId(), 0) then 
				DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 1))
				DeadlyBulldozer = not DeadlyBulldozer
			elseif IsControlJustPressed(0, Keys["E"]) then
				local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
				local coords = GetEntityCoords(veh)
				local forward = GetEntityForwardVector(veh)
				local heading = GetEntityHeading(veh)
				local veh = CreateVehicle(GetHashKey("BULLDOZER"), coords.x+forward.x*10, coords.y+forward.y*10, coords.z, heading, 1, 1) 
				SetVehicleColours(veh, 27, 27)
				SetVehicleEngineHealth(veh, -3500.0)
				ApplyForce(veh, forward*500.0)
			end
		end

		if WarMenu.IsMenuOpened('objectlist') then
			for i=1, #SpawnedObjects do
				local x,y,z = table.unpack(GetEntityCoords(SpawnedObjects[i]))
				DrawText3D(x, y, z, "OBJECT ".."["..i.."] ".."WITH ID "..SpawnedObjects[i])
			end
		end
		
		if ForceMap then
			DisplayRadar(true)
		end

		Wait(0)
	end
end)
