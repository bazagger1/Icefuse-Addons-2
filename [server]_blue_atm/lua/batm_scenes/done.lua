--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_atm/lua/batm_scenes/done.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

--[[-------------------------------------------------------------------------
Draws the done deposite screen
---------------------------------------------------------------------------]]


surface.CreateFont( "batm_done_text", {
	font = "Coolvetica",
	extended = false,
	size = 75,
	weight = 300,
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

local scene = {}

local done = Material("bluesatm/done.png", "noclamp smooth")

--Called when the scene is loaded
function scene.Load(ent)
	timer.Simple(2.5, function()
			if BATM.SelectedAccount == "personal" then
				ent:SetScene("personalaccount")
			else
				ent:SetScene("groupaccount")
			end
	end)

	-- subscrib code blue tugtoial

end

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw background
	draw.RoundedBox(0, 0, 100, ScrW, ScrH - 100, Color(231, 126, 34,255))

	--Draw logo
	surface.SetDrawColor(Color(255,255,255,50))
	surface.SetMaterial(done)
	surface.DrawTexturedRectRotated(ScrW/2, ScrH/2, 256, 256, 0)

	--Draw text
	draw.SimpleText(BATM.Lang["Deposit Complete"], "batm_done_text", ScrW/2, ScrH - 150, Color(255,255,255,100), 1)

	--Draw the cursor
	BATM.Scenes["cursor"].Draw(ent, ScrW, ScrH)

end

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "done")
