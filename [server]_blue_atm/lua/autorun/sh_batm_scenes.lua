--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_atm/lua/autorun/sh_batm_scenes.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if SERVER then
	--Include all the scenes
	AddCSLuaFile("batm_scenes/homescreen.lua")
	AddCSLuaFile("batm_scenes/background.lua")
	AddCSLuaFile("batm_scenes/cursor.lua")
	AddCSLuaFile("batm_scenes/accountselection.lua")
	AddCSLuaFile("batm_scenes/personalaccount.lua")
	AddCSLuaFile("batm_scenes/deposit.lua")
	AddCSLuaFile("batm_scenes/done.lua")
	AddCSLuaFile("batm_scenes/loading.lua")
	AddCSLuaFile("batm_scenes/history.lua")
	AddCSLuaFile("batm_scenes/withdraw.lua")
	AddCSLuaFile("batm_scenes/failed.lua")
	AddCSLuaFile("batm_scenes/done_withdraw.lua")
	AddCSLuaFile("batm_scenes/transfer.lua")
	AddCSLuaFile("batm_scenes/transfer_amount.lua")
	AddCSLuaFile("batm_scenes/transfer_offline.lua")
	AddCSLuaFile("batm_scenes/groupaccount.lua")
	AddCSLuaFile("batm_scenes/members.lua")
	AddCSLuaFile("batm_scenes/addmember.lua")
	AddCSLuaFile("batm_scenes/done_transfer.lua")
else
	BATM = BATM or {}
 
	--A table that stores all the scenes
	BATM.Scenes = {}
   
	--Fast way to register scenes
	function BATM.RegisterScene(scene, sceneName)
		BATM.Scenes[sceneName] = scene 
		print("[BATM] Registered Scene '"..sceneName.."'")
	end

	--Now include all the scenes
	include("batm_scenes/homescreen.lua")
	include("batm_scenes/background.lua")
	include("batm_scenes/cursor.lua")
	include("batm_scenes/accountselection.lua")
	include("batm_scenes/personalaccount.lua")
	include("batm_scenes/deposit.lua")
	include("batm_scenes/done.lua")
	include("batm_scenes/loading.lua")
	include("batm_scenes/history.lua")
	include("batm_scenes/withdraw.lua")
	include("batm_scenes/failed.lua")
	include("batm_scenes/done_withdraw.lua")
	include("batm_scenes/transfer.lua")
	include("batm_scenes/transfer_amount.lua")
	include("batm_scenes/transfer_offline.lua")
	include("batm_scenes/groupaccount.lua")
	include("batm_scenes/members.lua")
	include("batm_scenes/addmember.lua")
	include("batm_scenes/done_transfer.lua")	
end