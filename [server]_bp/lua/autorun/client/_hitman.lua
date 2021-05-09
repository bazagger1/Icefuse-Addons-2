--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/client/_hitman.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

hook.Add('PostGamemodeLoaded', 'crashFix', function()
	
	if not DarkRP.openHitMenu then
		return
	end
	
	local PANEL = vgui.GetControlTable('HitmanMenu')
	
	function PANEL:PerformLayout()
		local w, h = self:GetSize()
		
		self:SetSize(500, 700)
		self:Center()

		self.btnClose:SetSize(24, 24)
		self.btnClose:SetPos(w - 24 - 5, 5)
		
		self.icon:SetSize(128, 128)
		self.icon:SetPos(20, 20)
		
		local model = self:GetHitman():GetModel()
		if self._model ~= model then
			self._model = model
			self.icon:SetModel(model)
		end

		self.title:SetFont("ScoreboardHeader")
		self.title:SetPos(20 + 128 + 20, 20)
		self.title:SizeToContents(true)

		self.name:SizeToContents(true)
		self.name:SetText(DarkRP.getPhrase("name", self:GetHitman():Nick()))
		self.name:SetPos(20 + 128 + 20, 20 + self.title:GetTall())

		self.price:SetFont("HUDNumber5")
		self.price:SetColor(Color(255, 0, 0, 255))
		self.price:SetText(DarkRP.getPhrase("priceTag", DarkRP.formatMoney(self:GetHitman():getHitPrice()), ""))
		self.price:SetPos(20 + 128 + 20, 20 + self.title:GetTall() + 20)
		self.price:SizeToContents(true)

		self.playerList:SetPos(20, 20 + self.icon:GetTall() + 20)
		self.playerList:SetWide(self:GetWide() - 40)

		self.btnRequest:SetPos(20, h - self.btnRequest:GetTall() - 20)
		self.btnRequest:SetButtonColor(Color(0, 120, 30, 255))

		self.btnCancel:SetPos(w - self.btnCancel:GetWide() - 20, h - self.btnCancel:GetTall() - 20)
		self.btnCancel:SetButtonColor(Color(140, 0, 0, 255))

		self.playerList:StretchBottomTo(self.btnRequest, 20)

		self.BaseClass.PerformLayout(self)
	end
	
end)