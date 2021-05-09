--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bodily_functions/lua/cl_bathroom.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


local params = {
	["$basetexture"] = "sprites/orangecore2",
	["$color"] = "[1 1 0]",
	["$color2"] = "[1 1 0]",
	["$additive"] = 1,
	["$vertexcolor"] = 1,
	["$vertexalpha"] = 1,
}

local new_material = CreateMaterial("pee_material", "UnlitGeneric", params);

net.Receive( "Ice_PlayerPee", function( len )

	local ply = net.ReadEntity()
	local amtOfPee = net.ReadInt( 8 )
	
	if ( !IsValid( ply ) ) then return end
	
	---
	
	local partem = ParticleEmitter( ply:GetPos() + Vector( 0, 0, 32 ) )
	local time = ( ( amtOfPee / 100 ) * GAMEMODE.Config.max_pee_time )
	local died = false
	
	for i = 1, (time/0.001) do // d = r * t
		
		timer.Simple((i* 0.001), function()
			
			if ( not died and IsValid( ply ) ) then
				
				// If the player dies while peeing, just set a flag
				if ( !ply:Alive() ) then
					died = true
					return
				end
				
				local ang = ply:GetAimVector():Angle()
				local bone = ply:LookupBone( "ValveBiped.Bip01_Pelvis" );
				local pos;
				if (bone != nil) then 
					pos = ply:GetBonePosition(bone);
				else 
					pos = ply:LocalToWorld(ply:OBBCenter());
				end
				
				if ( pos == nil ) then
					if ( not ply:Crouching() ) then
						pos = ply:GetPos() + Vector( 0, 0, 32 )
					else
						pos = ply:GetPos() + Vector( 0, 0, 10 )
					end	
				end
				
				local part = partem:Add( "!pee_material", pos )
				if ( part ) then
					
					local ang = ply:GetAimVector():Angle()
					part:SetVelocity( ply:GetVelocity() + ( Angle( 0, ang.y, ang.r ):Forward() * 300 ) )
					part:SetDieTime( 5 )
					part:SetStartSize( 1 )
					part:SetEndSize( 1 )
					part:SetStartLength( 15 )
					part:SetEndLength( 1 )
					part:SetAirResistance( 0 )
					part:SetGravity( Vector( 0, 0, -800 ) )
					part:SetCollide( true )
				end
			end
		end )
	end
end )