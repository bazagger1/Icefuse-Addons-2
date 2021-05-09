--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/shared/sh_player_extension.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local meta = FindMetaTable("Player")

function meta:GetDataVar(name)
	return SERVER and (self._Vars and self._Vars[name]) or self:GetNetVar(name)
end

function meta:GetGroupWeight()
	return self:GetDataVar("rank") and self:GetDataVar("rank").Weight or 0
end

function meta:IsAdmin()
	return self:GetDataVar("rank") and (self:GetDataVar("rank").Weight >= IcefuseAdmin.Config.IsAdmin)
end

function meta:IsSuperAdmin()
	return self:GetDataVar("rank") and (self:GetDataVar("rank").Weight >= IcefuseAdmin.Config.IsSuperAdmin)
end

function meta:GetUserGroup()
	return self:GetDataVar("rank") and self:GetDataVar("rank").Name or "user"
end

function meta:IsUserGroup(group)
	return self:GetUserGroup() == group
end

function meta:SetUserGroup() end -- Is there a (valid) reason to why this is disabled?

function meta:NameID()
	return self:Name() .. " (" .. self:SteamID() .. ")"
end

hook.Remove("PlayerInitialSpawn", "PlayerAuthSpawn")
