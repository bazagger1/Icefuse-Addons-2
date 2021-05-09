--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/client/cl_chat.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseAdmin.Chat = {}

IcefuseAdmin.Chat.TypeColors = {}
	IcefuseAdmin.Chat.TypeColors["ERR"] = Color(255, 100, 100, 255)
	IcefuseAdmin.Chat.TypeColors["CONDISCON"] = Color(100, 255, 100, 255)

	
local gold = Color(255, 200, 0);
local white = Color(255, 255, 255);

function IcefuseAdmin.Chat.Add(Text, Col, Snd)
	Text = string.Explode("\n", Text) or {"Text not found"}
	Col = Col or Color(200, 200, 200, 255)

	for k, v in pairs(Text) do
		chat.AddText(Color(255, 100, 0, 255), "| ", Col, v)
	end
end

net.Receive("IcefuseAdmin.Chat", function(len)
	local Text = net.ReadString()
	local Type = net.ReadString()
	
	local Col = IcefuseAdmin.Chat.TypeColors[Type] or nil
	
	IcefuseAdmin.Chat.Add(Text, Col)
end)

net.Receive("IcefuseAdmin.AdminChat", function(len)
	local isAdmin = tobool(net.ReadString())
	local name = net.ReadString()
	local text = net.ReadString()
	
	chat.AddText((isAdmin and Color(50, 200, 50)) or Color(255, 50, 255), ((isAdmin and "[STAFF] ") or "[TO STAFF] ") .. name .. ": " .. text)
end)

hook.Add("ChatText", "IcefuseAdmin.Chat.SuppressChatText", function(plInd, plName, Text, Type)
	if (Type == "joinleave") then return true end
end)