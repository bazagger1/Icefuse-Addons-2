--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/_doors.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local function initialize()
	
	local EntityMeta = FindMetaTable('Entity')

	--------------------------------------------------

	local DOOR_CLASSES = {
		['func_door'] = true,
		['func_door_rotating'] = true,
		['prop_door_rotating'] = true,
		['func_movelinear'] = true,
		['prop_dynamic'] = true,
	}

	--[[
	- @return bool
	]]
	function EntityMeta:isKeysOwnable()
		local class = self:GetClass()
		
		if class == 'func_door' or class == 'func_door_rotating' or class == 'prop_door_rotating' then
			return true
		end
		
		if self:IsVehicle() and GAMEMODE.Config.allowvehicleowning == true and self:GetParent():IsVehicle() == false then
			return true
		end
		
		-- if ((class == "func_door" or class == "func_door_rotating" or class == "prop_door_rotating") or
				-- (GAMEMODE.Config.allowvehicleowning and self:IsVehicle() and (not IsValid(self:GetParent()) or not self:GetParent():IsVehicle()))) then
				-- return true
			-- end
			
		return false
	end

	--[[
	- @return bool
	]]
	function EntityMeta:isDoor()
		return DOOR_CLASSES[self:GetClass()] == true
	end

	--[[
	- @return bool
	]]
	function EntityMeta:isKeysOwned()
		return IsValid(self:getDoorOwner()) == true
	end

end
hook.Add('PostGamemodeLoaded', '_bp_door', initialize)