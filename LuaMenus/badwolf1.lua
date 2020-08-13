--==================================================================================================================================================--
--[[ NativeUI\Wrapper\Ordered Table ]]
--==================================================================================================================================================--
oTable = {}
do
    function oTable.insert(t, k, v)
    if not rawget(t._values, k) then -- new key 
        t._keys[#t._keys + 1] = k
    end
    if v == nil then -- delete key too.
        oTable.remove(t, k)
    else -- update/store value
        t._values[k] = v 
    end
    end

    local function find(t, value)
    for i,v in ipairs(t) do
        if v == value then
        return i
        end
    end
    end  

    function oTable.remove(t, k)
    local v = t._values[k]
    if v ~= nil then
        table.remove(t._keys, find(t._keys, k))
        t._values[k] = nil
    end
    return v
    end

    function oTable.index(t, k)
        return rawget(t._values, k)
    end

    function oTable.pairs(t)
    local i = 0
    return function()
        i = i + 1
        local key = t._keys[i]
        if key ~= nil then
        return key, t._values[key]
        end
    end
    end

    function oTable.new(init)
    init = init or {}
    local t = {_keys={}, _values={}}
    local n = #init
    if n % 2 ~= 0 then
        error"in oTable initialization: key is missing value"
    end
    for i=1,n/2 do
        local k = init[i * 2 - 1]
        local v = init[i * 2]
        if t._values[k] ~= nil then
        error("duplicate key:"..k)
        end
        t._keys[#t._keys + 1]  = k
        t._values[k] = v
    end
    return setmetatable(t,
        {__newindex=oTable.insert,
        __len=function(t) return #t._keys end,
        __pairs=oTable.pairs,
        __index=t._values
        })
    end
end

--==================================================================================================================================================--
--[[ NativeUI\Wrapper\Utility ]]
--==================================================================================================================================================--
do
    function table.Contains(table, val)
        for index, value in pairs(table) do if value == val then return true end end
        return false
    end

    function table.ContainsKey(table, key)
        return table[key] ~= nil
    end

    function table.Count(table)
        local count = 0
        if table ~= nil then
            for _ in pairs(table) do count = count + 1 end
        end
        return count
    end

    function string.IsNullOrEmpty(str) return str == nil or str == '' end

    function GetResolution()
        local W, H = 1920, 1080
        if GetActiveScreenResolution ~= nil then
            W, H = GetActiveScreenResolution()
        elseif GetScreenActiveResolution ~= nil then
            W, H = GetScreenActiveResolution()
        else
            W, H = N_0x873c9f3104101dd3()
        end
        if (W / H) > 3.5 then W, H = GetScreenResolution() end
        if W < 1920 then W = 1920 end
        if H < 1080 then H = 1080 end
        return W, H
    end

    function FormatXWYH(Value, Value2)
        local W, H = GetScreenResolution()
        local AW, AH = GetResolution()
        local XW = Value * (1 / W - ((1 / W) - (1 / AW)))
        local YH = Value2 * (1 / H - ((1 / H) - (1 / AH)))
        return XW, YH
    end

    function ReverseFormatXWYH(Value, Value2)
        local W, H = GetScreenResolution()
        local AW, AH = GetResolution()
        local XW = Value / (1 / W - (1 * (1 / W) - (1 / AW)))
        local YH = Value2 / (1 / H - ((1 / H) - (1 / AH)))
        return XW, YH
    end

    function ConvertToPixel(x, y)
        local AW, AH = GetResolution()
        return math.round(x * AW), math.round(y * AH)
    end

    function math.round(num, numDecimalPlaces) return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num)) end
    
    function math.trim(value) if value then return (string.gsub(value, "^%s*(.-)%s*$", "%1")) else return nil end end

    function ToBool(input)
        if input == "true" or tonumber(input) == 1 or input == true then
            return true
        else
            return false
        end
    end

    function string.split(inputstr, sep)
        if sep == nil then sep = "%s" end
        local t = {}
        local i = 1
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            t[i] = str
            i = i + 1
        end
        return t
    end

    function string.starts(String, Start) return string.sub(String, 1, string.len(Start)) == Start end

    function IsMouseInBounds(X, Y, Width, Height, DrawOffset)
        local W, H = GetResolution()
        local MX, MY = math.round(GetControlNormal(0, 239) * W), math.round(GetControlNormal(0, 240) * H)
        MX, MY = FormatXWYH(MX, MY)
        X, Y = FormatXWYH(X, Y)
        if DrawOffset then
            X = X + DrawOffset.X
            Y = Y + DrawOffset.Y
        end
        Width, Height = FormatXWYH(Width, Height)
        return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
    end

    function TableDump(o)
        if type(o) == 'table' then
            local s = '{ '
            for k, v in pairs(o) do
                if type(k) ~= 'number' then k = '"' .. k .. '"' end
                s = s .. '[' .. k .. '] = ' .. TableDump(v) .. ','
            end
            return s .. '} '
        else
            return print(tostring(o))
        end
    end

    function Controller()
        return not GetLastInputMethod(2) -- IsInputDisabled() --N_0xA571D46727E2B718
    end

    function RenderText(Text, X, Y, Font, Scale, R, G, B, A, Alignment, DropShadow, Outline, WordWrap)
        Text = tostring(Text)
        X, Y = FormatXWYH(X, Y)
        SetTextFont(Font or 0)
        SetTextScale(1.0, Scale or 0)
        SetTextColour(R or 255, G or 255, B or 255, A or 255)

        if DropShadow then SetTextDropShadow() end
        if Outline then SetTextOutline() end

        if Alignment ~= nil then
            if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
                SetTextCentre(true)
            elseif Alignment == 2 or Alignment == "Right" then
                SetTextRightJustify(true)
                SetTextWrap(0, X)
            end
        end

        if tonumber(WordWrap) then
            if tonumber(WordWrap) ~= 0 then
                WordWrap, _ = FormatXWYH(WordWrap, 0)
                SetTextWrap(WordWrap, X - WordWrap)
            end
        end

        if BeginTextCommandDisplayText ~= nil then
            BeginTextCommandDisplayText("STRING")
        else
            SetTextEntry("STRING")
        end
        AddLongString(Text)

        if EndTextCommandDisplayText ~= nil then
            EndTextCommandDisplayText(X, Y)
        else
            DrawText(X, Y)
        end
    end

    function DrawRectangle(X, Y, Width, Height, R, G, B, A)
        X, Y, Width, Height = X or 0, Y or 0, Width or 0, Height or 0
        X, Y = FormatXWYH(X, Y)
        Width, Height = FormatXWYH(Width, Height)
        DrawRect(X + Width * 0.5, Y + Height * 0.5, Width, Height, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255,
                    tonumber(A) or 255)
    end

    function DrawTexture(TxtDictionary, TxtName, X, Y, Width, Height, Heading, R, G, B, A)
        if not HasStreamedTextureDictLoaded(tostring(TxtDictionary) or "") then
            RequestStreamedTextureDict(tostring(TxtDictionary) or "", true)
        end
        X, Y, Width, Height = X or 0, Y or 0, Width or 0, Height or 0
        X, Y = FormatXWYH(X, Y)
        Width, Height = FormatXWYH(Width, Height)
        DrawSprite(tostring(TxtDictionary) or "", tostring(TxtName) or "", X + Width * 0.5, Y + Height * 0.5, Width, Height,
                    tonumber(Heading) or 0, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
    end

    function PrintTable(node)
        -- to make output beautiful
        local function tab(amt)
            local str = ""
            for i = 1, amt do str = str .. "\t" end
            return str
        end

        local cache, stack, output = {}, {}, {}
        local depth = 1
        local output_str = "{\n"

        while true do
            local size = 0
            for k, v in pairs(node) do size = size + 1 end

            local cur_index = 1
            for k, v in pairs(node) do
                if (cache[node] == nil) or (cur_index >= cache[node]) then

                    if (string.find(output_str, "}", output_str:len())) then
                        output_str = output_str .. ",\n"
                    elseif not (string.find(output_str, "\n", output_str:len())) then
                        output_str = output_str .. "\n"
                    end

                    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                    table.insert(output, output_str)
                    output_str = ""

                    local key
                    if (type(k) == "number" or type(k) == "boolean") then
                        key = "[" .. tostring(k) .. "]"
                    else
                        key = "['" .. tostring(k) .. "']"
                    end

                    if (type(v) == "number" or type(v) == "boolean") then
                        output_str = output_str .. tab(depth) .. key .. " = " .. tostring(v)
                    elseif (type(v) == "table") then
                        output_str = output_str .. tab(depth) .. key .. " = {\n"
                        table.insert(stack, node)
                        table.insert(stack, v)
                        cache[node] = cur_index + 1
                        break
                    else
                        output_str = output_str .. tab(depth) .. key .. " = '" .. tostring(v) .. "'"
                    end

                    if (cur_index == size) then
                        output_str = output_str .. "\n" .. tab(depth - 1) .. "}"
                    else
                        output_str = output_str .. ","
                    end
                else
                    -- close the table
                    if (cur_index == size) then output_str = output_str .. "\n" .. tab(depth - 1) .. "}" end
                end

                cur_index = cur_index + 1
            end

            if (size == 0) then output_str = output_str .. "\n" .. tab(depth - 1) .. "}" end

            if (#stack > 0) then
                node = stack[#stack]
                stack[#stack] = nil
                depth = cache[node] == nil and depth + 1 or depth - 1
            else
                break
            end
        end

        -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
        table.insert(output, output_str)
        output_str = table.concat(output)

        print(output_str)
    end

    --[[ Rainbow Color Generator ]]
    function GenerateRainbow(frequency)
        local result = {}
        local curtime = GetGameTimer() / 1000
        result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
        result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
        result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
        return result
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIElements\UIVisual ]]
--==================================================================================================================================================--
UIVisual = setmetatable({}, UIVisual)
UIVisual.__index = UIVisual
do
    function UIVisual:Popup(array)
        ClearPrints()
        if (array.colors == nil) then
            SetNotificationBackgroundColor(140)
        else
            SetNotificationBackgroundColor(array.colors)
        end
        SetNotificationTextEntry("STRING")
        if (array.message == nil) then
            error("Missing arguments, message")
        else
            AddTextComponentString(tostring(array.message))
        end
        DrawNotification(false, true)
        if (array.sound ~= nil) then
            if (array.sound.audio_name ~= nil) then
                if (array.sound.audio_ref ~= nil) then
                    PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
                else
                    error("Missing arguments, audio_ref")
                end
            else
                error("Missing arguments, audio_name")
            end
        end
    end

    function UIVisual:PopupChar(array)
        if (array.colors == nil) then
            SetNotificationBackgroundColor(140)
        else
            SetNotificationBackgroundColor(array.colors)
        end
        SetNotificationTextEntry("STRING")
        if (array.message == nil) then
            error("Missing arguments, message")
        else
            AddTextComponentString(tostring(array.message))
        end
        if (array.request_stream_texture_dics ~= nil) then RequestStreamedTextureDict(array.request_stream_texture_dics) end
        if (array.picture ~= nil) then
            if (array.iconTypes == 1) or (array.iconTypes == 2) or (array.iconTypes == 3) or (array.iconTypes == 7) or
                (array.iconTypes == 8) or (array.iconTypes == 9) then
                SetNotificationMessage(tostring(array.picture), tostring(array.picture), true, array.iconTypes, array.sender, array.title)
            else
                SetNotificationMessage(tostring(array.picture), tostring(array.picture), true, 4, array.sender, array.title)
            end
        else
            if (array.iconTypes == 1) or (array.iconTypes == 2) or (array.iconTypes == 3) or (array.iconTypes == 7) or
                (array.iconTypes == 8) or (array.iconTypes == 9) then
                SetNotificationMessage('CHAR_ALL_PLAYERS_CONF', 'CHAR_ALL_PLAYERS_CONF', true, array.iconTypes, array.sender, array.title)
            else
                SetNotificationMessage('CHAR_ALL_PLAYERS_CONF', 'CHAR_ALL_PLAYERS_CONF', true, 4, array.sender, array.title)
            end
        end
        if (array.sound ~= nil) then
            if (array.sound.audio_name ~= nil) then
                if (array.sound.audio_ref ~= nil) then
                    PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
                else
                    error("Missing arguments, audio_ref")
                end
            else
                error("Missing arguments, audio_name")
            end
        end
        DrawNotification(false, true)
    end

    function UIVisual:Text(array)
        ClearPrints()
        SetTextEntry_2("STRING")
        if (array.message ~= nil) then
            AddTextComponentString(tostring(array.message))
        else
            error("Missing arguments, message")
        end
        if (array.time_display ~= nil) then
            DrawSubtitleTimed(tonumber(array.time_display), 1)
        else
            DrawSubtitleTimed(6000, 1)
        end
        if (array.sound ~= nil) then
            if (array.sound.audio_name ~= nil) then
                if (array.sound.audio_ref ~= nil) then
                    PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
                else
                    error("Missing arguments, audio_ref")
                end
            else
                error("Missing arguments, audio_name")
            end
        end
    end

    function UIVisual:FloatingHelpText(array)
        BeginTextCommandDisplayHelp("STRING")
        if (array.message ~= nil) then
            AddTextComponentScaleform(array.message)
        else
            error("Missing arguments, message")
        end
        EndTextCommandDisplayHelp(0, 0, 1, -1)
        if (array.sound ~= nil) then
            if (array.sound.audio_name ~= nil) then
                if (array.sound.audio_ref ~= nil) then
                    PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
                else
                    error("Missing arguments, audio_ref")
                end
            else
                error("Missing arguments, audio_name")
            end
        end
    end

    function UIVisual:ShowFreemodeMessage(array)
        if (array.sound ~= nil) then
            if (array.sound.audio_name ~= nil) then
                if (array.sound.audio_ref ~= nil) then
                    PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
                else
                    error("Missing arguments, audio_ref")
                end
            else
                error("Missing arguments, audio_name")
            end
        end
        if (array.request_scaleform ~= nil) then
            local scaleform = Pyta.Request.Scaleform({movie = array.request_scaleform.movie})
            if (array.request_scaleform.scale ~= nil) then
                PushScaleformMovieFunction(scaleform, array.request_scaleform.scale)
            else
                PushScaleformMovieFunction(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
            end
        else
            local scaleform = Pyta.Request.Scaleform({movie = 'MP_BIG_MESSAGE_FREEMODE'})
            if (array.request_scaleform.scale ~= nil) then
                PushScaleformMovieFunction(scaleform, array.request_scaleform.scale)
            else
                PushScaleformMovieFunction(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
            end
        end
        if (array.title ~= nil) then
            PushScaleformMovieFunctionParameterString(array.title)
        else
            ConsoleLog({message = 'Missing arguments { title = "Nice title" } '})
        end
        if (array.message ~= nil) then
            PushScaleformMovieFunctionParameterString(array.message)
        else
            ConsoleLog({message = 'Missing arguments { message = "Yeah display message right now" } '})
        end
        if (array.shake_gameplay ~= nil) then ShakeGameplayCam(array.shake_gameplay, 1.0) end
        if (array.screen_effect_in ~= nil) then StartScreenEffect(array.screen_effect_in, 0, 0) end
        PopScaleformMovieFunctionVoid()
        while array.time > 0 do
            Citizen.Wait(1)
            array.time = array.time - 1.0
            StopScreenEffect(scaleform, 255, 255, 255, 255)
        end
        if (array.screen_effect_in ~= nil) then StopScreenEffect(array.screen_effect_in) end
        if (array.screen_effect_out ~= nil) then StartScreenEffect(array.screen_effect_out, 0, 0) end
        SetScaleformMovieAsNoLongerNeeded(scaleform)
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIElements\UIResRectangle ]]
--==================================================================================================================================================--
UIResRectangle = setmetatable({}, UIResRectangle)
UIResRectangle.__index = UIResRectangle
UIResRectangle.__call = function() return "Rectangle" end
do
    function UIResRectangle.New(X, Y, Width, Height, R, G, B, A)
        local _UIResRectangle = {
            X = tonumber(X) or 0,
            Y = tonumber(Y) or 0,
            Width = tonumber(Width) or 0,
            Height = tonumber(Height) or 0,
            _Colour = {R = tonumber(R) or 255, G = tonumber(G) or 255, B = tonumber(B) or 255, A = tonumber(A) or 255}
        }
        return setmetatable(_UIResRectangle, UIResRectangle)
    end

    function UIResRectangle:Position(X, Y)
        if tonumber(X) and tonumber(Y) then
            self.X = tonumber(X)
            self.Y = tonumber(Y)
        else
            return {X = self.X, Y = self.Y}
        end
    end

    function UIResRectangle:Size(Width, Height)
        if tonumber(Width) and tonumber(Height) then
            self.Width = tonumber(Width)
            self.Height = tonumber(Height)
        else
            return {Width = self.Width, Height = self.Height}
        end
    end

    function UIResRectangle:Colour(R, G, B, A)
        if tonumber(R) or tonumber(G) or tonumber(B) or tonumber(A) then
            self._Colour.R = tonumber(R) or 255
            self._Colour.B = tonumber(B) or 255
            self._Colour.G = tonumber(G) or 255
            self._Colour.A = tonumber(A) or 255
        else
            return self._Colour
        end
    end

    function UIResRectangle:Draw()
        local Position = self:Position()
        local Size = self:Size()
        Size.Width, Size.Height = FormatXWYH(Size.Width, Size.Height)
        Position.X, Position.Y = FormatXWYH(Position.X, Position.Y)
        DrawRect(Position.X + Size.Width * 0.5, Position.Y + Size.Height * 0.5, Size.Width, Size.Height, self._Colour.R, self._Colour.G,
                    self._Colour.B, self._Colour.A)
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIElements\UIResText ]]
--==================================================================================================================================================--
UIResText = setmetatable({}, UIResText)
UIResText.__index = UIResText
UIResText.__call = function() return "Text" end
do
    function GetCharacterCount(str)
        local characters = 0
        for c in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
            local a = c:byte(1, -1)
            if a ~= nil then characters = characters + 1 end
        end
        return characters
    end

    function GetByteCount(str)
        local bytes = 0
        for c in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
            local a, b, c, d = c:byte(1, -1)
            if a ~= nil then bytes = bytes + 1 end
            if b ~= nil then bytes = bytes + 1 end
            if c ~= nil then bytes = bytes + 1 end
            if d ~= nil then bytes = bytes + 1 end
        end
        return bytes
    end

    function AddLongStringForAscii(str)
        local maxByteLengthPerString = 99
        for i = 1, GetCharacterCount(str), maxByteLengthPerString do
            AddTextComponentString(string.sub(str, i, i + maxByteLengthPerString))
        end
    end

    function AddLongStringForUtf8(str)
        local maxByteLengthPerString = 99
        local bytecount = GetByteCount(str)
        local charcount = GetCharacterCount(str)
        if bytecount < maxByteLengthPerString then
            AddTextComponentString(str)
            return
        end
        local startIndex = 0
        for i = 0, charcount, 1 do
            local length = i - startIndex
            if GetByteCount(string.sub(str, startIndex, length)) > maxByteLengthPerString then
                AddTextComponentString(string.sub(str, startIndex, length - 1))
                i = i - 1
                startIndex = startIndex + (length - 1)
            end
        end
        AddTextComponentString(string.sub(str, startIndex, charcount - startIndex))
    end

    function AddLongString(str)
        local bytecount = GetByteCount(str)
        if bytecount == GetCharacterCount(str) then
            AddLongStringForAscii(str)
        else
            AddLongStringForUtf8(str)
        end
    end

    function MeasureStringWidthNoConvert(str, font, scale)
        SetTextEntryForWidth("STRING")
        AddLongString(str)
        SetTextFont(font or 0)
        SetTextScale(1.0, scale or 0)
        if EndTextCommandGetWidth ~= nil then
            return EndTextCommandGetWidth(true)
        else
            return GetTextScreenWidth(true)
        end
    end

    function MeasureStringWidth(str, font, scale)
        local W, H = GetResolution()
        return MeasureStringWidthNoConvert(str, font, scale) * W
    end

    function UIResText.New(Text, X, Y, Scale, R, G, B, A, Font, Alignment, DropShadow, Outline, WordWrap, LongText)
        local _UIResText = {
            _Text = tostring(Text) or "",
            X = tonumber(X) or 0,
            Y = tonumber(Y) or 0,
            Scale = tonumber(Scale) or 0,
            _Colour = {R = tonumber(R) or 255, G = tonumber(G) or 255, B = tonumber(B) or 255, A = tonumber(A) or 255},
            Font = tonumber(Font) or 0,
            Alignment = Alignment or nil,
            DropShadow = DropShadow or nil,
            Outline = Outline or nil,
            WordWrap = tonumber(WordWrap) or 0,
            LongText = ToBool(LongText) or false
        }
        return setmetatable(_UIResText, UIResText)
    end

    function UIResText:Position(X, Y)
        if tonumber(X) and tonumber(Y) then
            self.X = tonumber(X)
            self.Y = tonumber(Y)
        else
            return {X = self.X, Y = self.Y}
        end
    end

    function UIResText:Colour(R, G, B, A)
        if tonumber(R) and tonumber(G) and tonumber(B) and tonumber(A) then
            self._Colour.R = tonumber(R)
            self._Colour.B = tonumber(B)
            self._Colour.G = tonumber(G)
            self._Colour.A = tonumber(A)
        else
            return self._Colour
        end
    end

    function UIResText:Text(Text)
        if tostring(Text) and Text ~= nil then
            self._Text = tostring(Text)
        else
            return self._Text
        end
    end

    function UIResText:Draw()
        local Position = self:Position()
        Position.X, Position.Y = FormatXWYH(Position.X, Position.Y)

        SetTextFont(self.Font)
        SetTextScale(1.0, self.Scale)
        SetTextColour(self._Colour.R, self._Colour.G, self._Colour.B, self._Colour.A)

        if self.DropShadow then SetTextDropShadow() end
        if self.Outline then SetTextOutline() end

        if self.Alignment ~= nil then
            if self.Alignment == 1 or self.Alignment == "Center" or self.Alignment == "Centre" then
                SetTextCentre(true)
            elseif self.Alignment == 2 or self.Alignment == "Right" then
                SetTextRightJustify(true)
                SetTextWrap(0, Position.X)
            end
        end

        if tonumber(self.WordWrap) then
            if tonumber(self.WordWrap) ~= 0 then
                SetTextWrap(Position.X, Position.X + (tonumber(self.WordWrap) / Resolution.Width))
            end
        end

        if BeginTextCommandDisplayText ~= nil then
            BeginTextCommandDisplayText(self.LongText and "CELL_EMAIL_BCON" or "STRING");
        else
            SetTextEntry(self.LongText and "CELL_EMAIL_BCON" or "STRING");
        end
        AddLongString(self._Text)

        if EndTextCommandDisplayText ~= nil then
            EndTextCommandDisplayText(Position.X, Position.Y)
        else
            DrawText(Position.X, Position.Y)
        end
    end
end


--==================================================================================================================================================--
--[[ NativeUI\UIElements\Sprite ]]
--==================================================================================================================================================--
Sprite = setmetatable({}, Sprite)
Sprite.__index = Sprite
Sprite.__call = function() return "Sprite" end
do
    function Sprite.New(TxtDictionary, TxtName, X, Y, Width, Height, Heading, R, G, B, A)
        local _Sprite = {
            TxtDictionary = tostring(TxtDictionary),
            TxtName = tostring(TxtName),
            X = tonumber(X) or 0,
            Y = tonumber(Y) or 0,
            Width = tonumber(Width) or 0,
            Height = tonumber(Height) or 0,
            Heading = tonumber(Heading) or 0,
            _Colour = {R = tonumber(R) or 255, G = tonumber(G) or 255, B = tonumber(B) or 255, A = tonumber(A) or 255}
        }
        return setmetatable(_Sprite, Sprite)
    end

    function Sprite:Position(X, Y)
        if tonumber(X) and tonumber(Y) then
            self.X = tonumber(X)
            self.Y = tonumber(Y)
        else
            return {X = self.X, Y = self.Y}
        end
    end

    function Sprite:Size(Width, Height)
        if tonumber(Width) and tonumber(Width) then
            self.Width = tonumber(Width)
            self.Height = tonumber(Height)
        else
            return {Width = self.Width, Height = self.Height}
        end
    end

    function Sprite:Colour(R, G, B, A)
        if tonumber(R) or tonumber(G) or tonumber(B) or tonumber(A) then
            self._Colour.R = tonumber(R) or 255
            self._Colour.B = tonumber(B) or 255
            self._Colour.G = tonumber(G) or 255
            self._Colour.A = tonumber(A) or 255
        else
            return self._Colour
        end
    end

    function Sprite:Draw()
        if not HasStreamedTextureDictLoaded(self.TxtDictionary) then RequestStreamedTextureDict(self.TxtDictionary, true) end
        local Position = self:Position()
        local Size = self:Size()
        Size.Width, Size.Height = FormatXWYH(Size.Width, Size.Height)
        Position.X, Position.Y = FormatXWYH(Position.X, Position.Y)
        DrawSprite(self.TxtDictionary, self.TxtName, Position.X + Size.Width * 0.5, Position.Y + Size.Height * 0.5, Size.Width, Size.Height,
                    self.Heading, self._Colour.R, self._Colour.G, self._Colour.B, self._Colour.A)
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\elements\Badge ]]
--==================================================================================================================================================--
BadgeStyle = {
    None = 0,
    BronzeMedal = 1,
    GoldMedal = 2,
    SilverMedal = 3,
    Alert = 4,
    Crown = 5,
    Ammo = 6,
    Armour = 7,
    Barber = 8,
    Clothes = 9,
    Franklin = 10,
    Bike = 11,
    Car = 12,
    Gun = 13,
    Heart = 14,
    Makeup = 15,
    Mask = 16,
    Michael = 17,
    Star = 18,
    Tattoo = 19,
    Trevor = 20,
    Lock = 21,
    Tick = 22,
    Sale = 23,
    ArrowLeft = 24,
    ArrowRight = 25,
    Audio1 = 26,
    Audio2 = 27,
    Audio3 = 28,
    AudioInactive = 29,
    AudioMute = 30,
    Info = 31,
    MenuArrow = 32,
    GTAV = 33
}
BadgeTexture = {
    [0] = function() return "" end,
    [1] = function() return "mp_medal_bronze" end,
    [2] = function() return "mp_medal_gold" end,
    [3] = function() return "mp_medal_silver" end,
    [4] = function() return "mp_alerttriangle" end,
    [5] = function() return "mp_hostcrown" end,
    [6] = function(Selected)
        if Selected then
            return "shop_ammo_icon_b"
        else
            return "shop_ammo_icon_a"
        end
    end,
    [7] = function(Selected)
        if Selected then
            return "shop_armour_icon_b"
        else
            return "shop_armour_icon_a"
        end
    end,
    [8] = function(Selected)
        if Selected then
            return "shop_barber_icon_b"
        else
            return "shop_barber_icon_a"
        end
    end,
    [9] = function(Selected)
        if Selected then
            return "shop_clothing_icon_b"
        else
            return "shop_clothing_icon_a"
        end
    end,
    [10] = function(Selected)
        if Selected then
            return "shop_franklin_icon_b"
        else
            return "shop_franklin_icon_a"
        end
    end,
    [11] = function(Selected)
        if Selected then
            return "shop_garage_bike_icon_b"
        else
            return "shop_garage_bike_icon_a"
        end
    end,
    [12] = function(Selected)
        if Selected then
            return "shop_garage_icon_b"
        else
            return "shop_garage_icon_a"
        end
    end,
    [13] = function(Selected)
        if Selected then
            return "shop_gunclub_icon_b"
        else
            return "shop_gunclub_icon_a"
        end
    end,
    [14] = function(Selected)
        if Selected then
            return "shop_health_icon_b"
        else
            return "shop_health_icon_a"
        end
    end,
    [15] = function(Selected)
        if Selected then
            return "shop_makeup_icon_b"
        else
            return "shop_makeup_icon_a"
        end
    end,
    [16] = function(Selected)
        if Selected then
            return "shop_mask_icon_b"
        else
            return "shop_mask_icon_a"
        end
    end,
    [17] = function(Selected)
        if Selected then
            return "shop_michael_icon_b"
        else
            return "shop_michael_icon_a"
        end
    end,
    [18] = function() return "shop_new_star" end,
    [19] = function(Selected)
        if Selected then
            return "shop_tattoos_icon_b"
        else
            return "shop_tattoos_icon_a"
        end
    end,
    [20] = function(Selected)
        if Selected then
            return "shop_trevor_icon_b"
        else
            return "shop_trevor_icon_a"
        end
    end,
    [21] = function() return "shop_lock" end,
    [22] = function() return "shop_tick_icon" end,
    [23] = function() return "saleicon" end,
    [24] = function() return "arrowleft" end,
    [25] = function() return "arrowright" end,
    [26] = function() return "leaderboard_audio_1" end,
    [27] = function() return "leaderboard_audio_2" end,
    [28] = function() return "leaderboard_audio_3" end,
    [29] = function() return "leaderboard_audio_inactive" end,
    [30] = function() return "leaderboard_audio_mute" end,
    [31] = function() return "info_icon_32" end,
    [32] = function() return "menuarrow_32" end,
    [33] = function() return "mpgroundlogo_bikers" end
}
BadgeDictionary = {
    [0] = function(Selected)
        if Selected then
            return "commonmenu"
        else
            return "commonmenu"
        end
    end,
    [31] = function(Selected)
        if Selected then
            return "shared"
        else
            return "shared"
        end
    end,
    [32] = function(Selected)
        if Selected then
            return "shared"
        else
            return "shared"
        end
    end,
    [33] = function(Selected)
        if Selected then
            return "3dtextures"
        else
            return "3dtextures"
        end
    end
}
BadgeColour = {
    [5] = function(Selected)
        if Selected then
            return 0, 0, 0, 255
        else
            return 255, 255, 255, 255
        end
    end,
    [21] = function(Selected)
        if Selected then
            return 0, 0, 0, 255
        else
            return 255, 255, 255, 255
        end
    end,
    [22] = function(Selected)
        if Selected then
            return 0, 0, 0, 255
        else
            return 255, 255, 255, 255
        end
    end
}
do
    function GetBadgeTexture(Badge, Selected)
        if BadgeTexture[Badge] then
            return BadgeTexture[Badge](Selected)
        else
            return ""
        end
    end

    function GetBadgeDictionary(Badge, Selected)
        if BadgeDictionary[Badge] then
            return BadgeDictionary[Badge](Selected)
        else
            return "commonmenu"
        end
    end

    function GetBadgeColour(Badge, Selected)
        if BadgeColour[Badge] then
            return BadgeColour[Badge](Selected)
        else
            return 255, 255, 255, 255
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\elements\Colours ]]
--==================================================================================================================================================--
Colours = {
    DefaultColors = { R = 0, G = 0, B = 0, A = 0 },
    PureWhite = { R = 255, G = 255, B = 255, A = 255 },
    White = { R = 240, G = 240, B = 240, A = 255 },
    Black = { R = 0, G = 0, B = 0, A = 255 },
    Grey = { R = 155, G = 155, B = 155, A = 255 },
    GreyLight = { R = 205, G = 205, B = 205, A = 255 },
    GreyDark = { R = 77, G = 77, B = 77, A = 255 },
    Red = { R = 224, G = 50, B = 50, A = 255 },
    RedLight = { R = 240, G = 153, B = 153, A = 255 },
    RedDark = { R = 112, G = 25, B = 25, A = 255 },
    Blue = { R = 93, G = 182, B = 229, A = 255 },
    BlueLight = { R = 174, G = 219, B = 242, A = 255 },
    BlueDark = { R = 47, G = 92, B = 115, A = 255 },
    Yellow = { R = 240, G = 200, B = 80, A = 255 },
    YellowLight = { R = 254, G = 235, B = 169, A = 255 },
    YellowDark = { R = 126, G = 107, B = 41, A = 255 },
    Orange = { R = 255, G = 133, B = 85, A = 255 },
    OrangeLight = { R = 255, G = 194, B = 170, A = 255 },
    OrangeDark = { R = 127, G = 66, B = 42, A = 255 },
    Green = { R = 114, G = 204, B = 114, A = 255 },
    GreenLight = { R = 185, G = 230, B = 185, A = 255 },
    GreenDark = { R = 57, G = 102, B = 57, A = 255 },
    Purple = { R = 132, G = 102, B = 226, A = 255 },
    PurpleLight = { R = 192, G = 179, B = 239, A = 255 },
    PurpleDark = { R = 67, G = 57, B = 111, A = 255 },
    Pink = { R = 203, G = 54, B = 148, A = 255 },
    RadarHealth = { R = 53, G = 154, B = 71, A = 255 },
    RadarArmour = { R = 93, G = 182, B = 229, A = 255 },
    RadarDamage = { R = 235, G = 36, B = 39, A = 255 },
    NetPlayer1 = { R = 194, G = 80, B = 80, A = 255 },
    NetPlayer2 = { R = 156, G = 110, B = 175, A = 255 },
    NetPlayer3 = { R = 255, G = 123, B = 196, A = 255 },
    NetPlayer4 = { R = 247, G = 159, B = 123, A = 255 },
    NetPlayer5 = { R = 178, G = 144, B = 132, A = 255 },
    NetPlayer6 = { R = 141, G = 206, B = 167, A = 255 },
    NetPlayer7 = { R = 113, G = 169, B = 175, A = 255 },
    NetPlayer8 = { R = 211, G = 209, B = 231, A = 255 },
    NetPlayer9 = { R = 144, G = 127, B = 153, A = 255 },
    NetPlayer10 = { R = 106, G = 196, B = 191, A = 255 },
    NetPlayer11 = { R = 214, G = 196, B = 153, A = 255 },
    NetPlayer12 = { R = 234, G = 142, B = 80, A = 255 },
    NetPlayer13 = { R = 152, G = 203, B = 234, A = 255 },
    NetPlayer14 = { R = 178, G = 98, B = 135, A = 255 },
    NetPlayer15 = { R = 144, G = 142, B = 122, A = 255 },
    NetPlayer16 = { R = 166, G = 117, B = 94, A = 255 },
    NetPlayer17 = { R = 175, G = 168, B = 168, A = 255 },
    NetPlayer18 = { R = 232, G = 142, B = 155, A = 255 },
    NetPlayer19 = { R = 187, G = 214, B = 91, A = 255 },
    NetPlayer20 = { R = 12, G = 123, B = 86, A = 255 },
    NetPlayer21 = { R = 123, G = 196, B = 255, A = 255 },
    NetPlayer22 = { R = 171, G = 60, B = 230, A = 255 },
    NetPlayer23 = { R = 206, G = 169, B = 13, A = 255 },
    NetPlayer24 = { R = 71, G = 99, B = 173, A = 255 },
    NetPlayer25 = { R = 42, G = 166, B = 185, A = 255 },
    NetPlayer26 = { R = 186, G = 157, B = 125, A = 255 },
    NetPlayer27 = { R = 201, G = 225, B = 255, A = 255 },
    NetPlayer28 = { R = 240, G = 240, B = 150, A = 255 },
    NetPlayer29 = { R = 237, G = 140, B = 161, A = 255 },
    NetPlayer30 = { R = 249, G = 138, B = 138, A = 255 },
    NetPlayer31 = { R = 252, G = 239, B = 166, A = 255 },
    NetPlayer32 = { R = 240, G = 240, B = 240, A = 255 },
    SimpleBlipDefault = { R = 159, G = 201, B = 166, A = 255 },
    MenuBlue = { R = 140, G = 140, B = 140, A = 255 },
    MenuGreyLight = { R = 140, G = 140, B = 140, A = 255 },
    MenuBlueExtraDark = { R = 40, G = 40, B = 40, A = 255 },
    MenuYellow = { R = 240, G = 160, B = 0, A = 255 },
    MenuYellowDark = { R = 240, G = 160, B = 0, A = 255 },
    MenuGreen = { R = 240, G = 160, B = 0, A = 255 },
    MenuGrey = { R = 140, G = 140, B = 140, A = 255 },
    MenuGreyDark = { R = 60, G = 60, B = 60, A = 255 },
    MenuHighlight = { R = 30, G = 30, B = 30, A = 255 },
    MenuStandard = { R = 140, G = 140, B = 140, A = 255 },
    MenuDimmed = { R = 75, G = 75, B = 75, A = 255 },
    MenuExtraDimmed = { R = 50, G = 50, B = 50, A = 255 },
    BriefTitle = { R = 95, G = 95, B = 95, A = 255 },
    MidGreyMp = { R = 100, G = 100, B = 100, A = 255 },
    NetPlayer1Dark = { R = 93, G = 39, B = 39, A = 255 },
    NetPlayer2Dark = { R = 77, G = 55, B = 89, A = 255 },
    NetPlayer3Dark = { R = 124, G = 62, B = 99, A = 255 },
    NetPlayer4Dark = { R = 120, G = 80, B = 80, A = 255 },
    NetPlayer5Dark = { R = 87, G = 72, B = 66, A = 255 },
    NetPlayer6Dark = { R = 74, G = 103, B = 83, A = 255 },
    NetPlayer7Dark = { R = 60, G = 85, B = 88, A = 255 },
    NetPlayer8Dark = { R = 105, G = 105, B = 64, A = 255 },
    NetPlayer9Dark = { R = 72, G = 63, B = 76, A = 255 },
    NetPlayer10Dark = { R = 53, G = 98, B = 95, A = 255 },
    NetPlayer11Dark = { R = 107, G = 98, B = 76, A = 255 },
    NetPlayer12Dark = { R = 117, G = 71, B = 40, A = 255 },
    NetPlayer13Dark = { R = 76, G = 101, B = 117, A = 255 },
    NetPlayer14Dark = { R = 65, G = 35, B = 47, A = 255 },
    NetPlayer15Dark = { R = 72, G = 71, B = 61, A = 255 },
    NetPlayer16Dark = { R = 85, G = 58, B = 47, A = 255 },
    NetPlayer17Dark = { R = 87, G = 84, B = 84, A = 255 },
    NetPlayer18Dark = { R = 116, G = 71, B = 77, A = 255 },
    NetPlayer19Dark = { R = 93, G = 107, B = 45, A = 255 },
    NetPlayer20Dark = { R = 6, G = 61, B = 43, A = 255 },
    NetPlayer21Dark = { R = 61, G = 98, B = 127, A = 255 },
    NetPlayer22Dark = { R = 85, G = 30, B = 115, A = 255 },
    NetPlayer23Dark = { R = 103, G = 84, B = 6, A = 255 },
    NetPlayer24Dark = { R = 35, G = 49, B = 86, A = 255 },
    NetPlayer25Dark = { R = 21, G = 83, B = 92, A = 255 },
    NetPlayer26Dark = { R = 93, G = 98, B = 62, A = 255 },
    NetPlayer27Dark = { R = 100, G = 112, B = 127, A = 255 },
    NetPlayer28Dark = { R = 120, G = 120, B = 75, A = 255 },
    NetPlayer29Dark = { R = 152, G = 76, B = 93, A = 255 },
    NetPlayer30Dark = { R = 124, G = 69, B = 69, A = 255 },
    NetPlayer31Dark = { R = 10, G = 43, B = 50, A = 255 },
    NetPlayer32Dark = { R = 95, G = 95, B = 10, A = 255 },
    Bronze = { R = 180, G = 130, B = 97, A = 255 },
    Silver = { R = 150, G = 153, B = 161, A = 255 },
    Gold = { R = 214, G = 181, B = 99, A = 255 },
    Platinum = { R = 166, G = 221, B = 190, A = 255 },
    Gang1 = { R = 29, G = 100, B = 153, A = 255 },
    Gang2 = { R = 214, G = 116, B = 15, A = 255 },
    Gang3 = { R = 135, G = 125, B = 142, A = 255 },
    Gang4 = { R = 229, G = 119, B = 185, A = 255 },
    SameCrew = { R = 252, G = 239, B = 166, A = 255 },
    Freemode = { R = 45, G = 110, B = 185, A = 255 },
    PauseBg = { R = 0, G = 0, B = 0, A = 255 },
    Friendly = { R = 93, G = 182, B = 229, A = 255 },
    Enemy = { R = 194, G = 80, B = 80, A = 255 },
    Location = { R = 240, G = 200, B = 80, A = 255 },
    Pickup = { R = 114, G = 204, B = 114, A = 255 },
    PauseSingleplayer = { R = 114, G = 204, B = 114, A = 255 },
    FreemodeDark = { R = 22, G = 55, B = 92, A = 255 },
    InactiveMission = { R = 154, G = 154, B = 154, A = 255 },
    Damage = { R = 194, G = 80, B = 80, A = 255 },
    PinkLight = { R = 252, G = 115, B = 201, A = 255 },
    PmMitemHighlight = { R = 252, G = 177, B = 49, A = 255 },
    ScriptVariable = { R = 0, G = 0, B = 0, A = 255 },
    Yoga = { R = 109, G = 247, B = 204, A = 255 },
    Tennis = { R = 241, G = 101, B = 34, A = 255 },
    Golf = { R = 214, G = 189, B = 97, A = 255 },
    ShootingRange = { R = 112, G = 25, B = 25, A = 255 },
    FlightSchool = { R = 47, G = 92, B = 115, A = 255 },
    NorthBlue = { R = 93, G = 182, B = 229, A = 255 },
    SocialClub = { R = 234, G = 153, B = 28, A = 255 },
    PlatformBlue = { R = 11, G = 55, B = 123, A = 255 },
    PlatformGreen = { R = 146, G = 200, B = 62, A = 255 },
    PlatformGrey = { R = 234, G = 153, B = 28, A = 255 },
    FacebookBlue = { R = 66, G = 89, B = 148, A = 255 },
    IngameBg = { R = 0, G = 0, B = 0, A = 255 },
    Darts = { R = 114, G = 204, B = 114, A = 255 },
    Waypoint = { R = 164, G = 76, B = 242, A = 255 },
    Michael = { R = 101, G = 180, B = 212, A = 255 },
    Franklin = { R = 171, G = 237, B = 171, A = 255 },
    Trevor = { R = 255, G = 163, B = 87, A = 255 },
    GolfP1 = { R = 240, G = 240, B = 240, A = 255 },
    GolfP2 = { R = 235, G = 239, B = 30, A = 255 },
    GolfP3 = { R = 255, G = 149, B = 14, A = 255 },
    GolfP4 = { R = 246, G = 60, B = 161, A = 255 },
    WaypointLight = { R = 210, G = 166, B = 249, A = 255 },
    WaypointDark = { R = 82, G = 38, B = 121, A = 255 },
    PanelLight = { R = 0, G = 0, B = 0, A = 255 },
    MichaelDark = { R = 72, G = 103, B = 116, A = 255 },
    FranklinDark = { R = 85, G = 118, B = 85, A = 255 },
    TrevorDark = { R = 127, G = 81, B = 43, A = 255 },
    ObjectiveRoute = { R = 240, G = 200, B = 80, A = 255 },
    PausemapTint = { R = 0, G = 0, B = 0, A = 255 },
    PauseDeselect = { R = 100, G = 100, B = 100, A = 255 },
    PmWeaponsPurchasable = { R = 45, G = 110, B = 185, A = 255 },
    PmWeaponsLocked = { R = 240, G = 240, B = 240, A = 255 },
    EndScreenBg = { R = 0, G = 0, B = 0, A = 255 },
    Chop = { R = 224, G = 50, B = 50, A = 255 },
    PausemapTintHalf = { R = 0, G = 0, B = 0, A = 255 },
    NorthBlueOfficial = { R = 0, G = 71, B = 133, A = 255 },
    ScriptVariable2 = { R = 0, G = 0, B = 0, A = 255 },
    H = { R = 33, G = 118, B = 37, A = 255 },
    HDark = { R = 37, G = 102, B = 40, A = 255 },
    T = { R = 234, G = 153, B = 28, A = 255 },
    TDark = { R = 225, G = 140, B = 8, A = 255 },
    HShard = { R = 20, G = 40, B = 0, A = 255 },
    ControllerMichael = { R = 48, G = 255, B = 255, A = 255 },
    ControllerFranklin = { R = 48, G = 255, B = 0, A = 255 },
    ControllerTrevor = { R = 176, G = 80, B = 0, A = 255 },
    ControllerChop = { R = 127, G = 0, B = 0, A = 255 },
    VideoEditorVideo = { R = 53, G = 166, B = 224, A = 255 },
    VideoEditorAudio = { R = 162, G = 79, B = 157, A = 255 },
    VideoEditorText = { R = 104, G = 192, B = 141, A = 255 },
    HbBlue = { R = 29, G = 100, B = 153, A = 255 },
    HbYellow = { R = 234, G = 153, B = 28, A = 255 },
    VideoEditorScore = { R = 240, G = 160, B = 1, A = 255 },
    VideoEditorAudioFadeout = { R = 59, G = 34, B = 57, A = 255 },
    VideoEditorTextFadeout = { R = 41, G = 68, B = 53, A = 255 },
    VideoEditorScoreFadeout = { R = 82, G = 58, B = 10, A = 255 },
    HeistBackground = { R = 37, G = 102, B = 40, A = 255 },
    VideoEditorAmbient = { R = 240, G = 200, B = 80, A = 255 },
    VideoEditorAmbientFadeout = { R = 80, G = 70, B = 34, A = 255 },
    Gb = { R = 255, G = 133, B = 85, A = 255 },
    G = { R = 255, G = 194, B = 170, A = 255 },
    B = { R = 255, G = 133, B = 85, A = 255 },
    LowFlow = { R = 240, G = 200, B = 80, A = 255 },
    LowFlowDark = { R = 126, G = 107, B = 41, A = 255 },
    G1 = { R = 247, G = 159, B = 123, A = 255 },
    G2 = { R = 226, G = 134, B = 187, A = 255 },
    G3 = { R = 239, G = 238, B = 151, A = 255 },
    G4 = { R = 113, G = 169, B = 175, A = 255 },
    G5 = { R = 160, G = 140, B = 193, A = 255 },
    G6 = { R = 141, G = 206, B = 167, A = 255 },
    G7 = { R = 181, G = 214, B = 234, A = 255 },
    G8 = { R = 178, G = 144, B = 132, A = 255 },
    G9 = { R = 0, G = 132, B = 114, A = 255 },
    G10 = { R = 216, G = 85, B = 117, A = 255 },
    G11 = { R = 30, G = 100, B = 152, A = 255 },
    G12 = { R = 43, G = 181, B = 117, A = 255 },
    G13 = { R = 233, G = 141, B = 79, A = 255 },
    G14 = { R = 137, G = 210, B = 215, A = 255 },
    G15 = { R = 134, G = 125, B = 141, A = 255 },
    Adversary = { R = 109, G = 34, B = 33, A = 255 },
    DegenRed = { R = 255, G = 0, B = 0, A = 255 },
    DegenYellow = { R = 255, G = 255, B = 0, A = 255 },
    DegenGreen = { R = 0, G = 255, B = 0, A = 255 },
    DegenCyan = { R = 0, G = 255, B = 255, A = 255 },
    DegenBlue = { R = 0, G = 0, B = 255, A = 255 },
    DegenMagenta = { R = 255, G = 0, B = 255, A = 255 },
    Stunt1 = { R = 38, G = 136, B = 234, A = 255 },
    Stunt2 = { R = 224, G = 50, B = 50, A = 255 },
}

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\elements\ColoursPanel ]]
--==================================================================================================================================================--
ColoursPanel = {}
ColoursPanel.HairCut = {
    {22, 19, 19}, -- 0
    {30, 28, 25}, -- 1
    {76, 56, 45}, -- 2
    {69, 34, 24}, -- 3
    {123, 59, 31}, -- 4
    {149, 68, 35}, -- 5
    {165, 87, 50}, -- 6
    {175, 111, 72}, -- 7
    {159, 105, 68}, -- 8
    {198, 152, 108}, -- 9
    {213, 170, 115}, -- 10
    {223, 187, 132}, -- 11
    {202, 164, 110}, -- 12
    {238, 204, 130}, -- 13
    {229, 190, 126}, -- 14
    {250, 225, 167}, -- 15
    {187, 140, 96}, -- 16
    {163, 92, 60}, -- 17
    {144, 52, 37}, -- 18
    {134, 21, 17}, -- 19
    {164, 24, 18}, -- 20
    {195, 33, 24}, -- 21
    {221, 69, 34}, -- 22
    {229, 71, 30}, -- 23
    {208, 97, 56}, -- 24
    {113, 79, 38}, -- 25
    {132, 107, 95}, -- 26
    {185, 164, 150}, -- 27
    {218, 196, 180}, -- 28
    {247, 230, 217}, -- 29
    {102, 72, 93}, -- 30
    {162, 105, 138}, -- 31
    {171, 174, 11}, -- 32
    {239, 61, 200}, -- 33
    {255, 69, 152}, -- 34
    {255, 178, 191}, -- 35
    {12, 168, 146}, -- 36
    {8, 146, 165}, -- 37
    {11, 82, 134}, -- 38
    {118, 190, 117}, -- 39
    {52, 156, 104}, -- 40
    {22, 86, 85}, -- 41
    {152, 177, 40}, -- 42
    {127, 162, 23}, -- 43
    {241, 200, 98}, -- 44
    {238, 178, 16}, -- 45
    {224, 134, 14}, -- 46
    {247, 157, 15}, -- 47
    {243, 143, 16}, -- 48
    {231, 70, 15}, -- 49
    {255, 101, 21}, -- 50
    {254, 91, 34}, -- 51
    {252, 67, 21}, -- 52
    {196, 12, 15}, -- 53
    {143, 10, 14}, -- 54
    {44, 27, 22}, -- 55
    {80, 51, 37}, -- 56
    {98, 54, 37}, -- 57
    {60, 31, 24}, -- 58
    {69, 43, 32}, -- 59
    {8, 10, 14}, -- 60
    {212, 185, 158}, -- 61
    {212, 185, 158}, -- 62
    {213, 170, 115} -- 63
}

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\elements\StringMeasurer ]]
--==================================================================================================================================================--
CharacterMap = {
    [' '] = 6,
    ['!'] = 6,
    ['"'] = 6,
    ['#'] = 11,
    ['$'] = 10,
    ['%'] = 17,
    ['&'] = 13,
    ['\\'] = 4,
    ['('] = 6,
    [')'] = 6,
    ['*'] = 7,
    ['+'] = 10,
    [','] = 4,
    ['-'] = 6,
    ['.'] = 4,
    ['/'] = 7,
    ['0'] = 12,
    ['1'] = 7,
    ['2'] = 11,
    ['3'] = 11,
    ['4'] = 11,
    ['5'] = 11,
    ['6'] = 12,
    ['7'] = 10,
    ['8'] = 11,
    ['9'] = 11,
    [':'] = 5,
    [';'] = 4,
    ['<'] = 9,
    ['='] = 9,
    ['>'] = 9,
    ['?'] = 10,
    ['@'] = 15,
    ['A'] = 12,
    ['B'] = 13,
    ['C'] = 14,
    ['D'] = 14,
    ['E'] = 12,
    ['F'] = 12,
    ['G'] = 15,
    ['H'] = 14,
    ['I'] = 5,
    ['J'] = 11,
    ['K'] = 13,
    ['L'] = 11,
    ['M'] = 16,
    ['N'] = 14,
    ['O'] = 16,
    ['P'] = 12,
    ['Q'] = 15,
    ['R'] = 13,
    ['S'] = 12,
    ['T'] = 11,
    ['U'] = 13,
    ['V'] = 12,
    ['W'] = 18,
    ['X'] = 11,
    ['Y'] = 11,
    ['Z'] = 12,
    ['['] = 6,
    [']'] = 6,
    ['^'] = 9,
    ['_'] = 18,
    ['`'] = 8,
    ['a'] = 11,
    ['b'] = 12,
    ['c'] = 11,
    ['d'] = 12,
    ['e'] = 12,
    ['f'] = 5,
    ['g'] = 13,
    ['h'] = 11,
    ['i'] = 4,
    ['j'] = 4,
    ['k'] = 10,
    ['l'] = 4,
    ['m'] = 18,
    ['n'] = 11,
    ['o'] = 12,
    ['p'] = 12,
    ['q'] = 12,
    ['r'] = 7,
    ['s'] = 9,
    ['t'] = 5,
    ['u'] = 11,
    ['v'] = 10,
    ['w'] = 14,
    ['x'] = 9,
    ['y'] = 10,
    ['z'] = 9,
    ['{'] = 6,
    ['|'] = 3,
    ['}'] = 6
}
function MeasureString(str)
    local output = 0
    for i = 1, GetCharacterCount(str), 1 do
        if CharacterMap[string.sub(str, i, i)] then output = output + CharacterMap[string.sub(str, i, i)] + 1 end
    end
    return output
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuItem ]]
--==================================================================================================================================================--
UIMenuItem = setmetatable({}, UIMenuItem)
UIMenuItem.__index = UIMenuItem
UIMenuItem.__call = function() return "UIMenuItem", "UIMenuItem" end
do
    function UIMenuItem.New(Text, Description)
        local _UIMenuItem = {
            Rectangle = UIResRectangle.New(0, 0, 431, 38, 255, 255, 255, 20),
            Text = UIResText.New(tostring(Text) or "", 8, 0, 0.33, 245, 245, 245, 255, 0),
            _Text = {
                Padding = {X = 8},
                Colour = {Selected = {R = 25, G = 25, B = 25, A = 255}, Hovered = {R = 245, G = 245, B = 245, A = 255}}
            },
            _Description = tostring(Description) or "",
            SelectedSprite = Sprite.New("commonmenu", "gradient_nav", 0, 0, 431, 38, nil, 200, 200, 200, 150),
            LeftBadge = {Sprite = Sprite.New("commonmenu", "", 0, 0, 35, 35), Badge = 0},
            RightBadge = {Sprite = Sprite.New("commonmenu", "", 0, 0, 35, 35), Badge = 0},
            Label = {
                Text = UIResText.New("", 0, 0, 0.33, 245, 245, 245, 255, 0, "Right"),
                MainColour = {R = 255, G = 255, B = 255, A = 255},
                HighlightColour = {R = 0, G = 0, B = 0, A = 255}
            },
            _Selected = false,
            _Hovered = false,
            _Enabled = true,
            _Offset = {X = 0, Y = 0},
            _LabelOffset = {X = 0, Y = 0},
            _LeftBadgeOffset = {X = 0, Y = 0},
            _RightBadgeOffset = {X = 0, Y = 0},
            ParentMenu = nil,
            Panels = {},
            Activated = function(menu, item) end,
            ActivatedPanel = function(menu, item, panel, panelvalue) end
        }
        return setmetatable(_UIMenuItem, UIMenuItem)
    end

    function UIMenuItem:SetParentMenu(Menu)
        if Menu ~= nil and Menu() == "UIMenu" then
            self.ParentMenu = Menu
        else
            return self.ParentMenu
        end
    end

    function UIMenuItem:Selected(bool)
        if bool ~= nil then
            self._Selected = ToBool(bool)
        else
            return self._Selected
        end
    end

    function UIMenuItem:Hovered(bool)
        if bool ~= nil then
            self._Hovered = ToBool(bool)
        else
            return self._Hovered
        end
    end

    function UIMenuItem:Enabled(bool)
        if bool ~= nil then
            self._Enabled = ToBool(bool)
        else
            return self._Enabled
        end
    end

    function UIMenuItem:Description(str)
        if tostring(str) and str ~= nil then
            self._Description = tostring(str)
        else
            return self._Description
        end
    end

    function UIMenuItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self._Offset.X = tonumber(X) end
            if tonumber(Y) then self._Offset.Y = tonumber(Y) end
        else
            return self._Offset
        end
    end

    function UIMenuItem:LeftBadgeOffset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self._LeftBadgeOffset.X = tonumber(X) end
            if tonumber(Y) then self._LeftBadgeOffset.Y = tonumber(Y) end
        else
            return self._LeftBadgeOffset
        end
    end

    function UIMenuItem:RightBadgeOffset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self._RightBadgeOffset.X = tonumber(X) end
            if tonumber(Y) then self._RightBadgeOffset.Y = tonumber(Y) end
        else
            return self._RightBadgeOffset
        end
    end

    function UIMenuItem:Position(Y)
        if tonumber(Y) then
            self.Rectangle:Position(self._Offset.X, Y + 144 + self._Offset.Y)
            self.SelectedSprite:Position(0 + self._Offset.X, Y + 144 + self._Offset.Y)
            self.Text:Position(self._Text.Padding.X + self._Offset.X, Y + 149 + self._Offset.Y)
            self.LeftBadge.Sprite:Position(0 + self._Offset.X + self._LeftBadgeOffset.X, Y + 146 + self._Offset.Y + self._LeftBadgeOffset.Y)
            self.RightBadge.Sprite:Position(385 + self._Offset.X + self._RightBadgeOffset.X,
                                            Y + 146 + self._Offset.Y + self._RightBadgeOffset.Y)
            self.Label.Text:Position(415 + self._Offset.X + self._LabelOffset.X, Y + 148 + self._Offset.Y + self._LabelOffset.Y)
        end
    end

    function UIMenuItem:RightLabel(Text, MainColour, HighlightColour)
        if MainColour ~= nil then
            local labelMainColour = MainColour
        else
            local labelMainColour = {R = 255, G = 255, B = 255, A = 255}
        end
        if HighlightColour ~= nil then
            local labelHighlightColour = HighlightColour
        else
            local labelHighlightColour = {R = 0, G = 0, B = 0, A = 255}
        end
        if tostring(Text) and Text ~= nil then
            if type(labelMainColour) == "table" then self.Label.MainColour = labelMainColour end
            if type(labelHighlightColour) == "table" then self.Label.HighlightColour = labelHighlightColour end
            self.Label.Text:Text(tostring(Text))
        else
            self.Label.MainColour = {R = 0, G = 0, B = 0, A = 0}
            self.Label.HighlightColour = {R = 0, G = 0, B = 0, A = 0}
            return self.Label.Text:Text()
        end
    end

    function UIMenuItem:SetLeftBadge(Badge) if tonumber(Badge) then self.LeftBadge.Badge = tonumber(Badge) end end

    function UIMenuItem:SetRightBadge(Badge) if tonumber(Badge) then self.RightBadge.Badge = tonumber(Badge) end end

    function UIMenuItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Text:Text(tostring(Text))
        else
            return self.Text:Text()
        end
    end

    function UIMenuItem:SetTextSelectedColor(R, G, B, A)
        if tonumber(R) and tonumber(G) and tonumber(B) and tonumber(A) then
            self._Text.Colour.Selected.R = R
            self._Text.Colour.Selected.G = G
            self._Text.Colour.Selected.B = B
            self._Text.Colour.Selected.A = A
        else
            return {
                R = self._Text.Colour.Selected.R,
                G = self._Text.Colour.Selected.G,
                B = self._Text.Colour.Selected.B,
                A = self._Text.Colour.Selected.A
            }
        end
    end

    function UIMenuItem:SetTextHoveredColor(R, G, B, A)
        if tonumber(R) and tonumber(G) and tonumber(B) and tonumber(A) then
            self._Text.Colour.Hovered.R = R
            self._Text.Colour.Hovered.G = G
            self._Text.Colour.Hovered.B = B
            self._Text.Colour.Hovered.A = A
        else
            return {
                R = self._Text.Colour.Hovered.R,
                G = self._Text.Colour.Hovered.G,
                B = self._Text.Colour.Hovered.B,
                A = self._Text.Colour.Hovered.A
            }
        end
    end

    function UIMenuItem:AddPanel(Panel)
        if Panel() == "UIMenuPanel" then
            table.insert(self.Panels, Panel)
            Panel:SetParentItem(self)
        end
    end

    function UIMenuItem:RemovePanelAt(Index)
        if tonumber(Index) then if self.Panels[Index] then table.remove(self.Panels, tonumber(Index)) end end
    end

    function UIMenuItem:FindPanelIndex(Panel)
        if Panel() == "UIMenuPanel" then for Index = 1, #self.Panels do if self.Panels[Index] == Panel then return Index end end end
        return nil
    end

    function UIMenuItem:FindPanelItem()
        for Index = #self.Items, 1, -1 do if self.Items[Index].Panel then return Index end end
        return nil
    end

    function UIMenuItem:Draw()
        self.Rectangle:Size(431 + self.ParentMenu.WidthOffset, self.Rectangle.Height)
        self.SelectedSprite:Size(431 + self.ParentMenu.WidthOffset, self.SelectedSprite.Height)

        if self._Hovered and not self._Selected then self.Rectangle:Draw() end

        if self._Selected then self.SelectedSprite:Draw() end

        if self._Enabled then
            if self._Selected then
                self.Text:Colour(self._Text.Colour.Selected.R, self._Text.Colour.Selected.G, self._Text.Colour.Selected.B,
                                    self._Text.Colour.Selected.A)
                self.Label.Text:Colour(self.Label.HighlightColour.R, self.Label.HighlightColour.G, self.Label.HighlightColour.B,
                                        self.Label.HighlightColour.A)
            else
                self.Text:Colour(self._Text.Colour.Hovered.R, self._Text.Colour.Hovered.G, self._Text.Colour.Hovered.B,
                                    self._Text.Colour.Hovered.A)
                self.Label.Text:Colour(self.Label.MainColour.R, self.Label.MainColour.G, self.Label.MainColour.B, self.Label.MainColour.A)
            end
        else
            self.Text:Colour(163, 159, 148, 255)
            self.Label.Text:Colour(163, 159, 148, 255)
        end

        if self.LeftBadge.Badge == BadgeStyle.None then
            self.Text:Position(self._Text.Padding.X + self._Offset.X, self.Text.Y)
        else
            self.Text:Position(35 + self._Offset.X + self._LeftBadgeOffset.X, self.Text.Y)
            self.LeftBadge.Sprite.TxtDictionary = GetBadgeDictionary(self.LeftBadge.Badge, self._Selected)
            self.LeftBadge.Sprite.TxtName = GetBadgeTexture(self.LeftBadge.Badge, self._Selected)
            self.LeftBadge.Sprite:Colour(GetBadgeColour(self.LeftBadge.Badge, self._Selected))
            self.LeftBadge.Sprite:Draw()
        end

        if self.RightBadge.Badge ~= BadgeStyle.None then
            self.RightBadge.Sprite:Position(385 + self._Offset.X + self.ParentMenu.WidthOffset + self._RightBadgeOffset.X,
                                            self.RightBadge.Sprite.Y)
            self.RightBadge.Sprite.TxtDictionary = GetBadgeDictionary(self.RightBadge.Badge, self._Selected)
            self.RightBadge.Sprite.TxtName = GetBadgeTexture(self.RightBadge.Badge, self._Selected)
            self.RightBadge.Sprite:Colour(GetBadgeColour(self.RightBadge.Badge, self._Selected))
            self.RightBadge.Sprite:Draw()
        end

        if self.Label.Text:Text() ~= "" and string.len(self.Label.Text:Text()) > 0 then
            if self.RightBadge.Badge ~= BadgeStyle.None then
                self.Label.Text:Position(385 + self._Offset.X + self.ParentMenu.WidthOffset + self._RightBadgeOffset.X, self.Label.Text.Y)
                self.Label.Text:Draw()
            else
                self.Label.Text:Position(415 + self._Offset.X + self.ParentMenu.WidthOffset + self._LabelOffset.X, self.Label.Text.Y)
                self.Label.Text:Draw()
            end
        end

        self.Text:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuCheckboxItem ]]
--==================================================================================================================================================--
UIMenuCheckboxItem = setmetatable({}, UIMenuCheckboxItem)
UIMenuCheckboxItem.__index = UIMenuCheckboxItem
UIMenuCheckboxItem.__call = function() return "UIMenuItem", "UIMenuCheckboxItem" end
do
    function UIMenuCheckboxItem.New(Text, Check, Description, CheckboxStyle)
        if CheckboxStyle ~= nil then
            CheckboxStyle = tonumber(CheckboxStyle)
        else
            CheckboxStyle = 1
        end
        local _UIMenuCheckboxItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            CheckboxStyle = CheckboxStyle,
            CheckedSprite = Sprite.New("commonmenu", "shop_box_blank", 410, 95, 50, 50),
            Checked = ToBool(Check),
            CheckboxEvent = function(menu, item, checked) end
        }
        return setmetatable(_UIMenuCheckboxItem, UIMenuCheckboxItem)
    end

    function UIMenuCheckboxItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuCheckboxItem:Position(Y)
        if tonumber(Y) then
            self.Base:Position(Y)
            self.CheckedSprite:Position(380 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 138 + self.Base._Offset.Y)
        end
    end

    function UIMenuCheckboxItem:Selected(bool)
        if bool ~= nil then
            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuCheckboxItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuCheckboxItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuCheckboxItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuCheckboxItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuCheckboxItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuCheckboxItem:SetLeftBadge() error("This item does not support badges") end

    function UIMenuCheckboxItem:SetRightBadge() error("This item does not support badges") end

    function UIMenuCheckboxItem:RightLabel() error("This item does not support a right label") end

    function UIMenuCheckboxItem:Draw()
        self.Base:Draw()
        self.CheckedSprite:Position(380 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, self.CheckedSprite.Y)
        if self.CheckboxStyle == nil or self.CheckboxStyle == tonumber(1) then
            if self.Base:Selected() then
                if self.Checked then
                    self.CheckedSprite.TxtName = "shop_box_tickb"
                else
                    self.CheckedSprite.TxtName = "shop_box_blankb"
                end
            else
                if self.Checked then
                    self.CheckedSprite.TxtName = "shop_box_tick"
                else
                    self.CheckedSprite.TxtName = "shop_box_blank"
                end
            end
        elseif self.CheckboxStyle == tonumber(2) then
            if self.Base:Selected() then
                if self.Checked then
                    self.CheckedSprite.TxtName = "shop_box_crossb"
                else
                    self.CheckedSprite.TxtName = "shop_box_blankb"
                end
            else
                if self.Checked then
                    self.CheckedSprite.TxtName = "shop_box_cross"
                else
                    self.CheckedSprite.TxtName = "shop_box_blank"
                end
            end
        end
        self.CheckedSprite:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuListItem ]]
--==================================================================================================================================================--
UIMenuListItem = setmetatable({}, UIMenuListItem)
UIMenuListItem.__index = UIMenuListItem
UIMenuListItem.__call = function() return "UIMenuItem", "UIMenuListItem" end
do
    function UIMenuListItem.New(Text, Items, Index, Description)
        if type(Items) ~= "table" then Items = {} end
        if Index == 0 then Index = 1 end
        local _UIMenuListItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            Items = Items,
            LeftArrow = Sprite.New("commonmenu", "arrowleft", 110, 105, 30, 30),
            RightArrow = Sprite.New("commonmenu", "arrowright", 280, 105, 30, 30),
            ItemText = UIResText.New("", 290, 104, 0.35, 255, 255, 255, 255, 0, "Right"),
            _Index = tonumber(Index) or 1,
            Panels = {},
            OnListChanged = function(menu, item, newindex) end,
            OnListSelected = function(menu, item, newindex) end
        }
        return setmetatable(_UIMenuListItem, UIMenuListItem)
    end

    function UIMenuListItem:SetParentMenu(Menu)
        if Menu ~= nil and Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuListItem:Position(Y)
        if tonumber(Y) then
            self.LeftArrow:Position(300 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 147 + Y + self.Base._Offset.Y)
            self.RightArrow:Position(400 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 147 + Y + self.Base._Offset.Y)
            self.ItemText:Position(300 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 147 + Y + self.Base._Offset.Y)
            self.Base:Position(Y)
        end
    end

    function UIMenuListItem:Selected(bool)
        if bool ~= nil then
            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuListItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuListItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuListItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuListItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuListItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuListItem:Index(Index)
        if tonumber(Index) then
            if tonumber(Index) > #self.Items then
                self._Index = 1
            elseif tonumber(Index) < 1 then
                self._Index = #self.Items
            else
                self._Index = tonumber(Index)
            end
        else
            return self._Index
        end
    end

    function UIMenuListItem:ItemToIndex(Item)
        for i = 1, #self.Items do
            if type(Item) == type(self.Items[i]) and Item == self.Items[i] then
                return i
            elseif type(self.Items[i]) == "table" and (type(Item) == type(self.Items[i].Name) or type(Item) == type(self.Items[i].Value)) and
                (Item == self.Items[i].Name or Item == self.Items[i].Value) then
                return i
            end
        end
    end

    function UIMenuListItem:IndexToItem(Index)
        if tonumber(Index) then
            if tonumber(Index) == 0 then Index = 1 end
            if self.Items[tonumber(Index)] then return self.Items[tonumber(Index)] end
        end
    end

    function UIMenuListItem:SetLeftBadge() error("This item does not support badges") end

    function UIMenuListItem:SetRightBadge() error("This item does not support badges") end

    function UIMenuListItem:RightLabel() error("This item does not support a right label") end

    function UIMenuListItem:AddPanel(Panel)
        if Panel() == "UIMenuPanel" then
            table.insert(self.Panels, Panel)
            Panel:SetParentItem(self)
        end
    end

    function UIMenuListItem:RemovePanelAt(Index)
        if tonumber(Index) then if self.Panels[Index] then table.remove(self.Panels, tonumber(Index)) end end
    end

    function UIMenuListItem:FindPanelIndex(Panel)
        if Panel() == "UIMenuPanel" then for Index = 1, #self.Panels do if self.Panels[Index] == Panel then return Index end end end
        return nil
    end

    function UIMenuListItem:FindPanelItem()
        for Index = #self.Items, 1, -1 do if self.Items[Index].Panel then return Index end end
        return nil
    end

    function UIMenuListItem:Draw()
        self.Base:Draw()

        if self:Enabled() then
            if self:Selected() then
                self.ItemText:Colour(0, 0, 0, 255)
                self.LeftArrow:Colour(0, 0, 0, 255)
                self.RightArrow:Colour(0, 0, 0, 255)
            else
                self.ItemText:Colour(245, 245, 245, 255)
                self.LeftArrow:Colour(245, 245, 245, 255)
                self.RightArrow:Colour(245, 245, 245, 255)
            end
        else
            self.ItemText:Colour(163, 159, 148, 255)
            self.LeftArrow:Colour(163, 159, 148, 255)
            self.RightArrow:Colour(163, 159, 148, 255)
        end

        local Text = (type(self.Items[self._Index]) == "table") and tostring(self.Items[self._Index].Name) or
                            tostring(self.Items[self._Index])
        local Offset = MeasureStringWidth(Text, 0, 0.35)

        self.ItemText:Text(Text)
        self.LeftArrow:Position(378 - Offset + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, self.LeftArrow.Y)

        self.LeftArrow:Draw()
        self.RightArrow:Draw()
        self.ItemText:Position(403 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, self.ItemText.Y)

        self.ItemText:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuColouredItem ]]
--==================================================================================================================================================--
UIMenuColouredItem = setmetatable({}, UIMenuColouredItem)
UIMenuColouredItem.__index = UIMenuColouredItem
UIMenuColouredItem.__call = function() return "UIMenuItem", "UIMenuColouredItem" end
do
    function UIMenuColouredItem.New(Text, Description, MainColour, HighlightColour)
        if type(Colour) ~= "table" then Colour = {R = 0, G = 0, B = 0, A = 255} end
        if type(HighlightColour) ~= "table" then Colour = {R = 255, G = 255, B = 255, A = 255} end
        local _UIMenuColouredItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            Rectangle = UIResRectangle.New(0, 0, 431, 38, MainColour.R, MainColour.G, MainColour.B, MainColour.A),
            MainColour = MainColour,
            HighlightColour = HighlightColour,
            ParentMenu = nil,
            Activated = function(menu, item) end
        }
        _UIMenuColouredItem.Base.SelectedSprite:Colour(HighlightColour.R, HighlightColour.G, HighlightColour.B, HighlightColour.A)
        return setmetatable(_UIMenuColouredItem, UIMenuColouredItem)
    end

    function UIMenuColouredItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
            self.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuColouredItem:Position(Y)
        if tonumber(Y) then
            self.Base:Position(Y)
            self.Rectangle:Position(self.Base._Offset.X, Y + 144 + self.Base._Offset.Y)
        end
    end

    function UIMenuColouredItem:Selected(bool)
        if bool ~= nil then
            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuColouredItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuColouredItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuColouredItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuColouredItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuColouredItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuColouredItem:SetTextSelectedColor(R, G, B, A)
        if tonumber(R) and tonumber(G) and tonumber(B) and tonumber(A) then
            self.Base._Text.Colour.Selected.R = R
            self.Base._Text.Colour.Selected.G = G
            self.Base._Text.Colour.Selected.B = B
            self.Base._Text.Colour.Selected.A = A
        else
            return {
                R = self.Base._Text.Colour.Selected.R,
                G = self.Base._Text.Colour.Selected.G,
                B = self.Base._Text.Colour.Selected.B,
                A = self.Base._Text.Colour.Selected.A
            }
        end
    end

    function UIMenuColouredItem:SetTextHoveredColor(R, G, B, A)
        if tonumber(R) and tonumber(G) and tonumber(B) and tonumber(A) then
            self.Base._Text.Colour.Hovered.R = R
            self.Base._Text.Colour.Hovered.G = G
            self.Base._Text.Colour.Hovered.B = B
            self.Base._Text.Colour.Hovered.A = A
        else
            return {
                R = self.Base._Text.Colour.Hovered.R,
                G = self.Base._Text.Colour.Hovered.G,
                B = self.Base._Text.Colour.Hovered.B,
                A = self.Base._Text.Colour.Hovered.A
            }
        end
    end

    function UIMenuColouredItem:RightLabel(Text, MainColour, HighlightColour)
        if tostring(Text) and Text ~= nil then
            if type(MainColour) == "table" then self.Base.Label.MainColour = MainColour end
            if type(HighlightColour) == "table" then self.Base.Label.HighlightColour = HighlightColour end
            self.Base.Label.Text:Text(tostring(Text))
        else
            self.Label.MainColour = {R = 0, G = 0, B = 0, A = 0}
            self.Label.HighlightColour = {R = 0, G = 0, B = 0, A = 0}
            return self.Base.Label.Text:Text()
        end
    end

    function UIMenuColouredItem:SetLeftBadge(Badge) if tonumber(Badge) then self.Base.LeftBadge.Badge = tonumber(Badge) end end

    function UIMenuColouredItem:SetRightBadge(Badge) if tonumber(Badge) then self.Base.RightBadge.Badge = tonumber(Badge) end end

    function UIMenuColouredItem:Draw()
        self.Rectangle:Size(431 + self.ParentMenu.WidthOffset, self.Rectangle.Height)
        self.Rectangle:Draw()
        self.Base:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuProgressItem ]]
--==================================================================================================================================================--
UIMenuProgressItem = setmetatable({}, UIMenuProgressItem)
UIMenuProgressItem.__index = UIMenuProgressItem
UIMenuProgressItem.__call = function() return "UIMenuItem", "UIMenuProgressItem" end
do
    function UIMenuProgressItem.New(Text, Items, Index, Description, Counter)
        if type(Items) ~= "table" then Items = {} end
        if Index == 0 then Index = 1 end
        local _UIMenuProgressItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            Data = {Items = Items, Counter = ToBool(Counter), Max = 407.5, Index = tonumber(Index) or 1},
            Audio = {Slider = "CONTINUOUS_SLIDER", Library = "HUD_FRONTEND_DEFAULT_SOUNDSET", Id = nil},
            Background = UIResRectangle.New(0, 0, 415, 20, 0, 0, 0, 255),
            Bar = UIResRectangle.New(0, 0, 407.5, 12.5),
            OnProgressChanged = function(menu, item, newindex) end,
            OnProgressSelected = function(menu, item, newindex) end
        }

        _UIMenuProgressItem.Base.Rectangle.Height = 60
        _UIMenuProgressItem.Base.SelectedSprite.Height = 60

        if _UIMenuProgressItem.Data.Counter then
            _UIMenuProgressItem.Base:RightLabel(_UIMenuProgressItem.Data.Index .. "/" .. #_UIMenuProgressItem.Data.Items)
        else
            _UIMenuProgressItem.Base:RightLabel((type(_UIMenuProgressItem.Data.Items[_UIMenuProgressItem.Data.Index]) == "table") and
                                                    tostring(_UIMenuProgressItem.Data.Items[_UIMenuProgressItem.Data.Index].Name) or
                                                    tostring(_UIMenuProgressItem.Data.Items[_UIMenuProgressItem.Data.Index]))
        end

        _UIMenuProgressItem.Bar.Width = _UIMenuProgressItem.Data.Index / #_UIMenuProgressItem.Data.Items * _UIMenuProgressItem.Data.Max

        return setmetatable(_UIMenuProgressItem, UIMenuProgressItem)
    end

    function UIMenuProgressItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuProgressItem:Position(Y)
        if tonumber(Y) then
            self.Base:Position(Y)
            self.Data.Max = 407.5 + self.Base.ParentMenu.WidthOffset
            self.Background:Size(415 + self.Base.ParentMenu.WidthOffset, 20)
            self.Background:Position(8 + self.Base._Offset.X, 177 + Y + self.Base._Offset.Y)
            self.Bar:Position(11.75 + self.Base._Offset.X, 180.75 + Y + self.Base._Offset.Y)
        end
    end

    function UIMenuProgressItem:Selected(bool)
        if bool ~= nil then
            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuProgressItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuProgressItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuProgressItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuProgressItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuProgressItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuProgressItem:Index(Index)
        if tonumber(Index) then
            if tonumber(Index) > #self.Data.Items then
                self.Data.Index = 1
            elseif tonumber(Index) < 1 then
                self.Data.Index = #self.Data.Items
            else
                self.Data.Index = tonumber(Index)
            end

            if self.Data.Counter then
                self.Base:RightLabel(self.Data.Index .. "/" .. #self.Data.Items)
            else
                self.Base:RightLabel(
                    (type(self.Data.Items[self.Data.Index]) == "table") and tostring(self.Data.Items[self.Data.Index].Name) or
                        tostring(self.Data.Items[self.Data.Index]))
            end

            self.Bar.Width = self.Data.Index / #self.Data.Items * self.Data.Max
        else
            return self.Data.Index
        end
    end

    function UIMenuProgressItem:ItemToIndex(Item)
        for i = 1, #self.Data.Items do
            if type(Item) == type(self.Data.Items[i]) and Item == self.Data.Items[i] then
                return i
            elseif type(self.Data.Items[i]) == "table" and
                (type(Item) == type(self.Data.Items[i].Name) or type(Item) == type(self.Data.Items[i].Value)) and
                (Item == self.Data.Items[i].Name or Item == self.Data.Items[i].Value) then
                return i
            end
        end
    end

    function UIMenuProgressItem:IndexToItem(Index)
        if tonumber(Index) then
            if tonumber(Index) == 0 then Index = 1 end
            if self.Data.Items[tonumber(Index)] then return self.Data.Items[tonumber(Index)] end
        end
    end

    function UIMenuProgressItem:SetLeftBadge() error("This item does not support badges") end

    function UIMenuProgressItem:SetRightBadge() error("This item does not support badges") end

    function UIMenuProgressItem:RightLabel() error("This item does not support a right label") end

    function UIMenuProgressItem:CalculateProgress(CursorX)
        local Progress = CursorX - self.Bar.X
        self:Index(math.round(#self.Data.Items *
                                    (((Progress >= 0 and Progress <= self.Data.Max) and Progress or ((Progress < 0) and 0 or self.Data.Max)) /
                                        self.Data.Max)))
    end

    function UIMenuProgressItem:Draw()
        self.Base:Draw()

        if self.Base._Selected then
            self.Background:Colour(table.unpack(Colours.Black))
            self.Bar:Colour(table.unpack(Colours.White))
        else
            self.Background:Colour(table.unpack(Colours.White))
            self.Bar:Colour(table.unpack(Colours.Black))
        end

        self.Background:Draw()
        self.Bar:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuSeparatorItem ]]
--==================================================================================================================================================--
UIMenuSeparatorItem = setmetatable({}, UIMenuSeparatorItem)
UIMenuSeparatorItem.__index = UIMenuSeparatorItem
UIMenuSeparatorItem.__call = function() return "UIMenuItem", "UIMenuSeparatorItem" end
do
    function UIMenuSeparatorItem.New()
        local _UIMenuSeparatorItem = {Base = UIMenuItem.New(Text or "N/A", Description or "")}

        _UIMenuSeparatorItem.Base.Label.Text.Alignment = "Center"
        return setmetatable(_UIMenuSeparatorItem, UIMenuSeparatorItem)
    end

    function UIMenuSeparatorItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuSeparatorItem:Position(Y) if tonumber(Y) then self.Base:Position(Y) end end

    function UIMenuSeparatorItem:Selected(bool)
        if bool ~= nil then
            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuSeparatorItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuSeparatorItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuSeparatorItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuSeparatorItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuSeparatorItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuSeparatorItem:Draw()
        self.Base:Draw()

        if self.Base._Selected then
        else
        end

    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuSliderHeritageItem ]]
--==================================================================================================================================================--
UIMenuSliderHeritageItem = setmetatable({}, UIMenuSliderHeritageItem)
UIMenuSliderHeritageItem.__index = UIMenuSliderHeritageItem
UIMenuSliderHeritageItem.__call = function() return "UIMenuItem", "UIMenuSliderHeritageItem" end
do
    function UIMenuSliderHeritageItem.New(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
        if type(Items) ~= "table" then Items = {} end
        if Index == 0 then Index = 1 end

        if type(SliderColors) ~= "table" or SliderColors == nil then
            _SliderColors = {R = 57, G = 119, B = 200, A = 255}
        else
            _SliderColors = SliderColors
        end

        if type(BackgroundSliderColors) ~= "table" or BackgroundSliderColors == nil then
            _BackgroundSliderColors = {R = 4, G = 32, B = 57, A = 255}
        else
            _BackgroundSliderColors = BackgroundSliderColors
        end

        local _UIMenuSliderHeritageItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            Items = Items,
            LeftArrow = Sprite.New("mpleaderboard", "leaderboard_female_icon", 0, 0, 40, 40, 0, 255, 255, 255, 255),
            RightArrow = Sprite.New("mpleaderboard", "leaderboard_male_icon", 0, 0, 40, 40, 0, 255, 255, 255, 255),
            Background = UIResRectangle.New(0, 0, 150, 10, _BackgroundSliderColors.R, _BackgroundSliderColors.G, _BackgroundSliderColors.B,
                                            _BackgroundSliderColors.A),
            Slider = UIResRectangle.New(0, 0, 75, 10, _SliderColors.R, _SliderColors.G, _SliderColors.B, _SliderColors.A),
            Divider = UIResRectangle.New(0, 0, 4, 20, 255, 255, 255, 255),
            _Index = tonumber(Index) or 1,
            Audio = {Slider = "CONTINUOUS_SLIDER", Library = "HUD_FRONTEND_DEFAULT_SOUNDSET", Id = nil},
            OnSliderChanged = function(menu, item, newindex) end,
            OnSliderSelected = function(menu, item, newindex) end
        }
        return setmetatable(_UIMenuSliderHeritageItem, UIMenuSliderHeritageItem)
    end

    function UIMenuSliderHeritageItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuSliderHeritageItem:Position(Y)
        if tonumber(Y) then
            self.Background:Position(250 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 158.5 + self.Base._Offset.Y)
            self.Slider:Position(250 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 158.5 + self.Base._Offset.Y)
            self.Divider:Position(323.5 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 153 + self.Base._Offset.Y)
            self.LeftArrow:Position(217 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 143.5 + Y + self.Base._Offset.Y)
            self.RightArrow:Position(395 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 143.5 + Y + self.Base._Offset.Y)
            self.Base:Position(Y)
        end
    end

    function UIMenuSliderHeritageItem:Selected(bool)
        if bool ~= nil then
            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuSliderHeritageItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuSliderHeritageItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuSliderHeritageItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuSliderHeritageItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuSliderHeritageItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuSliderHeritageItem:Index(Index)
        if tonumber(Index) then
            if tonumber(Index) > #self.Items then
                self._Index = 1
            elseif tonumber(Index) < 1 then
                self._Index = #self.Items
            else
                self._Index = tonumber(Index)
            end
        else
            return self._Index
        end
    end

    function UIMenuSliderHeritageItem:ItemToIndex(Item)
        for i = 1, #self.Items do if type(Item) == type(self.Items[i]) and Item == self.Items[i] then return i end end
    end

    function UIMenuSliderHeritageItem:IndexToItem(Index)
        if tonumber(Index) then
            if tonumber(Index) == 0 then Index = 1 end
            if self.Items[tonumber(Index)] then return self.Items[tonumber(Index)] end
        end
    end

    function UIMenuSliderHeritageItem:SetLeftBadge() error("This item does not support badges") end

    function UIMenuSliderHeritageItem:SetRightBadge() error("This item does not support badges") end

    function UIMenuSliderHeritageItem:RightLabel() error("This item does not support a right label") end

    function UIMenuSliderHeritageItem:Draw()
        self.Base:Draw()
        if self:Enabled() then
            if self:Selected() then
                self.LeftArrow:Colour(0, 0, 0, 255)
                self.RightArrow:Colour(0, 0, 0, 255)
            else
                self.LeftArrow:Colour(255, 255, 255, 255)
                self.RightArrow:Colour(255, 255, 255, 255)
            end
        else
            self.LeftArrow:Colour(255, 255, 255, 255)
            self.RightArrow:Colour(255, 255, 255, 255)
        end
        local Offset = ((self.Background.Width - self.Slider.Width) / (#self.Items - 1)) * (self._Index - 1)
        self.Slider:Position(250 + self.Base._Offset.X + Offset + self.Base.ParentMenu.WidthOffset, self.Slider.Y)
        self.LeftArrow:Draw()
        self.RightArrow:Draw()
        self.Background:Draw()
        self.Slider:Draw()
        self.Divider:Draw()
        self.Divider:Colour(255, 255, 255, 255)
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuSliderItem ]]
--==================================================================================================================================================--
UIMenuSliderItem = setmetatable({}, UIMenuSliderItem)
UIMenuSliderItem.__index = UIMenuSliderItem
UIMenuSliderItem.__call = function() return "UIMenuItem", "UIMenuSliderItem" end
do
    function UIMenuSliderItem.New(Text, Items, Index, Description, Divider, SliderColors, BackgroundSliderColors)
        if type(Items) ~= "table" then Items = {} end
        if Index == 0 then Index = 1 end
        if type(SliderColors) ~= "table" or SliderColors == nil then
            _SliderColors = {R = 57, G = 119, B = 200, A = 255}
        else
            _SliderColors = SliderColors
        end
        if type(BackgroundSliderColors) ~= "table" or BackgroundSliderColors == nil then
            _BackgroundSliderColors = {R = 4, G = 32, B = 57, A = 255}
        else
            _BackgroundSliderColors = BackgroundSliderColors
        end
        local _UIMenuSliderItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            Items = Items,
            ShowDivider = ToBool(Divider),
            LeftArrow = Sprite.New("commonmenu", "arrowleft", 0, 105, 25, 25),
            RightArrow = Sprite.New("commonmenu", "arrowright", 0, 105, 25, 25),
            Background = UIResRectangle.New(0, 0, 150, 10, _BackgroundSliderColors.R, _BackgroundSliderColors.G, _BackgroundSliderColors.B,
                                            _BackgroundSliderColors.A),
            Slider = UIResRectangle.New(0, 0, 75, 10, _SliderColors.R, _SliderColors.G, _SliderColors.B, _SliderColors.A),
            Divider = UIResRectangle.New(0, 0, 4, 20, 255, 255, 255, 255),
            _Index = tonumber(Index) or 1,
            OnSliderChanged = function(menu, item, newindex) end,
            OnSliderSelected = function(menu, item, newindex) end
        }
        return setmetatable(_UIMenuSliderItem, UIMenuSliderItem)
    end

    function UIMenuSliderItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuSliderItem:Position(Y)
        if tonumber(Y) then
            self.Background:Position(250 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 158.5 + self.Base._Offset.Y)
            self.Slider:Position(250 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 158.5 + self.Base._Offset.Y)
            self.Divider:Position(323.5 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 153 + self.Base._Offset.Y)
            self.LeftArrow:Position(225 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 150.5 + Y + self.Base._Offset.Y)
            self.RightArrow:Position(400 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 150.5 + Y + self.Base._Offset.Y)
            self.Base:Position(Y)
        end
    end

    function UIMenuSliderItem:Selected(bool)
        if bool ~= nil then

            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuSliderItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuSliderItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuSliderItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuSliderItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuSliderItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuSliderItem:Index(Index)
        if tonumber(Index) then
            if tonumber(Index) > #self.Items then
                self._Index = 1
            elseif tonumber(Index) < 1 then
                self._Index = #self.Items
            else
                self._Index = tonumber(Index)
            end
        else
            return self._Index
        end
    end

    function UIMenuSliderItem:ItemToIndex(Item)
        for i = 1, #self.Items do if type(Item) == type(self.Items[i]) and Item == self.Items[i] then return i end end
    end

    function UIMenuSliderItem:IndexToItem(Index)
        if tonumber(Index) then
            if tonumber(Index) == 0 then Index = 1 end
            if self.Items[tonumber(Index)] then return self.Items[tonumber(Index)] end
        end
    end

    function UIMenuSliderItem:SetLeftBadge() error("This item does not support badges") end

    function UIMenuSliderItem:SetRightBadge() error("This item does not support badges") end

    function UIMenuSliderItem:RightLabel() error("This item does not support a right label") end

    function UIMenuSliderItem:Draw()
        self.Base:Draw()

        if self:Enabled() then
            if self:Selected() then
                self.LeftArrow:Colour(0, 0, 0, 255)
                self.RightArrow:Colour(0, 0, 0, 255)
            else
                self.LeftArrow:Colour(245, 245, 245, 255)
                self.RightArrow:Colour(245, 245, 245, 255)
            end
        else
            self.LeftArrow:Colour(163, 159, 148, 255)
            self.RightArrow:Colour(163, 159, 148, 255)
        end

        local Offset = ((self.Background.Width - self.Slider.Width) / (#self.Items - 1)) * (self._Index - 1)

        self.Slider:Position(250 + self.Base._Offset.X + Offset + self.Base.ParentMenu.WidthOffset, self.Slider.Y)

        if self:Selected() then
            self.LeftArrow:Draw()
            self.RightArrow:Draw()
        end

        self.Background:Draw()
        self.Slider:Draw()
        if self.ShowDivider then self.Divider:Draw() end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\items\UIMenuSliderProgressItem ]]
--==================================================================================================================================================--
UIMenuSliderProgressItem = setmetatable({}, UIMenuSliderProgressItem)
UIMenuSliderProgressItem.__index = UIMenuSliderProgressItem
UIMenuSliderProgressItem.__call = function() return "UIMenuItem", "UIMenuSliderProgressItem" end
do
    function UIMenuSliderProgressItem.New(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
        if type(Items) ~= "table" then Items = {} end
        if Index == 0 then Index = 1 end
        if type(SliderColors) ~= "table" or SliderColors == nil then
            _SliderColors = {R = 57, G = 119, B = 200, A = 255}
        else
            _SliderColors = SliderColors
        end
        if type(BackgroundSliderColors) ~= "table" or BackgroundSliderColors == nil then
            _BackgroundSliderColors = {R = 4, G = 32, B = 57, A = 255}
        else
            _BackgroundSliderColors = BackgroundSliderColors
        end
        local _UIMenuSliderProgressItem = {
            Base = UIMenuItem.New(Text or "", Description or ""),
            Items = Items,
            LeftArrow = Sprite.New("commonmenu", "arrowleft", 0, 105, 25, 25),
            RightArrow = Sprite.New("commonmenu", "arrowright", 0, 105, 25, 25),
            Background = UIResRectangle.New(0, 0, 150, 10, _BackgroundSliderColors.R, _BackgroundSliderColors.G, _BackgroundSliderColors.B,
                                            _BackgroundSliderColors.A),
            Slider = UIResRectangle.New(0, 0, 75, 10, _SliderColors.R, _SliderColors.G, _SliderColors.B, _SliderColors.A),
            Divider = UIResRectangle.New(0, 0, 4, 20, 255, 255, 255, 255),
            _Index = tonumber(Index) or 1,
            OnSliderChanged = function(menu, item, newindex) end,
            OnSliderSelected = function(menu, item, newindex) end
        }

        local Offset = ((_UIMenuSliderProgressItem.Background.Width) / (#_UIMenuSliderProgressItem.Items - 1)) *
                            (_UIMenuSliderProgressItem._Index - 1)
        _UIMenuSliderProgressItem.Slider.Width = Offset

        return setmetatable(_UIMenuSliderProgressItem, UIMenuSliderProgressItem)
    end

    function UIMenuSliderProgressItem:SetParentMenu(Menu)
        if Menu() == "UIMenu" then
            self.Base.ParentMenu = Menu
        else
            return self.Base.ParentMenu
        end
    end

    function UIMenuSliderProgressItem:Position(Y)
        if tonumber(Y) then
            self.Background:Position(250 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 158.5 + self.Base._Offset.Y)
            self.Slider:Position(250 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 158.5 + self.Base._Offset.Y)
            self.Divider:Position(323.5 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, Y + 153 + self.Base._Offset.Y)
            self.LeftArrow:Position(225 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 150.5 + Y + self.Base._Offset.Y)
            self.RightArrow:Position(400 + self.Base._Offset.X + self.Base.ParentMenu.WidthOffset, 150.5 + Y + self.Base._Offset.Y)
            self.Base:Position(Y)
        end
    end

    function UIMenuSliderProgressItem:Selected(bool)
        if bool ~= nil then

            self.Base._Selected = ToBool(bool)
        else
            return self.Base._Selected
        end
    end

    function UIMenuSliderProgressItem:Hovered(bool)
        if bool ~= nil then
            self.Base._Hovered = ToBool(bool)
        else
            return self.Base._Hovered
        end
    end

    function UIMenuSliderProgressItem:Enabled(bool)
        if bool ~= nil then
            self.Base._Enabled = ToBool(bool)
        else
            return self.Base._Enabled
        end
    end

    function UIMenuSliderProgressItem:Description(str)
        if tostring(str) and str ~= nil then
            self.Base._Description = tostring(str)
        else
            return self.Base._Description
        end
    end

    function UIMenuSliderProgressItem:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self.Base._Offset.X = tonumber(X) end
            if tonumber(Y) then self.Base._Offset.Y = tonumber(Y) end
        else
            return self.Base._Offset
        end
    end

    function UIMenuSliderProgressItem:Text(Text)
        if tostring(Text) and Text ~= nil then
            self.Base.Text:Text(tostring(Text))
        else
            return self.Base.Text:Text()
        end
    end

    function UIMenuSliderProgressItem:Index(Index)
        if tonumber(Index) then
            if tonumber(Index) > #self.Items then
                self._Index = #self.Items
            elseif tonumber(Index) < 1 then
                self._Index = 1
            else
                self._Index = tonumber(Index)
            end
        else
            local Offset = ((self.Background.Width) / (#self.Items - 1)) * (self._Index - 1)
            self.Slider.Width = Offset
            return self._Index
        end
    end

    function UIMenuSliderProgressItem:ItemToIndex(Item)
        for i = 1, #self.Items do if type(Item) == type(self.Items[i]) and Item == self.Items[i] then return i end end
    end

    function UIMenuSliderProgressItem:IndexToItem(Index)
        if tonumber(Index) then
            if tonumber(Index) == 0 then Index = 1 end
            if self.Items[tonumber(Index)] then return self.Items[tonumber(Index)] end
        end
    end

    function UIMenuSliderProgressItem:SetLeftBadge() error("This item does not support badges") end

    function UIMenuSliderProgressItem:SetRightBadge() error("This item does not support badges") end

    function UIMenuSliderProgressItem:RightLabel() error("This item does not support a right label") end

    function UIMenuSliderProgressItem:Draw()
        self.Base:Draw()

        if self:Enabled() then
            if self:Selected() then
                self.LeftArrow:Colour(0, 0, 0, 255)
                self.RightArrow:Colour(0, 0, 0, 255)
            else
                self.LeftArrow:Colour(245, 245, 245, 255)
                self.RightArrow:Colour(245, 245, 245, 255)
            end
        else
            self.LeftArrow:Colour(163, 159, 148, 255)
            self.RightArrow:Colour(163, 159, 148, 255)
        end

        if self:Selected() then
            self.LeftArrow:Draw()
            self.RightArrow:Draw()
        end

        self.Background:Draw()
        self.Slider:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\panels\UIMenuColourPanel ]]
--==================================================================================================================================================--
UIMenuColourPanel = setmetatable({}, UIMenuColourPanel)
UIMenuColourPanel.__index = UIMenuColourPanel
UIMenuColourPanel.__call = function() return "UIMenuPanel", "UIMenuColourPanel" end
do
    function UIMenuColourPanel.New(Title, Colours)
        local _UIMenuColourPanel = {
            Data = {
                Pagination = {Min = 1, Max = 8, Total = 8},
                Index = 1000,
                Items = Colours,
                Title = Title or "Title",
                Enabled = true,
                Value = 1
            },
            Background = Sprite.New("commonmenu", "gradient_bgd", 0, 0, 431, 112),
            Bar = {},
            EnableArrow = true,
            LeftArrow = Sprite.New("commonmenu", "arrowleft", 0, 0, 30, 30),
            RightArrow = Sprite.New("commonmenu", "arrowright", 0, 0, 30, 30),
            SelectedRectangle = UIResRectangle.New(0, 0, 44.5, 8),
            Text = UIResText.New(Title .. " [1 / " .. #Colours .. "]" or "Title" .. " [1 / " .. #Colours .. "]", 0, 0, 0.35, 255, 255, 255,
                                    255, 0, "Centre"),
            ParentItem = nil
        }

        for Index = 1, #Colours do
            if Index < 10 then
                table.insert(_UIMenuColourPanel.Bar, UIResRectangle.New(0, 0, 44.5, 44.5, table.unpack(Colours[Index])))
            else
                break
            end
        end

        if #_UIMenuColourPanel.Data.Items ~= 0 then
            _UIMenuColourPanel.Data.Index = 1000 - (1000 % #_UIMenuColourPanel.Data.Items)
            _UIMenuColourPanel.Data.Pagination.Max = _UIMenuColourPanel.Data.Pagination.Total + 1
            _UIMenuColourPanel.Data.Pagination.Min = 0
        end
        return setmetatable(_UIMenuColourPanel, UIMenuColourPanel)
    end

    function UIMenuColourPanel:SetParentItem(Item)
        -- required
        if Item() == "UIMenuItem" then
            self.ParentItem = Item
        else
            return self.ParentItem
        end
    end

    function UIMenuColourPanel:Enabled(Enabled)
        if type(Enabled) == "boolean" then
            self.Data.Enabled = Enabled
        else
            return self.Data.Enabled
        end
    end

    function UIMenuColourPanel:Position(Y)
        if tonumber(Y) then
            local ParentOffsetX, ParentOffsetWidth = self.ParentItem:Offset().X, self.ParentItem:SetParentMenu().WidthOffset
            self.Background:Position(ParentOffsetX, Y)
            for Index = 1, #self.Bar do
                self.Bar[Index]:Position(15 + (44.5 * (Index - 1)) + ParentOffsetX + (ParentOffsetWidth / 2), 55 + Y)
            end
            self.SelectedRectangle:Position(15 + (44.5 * ((self:CurrentSelection() - self.Data.Pagination.Min) - 1)) + ParentOffsetX +
                                                (ParentOffsetWidth / 2), 47 + Y)
            if self.EnableArrow ~= false then
                self.LeftArrow:Position(7.5 + ParentOffsetX + (ParentOffsetWidth / 2), 15 + Y)
                self.RightArrow:Position(393.5 + ParentOffsetX + (ParentOffsetWidth / 2), 15 + Y)
            end
            self.Text:Position(215.5 + ParentOffsetX + (ParentOffsetWidth / 2), 15 + Y)
        end
    end

    function UIMenuColourPanel:CurrentSelection(value, PreventUpdate)
        if tonumber(value) then
            if #self.Data.Items == 0 then self.Data.Index = 0 end

            self.Data.Index = 1000000 - (1000000 % #self.Data.Items) + tonumber(value)

            if self:CurrentSelection() > self.Data.Pagination.Max then
                self.Data.Pagination.Min = self:CurrentSelection() - (self.Data.Pagination.Total + 1)
                self.Data.Pagination.Max = self:CurrentSelection()
            elseif self:CurrentSelection() < self.Data.Pagination.Min then
                self.Data.Pagination.Min = self:CurrentSelection() - 1
                self.Data.Pagination.Max = self:CurrentSelection() + (self.Data.Pagination.Total + 1)
            end

            self:UpdateSelection(PreventUpdate)
        else
            if #self.Data.Items == 0 then
                return 1
            else
                if self.Data.Index % #self.Data.Items == 0 then
                    return 1
                else
                    return self.Data.Index % #self.Data.Items + 1
                end
            end
        end
    end

    function UIMenuColourPanel:UpdateParent(Colour)
        local _, ParentType = self.ParentItem()
        if ParentType == "UIMenuListItem" then
            local PanelItemIndex = self.ParentItem:FindPanelItem()
            local PanelIndex = self.ParentItem:FindPanelIndex(self)
            if PanelItemIndex then
                self.ParentItem.Items[PanelItemIndex].Value[PanelIndex] = Colour
                self.ParentItem:Index(PanelItemIndex)
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            else
                for Index = 1, #self.ParentItem.Items do
                    if type(self.ParentItem.Items[Index]) == "table" then
                        if not self.ParentItem.Items[Index].Panels then self.ParentItem.Items[Index].Panels = {} end
                        self.ParentItem.Items[Index].Panels[PanelIndex] = Colour
                    else
                        self.ParentItem.Items[Index] = {
                            Name = tostring(self.ParentItem.Items[Index]),
                            Value = self.ParentItem.Items[Index],
                            Panels = {[PanelIndex] = Colour}
                        }
                    end
                end
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            end
        elseif ParentType == "UIMenuItem" then
            self.ParentItem.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, Colour)
        end
    end

    function UIMenuColourPanel:UpdateSelection(PreventUpdate)
        local CurrentSelection = self:CurrentSelection()
        if not PreventUpdate then self:UpdateParent(CurrentSelection) end
        self.SelectedRectangle:Position(15 + (44.5 * ((CurrentSelection - self.Data.Pagination.Min) - 1)) + self.ParentItem:Offset().X,
                                        self.SelectedRectangle.Y)
        for Index = 1, 9 do self.Bar[Index]:Colour(table.unpack(self.Data.Items[self.Data.Pagination.Min + Index])) end
        self.Text:Text(self.Data.Title .. " [" .. CurrentSelection .. " / " .. #self.Data.Items .. "]")
    end

    function UIMenuColourPanel:Functions()
        local DrawOffset = {X = 0, Y = 0}
        if self.ParentItem:SetParentMenu().Settings.ScaleWithSafezone then DrawOffset = self.ParentItem:SetParentMenu().DrawOffset end

        if IsDisabledControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 174) then self:GoLeft() end
        if IsDisabledControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 175) then self:GoRight() end

        if IsMouseInBounds(self.LeftArrow.X, self.LeftArrow.Y, self.LeftArrow.Width, self.LeftArrow.Height, DrawOffset) then
            if IsDisabledControlJustPressed(0, 24) then self:GoLeft() end
        end
        if IsMouseInBounds(self.RightArrow.X, self.RightArrow.Y, self.RightArrow.Width, self.RightArrow.Height, DrawOffset) then
            if IsDisabledControlJustPressed(0, 24) then self:GoRight() end
        end

        for Index = 1, #self.Bar do
            if IsMouseInBounds(self.Bar[Index].X, self.Bar[Index].Y, self.Bar[Index].Width, self.Bar[Index].Height, DrawOffset) then
                if IsDisabledControlJustPressed(0, 24) then self:CurrentSelection(self.Data.Pagination.Min + Index - 1) end
            end
        end
    end

    function UIMenuColourPanel:GoLeft()
        if #self.Data.Items > self.Data.Pagination.Total + 1 then
            if self:CurrentSelection() <= self.Data.Pagination.Min + 1 then
                if self:CurrentSelection() == 1 then
                    self.Data.Pagination.Min = #self.Data.Items - (self.Data.Pagination.Total + 1)
                    self.Data.Pagination.Max = #self.Data.Items
                    self.Data.Index = 1000 - (1000 % #self.Data.Items)
                    self.Data.Index = self.Data.Index + (#self.Data.Items - 1)
                    self:UpdateSelection()
                else
                    self.Data.Pagination.Min = self.Data.Pagination.Min - 1
                    self.Data.Pagination.Max = self.Data.Pagination.Max - 1
                    self.Data.Index = self.Data.Index - 1
                    self:UpdateSelection()
                end
            else
                self.Data.Index = self.Data.Index - 1
                self:UpdateSelection()
            end
        else
            self.Data.Index = self.Data.Index - 1
            self:UpdateSelection()
        end
    end

    function UIMenuColourPanel:GoRight()
        if #self.Data.Items > self.Data.Pagination.Total + 1 then
            if self:CurrentSelection() >= self.Data.Pagination.Max then
                if self:CurrentSelection() == #self.Data.Items then
                    self.Data.Pagination.Min = 0
                    self.Data.Pagination.Max = self.Data.Pagination.Total + 1
                    self.Data.Index = 1000 - (1000 % #self.Data.Items)
                    self:UpdateSelection()
                else
                    self.Data.Pagination.Max = self.Data.Pagination.Max + 1
                    self.Data.Pagination.Min = self.Data.Pagination.Max - (self.Data.Pagination.Total + 1)
                    self.Data.Index = self.Data.Index + 1
                    self:UpdateSelection()
                end
            else
                self.Data.Index = self.Data.Index + 1
                self:UpdateSelection()
            end
        else
            self.Data.Index = self.Data.Index + 1
            self:UpdateSelection()
        end
    end

    function UIMenuColourPanel:Draw()
        if self.Data.Enabled then
            self.Background:Size(431 + self.ParentItem:SetParentMenu().WidthOffset, 112)
            self.Background:Draw()
            if self.EnableArrow ~= false then
                self.LeftArrow:Draw()
                self.RightArrow:Draw()
            end
            self.Text:Draw()
            self.SelectedRectangle:Draw()
            for Index = 1, #self.Bar do self.Bar[Index]:Draw() end
            self:Functions()
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\panels\UIMenuGridPanel ]]
--==================================================================================================================================================--
UIMenuGridPanel = setmetatable({}, UIMenuGridPanel)
UIMenuGridPanel.__index = UIMenuGridPanel
UIMenuGridPanel.__call = function()
return "UIMenuPanel", "UIMenuGridPanel"
end
do
    function UIMenuGridPanel.New(TopText, LeftText, RightText, BottomText, CirclePositionX, CirclePositionY)
        local _UIMenuGridPanel = {
            Data = {
                Enabled = true,
            },
            Background = Sprite.New("commonmenu", "gradient_bgd", 0, 0, 431, 275),
            Grid = Sprite.New("pause_menu_pages_char_mom_dad", "nose_grid", 0, 0, 200, 200, 0, 255, 255, 255, 255),
            Circle = Sprite.New("mpinventory", "in_world_circle", 0, 0, 20, 20, 0),
            Audio = { Slider = "CONTINUOUS_SLIDER", Library = "HUD_FRONTEND_DEFAULT_SOUNDSET", Id = nil },
            ParentItem = nil,
            Text = {
                Top = UIResText.New(TopText or "Top", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Left = UIResText.New(LeftText or "Left", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Right = UIResText.New(RightText or "Right", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Bottom = UIResText.New(BottomText or "Bottom", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
            },
            SetCirclePosition = { X = CirclePositionX or 0.5, Y = CirclePositionY or 0.5 }
        }
        return setmetatable(_UIMenuGridPanel, UIMenuGridPanel)
    end

    function UIMenuGridPanel:SetParentItem(Item)
        -- required
        if Item() == "UIMenuItem" then
            self.ParentItem = Item
        else
            return self.ParentItem
        end
    end

    function UIMenuGridPanel:Enabled(Enabled)
        if type(Enabled) == "boolean" then
            self.Data.Enabled = Enabled
        else
            return self.Data.Enabled
        end
    end

    function UIMenuGridPanel:CirclePosition(X, Y)
        if tonumber(X) and tonumber(Y) then
            self.Circle.X = (self.Grid.X + 20) + ((self.Grid.Width - 40) * ((X >= 0.0 and X <= 1.0) and X or 0.0)) - (self.Circle.Width / 2)
            self.Circle.Y = (self.Grid.Y + 20) + ((self.Grid.Height - 40) * ((Y >= 0.0 and Y <= 1.0) and Y or 0.0)) - (self.Circle.Height / 2)
        else
            return math.round((self.Circle.X - (self.Grid.X + 20) + (self.Circle.Width / 2)) / (self.Grid.Width - 40), 2), math.round((self.Circle.Y - (self.Grid.Y + 20) + (self.Circle.Height / 2)) / (self.Grid.Height - 40), 2)
        end
    end

    function UIMenuGridPanel:Position(Y)
        if tonumber(Y) then
            local ParentOffsetX, ParentOffsetWidth = self.ParentItem:Offset().X, self.ParentItem:SetParentMenu().WidthOffset
            self.Background:Position(ParentOffsetX, Y)
            self.Grid:Position(ParentOffsetX + 115.5 + (ParentOffsetWidth / 2), 37.5 + Y)
            self.Text.Top:Position(ParentOffsetX + 215.5 + (ParentOffsetWidth / 2), 5 + Y)
            self.Text.Left:Position(ParentOffsetX + 57.75 + (ParentOffsetWidth / 2), 120 + Y)
            self.Text.Right:Position(ParentOffsetX + 373.25 + (ParentOffsetWidth / 2), 120 + Y)
            self.Text.Bottom:Position(ParentOffsetX + 215.5 + (ParentOffsetWidth / 2), 240 + Y)
            if not self.CircleLocked then
                self.CircleLocked = true
                self:CirclePosition(self.SetCirclePosition.X, self.SetCirclePosition.Y)
            end
        end
    end

    function UIMenuGridPanel:UpdateParent(X, Y)
        local _, ParentType = self.ParentItem()
        self.Data.Value = { X = X, Y = Y }
        if ParentType == "UIMenuListItem" then
            local PanelItemIndex = self.ParentItem:FindPanelItem()
            if PanelItemIndex then
                self.ParentItem.Items[PanelItemIndex].Value[self.ParentItem:FindPanelIndex(self)] = { X = X, Y = Y }
                self.ParentItem:Index(PanelItemIndex)
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            else
                local PanelIndex = self.ParentItem:FindPanelIndex(self)
                for Index = 1, #self.ParentItem.Items do
                    if type(self.ParentItem.Items[Index]) == "table" then
                        if not self.ParentItem.Items[Index].Panels then
                            self.ParentItem.Items[Index].Panels = {}
                        end
                        self.ParentItem.Items[Index].Panels[PanelIndex] = { X = X, Y = Y }
                    else
                        self.ParentItem.Items[Index] = { Name = tostring(self.ParentItem.Items[Index]), Value = self.ParentItem.Items[Index], Panels = { [PanelIndex] = { X = X, Y = Y } } }
                    end
                end
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.Base.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, { X = X, Y = Y })
            end
        elseif ParentType == "UIMenuItem" then
            self.ParentItem.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, { X = X, Y = Y })
        end
    end

    function UIMenuGridPanel:Functions()
        local DrawOffset = { X = 0, Y = 0 }
        if self.ParentItem:SetParentMenu().Settings.ScaleWithSafezone then
            DrawOffset = self.ParentItem:SetParentMenu().DrawOffset
        end
        if IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) then
            if IsDisabledControlJustPressed(0, 24) then
                if not self.Pressed then
                    self.Pressed = true
                    Citizen.CreateThread(function()
                        self.Audio.Id = GetSoundId()
                        PlaySoundFrontend(self.Audio.Id, self.Audio.Slider, self.Audio.Library, 1)
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) do
                            Citizen.Wait(0)
                            local CursorX, CursorY = ConvertToPixel(GetControlNormal(0, 239) - DrawOffset.X, GetControlNormal(0, 240) - DrawOffset.Y)
                            CursorX, CursorY = CursorX - (self.Circle.Width / 2), CursorY - (self.Circle.Height / 2)
                            self.Circle:Position(((CursorX > (self.Grid.X + 10 + self.Grid.Width - 40)) and (self.Grid.X + 10 + self.Grid.Width - 40) or ((CursorX < (self.Grid.X + 20 - (self.Circle.Width / 2))) and (self.Grid.X + 20 - (self.Circle.Width / 2)) or CursorX)), ((CursorY > (self.Grid.Y + 10 + self.Grid.Height - 40)) and (self.Grid.Y + 10 + self.Grid.Height - 40) or ((CursorY < (self.Grid.Y + 20 - (self.Circle.Height / 2))) and (self.Grid.Y + 20 - (self.Circle.Height / 2)) or CursorY)))
                        end
                        StopSound(self.Audio.Id)
                        ReleaseSoundId(self.Audio.Id)
                        self.Pressed = false
                    end)
                    Citizen.CreateThread(function()
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) do
                            Citizen.Wait(75)
                            local ResultX, ResultY = math.round((self.Circle.X - (self.Grid.X + 20) + (self.Circle.Width / 2)) / (self.Grid.Width - 40), 2), math.round((self.Circle.Y - (self.Grid.Y + 20) + (self.Circle.Height / 2)) / (self.Grid.Height - 40), 2)

                            self:UpdateParent((((ResultX >= 0.0 and ResultX <= 1.0) and ResultX or ((ResultX <= 0) and 0.0) or 1.0) * 2) - 1, (((ResultY >= 0.0 and ResultY <= 1.0) and ResultY or ((ResultY <= 0) and 0.0) or 1.0) * 2) - 1)
                        end
                    end)
                end
            end
        end
    end

    function UIMenuGridPanel:Draw()
        if self.Data.Enabled then
            self.Background:Size(431 + self.ParentItem:SetParentMenu().WidthOffset, 275)
            self.Background:Draw()
            self.Grid:Draw()
            self.Circle:Draw()
            self.Text.Top:Draw()
            self.Text.Left:Draw()
            self.Text.Right:Draw()
            self.Text.Bottom:Draw()
            self:Functions()
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\panels\UIMenuHorizontalOneLineGridPanel ]]
--==================================================================================================================================================--
UIMenuHorizontalOneLineGridPanel = setmetatable({}, UIMenuHorizontalOneLineGridPanel)
UIMenuHorizontalOneLineGridPanel.__index = UIMenuHorizontalOneLineGridPanel
UIMenuHorizontalOneLineGridPanel.__call = function()
return "UIMenuPanel", "UIMenuHorizontalOneLineGridPanel"
end
do
    function UIMenuHorizontalOneLineGridPanel.New(LeftText, RightText, CirclePositionX)
        local _UIMenuHorizontalOneLineGridPanel = {
            Data = {
                Enabled = true,
            },
            Background = Sprite.New("commonmenu", "gradient_bgd", 0, 0, 431, 275),
            Grid = Sprite.New("NativeUI", "horizontal_grid", 0, 0, 200, 200, 0, 255, 255, 255, 255),
            Circle = Sprite.New("mpinventory", "in_world_circle", 0, 0, 20, 20, 0),
            Audio = { Slider = "CONTINUOUS_SLIDER", Library = "HUD_FRONTEND_DEFAULT_SOUNDSET", Id = nil },
            ParentItem = nil,
            Text = {
                Left = UIResText.New(LeftText or "Left", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Right = UIResText.New(RightText or "Right", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
            },
            SetCirclePosition = { X = CirclePositionX or 0.5, Y = 0.5 }
        }
        return setmetatable(_UIMenuHorizontalOneLineGridPanel, UIMenuHorizontalOneLineGridPanel)
    end

    function UIMenuHorizontalOneLineGridPanel:SetParentItem(Item)
        -- required
        if Item() == "UIMenuItem" then
            self.ParentItem = Item
        else
            return self.ParentItem
        end
    end

    function UIMenuHorizontalOneLineGridPanel:Enabled(Enabled)
        if type(Enabled) == "boolean" then
            self.Data.Enabled = Enabled
        else
            return self.Data.Enabled
        end
    end

    function UIMenuHorizontalOneLineGridPanel:CirclePosition(X, Y)
        if tonumber(X) and tonumber(Y) then
            self.Circle.X = (self.Grid.X + 20) + ((self.Grid.Width - 40) * ((X >= 0.0 and X <= 1.0) and X or 0.0)) - (self.Circle.Width / 2)
            self.Circle.Y = (self.Grid.Y + 20) + ((self.Grid.Height - 40) * ((Y >= 0.0 and Y <= 1.0) and Y or 0.0)) - (self.Circle.Height / 2)
        else
            return math.round((self.Circle.X - (self.Grid.X + 20) + (self.Circle.Width / 2)) / (self.Grid.Width - 40), 2), math.round((self.Circle.Y - (self.Grid.Y + 10) + (self.Circle.Height / 2)) / (self.Grid.Height - 40), 2)
        end
    end

    function UIMenuHorizontalOneLineGridPanel:Position(Y)
        if tonumber(Y) then
            local ParentOffsetX, ParentOffsetWidth = self.ParentItem:Offset().X, self.ParentItem:SetParentMenu().WidthOffset
            self.Background:Position(ParentOffsetX, Y)
            self.Grid:Position(ParentOffsetX + 115.5 + (ParentOffsetWidth / 2), 37.5 + Y)
            self.Text.Left:Position(ParentOffsetX + 57.75 + (ParentOffsetWidth / 2), 120 + Y)
            self.Text.Right:Position(ParentOffsetX + 373.25 + (ParentOffsetWidth / 2), 120 + Y)
            if not self.CircleLocked then
                self.CircleLocked = true
                self:CirclePosition(self.SetCirclePosition.X, self.SetCirclePosition.Y)
            end
        end
    end

    function UIMenuHorizontalOneLineGridPanel:UpdateParent(X)
        local _, ParentType = self.ParentItem()
        self.Data.Value = { X = X }
        if ParentType == "UIMenuListItem" then
            local PanelItemIndex = self.ParentItem:FindPanelItem()
            if PanelItemIndex then
                self.ParentItem.Items[PanelItemIndex].Value[self.ParentItem:FindPanelIndex(self)] = { X = X }
                self.ParentItem:Index(PanelItemIndex)
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            else
                local PanelIndex = self.ParentItem:FindPanelIndex(self)
                for Index = 1, #self.ParentItem.Items do
                    if type(self.ParentItem.Items[Index]) == "table" then
                        if not self.ParentItem.Items[Index].Panels then
                            self.ParentItem.Items[Index].Panels = {}
                        end
                        self.ParentItem.Items[Index].Panels[PanelIndex] = { X = X }
                    else
                        self.ParentItem.Items[Index] = { Name = tostring(self.ParentItem.Items[Index]), Value = self.ParentItem.Items[Index], Panels = { [PanelIndex] = { X = X } } }
                    end
                end
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.Base.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, { X = X })
            end
        elseif ParentType == "UIMenuItem" then
            self.ParentItem.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, { X = X })
        end
    end

    function UIMenuHorizontalOneLineGridPanel:Functions()
        local DrawOffset = { X = 0, Y = 0}
        if self.ParentItem:SetParentMenu().Settings.ScaleWithSafezone then
            DrawOffset = self.ParentItem:SetParentMenu().DrawOffset
        end
        if IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) then
            if IsDisabledControlJustPressed(0, 24) then
                if not self.Pressed then
                    self.Pressed = true
                    Citizen.CreateThread(function()
                        self.Audio.Id = GetSoundId()
                        PlaySoundFrontend(self.Audio.Id, self.Audio.Slider, self.Audio.Library, 1)
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 10, self.Grid.Height - 10, DrawOffset) do
                            Citizen.Wait(0)
                            local CursorX, CursorY = ConvertToPixel(GetControlNormal(0, 239) - DrawOffset.X, GetControlNormal(0, 240) - DrawOffset.Y)
                            CursorX, CursorY = CursorX - (self.Circle.Width / 2), CursorY - (self.Circle.Height / 2)
                            local moveCursorX = (CursorX > (self.Grid.X + 10 + self.Grid.Width - 40)) and (self.Grid.X + 10 + self.Grid.Width - 40) or ((CursorX < (self.Grid.X + 20 - (self.Circle.Width / 2))) and (self.Grid.X + 20 - (self.Circle.Width / 2)) or CursorX)
                            local moveCursorY = (CursorY > (self.Grid.Y + 10 + self.Grid.Height - 120)) and (self.Grid.Y + 10 + self.Grid.Height - 120) or ((CursorY < (self.Grid.Y + 100 - (self.Circle.Height / 2))) and (self.Grid.Y + 100 - (self.Circle.Height / 2)) or CursorY)
                            self.Circle:Position(moveCursorX, moveCursorY)
                        end
                        StopSound(self.Audio.Id)
                        ReleaseSoundId(self.Audio.Id)
                        self.Pressed = false
                    end)
                    Citizen.CreateThread(function()
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) do
                            Citizen.Wait(75)
                            local ResultX = math.round((self.Circle.X - (self.Grid.X + 20) + (self.Circle.Width / 2)) / (self.Grid.Width - 40), 2)
                            self:UpdateParent((((ResultX >= 0.0 and ResultX <= 1.0) and ResultX or ((ResultX <= 0) and 0.0) or 1.0) * 2) - 1)
                        end
                    end)
                end
            end
        end
    end

    function UIMenuHorizontalOneLineGridPanel:Draw()
        if self.Data.Enabled then
            self.Background:Size(431 + self.ParentItem:SetParentMenu().WidthOffset, 275)
            self.Background:Draw()
            self.Grid:Draw()
            self.Circle:Draw()
            self.Text.Left:Draw()
            self.Text.Right:Draw()
            self:Functions()
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\panels\UIMenuPercentagePanel ]]
--==================================================================================================================================================--
UIMenuPercentagePanel = setmetatable({}, UIMenuPercentagePanel)
UIMenuPercentagePanel.__index = UIMenuPercentagePanel
UIMenuPercentagePanel.__call = function()
return "UIMenuPanel", "UIMenuPercentagePanel"
end
do
    function UIMenuPercentagePanel.New(MinText, MaxText)
        local _UIMenuPercentagePanel = {
            Data = {
                Enabled = true,
            },
            Background = Sprite.New("commonmenu", "gradient_bgd", 0, 0, 431, 76),
            ActiveBar = UIResRectangle.New(0, 0, 413, 10, 245, 245, 245, 255),
            BackgroundBar = UIResRectangle.New(0, 0, 413, 10, 87, 87, 87, 255),
            Text = {
                Min = UIResText.New(MinText or "0%", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Max = UIResText.New("100%", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Title = UIResText.New(MaxText or "Opacity", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
            },
            Audio = { Slider = "CONTINUOUS_SLIDER", Library = "HUD_FRONTEND_DEFAULT_SOUNDSET", Id = nil },
            ParentItem = nil,
        }

        return setmetatable(_UIMenuPercentagePanel, UIMenuPercentagePanel)
    end

    function UIMenuPercentagePanel:SetParentItem(Item)
        if Item() == "UIMenuItem" then
            self.ParentItem = Item
        else
            return self.ParentItem
        end
    end

    function UIMenuPercentagePanel:Enabled(Enabled)
        if type(Enabled) == "boolean" then
            self.Data.Enabled = Enabled
        else
            return self.Data.Enabled
        end
    end

    function UIMenuPercentagePanel:Position(Y)
        if tonumber(Y) then
            local ParentOffsetX, ParentOffsetWidth = self.ParentItem:Offset().X, self.ParentItem:SetParentMenu().WidthOffset
            self.Background:Position(ParentOffsetX, Y)
            self.ActiveBar:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 9, 50 + Y)
            self.BackgroundBar:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 9, 50 + Y)
            self.Text.Min:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 25, 15 + Y)
            self.Text.Max:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 398, 15 + Y)
            self.Text.Title:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 215.5, 15 + Y)
        end
    end

    function UIMenuPercentagePanel:Percentage(Value)
        if tonumber(Value) then
            local Percent = ((Value < 0.0) and 0.0) or ((Value > 1.0) and 1.0 or Value)
            self.ActiveBar:Size(self.BackgroundBar.Width * Percent, self.ActiveBar.Height)
        else
            local DrawOffset = { X = 0, Y = 0}
            if self.ParentItem:SetParentMenu().Settings.ScaleWithSafezone then
                DrawOffset = self.ParentItem:SetParentMenu().DrawOffset
            end

            local W, H = GetResolution()
            local Progress = (math.round((GetControlNormal(0, 239) - DrawOffset.X) * W)) - self.ActiveBar.X
            return math.round(((Progress >= 0 and Progress <= 413) and Progress or ((Progress < 0) and 0 or 413)) / self.BackgroundBar.Width, 2)
        end
    end

    function UIMenuPercentagePanel:UpdateParent(Percentage)
        local _, ParentType = self.ParentItem()
        if ParentType == "UIMenuListItem" then
            local PanelItemIndex = self.ParentItem:FindPanelItem()
            if PanelItemIndex then
                self.ParentItem.Items[PanelItemIndex].Value[self.ParentItem:FindPanelIndex(self)] = Percentage
                self.ParentItem:Index(PanelItemIndex)
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            else
                local PanelIndex = self.ParentItem:FindPanelIndex(self)
                for Index = 1, #self.ParentItem.Items do
                    if type(self.ParentItem.Items[Index]) == "table" then
                        if not self.ParentItem.Items[Index].Panels then
                            self.ParentItem.Items[Index].Panels = {}
                        end
                        self.ParentItem.Items[Index].Panels[PanelIndex] = Percentage
                    else
                        self.ParentItem.Items[Index] = { Name = tostring(self.ParentItem.Items[Index]), Value = self.ParentItem.Items[Index], Panels = { [PanelIndex] = Percentage } }
                    end
                end
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            end
        elseif ParentType == "UIMenuItem" then
            self.ParentItem.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, Percentage)
        end
    end

    function UIMenuPercentagePanel:Functions()
        local DrawOffset = { X = 0, Y = 0}
        if self.ParentItem:SetParentMenu().Settings.ScaleWithSafezone then
            DrawOffset = self.ParentItem:SetParentMenu().DrawOffset
        end
        if IsMouseInBounds(self.BackgroundBar.X, self.BackgroundBar.Y - 4, self.BackgroundBar.Width, self.BackgroundBar.Height + 8, DrawOffset) then
            if IsDisabledControlJustPressed(0, 24) then
                if not self.Pressed then
                    self.Pressed = true
                    Citizen.CreateThread(function()
                        self.Audio.Id = GetSoundId()
                        PlaySoundFrontend(self.Audio.Id, self.Audio.Slider, self.Audio.Library, 1)
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.BackgroundBar.X, self.BackgroundBar.Y - 4, self.BackgroundBar.Width, self.BackgroundBar.Height + 8, DrawOffset) do
                            Citizen.Wait(0)
                            local Progress, ProgressY = ConvertToPixel(GetControlNormal(0, 239) - DrawOffset.X, 0)
                            Progress = Progress - self.ActiveBar.X
                            self.ActiveBar:Size(((Progress >= 0 and Progress <= 413) and Progress or ((Progress < 0) and 0 or 413)), self.ActiveBar.Height)
                        end
                        StopSound(self.Audio.Id)
                        ReleaseSoundId(self.Audio.Id)
                        self.Pressed = false
                    end)
                    Citizen.CreateThread(function()
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.BackgroundBar.X, self.BackgroundBar.Y - 4, self.BackgroundBar.Width, self.BackgroundBar.Height + 8, DrawOffset) do
                            Citizen.Wait(75)
                            local Progress, ProgressY = ConvertToPixel(GetControlNormal(0, 239) - DrawOffset.X, 0)
                            Progress = Progress - self.ActiveBar.X
                            self:UpdateParent(math.round(((Progress >= 0 and Progress <= 413) and Progress or ((Progress < 0) and 0 or 413)) / self.BackgroundBar.Width, 2))
                        end
                    end)
                end
            end
        end
    end

    function UIMenuPercentagePanel:Draw()
        if self.Data.Enabled then
            self.Background:Size(431 + self.ParentItem:SetParentMenu().WidthOffset, 76)
            self.Background:Draw()
            self.BackgroundBar:Draw()
            self.ActiveBar:Draw()
            self.Text.Min:Draw()
            self.Text.Max:Draw()
            self.Text.Title:Draw()
            self:Functions()
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\panels\UIMenuStatisticsPanel ]]
--==================================================================================================================================================--
UIMenuStatisticsPanel = setmetatable({}, UIMenuStatisticsPanel)
UIMenuStatisticsPanel.__index = UIMenuStatisticsPanel
UIMenuStatisticsPanel.__call = function() return "UIMenuPanel", "UIMenuStatisticsPanel" end
do
    function UIMenuStatisticsPanel.New()
        local _UIMenuStatisticsPanel = {
            Background = UIResRectangle.New(0, 0, 431, 47, 0, 0, 0, 170),
            Divider = true,
            ParentItem = nil,
            Items = {}
        }
        return setmetatable(_UIMenuStatisticsPanel, UIMenuStatisticsPanel)
    end

    function UIMenuStatisticsPanel:AddStatistics(Name)
        local Items = {
            Text = UIResText.New(Name or "", 0, 0, 0.35, 255, 255, 255, 255, 0, "Left"),
            BackgroundProgressBar = UIResRectangle.New(0, 0, 200, 10, 255, 255, 255, 100),
            ProgressBar = UIResRectangle.New(0, 0, 100, 10, 255, 255, 255, 255),
            Divider = {
                [1] = UIResRectangle.New(0, 0, 2, 10, 0, 0, 0, 255),
                [2] = UIResRectangle.New(0, 0, 2, 10, 0, 0, 0, 255),
                [3] = UIResRectangle.New(0, 0, 2, 10, 0, 0, 0, 255),
                [4] = UIResRectangle.New(0, 0, 2, 10, 0, 0, 0, 255),
                [5] = UIResRectangle.New(0, 0, 2, 10, 0, 0, 0, 255)
            }
        }
        table.insert(self.Items, Items)
    end

    function UIMenuStatisticsPanel:SetParentItem(Item)
        if Item() == "UIMenuItem" then
            self.ParentItem = Item
        else
            return self.ParentItem
        end
    end

    function UIMenuStatisticsPanel:SetPercentage(ItemID, Number)
        if ItemID ~= nil then
            if Number <= 0 then
                self.Items[ItemID].ProgressBar.Width = 0
            else
                if Number <= 100 then
                    self.Items[ItemID].ProgressBar.Width = Number * 2.0
                else
                    self.Items[ItemID].ProgressBar.Width = 100 * 2.0
                end
            end
        else
            error("Missing arguments, ItemID")
        end
    end

    function UIMenuStatisticsPanel:GetPercentage(ItemID)
        if ItemID ~= nil then
            return self.Items[ItemID].ProgressBar.Width * 2.0
        else
            error("Missing arguments, ItemID")
        end
    end

    function UIMenuStatisticsPanel:Position(Y)
        if tonumber(Y) then
            local ParentOffsetX, ParentOffsetWidth = self.ParentItem:Offset().X, self.ParentItem:SetParentMenu().WidthOffset
            self.Background:Position(ParentOffsetX, Y)
            for i = 1, #self.Items do
                local OffsetItemCount = 40 * i
                self.Items[i].Text:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 13, Y - 34 + OffsetItemCount)
                self.Items[i].BackgroundProgressBar:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 200, Y - 22 + OffsetItemCount)
                self.Items[i].ProgressBar:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 200, Y - 22 + OffsetItemCount)
                if self.Divider ~= false then
                    for _ = 1, #self.Items[i].Divider, 1 do
                        local DividerOffsetWidth = _ * 40
                        self.Items[i].Divider[_]:Position(ParentOffsetX + (ParentOffsetWidth / 2) + 200 + DividerOffsetWidth,
                                                            Y - 22 + OffsetItemCount)
                        self.Background:Size(431 + self.ParentItem:SetParentMenu().WidthOffset, 47 + OffsetItemCount - 39)
                    end
                end
            end
        end
    end

    function UIMenuStatisticsPanel:Draw()
        self.Background:Draw()
        for i = 1, #self.Items do
            self.Items[i].Text:Draw()
            self.Items[i].BackgroundProgressBar:Draw()
            self.Items[i].ProgressBar:Draw()
            for _ = 1, #self.Items[i].Divider do self.Items[i].Divider[_]:Draw() end
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\panels\UIMenuVerticalOneLineGridPanel ]]
--==================================================================================================================================================--
UIMenuVerticalOneLineGridPanel = setmetatable({}, UIMenuVerticalOneLineGridPanel)
UIMenuVerticalOneLineGridPanel.__index = UIMenuVerticalOneLineGridPanel
UIMenuVerticalOneLineGridPanel.__call = function()
return "UIMenuPanel", "UIMenuVerticalOneLineGridPanel"
end
do
    function UIMenuVerticalOneLineGridPanel.New(TopText, BottomText, CirclePositionY)
        local _UIMenuVerticalOneLineGridPanel = {
            Data = {
                Enabled = true,
            },
            Background = Sprite.New("commonmenu", "gradient_bgd", 0, 0, 431, 275),
            Grid = Sprite.New("NativeUI", "vertical_grid", 0, 0, 200, 200, 0, 255, 255, 255, 255),
            Circle = Sprite.New("mpinventory", "in_world_circle", 0, 0, 20, 20, 0),
            Audio = { Slider = "CONTINUOUS_SLIDER", Library = "HUD_FRONTEND_DEFAULT_SOUNDSET", Id = nil },
            ParentItem = nil,
            Text = {
                Top = UIResText.New(TopText or "Top", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
                Bottom = UIResText.New(BottomText or "Bottom", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
            },
            SetCirclePosition = { X = 0.5, Y = CirclePositionY or 0.5 }
        }
        return setmetatable(_UIMenuVerticalOneLineGridPanel, UIMenuVerticalOneLineGridPanel)
    end

    function UIMenuVerticalOneLineGridPanel:SetParentItem(Item)
        if Item() == "UIMenuItem" then
            self.ParentItem = Item
        else
            return self.ParentItem
        end
    end

    function UIMenuVerticalOneLineGridPanel:Enabled(Enabled)
        if type(Enabled) == "boolean" then
            self.Data.Enabled = Enabled
        else
            return self.Data.Enabled
        end
    end

    function UIMenuVerticalOneLineGridPanel:CirclePosition(X, Y)
        if tonumber(X) and tonumber(Y) then
            self.Circle.X = (self.Grid.X + 20) + ((self.Grid.Width - 40) * ((X >= 0.0 and X <= 1.0) and X or 0.0)) - (self.Circle.Width / 2)
            self.Circle.Y = (self.Grid.Y + 20) + ((self.Grid.Height - 40) * ((Y >= 0.0 and Y <= 1.0) and Y or 0.0)) - (self.Circle.Height / 2)
        else
            return math.round((self.Circle.X - (self.Grid.X + 20) + (self.Circle.Width / 2)) / (self.Grid.Width - 40), 2), math.round((self.Circle.Y - (self.Grid.Y + 20) + (self.Circle.Height / 2)) / (self.Grid.Height - 40), 2)
        end
    end

    function UIMenuVerticalOneLineGridPanel:Position(Y)
        if tonumber(Y) then
            local ParentOffsetX, ParentOffsetWidth = self.ParentItem:Offset().X, self.ParentItem:SetParentMenu().WidthOffset
            self.Background:Position(ParentOffsetX, Y)
            self.Grid:Position(ParentOffsetX + 115.5 + (ParentOffsetWidth / 2), 37.5 + Y)
            self.Text.Top:Position(ParentOffsetX + 215.5 + (ParentOffsetWidth / 2), 5 + Y)
            self.Text.Bottom:Position(ParentOffsetX + 215.5 + (ParentOffsetWidth / 2), 240 + Y)
            if not self.CircleLocked then
                self.CircleLocked = true
                self:CirclePosition(self.SetCirclePosition.X, self.SetCirclePosition.Y)
            end
        end
    end

    function UIMenuVerticalOneLineGridPanel:UpdateParent(Y)
        local _, ParentType = self.ParentItem()
        self.Data.Value = { Y = Y }
        if ParentType == "UIMenuListItem" then
            local PanelItemIndex = self.ParentItem:FindPanelItem()
            if PanelItemIndex then
                self.ParentItem.Items[PanelItemIndex].Value[self.ParentItem:FindPanelIndex(self)] = { Y = Y }
                self.ParentItem:Index(PanelItemIndex)
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
            else
                local PanelIndex = self.ParentItem:FindPanelIndex(self)
                for Index = 1, #self.ParentItem.Items do
                    if type(self.ParentItem.Items[Index]) == "table" then
                        if not self.ParentItem.Items[Index].Panels then
                            self.ParentItem.Items[Index].Panels = {}
                        end
                        self.ParentItem.Items[Index].Panels[PanelIndex] = { Y = Y }
                    else
                        self.ParentItem.Items[Index] = { Name = tostring(self.ParentItem.Items[Index]), Value = self.ParentItem.Items[Index], Panels = { [PanelIndex] = { Y = Y } } }
                    end
                end
                self.ParentItem.Base.ParentMenu.OnListChange(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.OnListChanged(self.ParentItem.Base.ParentMenu, self.ParentItem, self.ParentItem._Index)
                self.ParentItem.Base.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, { Y = Y })
            end
        elseif ParentType == "UIMenuItem" then
            self.ParentItem.ActivatedPanel(self.ParentItem.ParentMenu, self.ParentItem, self, { Y = Y })
        end
    end

    function UIMenuVerticalOneLineGridPanel:Functions()
        local DrawOffset = { X = 0, Y = 0}
        if self.ParentItem:SetParentMenu().Settings.ScaleWithSafezone then
            DrawOffset = self.ParentItem:SetParentMenu().DrawOffset
        end

        if IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) then
            if IsDisabledControlJustPressed(0, 24) then
                if not self.Pressed then
                    self.Pressed = true
                    Citizen.CreateThread(function()
                        self.Audio.Id = GetSoundId()
                        PlaySoundFrontend(self.Audio.Id, self.Audio.Slider, self.Audio.Library, 1)
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) do
                            Citizen.Wait(0)
                            local CursorX, CursorY = ConvertToPixel(GetControlNormal(0, 239) - DrawOffset.X, GetControlNormal(0, 240) - DrawOffset.Y)
                            CursorX, CursorY = CursorX - (self.Circle.Width / 2), CursorY - (self.Circle.Height / 2)
                            local moveCursorX = ((CursorX > (self.Grid.X + 10 + self.Grid.Width - 120)) and (self.Grid.X + 10 + self.Grid.Width - 120) or ((CursorX < (self.Grid.X + 100 - (self.Circle.Width / 2))) and (self.Grid.X + 100 - (self.Circle.Width / 2)) or CursorX))
                            local moveCursorY = ((CursorY > (self.Grid.Y + 10 + self.Grid.Height - 40)) and (self.Grid.Y + 10 + self.Grid.Height - 40) or ((CursorY < (self.Grid.Y + 20 - (self.Circle.Height / 2))) and (self.Grid.Y + 20 - (self.Circle.Height / 2)) or CursorY))
                            self.Circle:Position(moveCursorX, moveCursorY)
                        end
                        StopSound(self.Audio.Id)
                        ReleaseSoundId(self.Audio.Id)
                        self.Pressed = false
                    end)
                    Citizen.CreateThread(function()
                        while IsDisabledControlPressed(0, 24) and IsMouseInBounds(self.Grid.X + 20, self.Grid.Y + 20, self.Grid.Width - 40, self.Grid.Height - 40, DrawOffset) do
                            Citizen.Wait(75)
                            local ResultY = math.round((self.Circle.Y - (self.Grid.Y + 20) + (self.Circle.Height / 2)) / (self.Grid.Height - 40), 2)
                            self:UpdateParent((((ResultY >= 0.0 and ResultY <= 1.0) and ResultY or ((ResultY <= 0) and 0.0) or 1.0) * 2) - 1)
                        end
                    end)
                end
            end
        end
    end

    function UIMenuVerticalOneLineGridPanel:Draw()
        if self.Data.Enabled then
            self.Background:Size(431 + self.ParentItem:SetParentMenu().WidthOffset, 275)
            self.Background:Draw()
            self.Grid:Draw()
            self.Circle:Draw()
            self.Text.Top:Draw()
            self.Text.Bottom:Draw()
            self:Functions()
        end
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\winows\UIMenuHeritageWindow ]]
--==================================================================================================================================================--
UIMenuHeritageWindow = setmetatable({}, UIMenuHeritageWindow)
UIMenuHeritageWindow.__index = UIMenuHeritageWindow
UIMenuHeritageWindow.__call = function() return "UIMenuWindow", "UIMenuHeritageWindow" end
do
    function UIMenuHeritageWindow.New(Mum, Dad)
        if not tonumber(Mum) then Mum = 0 end
        if not (Mum >= 0 and Mum <= 21) then Mum = 0 end
        if not tonumber(Dad) then Dad = 0 end
        if not (Dad >= 0 and Dad <= 23) then Dad = 0 end
        local _UIMenuHeritageWindow = {
            Background = Sprite.New("pause_menu_pages_char_mom_dad", "mumdadbg", 0, 0, 431, 228), -- Background is required, must be a sprite or a rectangle.
            MumSprite = Sprite.New("char_creator_portraits", ((Mum < 21) and "female_" .. Mum or "special_female_" .. (tonumber(string.sub(Mum, 2, 2)) - 1)), 0, 0, 228, 228),
            DadSprite = Sprite.New("char_creator_portraits", ((Dad < 21) and "male_" .. Dad or "special_male_" .. (tonumber(string.sub(Dad, 2, 2)) - 1)), 0, 0, 228, 228),
            Mum = Mum,
            Dad = Dad,
            _Offset = {X = 0, Y = 0},
            ParentMenu = nil
        }
        return setmetatable(_UIMenuHeritageWindow, UIMenuHeritageWindow)
    end

    function UIMenuHeritageWindow:SetParentMenu(Menu)
        -- required
        if Menu() == "UIMenu" then
            self.ParentMenu = Menu
        else
            return self.ParentMenu
        end
    end

    function UIMenuHeritageWindow:Offset(X, Y)
        if tonumber(X) or tonumber(Y) then
            if tonumber(X) then self._Offset.X = tonumber(X) end
            if tonumber(Y) then self._Offset.Y = tonumber(Y) end
        else
            return self._Offset
        end
    end

    function UIMenuHeritageWindow:Position(Y)
        if tonumber(Y) then
            self.Background:Position(self._Offset.X, 144 + Y + self._Offset.Y)
            self.MumSprite:Position(self._Offset.X + (self.ParentMenu.WidthOffset / 2) + 25, 144 + Y + self._Offset.Y)
            self.DadSprite:Position(self._Offset.X + (self.ParentMenu.WidthOffset / 2) + 195, 144 + Y + self._Offset.Y)
        end
    end

    function UIMenuHeritageWindow:Index(Mum, Dad)
        if not tonumber(Mum) then Mum = self.Mum end
        if not (Mum >= 0 and Mum <= 21) then Mum = self.Mum end
        if not tonumber(Dad) then Dad = self.Dad end
        if not (Dad >= 0 and Dad <= 23) then Dad = self.Dad end
        self.Mum = Mum
        self.Dad = Dad
        self.MumSprite.TxtName = ((self.Mum < 21) and "female_" .. self.Mum or "special_female_" .. (tonumber(string.sub(Mum, 2, 2)) - 1))
        self.DadSprite.TxtName = ((self.Dad < 21) and "male_" .. self.Dad or "special_male_" .. (tonumber(string.sub(Dad, 2, 2)) - 1))
    end

    function UIMenuHeritageWindow:Draw()
        self.Background:Size(431 + self.ParentMenu.WidthOffset, 228)
        self.Background:Draw()
        self.DadSprite:Draw()
        self.MumSprite:Draw()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu ]]
--==================================================================================================================================================--
UIMenu = setmetatable({}, UIMenu)
UIMenu.__index = UIMenu
UIMenu.__call = function() return "UIMenu" end
do
    function UIMenu.New(Title, Subtitle, X, Y, TxtDictionary, TxtName, Heading, R, G, B, A)
        X, Y = tonumber(X) or 0, tonumber(Y) or 0
        if Title ~= nil then
            Title = tostring(Title) or ""
        else
            Title = ""
        end
        if Subtitle ~= nil then
            Subtitle = tostring(Subtitle) or ""
        else
            Subtitle = ""
        end
        if TxtDictionary ~= nil then
            TxtDictionary = tostring(TxtDictionary) or "commonmenu"
        else
            TxtDictionary = "commonmenu"
        end
        if TxtName ~= nil then
            TxtName = tostring(TxtName) or "interaction_bgd"
        else
            TxtName = "interaction_bgd"
        end
        if Heading ~= nil then
            Heading = tonumber(Heading) or 0
        else
            Heading = 0
        end
        if R ~= nil then
            R = tonumber(R) or 255
        else
            R = 255
        end
        if G ~= nil then
            G = tonumber(G) or 255
        else
            G = 255
        end
        if B ~= nil then
            B = tonumber(B) or 255
        else
            B = 255
        end
        if A ~= nil then
            A = tonumber(A) or 255
        else
            A = 255
        end

        local _UIMenu = {
            Logo = Sprite.New(TxtDictionary, TxtName, 0 + X, 0 + Y, 431, 107, Heading, R, G, B, A),
            Banner = nil,
            Title = UIResText.New(Title, 215 + X, 20 + Y, 1.15, 255, 255, 255, 255, 1, 1, 0),
            BetterSize = true,
            Subtitle = {ExtraY = 0},
            WidthOffset = 0,
            Position = {X = X, Y = Y},
            DrawOffset = {X = 0, Y = 0},
            Pagination = {Min = 0, Max = 10, Total = 9},
            PageCounter = {isCustom = false, PreText = ""},
            Extra = {},
            Description = {},
            Items = {},
            Windows = {},
            Children = {},
            Controls = {
                Back = {Enabled = true},
                Select = {Enabled = true},
                Left = {Enabled = true},
                Right = {Enabled = true},
                Up = {Enabled = true},
                Down = {Enabled = true}
            },
            ParentMenu = nil,
            ParentItem = nil,
            _Visible = false,
            ActiveItem = 1000,
            Dirty = false,
            ReDraw = true,
            InstructionalScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS"),
            InstructionalButtons = {},
            OnIndexChange = function(menu, newindex) end,
            OnListChange = function(menu, list, newindex) end,
            OnSliderChange = function(menu, slider, newindex) end,
            OnProgressChange = function(menu, progress, newindex) end,
            OnCheckboxChange = function(menu, item, checked) end,
            OnListSelect = function(menu, list, index) end,
            OnSliderSelect = function(menu, slider, index) end,
            OnProgressSelect = function(menu, progress, index) end,
            OnItemSelect = function(menu, item, index) end,
            OnMenuChanged = function(menu, newmenu, forward) end,
            OnMenuClosed = function(menu) end,
            Settings = {
                InstructionalButtons = true,
                MultilineFormats = true,
                ScaleWithSafezone = true,
                ResetCursorOnOpen = true,
                MouseControlsEnabled = true,
                MouseEdgeEnabled = true,
                ControlDisablingEnabled = true,
                DrawOrder = nil,
                Audio = {
                    Library = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                    UpDown = "NAV_UP_DOWN",
                    LeftRight = "NAV_LEFT_RIGHT",
                    Select = "SELECT",
                    Back = "BACK",
                    Error = "ERROR"
                },
                EnabledControls = {
                    Controller = {
                        {0, 2}, -- Look Up and Down
                        {0, 1}, -- Look Left and Right
                        {0, 25}, -- Aim
                        {0, 24} -- Attack
                    },
                    Keyboard = {
                        {0, 201}, -- Select
                        {0, 195}, -- X axis
                        {0, 196}, -- Y axis
                        {0, 187}, -- Down
                        {0, 188}, -- Up
                        {0, 189}, -- Left
                        {0, 190}, -- Right
                        {0, 202}, -- Back
                        {0, 217}, -- Select
                        {0, 242}, -- Scroll down
                        {0, 241}, -- Scroll up
                        {0, 239}, -- Cursor X
                        {0, 240}, -- Cursor Y
                        {0, 31}, -- Move Up and Down
                        {0, 30}, -- Move Left and Right
                        {0, 21}, -- Sprint
                        {0, 22}, -- Jump
                        {0, 23}, -- Enter
                        {0, 75}, -- Exit Vehicle
                        {0, 71}, -- Accelerate Vehicle
                        {0, 72}, -- Vehicle Brake
                        {0, 59}, -- Move Vehicle Left and Right
                        {0, 89}, -- Fly Yaw Left
                        {0, 9}, -- Fly Left and Right
                        {0, 8}, -- Fly Up and Down
                        {0, 90}, -- Fly Yaw Right
                        {0, 76} -- Vehicle Handbrake
                    }
                }
            }
        }

        if Subtitle ~= "" and Subtitle ~= nil then
            _UIMenu.Subtitle.Rectangle = UIResRectangle.New(0 + _UIMenu.Position.X, 107 + _UIMenu.Position.Y, 431, 37, 0, 0, 0, 255)
            _UIMenu.Subtitle.Text = UIResText.New(Subtitle, 8 + _UIMenu.Position.X, 110 + _UIMenu.Position.Y, 0.35, 245, 245, 245, 255, 0)
            _UIMenu.Subtitle.BackupText = Subtitle
            _UIMenu.Subtitle.Formatted = false
            if string.starts(Subtitle, "~") then _UIMenu.PageCounter.PreText = string.sub(Subtitle, 1, 3) end
            _UIMenu.PageCounter.Text = UIResText.New("", 425 + _UIMenu.Position.X, 110 + _UIMenu.Position.Y, 0.35, 245, 245, 245, 255, 0, "Right")
            _UIMenu.Subtitle.ExtraY = 37
        end

        _UIMenu.ArrowSprite = Sprite.New("commonmenu", "shop_arrows_upanddown", 190 + _UIMenu.Position.X, 147 + 37 * (_UIMenu.Pagination.Total + 1) + _UIMenu.Position.Y - 37 + _UIMenu.Subtitle.ExtraY, 40, 40)
        _UIMenu.Extra.Up = UIResRectangle.New(0 + _UIMenu.Position.X, 144 + 38 * (_UIMenu.Pagination.Total + 1) + _UIMenu.Position.Y - 37 + _UIMenu.Subtitle.ExtraY, 431, 18, 0, 0, 0, 200)
        _UIMenu.Extra.Down = UIResRectangle.New(0 + _UIMenu.Position.X, 144 + 18 + 38 * (_UIMenu.Pagination.Total + 1) + _UIMenu.Position.Y - 37 + _UIMenu.Subtitle.ExtraY, 431, 18, 0, 0, 0, 200)

        _UIMenu.Description.Bar = UIResRectangle.New(_UIMenu.Position.X, 123, 431, 4, 0, 0, 0, 255)
        _UIMenu.Description.Rectangle = Sprite.New("commonmenu", "gradient_bgd", _UIMenu.Position.X, 127, 431, 30)
        _UIMenu.Description.Badge = Sprite.New("shared", "info_icon_32", _UIMenu.Position.X + 5, 130, 31, 31)
        _UIMenu.Description.Text = UIResText.New("Description", _UIMenu.Position.X + 35, 125, 0.35)
        _UIMenu.Description.Text.LongText = 1

        _UIMenu.Background = Sprite.New("commonmenu", "gradient_bgd", _UIMenu.Position.X, 144 + _UIMenu.Position.Y - 37 + _UIMenu.Subtitle.ExtraY, 290, 25)

        if _UIMenu.BetterSize == true then
            _UIMenu.WidthOffset = math.floor(tonumber(69))
            _UIMenu.Logo:Size(431 + _UIMenu.WidthOffset, 107)
            _UIMenu.Title:Position(((_UIMenu.WidthOffset + 431) / 2) + _UIMenu.Position.X, 20 + _UIMenu.Position.Y)
            if _UIMenu.Subtitle.Rectangle ~= nil then
                _UIMenu.Subtitle.Rectangle:Size(431 + _UIMenu.WidthOffset + 100, 37)
                _UIMenu.PageCounter.Text:Position(425 + _UIMenu.Position.X + _UIMenu.WidthOffset, 110 + _UIMenu.Position.Y)
            end
            if _UIMenu.Banner ~= nil then _UIMenu.Banner:Size(431 + _UIMenu.WidthOffset, 107) end
        end

        Citizen.CreateThread(function()
            if not HasScaleformMovieLoaded(_UIMenu.InstructionalScaleform) then
                _UIMenu.InstructionalScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
                while not HasScaleformMovieLoaded(_UIMenu.InstructionalScaleform) do Citizen.Wait(0) end
            end
        end)
        return setmetatable(_UIMenu, UIMenu)
    end

    function UIMenu:SetMenuWidthOffset(Offset)
        if tonumber(Offset) then
            self.WidthOffset = math.floor(tonumber(Offset) + tonumber(70))
            self.Logo:Size(431 + self.WidthOffset, 107)
            self.Title:Position(((self.WidthOffset + 431) / 2) + self.Position.X, 20 + self.Position.Y)
            if self.Subtitle.Rectangle ~= nil then
                self.Subtitle.Rectangle:Size(431 + self.WidthOffset + 100, 37)
                self.PageCounter.Text:Position(425 + self.Position.X + self.WidthOffset, 110 + self.Position.Y)
            end
            if self.Banner ~= nil then self.Banner:Size(431 + self.WidthOffset, 107) end
        end
    end

    function UIMenu:DisEnableControls(bool)
        if bool then
            EnableAllControlActions(2)
        else
            DisableAllControlActions(2)
        end
        if bool then
            return
        else
            if Controller() then
                for Index = 1, #self.Settings.EnabledControls.Controller do
                    EnableControlAction(self.Settings.EnabledControls.Controller[Index][1], self.Settings.EnabledControls.Controller[Index][2], true)
                end
            else
                for Index = 1, #self.Settings.EnabledControls.Keyboard do
                    EnableControlAction(self.Settings.EnabledControls.Keyboard[Index][1], self.Settings.EnabledControls.Keyboard[Index][2], true)
                end
            end
        end
    end

    function UIMenu:InstructionalButtons(bool) if bool ~= nil then self.Settings.InstrucitonalButtons = ToBool(bool) end end

    function UIMenu:SetBannerSprite(Sprite, IncludeChildren)
        if Sprite() == "Sprite" then
            self.Logo = Sprite
            self.Logo:Size(431 + self.WidthOffset, 107)
            self.Logo:Position(self.Position.X, self.Position.Y)
            self.Banner = nil
            if IncludeChildren then
                for Item, Menu in pairs(self.Children) do
                    Menu.Logo = Sprite
                    Menu.Logo:Size(431 + self.WidthOffset, 107)
                    Menu.Logo:Position(self.Position.X, self.Position.Y)
                    Menu.Banner = nil
                end
            end
        end
    end

    function UIMenu:SetBannerRectangle(Rectangle, IncludeChildren)
        if Rectangle() == "Rectangle" then
            self.Banner = Rectangle
            self.Banner:Size(431 + self.WidthOffset, 107)
            self.Banner:Position(self.Position.X, self.Position.Y)
            self.Logo = nil
            if IncludeChildren then
                for Item, Menu in pairs(self.Children) do
                    Menu.Banner = Rectangle
                    Menu.Banner:Size(431 + self.WidthOffset, 107)
                    Menu:Position(self.Position.X, self.Position.Y)
                    Menu.Logo = nil
                end
            end
        end
    end

    function UIMenu:CurrentSelection(value)
        if tonumber(value) then
            if #self.Items == 0 then self.ActiveItem = 0 end
            self.Items[self:CurrentSelection()]:Selected(false)
            self.ActiveItem = 1000000 - (1000000 % #self.Items) + tonumber(value)
            if self:CurrentSelection() > self.Pagination.Max then
                self.Pagination.Min = self:CurrentSelection() - self.Pagination.Total
                self.Pagination.Max = self:CurrentSelection()
            elseif self:CurrentSelection() < self.Pagination.Min then
                self.Pagination.Min = self:CurrentSelection()
                self.Pagination.Max = self:CurrentSelection() + self.Pagination.Total
            end
        else
            if #self.Items == 0 then
                return 1
            else
                if self.ActiveItem % #self.Items == 0 then
                    return 1
                else
                    return self.ActiveItem % #self.Items + 1
                end
            end
        end
    end

    function UIMenu:CalculateWindowHeight()
        local Height = 0
        for i = 1, #self.Windows do Height = Height + self.Windows[i].Background:Size().Height end
        return Height
    end

    function UIMenu:CalculateItemHeightOffset(Item)
        if Item.Base then
            return Item.Base.Rectangle.Height
        else
            return Item.Rectangle.Height
        end
    end

    function UIMenu:CalculateItemHeight()
        local ItemOffset = 0 + self.Subtitle.ExtraY - 37
        for i = self.Pagination.Min + 1, self.Pagination.Max do
            local Item = self.Items[i]
            if Item ~= nil then ItemOffset = ItemOffset + self:CalculateItemHeightOffset(Item) end
        end

        return ItemOffset
    end

    function UIMenu:RecalculateDescriptionPosition()
        local WindowHeight = self:CalculateWindowHeight()
        self.Description.Bar:Position(self.Position.X, 149 + self.Position.Y + WindowHeight)
        self.Description.Rectangle:Position(self.Position.X, 149 + self.Position.Y + WindowHeight)
        self.Description.Badge:Position(self.Position.X + 4, 152 + self.Position.Y + WindowHeight)
        self.Description.Text:Position(self.Position.X + 38, 153 + self.Position.Y + WindowHeight)
        self.Description.Bar:Size(431 + self.WidthOffset, 4)
        self.Description.Rectangle:Size(431 + self.WidthOffset, 30)
        self.Description.Bar:Position(self.Position.X, self:CalculateItemHeight() + ((#self.Items > (self.Pagination.Total + 1)) and 37 or 0) + self.Description.Bar:Position().Y)
        self.Description.Rectangle:Position(self.Position.X, self:CalculateItemHeight() + ((#self.Items > (self.Pagination.Total + 1)) and 37 or 0) + self.Description.Rectangle:Position().Y)
        self.Description.Badge:Position(self.Position.X + 4, self:CalculateItemHeight() + ((#self.Items > (self.Pagination.Total + 1)) and 37 or 0) + self.Description.Badge:Position().Y)
        self.Description.Text:Position(self.Position.X + 38, self:CalculateItemHeight() + ((#self.Items > (self.Pagination.Total + 1)) and 37 or 0) + self.Description.Text:Position().Y)
    end

    function UIMenu:CaclulatePanelPosition(HasDescription)
        local Height = self:CalculateWindowHeight() + 149 + self.Position.Y
        if HasDescription then Height = Height + self.Description.Rectangle:Size().Height + 5 end
        return self:CalculateItemHeight() + ((#self.Items > (self.Pagination.Total + 1)) and 37 or 0) + Height
    end

    function UIMenu:AddWindow(Window)
        if Window() == "UIMenuWindow" then
            Window:SetParentMenu(self)
            Window:Offset(self.Position.X, self.Position.Y)
            table.insert(self.Windows, Window)
            self.ReDraw = true
            self:RecalculateDescriptionPosition()
        end
    end

    function UIMenu:RemoveWindowAt(Index)
        if tonumber(Index) then
            if self.Windows[Index] then
                table.remove(self.Windows, Index)
                self.ReDraw = true
                self:RecalculateDescriptionPosition()
            end
        end
    end

    function UIMenu:AddItem(Item)
        Items = Item
        if #Items == 0 then
            if Item() == "UIMenuItem" then
                local SelectedItem = self:CurrentSelection()
                Item:SetParentMenu(self)
                Item:Offset(self.Position.X, self.Position.Y)
                Item:Position((#self.Items * 25) - 37 + self.Subtitle.ExtraY)
                table.insert(self.Items, Item)
                self:RecalculateDescriptionPosition()
                self:CurrentSelection(SelectedItem)
            end
        end
        for i = 1, #Items, 1 do
            Item = Items[i]
            if Item() == "UIMenuItem" then
                local SelectedItem = self:CurrentSelection()
                Item:SetParentMenu(self)
                Item:Offset(self.Position.X, self.Position.Y)
                Item:Position((#self.Items * 25) - 37 + self.Subtitle.ExtraY)
                table.insert(self.Items, Item)
                self:RecalculateDescriptionPosition()
                self:CurrentSelection(SelectedItem)
            end
        end
    end

    function UIMenu:AddSpacerItem(Title, Description)
        local output = "~h~";
        local length = Title:len();
        local totalSize = 50 - length;

        for i=0, totalSize do
            output = output.." ";
        end
        output = output..Title;
        local spacerItem = nil;
        if string.IsNullOrEmpty(Description) then spacerItem = UIMenuItem.New(output, "")
        else spacerItem = UIMenuItem.New(output, Description) end
        spacerItem:Enabled(false)
        self:AddItem(spacerItem)
    end
    
    function UIMenu:GetItemAt(index) return self.Items[index] end

    function UIMenu:RemoveItemAt(Index)
        if tonumber(Index) then
            if self.Items[Index] then
                local SelectedItem = self:CurrentSelection()
                if #self.Items > self.Pagination.Total and self.Pagination.Max == #self.Items - 1 then
                    self.Pagination.Min = self.Pagination.Min - 1
                    self.Pagination.Max = self.Pagination.Max + 1
                end
                table.remove(self.Items, tonumber(Index))
                self:RecalculateDescriptionPosition()
                self:CurrentSelection(SelectedItem)
            end
        end
    end

    function UIMenu:RefreshIndex()
        if #self.Items == 0 then
            self.ActiveItem = 1000
            self.Pagination.Max = self.Pagination.Total + 1
            self.Pagination.Min = 0
            return
        end
        self.Items[self:CurrentSelection()]:Selected(false)
        self.ActiveItem = 1000 - (1000 % #self.Items)
        self.Pagination.Max = self.Pagination.Total + 1
        self.Pagination.Min = 0
        self.ReDraw = true
    end

    function UIMenu:Clear()
        self.Items = {}
        self.ReDraw = true
        self:RecalculateDescriptionPosition()
    end

    function UIMenu:MultilineFormat(str, offset)
        if offset == nil then offset = 0 end
        if tostring(str) then
            local PixelPerLine = 425 + self.WidthOffset - offset
            local AggregatePixels = 0
            local output = ""
            local words = string.split(tostring(str), " ")
            for i = 1, #words do
                local offset = MeasureStringWidth(words[i], 0, 0.30)
                AggregatePixels = AggregatePixels + offset
                if AggregatePixels > PixelPerLine then
                    output = output .. "\n" .. words[i] .. " "
                    AggregatePixels = offset + MeasureString(" ")
                else
                    output = output .. words[i] .. " "
                    AggregatePixels = AggregatePixels + MeasureString(" ")
                end
            end

            return output
        end
    end

    function UIMenu:DrawCalculations()
        local WindowHeight = self:CalculateWindowHeight()
        if self.Settings.MultilineFormats then
            if self.Subtitle.Rectangle and not self.Subtitle.Formatted then
                self.Subtitle.Formatted = true
                self.Subtitle.Text:Text(self:MultilineFormat(self.Subtitle.Text:Text()))
                local Linecount = #string.split(self.Subtitle.Text:Text(), "\n")
                self.Subtitle.ExtraY = ((Linecount == 1) and 37 or ((Linecount + 1) * 22))
                self.Subtitle.Rectangle:Size(431 + self.WidthOffset, self.Subtitle.ExtraY)
            end
        elseif self.Subtitle.Formatted then
            self.Subtitle.Formatted = false
            self.Subtitle.ExtraY = 37
            self.Subtitle.Rectangle:Size(431 + self.WidthOffset, self.Subtitle.ExtraY)
            self.Subtitle.Text:Text(self.Subtitle.BackupText)
        end

        self.Background:Size(431 + self.WidthOffset, self:CalculateItemHeight() + WindowHeight + ((self.Subtitle.ExtraY > 0) and 0 or 37))

        self.Extra.Up:Size(431 + self.WidthOffset, 18)
        self.Extra.Down:Size(431 + self.WidthOffset, 18)

        local offsetExtra = 4
        self.Extra.Up:Position(self.Position.X, 144 + self:CalculateItemHeight() + self.Position.Y + WindowHeight + offsetExtra)
        self.Extra.Down:Position(self.Position.X, 144 + 18 + self:CalculateItemHeight() + self.Position.Y + WindowHeight + offsetExtra)

        if self.WidthOffset > 0 then
            self.ArrowSprite:Position(190 + self.Position.X + (self.WidthOffset / 2),
                                        141 + self:CalculateItemHeight() + self.Position.Y + WindowHeight + offsetExtra)
        else
            self.ArrowSprite:Position(190 + self.Position.X + self.WidthOffset,
                                        141 + self:CalculateItemHeight() + self.Position.Y + WindowHeight + offsetExtra)
        end

        self.ReDraw = false

        if #self.Items ~= 0 and self.Items[self:CurrentSelection()]:Description() ~= "" then
            self:RecalculateDescriptionPosition()
            local description = self.Items[self:CurrentSelection()]:Description()
            if self.Settings.MultilineFormats then
                self.Description.Text:Text(self:MultilineFormat(description, 35))
            else
                self.Description.Text:Text(description)
            end
            local Linecount = #string.split(self.Description.Text:Text(), "\n")
            self.Description.Rectangle:Size(431 + self.WidthOffset, ((Linecount == 1) and 37 or ((Linecount + 1) * 22)))
        end
    end

    function UIMenu:Visible(bool)
        if bool ~= nil then
            self._Visible = ToBool(bool)
            self.JustOpened = ToBool(bool)
            self.Dirty = ToBool(bool)
            self:UpdateScaleform()
            if self.ParentMenu ~= nil or ToBool(bool) == false then return end
            if self.Settings.ResetCursorOnOpen then
                if SetCursorSprite ~= nil then
                    SetCursorSprite(1)
                else
                    N_0x8db8cffd58b62552(1)
                end
                if SetCursorLocation ~= nil then
                    SetCursorLocation(0.5, 0.5)
                else
                    N_0xfc695459d4d0e219(0.5, 0.5)
                end
            end
        else
            return self._Visible
        end
    end

    function UIMenu:ProcessControl()
        if not self._Visible then return end
        if self.JustOpened then
            self.JustOpened = false
            return
        end
        if self.Controls.Back.Enabled and
            (IsDisabledControlJustReleased(0, 177) or IsDisabledControlJustReleased(1, 177) or IsDisabledControlJustReleased(2, 177) or
                IsDisabledControlJustReleased(0, 199) or IsDisabledControlJustReleased(1, 199) or IsDisabledControlJustReleased(2, 199)) then
            self:GoBack()
        end
        if #self.Items == 0 then return end
        if not self.UpPressed then
            if self.Controls.Up.Enabled and
                (IsDisabledControlJustPressed(0, 172) or IsDisabledControlJustPressed(1, 172) or IsDisabledControlJustPressed(2, 172) or
                    IsDisabledControlJustPressed(0, 241) or IsDisabledControlJustPressed(1, 241) or IsDisabledControlJustPressed(2, 241) or
                    IsDisabledControlJustPressed(2, 241)) then
                Citizen.CreateThread(function()
                    self.UpPressed = true
                    if #self.Items > self.Pagination.Total + 1 then
                        self:GoUpOverflow()
                    else
                        self:GoUp()
                    end
                    self:UpdateScaleform()
                    Citizen.Wait(175)
                    while self.Controls.Up.Enabled and
                        (IsDisabledControlPressed(0, 172) or IsDisabledControlPressed(1, 172) or IsDisabledControlPressed(2, 172) or
                            IsDisabledControlPressed(0, 241) or IsDisabledControlPressed(1, 241) or IsDisabledControlPressed(2, 241) or
                            IsDisabledControlPressed(2, 241)) do
                        if #self.Items > self.Pagination.Total + 1 then
                            self:GoUpOverflow()
                        else
                            self:GoUp()
                        end
                        self:UpdateScaleform()
                        Citizen.Wait(125)
                    end
                    self.UpPressed = false
                end)
            end
        end
        if not self.DownPressed then
            if self.Controls.Down.Enabled and
                (IsDisabledControlJustPressed(0, 173) or IsDisabledControlJustPressed(1, 173) or IsDisabledControlJustPressed(2, 173) or
                    IsDisabledControlJustPressed(0, 242) or IsDisabledControlJustPressed(1, 242) or IsDisabledControlJustPressed(2, 242)) then
                Citizen.CreateThread(function()
                    self.DownPressed = true
                    if #self.Items > self.Pagination.Total + 1 then
                        self:GoDownOverflow()
                    else
                        self:GoDown()
                    end
                    self:UpdateScaleform()
                    Citizen.Wait(175)
                    while self.Controls.Down.Enabled and
                        (IsDisabledControlPressed(0, 173) or IsDisabledControlPressed(1, 173) or IsDisabledControlPressed(2, 173) or
                            IsDisabledControlPressed(0, 242) or IsDisabledControlPressed(1, 242) or IsDisabledControlPressed(2, 242)) do
                        if #self.Items > self.Pagination.Total + 1 then
                            self:GoDownOverflow()
                        else
                            self:GoDown()
                        end
                        self:UpdateScaleform()
                        Citizen.Wait(125)
                    end
                    self.DownPressed = false
                end)
            end
        end
        if not self.LeftPressed then
            if self.Controls.Left.Enabled and
                (IsDisabledControlJustPressed(0, 174) or IsDisabledControlJustPressed(1, 174) or IsDisabledControlJustPressed(2, 174)) then
                local type, subtype = self.Items[self:CurrentSelection()]()
                Citizen.CreateThread(function()
                    if (subtype == "UIMenuSliderHeritageItem") then
                        self.LeftPressed = true
                        self:GoLeft()
                        Citizen.Wait(40)
                        while self.Controls.Left.Enabled and
                            (IsDisabledControlPressed(0, 174) or IsDisabledControlPressed(1, 174) or IsDisabledControlPressed(2, 174)) do
                            self:GoLeft()
                            Citizen.Wait(20)
                        end
                        self.LeftPressed = false
                    else
                        self.LeftPressed = true
                        self:GoLeft()
                        Citizen.Wait(175)
                        while self.Controls.Left.Enabled and
                            (IsDisabledControlPressed(0, 174) or IsDisabledControlPressed(1, 174) or IsDisabledControlPressed(2, 174)) do
                            self:GoLeft()
                            Citizen.Wait(125)
                        end
                        self.LeftPressed = false
                    end
                end)
            end
        end
        if not self.RightPressed then
            if self.Controls.Right.Enabled and
                (IsDisabledControlJustPressed(0, 175) or IsDisabledControlJustPressed(1, 175) or IsDisabledControlJustPressed(2, 175)) then
                Citizen.CreateThread(function()
                    local type, subtype = self.Items[self:CurrentSelection()]()
                    if (subtype == "UIMenuSliderHeritageItem") then
                        self.RightPressed = true
                        self:GoRight()
                        Citizen.Wait(40)
                        while self.Controls.Right.Enabled and
                            (IsDisabledControlPressed(0, 175) or IsDisabledControlPressed(1, 175) or IsDisabledControlPressed(2, 175)) do
                            self:GoRight()
                            Citizen.Wait(20)
                        end
                        self.RightPressed = false
                    else
                        self.RightPressed = true
                        self:GoRight()
                        Citizen.Wait(175)
                        while self.Controls.Right.Enabled and
                            (IsDisabledControlPressed(0, 175) or IsDisabledControlPressed(1, 175) or IsDisabledControlPressed(2, 175)) do
                            self:GoRight()
                            Citizen.Wait(125)
                        end
                        self.RightPressed = false
                    end
                end)
            end
        end
        if self.Controls.Select.Enabled and
            (IsDisabledControlJustPressed(0, 201) or IsDisabledControlJustPressed(1, 201) or IsDisabledControlJustPressed(2, 201)) then
            self:SelectItem()
        end
    end

    function UIMenu:GoUpOverflow()
        if #self.Items <= self.Pagination.Total + 1 then return end
        if self:CurrentSelection() <= self.Pagination.Min + 1 then
            if self:CurrentSelection() == 1 then
                self.Pagination.Min = #self.Items - (self.Pagination.Total + 1)
                self.Pagination.Max = #self.Items
                self.Items[self:CurrentSelection()]:Selected(false)
                self.ActiveItem = 1000 - (1000 % #self.Items)
                self.ActiveItem = self.ActiveItem + (#self.Items - 1)
                self.Items[self:CurrentSelection()]:Selected(true)
            else
                self.Pagination.Min = self.Pagination.Min - 1
                self.Pagination.Max = self.Pagination.Max - 1
                self.Items[self:CurrentSelection()]:Selected(false)
                self.ActiveItem = self.ActiveItem - 1
                self.Items[self:CurrentSelection()]:Selected(true)
            end
        else
            self.Items[self:CurrentSelection()]:Selected(false)
            self.ActiveItem = self.ActiveItem - 1
            self.Items[self:CurrentSelection()]:Selected(true)
        end
        PlaySoundFrontend(-1, self.Settings.Audio.UpDown, self.Settings.Audio.Library, true)
        self.OnIndexChange(self, self:CurrentSelection())
        self.ReDraw = true
    end

    function UIMenu:GoUp()
        if #self.Items > self.Pagination.Total + 1 then return end
        self.Items[self:CurrentSelection()]:Selected(false)
        self.ActiveItem = self.ActiveItem - 1
        self.Items[self:CurrentSelection()]:Selected(true)
        PlaySoundFrontend(-1, self.Settings.Audio.UpDown, self.Settings.Audio.Library, true)
        self.OnIndexChange(self, self:CurrentSelection())
        self.ReDraw = true
    end

    function UIMenu:GoDownOverflow()
        if #self.Items <= self.Pagination.Total + 1 then return end

        if self:CurrentSelection() >= self.Pagination.Max then
            if self:CurrentSelection() == #self.Items then
                self.Pagination.Min = 0
                self.Pagination.Max = self.Pagination.Total + 1
                self.Items[self:CurrentSelection()]:Selected(false)
                self.ActiveItem = 1000 - (1000 % #self.Items)
                self.Items[self:CurrentSelection()]:Selected(true)
            else
                self.Pagination.Max = self.Pagination.Max + 1
                self.Pagination.Min = self.Pagination.Max - (self.Pagination.Total + 1)
                self.Items[self:CurrentSelection()]:Selected(false)
                self.ActiveItem = self.ActiveItem + 1
                self.Items[self:CurrentSelection()]:Selected(true)
            end
        else
            self.Items[self:CurrentSelection()]:Selected(false)
            self.ActiveItem = self.ActiveItem + 1
            self.Items[self:CurrentSelection()]:Selected(true)
        end
        PlaySoundFrontend(-1, self.Settings.Audio.UpDown, self.Settings.Audio.Library, true)
        self.OnIndexChange(self, self:CurrentSelection())
        self.ReDraw = true
    end

    function UIMenu:GoDown()
        if #self.Items > self.Pagination.Total + 1 then return end

        self.Items[self:CurrentSelection()]:Selected(false)
        self.ActiveItem = self.ActiveItem + 1
        self.Items[self:CurrentSelection()]:Selected(true)
        PlaySoundFrontend(-1, self.Settings.Audio.UpDown, self.Settings.Audio.Library, true)
        self.OnIndexChange(self, self:CurrentSelection())
        self.ReDraw = true
    end

    function UIMenu:GoLeft()
        local type, subtype = self.Items[self:CurrentSelection()]()
        if subtype ~= "UIMenuListItem" and subtype ~= "UIMenuSliderItem" and subtype ~= "UIMenuProgressItem" and subtype ~=
            "UIMenuSliderHeritageItem" and subtype ~= "UIMenuSliderProgressItem" then return end

        if not self.Items[self:CurrentSelection()]:Enabled() then
            PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
            return
        end

        if subtype == "UIMenuListItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index - 1)
            self.OnListChange(self, Item, Item._Index)
            Item.OnListChanged(self, Item, Item._Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuSliderItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index - 1)
            self.OnSliderChange(self, Item, Item:Index())
            Item.OnSliderChanged(self, Item, Item._Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuSliderProgressItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index - 1)
            self.OnSliderChange(self, Item, Item:Index())
            Item.OnSliderChanged(self, Item, Item._Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuProgressItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item.Data.Index - 1)
            self.OnProgressChange(self, Item, Item.Data.Index)
            Item.OnProgressChanged(self, Item, Item.Data.Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuSliderHeritageItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index - 0.1)
            self.OnSliderChange(self, Item, Item:Index())
            Item.OnSliderChanged(self, Item, Item._Index)
            if not Item.Pressed then
                Item.Pressed = true
                Citizen.CreateThread(function()
                    Item.Audio.Id = GetSoundId()
                    PlaySoundFrontend(Item.Audio.Id, Item.Audio.Slider, Item.Audio.Library, 1)
                    Citizen.Wait(100)
                    StopSound(Item.Audio.Id)
                    ReleaseSoundId(Item.Audio.Id)
                    Item.Pressed = false
                end)
            end

        end
    end

    function UIMenu:GoRight()
        local type, subtype = self.Items[self:CurrentSelection()]()
        if subtype ~= "UIMenuListItem" and subtype ~= "UIMenuSliderItem" and subtype ~= "UIMenuProgressItem" and subtype ~=
            "UIMenuSliderHeritageItem" and subtype ~= "UIMenuSliderProgressItem" then return end
        if not self.Items[self:CurrentSelection()]:Enabled() then
            PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
            return
        end
        if subtype == "UIMenuListItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index + 1)
            self.OnListChange(self, Item, Item._Index)
            Item.OnListChanged(self, Item, Item._Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuSliderItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index + 1)
            self.OnSliderChange(self, Item, Item:Index())
            Item.OnSliderChanged(self, Item, Item._Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuSliderProgressItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index + 1)
            self.OnSliderChange(self, Item, Item:Index())
            Item.OnSliderChanged(self, Item, Item._Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuProgressItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item.Data.Index + 1)
            self.OnProgressChange(self, Item, Item.Data.Index)
            Item.OnProgressChanged(self, Item, Item.Data.Index)
            PlaySoundFrontend(-1, self.Settings.Audio.LeftRight, self.Settings.Audio.Library, true)
        elseif subtype == "UIMenuSliderHeritageItem" then
            local Item = self.Items[self:CurrentSelection()]
            Item:Index(Item._Index + 0.1)
            self.OnSliderChange(self, Item, Item:Index())
            Item.OnSliderChanged(self, Item, Item._Index)
            if not Item.Pressed then
                Item.Pressed = true
                Citizen.CreateThread(function()
                    Item.Audio.Id = GetSoundId()
                    PlaySoundFrontend(Item.Audio.Id, Item.Audio.Slider, Item.Audio.Library, 1)
                    Citizen.Wait(100)
                    StopSound(Item.Audio.Id)
                    ReleaseSoundId(Item.Audio.Id)
                    Item.Pressed = false
                end)
            end
        end
    end

    function UIMenu:SelectItem()
        if not self.Items[self:CurrentSelection()]:Enabled() then
            PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
            return
        end
        local Item = self.Items[self:CurrentSelection()]
        local type, subtype = Item()
        if subtype == "UIMenuCheckboxItem" then
            Item.Checked = not Item.Checked
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnCheckboxChange(self, Item, Item.Checked)
            Item.CheckboxEvent(self, Item, Item.Checked)
        elseif subtype == "UIMenuListItem" then
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnListSelect(self, Item, Item._Index)
            Item.OnListSelected(self, Item, Item._Index)
        elseif subtype == "UIMenuSliderItem" then
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnSliderSelect(self, Item, Item._Index)
            Item.OnSliderSelected(Item._Index)
        elseif subtype == "UIMenuSliderProgressItem" then
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnSliderSelect(self, Item, Item._Index)
            Item.OnSliderSelected(Item._Index)
        elseif subtype == "UIMenuProgressItem" then
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnProgressSelect(self, Item, Item.Data.Index)
            Item.OnProgressSelected(Item.Data.Index)
        elseif subtype == "UIMenuSliderHeritageItem" then
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnSliderSelect(self, Item, Item._Index)
            Item.OnSliderSelected(Item._Index)
        else
            PlaySoundFrontend(-1, self.Settings.Audio.Select, self.Settings.Audio.Library, true)
            self.OnItemSelect(self, Item, self:CurrentSelection())
            Item.Activated(self, Item)
            if not self.Children[Item] then return end
            self:Visible(false)
            self.Children[Item]:Visible(true)
            self.OnMenuChanged(self, self.Children[self.Items[self:CurrentSelection()]], true)
        end
    end

    function UIMenu:GoBack()
        PlaySoundFrontend(-1, self.Settings.Audio.Back, self.Settings.Audio.Library, true)
        self:Visible(false)
        if self.ParentMenu ~= nil then
            self.ParentMenu:Visible(true)
            self.OnMenuChanged(self, self.ParentMenu, false)
            if self.Settings.ResetCursorOnOpen then
                if SetCursorLocation ~= nil then
                    SetCursorLocation(0.5, 0.5)
                else
                    N_0xfc695459d4d0e219(0.5, 0.5)
                end
            end
        end
        self.OnMenuClosed(self)
    end

    function UIMenu:BindMenuToItem(Menu, Item)
        if Menu() == "UIMenu" and Item() == "UIMenuItem" then
            Menu.ParentMenu = self
            Menu.ParentItem = Item
            self.Children[Item] = Menu
        end
    end

    function UIMenu:ReleaseMenuFromItem(Item)
        if Item() == "UIMenuItem" then
            if not self.Children[Item] then return false end
            self.Children[Item].ParentMenu = nil
            self.Children[Item].ParentItem = nil
            self.Children[Item] = nil
            return true
        end
    end

    function UIMenu:PageCounterName(String)
        self.PageCounter.isCustom = true
        self.PageCounter.PreText = String
        self.PageCounter.Text:Text(self.PageCounter.PreText)
        self.PageCounter.Text:Draw()
    end

    function UIMenu:Draw()
        if not self._Visible then return end
        HideHudComponentThisFrame(19)
        if self.Settings.ControlDisablingEnabled then self:DisEnableControls(false) end
        if self.Settings.InstructionalButtons then DrawScaleformMovieFullscreen(self.InstructionalScaleform, 255, 255, 255, 255, 0) end
        if self.Settings.ScaleWithSafezone then
            if N_0xB8A850F20A067EB6 ~= nil then
                N_0xB8A850F20A067EB6(76, 84)
            elseif SetScriptGfxAlign ~= nil then
                SetScriptGfxAlign(76, 84)
            elseif SetScreenDrawPosition ~= nil then
                SetScreenDrawPosition(76, 84)
            end

            if N_0xF5A2C681787E579D ~= nil then
                N_0xF5A2C681787E579D(0, 0, 0, 0)
            elseif ScreenDrawPositionRatio ~= nil then
                ScreenDrawPositionRatio(0, 0, 0, 0)
            elseif SetScriptGfxAlignParams ~= nil then
                SetScriptGfxAlignParams(0, 0, 0, 0)
            end

            if self.Settings.DrawOrder ~= nil then SetScriptGfxDrawOrder(tonumber(self.Settings.DrawOrder)) end
            if GetScriptGfxPosition ~= nil then
                self.DrawOffset.X, self.DrawOffset.Y = GetScriptGfxPosition(0, 0)
            else
                self.DrawOffset.X, self.DrawOffset.Y = N_0x6dd8f5aa635eb4b2(0, 0)
            end
        end
        if self.ReDraw then self:DrawCalculations() end
        if self.Logo then
            self.Logo:Draw()
        elseif self.Banner then
            self.Banner:Draw()
        end
        self.Title:Draw()
        if self.Subtitle.Rectangle then
            self.Subtitle.Rectangle:Draw()
            self.Subtitle.Text:Draw()
        end
        if #self.Items ~= 0 or #self.Windows ~= 0 then self.Background:Draw() end
        if #self.Windows ~= 0 then
            local WindowOffset = 0
            for index = 1, #self.Windows do
                if self.Windows[index - 1] then
                    WindowOffset = WindowOffset + self.Windows[index - 1].Background:Size().Height
                end
                local Window = self.Windows[index]
                Window:Position(WindowOffset + self.Subtitle.ExtraY - 37)
                Window:Draw()
            end
        end
        if #self.Items == 0 then
            if self.Settings.ScaleWithSafezone then
                if ResetScriptGfxAlign ~= nil then
                    ResetScriptGfxAlign()
                elseif ScreenDrawPositionEnd ~= nil then
                    ScreenDrawPositionEnd()
                else
                    N_0xe3a3db414a373dab()
                end
            end
            return
        end

        local CurrentSelection = self:CurrentSelection()
        self.Items[CurrentSelection]:Selected(true)

        if self.Items[CurrentSelection]:Description() ~= "" then
            self.Description.Bar:Draw()
            self.Description.Rectangle:Draw()
            self.Description.Badge:Draw()
            self.Description.Text:Draw()
        end

        if self.Items[CurrentSelection].Panels ~= nil then
            if #self.Items[CurrentSelection].Panels ~= 0 then
                local PanelOffset = self:CaclulatePanelPosition(self.Items[CurrentSelection]:Description() ~= "")
                for index = 1, #self.Items[CurrentSelection].Panels do
                    if self.Items[CurrentSelection].Panels[index - 1] then
                        PanelOffset = PanelOffset + self.Items[CurrentSelection].Panels[index - 1].Background:Size().Height + 5
                    end
                    self.Items[CurrentSelection].Panels[index]:Position(PanelOffset)
                    self.Items[CurrentSelection].Panels[index]:Draw()
                end
            end
        end

        local WindowHeight = self:CalculateWindowHeight()

        if #self.Items <= self.Pagination.Total + 1 then
            local ItemOffset = self.Subtitle.ExtraY - 37 + WindowHeight
            for index = 1, #self.Items do
                local Item = self.Items[index]
                Item:Position(ItemOffset)
                Item:Draw()
                ItemOffset = ItemOffset + self:CalculateItemHeightOffset(Item)
            end
        else
            local ItemOffset = self.Subtitle.ExtraY - 37 + WindowHeight
            for index = self.Pagination.Min + 1, self.Pagination.Max, 1 do
                if self.Items[index] then
                    local Item = self.Items[index]
                    Item:Position(ItemOffset)
                    Item:Draw()
                    ItemOffset = ItemOffset + self:CalculateItemHeightOffset(Item)
                end
            end

            self.Extra.Up:Draw()
            self.Extra.Down:Draw()
            self.ArrowSprite:Draw()

            if self.PageCounter.isCustom ~= true then
                if self.PageCounter.Text ~= nil then
                    local Caption = self.PageCounter.PreText .. CurrentSelection .. " / " .. #self.Items
                    self.PageCounter.Text:Text(Caption)
                    self.PageCounter.Text:Draw()
                end
            end
        end

        if self.PageCounter.isCustom ~= false then
            if self.PageCounter.Text ~= nil then
                self.PageCounter.Text:Text(self.PageCounter.PreText)
                self.PageCounter.Text:Draw()
            end
        end

        if self.Settings.ScaleWithSafezone then
            if ResetScriptGfxAlign ~= nil then
                ResetScriptGfxAlign()
            elseif ScreenDrawPositionEnd ~= nil then
                ScreenDrawPositionEnd()
            else
                N_0xe3a3db414a373dab()
            end
        end
    end

    function UIMenu:ProcessMouse()
        if not self._Visible or self.JustOpened or #self.Items == 0 or ToBool(Controller()) or not self.Settings.MouseControlsEnabled then
            EnableControlAction(0, 2, true)
            EnableControlAction(0, 1, true)
            EnableControlAction(0, 25, true)
            EnableControlAction(0, 24, true)
            if self.Dirty then for _, Item in pairs(self.Items) do if Item:Hovered() then Item:Hovered(false) end end end
            return
        end

        local WindowHeight = self:CalculateWindowHeight()
        local Limit = #self.Items
        local ItemOffset = 0

        ShowCursorThisFrame()

        if #self.Items > self.Pagination.Total + 1 then Limit = self.Pagination.Max end

        local W, H = GetResolution()

        if IsMouseInBounds(0, 0, 30, H) and self.Settings.MouseEdgeEnabled then
            SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading() + 5)
            if SetCursorSprite ~= nil then
                SetCursorSprite(6)
            else
                N_0x8db8cffd58b62552(6)
            end
        elseif IsMouseInBounds(W - 30, 0, 30, H) and self.Settings.MouseEdgeEnabled then
            SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading() - 5)
            if SetCursorSprite ~= nil then
                SetCursorSprite(7)
            else
                N_0x8db8cffd58b62552(7)
            end
        elseif self.Settings.MouseEdgeEnabled then
            if SetCursorSprite ~= nil then
                SetCursorSprite(1)
            else
                N_0x8db8cffd58b62552(1)
            end
        end

        for i = self.Pagination.Min + 1, Limit, 1 do
            local X, Y = self.Position.X, self.Position.Y + 144 - 37 + self.Subtitle.ExtraY + ItemOffset + WindowHeight
            local Item = self.Items[i]
            local Type, SubType = Item()
            local Width, Height = 431 + self.WidthOffset, self:CalculateItemHeightOffset(Item)

            if IsMouseInBounds(X, Y, Width, Height, self.DrawOffset) then
                Item:Hovered(true)
                if not self.Controls.MousePressed then
                    if IsDisabledControlJustPressed(0, 24) then
                        Citizen.CreateThread(function()
                            local _X, _Y, _Width, _Height = X, Y, Width, Height
                            self.Controls.MousePressed = true
                            if Item:Selected() and Item:Enabled() then
                                if SubType == "UIMenuListItem" then
                                    if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoLeft()
                                    elseif not IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                                Item.RightArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                    if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width, Item.RightArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoRight()
                                    elseif not IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width,
                                                                Item.LeftArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                elseif SubType == "UIMenuSliderItem" then
                                    if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoLeft()
                                    elseif not IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                                Item.RightArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                    if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width, Item.RightArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoRight()
                                    elseif not IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width,
                                                                Item.LeftArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                elseif SubType == "UIMenuSliderProgressItem" then
                                    if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoLeft()
                                    elseif not IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                                Item.RightArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                    if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width, Item.RightArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoRight()
                                    elseif not IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width,
                                                                Item.LeftArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                elseif SubType == "UIMenuSliderHeritageItem" then
                                    if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoLeft()
                                    elseif not IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                                Item.RightArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                    if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width, Item.RightArrow.Height,
                                                        self.DrawOffset) then
                                        self:GoRight()
                                    elseif not IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width,
                                                                Item.LeftArrow.Height, self.DrawOffset) then
                                        self:SelectItem()
                                    end
                                elseif SubType == "UIMenuProgressItem" then
                                    if IsMouseInBounds(Item.Bar.X, Item.Bar.Y - 12, Item.Data.Max, Item.Bar.Height + 24, self.DrawOffset) then
                                        local CursorX, CursorY = ConvertToPixel(GetControlNormal(0, 239), 0)
                                        Item:CalculateProgress(CursorX)
                                        self.OnProgressChange(self, Item, Item.Data.Index)
                                        Item.OnProgressChanged(self, Item, Item.Data.Index)
                                        if not Item.Pressed then
                                            Item.Pressed = true
                                            Citizen.CreateThread(function()
                                                Item.Audio.Id = GetSoundId()
                                                PlaySoundFrontend(Item.Audio.Id, Item.Audio.Slider, Item.Audio.Library, 1)
                                                Citizen.Wait(100)
                                                StopSound(Item.Audio.Id)
                                                ReleaseSoundId(Item.Audio.Id)
                                                Item.Pressed = false
                                            end)
                                        end
                                    else
                                        self:SelectItem()
                                    end
                                else
                                    self:SelectItem()
                                end
                            elseif not Item:Selected() then
                                self:CurrentSelection(i - 1)
                                PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
                                self.OnIndexChange(self, self:CurrentSelection())
                                self.ReDraw = true
                                self:UpdateScaleform()
                            elseif not Item:Enabled() and Item:Selected() then
                                PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
                            end
                            Citizen.Wait(175)
                            while IsDisabledControlPressed(0, 24) and IsMouseInBounds(_X, _Y, _Width, _Height, self.DrawOffset) do
                                if Item:Selected() and Item:Enabled() then
                                    if SubType == "UIMenuListItem" then
                                        if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                            self.DrawOffset) then self:GoLeft() end
                                        if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                            Item.RightArrow.Height, self.DrawOffset) then
                                            self:GoRight()
                                        end
                                    elseif SubType == "UIMenuSliderItem" then
                                        if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                            self.DrawOffset) then self:GoLeft() end
                                        if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                            Item.RightArrow.Height, self.DrawOffset) then
                                            self:GoRight()
                                        end
                                    elseif SubType == "UIMenuSliderProgressItem" then
                                        if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                            self.DrawOffset) then self:GoLeft() end
                                        if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                            Item.RightArrow.Height, self.DrawOffset) then
                                            self:GoRight()
                                        end
                                    elseif SubType == "UIMenuSliderHeritageItem" then
                                        if IsMouseInBounds(Item.LeftArrow.X, Item.LeftArrow.Y, Item.LeftArrow.Width, Item.LeftArrow.Height,
                                                            self.DrawOffset) then self:GoLeft() end
                                        if IsMouseInBounds(Item.RightArrow.X, Item.RightArrow.Y, Item.RightArrow.Width,
                                                            Item.RightArrow.Height, self.DrawOffset) then
                                            self:GoRight()
                                        end
                                    elseif SubType == "UIMenuProgressItem" then
                                        if IsMouseInBounds(Item.Bar.X, Item.Bar.Y - 12, Item.Data.Max, Item.Bar.Height + 24, self.DrawOffset) then
                                            local CursorX, CursorY = ConvertToPixel(GetControlNormal(0, 239), 0)
                                            Item:CalculateProgress(CursorX)
                                            self.OnProgressChange(self, Item, Item.Data.Index)
                                            Item.OnProgressChanged(self, Item, Item.Data.Index)
                                            if not Item.Pressed then
                                                Item.Pressed = true
                                                Citizen.CreateThread(function()
                                                    Item.Audio.Id = GetSoundId()
                                                    PlaySoundFrontend(Item.Audio.Id, Item.Audio.Slider, Item.Audio.Library, 1)
                                                    Citizen.Wait(100)
                                                    StopSound(Item.Audio.Id)
                                                    ReleaseSoundId(Item.Audio.Id)
                                                    Item.Pressed = false
                                                end)
                                            end
                                        else
                                            self:SelectItem()
                                        end
                                    end
                                elseif not Item:Selected() then
                                    self:CurrentSelection(i - 1)
                                    PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
                                    self.OnIndexChange(self, self:CurrentSelection())
                                    self.ReDraw = true
                                    self:UpdateScaleform()
                                elseif not Item:Enabled() and Item:Selected() then
                                    PlaySoundFrontend(-1, self.Settings.Audio.Error, self.Settings.Audio.Library, true)
                                end
                                Citizen.Wait(125)
                            end
                            self.Controls.MousePressed = false
                        end)
                    end
                end
            else
                Item:Hovered(false)
            end
            ItemOffset = ItemOffset + self:CalculateItemHeightOffset(Item)
        end

        local ExtraX, ExtraY = self.Position.X, 144 + self:CalculateItemHeight() + self.Position.Y + WindowHeight

        if #self.Items <= self.Pagination.Total + 1 then return end

        if IsMouseInBounds(ExtraX, ExtraY, 431 + self.WidthOffset, 18, self.DrawOffset) then
            self.Extra.Up:Colour(30, 30, 30, 255)
            if not self.Controls.MousePressed then
                if IsDisabledControlJustPressed(0, 24) then
                    Citizen.CreateThread(function()
                        local _ExtraX, _ExtraY = ExtraX, ExtraY
                        self.Controls.MousePressed = true
                        if #self.Items > self.Pagination.Total + 1 then
                            self:GoUpOverflow()
                        else
                            self:GoUp()
                        end
                        Citizen.Wait(175)
                        while IsDisabledControlPressed(0, 24) and
                            IsMouseInBounds(_ExtraX, _ExtraY, 431 + self.WidthOffset, 18, self.DrawOffset) do
                            if #self.Items > self.Pagination.Total + 1 then
                                self:GoUpOverflow()
                            else
                                self:GoUp()
                            end
                            Citizen.Wait(125)
                        end
                        self.Controls.MousePressed = false
                    end)
                end
            end
        else
            self.Extra.Up:Colour(0, 0, 0, 200)
        end

        if IsMouseInBounds(ExtraX, ExtraY + 18, 431 + self.WidthOffset, 18, self.DrawOffset) then
            self.Extra.Down:Colour(30, 30, 30, 255)
            if not self.Controls.MousePressed then
                if IsDisabledControlJustPressed(0, 24) then
                    Citizen.CreateThread(function()
                        local _ExtraX, _ExtraY = ExtraX, ExtraY
                        self.Controls.MousePressed = true
                        if #self.Items > self.Pagination.Total + 1 then
                            self:GoDownOverflow()
                        else
                            self:GoDown()
                        end
                        Citizen.Wait(175)
                        while IsDisabledControlPressed(0, 24) and
                            IsMouseInBounds(_ExtraX, _ExtraY + 18, 431 + self.WidthOffset, 18, self.DrawOffset) do
                            if #self.Items > self.Pagination.Total + 1 then
                                self:GoDownOverflow()
                            else
                                self:GoDown()
                            end
                            Citizen.Wait(125)
                        end
                        self.Controls.MousePressed = false
                    end)
                end
            end
        else
            self.Extra.Down:Colour(0, 0, 0, 200)
        end
    end

    function UIMenu:AddInstructionButton(button)
        if type(button) == "table" and #button == 2 then table.insert(self.InstructionalButtons, button) end
    end

    function UIMenu:RemoveInstructionButton(button)
        if type(button) == "table" then
            for i = 1, #self.InstructionalButtons do
                if button == self.InstructionalButtons[i] then
                    table.remove(self.InstructionalButtons, i)
                    break
                end
            end
        else
            if tonumber(button) then
                if self.InstructionalButtons[tonumber(button)] then table.remove(self.InstructionalButtons, tonumber(button)) end
            end
        end
    end

    function UIMenu:AddEnabledControl(Inputgroup, Control, Controller)
        if tonumber(Inputgroup) and tonumber(Control) then
            table.insert(self.Settings.EnabledControls[(Controller and "Controller" or "Keyboard")], {Inputgroup, Control})
        end
    end

    function UIMenu:RemoveEnabledControl(Inputgroup, Control, Controller)
        local Type = (Controller and "Controller" or "Keyboard")
        for Index = 1, #self.Settings.EnabledControls[Type] do
            if Inputgroup == self.Settings.EnabledControls[Type][Index][1] and Control == self.Settings.EnabledControls[Type][Index][2] then
                table.remove(self.Settings.EnabledControls[Type], Index)
                break
            end
        end
    end

    function UIMenu:UpdateScaleform()
        if not self._Visible or not self.Settings.InstructionalButtons then return end

        PushScaleformMovieFunction(self.InstructionalScaleform, "CLEAR_ALL")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(self.InstructionalScaleform, "TOGGLE_MOUSE_BUTTONS")
        PushScaleformMovieFunctionParameterInt(0)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(self.InstructionalScaleform, "CREATE_CONTAINER")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(self.InstructionalScaleform, "SET_DATA_SLOT")
        PushScaleformMovieFunctionParameterInt(0)
        N_0xe83a3e3557a56640(N_0x0499d7b09fc9b407(2, 176, 0)) -- PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(2, 176, 0))
        PushScaleformMovieFunctionParameterString(GetLabelText("HUD_INPUT2"))
        PopScaleformMovieFunctionVoid()

        if self.Controls.Back.Enabled then
            PushScaleformMovieFunction(self.InstructionalScaleform, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(1)
            N_0xe83a3e3557a56640(N_0x0499d7b09fc9b407(2, 177, 0)) -- PushScaleformMovieMethodParameterButtonName(N_0x0499d7b09fc9b407(2, 177, 0))
            PushScaleformMovieFunctionParameterString(GetLabelText("HUD_INPUT3"))
            PopScaleformMovieFunctionVoid()
        end

        local count = 2

        for i = 1, #self.InstructionalButtons do
            if self.InstructionalButtons[i] then
                if #self.InstructionalButtons[i] == 2 then
                    PushScaleformMovieFunction(self.InstructionalScaleform, "SET_DATA_SLOT")
                    PushScaleformMovieFunctionParameterInt(count)
                    N_0xe83a3e3557a56640(self.InstructionalButtons[i][1]) -- PushScaleformMovieMethodParameterButtonName(self.InstructionalButtons[i][1])
                    PushScaleformMovieFunctionParameterString(self.InstructionalButtons[i][2])
                    PopScaleformMovieFunctionVoid()
                    count = count + 1
                end
            end
        end

        PushScaleformMovieFunction(self.InstructionalScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
        PushScaleformMovieFunctionParameterInt(-1)
        PopScaleformMovieFunctionVoid()
    end
end

--==================================================================================================================================================--
--[[ NativeUI\UIMenu\MenuPool ]]
--==================================================================================================================================================--
MenuPool = setmetatable({}, MenuPool)
MenuPool.__index = MenuPool
do
    function MenuPool.New()
        local _MenuPool = {Menus = {}}
        return setmetatable(_MenuPool, MenuPool)
    end

    function MenuPool:AddSubMenu(Menu, Text, Description, BindMenu, KeepPosition, KeepBanner)
        if BindMenu ~= nil then BindMenu = ToBool(BindMenu); else BindMenu = true end;
        if KeepPosition ~= nil then KeepPosition = ToBool(KeepPosition); else KeepPosition = true end;
        if KeepBanner ~= nil then KeepBanner = ToBool(KeepBanner); else KeepBanner = true end;
        if Menu() == "UIMenu" then
            local Item = UIMenuItem.New(tostring(Text), Description or "")
            local SubMenu
            if KeepPosition then
                SubMenu = UIMenu.New(Menu.Title:Text(), Text, Menu.Position.X, Menu.Position.Y)
            else
                SubMenu = UIMenu.New(Menu.Title:Text(), Text)
            end
            if KeepBanner then
                if Menu.Logo ~= nil then
                    SubMenu.Logo = Menu.Logo
                else
                    SubMenu.Logo = nil
                    SubMenu.Banner = Menu.Banner
                end
            end
            self:Add(SubMenu)
            if BindMenu then
                Menu:AddItem(Item)
                Menu:BindMenuToItem(SubMenu, Item);
            end
            return {SubMenu = SubMenu, Item = Item}
        end
    end

    function MenuPool:Add(Menu) if Menu() == "UIMenu" then table.insert(self.Menus, Menu) end end

    function MenuPool:MouseEdgeEnabled(bool)
        if bool ~= nil then for _, Menu in pairs(self.Menus) do Menu.Settings.MouseEdgeEnabled = ToBool(bool) end end
    end

    function MenuPool:ControlDisablingEnabled(bool)
        if bool ~= nil then for _, Menu in pairs(self.Menus) do Menu.Settings.ControlDisablingEnabled = ToBool(bool) end end
    end

    function MenuPool:ResetCursorOnOpen(bool)
        if bool ~= nil then for _, Menu in pairs(self.Menus) do Menu.Settings.ResetCursorOnOpen = ToBool(bool) end end
    end

    function MenuPool:MultilineFormats(bool)
        if bool ~= nil then for _, Menu in pairs(self.Menus) do Menu.Settings.MultilineFormats = ToBool(bool) end end
    end

    function MenuPool:Audio(Attribute, Setting)
        if Attribute ~= nil and Setting ~= nil then
            for _, Menu in pairs(self.Menus) do if Menu.Settings.Audio[Attribute] then Menu.Settings.Audio[Attribute] = Setting end end
        end
    end

    function MenuPool:WidthOffset(offset)
        if tonumber(offset) then for _, Menu in pairs(self.Menus) do Menu:SetMenuWidthOffset(tonumber(offset)) end end
    end

    function MenuPool:CounterPreText(str) if str ~= nil then for _, Menu in pairs(self.Menus) do Menu.PageCounter.PreText = tostring(str) end end end

    function MenuPool:InstructionalButtonsEnabled(bool)
        if bool ~= nil then for _, Menu in pairs(self.Menus) do Menu.Settings.InstructionalButtons = ToBool(bool) end end
    end

    function MenuPool:MouseControlsEnabled(bool)
        if bool ~= nil then for _, Menu in pairs(self.Menus) do Menu.Settings.MouseControlsEnabled = ToBool(bool) end end
    end

    function MenuPool:RefreshIndex() for _, Menu in pairs(self.Menus) do Menu:RefreshIndex() end end

    function MenuPool:ProcessMenus()
        self:ProcessControl()
        self:ProcessMouse()
        self:Draw()
    end

    function MenuPool:ProcessControl() for _, Menu in pairs(self.Menus) do if Menu:Visible() then Menu:ProcessControl() end end end

    function MenuPool:ProcessMouse() for _, Menu in pairs(self.Menus) do if Menu:Visible() then Menu:ProcessMouse() end end end

    function MenuPool:Draw() for _, Menu in pairs(self.Menus) do if Menu:Visible() then Menu:Draw() end end end

    function MenuPool:IsAnyMenuOpen()
        local open = false
        for _, Menu in pairs(self.Menus) do
            if Menu:Visible() then
                open = true
                break
            end
        end
        return open
    end

    function MenuPool:CloseAllMenus()
        for _, Menu in pairs(self.Menus) do
            if Menu:Visible() then
                Menu:Visible(false)
                Menu.OnMenuClosed(Menu)
            end
        end
    end

    function MenuPool:SetBannerSprite(Sprite) if Sprite() == "Sprite" then for _, Menu in pairs(self.Menus) do Menu:SetBannerSprite(Sprite) end end end

    function MenuPool:SetBannerRectangle(Rectangle)
        if Rectangle() == "Rectangle" then for _, Menu in pairs(self.Menus) do Menu:SetBannerRectangle(Rectangle) end end
    end

    function MenuPool:TotalItemsPerPage(Value)
        if tonumber(Value) then for _, Menu in pairs(self.Menus) do Menu.Pagination.Total = Value - 1 end end
    end
end

--==================================================================================================================================================--
--[[ NativeUI ]]
--==================================================================================================================================================--
print("NativeUILua-Reloaded wiki : https://github.com/iTexZoz/NativeUILua-Reloaded/wiki")

NativeUI = {}
do
    function NativeUI.CreatePool() return MenuPool.New() end

    function NativeUI.CreateMenu(Title, Subtitle, X, Y, TxtDictionary, TxtName, Heading, R, G, B, A)
        return UIMenu.New(Title, Subtitle, X, Y, TxtDictionary, TxtName, Heading, R, G, B, A)
    end

    function NativeUI.CreateItem(Text, Description) return UIMenuItem.New(Text, Description) end

    function NativeUI.CreateColouredItem(Text, Description, MainColour, HighlightColour)
        return UIMenuColouredItem.New(Text, Description, MainColour, HighlightColour)
    end

    function NativeUI.CreateCheckboxItem(Text, Check, Description, CheckboxStyle)
        return UIMenuCheckboxItem.New(Text, Check, Description, CheckboxStyle)
    end

    function NativeUI.CreateListItem(Text, Items, Index, Description) return UIMenuListItem.New(Text, Items, Index, Description) end

    function NativeUI.CreateSliderItem(Text, Items, Index, Description, Divider, SliderColors, BackgroundSliderColors)
        return UIMenuSliderItem.New(Text, Items, Index, Description, Divider, SliderColors, BackgroundSliderColors)
    end

    function NativeUI.CreateSliderHeritageItem(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
        return UIMenuSliderHeritageItem.New(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
    end

    function NativeUI.CreateSliderProgressItem(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
        return UIMenuSliderProgressItem.New(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
    end

    function NativeUI.CreateProgressItem(Text, Items, Index, Description, Counter)
        return UIMenuProgressItem.New(Text, Items, Index, Description, Counter)
    end

    function NativeUI.CreateHeritageWindow(Mum, Dad) return UIMenuHeritageWindow.New(Mum, Dad) end

    function NativeUI.CreateGridPanel(TopText, LeftText, RightText, BottomText, CirclePositionX, CirclePositionY)
        return UIMenuGridPanel.New(TopText, LeftText, RightText, BottomText, CirclePositionX, CirclePositionY)
    end

    function NativeUI.CreateHorizontalGridPanel(LeftText, RightText, CirclePositionX)
        return UIMenuHorizontalOneLineGridPanel.New(LeftText, RightText, CirclePositionX)
    end

    function NativeUI.CreateVerticalGridPanel(TopText, BottomText, CirclePositionY)
        return UIMenuVerticalOneLineGridPanel.New(TopText, BottomText, CirclePositionY)
    end

    function NativeUI.CreateColourPanel(Title, Colours) return UIMenuColourPanel.New(Title, Colours) end

    function NativeUI.CreatePercentagePanel(MinText, MaxText) return UIMenuPercentagePanel.New(MinText, MaxText) end

    function NativeUI.CreateStatisticsPanel() return UIMenuStatisticsPanel.New() end

    function NativeUI.CreateSprite(TxtDictionary, TxtName, X, Y, Width, Height, Heading, R, G, B, A)
        return Sprite.New(TxtDictionary, TxtName, X, Y, Width, Height, Heading, R, G, B, A)
    end

    function NativeUI.CreateRectangle(X, Y, Width, Height, R, G, B, A) return UIResRectangle.New(X, Y, Width, Height, R, G, B, A) end

    function NativeUI.CreateText(Text, X, Y, Scale, R, G, B, A, Font, Alignment, DropShadow, Outline, WordWrap)
        return UIResText.New(Text, X, Y, Scale, R, G, B, A, Font, Alignment, DropShadow, Outline, WordWrap)
    end

    function NativeUI.CreateTimerBarProgress(Text, TxtDictionary, TxtName, X, Y, Heading, R, G, B, A)
        return UITimerBarProgressItem.New(Text, TxtDictionary, TxtName, X, Y, Heading, R, G, B, A)
    end

    function NativeUI.CreateTimerBar(Text, TxtDictionary, TxtName, X, Y, Heading, R, G, B, A)
        return UITimerBarItem.New(Text, TxtDictionary, TxtName, X, Y, Heading, R, G, B, A)
    end

    function NativeUI.CreateTimerBarProgressWithIcon(TxtDictionary, TxtName, IconDictionary, IconName, X, Y, Heading, R, G, B, A)
        return UITimerBarProgressWithIconItem.New(TxtDictionary, TxtName, IconDictionary, IconName, X, Y, Heading, R, G, B, A)
    end

    function NativeUI.TimerBarPool() return UITimerBarPool.New() end

    function NativeUI.ProgressBarPool() return UIProgressBarPool.New() end

    function NativeUI.CreateProgressBarItem(Text, X, Y, Heading, R, G, B, A) return UIProgressBarItem.New(Text, X, Y, Heading, R, G, B, A) end
end

--==================================================================================================================================================--
--[[ badwolf Menu Variables ]]
--==================================================================================================================================================--
badwolfMenu = {}
badwolfMenuPool = {}

local ShowMenu = true

local X, Y = ReverseFormatXWYH(0.70, 0.25)

badwolfMenu = NativeUI.CreateMenu("Badwolf", "¦ ~b~Hacking System!", X, Y)

badwolfMenuPool = NativeUI.CreatePool()
badwolfMenuPool:Add(badwolfMenu)

local _currentScenario = ""

local Enable_InfiniteStamina = false
local Enable_SuperJump = false
local Enable_VehicleGodMode = false
local Enable_NoFall = false
local Enable_BossMenu = false

local ShowCrosshair = false
local ShowRadar = true
local ShowExtendedRadar = false
local ShowPlayerBlips = true

local HasWaypoint = false
local HasCarTag = false
local carTagId = nil

local DriveToWpTaskActive = false;
local DriveWanderTaskActive = false;

local ShowEsp = false
local ShowHeadSprites = true
local ShowWantedLevel = false
local ShowEspInfo = true
local ShowEspOutline = true
local ShowEspLines = false

--==================================================================================================================================================--
--[[ PedScenarios ]]
--==================================================================================================================================================--
PedScenarios = {}

PedScenarios.Scenarios = {
    "AA Drink Coffee",
    "AA Smoke Cig",
    "Binoculars",
    "Bum Freeway",
    "Bum Slumped",
    "Bum Standing",
    "Bum Wash",
    "Car Park Attendant",
    "Cheering",
    "Clipboard",
    "Constant Drilling",
    "Cop Idle",
    "Drinking",
    "Drug Dealer",
    "Drug Dealer Hard",
    "Mobile Film Shocking",
    "Garderner Leaf Blower",
    "Garderner Plant",
    "Golf Player",
    "Guard Patrol",
    "Guard Stand",
    "Hamering",
    "Hang Out Street",
    "Hiker Standing",
    "Human Statue",
    "Janitor",
    "Jog Standing",
    "Leaning",
    "Maid Clean",
    "Muscle Flex",
    "Muscle Free Weights",
    "Musician",
    "Paparazzi",
    "Partying",
    "Picnic",
    "Prostitue High Class",
    "Prostitue Low Class",
    "Pushups",
    "Seat Ledge",
    "Seat Steps",
    "Seat Wall",
    "Security Shine Torch",
    "Situps",
    "Smoking",
    "Smoking Pot",
    "Stand Fire",
    "Stand Fishing",
    "Stand Impatient",
    "Stand Impatient Upright",
    "Stand Mobile",
    "Stand Mobile Upright",
    "Stripclub Watch Stand",
    "Stupor",
    "Sunbathe",
    "Sunbathe Back",
    "Tennis Player",
    "Tourist Map",
    "Tourist Mobile",
    "Vehicle Mechanic",
    "Welding",
    "Window Shop Browse",
    "Yoga",
    "ATM",
    "BBQ",
    "Bum Bin",
    "Bum Shopping Cart",
    "Muscle Chin Ups",
    "Muscle Chin Ups Army",
    "Muscle Chin Ups Prison",
    "Parking Meter",
    "Seat Armchair",
    "Seat Bar",
    "Seat Bench",
    "Seat Bus Stop Wait",
    "Seat Chair",
    "Seat Chair Upright",
    "Seat MP Player",
    "Seat Computer",
    "Seat Deckchair",
    "Seat Deckchair Drink",
    "Seat Muscle Bench Press",
    "Seat Muscle Bench Press Prison",
    "Seat Stripclub Watch",
    "Seat Sunlounger",
    "Stand Impatient",
    "Cross Road Wait",
    "Medic Kneel",
    "Medic Tend To Dead",
    "Medic Time Of Death",
    "Police Crowd Control",
    "Police Investigate"
}

PedScenarios.ScenarioNames = {
    ["AA Drink Coffee"] = "WORLD_HUMAN_AA_COFFEE",
    ["AA Smoke Cig"] = "WORLD_HUMAN_AA_SMOKE",
    ["Binoculars"] = "WORLD_HUMAN_BINOCULARS",
    ["Bum Freeway"] = "WORLD_HUMAN_BUM_FREEWAY",
    ["Bum Slumped"] = "WORLD_HUMAN_BUM_SLUMPED",
    ["Bum Standing"] = "WORLD_HUMAN_BUM_STANDING",
    ["Bum Wash"] = "WORLD_HUMAN_BUM_WASH",
    ["Car Park Attendant"] = "WORLD_HUMAN_CAR_PARK_ATTENDANT",
    ["Cheering"] = "WORLD_HUMAN_CHEERING",
    ["Clipboard"] = "WORLD_HUMAN_CLIPBOARD",
    ["Constant Drilling"] = "WORLD_HUMAN_CONST_DRILL",
    ["Cop Idle"] = "WORLD_HUMAN_COP_IDLES",
    ["Drinking"] = "WORLD_HUMAN_DRINKING",
    ["Drug Dealer"] = "WORLD_HUMAN_DRUG_DEALER",
    ["Drug Dealer Hard"] = "WORLD_HUMAN_DRUG_DEALER_HARD",
    ["Mobile Film Shocking"] = "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
    ["Garderner Leaf Blower"] = "WORLD_HUMAN_GARDENER_LEAF_BLOWER",
    ["Garderner Plant"] = "WORLD_HUMAN_GARDENER_PLANT",
    ["Golf Player"] = "WORLD_HUMAN_GOLF_PLAYER",
    ["Guard Patrol"] = "WORLD_HUMAN_GUARD_PATROL",
    ["Guard Stand"] = "WORLD_HUMAN_GUARD_STAND",
    ["Hamering"] = "WORLD_HUMAN_HAMMERING",
    ["Hang Out Street"] = "WORLD_HUMAN_HANG_OUT_STREET",
    ["Hiker Standing"] = "WORLD_HUMAN_HIKER_STANDING",
    ["Human Statue"] = "WORLD_HUMAN_HUMAN_STATUE",
    ["Janitor"] = "WORLD_HUMAN_JANITOR",
    ["Jog Standing"] = "WORLD_HUMAN_JOG_STANDING",
    ["Leaning"] = "WORLD_HUMAN_LEANING",
    ["Maid Clean"] = "WORLD_HUMAN_MAID_CLEAN",
    ["Muscle Flex"] = "WORLD_HUMAN_MUSCLE_FLEX",
    ["Muscle Free Weights"] = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
    ["Musician"] = "WORLD_HUMAN_MUSICIAN",
    ["Paparazzi"] = "WORLD_HUMAN_PAPARAZZI",
    ["Partying"] = "WORLD_HUMAN_PARTYING",
    ["Picnic"] = "WORLD_HUMAN_PICNIC",
    ["Prostitue High Class"] = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",
    ["Prostitue Low Class"] = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS",
    ["Pushups"] = "WORLD_HUMAN_PUSH_UPS",
    ["Seat Ledge"] = "WORLD_HUMAN_SEAT_LEDGE",
    ["Seat Steps"] = "WORLD_HUMAN_SEAT_STEPS",
    ["Seat Wall"] = "WORLD_HUMAN_SEAT_WALL",
    ["Security Shine Torch"] = "WORLD_HUMAN_SECURITY_SHINE_TORCH",
    ["Situps"] = "WORLD_HUMAN_SIT_UPS",
    ["Smoking"] = "WORLD_HUMAN_SMOKING",
    ["Smoking Pot"] = "WORLD_HUMAN_SMOKING_POT",
    ["Stand Fire"] = "WORLD_HUMAN_STAND_FIRE",
    ["Stand Fishing"] = "WORLD_HUMAN_STAND_FISHING",
    ["Stand Impatient"] = "WORLD_HUMAN_STAND_IMPATIENT",
    ["Stand Impatient Upright"] = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
    ["Stand Mobile"] = "WORLD_HUMAN_STAND_MOBILE",
    ["Stand Mobile Upright"] = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT",
    ["Stripclub Watch Stand"] = "WORLD_HUMAN_STRIP_WATCH_STAND",
    ["Stupor"] = "WORLD_HUMAN_STUPOR",
    ["Sunbathe"] = "WORLD_HUMAN_SUNBATHE",
    ["Sunbathe Back"] = "WORLD_HUMAN_SUNBATHE_BACK",
    ["Tennis Player"] = "WORLD_HUMAN_TENNIS_PLAYER",
    ["Tourist Map"] = "WORLD_HUMAN_TOURIST_MAP",
    ["Tourist Mobile"] = "WORLD_HUMAN_TOURIST_MOBILE",
    ["Vehicle Mechanic"] = "WORLD_HUMAN_VEHICLE_MECHANIC",
    ["Welding"] = "WORLD_HUMAN_WELDING",
    ["Window Shop Browse"] = "WORLD_HUMAN_WINDOW_SHOP_BROWSE",
    ["Yoga"] = "WORLD_HUMAN_YOGA",
    ["ATM"] = "PROP_HUMAN_ATM",
    ["BBQ"] = "PROP_HUMAN_BBQ",
    ["Bum Bin"] = "PROP_HUMAN_BUM_BIN",
    ["Bum Shopping Cart"] = "PROP_HUMAN_BUM_SHOPPING_CART",
    ["Muscle Chin Ups"] = "PROP_HUMAN_MUSCLE_CHIN_UPS",
    ["Muscle Chin Ups Army"] = "PROP_HUMAN_MUSCLE_CHIN_UPS_ARMY",
    ["Muscle Chin Ups Prison"] = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON",
    ["Parking Meter"] = "PROP_HUMAN_PARKING_METER",
    ["Seat Armchair"] = "PROP_HUMAN_SEAT_ARMCHAIR",
    ["Seat Bar"] = "PROP_HUMAN_SEAT_BAR",
    ["Seat Bench"] = "PROP_HUMAN_SEAT_BENCH",
    ["Seat Bus Stop Wait"] = "PROP_HUMAN_SEAT_BUS_STOP_WAIT",
    ["Seat Chair"] = "PROP_HUMAN_SEAT_CHAIR",
    ["Seat Chair Upright"] = "PROP_HUMAN_SEAT_CHAIR_UPRIGHT",
    ["Seat MP Player"] = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
    ["Seat Computer"] = "PROP_HUMAN_SEAT_COMPUTER",
    ["Seat Deckchair"] = "PROP_HUMAN_SEAT_DECKCHAIR",
    ["Seat Deckchair Drink"] = "PROP_HUMAN_SEAT_DECKCHAIR_DRINK",
    ["Seat Muscle Bench Press"] = "PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS",
    ["Seat Muscle Bench Press Prison"] = "PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS_PRISON",
    ["Seat Stripclub Watch"] = "PROP_HUMAN_SEAT_STRIP_WATCH",
    ["Seat Sunlounger"] = "PROP_HUMAN_SEAT_SUNLOUNGER",
    ["Stand Impatient"] = "PROP_HUMAN_STAND_IMPATIENT",
    ["Cross Road Wait"] = "CODE_HUMAN_CROSS_ROAD_WAIT",
    ["Medic Kneel"] = "CODE_HUMAN_MEDIC_KNEEL",
    ["Medic Tend To Dead"] = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
    ["Medic Time Of Death"] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH",
    ["Police Crowd Control"] = "CODE_HUMAN_POLICE_CROWD_CONTROL",
    ["Police Investigate"] = "CODE_HUMAN_POLICE_INVESTIGATE",
}

PedScenarios.PositionBasedScenarios = {
    "PROP_HUMAN_SEAT_ARMCHAIR",
    "PROP_HUMAN_SEAT_BAR",
    "PROP_HUMAN_SEAT_BENCH",
    "PROP_HUMAN_SEAT_BUS_STOP_WAIT",
    "PROP_HUMAN_SEAT_CHAIR",
    "PROP_HUMAN_SEAT_CHAIR_UPRIGHT",
    "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
    "PROP_HUMAN_SEAT_COMPUTER",
    "PROP_HUMAN_SEAT_DECKCHAIR",
    --"PROP_HUMAN_SEAT_DECKCHAIR_DRINK",
    --"PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS",
    --"PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS_PRISON",
    "PROP_HUMAN_SEAT_STRIP_WATCH",
    "PROP_HUMAN_SEAT_SUNLOUNGER",
    "WORLD_HUMAN_SEAT_LEDGE",
    "WORLD_HUMAN_SEAT_STEPS",
    "WORLD_HUMAN_SEAT_WALL"
}

--==================================================================================================================================================--
--[[ Jobs ]]
--==================================================================================================================================================--
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

Jobs.Type = {
    ["Unemployed"] = 'unemployed',
    ["Mechanic"] = 'mecano',
    ["Police"] = 'police',
    ["Ambulance"] = 'ambulance',
    ["Taxi"] = 'taxi',
    ["Real Estate Agent"] = 'realestateagent',
    ["Car Dealer"] = 'cardealer',
    ["Banker"] = 'banker',
    ["Gang"] = 'gang',
    ["Mafia"] = 'mafia'
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
    'esx_fueldelivery',
    'esx_carthief',
    'esx_dmvschool',
    'esx_godirtyjob',
    'esx_pizza',
    'esx_ranger',
    'esx_garbagejob',
    'esx_carthief',
    'esx_truckerjob',
    'esx_gopostaljob',
    'esx_banksecurity'
}

Jobs.Item = {
    "Butcher", "Tailor", "Miner", "Apple", "Blowtorch", "Body Kit", "LSD", "Med Kit", "Water", "Money"
}
Jobs.ItemDatabase = {
    ["Butcher"]         = oTable.new{ "Alive Chicken", "alive_chicken", "Slaughtered Chicken", "slaughtered_chicken", "Packaged Chicken", "packaged_chicken" },
    ["Tailor"]          = oTable.new{ "Wool", "wool", "Fabric", "fabric", "Clothes", "clothe" },
    ["Miner"]           = oTable.new{ "Stone", "stone", "Washed Stone", "washed_stone", "Diamond", "diamond" },
    ["Apple"]           = "apple",
    ["Blowtorch"]       = "blowpipe",
    ["Body Kit"]        = "carokit",
    ["LSD"]             = "lsd",
    ["Med Kit"]         = "medikit",
    ["Water"]           = "water",
    ["Money"]           = "cash"
}
Jobs.ItemRequires = {
    ["Fabric"]          = "Wool",
    ["Clothes"]         = "Fabric",
    ["Washed Stone"]    = "Stone",
    ["Diamond"]         = "Washed Stone"
}

--==================================================================================================================================================--
--[[ Car Types ]]
--==================================================================================================================================================--
local CarTypes = {
    "Griefer's Choice", "Boats", "Commercial", "Compacts", "Coupes", "Cycles", "Emergency", "Helictopers", "Industrial", "Military",
    "Motorcycles", "Muscle", "Off-Road", "Planes", "SUVs", "Sedans", "Service", "Sports", "Sports Classic", "Super", "Trailer", "Trains",
    "Utility", "Vans"
}
do
    GriefersChoice = {"Tezeract", "Dune4", "Dune5", "Nero2", "Bmx", "Sanchez", "Rhino", "Barrage", "Phantom2"}
    --==================================================================================================================================================--
    Boats = {
        "Dinghy", "Dinghy2", "Dinghy3", "Dingh4", "Jetmax", "Marquis", "Seashark", "Seashark2", "Seashark3", "Speeder", "Speeder2", "Squalo",
        "Submersible", "Submersible2", "Suntrap", "Toro", "Toro2", "Tropic", "Tropic2", "Tug"
    }
    --==================================================================================================================================================--
    Commercial = {
        "Benson", "Biff", "Cerberus", "Cerberus2", "Cerberus3", "Hauler", "Hauler2", "Mule", "Mule2", "Mule3", "Mule4", "Packer", "Phantom",
        "Phantom2", "Phantom3", "Pounder", "Pounder2", "Stockade", "Stockade3", "Terbyte"
    }
    --==================================================================================================================================================--
    Compacts = {
        "Blista", "Blista2", "Blista3", "Brioso", "Dilettante", "Dilettante2", "Issi2", "Issi3", "issi4", "Iss5", "issi6", "Panto", "Prarire",
        "Rhapsody"
    }
    --==================================================================================================================================================--
    Coupes = {
        "CogCabrio", "Exemplar", "F620", "Felon", "Felon2", "Jackal", "Oracle", "Oracle2", "Sentinel", "Sentinel2", "Windsor", "Windsor2",
        "Zion", "Zion2"
    }
    --==================================================================================================================================================--
    Cycles = {"Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3"}
    --==================================================================================================================================================--
    Emergency = {
        "Ambulance", "FBI", "FBI2", "FireTruk", "PBus", "Police", "Police2", "Police3", "Police4", "PoliceOld1", "PoliceOld2", "PoliceT",
        "Policeb", "Polmav", "Pranger", "Predator", "Riot", "Riot2", "Sheriff", "Sheriff2"
    }
    --==================================================================================================================================================--
    Helicopters = {
        "Akula", "Annihilator", "Buzzard", "Buzzard2", "Cargobob", "Cargobob2", "Cargobob3", "Cargobob4", "Frogger", "Frogger2", "Havok",
        "Hunter", "Maverick", "Savage", "Seasparrow", "Skylift", "Supervolito", "Supervolito2", "Swift", "Swift2", "Valkyrie", "Valkyrie2",
        "Volatus"
    }
    --==================================================================================================================================================--
    Industrial = {"Bulldozer", "Cutter", "Dump", "Flatbed", "Guardian", "Handler", "Mixer", "Mixer2", "Rubble", "Tiptruck", "Tiptruck2"}
    --==================================================================================================================================================--
    Military = {
        "APC", "Barracks", "Barracks2", "Barracks3", "Barrage", "Chernobog", "Crusader", "Halftrack", "Khanjali", "Rhino", "Scarab", "Scarab2",
        "Scarab3", "kThruster", "Trailersmall2"
    }
    --==================================================================================================================================================--
    Motorcycles = {
        "Akuma", "Avarus", "Bagger", "Bati2", "Bati", "BF400", "Blazer4", "CarbonRS", "Chimera", "Cliffhanger", "Daemon", "Daemon2", "Defiler",
        "Deathbike", "Deathbike2", "Deathbike3", "Diablous", "Diablous2", "Double", "Enduro", "esskey", "Faggio2", "Faggio3", "Faggio", "Fcr2",
        "fcr", "gargoyle", "hakuchou2", "hakuchou", "hexer", "innovation", "Lectro", "Manchez", "Nemesis", "Nightblade", "Oppressor",
        "Oppressor2", "PCJ", "Ratbike", "Ruffian", "Sanchez2", "Sanchez", "Sanctus", "Shotaro", "Sovereign", "Thrust", "Vader", "Vindicator",
        "Vortex", "Wolfsbane", "zombiea", "zombieb"
    }
    --==================================================================================================================================================--
    Muscle = {
        "Blade", "Buccaneer", "Buccaneer2", "Chino", "Chino2", "clique", "Deviant", "Dominator", "Dominator2", "Dominator3", "Dominator4",
        "Dominator5", "Dominator6", "Dukes", "Dukes2", "Ellie", "Faction", "faction2", "faction3", "Gauntlet", "Gauntlet2", "Hermes",
        "Hotknife", "Hustler", "Impaler", "Impaler2", "Impaler3", "Impaler4", "Imperator", "Imperator2", "Imperator3", "Lurcher", "Moonbeam",
        "Moonbeam2", "Nightshade", "Phoenix", "Picador", "RatLoader", "RatLoader2", "Ruiner", "Ruiner2", "Ruiner3", "SabreGT", "SabreGT2",
        "Sadler2", "Slamvan", "Slamvan2", "Slamvan3", "Slamvan4", "Slamvan5", "Slamvan6", "Stalion", "Stalion2", "Tampa", "Tampa3", "Tulip",
        "Vamos,", "Vigero", "Virgo", "Virgo2", "Virgo3", "Voodoo", "Voodoo2", "Yosemite"
    }
    --==================================================================================================================================================--
    OffRoad = {
        "BFinjection", "Bifta", "Blazer", "Blazer2", "Blazer3", "Blazer5", "Bohdi", "Brawler", "Bruiser", "Bruiser2", "Bruiser3", "Caracara",
        "DLoader", "Dune", "Dune2", "Dune3", "Dune4", "Dune5", "Insurgent", "Insurgent2", "Insurgent3", "Kalahari", "Kamacho", "LGuard",
        "Marshall", "Mesa", "Mesa2", "Mesa3", "Monster", "Monster4", "Monster5", "Nightshark", "RancherXL", "RancherXL2", "Rebel", "Rebel2",
        "RCBandito", "Riata", "Sandking", "Sandking2", "Technical", "Technical2", "Technical3", "TrophyTruck", "TrophyTruck2", "Freecrawler",
        "Menacer"
    }
    --==================================================================================================================================================--
    Planes = {
        "AlphaZ1", "Avenger", "Avenger2", "Besra", "Blimp", "blimp2", "Blimp3", "Bombushka", "Cargoplane", "Cuban800", "Dodo", "Duster",
        "Howard", "Hydra", "Jet", "Lazer", "Luxor", "Luxor2", "Mammatus", "Microlight", "Miljet", "Mogul", "Molotok", "Nimbus", "Nokota",
        "Pyro", "Rogue", "Seabreeze", "Shamal", "Starling", "Stunt", "Titan", "Tula", "Velum", "Velum2", "Vestra", "Volatol", "Striekforce"
    }
    --==================================================================================================================================================--
    SUVs = {
        "BJXL", "Baller", "Baller2", "Baller3", "Baller4", "Baller5", "Baller6", "Cavalcade", "Cavalcade2", "Dubsta", "Dubsta2", "Dubsta3",
        "FQ2", "Granger", "Gresley", "Habanero", "Huntley", "Landstalker", "patriot", "Patriot2", "Radi", "Rocoto", "Seminole", "Serrano",
        "Toros", "XLS", "XLS2"
    }
    --==================================================================================================================================================--
    Sedans = {
        "Asea", "Asea2", "Asterope", "Cog55", "Cogg552", "Cognoscenti", "Cognoscenti2", "emperor", "emperor2", "emperor3", "Fugitive",
        "Glendale", "ingot", "intruder", "limo2", "premier", "primo", "primo2", "regina", "romero", "stafford", "Stanier", "stratum", "stretch",
        "surge", "tailgater", "warrener", "Washington"
    }
    --==================================================================================================================================================--
    Service = {"Airbus", "Brickade", "Bus", "Coach", "Rallytruck", "Rentalbus", "Taxi", "Tourbus", "Trash", "Trash2", "WastIndr", "PBus2"}
    --==================================================================================================================================================--
    Sports = {
        "Alpha", "Banshee", "Banshee2", "BestiaGTS", "Buffalo", "Buffalo2", "Buffalo3", "Carbonizzare", "Comet2", "Comet3", "Comet4", "Comet5",
        "Coquette", "Deveste", "Elegy", "Elegy2", "Feltzer2", "Feltzer3", "FlashGT", "Furoregt", "Fusilade", "Futo", "GB200", "Hotring",
        "Infernus2", "Italigto", "Jester", "Jester2", "Khamelion", "Kurama", "Kurama2", "Lynx", "MAssacro", "MAssacro2", "neon", "Ninef",
        "ninfe2", "omnis", "Pariah", "Penumbra", "Raiden", "RapidGT", "RapidGT2", "Raptor", "Revolter", "Ruston", "Schafter2", "Schafter3",
        "Schafter4", "Schafter5", "Schafter6", "Schlagen", "Schwarzer", "Sentinel3", "Seven70", "Specter", "Specter2", "Streiter", "Sultan",
        "Surano", "Tampa2", "Tropos", "Verlierer2", "ZR380", "ZR3802", "ZR3803"
    }
    --==================================================================================================================================================--
    SportsClassic = {
        "Ardent", "BType", "BType2", "BType3", "Casco", "Cheetah2", "Cheburek", "Coquette2", "Coquette3", "Deluxo", "Fagaloa", "Gt500", "JB700",
        "JEster3", "MAmba", "Manana", "Michelli", "Monroe", "Peyote", "Pigalle", "RapidGT3", "Retinue", "Savastra", "Stinger", "Stingergt",
        "Stromberg", "Swinger", "Torero", "Tornado", "Tornado2", "Tornado3", "Tornado4", "Tornado5", "Tornado6", "Viseris", "Z190", "ZType"
    }
    --==================================================================================================================================================--
    Super = {
        "adder", "Autarch", "Bullet", "Cheetah", "Cyclone", "EntityXF", "Entity2", "FMJ", "GP1", "Infernus", "LE7B", "Nero", "Nero2", "Osiris",
        "Penetrator", "PFister811", "Prototipo", "Reaper", "SC1", "Scramjet", "Sheava", "SultanRS", "Superd", "T20", "Taipan", "Tempesta",
        "Tezeract", "Turismo2", "Turismor", "Tyrant", "Tyrus", "Vacca", "Vagner", "Vigilante", "Visione", "Voltic", "Voltic2", "Zentorno",
        "Italigtb", "Italigtb2", "XA21"
    }
    --==================================================================================================================================================--
    Trailer = {
        "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer",
        "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2",
        "Trailers3"
    }
    --==================================================================================================================================================--
    Trains = {"Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"}
    --==================================================================================================================================================--
    Utility = {
        "Airtug", "Caddy", "Caddy2", "Caddy3", "Docktug", "Forklift", "Mower", "Ripley", "Sadler", "Scrap", "TowTruck", "Towtruck2", "Tractor",
        "Tractor2", "Tractor3", "TrailerLArge2", "Utilitruck", "Utilitruck3", "'Utilitruck2"
    }
    --==================================================================================================================================================--
    Vans = {
        "Bison", "Bison2", "Bison3", "BobcatXL", "Boxville", "Boxville2", "Boxville3", "Boxville4", "Boxville5", "Burrito", "Burrito2",
        "Burrito3", "Burrito4", "Burrito5", "Camper", "GBurrito", "GBurrito2", "Journey", "minivan", "Minivan2", "Paradise", "pony", "Pony2",
        "Rumpo", "Rumpo2", "Rumpo3", "Speedo", "Speedo2", "Speedo4", "Surfer", "Surfer2", "Taco", "Youga", "youga2"
    }
    --==================================================================================================================================================--
end
local CarsArray = {
    GriefersChoice, Boats, Commercial, Compacts, Coupes, Cycles, Emergency, Helicopters, Industrial, Military, Motorcycles, Muscle, OffRoad,
    Planes, SUVs, Sedans, Service, Sports, SportsClassic, Super, Trailer, Trains, Utility, Vans
}

--==================================================================================================================================================--
--[[ Weapons ]]
--==================================================================================================================================================--
WeaponDescriptions = {
    ["weapon_advancedrifle"] = GetLabelText("WTD_RIFLE_ADV"),
    ["weapon_appistol"] = GetLabelText("WTD_PIST_AP"),
    ["weapon_assaultrifle"] = GetLabelText("WTD_RIFLE_ASL"),
    ["weapon_assaultrifle_mk2"] = GetLabelText("WTD_RIFLE_ASL2"),
    ["weapon_assaultshotgun"] = GetLabelText("WTD_SG_ASL"),
    ["weapon_assaultsmg"] = GetLabelText("WTD_SMG_ASL"),
    ["weapon_autoshotgun"] = GetLabelText("WTD_AUTOSHGN"),
    ["weapon_bat"] = GetLabelText("WTD_BAT"),
    ["weapon_ball"] = GetLabelText("WTD_BALL"),
    ["weapon_battleaxe"] = GetLabelText("WTD_BATTLEAXE"),
    ["weapon_bottle"] = GetLabelText("WTD_BOTTLE"),
    ["weapon_bullpuprifle"] = GetLabelText("WTD_BULLRIFLE"),
    ["weapon_bullpuprifle_mk2"] = GetLabelText("WTD_BULLRIFLE2"),
    ["weapon_bullpupshotgun"] = GetLabelText("WTD_SG_BLP"),
    ["weapon_bzgas"] = GetLabelText("WTD_BZGAS"),
    ["weapon_carbinerifle"] = GetLabelText("WTD_RIFLE_CBN"),
    ["weapon_carbinerifle_mk2"] = GetLabelText("WTD_RIFLE_CBN2"),
    ["weapon_combatmg"] = GetLabelText("WTD_MG_CBT"),
    ["weapon_combatmg_mk2"] = GetLabelText("WTD_MG_CBT2"),
    ["weapon_combatpdw"] = GetLabelText("WTD_COMBATPDW"),
    ["weapon_combatpistol"] = GetLabelText("WTD_PIST_CBT"),
    ["weapon_compactlauncher"] = GetLabelText("WTD_CMPGL"),
    ["weapon_compactrifle"] = GetLabelText("WTD_CMPRIFLE"),
    ["weapon_crowbar"] = GetLabelText("WTD_CROWBAR"),
    ["weapon_dagger"] = GetLabelText("WTD_DAGGER"),
    ["weapon_dbshotgun"] = GetLabelText("WTD_DBSHGN"),
    ["weapon_doubleaction"] = GetLabelText("WTD_REV_DA"),
    ["weapon_fireextinguisher"] = GetLabelText("WTD_FIRE"),
    ["weapon_firework"] = GetLabelText("WTD_FWRKLNCHR"),
    ["weapon_flare"] = GetLabelText("WTD_FLARE"),
    ["weapon_flaregun"] = GetLabelText("WTD_FLAREGUN"),
    ["weapon_flashlight"] = GetLabelText("WTD_FLASHLIGHT"),
    ["weapon_golfclub"] = GetLabelText("WTD_GOLFCLUB"),
    ["weapon_grenade"] = GetLabelText("WTD_GNADE"),
    ["weapon_grenadelauncher"] = GetLabelText("WTD_GL"),
    ["weapon_gusenberg"] = GetLabelText("WTD_GUSENBERG"),
    ["weapon_hammer"] = GetLabelText("WTD_HAMMER"),
    ["weapon_hatchet"] = GetLabelText("WTD_HATCHET"),
    ["weapon_heavypistol"] = GetLabelText("WTD_HEAVYPSTL"),
    ["weapon_heavyshotgun"] = GetLabelText("WTD_HVYSHOT"),
    ["weapon_heavysniper"] = GetLabelText("WTD_SNIP_HVY"),
    ["weapon_heavysniper_mk2"] = GetLabelText("WTD_SNIP_HVY2"),
    ["weapon_hominglauncher"] = GetLabelText("WTD_HOMLNCH"),
    ["weapon_knife"] = GetLabelText("WTD_KNIFE"),
    ["weapon_knuckle"] = GetLabelText("WTD_KNUCKLE"),
    ["weapon_machete"] = GetLabelText("WTD_MACHETE"),
    ["weapon_machinepistol"] = GetLabelText("WTD_MCHPIST"),
    ["weapon_marksmanpistol"] = GetLabelText("WTD_MKPISTOL"),
    ["weapon_marksmanrifle"] = GetLabelText("WTD_MKRIFLE"),
    ["weapon_marksmanrifle_mk2"] = GetLabelText("WTD_MKRIFLE2"),
    ["weapon_mg"] = GetLabelText("WTD_MG"),
    ["weapon_microsmg"] = GetLabelText("WTD_SMG_MCR"),
    ["weapon_minigun"] = GetLabelText("WTD_MINIGUN"),
    ["weapon_minismg"] = GetLabelText("WTD_MINISMG"),
    ["weapon_molotov"] = GetLabelText("WTD_MOLOTOV"),
    ["weapon_musket"] = GetLabelText("WTD_MUSKET"),
    ["weapon_nightstick"] = GetLabelText("WTD_NGTSTK"),
    ["weapon_petrolcan"] = GetLabelText("WTD_PETROL"),
    ["weapon_pipebomb"] = GetLabelText("WTD_PIPEBOMB"),
    ["weapon_pistol"] = GetLabelText("WTD_PIST"),
    ["weapon_pistol50"] = GetLabelText("WTD_PIST_50"),
    ["weapon_pistol_mk2"] = GetLabelText("WTD_PIST2"),
    ["weapon_poolcue"] = GetLabelText("WTD_POOLCUE"),
    ["weapon_proxmine"] = GetLabelText("WTD_PRXMINE"),
    ["weapon_pumpshotgun"] = GetLabelText("WTD_SG_PMP"),
    ["weapon_pumpshotgun_mk2"] = GetLabelText("WTD_SG_PMP2"),
    ["weapon_railgun"] = GetLabelText("WTD_RAILGUN"),
    ["weapon_revolver"] = GetLabelText("WTD_REVOLVER"),
    ["weapon_revolver_mk2"] = GetLabelText("WTD_REVOLVER2"),
    ["weapon_rpg"] = GetLabelText("WTD_RPG"),
    ["weapon_sawnoffshotgun"] = GetLabelText("WTD_SG_SOF"),
    ["weapon_smg"] = GetLabelText("WTD_SMG"),
    ["weapon_smg_mk2"] = GetLabelText("WTD_SMG2"),
    ["weapon_smokegrenade"] = GetLabelText("WTD_GNADE_SMK"),
    ["weapon_sniperrifle"] = GetLabelText("WTD_SNIP_RIF"),
    ["weapon_snowball"] = GetLabelText("WTD_SNWBALL"),
    ["weapon_snspistol"] = GetLabelText("WTD_SNSPISTOL"),
    ["weapon_snspistol_mk2"] = GetLabelText("WTD_SNSPISTOL2"),
    ["weapon_specialcarbine"] = GetLabelText("WTD_RIFLE_SCBN"),
    ["weapon_specialcarbine_mk2"] = GetLabelText("WTD_SPCARBINE2"),
    ["weapon_stickybomb"] = GetLabelText("WTD_GNADE_STK"),
    ["weapon_stungun"] = GetLabelText("WTD_STUN"),
    ["weapon_switchblade"] = GetLabelText("WTD_SWBLADE"),
    ["weapon_unarmed"] = GetLabelText("WTD_UNARMED"),
    ["weapon_vintagepistol"] = GetLabelText("WTD_VPISTOL"),
    ["weapon_wrench"] = GetLabelText("WTD_WRENCH"),
    ["weapon_raypistol"] = GetLabelText("WTD_RAYPISTOL"),
    ["weapon_raycarbine"] = GetLabelText("WTD_RAYCARBINE"),
    ["weapon_rayminigun"] = GetLabelText("WTD_RAYMINIGUN"),
    ["weapon_stone_hatchet"] = GetLabelText("WTD_SHATCHET")
}
WeaponNames = {
    ["weapon_advancedrifle"] = GetLabelText("WT_RIFLE_ADV"),
    ["weapon_appistol"] = GetLabelText("WT_PIST_AP"),
    ["weapon_assaultrifle"] = GetLabelText("WT_RIFLE_ASL"),
    ["weapon_assaultrifle_mk2"] = GetLabelText("WT_RIFLE_ASL2"),
    ["weapon_assaultshotgun"] = GetLabelText("WT_SG_ASL"),
    ["weapon_assaultsmg"] = GetLabelText("WT_SMG_ASL"),
    ["weapon_autoshotgun"] = GetLabelText("WT_AUTOSHGN"),
    ["weapon_bat"] = GetLabelText("WT_BAT"),
    ["weapon_ball"] = GetLabelText("WT_BALL"),
    ["weapon_battleaxe"] = GetLabelText("WT_BATTLEAXE"),
    ["weapon_bottle"] = GetLabelText("WT_BOTTLE"),
    ["weapon_bullpuprifle"] = GetLabelText("WT_BULLRIFLE"),
    ["weapon_bullpuprifle_mk2"] = GetLabelText("WT_BULLRIFLE2"),
    ["weapon_bullpupshotgun"] = GetLabelText("WT_SG_BLP"),
    ["weapon_bzgas"] = GetLabelText("WT_BZGAS"),
    ["weapon_carbinerifle"] = GetLabelText("WT_RIFLE_CBN"),
    ["weapon_carbinerifle_mk2"] = GetLabelText("WT_RIFLE_CBN2"),
    ["weapon_combatmg"] = GetLabelText("WT_MG_CBT"),
    ["weapon_combatmg_mk2"] = GetLabelText("WT_MG_CBT2"),
    ["weapon_combatpdw"] = GetLabelText("WT_COMBATPDW"),
    ["weapon_combatpistol"] = GetLabelText("WT_PIST_CBT"),
    ["weapon_compactlauncher"] = GetLabelText("WT_CMPGL"),
    ["weapon_compactrifle"] = GetLabelText("WT_CMPRIFLE"),
    ["weapon_crowbar"] = GetLabelText("WT_CROWBAR"),
    ["weapon_dagger"] = GetLabelText("WT_DAGGER"),
    ["weapon_dbshotgun"] = GetLabelText("WT_DBSHGN"),
    ["weapon_doubleaction"] = GetLabelText("WT_REV_DA"),
    ["weapon_fireextinguisher"] = GetLabelText("WT_FIRE"),
    ["weapon_firework"] = GetLabelText("WT_FWRKLNCHR"),
    ["weapon_flare"] = GetLabelText("WT_FLARE"),
    ["weapon_flaregun"] = GetLabelText("WT_FLAREGUN"),
    ["weapon_flashlight"] = GetLabelText("WT_FLASHLIGHT"),
    ["weapon_golfclub"] = GetLabelText("WT_GOLFCLUB"),
    ["weapon_grenade"] = GetLabelText("WT_GNADE"),
    ["weapon_grenadelauncher"] = GetLabelText("WT_GL"),
    ["weapon_gusenberg"] = GetLabelText("WT_GUSENBERG"),
    ["weapon_hammer"] = GetLabelText("WT_HAMMER"),
    ["weapon_hatchet"] = GetLabelText("WT_HATCHET"),
    ["weapon_heavypistol"] = GetLabelText("WT_HEAVYPSTL"),
    ["weapon_heavyshotgun"] = GetLabelText("WT_HVYSHOT"),
    ["weapon_heavysniper"] = GetLabelText("WT_SNIP_HVY"),
    ["weapon_heavysniper_mk2"] = GetLabelText("WT_SNIP_HVY2"),
    ["weapon_hominglauncher"] = GetLabelText("WT_HOMLNCH"),
    ["weapon_knife"] = GetLabelText("WT_KNIFE"),
    ["weapon_knuckle"] = GetLabelText("WT_KNUCKLE"),
    ["weapon_machete"] = GetLabelText("WT_MACHETE"),
    ["weapon_machinepistol"] = GetLabelText("WT_MCHPIST"),
    ["weapon_marksmanpistol"] = GetLabelText("WT_MKPISTOL"),
    ["weapon_marksmanrifle"] = GetLabelText("WT_MKRIFLE"),
    ["weapon_marksmanrifle_mk2"] = GetLabelText("WT_MKRIFLE2"),
    ["weapon_mg"] = GetLabelText("WT_MG"),
    ["weapon_microsmg"] = GetLabelText("WT_SMG_MCR"),
    ["weapon_minigun"] = GetLabelText("WT_MINIGUN"),
    ["weapon_minismg"] = GetLabelText("WT_MINISMG"),
    ["weapon_molotov"] = GetLabelText("WT_MOLOTOV"),
    ["weapon_musket"] = GetLabelText("WT_MUSKET"),
    ["weapon_nightstick"] = GetLabelText("WT_NGTSTK"),
    ["weapon_petrolcan"] = GetLabelText("WT_PETROL"),
    ["weapon_pipebomb"] = GetLabelText("WT_PIPEBOMB"),
    ["weapon_pistol"] = GetLabelText("WT_PIST"),
    ["weapon_pistol50"] = GetLabelText("WT_PIST_50"),
    ["weapon_pistol_mk2"] = GetLabelText("WT_PIST2"),
    ["weapon_poolcue"] = GetLabelText("WT_POOLCUE"),
    ["weapon_proxmine"] = GetLabelText("WT_PRXMINE"),
    ["weapon_pumpshotgun"] = GetLabelText("WT_SG_PMP"),
    ["weapon_pumpshotgun_mk2"] = GetLabelText("WT_SG_PMP2"),
    ["weapon_railgun"] = GetLabelText("WT_RAILGUN"),
    ["weapon_revolver"] = GetLabelText("WT_REVOLVER"),
    ["weapon_revolver_mk2"] = GetLabelText("WT_REVOLVER2"),
    ["weapon_rpg"] = GetLabelText("WT_RPG"),
    ["weapon_sawnoffshotgun"] = GetLabelText("WT_SG_SOF"),
    ["weapon_smg"] = GetLabelText("WT_SMG"),
    ["weapon_smg_mk2"] = GetLabelText("WT_SMG2"),
    ["weapon_smokegrenade"] = GetLabelText("WT_GNADE_SMK"),
    ["weapon_sniperrifle"] = GetLabelText("WT_SNIP_RIF"),
    ["weapon_snowball"] = GetLabelText("WT_SNWBALL"),
    ["weapon_snspistol"] = GetLabelText("WT_SNSPISTOL"),
    ["weapon_snspistol_mk2"] = GetLabelText("WT_SNSPISTOL2"),
    ["weapon_specialcarbine"] = GetLabelText("WT_RIFLE_SCBN"),
    ["weapon_specialcarbine_mk2"] = GetLabelText("WT_SPCARBINE2"),
    ["weapon_stickybomb"] = GetLabelText("WT_GNADE_STK"),
    ["weapon_stungun"] = GetLabelText("WT_STUN"),
    ["weapon_switchblade"] = GetLabelText("WT_SWBLADE"),
    ["weapon_unarmed"] = GetLabelText("WT_UNARMED"),
    ["weapon_vintagepistol"] = GetLabelText("WT_VPISTOL"),
    ["weapon_wrench"] = GetLabelText("WT_WRENCH"),
    ["weapon_raypistol"] = GetLabelText("WT_RAYPISTOL"),
    ["weapon_raycarbine"] = GetLabelText("WT_RAYCARBINE"),
    ["weapon_rayminigun"] = GetLabelText("WT_RAYMINIGUN"),
    ["weapon_stone_hatchet"] = GetLabelText("WT_SHATCHET")
}
WeaponComponentNames = {
    ["COMPONENT_PISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_PISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_PISTOL_VARMOD_LUXE"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_PISTOL50_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_PISTOL50_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_PISTOL50_VARMOD_LUXE"] = GetLabelText("WCT_VAR_SIL"),
    ["COMPONENT_COMBATPISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_COMBATPISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_APPISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_APPISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_APPISTOL_VARMOD_LUXE"] = GetLabelText("WCT_VAR_METAL"),
    ["COMPONENT_SMG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_SMG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SMG_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_AT_SCOPE_MACRO_02"] = GetLabelText("WCT_SCOPE_MAC"),
    ["COMPONENT_SMG_VARMOD_LUXE"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_MICROSMG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_MICROSMG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_AT_SCOPE_MACRO"] = GetLabelText("WCT_SCOPE_MAC"),
    ["COMPONENT_MICROSMG_VARMOD_LUXE"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_ASSAULTSMG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_ASSAULTSMG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_AT_SCOPE_MACRO"] = GetLabelText("WCT_SCOPE_MAC"),
    ["COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_MG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_MG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_AT_SCOPE_SMALL_02"] = GetLabelText("WCT_SCOPE_SML"),
    ["COMPONENT_MG_VARMOD_LOWRIDER"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_COMBATMG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_COMBATMG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_ASSAULTRIFLE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_ASSAULTRIFLE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_ASSAULTRIFLE_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_AT_SCOPE_MACRO"] = GetLabelText("WCT_SCOPE_MAC"),
    ["COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_CARBINERIFLE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_CARBINERIFLE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_CARBINERIFLE_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_CARBINERIFLE_VARMOD_LUXE"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_ADVANCEDRIFLE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_ADVANCEDRIFLE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"] = GetLabelText("WCT_VAR_METAL"),
    ["COMPONENT_ASSAULTSHOTGUN_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_ASSAULTSHOTGUN_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE"] = GetLabelText("WCT_VAR_METAL"),
    ["COMPONENT_AT_SR_SUPP"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_AT_SCOPE_LARGE"] = GetLabelText("WCT_SCOPE_LRG"),
    ["COMPONENT_SNIPERRIFLE_VARMOD_LUXE"] = GetLabelText("WCT_VAR_WOOD"),
    ["COMPONENT_AT_SCOPE_LARGE"] = GetLabelText("WCT_SCOPE_LRG"),
    ["COMPONENT_AT_SCOPE_MACRO"] = GetLabelText("WCT_SCOPE_MAC"),
    ["COMPONENT_AT_SCOPE_MACRO_02"] = GetLabelText("WCT_SCOPE_MAC"),
    ["COMPONENT_AT_SCOPE_SMALL_02"] = GetLabelText("WCT_SCOPE_SML"),
    ["COMPONENT_AT_SCOPE_LARGE"] = GetLabelText("WCT_SCOPE_LRG"),
    ["COMPONENT_AT_SR_SUPP"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_AT_AR_AFGRIP"] = GetLabelText("WCT_GRIP"),
    ["COMPONENT_AT_AR_AFGRIP_02"] = GetLabelText("WCT_GRIP"),
    ["COMPONENT_AT_AR_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_AR_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_AR_FLSH"] = GetLabelText("WCT_FLASH"),
    ["COMPONENT_AT_AR_SUPP"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_AT_AR_SUPP_02"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_AT_BP_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_BP_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_CR_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_CR_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_MG_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_MG_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_MRFL_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_MRFL_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_MUZZLE_01"] = GetLabelText("WCT_MUZZ1"),
    ["COMPONENT_AT_MUZZLE_02"] = GetLabelText("WCT_MUZZ2"),
    ["COMPONENT_AT_MUZZLE_03"] = GetLabelText("WCT_MUZZ3"),
    ["COMPONENT_AT_MUZZLE_04"] = GetLabelText("WCT_MUZZ4"),
    ["COMPONENT_AT_MUZZLE_05"] = GetLabelText("WCT_MUZZ5"),
    ["COMPONENT_AT_MUZZLE_06"] = GetLabelText("WCT_MUZZ6"),
    ["COMPONENT_AT_MUZZLE_07"] = GetLabelText("WCT_MUZZ7"),
    ["COMPONENT_AT_MUZZLE_08"] = GetLabelText("WCT_MUZZ"),
    ["COMPONENT_AT_MUZZLE_09"] = GetLabelText("WCT_MUZZ9"),
    ["COMPONENT_AT_PI_COMP"] = GetLabelText("WCT_COMP"),
    ["COMPONENT_AT_PI_COMP_02"] = GetLabelText("WCT_COMP"),
    ["COMPONENT_AT_PI_COMP_03"] = GetLabelText("WCT_COMP"),
    ["COMPONENT_AT_PI_FLSH"] = GetLabelText("WCT_FLASH"),
    ["COMPONENT_AT_PI_FLSH_02"] = GetLabelText("WCT_FLASH"),
    ["COMPONENT_AT_PI_FLSH_03"] = GetLabelText("WCT_FLASH"),
    ["COMPONENT_AT_PI_RAIL"] = GetLabelText("WCT_SCOPE_PI"),
    ["COMPONENT_AT_PI_RAIL_02"] = GetLabelText("WCT_SCOPE_PI"),
    ["COMPONENT_AT_PI_SUPP"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_AT_PI_SUPP_02"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_AT_SB_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_SB_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"] = GetLabelText("WCT_SCOPE_LRG"),
    ["COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"] = GetLabelText("WCT_SCOPE_LRG2"),
    ["COMPONENT_AT_SCOPE_LARGE_MK2"] = GetLabelText("WCT_SCOPE_LRG2"),
    ["COMPONENT_AT_SCOPE_MACRO_02_MK2"] = GetLabelText("WCT_SCOPE_MAC2"),
    ["COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"] = GetLabelText("WCT_SCOPE_MAC2"),
    ["COMPONENT_AT_SCOPE_MACRO_MK2"] = GetLabelText("WCT_SCOPE_MAC2"),
    ["COMPONENT_AT_SCOPE_MAX"] = GetLabelText("WCT_SCOPE_MAX"),
    ["COMPONENT_AT_SCOPE_MEDIUM"] = GetLabelText("WCT_SCOPE_LRG"),
    ["COMPONENT_AT_SCOPE_MEDIUM_MK2"] = GetLabelText("WCT_SCOPE_MED2"),
    ["COMPONENT_AT_SCOPE_NV"] = GetLabelText("WCT_SCOPE_NV"),
    ["COMPONENT_AT_SCOPE_SMALL"] = GetLabelText("WCT_SCOPE_SML"),
    ["COMPONENT_AT_SCOPE_SMALL_MK2"] = GetLabelText("WCT_SCOPE_SML2"),
    ["COMPONENT_AT_SCOPE_SMALL_SMG_MK2"] = GetLabelText("WCT_SCOPE_SML2"),
    ["COMPONENT_AT_SCOPE_THERMAL"] = GetLabelText("WCT_SCOPE_TH"),
    ["COMPONENT_AT_SC_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_SC_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_SIGHTS"] = GetLabelText("WCT_HOLO"),
    ["COMPONENT_AT_SIGHTS_SMG"] = GetLabelText("WCT_HOLO"),
    ["COMPONENT_AT_SR_BARREL_01"] = GetLabelText("WCT_BARR"),
    ["COMPONENT_AT_SR_BARREL_02"] = GetLabelText("WCT_BARR2"),
    ["COMPONENT_AT_SR_SUPP_03"] = GetLabelText("WCT_SUPP"),
    ["COMPONENT_BULLPUPRIFLE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_BULLPUPRIFLE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_BULLPUPRIFLE_VARMOD_LOW"] = GetLabelText("WCT_VAR_METAL"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_CARBINERIFLE_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_CARBINERIFLE_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_COMBATMG_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_COMBATMG_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_COMBATMG_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_COMBATMG_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_COMBATMG_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_COMBATMG_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_COMBATMG_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_COMBATMG_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_COMBATMG_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_COMBATMG_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_COMBATMG_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_COMBATMG_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_COMBATMG_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_COMBATMG_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_COMBATMG_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_COMBATPDW_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_COMBATPDW_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_COMBATPDW_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_COMPACTRIFLE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_COMPACTRIFLE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_COMPACTRIFLE_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_GUSENBERG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_GUSENBERG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_HEAVYPISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_HEAVYPISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_HEAVYPISTOL_VARMOD_LUXE"] = GetLabelText("WCT_VAR_WOOD"),
    ["COMPONENT_HEAVYSHOTGUN_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_HEAVYSHOTGUN_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_HEAVYSHOTGUN_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_HEAVYSNIPER_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_HEAVYSNIPER_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"] = GetLabelText("WCT_CLIP_EX"),
    ["COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_KNUCKLE_VARMOD_BALLAS"] = GetLabelText("WCT_KNUCK_BG"),
    ["COMPONENT_KNUCKLE_VARMOD_BASE"] = GetLabelText("WCT_KNUCK_01"),
    ["COMPONENT_KNUCKLE_VARMOD_DIAMOND"] = GetLabelText("WCT_KNUCK_DMD"),
    ["COMPONENT_KNUCKLE_VARMOD_DOLLAR"] = GetLabelText("WCT_KNUCK_DLR"),
    ["COMPONENT_KNUCKLE_VARMOD_HATE"] = GetLabelText("WCT_KNUCK_HT"),
    ["COMPONENT_KNUCKLE_VARMOD_KING"] = GetLabelText("WCT_KNUCK_SLG"),
    ["COMPONENT_KNUCKLE_VARMOD_LOVE"] = GetLabelText("WCT_KNUCK_LV"),
    ["COMPONENT_KNUCKLE_VARMOD_PIMP"] = GetLabelText("WCT_KNUCK_02"),
    ["COMPONENT_KNUCKLE_VARMOD_PLAYER"] = GetLabelText("WCT_KNUCK_PC"),
    ["COMPONENT_KNUCKLE_VARMOD_VAGOS"] = GetLabelText("WCT_KNUCK_VG"),
    ["COMPONENT_MACHINEPISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_MACHINEPISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_MACHINEPISTOL_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_MARKSMANRIFLE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_MARKSMANRIFLE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_MARKSMANRIFLE_VARMOD_LUXE"] = GetLabelText("WCT_VAR_GOLD"),
    ["COMPONENT_MINISMG_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_MINISMG_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_PISTOL_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_PISTOL_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_PISTOL_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_PISTOL_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_PISTOL_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_PISTOL_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_PISTOL_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_PISTOL_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_PISTOL_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_PISTOL_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_PISTOL_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_PISTOL_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_PISTOL_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_PISTOL_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"] = GetLabelText("WCT_CLIP_HP"),
    ["COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_PISTOL_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"] = GetLabelText("WCT_SHELL"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_SHELL_AP"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"] = GetLabelText("WCT_SHELL_EX"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"] = GetLabelText("WCT_SHELL_HP"),
    ["COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_SHELL_INC"),
    ["COMPONENT_REVOLVER_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_REVOLVER_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_REVOLVER_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_REVOLVER_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_REVOLVER_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_REVOLVER_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_REVOLVER_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_REVOLVER_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_REVOLVER_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_REVOLVER_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_REVOLVER_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_REVOLVER_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1_RV"),
    ["COMPONENT_REVOLVER_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"] = GetLabelText("WCT_CLIP_HP"),
    ["COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_REVOLVER_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_REVOLVER_VARMOD_BOSS"] = GetLabelText("WCT_REV_VARB"),
    ["COMPONENT_REVOLVER_VARMOD_GOON"] = GetLabelText("WCT_REV_VARG"),
    ["COMPONENT_SMG_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_SMG_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_SMG_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_SMG_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_SMG_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_SMG_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_SMG_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_SMG_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_SMG_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_SMG_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_SMG_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_SMG_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_SMG_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SMG_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"] = GetLabelText("WCT_CLIP_HP"),
    ["COMPONENT_SMG_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_SMG_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_SNSPISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_SNSPISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_SNSPISTOL_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_SNSPISTOL_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_SNSPISTOL_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"] = GetLabelText("WCT_CLIP_HP"),
    ["COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_SNSPISTOL_VARMOD_LOWRIDER"] = GetLabelText("WCT_VAR_WOOD"),
    ["COMPONENT_SPECIALCARBINE_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_SPECIALCARBINE_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SPECIALCARBINE_CLIP_03"] = GetLabelText("WCT_CLIP_DRM"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO"] = GetLabelText("WCT_CAMO_1"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_02"] = GetLabelText("WCT_CAMO_2"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_03"] = GetLabelText("WCT_CAMO_3"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_04"] = GetLabelText("WCT_CAMO_4"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_05"] = GetLabelText("WCT_CAMO_5"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_06"] = GetLabelText("WCT_CAMO_6"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_07"] = GetLabelText("WCT_CAMO_7"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_08"] = GetLabelText("WCT_CAMO_8"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_09"] = GetLabelText("WCT_CAMO_9"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_10"] = GetLabelText("WCT_CAMO_10"),
    ["COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01"] = GetLabelText("WCT_CAMO_IND"),
    ["COMPONENT_SPECIALCARBINE_MK2_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_SPECIALCARBINE_MK2_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"] = GetLabelText("WCT_CLIP_AP"),
    ["COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"] = GetLabelText("WCT_CLIP_FMJ"),
    ["COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"] = GetLabelText("WCT_CLIP_INC"),
    ["COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"] = GetLabelText("WCT_CLIP_TR"),
    ["COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER"] = GetLabelText("WCT_VAR_ETCHM"),
    ["COMPONENT_SWITCHBLADE_VARMOD_BASE"] = GetLabelText("WCT_SB_BASE"),
    ["COMPONENT_SWITCHBLADE_VARMOD_VAR1"] = GetLabelText("WCT_SB_VAR1"),
    ["COMPONENT_SWITCHBLADE_VARMOD_VAR2"] = GetLabelText("WCT_SB_VAR2"),
    ["COMPONENT_VINTAGEPISTOL_CLIP_01"] = GetLabelText("WCT_CLIP1"),
    ["COMPONENT_VINTAGEPISTOL_CLIP_02"] = GetLabelText("WCT_CLIP2"),
    ["COMPONENT_RAYPISTOL_VARMOD_XMAS18"] = GetLabelText("WCT_VAR_RAY18")
}
WeaponTints = {
    ["Black"] = 0,
    ["Green"] = 1,
    ["Gold"] = 2,
    ["Pink"] = 3,
    ["Army"] = 4,
    ["LSPD"] = 5,
    ["Orange"] = 6,
    ["Platinum"] = 7
}
WeaponTintsMkII = {
    ["Classic Black"] = 0,
    ["Classic Gray"] = 1,
    ["Classic Two Tone"] = 2,
    ["Classic White"] = 3,
    ["Classic Beige"] = 4,
    ["Classic Green"] = 5,
    ["Classic Blue"] = 6,
    ["Classic Earth"] = 7,
    ["Classic Brown & Black"] = 8,
    ["Red Contrast"] = 9,
    ["Blue Contrast"] = 10,
    ["Yellow Contrast"] = 11,
    ["Orange Contrast"] = 12,
    ["Bold Pink"] = 13,
    ["Bold Purple & Yellow"] = 14,
    ["Bold Orange"] = 15,
    ["Bold Green & Purple"] = 16,
    ["Bold Red Features"] = 17,
    ["Bold Green Features"] = 18,
    ["Bold Cyan Features"] = 19,
    ["Bold Yellow Features"] = 20,
    ["Bold Red & White"] = 21,
    ["Bold Blue & White"] = 22,
    ["Metallic Gold"] = 23,
    ["Metallic Platinum"] = 24,
    ["Metallic Gray & Lilac"] = 25,
    ["Metallic Purple & Lime"] = 26,
    ["Metallic Red"] = 27,
    ["Metallic Green"] = 28,
    ["Metallic Blue"] = 29,
    ["Metallic White & Aqua"] = 30,
    ["Metallic Red & Yellow"] = 31
}

function CreateWeaponList()
    local _weaponsList = {}
    
    for code, name in pairs(WeaponNames) do
        local realName = code
        local localizedName = name
        if (realName ~= "weapon_unarmed") then
            local hash = GetHashKey(code)
            local componentHashes = {}
            for comp, _ in pairs(WeaponComponentNames) do
                if (DoesWeaponTakeWeaponComponent(hash, GetHashKey(comp))) then
                    if not (table.ContainsKey(componentHashes, comp)) then
                        componentHashes[comp] = GetHashKey(comp);
                    end
                end
            end
    
            local validWeapon = {
                Hash = hash,
                SpawnName = realName,
                Name = localizedName,
                Components = componentHashes
            };

            if _weaponsList == nil then table.insert(_weaponsList, validWeapon); end;

            if not table.Contains(_weaponsList, validWeapon) then table.insert(_weaponsList, validWeapon); end;
        end
    end
    return _weaponsList;
end

function SpawnCustomWeapon(PlayerPed)
    local ammo = 900;
    local inputName = FiveM.GetKeyboardInput("Enter Weapon Model Name", "Pistol", 10);
    if not (string.IsNullOrEmpty(inputName)) then
        local model = GetHashKey(inputName:upper());

        if IsWeaponValid(model) then
            GiveWeaponToPed(PlayerPed, model, ammo, false, true);
            FiveM.Subtitle("Added weapon to inventory.");
        else
            FiveM.Notify("This ("..tostring(inputName)..") is not a valid weapon model name, or the model hash ("..tostring(model)..") could not be found in the game files.", NotificationType.Error);
        end
    else
        FiveM.Notify("Invalid Input!", NotificationType.Error);
    end
end

function SpawnWeaponMenu(WeaponSpawnMenu, PlayerPed)
    local weaponInfo = {}
    local weaponComponents = {}

    local spawnWeapon =  NativeUI.CreateItem("Spawn Weapon By Name", "Enter a weapon mode name to spawn.")
    spawnWeapon:SetLeftBadge(BadgeStyle.Gun);
    spawnWeapon.Activated = function(menu, item, index) SpawnCustomWeapon(PlayerPed) end
    WeaponSpawnMenu:AddItem(spawnWeapon)

    WeaponSpawnMenu:AddSpacerItem("↓ Weapon Categories ↓")

    local handGunsMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Handguns"))
    handGunsMenu.Item:RightLabel("→→")
    handGunsMenu = handGunsMenu.SubMenu

    local riflesMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Assault Rifles"))
    riflesMenu.Item:RightLabel("→→")
    riflesMenu = riflesMenu.SubMenu

    local shotgunsMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Shotguns"))
    shotgunsMenu.Item:RightLabel("→→")
    shotgunsMenu = shotgunsMenu.SubMenu

    local smgsMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Sub-/Light Machine Guns"))
    smgsMenu.Item:RightLabel("→→")
    smgsMenu = smgsMenu.SubMenu

    local throwablesMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Throwables"))
    throwablesMenu.Item:RightLabel("→→")
    throwablesMenu = throwablesMenu.SubMenu

    local meleeMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Melee"))
    meleeMenu.Item:RightLabel("→→")
    meleeMenu = meleeMenu.SubMenu

    local heavyMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Heavy Weapons"))
    heavyMenu.Item:RightLabel("→→")
    heavyMenu = heavyMenu.SubMenu

    local snipersMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "Sniper Rifles"))
    snipersMenu.Item:RightLabel("→→")
    snipersMenu = snipersMenu.SubMenu

    local weaponList = CreateWeaponList();

    for key, weapon in pairs(weaponList) do
        local cat = GetWeapontypeGroup(weapon.Hash);

        if not string.IsNullOrEmpty(weapon.Name) then
            local weaponItem =  NativeUI.CreateItem(weapon.Name, "Open the options for ~y~"..tostring(weapon.Name).."~s~.")
            weaponItem:SetLeftBadge(BadgeStyle.Gun);

            local weaponMenu = (badwolfMenuPool:AddSubMenu(WeaponSpawnMenu, "~y~" ..tostring(weapon.Name).."~s~ Options", weapon.Name, "false"))
            weaponMenu.Item:RightLabel("→→")
            weaponMenu = weaponMenu.SubMenu

            weaponInfo[weaponMenu] = weapon;

            local getOrRemoveWeapon = NativeUI.CreateItem("Equip/Remove Weapon", "Add or remove this weapon to/form your inventory.")
            getOrRemoveWeapon:SetLeftBadge(BadgeStyle.Gun);
            weaponMenu:AddItem(getOrRemoveWeapon);

            local fillAmmo = NativeUI.CreateItem("Re-fill Ammo", "Get max ammo for this weapon.")
            fillAmmo:SetLeftBadge(BadgeStyle.Ammo);
            weaponMenu:AddItem(fillAmmo);

            local tints = {};
            do
                if (string.match(weapon.Name, "Mk II")) then
                    for tint, value in ipairs(WeaponTintsMkII) do
                        table.insert(tints, tint)
                    end
                else
                    for tint, value in pairs(WeaponTints) do
                        table.insert(tints, tint)
                    end
                end
                if table.Count(tints) > 0 then
                    local weaponTints = NativeUI.CreateListItem("Tints", tints, 0, "Select a tint for your weapon.");
                    weaponMenu:AddItem(weaponTints);
                end
            end

            if (table.Count(weapon.Components) > 0) then
                weaponMenu:AddSpacerItem("↓ Weapon Components ↓")
                local compItem = nil;
                for comp,_ in pairs(weapon.Components) do
                    compItem = NativeUI.CreateCheckboxItem(WeaponComponentNames[comp], component,"Click to equip or remove this component.");
                    weaponComponents[compItem] = comp;
                    weaponMenu:AddItem(compItem);
                end
            end
            
            weaponMenu.OnListIndexChange = function(sender, item, oldIndex, newIndex, itemIndex)
                if (item == weaponTints) then
                    if (HasPedGotWeapon(PlayerPed, weaponInfo[sender].Hash, false)) then
                        SetPedWeaponTintIndex(PlayerPed, weaponInfo[sender].Hash, newIndex);
                    else
                        FiveM.Notify("You need to get the weapon first!", NotificationType.Error);
                    end;
                end;
            end;

            weaponMenu.OnCheckboxChange = function(menu, item, enabled)
                local Weapon = weaponInfo[menu];
                local component = weaponComponents[item];
                local componentHash = Weapon.Components[component];

                if (HasPedGotWeapon(PlayerPed, Weapon.Hash, false)) then
                    SetCurrentPedWeapon(PlayerPed, Weapon.Hash, true);
                    if (HasPedGotWeaponComponent(PlayerPed, Weapon.Hash, componentHash)) then
                        RemoveWeaponComponentFromPed(PlayerPed, Weapon.Hash, componentHash);
                        FiveM.Subtitle("Component removed.");
                    else
                        local ammo = GetAmmoInPedWeapon(PlayerPed, Weapon.Hash);

                        local clipAmmo = GetAmmoInClip(PlayerPed, Weapon.Hash);

                        GiveWeaponComponentToPed(PlayerPed, Weapon.Hash, componentHash);

                        SetAmmoInClip(PlayerPed, Weapon.Hash, clipAmmo);

                        SetPedAmmo(PlayerPed, Weapon.Hash, ammo);
                        FiveM.Subtitle("Component equiped.");
                    end
                else
                    FiveM.Notify("You need to get the weapon first before you can modify it.", NotificationType.Error);
                end
            end

            weaponMenu.OnItemSelect = function(sender, item, index)
                local info = weaponInfo[sender];
                local hash = info.Hash;

                if (item == getOrRemoveWeapon) then
                    if (HasPedGotWeapon(PlayerPed, hash, false)) then
                        RemoveWeaponFromPed(PlayerPed, hash);
                        FiveM.Subtitle("Weapon removed.");
                    else
                        local bool, ammo = GetMaxAmmo(PlayerPed, hash);
                        GiveWeaponToPed(PlayerPed, hash, ammo, false, true);
                        FiveM.Subtitle("Weapon added.");
                    end
                elseif (item == fillAmmo) then
                    if (HasPedGotWeapon(PlayerPed, hash, false)) then
                        local bool, ammo = GetMaxAmmo(PlayerPed, hash);
                        SetPedAmmo(PlayerPed, hash, ammo);
                    else
                        FiveM.Notify("You need to get the weapon first before re-filling ammo!", NotificationType.Error);
                    end
                end
            end

            weaponMenu:RefreshIndex();

            
            if cat ~= nil then
                if (cat == 970310034) then
                    riflesMenu:AddItem(weaponItem);
                    riflesMenu:BindMenuToItem(weaponMenu, weaponItem);

                elseif (cat == 416676503 or cat == 690389602) then
                    handGunsMenu:AddItem(weaponItem);
                    handGunsMenu:BindMenuToItem(weaponMenu, weaponItem);
                    
                elseif (cat == 860033945) then
                    shotgunsMenu:AddItem(weaponItem);
                    shotgunsMenu:BindMenuToItem(weaponMenu, weaponItem);
                
                elseif (cat == 3337201093 or cat == 1159398588) then
                    smgsMenu:AddItem(weaponItem);
                    smgsMenu:BindMenuToItem(weaponMenu, weaponItem);
                
                elseif (cat == 1548507267 or cat == 4257178988 or cat == 1595662460) then
                    throwablesMenu:AddItem(weaponItem);
                    throwablesMenu:BindMenuToItem(weaponMenu, weaponItem);
                    
                elseif (cat == 3566412244 or cat == 2685387236 or cat == -728555052) then
                    meleeMenu:AddItem(weaponItem);
                    meleeMenu:BindMenuToItem(weaponMenu, weaponItem);
                
                elseif (cat == 2725924767 or cat == -1569042529 or cat == 1159398588) then
                    heavyMenu:AddItem(weaponItem);
                    heavyMenu:BindMenuToItem(weaponMenu, weaponItem);
                
                elseif (cat == 3082541095 or cat == -1212426201) then
                    snipersMenu:AddItem(weaponItem);
                    snipersMenu:BindMenuToItem(weaponMenu, weaponItem);
                end
            end

            if weaponItem:SetParentMenu() ~= nil then
                weaponItem:SetParentMenu().OnMenuChanged = function(menu, newmenu, forward)
                    if forward then
                        SetCurrentPedWeapon(PlayerPed, weaponInfo[newmenu].Hash, true);
                    end
                end
            end
        end
    end
end
--==================================================================================================================================================--
--[[ FiveM Functions ]]
--==================================================================================================================================================--
FiveM = {}
do
    FiveM.Notify = function(text, type)
        if type == nil then type = NotificationType.None end
        SetNotificationTextEntry("STRING")
        if type == NotificationType.Info then
            AddTextComponentString("~b~~h~Info~h~~s~: " .. text)
        elseif type == NotificationType.Error then
            AddTextComponentString("~r~~h~Error~h~~s~: " .. text)
        elseif type == NotificationType.Alert then
            AddTextComponentString("~y~~h~Alert~h~~s~: " .. text)
        elseif type == NotificationType.Success then
            AddTextComponentString("~g~~h~Success~h~~s~: " .. text)
        else
            AddTextComponentString(text)
        end
        DrawNotification(false, false)
    end

    FiveM.Subtitle = function(message, duration, drawImmediately)
        if duration == nil then duration = 2500 end;
        if drawImmediately == nil then drawImmediately = true; end;
        ClearPrints()
        SetTextEntry_2("STRING");
        for i = 1, message:len(), 99 do
            AddTextComponentString(string.sub(message, i, i + 99))
        end
        DrawSubtitleTimed(duration, drawImmediately);
    end

    FiveM.GetKeyboardInput = function(TextEntry, ExampleText, MaxStringLength)
        AddTextEntry("FMMC_KEY_TIP1", TextEntry .. ":")
        DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
        local blockinput = true
        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end

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

    FiveM.GetVehicleProperties = function(vehicle)
        local color1, color2 = GetVehicleColours(vehicle)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
        local extras = {}

        for id = 0, 12 do
            if DoesExtraExist(vehicle, id) then
                local state = IsVehicleExtraTurnedOn(vehicle, id) == 1
                extras[tostring(id)] = state
            end
        end

        return {
            model = GetEntityModel(vehicle),

            plate = math.trim(GetVehicleNumberPlateText(vehicle)),
            plateIndex = GetVehicleNumberPlateTextIndex(vehicle),

            health = GetEntityMaxHealth(vehicle),
            dirtLevel = GetVehicleDirtLevel(vehicle),

            color1 = color1,
            color2 = color2,

            pearlescentColor = pearlescentColor,
            wheelColor = wheelColor,

            wheels = GetVehicleWheelType(vehicle),
            windowTint = GetVehicleWindowTint(vehicle),

            neonEnabled = {
                IsVehicleNeonLightEnabled(vehicle, 0), IsVehicleNeonLightEnabled(vehicle, 1), IsVehicleNeonLightEnabled(vehicle, 2),
                IsVehicleNeonLightEnabled(vehicle, 3)
            },

            extras = extras,

            neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
            tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),

            modSpoilers = GetVehicleMod(vehicle, 0),
            modFrontBumper = GetVehicleMod(vehicle, 1),
            modRearBumper = GetVehicleMod(vehicle, 2),
            modSideSkirt = GetVehicleMod(vehicle, 3),
            modExhaust = GetVehicleMod(vehicle, 4),
            modFrame = GetVehicleMod(vehicle, 5),
            modGrille = GetVehicleMod(vehicle, 6),
            modHood = GetVehicleMod(vehicle, 7),
            modFender = GetVehicleMod(vehicle, 8),
            modRightFender = GetVehicleMod(vehicle, 9),
            modRoof = GetVehicleMod(vehicle, 10),

            modEngine = GetVehicleMod(vehicle, 11),
            modBrakes = GetVehicleMod(vehicle, 12),
            modTransmission = GetVehicleMod(vehicle, 13),
            modHorns = GetVehicleMod(vehicle, 14),
            modSuspension = GetVehicleMod(vehicle, 15),
            modArmor = GetVehicleMod(vehicle, 16),

            modTurbo = IsToggleModOn(vehicle, 18),
            modSmokeEnabled = IsToggleModOn(vehicle, 20),
            modXenon = IsToggleModOn(vehicle, 22),

            modFrontWheels = GetVehicleMod(vehicle, 23),
            modBackWheels = GetVehicleMod(vehicle, 24),

            modPlateHolder = GetVehicleMod(vehicle, 25),
            modVanityPlate = GetVehicleMod(vehicle, 26),
            modTrimA = GetVehicleMod(vehicle, 27),
            modOrnaments = GetVehicleMod(vehicle, 28),
            modDashboard = GetVehicleMod(vehicle, 29),
            modDial = GetVehicleMod(vehicle, 30),
            modDoorSpeaker = GetVehicleMod(vehicle, 31),
            modSeats = GetVehicleMod(vehicle, 32),
            modSteeringWheel = GetVehicleMod(vehicle, 33),
            modShifterLeavers = GetVehicleMod(vehicle, 34),
            modAPlate = GetVehicleMod(vehicle, 35),
            modSpeakers = GetVehicleMod(vehicle, 36),
            modTrunk = GetVehicleMod(vehicle, 37),
            modHydrolic = GetVehicleMod(vehicle, 38),
            modEngineBlock = GetVehicleMod(vehicle, 39),
            modAirFilter = GetVehicleMod(vehicle, 40),
            modStruts = GetVehicleMod(vehicle, 41),
            modArchCover = GetVehicleMod(vehicle, 42),
            modAerials = GetVehicleMod(vehicle, 43),
            modTrimB = GetVehicleMod(vehicle, 44),
            modTank = GetVehicleMod(vehicle, 45),
            modWindows = GetVehicleMod(vehicle, 46),
            modLivery = GetVehicleLivery(vehicle)
        }
    end

    FiveM.SetVehicleProperties = function(vehicle, props)
        SetVehicleModKit(vehicle, 0)

        if props.plate ~= nil then SetVehicleNumberPlateText(vehicle, props.plate) end

        if props.plateIndex ~= nil then SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex) end

        if props.health ~= nil then SetEntityHealth(vehicle, props.health) end

        if props.dirtLevel ~= nil then SetVehicleDirtLevel(vehicle, props.dirtLevel) end

        if props.color1 ~= nil then
            local color1, color2 = GetVehicleColours(vehicle)
            SetVehicleColours(vehicle, props.color1, color2)
        end

        if props.color2 ~= nil then
            local color1, color2 = GetVehicleColours(vehicle)
            SetVehicleColours(vehicle, color1, props.color2)
        end

        if props.pearlescentColor ~= nil then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
            SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
        end

        if props.wheelColor ~= nil then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
            SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
        end

        if props.wheels ~= nil then SetVehicleWheelType(vehicle, props.wheels) end

        if props.windowTint ~= nil then SetVehicleWindowTint(vehicle, props.windowTint) end

        if props.neonEnabled ~= nil then
            SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
            SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
            SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
            SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
        end

        if props.extras ~= nil then
            for id, enabled in pairs(props.extras) do
                if enabled then
                    SetVehicleExtra(vehicle, tonumber(id), 0)
                else
                    SetVehicleExtra(vehicle, tonumber(id), 1)
                end
            end
        end

        if props.neonColor ~= nil then SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end

        if props.modSmokeEnabled ~= nil then ToggleVehicleMod(vehicle, 20, true) end

        if props.tyreSmokeColor ~= nil then
            SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
        end

        if props.modSpoilers ~= nil then SetVehicleMod(vehicle, 0, props.modSpoilers, false) end

        if props.modFrontBumper ~= nil then SetVehicleMod(vehicle, 1, props.modFrontBumper, false) end

        if props.modRearBumper ~= nil then SetVehicleMod(vehicle, 2, props.modRearBumper, false) end

        if props.modSideSkirt ~= nil then SetVehicleMod(vehicle, 3, props.modSideSkirt, false) end

        if props.modExhaust ~= nil then SetVehicleMod(vehicle, 4, props.modExhaust, false) end

        if props.modFrame ~= nil then SetVehicleMod(vehicle, 5, props.modFrame, false) end

        if props.modGrille ~= nil then SetVehicleMod(vehicle, 6, props.modGrille, false) end

        if props.modHood ~= nil then SetVehicleMod(vehicle, 7, props.modHood, false) end

        if props.modFender ~= nil then SetVehicleMod(vehicle, 8, props.modFender, false) end

        if props.modRightFender ~= nil then SetVehicleMod(vehicle, 9, props.modRightFender, false) end

        if props.modRoof ~= nil then SetVehicleMod(vehicle, 10, props.modRoof, false) end

        if props.modEngine ~= nil then SetVehicleMod(vehicle, 11, props.modEngine, false) end

        if props.modBrakes ~= nil then SetVehicleMod(vehicle, 12, props.modBrakes, false) end

        if props.modTransmission ~= nil then SetVehicleMod(vehicle, 13, props.modTransmission, false) end

        if props.modHorns ~= nil then SetVehicleMod(vehicle, 14, props.modHorns, false) end

        if props.modSuspension ~= nil then SetVehicleMod(vehicle, 15, props.modSuspension, false) end

        if props.modArmor ~= nil then SetVehicleMod(vehicle, 16, props.modArmor, false) end

        if props.modTurbo ~= nil then ToggleVehicleMod(vehicle, 18, props.modTurbo) end

        if props.modXenon ~= nil then ToggleVehicleMod(vehicle, 22, props.modXenon) end

        if props.modFrontWheels ~= nil then SetVehicleMod(vehicle, 23, props.modFrontWheels, false) end

        if props.modBackWheels ~= nil then SetVehicleMod(vehicle, 24, props.modBackWheels, false) end

        if props.modPlateHolder ~= nil then SetVehicleMod(vehicle, 25, props.modPlateHolder, false) end

        if props.modVanityPlate ~= nil then SetVehicleMod(vehicle, 26, props.modVanityPlate, false) end

        if props.modTrimA ~= nil then SetVehicleMod(vehicle, 27, props.modTrimA, false) end

        if props.modOrnaments ~= nil then SetVehicleMod(vehicle, 28, props.modOrnaments, false) end

        if props.modDashboard ~= nil then SetVehicleMod(vehicle, 29, props.modDashboard, false) end

        if props.modDial ~= nil then SetVehicleMod(vehicle, 30, props.modDial, false) end

        if props.modDoorSpeaker ~= nil then SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false) end

        if props.modSeats ~= nil then SetVehicleMod(vehicle, 32, props.modSeats, false) end

        if props.modSteeringWheel ~= nil then SetVehicleMod(vehicle, 33, props.modSteeringWheel, false) end

        if props.modShifterLeavers ~= nil then SetVehicleMod(vehicle, 34, props.modShifterLeavers, false) end

        if props.modAPlate ~= nil then SetVehicleMod(vehicle, 35, props.modAPlate, false) end

        if props.modSpeakers ~= nil then SetVehicleMod(vehicle, 36, props.modSpeakers, false) end

        if props.modTrunk ~= nil then SetVehicleMod(vehicle, 37, props.modTrunk, false) end

        if props.modHydrolic ~= nil then SetVehicleMod(vehicle, 38, props.modHydrolic, false) end

        if props.modEngineBlock ~= nil then SetVehicleMod(vehicle, 39, props.modEngineBlock, false) end

        if props.modAirFilter ~= nil then SetVehicleMod(vehicle, 40, props.modAirFilter, false) end

        if props.modStruts ~= nil then SetVehicleMod(vehicle, 41, props.modStruts, false) end

        if props.modArchCover ~= nil then SetVehicleMod(vehicle, 42, props.modArchCover, false) end

        if props.modAerials ~= nil then SetVehicleMod(vehicle, 43, props.modAerials, false) end

        if props.modTrimB ~= nil then SetVehicleMod(vehicle, 44, props.modTrimB, false) end

        if props.modTank ~= nil then SetVehicleMod(vehicle, 45, props.modTank, false) end

        if props.modWindows ~= nil then SetVehicleMod(vehicle, 46, props.modWindows, false) end

        if props.modLivery ~= nil then
            SetVehicleMod(vehicle, 48, props.modLivery, false)
            SetVehicleLivery(vehicle, props.modLivery)
        end
    end

    FiveM.DeleteVehicle = function(vehicle)
        SetEntityAsMissionEntity(Object, 1, 1)
        DeleteEntity(Object)
        SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
        DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    end

    FiveM.DirtyVehicle = function(vehicle) SetVehicleDirtLevel(vehicle, 15.0) end

    FiveM.CleanVehicle = function(vehicle) SetVehicleDirtLevel(vehicle, 1.0) end

    FiveM.GetPlayers = function()
        local players    = {}
        for i=0, 255, 1 do
            local ped = GetPlayerPed(i)
            if DoesEntityExist(ped) then
                table.insert(players, i)
            end
        end
        return players
    end

    FiveM.GetClosestPlayer = function(coords)
        local players         = FiveM.GetPlayers()
        local closestDistance = -1
        local closestPlayer   = -1
        local usePlayerPed    = false
        local playerPed       = PlayerPedId()
        local playerId        = PlayerId()

        if coords == nil then
            usePlayerPed = true
            coords       = GetEntityCoords(playerPed)
        end

        for i=1, #players, 1 do
            local target = GetPlayerPed(players[i])

            if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
                local targetCoords = GetEntityCoords(target)
                local distance     = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)

                if closestDistance == -1 or closestDistance > distance then
                    closestPlayer   = players[i]
                    closestDistance = distance
                end
            end
        end

        return closestPlayer, closestDistance
    end

    FiveM.GetWaypoint = function()
        local g_Waypoint = nil;
        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            local blipIterator = GetBlipInfoIdIterator(8)
            local blip = GetFirstBlipInfoId(8, blipIterator)
            g_Waypoint = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector());
        end
        print(g_Waypoint);
        return g_Waypoint;
    end

    FiveM.GetSafePlayerName = function(name)
        if string.IsNullOrEmpty(name) then return "" end;
        return name:gsub("%^", "\\^"):gsub("%~", "\\~"):gsub("%<", "«"):gsub("%>", "»");
    end

    FiveM.SetResourceLocked = function(resource, item)
        Citizen.CreateThread(function()
            if item ~= nil then local item_type, item_subtype = item(); end

            if GetResourceState(resource) == "started" then
                if item ~= nil then item:Enabled(true); end;
                if item_subtype == "UIMenuItem" then item:SetRightBadge(BadgeStyle.None); end;
            else
                if item ~= nil then item:Enabled(false); end;
                if item_subtype == "UIMenuItem" then item:SetRightBadge(BadgeStyle.Lock); end;
            end
        end)
    end

    FiveM.TriggerCustomEvent = function(server, event, ...)
        local payload = msgpack.pack({...})
        if server then
            TriggerServerEventInternal(event, payload, payload:len())
        else
            TriggerEventInternal(event, payload, payload:len())
        end
    end
end

--==================================================================================================================================================--
--[[ World Functions ]]
--==================================================================================================================================================--
NotificationType = {
    None = 0,
    Info = 1,
    Error = 2,
    Alert = 3,
    Success = 4
}
do
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

    function ShootPlayer(playerIdx)
        local head = GetPedBoneCoords(playerIdx, GetEntityBoneIndexByName(playerIdx, "SKEL_HEAD"), 0.0, 0.0, 0.0)
        SetPedShootsAtCoord(GetPlayerPed(-1), head.x, head.y, head.z, true)
    end

    function SpectatePlayer(playerIdx)
        Spectating = not Spectating

        local playerPed = GetPlayerPed(-1)
        local targetPed = GetPlayerPed(playerIdx)

        if (Spectating) then
            local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
            RequestCollisionAtCoord(targetx, targety, targetz)
            NetworkSetInSpectatorMode(true, targetPed)
            FiveM.Subtitle("Spectating " .. GetPlayerName(playerIdx))
        else
            local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
            RequestCollisionAtCoord(targetx, targety, targetz)
            NetworkSetInSpectatorMode(false, targetPed)
            FiveM.Subtitle("Stopped Spectating " .. GetPlayerName(playerIdx))
        end
    end

    function PlayScenario(scenarioName)
        print(scenarioName)
        if (_currentScenario == "" or _currentScenario ~= scenarioName) then
            _currentScenario = scenarioName
            ClearPedTasks(GetPlayerPed(-1))
            local canPlay = true
            if (IsPedRunning(GetPlayerPed(-1))) then
                FiveM.Notify("You can't start a scenario when you are running.")
                canPlay = false
            elseif (IsEntityDead(GetPlayerPed(-1))) then
                FiveM.Notify("You can't start a scenario when you are dead.")
                canPlay = false
            elseif (IsPlayerInCutscene(GetPlayerPed(-1))) then
                FiveM.Notify("You can't start a scenario when you are in a cutscene.")
                canPlay = false
            elseif (IsPedFalling(GetPlayerPed(-1))) then
                FiveM.Notify("You can't start a scenario when you are falling.")
                canPlay = false
            elseif (IsPedRagdoll(GetPlayerPed(-1))) then
                FiveM.Notify("You can't start a scenario when you are currently in a ragdoll state.")
                canPlay = false
            elseif (not IsPedOnFoot(GetPlayerPed(-1))) then
                FiveM.Notify("You must be on foot to start a scenario.")
                canPlay = false
            elseif (NetworkIsInSpectatorMode()) then
                FiveM.Notify("You can't start a scenario when you are currently spectating..")
                canPlay = false
            elseif (GetEntitySpeed(GetPlayerPed(-1)) > 5.0) then
                FiveM.Notify("You can't start a scenario when you are moving too fast.")
                canPlay = false
            end

            if (canPlay) then
                if (table.Contains(PedScenarios.PositionBasedScenarios, scenarioName)) then
                    local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -0.5, -0.5)
                    local heading = GetEntityHeading(GetPlayerPed(-1))
                    TaskStartScenarioAtPosition(GetPlayerPed(-1), scenarioName, pos.X, pos.Y, pos.Z, heading, -1, true, false)
                else
                    TaskStartScenarioInPlace(GetPlayerPed(-1), scenarioName, 0, true)
                end
            end
        else
            _currentScenario = ""
            ClearPedTasks(GetPlayerPed(-1))
            ClearPedSecondaryTask(GetPlayerPed(-1))
        end

        if (scenarioName == "forcestop") then
            _currentScenario = ""
            ClearPedTasks(GetPlayerPed(-1))
            ClearPedTasksImmediately(GetPlayerPed(-1))
        end
    end
end

--==================================================================================================================================================--
--[[ ESX Functions ]]
--==================================================================================================================================================--
ESX = nil
do
    Citizen.CreateThread(function()
        if GetResourceState('es_extended') == "started" then
            while ESX == nil and ShowMenu do
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end);
                Citizen.Wait(0)
            end
        end
    end)

    function SetPlayerJob(playerIdx, job, level, hire)
        local xPlayer = {}
        if ESX ~= nil then
            ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
                for i = 1, #players do
                    local name = players[i].name

                    if name == GetPlayerName(playerIdx) then xPlayer = players[i] end
                end

                ESX.TriggerServerCallback('esx_society:setJob', function() end, xPlayer.identifier, job, level, hire and 'hire' or 'fire')

                if isRiverCityRp then
                    ESX.TriggerServerCallback('esx:setJob', function() end, xPlayer.identifier, job, level, hire and 'hire' or 'fire')
                end
            end)
        end
    end
end

--==================================================================================================================================================--
--[[ Teleport Functions ]]
--==================================================================================================================================================--
do
    function TeleportToPlayer(playerIdx)
        local entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
        SetEntityCoords(entity, GetEntityCoords(GetPlayerPed(playerIdx)), 0.0, 0.0, 0.0, false)

        entity = IsPedInAnyVehicle(GetPlayerPed(playerIdx), false) and GetVehiclePedIsUsing(GetPlayerPed(playerIdx)) or GetPlayerPed(playerIdx)
        SetEntityCoords(entity, GetEntityCoords(GetPlayerPed(-1)), 0.0, 0.0, 0.0, false)
    end

    FiveM.TeleportToCoords = function (coordinate)        
        local playerPed = PlayerPedId();
        local entity = nil;

        local inVehicle = IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == playerPed);

        if inVehicle then entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0);
        else entity = playerPed end

        if not inVehicle then ClearPedTasksImmediately(playerPed); end;

        if (IsEntityVisible(entity)) then SetEntityVisible(entity, false, 0); NetworkFadeOutEntity(entity, true, false); end

        Wait(10); FreezeEntityPosition(entity, true);

        DoScreenFadeOut(250);

        Wait(10);

        local groundZ = 0.0
        local zHeight = 1000.0
        local bool = false

        while ShowMenu do
            Wait(10);

            if inVehicle then entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else entity = GetPlayerPed(-1) end;

            SetEntityCoords(entity, coordinate.x, coordinate.y, zHeight)
            FreezeEntityPosition(entity, true)

            local entityPos = GetEntityCoords(entity, true)
            if groundZ == 0.0 then
                zHeight = zHeight - 25.0
                SetEntityCoords(entity, entityPos.x, entityPos.y, zHeight)
                bool, groundZ = GetGroundZFor_3dCoord(entityPos.x, entityPos.y, entityPos.z, 0)
            else
                SetEntityCoords(entity, entityPos.x, entityPos.y, groundZ)
                FreezeEntityPosition(entity, false)
                break
            end
        end

        if inVehicle then
            FreezeEntityPosition(entity, false)
            SetVehicleOnGroundProperly(entity);
            FreezeEntityPosition(entity, true)
        end

        FreezeEntityPosition(entity, false);
        NetworkFadeInEntity(entity, true);

        Wait(10); SetEntityVisible(entity, true, 0);
    
        DoScreenFadeIn(250);
        SetGameplayCamRelativePitch(0.0, 1.0);
        FiveM.Subtitle("~y~Teleported to waypoint!")
    end
end

--==================================================================================================================================================--
--[[ Vehicle Functions ]]
--==================================================================================================================================================--
VehicleMaxSpeeds = { 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220 }

do
    function ParkVehicle(vehicle)
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed, false)
        local x, y, z = table.unpack(playerCoords)
        local node, outPos = GetNthClosestVehicleNode(x, y, z, 20, 0, 0, 0)
        local sx, sy, sz = table.unpack(outPos)
        if node then
            FiveM.Notify(NotificationType.Info,
                                "The player ped will find a suitable place to park the car and will then stop driving. Please wait.")
            ClearPedTasks(playerPed)
            TaskVehiclePark(playerPed, vehicle, sx, sy, sz, 0, 5, 20, false)
            SetVehicleHalt(vehicle, 5, 0, false)
            ClearPedTasks(playerPed)
            FiveM.Notify(NotificationType.Info, "The player ped has stopped driving and parked the vehicle.")
        end
    end

    function DriveToWaypoint(style)
        if style == nil then style = 0 end
        local WaypointCoords = nil

        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            local blipIterator = GetBlipInfoIdIterator(8)
            local blip = GetFirstBlipInfoId(8, blipIterator)
            WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
        else
            FiveM.Notify("~r~No waypoint!", NotificationType.Error)
        end
        if WaypointCoords ~= nil then
            ClearPedTasks(GetPlayerPed(-1))
            DriveWanderTaskActive = false
            DriveToWpTaskActive = true

            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local vehicleEntity = GetEntityModel(vehicle)

            SetDriverAbility(GetPlayerPed(-1), 1)
            SetDriverAggressiveness(GetPlayerPed(-1), 0)

            if GetVehicleModelMaxSpeed ~= nil then
                TaskVehicleDriveToCoordLongrange(GetPlayerPed(-1), vehicle, WaypointCoords, GetVehicleModelMaxSpeed(vehicleEntity), style, 10)
            else
                TaskVehicleDriveToCoordLongrange(GetPlayerPed(-1), vehicle, WaypointCoords, Citizen.InvokeNative(0xF417C2502FFFED43, vehicleEntity), style, 10)
            end
            Citizen.CreateThread(function()
                while DriveToWpTaskActive and GetDistanceBetweenCoords(WaypointCoords, GetEntityCoords(vehicle), false) > 15 do
                    if GetDistanceBetweenCoords(WaypointCoords, GetEntityCoords(vehicle) , false) < 15 then
                        ParkVehicle(vehicle)
                    end
                    Wait(0)
                end
            end)
        else
            FiveM.Notify("~r~Waypoint missing!", NotificationType.Error)
        end
    end

    function DriveWander(style)
        if style == nil then style = 0 end

        ClearPedTasks(GetPlayerPed(-1))
        DriveWanderTaskActive = true
        DriveToWpTaskActive = false

        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        local vehicleEntity = GetEntityModel(vehicle)

        SetDriverAbility(GetPlayerPed(-1), 1)
        SetDriverAggressiveness(GetPlayerPed(-1), 0)
        SetEntityMaxSpeed(vehicle, 16.5)

        if GetVehicleModelMaxSpeed ~= nil then
            TaskVehicleDriveWander(GetPlayerPed(-1), vehicle, GetVehicleModelMaxSpeed(vehicleEntity), style)
        else
            TaskVehicleDriveWander(GetPlayerPed(-1), vehicle, Citizen.InvokeNative(0xF417C2502FFFED43, vehicleEntity), style)
        end
    end

    function SpawnVehicleToPlayer(modelName, playerIdx)
        if modelName and IsModelValid(modelName) and IsModelAVehicle(modelName) then
            RequestModel(modelName)
            while not HasModelLoaded(modelName) do Citizen.Wait(0) end
            local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))
            local playerPed = GetPlayerPed(playerIdx)
            local SpawnedVehicle = CreateVehicle(model, GetEntityCoords(playerPed), GetEntityHeading(playerPed), true, true)
            local SpawnedVehicleIdx = NetworkGetNetworkIdFromEntity(SpawnedVehicle)
            SetNetworkIdCanMigrate(SpawnedVehicleIdx, true)
            SetEntityAsMissionEntity(SpawnedVehicle, true, false)
            SetVehicleHasBeenOwnedByPlayer(SpawnedVehicle, true)
            SetVehicleNeedsToBeHotwired(SpawnedVehicle, false)
            SetModelAsNoLongerNeeded(model)

            SetPedIntoVehicle(playerPed, SpawnedVehicle, -1)
            SetVehicleEngineOn(SpawnedVehicle, true, false, false)
            SetVehRadioStation(SpawnedVehicle, 'OFF')
            return SpawnedVehicle
        else
            FiveM.Notify("Invalid Vehicle Model!", NotificationType.Error)
            return nil
        end
    end

    function SpawnLegalVehicle(vehicalModelName, playerIdx, plateNumber)
        local SpawnedVehicle = SpawnVehicleToPlayer(vehicalModelName, playerIdx)
        if SpawnedVehicle ~= nil then
            if string.IsNullOrEmpty(plateNumber) then SetVehicleNumberPlateText(SpawnedVehicle, GetVehicleNumberPlateText(SpawnedVehicle))
            else SetVehicleNumberPlateText(SpawnedVehicle, plateNumber) end
            FiveM.Notify("Spawned Vehicle", NotificationType.Success)
            local SpawnedVehicleProperties = FiveM.GetVehicleProperties(SpawnedVehicle)
            local SpawnedVehicleModel = GetDisplayNameFromVehicleModel(SpawnedVehicleProperties.model)
            if SpawnedVehicleProperties then
                FiveM.TriggerCustomEvent(true, 'esx_vehicleshop:setVehicleOwnedPlayerId', GetPlayerServerId(playerIdx), SpawnedVehicleProperties, SpawnedVehicleModel, vehicalModelName, false)
                FiveM.Notify("~g~~h~You own this spawned vehicle!")
            end
        end
    end

    function MaxTuneVehicle(playerPed)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = FiveM.GetVehicleProperties(SpawnedVehicle)
        SetVehicleModKit(vehicle, 0)
        SetVehicleWheelType(vehicle, 7)
        for index = 0, 38 do
            if index > 16 and index < 23 then
                ToggleVehicleMod(vehicle, index, true)
            elseif index == 14 then
                SetVehicleMod(vehicle, 14, 16, false)
            elseif index == 23 or index == 24 then
                SetVehicleMod(vehicle, index, 1, false)
            else
                SetVehicleMod(vehicle, index, GetNumVehicleMods(vehicle, index) - 1, false)
            end
        end
        SetVehicleWindowTint(vehicle, 1)
        SetVehicleTyresCanBurst(vehicle, false)
        SetVehicleNumberPlateTextIndex(vehicle, 5)
    end
end

--==================================================================================================================================================--
--[[ badwolf Menu Functions ]]
--==================================================================================================================================================--
do
    local color = {}
    Citizen.CreateThread(function()
        while ShowMenu do
            Citizen.Wait(0)
            color = GenerateRainbow(1.0)
            badwolfMenu.Logo:Colour(color.r, color.g, color.b, 255)
        end
    end)

    --[[ Show Blips ]]
    Citizen.CreateThread(function()
        while ShowMenu do
            Citizen.Wait(1)

            if ShowMenu and IsPedInAnyVehicle(GetPlayerPed(-1), 0) then
                local carModel = "CarName: "..GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0)))
                if carTagId == nil then carTagId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(-1), carModel, false, false, "", false) end

                if not HasCarTag then
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, carTagId, 0, true)
                    HasCarTag = true
                end
                Citizen.CreateThread(function()
                    if HasCarTag then
                        Wait(3000)
                    end
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, carTagId, 0, false)
                end)
            else
                HasCarTag = false
                if carTagId ~= nil then
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, carTagId, 0, false)
                    Citizen.InvokeNative(0x31698AA80E0223F8, carTagId)
                    carTagId = nil
                end
            end

            for id = 0, 128 do

                if NetworkIsPlayerActive(id) and id ~= PlayerId() then

                    local playerPed = GetPlayerPed(id)
                    local playerBlip = GetBlipFromEntity(playerPed)
                    local nameTag = ('[%d] %s'):format(GetPlayerServerId(id), GetPlayerName(id))

                    -- HEAD DISPLAY STUFF --

                    -- Create head display (this is safe to be spammed)
                    local gamerTagId = Citizen.InvokeNative(0xBFEFE3321A3F5015, playerPed, nameTag, false, false, "", false)
                    local wantedLvl = GetPlayerWantedLevel(id)

                    if ShowMenu and ShowHeadSprites then
                        -- Wanted level display
                        if ShowWantedLevel then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 7, true) -- Add wanted sprite
                            Citizen.InvokeNative(0xCF228E2AA03099C3, gamerTagId, wantedLvl) -- Set wanted number
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 7, false) -- Remove wanted sprite
                        end

                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 0, true) -- Add player name sprite
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 9, NetworkIsPlayerTalking(id)) -- Add / Remove speaking sprite
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 7, false) -- Remove wanted sprite
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 9, false) -- Remove speaking sprite
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 0, false) -- Remove player name sprite
                        Citizen.InvokeNative(0x31698AA80E0223F8, gamerTagId)
                    end
                    if ShowMenu and ShowPlayerBlips then
                        -- BLIP STUFF --

                        if not DoesBlipExist(playerBlip) then -- Add playerBlip and create head display on player
                            playerBlip = AddBlipForEntity(playerPed)
                            SetBlipSprite(playerBlip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, true) -- Player Blip indicator

                        else -- update playerBlip
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            local blipSprite = GetBlipSprite(playerBlip)

                            if not GetEntityHealth(playerPed) then -- dead
                                if blipSprite ~= 274 then
                                    SetBlipSprite(playerBlip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                end

                            elseif vehicle then
                                local vehicleClass = GetVehicleClass(vehicle)
                                local vehicleModel = GetEntityModel(vehicle)

                                if vehicleClass == 15 then -- jet
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(playerBlip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                    end

                                elseif vehicleClass == 16 then -- plane
                                    if vehicleModel == GetHashKey("besra") or vehicleModel == GetHashKey("hydra") or vehicleModel == GetHashKey("lazer") then -- jet
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(playerBlip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                        end

                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(playerBlip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                    end

                                elseif vehicleClass == 14 then -- boat
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(playerBlip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                    end

                                elseif vehicleModel == GetHashKey("insurgent") or vehicleModel == GetHashKey("insurgent2") or vehicleModel ==
                                    GetHashKey("limo2") then -- insurgent (+ turreted limo cuz limo playerBlip wont work)
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(playerBlip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                    end

                                elseif vehicleModel == GetHashKey("rhino") then -- tank
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(playerBlip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, false) -- Player Blip indicator
                                    end

                                elseif blipSprite ~= 1 then -- default playerBlip
                                    SetBlipSprite(playerBlip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, true) -- Player Blip indicator
                                end

                                -- Show number in case of passangers
                                local passengers = GetVehicleNumberOfPassengers(vehicle)

                                if passengers then
                                    if not IsVehicleSeatFree(vehicle, -1) then passengers = passengers + 1 end
                                    ShowNumberOnBlip(playerBlip, passengers)
                                else
                                    HideNumberOnBlip(playerBlip)
                                end
                            else
                                -- Remove leftover number
                                HideNumberOnBlip(playerBlip)
                                if blipSprite ~= 1 then -- default playerBlip
                                    SetBlipSprite(playerBlip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, playerBlip, true) -- Player Blip indicator
                                end
                            end

                            SetBlipRotation(playerBlip, math.ceil(GetEntityHeading(vehicle))) -- update rotation
                            SetBlipNameToPlayerName(playerBlip, id) -- update playerBlip name
                            SetBlipScale(playerBlip, 0.85) -- set scale

                            -- set player alpha
                            if IsPauseMenuActive() then
                                SetBlipAlpha(playerBlip, 255)
                            else
                                local x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                local x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                                local distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
                                -- Probably a way easier way to do this but whatever im an idiot

                                if distance < 0 then
                                    distance = 0

                                elseif distance > 255 then
                                    distance = 255
                                end

                                SetBlipAlpha(playerBlip, distance)
                            end
                        end
                    else
                        RemoveBlip(playerBlip)
                    end
                end
            end
        end
    end)

    --[[ World Settings ]]
    Citizen.CreateThread(function()
        while ShowMenu do
            --[[ Display Minimap ]]
            DisplayRadar(ShowMenu and ShowRadar)
            
            --[[ Display Extended Minimap ]]
            if SetBigmapActive ~= nil then SetBigmapActive(ShowMenu and ShowExtendedRadar, false)
            else SetRadarBigmapEnabled(ShowMenu and ShowExtendedRadar, false) end

            --[[ Extend minimap on keypress ]]
            if IsDisabledControlJustPressed(0, 19) and IsDisabledControlPressed(0, 21) then
                ShowExtendedRadar = not ShowExtendedRadar
            end

            if Enable_SuperJump then SetSuperJumpThisFrame(PlayerId()) end

            if Enable_InfiniteStamina then RestorePlayerStamina(PlayerId(), 1.0) end

            if ShowCrosshair then ShowHudComponentThisFrame(14) end

            if Enable_VehicleGodMode and IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
            end

            if vehicleFastSpeed_isEnabled and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end

            if DeleteGun then
                local playerEntity = getEntity(PlayerId())
                if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                    FiveM.Notify("~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!")
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999)
                    if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
                        if IsPlayerFreeAiming(PlayerId()) then
                            if IsEntityAPed(playerEntity) then
                                if IsPedInAnyVehicle(playerEntity, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(playerEntity, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(playerEntity, true))
                                        SetEntityAsMissionEntity(playerEntity, 1, 1)
                                        DeleteEntity(playerEntity)
                                        FiveM.Notify("~g~Deleted!")
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(playerEntity, 1, 1)
                                        DeleteEntity(playerEntity)
                                        FiveM.Notify("~g~Deleted!")
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(playerEntity, 1, 1)
                                    DeleteEntity(playerEntity)
                                    FiveM.Notify("~g~Deleted!")
                                end
                            end
                        end
                    end
                end
            end

            if empNearbyVehicles then
                for vehicle in EnumerateVehicles() do
                    if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 100)
                    end
                end
            end

            if deleteNearbyVehicle then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1)
                        DeleteEntity(GetVehiclePedIsIn(vehicle, true))
                        SetEntityAsMissionEntity(vehicle, 1, 1)
                        DeleteEntity(vehicle)
                    end
                end
            end

            if explodeNearbyVehicles then
                for vehicle in EnumerateVehicles() do
                    if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end

            if nameabove then
                local ignorePlayerNameDistance = false
                local playerNamesDist = 130
                for id = 0, 128 do
                    if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        local ped = GetPlayerPed(id)
                        local blip = GetBlipFromEntity(ped)

                        local playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        local targetX, targetY, targetZ = table.unpack(GetEntityCoords(GetPlayerPed(id), true))

                        local distance = math.floor(GetDistanceBetweenCoords(playerX, playerY, playerZ, targetX, targetY, targetZ, true))

                        local playerServerIdx = GetPlayerServerId(id)
                        local playerName = FiveM.GetSafePlayerName(GetPlayerName(id))

                        if ignorePlayerNameDistance then
                            if NetworkIsPlayerTalking(id) then
                                DrawText3D(targetX, targetY, targetZ + 1.2, playerServerIdx .. "  |  " .. playerName, color.r, color.g, color.b)
                            else
                                DrawText3D(targetX, targetY, targetZ + 1.2, playerServerIdx .. "  |  " .. playerName, 255, 255, 255)
                            end
                        end
                        if distance < playerNamesDist then
                            if not ignorePlayerNameDistance then
                                if NetworkIsPlayerTalking(id) then
                                    DrawText3D(targetX, targetY, targetZ + 1.2, playerServerIdx .. "  |  " .. playerName, color.r, color.g, color.b)
                                else
                                    DrawText3D(targetX, targetY, targetZ + 1.2, playerServerIdx .. "  |  " .. playerName, 255, 255, 255)
                                end
                            end
                        end
                    end
                end
            end

            if ShowEsp then
                for i = 0, 128 do
                    if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
                        local pPed = GetPlayerPed(i)
                        local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(pPed))
                        local message = "Name: " .. FiveM.GetSafePlayerName(GetPlayerName(i)) .. "\nServer ID: " .. GetPlayerServerId(i) .. "\nPlayer ID: " .. i ..
                                            "\nDist: " .. math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, true), 1)
                        if IsPedInAnyVehicle(pPed) then
                            local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(pPed))))
                            message = message .. "\nVeh: " .. VehName
                        end
                        if ShowEspInfo and ShowEsp then DrawText3D(x, y, z + 1.0, message, color.r, color.g, color.b) end
                        if ShowEspOutline and ShowEsp then
                            local PedCoords = GetOffsetFromEntityInWorldCoords(pPed)
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
                            DrawLine(LineOneBegin.x, LineOneBegin.y, LineOneBegin.z, LineOneEnd.x, LineOneEnd.y, LineOneEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(LineTwoBegin.x, LineTwoBegin.y, LineTwoBegin.z, LineTwoEnd.x, LineTwoEnd.y, LineTwoEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(LineThreeBegin.x, LineThreeBegin.y, LineThreeBegin.z, LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(LineThreeEnd.x, LineThreeEnd.y, LineThreeEnd.z, LineFourBegin.x, LineFourBegin.y, LineFourBegin.z, color.r, color.g, color.b, 255)
                            DrawLine(TLineOneBegin.x, TLineOneBegin.y, TLineOneBegin.z, TLineOneEnd.x, TLineOneEnd.y, TLineOneEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(TLineTwoBegin.x, TLineTwoBegin.y, TLineTwoBegin.z, TLineTwoEnd.x, TLineTwoEnd.y, TLineTwoEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(TLineThreeBegin.x, TLineThreeBegin.y, TLineThreeBegin.z, TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(TLineThreeEnd.x, TLineThreeEnd.y, TLineThreeEnd.z, TLineFourBegin.x, TLineFourBegin.y, TLineFourBegin.z, color.r, color.g, color.b, 255)
                            DrawLine(ConnectorOneBegin.x, ConnectorOneBegin.y, ConnectorOneBegin.z, ConnectorOneEnd.x, ConnectorOneEnd.y, ConnectorOneEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(ConnectorTwoBegin.x, ConnectorTwoBegin.y, ConnectorTwoBegin.z, ConnectorTwoEnd.x, ConnectorTwoEnd.y, ConnectorTwoEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(ConnectorThreeBegin.x, ConnectorThreeBegin.y, ConnectorThreeBegin.z, ConnectorThreeEnd.x, ConnectorThreeEnd.y, ConnectorThreeEnd.z, color.r, color.g, color.b, 255)
                            DrawLine(ConnectorFourBegin.x, ConnectorFourBegin.y, ConnectorFourBegin.z, ConnectorFourEnd.x, ConnectorFourEnd.y, ConnectorFourEnd.z, color.r, color.g, color.b, 255)
                        end
                        if ShowEspLines and ShowEsp then DrawLine(cx, cy, cz, x, y, z, color.r, color.g, color.b, 255) end
                    end
                end
            end

            if norecoil then
                local weaponTable = {
                    [453432689] = 1.0,
                    [3219281620] = 1.0,
                    [1593441988] = 1.0,
                    [584646201] = 1.0,
                    [2578377531] = 1.0,
                    [324215364] = 1.0,
                    [736523883] = 1.0,
                    [2024373456] = 1.0,
                    [4024951519] = 1.0,
                    [3220176749] = 1.0,
                    [961495388] = 1.0,
                    [2210333304] = 1.0,
                    [4208062921] = 1.0,
                    [2937143193] = 1.0,
                    [2634544996] = 1.0,
                    [2144741730] = 1.0,
                    [3686625920] = 1.0,
                    [487013001] = 1.0,
                    [1432025498] = 1.0,
                    [2017895192] = 1.0,
                    [3800352039] = 1.0,
                    [2640438543] = 1.0,
                    [911657153] = 1.0,
                    [100416529] = 1.0,
                    [205991906] = 1.0,
                    [177293209] = 1.0,
                    [856002082] = 1.0,
                    [2726580491] = 1.0,
                    [1305664598] = 1.0,
                    [2982836145] = 1.0,
                    [1752584910] = 1.0,
                    [1119849093] = 1.0,
                    [3218215474] = 1.0,
                    [1627465347] = 1.0,
                    [3231910285] = 1.0,
                    [-1768145561] = 1.0,
                    [3523564046] = 1.0,
                    [2132975508] = 1.0,
                    [-2066285827] = 1.0,
                    [137902532] = 1.0,
                    [2828843422] = 1.0,
                    [984333226] = 1.0,
                    [3342088282] = 1.0,
                    [1785463520] = 1.0,
                    [1672152130] = 0,
                    [1198879012] = 1.0,
                    [171789620] = 1.0,
                    [3696079510] = 1.0,
                    [1834241177] = 1.0,
                    [3675956304] = 1.0,
                    [3249783761] = 1.0,
                    [-879347409] = 1.0,
                    [4019527611] = 1.0,
                    [1649403952] = 1.0,
                    [317205821] = 1.0,
                    [125959754] = 1.0,
                    [3173288789] = 1.0
                }
                if IsPedShooting(PlayerPedId(-1)) and not IsPedDoingDriveby(PlayerPedId(-1)) then
                    local _, cWeapon = GetCurrentPedWeapon(PlayerPedId(-1))
                    local _, cAmmo = GetAmmoInClip(PlayerPedId(-1), cWeapon)
                    if weaponTable[cWeapon] and weaponTable[cWeapon] ~= 0 then
                        local tv = 0
                        local pitch = 0
                        if GetFollowPedCamViewMode() ~= 4 then
                            repeat
                                Wait(0)
                                pitch = GetGameplayCamRelativePitch()
                                SetGameplayCamRelativePitch(pitch + 0.0, 0.0)
                                tv = tv + 0.0
                            until tv >= weaponTable[cWeapon]
                        else
                            repeat
                                Wait(0)
                                pitch = GetGameplayCamRelativePitch()
                                if weaponTable[cWeapon] > 0.0 then
                                    SetGameplayCamRelativePitch(pitch + 0.0, 0.0)
                                    tv = tv + 0.0
                                else
                                    SetGameplayCamRelativePitch(pitch + 0.0, 0.0)
                                    tv = tv + 0.0
                                end
                            until tv >= weaponTable[cWeapon]
                        end
                    end
                end
            end

            if oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
                local playerEntity = getEntity(PlayerId())
                if IsEntityAPed(playerEntity) then
                    if IsPedInAnyVehicle(playerEntity, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(playerEntity, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(playerEntity, true), true, true, 0)
                            end
                        end
                    end
                elseif IsEntityAVehicle(playerEntity) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                        if IsControlJustReleased(1, 69) then NetworkExplodeVehicle(playerEntity, true, true, 0) end
                    else
                        if IsControlJustReleased(1, 142) then NetworkExplodeVehicle(playerEntity, true, true, 0) end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
            end

            Wait(0)
        end
    end)

    local function CustomRightBadge(item, badge, width, height, offsetX, offsetY)
        item:SetRightBadge(badge)
        item.RightBadge.Sprite.Width = width
        item.RightBadge.Sprite.Height = height
        item:RightBadgeOffset(offsetX, offsetY)
    end

    local function AddPlayerOptionsMenu(menu)
        local PlayerOptionsMenu = (badwolfMenuPool:AddSubMenu(menu, "Player Options"))
        PlayerOptionsMenu.Item:RightLabel("→→")
        PlayerOptionsMenu = PlayerOptionsMenu.SubMenu

        local playerScenarios = NativeUI.CreateListItem("Player Scenarios", PedScenarios.Scenarios, 1, "Select a scenario and hit enter to start it. Selecting another scenario will override the current scenario. If you're already playing the selected scenario, selecting it again will stop the scenario.");
        PlayerOptionsMenu:AddItem(playerScenarios)
        playerScenarios.OnListSelected = function(menu, item, index) PlayScenario(PedScenarios.ScenarioNames[item:IndexToItem(index)]) end

        local stopScenario = NativeUI.CreateItem("Force Stop Scenario", "This will force a playing scenario to stop immediately, without waiting for it to finish it's 'stopping' animation.")
        PlayerOptionsMenu:AddItem(stopScenario)
        stopScenario.Activated = function(ParentMenu, SelectedItem) PlayScenario("forcestop") end

        local openSkinMenu = NativeUI.CreateItem("~y~ESX: ~s~Open Skin Menu", "")
        openSkinMenu.Activated = function(ParentMenu, SelectedItem)
            FiveM.TriggerCustomEvent(false, 'esx_skin:openRestrictedMenu', function(data, menu) badwolfMenuPool:CloseAllMenus() end) end
        PlayerOptionsMenu:AddItem(openSkinMenu)
        FiveM.SetResourceLocked('esx_skin', openSkinMenu)

        local revive = NativeUI.CreateItem("~y~ESX: ~b~Revive", "Revive yourself!")
        revive.Activated = function(ParentMenu, SelectedItem) FiveM.TriggerCustomEvent(false, 'esx_ambulancejob:revive')  end
        PlayerOptionsMenu:AddItem(revive)
        FiveM.SetResourceLocked('esx_ambulancejob', revive)

        local setHunger = NativeUI.CreateItem("~y~ESX: ~g~Hunger ( 100% )", "Set hunger level to 100%")
        setHunger.Activated = function(ParentMenu, SelectedItem) FiveM.TriggerCustomEvent(false, 'esx_status:set', "hunger", 1000000) end
        PlayerOptionsMenu:AddItem(setHunger)
        FiveM.SetResourceLocked('esx_status', setHunger)

        local setThirst = NativeUI.CreateItem("~y~ESX: ~g~Thirst ( 100% )", "Set thirst level to 100%")
        setThirst.Activated = function(ParentMenu, SelectedItem) FiveM.TriggerCustomEvent(false, 'esx_status:set', "thirst", 1000000) end
        PlayerOptionsMenu:AddItem(setThirst)
        FiveM.SetResourceLocked('esx_status', setThirst)

        local heal = NativeUI.CreateItem("Native: ~g~Heal / Revive", "Revive yourself to 100% health")
        heal:RightLabel("💖")
        heal.Activated = function(ParentMenu, SelectedItem) CreatePickup(GetHashKey("PICKUP_HEALTH_STANDARD"), GetEntityCoords(GetPlayerPed(-1))) end
        PlayerOptionsMenu:AddItem(heal)

        local armour = NativeUI.CreateItem("Native: ~b~Give Armour", "Give yourself to 100% armour")
        armour.Activated = function(ParentMenu, SelectedItem) CreatePickup(GetHashKey("PICKUP_ARMOUR_STANDARD"), GetEntityCoords(GetPlayerPed(-1))) end
        PlayerOptionsMenu:AddItem(armour)

        local suicide = NativeUI.CreateItem("~r~Commit Suicide", "Kill yourself by taking the pill. Or by using a pistol if you have one.")
        suicide:RightLabel("💀")
        suicide.Activated = function(ParentMenu, SelectedItem) SetEntityHealth(PlayerPedId(), 0) end
        PlayerOptionsMenu:AddItem(suicide)

        local heatVision = NativeUI.CreateCheckboxItem("Heat Vision", enableThermalVision, "Enable Thermal Vision")
        heatVision.CheckboxEvent = function(menu, item, enabled) SetSeethrough(enabled) end
        PlayerOptionsMenu:AddItem(heatVision)

        local nightVision = NativeUI.CreateCheckboxItem("Night Vision", enableNightVision, "Enable Thermal Vision")
        nightVision.CheckboxEvent = function(menu, item, enabled) SetNightvision(enabled) end
        PlayerOptionsMenu:AddItem(nightVision)

        local unlimitedStamina = NativeUI.CreateCheckboxItem("Unlimited Stamina", Enable_InfiniteStamina, "Allows you to run forever without slowing down or taking damage.")
        unlimitedStamina.CheckboxEvent = function(menu, item, enabled) Enable_InfiniteStamina = enabled end
        PlayerOptionsMenu:AddItem(unlimitedStamina)

        local superJump = NativeUI.CreateCheckboxItem("Super Jump", Enable_SuperJump, "Get ~g~Snail~s~ powers and jump like a champ!")
        superJump.CheckboxEvent = function(menu, item, enabled) Enable_SuperJump = enabled end
        PlayerOptionsMenu:AddItem(superJump)
    end

    local function AddOnlinePlayersMenu(menu)
        local playerServerIdx, SelectedPlayer = 0
        local PlayerName = ""

        local OnlinePlayersMenu = (badwolfMenuPool:AddSubMenu(menu, "Online Players"))
        OnlinePlayersMenu.Item:RightLabel("→→")

        local OnlinePlayerOptionsMenu = badwolfMenuPool:AddSubMenu(OnlinePlayersMenu.SubMenu, "Online Player Options")

        --[[ Online Player Options ]] do
            local Spectate = NativeUI.CreateItem("Spectate Player", "Spectate "..PlayerName..". Click this button again to stop spectating.")
            Spectate.Activated = function(ParentMenu, SelectedItem) SpectatePlayer(SelectedPlayer) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(Spectate)

            local Teleport = NativeUI.CreateItem("Teleport To Player", "Teleport To "..PlayerName)
            Teleport.Activated = function(ParentMenu, SelectedItem) TeleportToPlayer(SelectedPlayer) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(Teleport)

            local NativeRevive = NativeUI.CreateItem("Native: Revive", "Native Revive "..PlayerName)
            NativeRevive.Activated = function(ParentMenu, SelectedItem) CreatePickup(GetHashKey("PICKUP_HEALTH_STANDARD"), GetEntityCoords(GetPlayerPed(SelectedPlayer))) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(NativeRevive)

            local NativeSlay = NativeUI.CreateItem("Native: ~r~Silent Slay", "Silently kill "..PlayerName)
            NativeSlay.Activated = function(ParentMenu, SelectedItem)
                AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 33, 101.0, false, true, 0.0) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(NativeSlay)

            local NativeExplode = NativeUI.CreateItem("Native: ~r~Explode", "Explode "..PlayerName.." and surroundings!")
            NativeExplode.Activated = function(ParentMenu, SelectedItem) AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 1337.0, false, true, 0.0) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(NativeExplode)

            local StopActions = NativeUI.CreateItem("Native: ~o~Stop All Actions", "Stop all actions for "..PlayerName.." including kicking from vehicle!")
            StopActions.Activated = function(ParentMenu, SelectedItem) ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer)) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(StopActions)

            local StopDrag = NativeUI.CreateItem("Native: ~o~Stop Drag", "Stop drag for "..PlayerName)
            StopDrag.Activated = function(ParentMenu, SelectedItem) DetachEntity(GetPlayerPed(SelectedPlayer), true, false) end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(StopDrag)
            

            local maxTuneVehicle = NativeUI.CreateItem("Max Tune Vehicle", "Max tune "..PlayerName.."'s vehicle.")
            maxTuneVehicle.Activated = function(ParentMenu, SelectedItem)
                if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer)) then
                    MaxTuneVehicle(GetPlayerPed(SelectedPlayer))
                else
                    FiveM.Notify("Player must be in a ~r~vehicle ~w~to use this !", NotificationType.Error)
                end
            end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(maxTuneVehicle)

            local cloneVehicle = NativeUI.CreateItem("~s~Clone Vehicle", "Clone "..PlayerName.."'s Vehicle")
            cloneVehicle.Activated = function(ParentMenu, SelectedItem)
                local selectedPlayerPed = GetPlayerPed(SelectedPlayer)
                local selectedPlayerVehicle = nil

                if IsPedInAnyVehicle(selectedPlayerPed) then selectedPlayerVehicle = GetVehiclePedIsIn(selectedPlayerPed, false)
                else selectedPlayerVehicle = GetVehiclePedIsIn(selectedPlayerPed, true) end

                if DoesEntityExist(selectedPlayerVehicle) then
                    local vehicleModel = GetEntityModel(selectedPlayerVehicle)
                    local spawnedVehicle = SpawnVehicleToPlayer(vehicleModel, PlayerId())

                    local vehicleProperties = FiveM.GetVehicleProperties(selectedPlayerVehicle)
                    vehicleProperties.plate = nil

                    FiveM.SetVehicleProperties(spawnedVehicle, vehicleProperties)

                    SetVehicleEngineOn(spawnedVehicle, true, false, false)
                    SetVehRadioStation(spawnedVehicle, 'OFF')
                end
            end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(cloneVehicle)
            
            local spawnWeapon = NativeUI.CreateItem("~s~Spawn Weapon", "Spawn Weapon To "..PlayerName)
            spawnWeapon.Activated = function(ParentMenu, SelectedItem)
                SpawnWeaponMenu(OnlinePlayerOptionsMenu.SubMenu, GetPlayerPed(SelectedPlayer));
            end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(spawnWeapon)

            local crashPlayer = NativeUI.CreateItem("~s~Crash Player", "Crash  "..PlayerName)
            crashPlayer.Activated = function(ParentMenu, SelectedItem)
                Citizen.CreateThread(function()
                    local playerPed = GetPlayerPed(SelectedPlayer);
                    local objectNetId = nil;
                    while objectNetId == nil do
                        objectNetId = ObjToNet(CreateObjectNoOffset(crashStyles[index], GetEntityCoords(playerPed), 1, 1, 1) );
                        Wait(0);
                    end
                    local object = NetToObj(objectNetId);
                    print("Object "..tostring(object).."'s Location: "..tostring(GetEntityCoords(object)))
                    Wait(5000);
                    if ShowMenu and DoesEntityExist(object) then
                        print("Trying to remove object : "..object)
                        RequestModel(-508849828)
                        while not HasModelLoaded(-508849828) do
                            Wait(1)
                        end
                        local pedestrian = CreatePed(1, -508849828, 0.0, 0.0, 1000.0, 31.0, false, true);
                        SetEntityInvincible(pedestrian, true)
                        FreezeEntityPosition(pedestrian, true)
                        while GetEntityCoords(pedestrian).z < 1000 do
                            DeleteEntity(pedestrian);
                            pedestrian = CreatePed(1, -508849828, 0.0, 0.0, 1000.0, 31.0, false, true);
                            Wait(1)
                        end
                        print("Ped "..tostring(pedestrian).."'s Location: "..tostring(GetEntityCoords(pedestrian)))
                        Wait(1000)
                        SetEntityAsNoLongerNeeded(object);
                        SetEntityAsMissionEntity(object, true, true);
                        Wait(1000);
                        AttachEntityToEntity(
                            object, pedestrian, GetEntityBoneIndexByName(pedestrian, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1
                        )
                        Wait(1000);
                        print("Object "..tostring(object).."'s Location: "..tostring(GetEntityCoords(object)))
                        DeleteEntity(pedestrian);
                        Wait(100);
                        print("Has ControlOfNetworkId: "..tostring(NetworkRequestControlOfNetworkId(objectNetId)));
                        print("Has ControlOfEntity: "..tostring(NetworkRequestControlOfEntity(object)));
                        Wait(100);
                        SetEntityAsNoLongerNeeded(object);
                        SetEntityAsMissionEntity(object, true, true);
                        Wait(100);
                        DetachEntity(object, 1, 1);
                        Wait(100);
                        DeleteEntity(object);
                        Wait(100);
                        print("Object Exists: "..tostring(DoesEntityExist(object)).." & Ped Exists: "..tostring(DoesEntityExist(pedestrian)));
                    end
                end)
            end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(crashPlayer)

            local spawnPawned = NativeUI.CreateItem("~s~Spawn Pawners", "Kill" .. PlayerName .. "With Driving Ped")
            spawnPawned.Activated = function(ParentMenu, SelectedItem)
                Citizen.CreateThread(function()
                    local veh = vehlist[math.random(#vehlist)]
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_m_y_swat_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_m_y_swat_01') do
                        RequestModel('s_m_y_swat_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v = CreateVehicle(veh, pos.x - (xf * 10), pos.y - (yf * 10), pos.z + 1, GetEntityHeading(GetPlayerPed(SelectedPlayer)), true, false)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_swat_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_swat_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(ped, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), pos.x, pos.y, pos.z, 200, 99, 0,
                                                'FIRING_PATTERN_BURST_FIRE_DRIVEBY')
                                    TaskShootAtEntity(ped1, GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)), 200, 'FIRING_PATTERN_BURST_FIRE_DRIVEBY')
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    SetEntityInvincible(ped, true)
                                    SetEntityInvincible(ped1, true)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                        ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(spawnPawned)

            local spawnJesus = NativeUI.CreateItem("~s~Spawn Jesus", "God Bless  "..PlayerName)
            spawnJesus.Activated = function(ParentMenu, SelectedItem)
                local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                local ped = CreatePed(21, GetHashKey('u_m_m_jesus_01'), pos.x, pos.y, pos.z, true, true)
                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                Citizen.Wait(5000)
                DeletePed(ped)
            end
            OnlinePlayerOptionsMenu.SubMenu:AddItem(spawnJesus)
        end

        --[[ Online Player EasyAdmin Menu ]]
        local EasyAdmin = (badwolfMenuPool:AddSubMenu(OnlinePlayerOptionsMenu.SubMenu, "EasyAdmin → Triggers", "EasyAdmin Triggers"))
        EasyAdmin.Item:RightLabel("→→")
        EasyAdmin = EasyAdmin.SubMenu

        --[[ Online Player EasyAdmin Triggers ]] do
            local EasyAdminSlay = NativeUI.CreateItem("~y~EasyAdmin: ~r~Slay Player", "Ban "..PlayerName)
            EasyAdminSlay.Activated = function(ParentMenu, SelectedItem)
                FiveM.TriggerCustomEvent(true, 'EasyAdmin:SlapPlayer', PlayerServerIdx, 10) end
            EasyAdmin:AddItem(EasyAdminSlay)
            FiveM.SetResourceLocked('EasyAdmin', EasyAdminSlay)

            local EasyAdminBan = NativeUI.CreateItem("~y~EasyAdmin: ~r~Ban Player", "Ban "..PlayerName)
            EasyAdminBan.Activated = function(ParentMenu, SelectedItem)
                FiveM.TriggerCustomEvent(true, 'EasyAdmin:banPlayer', PlayerServerIdx, "cauz you stoopid", 10444633200, PlayerName) end
            EasyAdmin:AddItem(EasyAdminBan)
            FiveM.SetResourceLocked('EasyAdmin', EasyAdminBan)

            local EasyAdminFreeze = NativeUI.CreateItem("~y~EasyAdmin: ~r~Freeze Player", "Freeze "..PlayerName)
            EasyAdminFreeze.Activated = function(ParentMenu, SelectedItem)
                FiveM.TriggerCustomEvent(true, 'EasyAdmin:FreezePlayer', PlayerServerIdx, true) end
            EasyAdmin:AddItem(EasyAdminFreeze)
            FiveM.SetResourceLocked('EasyAdmin', EasyAdminFreeze)

            local EasyAdminTeleport = NativeUI.CreateItem("~y~EasyAdmin: ~r~Teleport Player", "Teleport "..PlayerName)
            EasyAdminTeleport.Activated = function(ParentMenu, SelectedItem)
                local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
                FiveM.TriggerCustomEvent(true, 'EasyAdmin:TeleportPlayerToCoords', PlayerServerIdx, x, y, z) end
            EasyAdmin:AddItem(EasyAdminTeleport)
            FiveM.SetResourceLocked('EasyAdmin', EasyAdminTeleport)
        end

        --[[ Online Player ESX Trigger Menu ]]
        local ESXTriggers = (badwolfMenuPool:AddSubMenu(OnlinePlayerOptionsMenu.SubMenu, "ESX → Triggers", "ESX Based Triggers"))
        ESXTriggers.Item:RightLabel("→→")
        ESXTriggers = ESXTriggers.SubMenu

        --[[ Online Player ESX Triggers ]] do
            local ESXRevive = NativeUI.CreateItem("~y~ESX: ~b~Revive", "Revive "..PlayerName)
            ESXRevive.Activated = function(ParentMenu, SelectedItem)
                FiveM.TriggerCustomEvent(true, 'esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
                FiveM.TriggerCustomEvent(true, 'esx_ambulancejob:revive', SelectedPlayer)
            end
            ESXTriggers:AddItem(ESXRevive)
            FiveM.SetResourceLocked('esx_ambulancejob', ESXRevive)

            local ESXJail = NativeUI.CreateItem("~y~ESX: ~r~Jail Player", "Jail "..PlayerName.." for 45 Minutes")
            ESXJail.Activated = function(ParentMenu, SelectedItem)
                FiveM.TriggerCustomEvent(true, 'esx_jailer:sendToJail', GetPlayerServerId(selectedPlayerIdx), 45 * 60)
                FiveM.TriggerCustomEvent(true, 'esx_jail:sendToJail', GetPlayerServerId(selectedPlayerIdx), 45 * 60)
                FiveM.TriggerCustomEvent(true, 'js:jailuser', GetPlayerServerId(selectedPlayerIdx), 45 * 60, "dude weed")
            end
            ESXTriggers:AddItem(ESXJail)
            FiveM.SetResourceLocked('esx_jailer', ESXJail)
            FiveM.SetResourceLocked('esx_jail', ESXJail)
            FiveM.SetResourceLocked('js', ESXJail)

            local ESXChangeName =  NativeUI.CreateItem("~y~ESX: ~s~Change Name", "Change Name of  "..PlayerName)
            ESXChangeName.Activated = function(ParentMenu, SelectedItem)
                local FirstName = FiveM.GetKeyboardInput("Enter FirstName", "", 50)
                local LastName = FiveM.GetKeyboardInput("Enter LastName", "", 50)

                if ESX ~= nil then
                    ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
                        local xPlayer = nil
                        for i = 1, #players do
                            if players[i].name == GetPlayerName(SelectedPlayer) then xPlayer = players[i] end
                        end

                        if xPlayer ~= nil then
                            local data = {
                                identifier	= xPlayer.identifier,
                                firstname	= FirstName,
                                lastname	= LastName
                            }
                            local myidentifiers = { steamid = xPlayer.identifier }
                            FiveM.TriggerCustomEvent(true, 'esx_identity:setIdentity', data, myidentifiers)
                            Citizen.Wait(500)
                        else
                            FiveM.Notify("No Player Found", NotificationType.Error)
                        end
                    end)
                end
            end
            ESXTriggers:AddItem(ESXChangeName)
            FiveM.SetResourceLocked('esx_identity', ESXChangeName)

            local ESXChangeJob = NativeUI.CreateListItem("~y~ESX: ~s~Change Job", Jobs, 1)
            ESXChangeJob:Description("Change "..PlayerName.." Job to "..Jobs[ESXChangeJob:Index()])
            ESXChangeJob.OnListSelected = function(menu, item, index)
                local JobGrade = FiveM.GetKeyboardInput("Enter JobGrade", "", 2)
                SetPlayerJob(SelectedPlayer, Jobs.Type[ESXChangeJob:IndexToItem(index)], JobGrade, true) end
            ESXTriggers:AddItem(ESXChangeJob)
            FiveM.SetResourceLocked('esx_society', ESXChangeJob)

            local ESXSpawnLegalVehicle = NativeUI.CreateItem("~y~ESX: ~s~Spawn Legal Vehicle", "Spawn a custom legal vehicle to "..PlayerName)
            ESXSpawnLegalVehicle.Activated = function(ParentMenu, SelectedItem)
                local ModelName = FiveM.GetKeyboardInput("Enter Vehicle Spawn Name", "", 10)
                local PlateNumber = FiveM.GetKeyboardInput("Enter Vehicle Plate Number", "", 8)
                SpawnLegalVehicle(ModelName, SelectedPlayer, PlateNumber); end
            ESXTriggers:AddItem(ESXSpawnLegalVehicle)
            FiveM.SetResourceLocked('esx_vehicleshop', ESXSpawnLegalVehicle)

            local ESXFakeMessage = NativeUI.CreateItem("~y~ESX: ~s~Fake Message", "Send a fake message from "..PlayerName)
            ESXFakeMessage.Activated = function(ParentMenu, SelectedItem)
                local message = FiveM.GetKeyboardInput("Enter the fake message!", "", 100)
                if not string.IsNullOrEmpty(message) then
                    FiveM.TriggerCustomEvent(true, '_chat:messageEntered', GetPlayerName(SelectedPlayer), {0, 0x99, 255}, message)
                end
            end
            ESXTriggers:AddItem(ESXFakeMessage)
        end

        OnlinePlayerOptionsMenu.SubMenu.OnMenuChanged = function(menu, newmenu, forward)
            if not forward then
                OnlinePlayersMenu.SubMenu:Clear()

                for playerId = 0, 128 do
                    if NetworkIsPlayerActive(playerId) and GetPlayerServerId(playerId) ~= 0 then
                        local OnlinePlayerOptions = NativeUI.CreateItem(FiveM.GetSafePlayerName(GetPlayerName(playerId)),
                                string.format("Click to view the options for this player.\nServer ID:%i Local ID:%i", GetPlayerServerId(playerId), playerId))
                        CustomRightBadge(OnlinePlayerOptions, BadgeStyle.ArrowRight, 25, 25, 5, 4)
                        OnlinePlayerOptions:RightLabel(IsPedDeadOrDying(GetPlayerPed(playerId), 1) and "💀" or "💖")
                        OnlinePlayersMenu.SubMenu:BindMenuToItem(OnlinePlayerOptionsMenu.SubMenu, OnlinePlayerOptions)

                        OnlinePlayersMenu.SubMenu:AddItem(OnlinePlayerOptions)
                    end
                end

                OnlinePlayersMenu.SubMenu:RefreshIndex();
            end
        end

        OnlinePlayersMenu.Item.Activated = function(ParentMenu, SelectedItem)
            OnlinePlayersMenu.SubMenu:Clear()

            for playerId = 0, 128 do
                if NetworkIsPlayerActive(playerId) and GetPlayerServerId(playerId) ~= 0 then
                    local OnlinePlayerOptions = NativeUI.CreateItem(FiveM.GetSafePlayerName(GetPlayerName(playerId)),
                            string.format("Click to view the options for this player.\nServer ID:%i Local ID:%i", GetPlayerServerId(playerId), playerId))
                    CustomRightBadge(OnlinePlayerOptions, BadgeStyle.ArrowRight, 25, 25, 5, 4)
                    OnlinePlayerOptions:RightLabel(IsPedDeadOrDying(GetPlayerPed(playerId), 1) and "💀" or "💖")
                    OnlinePlayersMenu.SubMenu:BindMenuToItem(OnlinePlayerOptionsMenu.SubMenu, OnlinePlayerOptions)

                    OnlinePlayersMenu.SubMenu:AddItem(OnlinePlayerOptions)
                end
            end

            OnlinePlayersMenu.SubMenu:RefreshIndex();
        end

        OnlinePlayersMenu.SubMenu.OnItemSelect = function(sender, item, index)
            local Description = item:Description()
            playerServerIdx, SelectedPlayer = Description:match('.*:(%d+).*:(%d+)')
            playerServerIdx = tonumber(playerServerIdx);
            SelectedPlayer = tonumber(SelectedPlayer);
            PlayerName = FiveM.GetSafePlayerName(GetPlayerName(SelectedPlayer))
            OnlinePlayerOptionsMenu.SubMenu.Subtitle.Text:Text(PlayerName.." → Options")
        end

    end

    local function AddTeleportMenu(menu)
        local TeleportMenu = (badwolfMenuPool:AddSubMenu(menu, "Teleport Options"))
        TeleportMenu.Item:RightLabel("→→")
        TeleportMenu = TeleportMenu.SubMenu

        local TeleportToWayPoint = NativeUI.CreateItem("Teleport To ~b~Waypoint", "Teleport using ~g~Snail~s~ powers!")
        TeleportToWayPoint.Activated = function(ParentMenu, SelectedItem)
            Citizen.CreateThread(function()
                local waypoint = FiveM.GetWaypoint();
                if waypoint ~= 0 and waypoint ~= nil then FiveM.TeleportToCoords(waypoint) end
            end) end
        TeleportMenu:AddItem(TeleportToWayPoint)
    end

    local function AddWeaponOptionsMenu(menu)
        local WeaponOptionsMenu = (badwolfMenuPool:AddSubMenu(menu, "Weapon Options"))
        WeaponOptionsMenu.Item:RightLabel("→→")
        WeaponOptionsMenu = WeaponOptionsMenu.SubMenu

        local WeaponSpawnMenu = (badwolfMenuPool:AddSubMenu(WeaponOptionsMenu, "Spawn Weapon"))
        WeaponSpawnMenu.Item:RightLabel("→→")
        WeaponSpawnMenu = WeaponSpawnMenu.SubMenu

        local removeAllWeapons =  NativeUI.CreateItem("Remove All Weapons", "Removes all weapons in your inventory.")
        removeAllWeapons.Activated = function(menu, item, index) RemoveAllPedWeapons(PlayerPedId(), true) end
        WeaponOptionsMenu:AddItem(removeAllWeapons)

        SpawnWeaponMenu(WeaponSpawnMenu, PlayerPedId())
    end

    local function AddVehicleAutoPilot(menu)
        local vehicleAutoPilotMenu = (badwolfMenuPool:AddSubMenu(menu, "Vehicle Auto Pilot", "Manage vehicle auto pilot options."))
        vehicleAutoPilotMenu.Item:RightLabel("→→")
        vehicleAutoPilotMenu = vehicleAutoPilotMenu.SubMenu

        local StyleFromIndex = {
            [1] = 431,
            [2] = 1074528293,
            [3] = 536871355,
            [4] = 1467,
        }

        local drivingStyles = { "Normal", "Rushed", "Avoid highways", "Drive in reverse" }
        local drivingStyle = NativeUI.CreateListItem("Driving Style", drivingStyles, 1, "Set the driving style that is used for the Drive to Waypoint and Drive Around Randomly functions.")
        drivingStyle.OnListSelected = function(menu, item, index)
            SetDriveTaskDrivingStyle(PlayerPedId(), StyleFromIndex[index]) end
        vehicleAutoPilotMenu:AddItem(drivingStyle)

        local startDrivingWaypoint = NativeUI.CreateItem("Drive To Waypoint", "Make your player ped drive your vehicle to your waypoint.")
        vehicleAutoPilotMenu:AddItem(startDrivingWaypoint)

        local startDrivingRandomly = NativeUI.CreateItem("Drive Around Randomly", "Make your player ped drive your vehicle randomly around the map.");
        vehicleAutoPilotMenu:AddItem(startDrivingRandomly)

        local stopDriving = NativeUI.CreateItem("Park Vehicle", "The player ped will find a suitable place to stop the vehicle. The task will be stopped once the vehicle has reached the suitable stop location.");
        vehicleAutoPilotMenu:AddItem(stopDriving)

        local forceStopDriving = NativeUI.CreateItem("Stop Driving", "This will stop the driving task immediately without finding a suitable place to stop.");
        vehicleAutoPilotMenu:AddItem(forceStopDriving)


        vehicleAutoPilotMenu.OnItemSelect = function(sender, item, index)
            local playerPed = GetPlayerPed(-1)
            local style = StyleFromIndex[drivingStyle:Index()]
            if (IsPedInAnyVehicle(playerPed, false) and item ~= stopDriving and item ~= forceStopDriving) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if (vehicle ~=nil and DoesEntityExist(vehicle) and IsVehicleDriveable(vehicle, false)) then
                    if (GetPedInVehicleSeat(vehicle, -1)) then
                        if (item == startDrivingWaypoint) then
                            if (DoesBlipExist(GetFirstBlipInfoId(8))) then
                                DriveToWaypoint(style)
                                FiveM.Notify("Your player ped is now driving the vehicle for you. You can cancel any time by pressing the Stop Driving button. The vehicle will stop when it has reached the destination.", NotificationType.Info)
                            else
                                FiveM.Notify("You need a waypoint before you can drive to it!", NotificationType.Error)
                            end
                        elseif (item == startDrivingRandomly) then
                            DriveWander(style)
                            FiveM.Notify("Your player ped is now driving the vehicle for you. You can cancel any time by pressing the Stop Driving button.", NotificationType.Info)
                        end
                    else
                        FiveM.Notify("You must be the driver of this vehicle!", NotificationType.Error)
                    end
                else
                    FiveM.Notify("Your vehicle is broken or it does not exist!", NotificationType.Error)
                end
            elseif (item ~= stopDriving and item ~= forceStopDriving) then
                FiveM.Notify("You need to be in a vehicle first!", NotificationType.Error)
            end
            if item == stopDriving then
                if (IsPedInAnyVehicle(playerPed, false)) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
                    if (vehicle ~=nil and DoesEntityExist(vehicle) and IsVehicleDriveable(vehicle, false)) then
                        ParkVehicle(vehicle)
                    end
                else
                    ClearPedTasks(playerPed)
                    FiveM.Notify("Your ped is not in any vehicle.", NotificationType.Alert);
                end
            elseif item == forceStopDriving then
                DriveWanderTaskActive = false
                DriveToWpTaskActive = false
                SetEntityMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 500.01);
                ClearPedTasks(playerPed);
                FiveM.Notify("Driving task cancelled.", NotificationType.Info);
            end
        end
    end

    local function AddVehicleOptionsMenu(menu)
        local VehicleOptionsMenu = (badwolfMenuPool:AddSubMenu(menu, "Vehicle Options"))
        VehicleOptionsMenu.Item:RightLabel("→→")
        VehicleOptionsMenu = VehicleOptionsMenu.SubMenu

        AddVehicleAutoPilot(VehicleOptionsMenu)

        local vehicleMaxSpeed =  NativeUI.CreateListItem("Set Vehicle Speed", VehicleMaxSpeeds, 11)
        vehicleMaxSpeed.OnListSelected = function(menu, item, index)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                if index == 1 then SetEntityMaxSpeed(vehicle, 500.0);
                else SetEntityMaxSpeed(vehicle, tonumber(vehicleMaxSpeed:IndexToItem(index))/3.6); end;
            else FiveM.Notify("You must be in a ~r~vehicle ~w~to use this !", NotificationType.Error); end; end
        VehicleOptionsMenu:AddItem(vehicleMaxSpeed)

        --[[ Spawn Vehicle Options ]]
        local vehicleTypes =  NativeUI.CreateListItem("Car Types", CarTypes, 1)
        VehicleOptionsMenu:AddItem(vehicleTypes)

        local spawnVehicle = NativeUI.CreateListItem("Spawn Vehicle", CarsArray[1], 1)
        VehicleOptionsMenu:AddItem(spawnVehicle)

        vehicleTypes.OnListChanged = function(menu, item, index) spawnVehicle.Items = CarsArray[index]; spawnVehicle:Index(1) end
        spawnVehicle.OnListSelected = function(menu, item, index) SpawnVehicleToPlayer(CarsArray[vehicleTypes:Index()][index], PlayerId()) end

        local spawnLegalVehicle = NativeUI.CreateItem("Spawn Legal Vehicle", "Spawn a custom legal vehicle.")
        spawnLegalVehicle.Activated = function(ParentMenu, SelectedItem)
            local ModelName = FiveM.GetKeyboardInput("Enter Vehicle Spawn Name", "", 10)
            local PlateNumber = FiveM.GetKeyboardInput("Enter Vehicle Plate Number", "", 8)
            SpawnLegalVehicle(ModelName, PlayerId(), PlateNumber) end
        VehicleOptionsMenu:AddItem(spawnLegalVehicle)
        FiveM.SetResourceLocked('esx_vehicleshop', refuelVehicle)

        local repairVehicle = NativeUI.CreateItem("~b~Repair Vehicle", "Repair any visual and physical damage present on your vehicle.")
        repairVehicle:RightLabel("🔧")
        repairVehicle.Activated = function(ParentMenu, SelectedItem)
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true)
            SetVehicleLights(vehicle, 0)
            SetVehicleBurnout(vehicle, false)
            N_0x1fd09e7390a74d54(vehicle, 0) end
        VehicleOptionsMenu:AddItem(repairVehicle)

        local refuelVehicle = NativeUI.CreateItem("~g~Refuel Vehicle", "Refuel the vehicle.")
        refuelVehicle:RightLabel("⛽")
        refuelVehicle.Activated = function(ParentMenu, SelectedItem)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                FiveM.TriggerCustomEvent(false, 'advancedFuel:setEssence', 100, GetVehicleNumberPlateText(vehicle),
                GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
                SetVehicleEngineOn(vehicle, true, false, false)
                SetVehicleUndriveable(vehicle, false)
            else FiveM.Notify("You must be in a ~r~vehicle ~w~to use this !", NotificationType.Error) end end;
        VehicleOptionsMenu:AddItem(refuelVehicle)
        FiveM.SetResourceLocked('advancedFuel', refuelVehicle)

        local maxTuneVehicle = NativeUI.CreateItem("Max Tune", "Max tune your vehicle.")
        maxTuneVehicle.Activated = function(ParentMenu, SelectedItem)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then MaxTuneVehicle(GetPlayerPed(-1));
            else FiveM.Notify("You must be in a ~r~vehicle ~w~to use this !", NotificationType.Error); end; end;
        VehicleOptionsMenu:AddItem(maxTuneVehicle)

        local sellVehicle = NativeUI.CreateItem("Sell Vehicle", "Sell your current vehicle.")
        sellVehicle.Activated = function(ParentMenu, SelectedItem)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                if ESX ~= nil then
                    local vehicleProperties = FiveM.GetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    ESX.TriggerServerCallback('esx_vehicleshop:resellVehicle', function(vehicleSold) end, vehicleProperties.plate, vehicleProperties.model)
                else FiveM.Notify("Trouble with ESX!", NotificationType.Error) end;
            else FiveM.Notify("You must be in a ~r~vehicle ~w~to use this !", NotificationType.Error) end; end;
        VehicleOptionsMenu:AddItem(sellVehicle)
        FiveM.SetResourceLocked('esx_vehicleshop', sellVehicle)

        local stealVehicle = NativeUI.CreateItem("Steal Vehicle", "Steal this current vehicle.")
        stealVehicle.Activated = function(ParentMenu, SelectedItem)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    local SpawnedVehicleProperties = FiveM.GetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    local SpawnedVehicleModel = SpawnedVehicleProperties.model
                    local SpawnedVehicleModelName = GetDisplayNameFromVehicleModel(SpawnedVehicleModel)
                    if SpawnedVehicleProperties then
                        FiveM.TriggerCustomEvent(true, 'esx_vehicleshop:setVehicleOwnedPlayerId', GetPlayerServerId(PlayerId()), SpawnedVehicleProperties, SpawnedVehicleModelName, SpawnedVehicleModel, false)
                        FiveM.Notify("~g~~h~You own this spawned vehicle!", NotificationType.Success)
                    end
            else FiveM.Notify("You must be in a ~r~vehicle ~w~to use this !", NotificationType.Error) end end
        VehicleOptionsMenu:AddItem(stealVehicle)
        FiveM.SetResourceLocked('esx_vehicleshop', stealVehicle)

        local deleteVehicle = NativeUI.CreateItem("Delete Vehicle", "Delete your vehicle.")
        deleteVehicle.Activated = function(ParentMenu, SelectedItem) FiveM.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1))) end
        VehicleOptionsMenu:AddItem(deleteVehicle)

        local dirtyVehicle = NativeUI.CreateItem("Dirty Vehicle", "Make your vehicle dirty.")
        dirtyVehicle.Activated = function(ParentMenu, SelectedItem) FiveM.DirtyVehicle(GetVehiclePedIsIn(GetPlayerPed(-1))) end
        VehicleOptionsMenu:AddItem(dirtyVehicle)

        local cleanVehicle = NativeUI.CreateItem("Clean Vehicle", "Make your vehicle clean.")
        cleanVehicle.Activated = function(ParentMenu, SelectedItem) FiveM.CleanVehicle(GetVehiclePedIsIn(GetPlayerPed(-1))) end
        VehicleOptionsMenu:AddItem(cleanVehicle)

        local changeVehiclePlate = NativeUI.CreateItem("Set License Plate Text", "Enter a custom license plate for your vehicle.")
        changeVehiclePlate.Activated = function(ParentMenu, SelectedItem)
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
                local result = FiveM.GetKeyboardInput("Enter the plate license you want", "", 8)
                if result then SetVehicleNumberPlateText(playerVeh, result) end
            else
                FiveM.Notify("You must be in a ~r~vehicle ~w~to use this !", NotificationType.Error)
            end end
        VehicleOptionsMenu:AddItem(changeVehiclePlate)

        local noFall = NativeUI.CreateCheckboxItem("Bike No-Fall", Enable_NoFall, "Enable no-fall for the bike.")
        noFall.CheckboxEvent = function(menu, item, enabled)
            Enable_NoFall = enabled
            SetPedCanBeKnockedOffVehicle(GetPlayerPed(-1), Enable_NoFall and 1 or 0) end
        VehicleOptionsMenu:AddItem(noFall)

        local vehicleGodmode = NativeUI.CreateCheckboxItem("Vehicle Godmode", Enable_NoFall, "Enable vehicle godmode.")
        vehicleGodmode.CheckboxEvent = function(menu, item, enabled) Enable_VehicleGodMode = enabled end
        VehicleOptionsMenu:AddItem(vehicleGodmode)
    end

    local function AddTriggerOptionsMenu(menu)
        local TriggerOptionsMenu = (badwolfMenuPool:AddSubMenu(menu, "ESX Triggers"))
        TriggerOptionsMenu.Item:RightLabel("→→")
        TriggerOptionsMenu = TriggerOptionsMenu.SubMenu

        local ESXBoss = NativeUI.CreateListItem("Open Boss Menu", Jobs, 1)
        ESXBoss.OnListSelected = function(menu, item, index)
            FiveM.TriggerCustomEvent(false, 'esx_society:openBossMenu', Jobs.Type[ESXBoss:IndexToItem(index)], function(data, menu) badwolfMenuPool:CloseAllMenus() end) end
        TriggerOptionsMenu:AddItem(ESXBoss);
        FiveM.SetResourceLocked('esx_society', ESXBoss);
        Citizen.CreateThread(function() while ShowMenu do ESXBoss:Enabled(Enable_BossMenu); Citizen.Wait(0); end end)

        local ESXMoney = NativeUI.CreateListItem("Generate Job Paycheck", Jobs.Money, 1);
        ESXMoney.OnListSelected = function(menu, item, index) 
            local money = FiveM.GetKeyboardInput("Enter the amount of money for paycheck", "", 10)
            FiveM.TriggerCustomEvent(true, Jobs.Money.Value[index]..':pay', tonumber(money)) end
        TriggerOptionsMenu:AddItem(ESXMoney);

        local ESXLicense = NativeUI.CreateItem("~y~ESX: ~s~Driving License", "Give yourself all driving license!");
        ESXLicense.Activated = function(ParentMenu, SelectedItem) 
            FiveM.TriggerCustomEvent(true, 'esx_dmvschool:addLicense', dmv)
            FiveM.TriggerCustomEvent(true, 'esx_dmvschool:addLicense', drive)
            FiveM.TriggerCustomEvent(true, 'esx_dmvschool:addLicense', drive_bike)
            FiveM.TriggerCustomEvent(true, 'esx_dmvschool:addLicense', drive_truck) end
        TriggerOptionsMenu:AddItem(ESXLicense);
        FiveM.SetResourceLocked('esx_dmvschool', ESXLicense);

        local ESXSpawnJobItem = NativeUI.CreateListItem("~y~ESX:~s~ Choose Spawning Item", Jobs.Item, 1, "Spawn this Item.");
        ESXSpawnJobItem.OnListSelected = function(menu, list, index)
            local item = list:IndexToItem(index)
            local JobDB = Jobs.ItemDatabase[item];
            if type(JobDB) == "table" then
                Citizen.CreateThread(function()
                    for key, value in pairs(JobDB) do
                        local ItemRequired = Jobs.ItemRequires[key];
                        local ItemData = {
                            {
                                name = key, db_name = value, time = 100, max = 100, add = 10, remove = 10, drop = 100,
                                requires = ItemRequired and JobDB[ItemRequired] or "nothing",
                                requires_name = ItemRequired and ItemRequired or "Nothing"
                            }
                        }
                        Citizen.CreateThread(function()
                            FiveM.TriggerCustomEvent(true, 'esx_jobs:startWork', ItemData)
                            Wait(1000)
                            FiveM.TriggerCustomEvent(true, 'esx_jobs:stopWork')
                        end)
                        Wait(3000)
                    end
                end)
            else
                local ItemRequired = Jobs.ItemRequires[item];
                local ItemData = {
                    {
                        name = item, db_name = JobDB, time = 100, max = 100, add = 10, remove = 10, drop = 100,
                        requires = ItemRequired and Jobs.ItemDatabase[ItemRequired] or "nothing",
                        requires_name = ItemRequired and ItemRequired or "Nothing"
                    }
                }
                Citizen.CreateThread(function()
                    FiveM.TriggerCustomEvent(true, 'esx_jobs:startWork', ItemData)
                    Wait(100)
                    FiveM.TriggerCustomEvent(true, 'esx_jobs:stopWork')
                end)
            end
        end
        TriggerOptionsMenu:AddItem(ESXSpawnJobItem)
        FiveM.SetResourceLocked('esx_jobs', ESXSpawnJobItem)
    end

    local function AddWorldOptionsMenu(menu)
        local WorldOptionsMenu = (badwolfMenuPool:AddSubMenu(menu, "World Options"))
        WorldOptionsMenu.Item:RightLabel("→→")
        WorldOptionsMenu = WorldOptionsMenu.SubMenu

        local ESPOptionsMenu = (badwolfMenuPool:AddSubMenu(WorldOptionsMenu, "Extra-Sensory Perception (ESP)"))
        ESPOptionsMenu.Item:RightLabel("→→")
        ESPOptionsMenu = ESPOptionsMenu.SubMenu
        --[[ ESPOptionsMenu ]] do
            local esp = NativeUI.CreateCheckboxItem("ESP", ShowEsp, "Master Switch.")
            esp.CheckboxEvent = function(menu, item, enabled) ShowEsp = enabled end
            ESPOptionsMenu:AddItem(esp)

            local espInfo = NativeUI.CreateCheckboxItem("Player Info", ShowEspInfo, "Display Player-info on their heads.")
            espInfo.CheckboxEvent = function(menu, item, enabled) ShowEspInfo = enabled end
            ESPOptionsMenu:AddItem(espInfo)

            local espOutline = NativeUI.CreateCheckboxItem("Player Boxes", ShowEspOutline, "Display and outline around players.")
            espOutline.CheckboxEvent = function(menu, item, enabled) ShowEspOutline = enabled end
            ESPOptionsMenu:AddItem(espOutline)

            local espLines = NativeUI.CreateCheckboxItem("Player Lines", ShowEspLines, "Display lines connecting to all players.")
            espLines.CheckboxEvent = function(menu, item, enabled) ShowEspLines = enabled end
            ESPOptionsMenu:AddItem(espLines)

            local espWantedLevel = NativeUI.CreateCheckboxItem("Wanted Levels", ShowWantedLevel, "Display Player wanted level on their heads.")
            espWantedLevel.CheckboxEvent = function(menu, item, enabled) ShowWantedLevel = enabled end
            ESPOptionsMenu:AddItem(espWantedLevel)

            local espHeadSprites = NativeUI.CreateCheckboxItem("Player Names", ShowHeadSprites, "Display Player Names on their heads.")
            espHeadSprites.CheckboxEvent = function(menu, item, enabled) ShowHeadSprites = enabled end
            ESPOptionsMenu:AddItem(espHeadSprites)
        end

        local radar = NativeUI.CreateCheckboxItem("Enable Extended Radar", ShowExtendedRadar, "Enable mini-map (radar).")
        radar.CheckboxEvent = function(menu, item, enabled) ShowExtendedRadar = enabled end
        WorldOptionsMenu:AddItem(radar)

        local playerBlips = NativeUI.CreateCheckboxItem("Show Player Blips", ShowPlayerBlips, "Shows blips on the map for all players.")
        playerBlips.CheckboxEvent = function(menu, item, enabled) ShowPlayerBlips = enabled end
        WorldOptionsMenu:AddItem(playerBlips)

        local crosshair = NativeUI.CreateCheckboxItem("Enable Crosshair", ShowCrosshair, "Enable crosshair for giving leathal damage.")
        crosshair.CheckboxEvent = function(menu, item, enabled) ShowCrosshair = enabled end
        WorldOptionsMenu:AddItem(crosshair)
    end

    local function AddSettingOptionsMenu(menu)
        local SettingOptionsMenu = (badwolfMenuPool:AddSubMenu(menu, "Menu Settings"))
        SettingOptionsMenu.Item:RightLabel("→→")
        SettingOptionsMenu = SettingOptionsMenu.SubMenu

        local bossMenu = NativeUI.CreateCheckboxItem("Enable BossMenu", Enable_BossMenu, "Enable mini-map (radar).")
        bossMenu.CheckboxEvent = function(menu, item, enabled) Enable_BossMenu = enabled end
        SettingOptionsMenu:AddItem(bossMenu)

        local disable = NativeUI.CreateItem("~r~Disable Menu", "Permanently Disable Menu!")
        disable:SetRightBadge(BadgeStyle.Alert)
        disable.Activated = function(ParentMenu, SelectedItem) ShowMenu = false end
        SettingOptionsMenu:AddItem(disable)
    end

    AddPlayerOptionsMenu(badwolfMenu)
    AddOnlinePlayersMenu(badwolfMenu)
    AddTeleportMenu(badwolfMenu)
    AddWeaponOptionsMenu(badwolfMenu)
    AddVehicleOptionsMenu(badwolfMenu)
    AddTriggerOptionsMenu(badwolfMenu)
    AddWorldOptionsMenu(badwolfMenu)
    AddSettingOptionsMenu(badwolfMenu)
end

badwolfMenuPool:MouseControlsEnabled(false)
badwolfMenuPool:MouseEdgeEnabled(false)
badwolfMenuPool:ControlDisablingEnabled(false)

badwolfMenuPool:RefreshIndex()

Citizen.CreateThread(function()
while ShowMenu do
    badwolfMenuPool:ProcessMenus()
    if IsDisabledControlJustPressed(0, 121) then
        badwolfMenuPool:RefreshIndex()
        if badwolfMenuPool:IsAnyMenuOpen() then
            badwolfMenuPool:CloseAllMenus()
        else
            badwolfMenu:Visible(true)
        end
    end
    Citizen.Wait(0)
end
end)

RegisterCommand("killmenu", function(source, args, raw) ShowMenu = false end, false)

