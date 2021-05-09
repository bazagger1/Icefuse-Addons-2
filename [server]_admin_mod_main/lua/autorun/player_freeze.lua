--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/autorun/player_freeze.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

function FGod( ply, dmginfo )
		if(ply:GetNetworkedVar("FGod") == 1) then
				dmginfo:ScaleDamage( 0 )
		end
end
hook.Add("EntityTakeDamage", "FGod", FGod)

hook.Add("PhysgunDrop", "ply_physgunfreeze", function(pl, ent)
	hook.Remove( "PhysgunDrop", "ulxPlayerDrop" ) --This hook from ULX seems to break this script that's why we are removing it here.
	
	ent._physgunned = false
	
	if( ent:IsPlayer() ) then         		   
		-- predicted?
		ent:SetMoveType(pl:KeyDown(IN_ATTACK2) and MOVETYPE_NONE or MOVETYPE_WALK)
		
		if(pl:KeyDown(IN_ATTACK2)) then
			ent:Freeze(true)
--			ent:SetNetworkedVar("FGod", 1)
		else
			ent:Freeze(false)
--			ent:SetNetworkedVar("FGod", 0)
		end
		   
		if SERVER then
			-- NO UUUU FKR
			if !ent:Alive() then
				ent:Spawn()
				self:PlayerSpawn(ent)
				ent:SetPos(pl:GetEyeTrace().HitPos)
			end
		end
		
		return --self.BaseClass:PhysgunDrop( pl , ent )   
	end
end)

hook.Add( "PhysgunPickup", "ply_physgunned", function(pl, ent)
	ent._physgunned = true
end)

function playerDies( pl, weapon, killer )
	if(pl._physgunned) then
		return false
	else
		return true
	end
end
hook.Add( "CanPlayerSuicide", "playerNoDeath", playerDies )