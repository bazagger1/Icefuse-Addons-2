--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/shared/sh_time.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseAdmin.Time = IcefuseAdmin.Time or {}

function IcefuseAdmin.Time.FormatTime(pl, global)
	local t
		
	if (global) then t = pl:GetDataVar("timePlayed") or pl:GetDataVar(IcefuseAdmin.Time.DataVar)
	else t = pl:GetDataVar(IcefuseAdmin.Time.DataVar) end

	if (!t) then return "N/A" end
		
	t = t + (CurTime() - pl:GetDataVar("joinTime"))
		
	local hours = math.floor(t / 3600)
	local minutes = math.floor((t % 3600) / 60)
	local seconds = math.floor(t - (hours * 3600) - (minutes * 60))
		
	if (minutes < 10) then minutes = "0" .. minutes end
	if (seconds < 10) then seconds = "0" .. seconds end
		
	return (hours .. ":" .. minutes .. ":" .. seconds)
end