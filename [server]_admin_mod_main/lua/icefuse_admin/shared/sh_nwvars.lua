--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/shared/sh_nwvars.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Register networked DataVars here
IcefuseAdmin.NW.Register "rank"
	:Write(function(v)
		net.WriteString(v.Name)
		net.WriteUInt(v.Weight, 8)
	end)
	:Read(function()
		return {
			Name = net.ReadString(),
			Weight = net.ReadUInt(8)
		}
	end)
	:SetPlayer()


IcefuseAdmin.NW.Register "joinTime"
	:Write(net.WriteUInt, 32)
	:Read(net.ReadUInt, 32)
	:SetPlayer()

IcefuseAdmin.NW.Register "lastTimeSave"
	:Write(net.WriteUInt, 32)
	:Read(net.ReadUInt, 32)
	:SetPlayer()

IcefuseAdmin.NW.Register "timePlayed"
	:Write(net.WriteUInt, 32)
	:Read(net.ReadUInt, 32)
	:SetPlayer()

IcefuseAdmin.NW.Register "adminmode"
	:Write(net.WriteBool)
	:Read(net.ReadBool)
	:SetPlayer()

--
-- Cloak
--
IcefuseAdmin.NW.Register "cloaked"
	:Write(net.WriteBool)
	:Read(net.ReadBool)
	:SetPlayer()
	
--
-- Jail
--

IcefuseAdmin.NW.Register "jailed"
	:Write(net.WriteBool)
	:Read(net.ReadBool)
	:SetLocalPlayer()

IcefuseAdmin.NW.Register "jailLength"
	:Write(net.WriteUInt, 32)
	:Read(net.ReadUInt, 32)
	:SetLocalPlayer()

IcefuseAdmin.NW.Register "jailServed"
	:Write(net.WriteUInt, 32)
	:Read(net.ReadUInt, 32)
	:SetLocalPlayer()

IcefuseAdmin.NW.Register "jailReason"
	:Write(net.WriteString)
	:Read(net.ReadString)
	:SetLocalPlayer()
