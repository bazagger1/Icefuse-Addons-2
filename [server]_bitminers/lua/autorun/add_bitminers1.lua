--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bitminers/lua/autorun/add_bitminers1.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

//=======================================================================//
--                          Bitminers
//=======================================================================//
hook.Add("PostGamemodeLoaded", "BM1.SetupEntities", function()



-----------------------------------------------------------------------------------------
	DarkRP.createCategory{
		name = "Bitminers",
		categorises = "entities",
		startExpanded = true,
		color = Color(120, 120, 255, 255),
		sortOrder = 1,
	}

      
      
      
//=======================================================================//
--                   Bitminers Added to F4 menu
//=======================================================================//

---------------------------------------------------------------------
DarkRP.createEntity("Miner Light", {
	ent = "bit_miner_light",
	model = "models/BITMINER/BitMinerLight.mdl",
	price = 1500,
	max = 4,
	cmd = "MinerLight",
	sortOrder = 10,
	allowed = {TEAM_BLACKHAT_HACKER, TEAM_PRO_HACKER},
	category = "Bitminers"
})
---------------------------------------------------------------------
DarkRP.createEntity("Miner Standard", {
	ent = "bit_miner_medium",
	model = "models/BITMINER/BitMinerMedium.mdl",
	price = 3500,
	max = 2,
	cmd = "MinerStandard",
	sortOrder = 20,
	allowed = {TEAM_BLACKHAT_HACKER, TEAM_PRO_HACKER},
	category = "Bitminers"
})
---------------------------------------------------------------------
DarkRP.createEntity("Miner Pro", {
	ent = "bit_miner_heavy",
	model = "models/BITMINER/BitMinerHeavy.mdl",
	price = 5500,
	max = 1,
	cmd = "MinerPro",
	sortOrder = 30,
	allowed = {TEAM_BLACKHAT_HACKER, TEAM_PRO_HACKER},
	category = "Bitminers"
})
---------------------------------------------------------------------
end)