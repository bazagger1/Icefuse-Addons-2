--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin_ranks.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- APB RANKS
-- Usage: name, weight(1 - 255), flags, global
if (SERVER) then
-----------------------------------------------------------------------------------
--                         Executives
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("c_e_o", 255, "*", true)
	IcefuseAdmin.Ranks.Register("developer", 255, "*", true)

-----------------------------------------------------------------------------------
--                         Board of Directors
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("e_d", 160, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("d_o_p", 150, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("d_o_i", 145, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("d_o_a", 145, "VTMPAS", true)

-----------------------------------------------------------------------------------
--                            Supervisors
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("i_s", 140, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("p_s", 140, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("a_s", 140, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("advisor", 135, "VTMPAS", true)

-----------------------------------------------------------------------------------
--                            High Staff
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("division_leader", 130, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("sector_lead", 125, "VTMPAS", true)

-----------------------------------------------------------------------------------
--                            Base Staff
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("head_administrator", 120, "VTMPAS", true)
	IcefuseAdmin.Ranks.Register("elite_administrator", 110, "VTMPA", true)
	IcefuseAdmin.Ranks.Register("administrator", 100, "VTMPA", true)
	IcefuseAdmin.Ranks.Register("senior_moderator", 90, "VTMP", true)
	IcefuseAdmin.Ranks.Register("moderator", 70, "VTM", true)
	IcefuseAdmin.Ranks.Register("trial_mod", 50, "VT", true)

-----------------------------------------------------------------------------------
--                            VIP/Donator Ranks
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("champion", 1, "", true)
	IcefuseAdmin.Ranks.Register("legend", 1, "", true)
	IcefuseAdmin.Ranks.Register("loyal", 1, "", true)
	IcefuseAdmin.Ranks.Register("supporter", 1, "", true)
	IcefuseAdmin.Ranks.Register("patron", 1, "", true)
	IcefuseAdmin.Ranks.Register("subscriber", 1, "", true)

-----------------------------------------------------------------------------------
--                            General/Free Ranks
-----------------------------------------------------------------------------------
	IcefuseAdmin.Ranks.Register("user", 1, "", true)
	IcefuseAdmin.Ranks.Register("member", 1, "", true)
end

--------------------------------------------------------------------------------------------------------------
--                            CONFIGURATION
--------------------------------------------------------------------------------------------------------------
-- These are used to determine what ranks IsAdmin and IsAdmin IsSuperAdmin return true on
-- For example if you make one of these 50, any rank with 50 immunity or more will return true

IcefuseAdmin.Config.IsAdmin 		= 110
IcefuseAdmin.Config.IsSuperAdmin    = 250

-- Misc Ranks config
IcefuseAdmin.Config.PlayerNoClip    = 90
IcefuseAdmin.Config.PlayerPhysgun   = 90