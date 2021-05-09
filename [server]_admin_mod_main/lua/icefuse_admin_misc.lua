--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin_misc.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseAdmin.Config.MoTD = "https://docs.google.com/document/d/1NLCq9pIk-UCvTSUKGDrpP6u1qCGVDr9HLxUVnPEdB3U/edit"
IcefuseAdmin.Config.Adverts = {
---------------------------------------------------------------------------------------------------------------------------------
	{
		Time = 500,
		Reps = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " Thanks for playing Icefuse Networks!"},
	},
---------------------------------------------------------------------------------------------------------------------------------
	{
		Time = 700,
		Repos = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " Use /cmd, /commands, /help, /player, /server, or /readme to view available commands and information."},
},
---------------------------------------------------------------------------------------------------------------------------------
	{
		Time = 900,
		Repos = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " Type @, /ticket, /report, /rep, or simply press F11 to communicate with administrators and/or create reports!"},
	},
---------------------------------------------------------------------------------------------------------------------------------
	{
		Time = 1100,
		Repos = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " Looking to report a user or staff member? Use our forums at www.icefuse.net"},
	},
---------------------------------------------------------------------------------------------------------------------------------
	{
		Time = 1500,
		Repos = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " Join the community today by signing up on our forums at www.icefuse.net"},
	},
---------------------------------------------------------------------------------------------------------------------------------
	{
		Time = 1700,
		Repos = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " This server reboots once a day at 6 AM EST (10 AM UTC), be sure to save your things!"},
	},
---------------------------------------------------------------------------------------------------------------------------------

  {
		Time = 1900,
		Repos = 0,
		Message = {Color(204,0,51), "[Server]",  Color(255,255,255), " Reference /rules at any time for the current policies. Roleplay questions? Type: /rules"},
  }
}---------------------------------------------------------------------------------------------------------------------------------


IcefuseAdmin.Config.IgnoreChatCommands = {
"mcon",
"pcon",
"cardealer",
"caradmin",
"logs",
"whitelist",
"snap",
"snapper",
"spectate",
---------------------------- PSYCHE: CREATE HIT COMMANDS: START
"requesthit",
"placehit",
"hit",
"kill",
"killer",
"die",
"bounty",
"avadakedavra",
"death",
"karma",
"revenge",
"pos",
"pieceofshit",
"sob",
"sonofabitch",
"mf",
"motherfucker",
"fuckyou",
"campbell",
"harrelson",
"flannery",
"engleman",
"kuklinski",
"iceman",
"liamneeson",
"bryanmills",
"solonik",
"agent47",
"47",
"terminator",
"driveby",
"oof",
"contract",
"redrum",
"murder",
"murderer",
"homicide",
"target",
"rip",
---------------------------- PSYCHE: ACTIVE HITS MENU COMMANDS: START
"hits",
"agency",
"hitlist",
"contracts",
"bounties",
"targets",
"killlist",
"deathlist",
"hitmenu",
"hitsmenu",
---------------------------- PSYCHE: ACTIVE HITS MENU COMMANDS: END
"hitmanbypass",
"hitbypass",
"hitsbypass",
---------------------------- PSYCHE: CANCEL HIT COMMANDS: FUCKING MAGICAL +++1 ;)
"abort",
"abortmission",
"aborttarget",
"aborthit",
"abortcontract",
"abortbounty",
"cancel",
"cancelmission",
"canceltarget",
"cancelhit",
"cancelcontract",
"cancelbounty",
"giveup",
---------------------------- PSYCHE: EXTRA COMMANDS FOR FAST, EASY TARGET SWITCHING TOO ;)
"change",
"changemission",
"changetarget",
"changehit",
"changecontract",
"changebounty",
"switch",
"switchmission",
"switchtarget",
"switchhit",
"switchcontract",
"switchbounty",
"new",
"newmission",
"newtarget",
"newhit",
"newcontract",
"newbounty",
---------------------------- PSYCHE: EXTRA COMMANDS FOR TARGET SWITCHING: END
"map",
"donate"
}


----------------------------------------------------------------
IcefuseAdmin.Config.Limits = {
	['c_e_o'] = {
		vehicles 	= 9999,
		effects 	= 9999,
		npcs 		= 9999,
		ragdolls 	= 9999,
		props 		= 9999,
		sents 		= 9999,
	},
----------------------------------------------------------------
	['e_d'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['d_o_p'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['d_o_i'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['d_o_a'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['i_s'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['p_s'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['a_s'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['advisor'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 9999,
		sents 		= 0,
	},
----------------------------------------------------------------
	['division_leader'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 200,
		sents 		= 0,
	},
----------------------------------------------------------------
	['sector_lead'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 200,
		sents 		= 0,
	},
-- ######################################################################################
----------------------------------------------------------------
	['head_administrator'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 200,
		sents 		= 0,
	},
----------------------------------------------------------------
	['elite_administrator'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 200,
		sents 		= 0,
	},
----------------------------------------------------------------
	['administrator'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 50,
		ragdolls 	= 0,
		props 		= 85,
		sents 		= 0,
	},
----------------------------------------------------------------
	['senior_moderator'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 85,
		sents 		= 0,
	},
----------------------------------------------------------------
	['moderator'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 85,
		sents 		= 0,
	},
----------------------------------------------------------------
	['trial_mod'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 35,
		sents 		= 0,
	},
-- ######################################################################################
----------------------------------------------------------------
	['champion'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 85,
		sents 		= 0,
	},
----------------------------------------------------------------
	['supervisor'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 65,
		sents 		= 0,
	},
----------------------------------------------------------------
	['legend'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 65,
		sents 		= 0,
	},
----------------------------------------------------------------
	['loyal'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 55,
		sents 		= 0,
	},
----------------------------------------------------------------
	['supporter'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 50,
		sents 		= 0,
	},
----------------------------------------------------------------
	['patron'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 45,
		sents 		= 0,
	},
----------------------------------------------------------------
	['subscriber'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 40,
		sents 		= 0,
	},
-- ######################################################################################
----------------------------------------------------------------
	['member'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 35,
		sents 		= 0,
	},
----------------------------------------------------------------
	['user'] = {
		vehicles 	= 0,
		effects 	= 0,
		npcs 		= 0,
		ragdolls 	= 0,
		props 		= 15,
		sents 		= 0,
	},
}
----------------------------------------------------------------

--
-- Message that the banned person will get.
--
IcefuseAdmin.Config.BanMessage = function(reason, time, length, bannedBy)
	
	local message = {
		"________ You are banned _______________",
		"\n\n"
	}
	
	if bannedBy then -- We only know this at the moment the player is banned
		message[#message + 1] = "You have been banned by "
		message[#message + 1] = bannedBy
	else -- No point in showing this when the player was banned at that moment
		message[#message + 1] = "You have been banned on "
		message[#message + 1] = os.date('%d/%m/%Y %H:%M', time)
	end
	
	message[#message + 1] = " with the following reason: '"
	message[#message + 1] = reason
	message[#message + 1] = "'\n\n"
	
	if length == 0 then
		message[#message + 1] = "You were banned permanently and will not be unbanned automatically."
	else
		message[#message + 1] = "You will be automatically unbanned on "
		message[#message + 1] = os.date('%d/%m/%Y %H:%M', time + length)
	end
	
	return table.concat(message, "")
end