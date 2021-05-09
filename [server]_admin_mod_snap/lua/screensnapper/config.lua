--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_snap/lua/screensnapper/config.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

//
// Snapper
// Usage guidance
//

/*
	Chat command: !snap *<player name or SteamID> <quality>
	Chat command: !snapper
	Console command: snapper

	Navigate the snapper menu to view screenshots taken on the server, and save them to your data folder by clicking on them.
	Once a snap has been taken of a person, you will be prompted with a menu showing you the screenshot, giving you the ability to both save it locally and take another screenshot.

	You can choose whether or not you want to capture the steam overlay, and if you have any issues or are looking for some features that would be apparent to creation,
	please contact me and I will have a thought about it.

	Thanks for purchasing!
*/

//
// Snapper
// Config
//

snapper.config = {
	allowed_groups = {
		"c_e_o",
		"developer",
		
		"e_d",
		"d_o_p",
		"d_o_i",
		"d_o_a",
		
		"i_s",
		"p_s",
		"a_s",
		"advisor",
		
		"division_leader",
		"sector_lead",
		
		"head_administrator",
		"elite_administrator",
		"administrator",
	},

	-- Register your own in case this one does not work (screenshots taking too long to proccess)
	-- Make a user on https://imgur.com
	-- http://api.imgur.com/oauth2/addclient
	-- Visit that URL and replace this with your Client-ID
	clientid = "Client-ID fb3f5adeaac6d25",
	

	-- Table containing the usergroups that are allowed to use Snapper
	-- You can replace this with a function if you want your own code to determine this.
	--[[
	allowed_groups = function(ply)
		if ply:IsIncredibleAdmin() then
			return true
		end

		return false
	end,
	]]

	command = "!snap",
	-- Command to use snapper
	-- Example: !snap <player> <quality>

	menucommand = "!snapper",
	-- Command to open the snap menu
	-- Example: !snapper
	-- Console command: snapper

	color = {0, 150, 255},
	-- Primary color to use
	-- red, green, blue

	capture_steam = false,
	-- Whether or not to capture the Steam overlay as well, if you don't want to "breach their privary" disable this.

	default_quality = 70,
	-- What quality to use by default, the higher the more time it's going to take to send the screenshots.
	-- Recommended: 70

	anticheat = true,
	-- Whether to enable a small anti-cheat to check if the clients are bypassing the screenshot features

	punishment = function(ply)
		ply:ChatPrint("Avoiding capture of in-game screen.")
	end,
	-- A function for you to change when a player does get detected
	-- They bare basically detouring the render.Capture function to return false images, bypassing this tool
	-- Use this to ban/kick/warn admins/ appropiately with your own administration tool.
}