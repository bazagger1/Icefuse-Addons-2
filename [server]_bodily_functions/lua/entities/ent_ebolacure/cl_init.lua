--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bodily_functions/lua/entities/ent_ebolacure/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")

function ENT:Draw()

    self:DrawModel()
	
	local pos = self:GetPos()
	
	if ( LocalPlayer():GetPos():Distance( pos ) < 300 ) then
	
		local ang = self:GetAngles()
		
		cam.Start3D2D( pos + Vector( 0, 0, 15 ) + ang:Up(), Angle( 0, ( CurTime() * 200 ) % 360, 90 ), 0.2 )
			draw.SimpleTextOutlined( "Ebola Medication", "Default", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black )
		cam.End3D2D()
		
		cam.Start3D2D( pos + Vector( 0, 0, 15 ) + ang:Up(), Angle( 0, ( ( CurTime() * 200 ) % 360 ) - 180, 90 ), 0.2 )
			draw.SimpleTextOutlined( "Ebola Medication", "Default", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black )
		cam.End3D2D()
	end
end