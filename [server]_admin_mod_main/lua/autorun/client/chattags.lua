--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/autorun/client/chattags.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-----------------------------------------------------------------------------------------------------------
-- Chattags
-----------------------------------------------------------------------------------------------------------
local tags = {

-- 	['CHANGE'] = {Color(255,255,255), '[', Color(102,204,255), 'CHANGE', Color(255,255,255), ']'},
-----------------------------------------------------------------------------------------------------------------------
--                           Executive ranks [29B8FF]
-----------------------------------------------------------------------------------------------------------------------
	['c_e_o'] = {Color(255,255,255), '[', Color(255,128,0), 'C.E.O', Color(255,255,255), '] '},
	['e_d'] = {Color(255,255,255), '[', Color(247, 4, 4), 'E.D', Color(255,255,255), '] '},	
	
	['d_o_i'] = {Color(255,255,255), '[', Color(247, 4, 4), 'D.O.I', Color(255,255,255), '] '},
	['d_o_p'] = {Color(255,255,255), '[', Color(51,51,255), 'D.O.P', Color(255,255,255), '] '},
	['d_o_a'] = {Color(255,255,255), '[', Color(0,153,0), 'D.O.A', Color(255,255,255), '] '},
	
	['i_s'] = {Color(255,255,255), '[', Color(181, 16, 16), 'I.S', Color(255,255,255), '] '},
	['p_s'] = {Color(255,255,255), '[', Color(102,102,255), 'P.S', Color(255,255,255), '] '},
	['a_s'] = {Color(255,255,255), '[', Color(102,204,0), 'A.S', Color(255,255,255), '] '},
	['advisor'] = {Color(255,255,255), '[', Color(204,204,0), 'Advisor', Color(255,255,255), '] '},
	
	['developer'] = {Color(255,255,255), '[', Color(255,51,255), 'Developer', Color(255,255,255), '] '},
	
	['division_leader'] = {Color(255,255,255), '[', Color(255,0,255), 'Division Leader', Color(255,255,255), '] '},
 	['sector_lead'] = {Color(255,255,255), '[', Color(255,51,51), 'Sector Lead', Color(255,255,255), '] '}, 
  
-----------------------------------------------------------------------------------------------------------------------
--                           Game Server Staff Ranks
-----------------------------------------------------------------------------------------------------------------------
	['head_administrator'] = {Color(255,255,255), '[', Color(255,255,102), 'Head Administrator', Color(255,255,255), '] '},
	['elite_administrator'] = {Color(255,255,255), '[', Color(255,255,102), 'Elite Administrator', Color(255,255,255), '] '},
	['administrator'] = {Color(255,255,255), '[', Color(255,255,102), 'Administrator', Color(255,255,255), '] '},
	['senior_moderator'] = {Color(255,255,255), '[', Color(255,51,51), 'Senior Moderator', Color(255,255,255), '] '},
	['moderator'] = {Color(255,255,255), '[', Color(153,153,255), 'Moderator', Color(255,255,255), '] '},
	['trial_mod'] = {Color(255,255,255), '[', Color(102,255,102), 'Trial Mod', Color(255,255,255), '] '},
	
-----------------------------------------------------------------------------------------------------------------------
--                           Store Purchased Ranks
-----------------------------------------------------------------------------------------------------------------------
	['champion'] = {Color(255,255,255), '[', Color(102,230,255), 'Champion', Color(255,255,255), '] '},     -- Diamond Blue
	['supervisor'] = {Color(255,255,255), '[', Color(92,255,133), 'Supervisor', Color(255,255,255), '] '},  -- Light Green?
 	['legend'] = {Color(255,255,255), '[', Color(166,77,255), 'Legend', Color(255,255,255), '] '},          -- Purple
 	['loyal'] = {Color(255,255,255), '[', Color(15,135,255), 'Loyal', Color(255,255,255), '] '},            -- Blue dark
 	['supporter'] = {Color(255,255,255), '[', Color(209,209,0), 'Supporter', Color(255,255,255), '] '},     -- Gold
 	['patron'] = {Color(255,255,255), '[', Color(163,163,163), 'Patron', Color(255,255,255), ']'},          -- Silver     
 	['subscriber'] = {Color(255,255,255), '[', Color(235,156,0), 'Subscriber', Color(255,255,255), '] '}    -- Bronze
}
-----------------------------------------------------------------------------------------------------------------------







-- Do no edit below
-- Do the hack do the hack
local function AddToChat(bits)

	local prefixColor = Color(net.ReadUInt(8), net.ReadUInt(8), net.ReadUInt(8))
	local prefix = net.ReadString()
	local ply = net.ReadEntity()
	local textColor = Color(net.ReadUInt(8), net.ReadUInt(8), net.ReadUInt(8))
	local text = net.ReadString()

	ply = IsValid(ply) and ply or LocalPlayer()


	local tab = {}

	table.insert(tab, prefixColor)

	-- So.. Since DarkRP likes to be a pain in the ass for other developers trying to create "custom" things.
	-- The prefix consists out of the chat type and player name in one string e.g. (OOC) PlayerName
	-- Since we want to insert the chat tag in between those two.. We (sadly) have to do some hacky shit.

	prefix = prefix:gsub(ply:Nick(), ''):gsub(ply:Name(), '')
	table.insert(tab, prefix)

	if text == '' then
		-- This is the case for /me
		
		-- Insert the player name before the prefix
		table.insert(tab, 1, team.GetColor(ply:Team()))
		table.insert(tab, 2, ply:Name())
		
	else
		
		local tag = tags[ply:GetUserGroup()]
		if tag then
			for k, v in ipairs(tag) do
				table.insert(tab, v)
			end
		end

		table.insert(tab, team.GetColor(ply:Team()))
		table.insert(tab, ply:Name())
		table.insert(tab, textColor)
		table.insert(tab, ': ' .. text)
		
	end

	chat.AddText(unpack(tab))
	chat.PlaySound()
  
end


timer.Simple(0, function()
	net.Receive("DarkRP_Chat", AddToChat)
end)