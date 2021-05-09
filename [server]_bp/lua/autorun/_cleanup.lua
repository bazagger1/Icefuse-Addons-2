--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/_cleanup.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

hook.Add('PreGamemodeLoaded', '_bp_cleanup', function()
	
	if SERVER then
		
		concommand.Remove('gmod_admin_cleanup')
		
	end
	
	if CLIENT then
	
		local func = hook.GetTable()['PopulateToolMenu']['PopulateUtilityMenus']
		hook.Add('PopulateToolMenu', 'PopulateUtilityMenus', function()
			func()
			
			local menu = spawnmenu.GetToolMenu('Utilities')
			for k, category in ipairs(menu) do
				if category.ItemName == 'Admin' then
					table.remove(menu, k)
					
					break
				end
			end
			
		end)
		
	end
	
end)