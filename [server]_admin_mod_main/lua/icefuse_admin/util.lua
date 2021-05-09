--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/util.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

function IcefuseAdmin.Print(Text)
	print(IcefuseAdmin.Alias .. " | " .. Text)
end

function IcefuseAdmin.IsEmpty(vector, ignore)
    ignore = ignore or {}

    local point = util.PointContents(vector)
    local a = point ~= CONTENTS_SOLID
        and point ~= CONTENTS_MOVEABLE
        and point ~= CONTENTS_LADDER
        and point ~= CONTENTS_PLAYERCLIP
        and point ~= CONTENTS_MONSTERCLIP
    if not a then return false end

    local b = true

    for k,v in pairs(ents.FindInSphere(vector, 35)) do
        if (v:IsNPC() or v:IsPlayer() or v:GetClass() == "prop_physics" or v.NotEmptyPos) and not table.HasValue(ignore, v) then
            b = false
            break
        end
    end

    return a and b
end

function IcefuseAdmin.FindEmptyPos(pos, ignore, distance, step, area)
    if IcefuseAdmin.IsEmpty(pos, ignore) and IcefuseAdmin.IsEmpty(pos + area, ignore) then
        return pos
    end

    for j = step, distance, step do
        for i = -1, 1, 2 do -- alternate in direction
            local k = j * i

            -- Look North/South
            if IcefuseAdmin.IsEmpty(pos + Vector(k, 0, 0), ignore) and IcefuseAdmin.IsEmpty(pos + Vector(k, 0, 0) + area, ignore) then
                return pos + Vector(k, 0, 0)
            end

            -- Look East/West
            if IcefuseAdmin.IsEmpty(pos + Vector(0, k, 0), ignore) and IcefuseAdmin.IsEmpty(pos + Vector(0, k, 0) + area, ignore) then
                return pos + Vector(0, k, 0)
            end

            -- Look Up/Down
            if IcefuseAdmin.IsEmpty(pos + Vector(0, 0, k), ignore) and IcefuseAdmin.IsEmpty(pos + Vector(0, 0, k) + area, ignore) then
                return pos + Vector(0, 0, k)
            end
        end
    end

    return pos
end


function IcefuseAdmin.FindPlayer(info, begin)
	if not info or info == "" then return nil end
	local pls = player.GetAll()

	for k = 1, #pls do -- Proven to be faster than pairs loop.
		local v = pls[k]
		if tonumber(info) == v:UserID() then
			return v
		end

		if info == v:SteamID() then
			return v
		end
	
		local findname = string.find(string.lower(v:SteamName()), string.lower(tostring(info)), 1, true) 
		if (begin and findname and findname == 1) or (!begin and findname) then
			return v
		end

		findname = string.find(string.lower(v:Name()), string.lower(tostring(info)), 1, true)
		if (begin and findname and findname == 1) or (!begin and findname) then
			return v
		end
	end
	return nil
end

function IcefuseAdmin.WordWrap(font, text, width)
	if (!CLIENT) then return {} end
	surface.SetFont(font)
	
	local sw, sh = surface.GetTextSize(" ")
	local ret = {}
	
	local w = 0
	local s = ""
	for i, l in pairs(string.Explode("\n", text, false)) do
		for k, v in pairs(string.Explode(" ", l)) do
			local neww = surface.GetTextSize(v)
			
			if (w + neww >= width) then
				table.insert(ret, s)
				w = neww + sw
				s = v .. " "
			else
				s = s .. v .. " "
				w = w + neww + sw
			end
		end
		table.insert(ret, s)
		w = 0
		s = ""
	end
	
	table.insert(ret, s)
	
	return ret
end