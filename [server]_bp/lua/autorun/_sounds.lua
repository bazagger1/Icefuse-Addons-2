--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/_sounds.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local SOUND_MODIFICATIONS = {
	
	-- Crowbar
	['Weapon_Crowbar.Single'] = {
		level = 70
	},
	['Weapon_Crowbar.Melee_Hit'] = {
		level = 70
	},
	['Weapon_Crowbar.Melee_HitWorld'] = {
		level = 65
	},
	
	-- Toolgun (Airboat gun)
	['Airboat.FireGunRevDown'] = {
		level = 70
	},
	
	-- PhysCannon
	['Weapon_PhysCannon.Pickup'] = {
		level = 70
	},
	['Weapon_PhysCannon.Drop'] = {
		level = 70
	},
	
}

for name, optionsToMerge in pairs(SOUND_MODIFICATIONS) do
	
	local options = sound.GetProperties(name)
	
	if options == nil then
		continue
	end
	
	table.Merge(options, optionsToMerge)
	sound.Add(options)
	
end