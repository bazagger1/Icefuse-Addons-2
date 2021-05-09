--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_atm/lua/batm_scenes/cursor.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--[[-------------------------------------------------------------------------
Draws the cursor
---------------------------------------------------------------------------]]

local scene = {}
local cursor = Material("bluesatm/cursor.png","noclamp smooth")

--Called when the scene is loaded
function scene.Load(ent)
 
end
  
--Draw code
function scene.Draw(ent, ScrW, ScrH) 
	surface.SetMaterial(cursor)
	surface.SetDrawColor(Color(40, 40, 40, 150))
	surface.DrawTexturedRect(ent.cursor.x + 8, ent.cursor.y + 8, 64, 64)
	surface.SetDrawColor(Color(200, 200, 200))
	surface.DrawTexturedRect(ent.cursor.x, ent.cursor.y, 64, 64)
end

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when a the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "cursor")

