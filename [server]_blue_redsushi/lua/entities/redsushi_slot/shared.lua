--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_redsushi/lua/entities/redsushi_slot/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "RedSushi Slot"
ENT.Author = "<CODE BLUE>"
ENT.Contact = "Via Steam"
ENT.Spawnable = true
ENT.Category = "Blue's Slots"
ENT.AdminSpawnable = true 

--Vars for the screen
function ENT:SetupDataTables()
	self:NetworkVar("Bool",0, "IsRedScreen")
	self:NetworkVar("Bool",1, "IsJackpotScreen")
	self:NetworkVar("Int",0, "WinAmount")
	self:NetworkVar("Int",1, "BetAmount")
	self:NetworkVar("Int",2, "CreditAmount") --The number of credits of there balance/credit amount (floored)
end