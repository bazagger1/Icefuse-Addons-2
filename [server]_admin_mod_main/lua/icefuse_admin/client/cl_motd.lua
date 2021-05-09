--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/client/cl_motd.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local fr
function IcefuseAdmin.OpenMoTD(stayOpen)
	if (IcefuseAdmin.Config.MoTD == nil) or (IcefuseAdmin.Config.MoTD == "") or IsValid(fr) then return end

	fr = vgui.Create("DFrame")
	fr:SetTitle("MoTD")
	fr:SetSize(ScrW() * 0.9, ScrH() * 0.9)
	fr:Center()
	fr:MakePopup()

	local html = vgui.Create("DHTML", fr)
	html:SetPos(5, 30)
	html:SetSize(fr:GetWide() - 10, fr:GetTall() - 90)
	html:OpenURL(IcefuseAdmin.Config.MoTD)

	local cls = vgui.Create("DButton", fr)
	cls:SetPos(fr:GetWide()/2 - 75, fr:GetTall() - 55)
	cls:SetSize(150, 50)
	cls:SetText("Close")
	cls.DoClick = function(self)
		fr:Remove()
	end
	
	if (stayOpen) then
		cls:SetText("JAILED")
		cls:SetDisabled(true)
		fr:ShowCloseButton(false)
	end
end

function IcefuseAdmin.CloseMoTD()
	if (IsValid(fr)) then fr:Remove() end
end

-- hook.Add("InitPostEntity", "IcefuseAdmin.OpenMoTD.InitPostEntity", IcefuseAdmin.OpenMoTD)