--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bank_vault/lua/entities/money_bag/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")
include("autorun/shared/bank_config.lua")

surface.CreateFont("bag_3d2d", {
	font = "DermaLarge",
	size = BANK_CONFIG.BagStringSize
})

function ENT:Draw()
	self:DrawModel()

	local pos = self:GetPos()
	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Forward(), 90)

	cam.Start3D2D(pos + ang:Up() * 4.2, ang, .06)
		draw.SimpleTextOutlined(string.format(BANK_CONFIG.BagString, BANK_CONFIG.Distance - math.Round(self:GetVaultPos():Distance(self:GetPos()) / 53)), "bag_3d2d", 0, 0, BANK_CONFIG.BagStringColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color(0, 0, 0, 255)) //76561198253220777
	cam.End3D2D()

	ang:RotateAroundAxis(ang:Forward(), 180)
	ang:RotateAroundAxis(ang:Up(), 180)

	cam.Start3D2D(pos + ang:Up() * 4.3, ang, .06)
		draw.SimpleTextOutlined("$"..string.Comma(self:GetMoney()), "bag_3d2d", 0, 0, BANK_CONFIG.BagStringColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color(0, 0, 0, 255))
	cam.End3D2D()
end