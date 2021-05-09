--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bodily_functions/lua/cl_ebola.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


/*
	Ebola effects
*/

local ebola = false

local tab = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = 0,
	[ "$pp_colour_contrast" ] = 1,
	[ "$pp_colour_colour" ] = 0,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}

net.Receive( "Ice_hasEbola", function()

	ebola = net.ReadBool()
end )

net.Receive( "Ice_BleedingFromButt", function( len )
	
	local ply = net.ReadEntity()
	if ( !IsValid( ply ) ) then return end
	
	--
	
	local ang = ply:GetAimVector():Angle()
	
	--
	
	local pos1 = ply:GetBonePosition( ply:LookupBone( "ValveBiped.Bip01_Head1" ) )
	if ( pos1 == nil ) then
		pos1 = ply:GetPos() + Vector( 0, 0, 65 )
	end
	
	local pos2 = ply:GetBonePosition( ply:LookupBone( "ValveBiped.Bip01_Pelvis" ) )
	
	if ( pos2 == nil ) then
		pos2 = ply:GetPos() + Vector( 0, 0, 32 )
	end
	
	--
	
	for i = 0, 5 do
		timer.Simple( i * 0.1, function()
			
			local effectD1 = EffectData()
			effectD1:SetOrigin( pos1 )
			effectD1:SetNormal( ang:Forward() * ( 6 - 1 ) / 2 )
			effectD1:SetScale( 1 / 2 )
			util.Effect( "StriderBlood", effectD1, true, true )
		end )
	end
	
	local effectD2 = EffectData()
	effectD2:SetOrigin( pos2 + ang:Forward() * -10 + ang:Up() * -10 )
	effectD2:SetNormal( -1 * ang:Forward() )
	effectD2:SetMagnitude( 1 )
	effectD2:SetScale( 1 + 9 )
	effectD2:SetColor( 0 )
	effectD2:SetFlags( 3 )
	util.Effect( "bloodspray", effectD2, true, true )
end )

hook.Add( "RenderScreenspaceEffects", "Ice_RSSE", function()
	
	if ( not ebola ) then return end
	
	// Motion blur
	DrawMotionBlur( 0.2, 1, 0.02 )
end )