--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/wos_net_fixer.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


--[[-------------------------------------------------------------------
	Shared Networking Overwriters:
		Change those nasty NW vars to NW2 vars! Will it do anything? who knows
			Powered by
						  _ _ _    ___  ____  
				__      _(_) | |_ / _ \/ ___| 
				\ \ /\ / / | | __| | | \___ \ 
				 \ V  V /| | | |_| |_| |___) |
				  \_/\_/ |_|_|\__|\___/|____/ 
											  
 _____         _                 _             _           
|_   _|__  ___| |__  _ __   ___ | | ___   __ _(_) ___  ___ 
  | |/ _ \/ __| '_ \| '_ \ / _ \| |/ _ \ / _` | |/ _ \/ __|
  | |  __/ (__| | | | | | | (_) | | (_) | (_| | |  __/\__ \
  |_|\___|\___|_| |_|_| |_|\___/|_|\___/ \__, |_|\___||___/
                                         |___/             
----------------------------- Copyright 2017, David "King David" Wiltos ]]--[[
							  
	Lua Developer: King David
	Contact: http://steamcommunity.com/groups/wiltostech
		
-- Copyright 2017, David "King David" Wiltos ]]--

hook.Add( "Initialize", "wOS.NetOptimizer.NWReplace", function()

	local META = FindMetaTable( "Player" )
	
	function META:SetNWAngle( name, def )
		self:SetNW2Angle( name, def )
	end
	
	function META:SetNWBool( name, def )
		self:SetNW2Bool( name, def )
	end
	
	function META:SetNWEntity( name, def )
		self:SetNW2Entity( name, def )
	end
	
	function META:SetNWFloat( name, def )
		self:SetNW2Float( name, def )
	end
	
	function META:SetNWInt( name, def )
		self:SetNW2Int( name, def )
	end
	
	function META:SetNWString( name, def )
		self:SetNW2String( name, def )
	end
	
	function META:SetNWVector( name, def )
		self:SetNW2Vector( name, def )
	end
	
	function META:GetNWAngle( name, def )
		return self:GetNW2Angle( name, def )
	end
	
	function META:GetNWBool( name, def )
		return self:GetNW2Bool( name, def )
	end
	
	function META:GetNWEntity( name, def )
		return self:GetNW2Entity( name, def )
	end
	
	function META:GetNWFloat( name, def )
		return self:GetNW2Float( name, def )
	end
	
	function META:GetNWInt( name, def )
		return self:GetNW2Int( name, def )
	end
	
	function META:GetNWString( name, def )
		return self:GetNW2String( name, def )
	end
	
	function META:GetNWVector( name, def )
		return self:GetNW2Vector( name, def )
	end

end )