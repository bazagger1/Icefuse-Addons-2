--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bodily_functions/lua/autorun/sh_bathroom.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


if ( SERVER ) then
	AddCSLuaFile()
	AddCSLuaFile( 'cl_ebola.lua' )
	AddCSLuaFile( 'cl_bathroom.lua' )
end

hook.Add( "OnGamemodeLoaded", "Ice_OGL", function()

	/*
		Configuration options
	*/
	
	GAMEMODE.Config.max_pee_time	= 10 -- In seconds
	GAMEMODE.Config.peespeed 		= 5 -- Every 10 seconds, pee will increase by this much
	
	GAMEMODE.Config.poopspeed 		= 5 -- Every 10 seconds, shit will increase by this much
	
	GAMEMODE.Config.min_pee			= 25
	GAMEMODE.Config.min_poop		= 25

	GAMEMODE.Config.crap_time		= 60 -- After how many seconds to remove the poop entity?

	GAMEMODE.Config.ebola_scale		= 5 -- This extra percentage will be added based on the size of the crap
	GAMEMODE.Config.ebola_prob		= 25 -- % (Use an integer between 1 and 100)
	GAMEMODE.Config.ebola_die_range	= { 60, 180 } -- In seconds (1-3 minutes by default)

	GAMEMODE.Config.ebola_damage_range	= { 30, 60 } -- Every X seconds
	GAMEMODE.Config.ebola_damage = 5 -- How much should the damage be?

	/*
		DarkRP variables
	*/
	DarkRP.registerDarkRPVar( "Pee", net.WriteFloat, net.ReadFloat )
	DarkRP.registerDarkRPVar( "Poop", net.WriteFloat, net.ReadFloat )

	/*
		Chat commands
	*/
	DarkRP.declareChatCommand{
		command = "pee",
		description = "Take a pee!",
		delay = 1.5
	}
	DarkRP.declareChatCommand{
		command = "piss",
		description = "Take a pee!",
		delay = 1.5
	}
	DarkRP.declareChatCommand{
		command = "poo",
		description = "Take a poop!",
		delay = 1.5
	}
	DarkRP.declareChatCommand{
		command = "poop",
		description = "Take a poop!",
		delay = 1.5
	}
	
	if ( SERVER ) then
	
		include( 'sv_bathroom.lua' )
	else
	
		include( 'cl_ebola.lua' )
		include( 'cl_bathroom.lua' )
	end
end )