--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_atm/lua/batm_scenes/homescreen.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--[[-------------------------------------------------------------------------
Draws the home screen, with aniamted lights, logo and some infomation
---------------------------------------------------------------------------]]
surface.CreateFont( "batm_small", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 45,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


local scroll = Material("bluesatm/color_strip.vmt")
local scrollReverse = Material("bluesatm/color_strip_reverse.vmt")
local logo = Material("bluesatm/logo.png", "noclamp smooth")

local scene = {}

--Called when the scene is loaded
function scene.Load(ent)
 
end

--Draw code
function scene.Draw(ent, ScrW, ScrH)
 
	--Draw background
	draw.RoundedBox(0, 0, 0, ScrW, ScrH, Color(45, 62, 80))
	draw.RoundedBox(0, 0, 0, ScrW, 150, Color(52, 73, 94))
	draw.RoundedBox(0, 0, ScrH - 150, ScrW, 150, Color(52, 73, 94))

	--Draw color strip
	surface.SetDrawColor(Color(255,255,255))
	surface.SetMaterial(scroll)
	surface.DrawTexturedRect(0, 150, ScrW, 12)

	surface.SetDrawColor(Color(255,255,255))
	surface.SetMaterial(scrollReverse)
	surface.DrawTexturedRect(0, ScrH - 150 - 12, ScrW, 12)

	--Draw the logo
	surface.SetDrawColor(Color(200,200,200,255))
	surface.SetMaterial(logo)
	surface.DrawTexturedRect(ScrW/2 - ((1024/1.5) / 2), ScrH/2 - ((199/1.5) / 2), 1024 / 1.5, 199 / 1.5)


	draw.SimpleText(BATM.Lang["Press 'E' to access your account."], "batm_small", ScrW/2, ScrH/2 + 75, Color(200, 200, 200), 1, 1)

  	--Draw the cursor position
  	BATM.Scenes["cursor"].Draw(ent, ScrW, ScrH)

end

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when a the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "home")

