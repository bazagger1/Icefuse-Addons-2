--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseAdmin = IcefuseAdmin or {
	Config = {},
	Alias = "IcefuseAdmin",
	Version = "1.6 (Psyche)",
}

IcefuseAdmin.IncludeSV = (SERVER) and include or function() end
IcefuseAdmin.IncludeCL = (SERVER) and AddCSLuaFile or include
IcefuseAdmin.IncludeSH = function(path) IcefuseAdmin.IncludeSV(path) IcefuseAdmin.IncludeCL(path) end

IcefuseAdmin.IncludeSH "icefuse_admin_misc.lua"
IcefuseAdmin.IncludeSH "util.lua"

print "\n\n"
IcefuseAdmin.Print("This server runs " .. IcefuseAdmin.Alias .. " " .. IcefuseAdmin.Version .. "\n\n")

if (SERVER) then
	IcefuseAdmin.IncludeSV "icefuse_admin_mysql.lua"
	if IcefuseAdmin.Config.hostname == "1.2.3.4" then -- for the dev server
		IcefuseAdmin.IncludeSV "icefuse_admin_mysql_dev.lua"
	end
	IcefuseAdmin.IncludeSV "icefuse_admin/server/mysql/sv_init.lua"
end

local Files, Folders
if (SERVER) then
	IcefuseAdmin.Print("Parsing serverside files")
	Files, Folders = file.Find("icefuse_admin/server/*.lua", "LUA")
	for k, v in ipairs(Files) do
		IcefuseAdmin.Print(" | " .. v)
		IcefuseAdmin.IncludeSV("icefuse_admin/server/" .. v)
	end
end

IcefuseAdmin.IncludeSH "icefuse_admin_ranks.lua"

IcefuseAdmin.Print("Parsing clientside files")
Files, Folders = file.Find("icefuse_admin/client/*.lua", "LUA")
for k, v in ipairs(Files) do
	IcefuseAdmin.Print(" | " .. v)
	IcefuseAdmin.IncludeCL("icefuse_admin/client/" .. v)
end

IcefuseAdmin.Print("Parsing shared files")
Files, Folders = file.Find("icefuse_admin/shared/*.lua", "LUA")
for k, v in ipairs(Files) do
	IcefuseAdmin.Print(" | " .. v)
	IcefuseAdmin.IncludeSH("icefuse_admin/shared/" .. v)
end

IcefuseAdmin.Print("Scripts loaded. Initializing when GM is ready.")
print "\n\n"

hook.Add("Initialize", "IcefuseAdmin.Initialize", function() hook.Call("IcefuseAdmin_Initialize", GAMEMODE) end)