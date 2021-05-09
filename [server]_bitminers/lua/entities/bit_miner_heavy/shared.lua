--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bitminers/lua/entities/bit_miner_heavy/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

ENT.Type = "anim"
--ENT.Base = "base_gmodentity" We should not need a base so I will just remove this for now
 
ENT.PrintName		= "BITMINER PRO"
ENT.Author			= "{CODE BLUE}"
ENT.Contact			= "Via steam(Diamondjack7777 or {CODE BLUE} or 0V3RR1D3)"
ENT.Purpose			= "To be used with {CODE BLUE}'s BITMINER addon"
ENT.Instructions	= "Just purchase it from the F4 menu :D"

ENT.Category = "Icefuse Bitminers"
ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.AutomaticFrameAdvance = true

function ENT:Initialize()

	self:SetModel("models/BITMINER/BitMinerHeavy.mdl")

	self.health = 75

	self.timer = 0
	self.CanDraw = false

	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end

	--Used to play the animation and force it to be client side for network performance;
	self:UseClientSideAnimation()

	local sequence = self:LookupSequence( "idle" )
	self:ResetSequence( sequence )

	if(SERVER) then
		
		sound.Add( {
			name = "bitminer_sound_heavy",
			channel = CHAN_STATIC,
			volume = 0.80,
			level = 80,
			pitch = { 95, 110 },
			sound = "ambient/machines/machine3.wav"
		} )

		self:EmitSound("bitminer_sound_heavy", 100, 100, 1, CHAN_AUTO )

	end

end

function ENT:OnRemove()



end

function ENT:SetupDataTables()

	self:NetworkVar("Int" , 0 , "MinedCoins")
	self:NetworkVar("Float" , 1 , "MinedProgress")
	self:NetworkVar("String" , 3 , "OwnerName")

end