--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bank_vault/lua/entities/vault_money/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")
include("autorun/shared/bank_config.lua")
local restrictedIcon = Material("materials/icons/restricted.png", "unlitgeneric")

surface.CreateFont("bank_3d2d", {
	font = "DermaLarge",
	size = BANK_CONFIG.BankStringSize
}) 

//Function for checking if someone can rob 76561198253220777
local function isAllowedToRob()
	local cops = 0

	for k, v in pairs(player.GetAll()) do
		if BANK_CONFIG.CopJobs[team.GetName(v:Team())] then
			cops = cops + 1
		end
	end
	
	return cops >= BANK_CONFIG.MinCopJobs, cops
end

local g_grds, g_wgrd, g_sz
function draw.GradientBox(x, y, w, h, al, ...)
	g_grds = {...}
	al = math.Clamp(math.floor(al), 0, 1)
	if(al == 1) then
		local t = w
		w, h = h, t
	end
	g_wgrd = w / (#g_grds - 1)
	local n
	//76561198253220777
	for i = 1, w do
		for c = 1, #g_grds do
			n = c
			if(i <= g_wgrd * c) then break end
		end
		g_sz = i - (g_wgrd * (n - 1))
		surface.SetDrawColor(
			Lerp(g_sz/g_wgrd, g_grds[n].r, g_grds[n + 1].r),
			Lerp(g_sz/g_wgrd, g_grds[n].g, g_grds[n + 1].g),
			Lerp(g_sz/g_wgrd, g_grds[n].b, g_grds[n + 1].b),
			Lerp(g_sz/g_wgrd, g_grds[n].a, g_grds[n + 1].a))
		if(al == 1) then surface.DrawRect(x, y + i, h, 1)
		else surface.DrawRect(x + i, y, 1, h) end
	end
end

local function paintBar(x, y, w, h, border, color, value)
	local darkColor = Color(color.r / 1.8, color.g / 1.8, color.b / 1.8)

	local emptyColor = Color(color.r * 0.6, color.g * 0.6, color.b * 0.6)
	local darkEmptyColor = Color(emptyColor.r / 1.8, emptyColor.g / 1.8, emptyColor.b / 1.8)

	surface.SetDrawColor(border)
	surface.DrawOutlinedRect(x, y, w, h)

	x = x + 1
	y = y + 1
	w = w - 2
	h = h - 2

	surface.SetDrawColor(emptyColor)
	surface.DrawRect(x, y, w, h / 2)

	draw.GradientBox(x, y + h / 2 - 1, w, h / 2, 1, emptyColor, darkEmptyColor)

	local width = w * math.Clamp(value, 0, 1)

	surface.SetDrawColor(color)
	surface.DrawRect(x, y, width, h / 2)

	draw.GradientBox(x, y + h / 2 - 1, width, h / 2, 1, color, darkColor)
end

ENT.smooth = 0
ENT.progressSmooth = 0

local function jobCanRob()
	if(table.Count(BANK_CONFIG.AllowedJobs) > 0) || BANK_CONFIG.CopJobs[team.GetName(LocalPlayer():Team())] then
		if(!BANK_CONFIG.AllowedJobs[team.GetName(LocalPlayer():Team())]) then
			return false //76561198253220777
		else return true end
	else return true end
end

function ENT:Draw()
	self:DrawModel()

	local allowed, copCount = isAllowedToRob()

	local pos = self:GetPos()
	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)

	local y = -1250

	cam.Start3D2D(pos + ang:Up(), ang, .06)
		if allowed and self:GetCooldown() == 0 and jobCanRob() then
			draw.SimpleTextOutlined(string.format(BANK_CONFIG.BankString, string.Comma(self:GetHeldMoney()), string.Comma(BANK_CONFIG.Max)), "bank_3d2d", 0, y, BANK_CONFIG.BankStringColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color(0, 0, 0, 255))
			//76561198253220777
			self.smooth = Lerp(10 * FrameTime(), self.smooth, self:GetHeldMoney() / BANK_CONFIG.Max)
			paintBar(-400, y+80, 800, 50, Color(0, 0, 0, 255), BANK_CONFIG.BarColor, self.smooth)

			self.progressSmooth = Lerp(10 * FrameTime(), self.progressSmooth, (self:GetDelay() - CurTime()) / BANK_CONFIG.Delay)
			paintBar(-400, y+130, 800, 20, Color(0, 0, 0, 255), BANK_CONFIG.ProgressColor, math.Remap(self.progressSmooth, 0, 1, 1, 0))
		else
			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetMaterial(restrictedIcon)
			surface.DrawTexturedRect(-50, y+(-50*4), 100, 100)

			local text
			
			if !allowed then
				text = string.format(BANK_CONFIG.CannotRobCopString, copCount, BANK_CONFIG.MinCopJobs)
			elseif self:GetCooldown() ~= 0 then
				local time = CurTime() - self:GetCooldown()
				time = math.Round(time)
				time = math.abs(time)
				time = math.Clamp(time, 0, BANK_CONFIG.CooldownTime)

				text = string.format(BANK_CONFIG.CooldownString, time)
			elseif !jobCanRob() then
				text = string.format(BANK_CONFIG.CannotRobAsCopString, team.GetName(LocalPlayer():Team()))				
			else
				text = "Cannot Rob"
			end

			draw.SimpleTextOutlined(text, "bank_3d2d", 0, y, BANK_CONFIG.BankStringColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color(0, 0, 0, 255))
		end
	cam.End3D2D()
end