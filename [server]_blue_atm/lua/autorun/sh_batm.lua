--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_atm/lua/autorun/sh_batm.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--Id's used via net message to identify the message type
BATM_NET_COMMANDS = {
	--Client to server
	selectAccount = 1,
	deposit       = 2,
	withdraw      = 3,
	transfer      = 4,
	kickUser      = 5,
	addUser       = 6,

	--Server to client
	receiveAccountInfo = 50,
}

timer.Simple(0.01, function()
	DarkRP.createEntity("Chip 'n' Pin", {
		ent = "atm_reader",
		model = "models/bluesatm/atm_reader.mdl",
		price = 500,
		max = 8,
		cmd = "buychpnpin",
	})
end)
 