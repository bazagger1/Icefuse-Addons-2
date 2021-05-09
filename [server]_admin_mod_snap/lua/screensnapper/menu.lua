--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_snap/lua/screensnapper/menu.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

snapper.menu = snapper.menu or {}
snapper.icons = snapper.icons or {}

surface.CreateFont("Snapper Title", {
	font = "Roboto Regular",
	size = ScreenScale(8),
	weigth = 400,
})

surface.CreateFont("Roboto 24", {
	font = "Roboto Regular",
	size = 24,
	weigth = 400,
})

surface.CreateFont("Roboto Big", {
	font = "Roboto Regular",
	size = ScreenScale(28),
	weigth = 400,
})


function snapper.menu.view(data)
	snapper.menu.frame = vgui.Create("DPanel")
	local frame = snapper.menu.frame

	frame:SetSize(ScrW()/2, ScrH()/1.5)
	frame:Center(true)
	frame:NoClipping(true)
	frame:SetMouseInputEnabled(true)

	gui.EnableScreenClicker(true)

	function frame.Paint(s, w, h)
		MatUI.DrawCard(0, 0, w, h)
	end

	local frameheader = vgui.Create("DPanel", frame)
	frameheader:Dock(TOP)
	frameheader:SetTall(32)

	function frameheader.Paint(s, w, h)
		surface.SetDrawColor(unpack(snapper.config.color))
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(0, 0, 0, 145)
		surface.DrawRect(0, 0, w, h)
	end

	frameheader.close = vgui.Create("DButton", frameheader)
	frameheader.close:Dock(RIGHT)
	frameheader.close:SetWide(32)
	frameheader.close:SetText("")

	function frameheader.close.Paint(s, w, h)
		surface.SetDrawColor(255, 255, 255, 255 and s:IsHovered() or 175)
		surface.SetMaterial(snapper.icons.closeMat)
		surface.DrawTexturedRect(0, h/2-48/2/2, 48/2, 48/2)
	end

	function frameheader.close.DoClick(s)
		snapper.menu.close()
	end

	local header = vgui.Create("DPanel", frame)
	header:Dock(TOP)
	header:SetTall(64)
	header.text = "Screenshot of ".. snapper.victim:Name() .. " (".. snapper.victim:SteamID() .. ")"

	function header.Paint(s, w, h)
		surface.SetDrawColor(unpack(snapper.config.color))
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(snapper.icons.cameraMat)
		surface.DrawTexturedRect(16, 16, 32, 32)

		surface.SetTextColor(255, 255, 255)
		surface.SetFont("Snapper Title")

		local textw, texth = surface.GetTextSize(header.text)

		surface.SetTextPos(64+16, h/2-texth/2)
		surface.DrawText(header.text)
	end

	local save = vgui.Create("DButton", header)
	save:Dock(RIGHT)
	save:DockMargin(0, 16, 16, 16)
	save:SetText("Save")
	save:SetFont("Roboto Medium")
	save:SetTextColor(color_white)
	function save:Paint(w, h)
		local bw = self.Depressed and 5 or (self.Hovered and 3 or 0)
		draw.RoundedBox( 5+bw, 0, 0, w, h, color_white )
		draw.RoundedBox( 5+bw, 1, 1, w-(1*2), h-(1*2), Color(unpack(snapper.config.color)) )
	end

	function save:DoClick()
		if not file.IsDir("snapper", "DATA") then
			file.CreateDir("snapper")
		end

		if not file.IsDir("snapper/saved", "DATA") then
			file.CreateDir("snapper/saved")
		end

		file.Write("snapper/saved/".. os.time() ..".txt", data)

		self:SetText("Saved!")
		self:SetTextColor(Color(235, 235, 235))
		self:SetEnabled(false)
	end

	local recapture = vgui.Create("DButton", header)
	recapture:Dock(RIGHT)
	recapture:DockMargin(0, 16, 16, 16)
	recapture:SetText("Recapture")
	recapture:SetFont("Roboto Medium")
	recapture:SetTextColor(color_white)
	function recapture:Paint(w, h)
		local bw = self.Depressed and 5 or (self.Hovered and 3 or 0)
		draw.RoundedBox( 5+bw, 0, 0, w, h, color_white )
		draw.RoundedBox( 5+bw, 1, 1, w-(1*2), h-(1*2), Color(unpack(snapper.config.color)) )
	end
	recapture:SizeToContentsX(16)

	function recapture:DoClick()
		RunConsoleCommand("say", snapper.config.command .. " " .. snapper.victim:SteamID())

		snapper.menu.close()
	end

	if data then
		local holder = vgui.Create("DPanel", frame)
		holder:Dock(FILL)
		holder:InvalidateParent(true)

		local main = vgui.Create("DHTML", holder)
   		main:SetPos(0, 0)
   		main:SetSize(holder:GetSize())

   		main:InvalidateParent(true)
   		main:SetMouseInputEnabled(true)
		main:SetHTML( '<style type="text/css"> body { margin: 0; padding: 0; overflow: hidden; } img { width: 100%; height: 100%; } </style> <img src="'.. data  ..'"> ')
   		main:RequestFocus()

   		local p = vgui.Create("DPanel", holder)
   		p:Dock(FILL)
   		function p:Paint(w, h) end

   		function p:Think()
			local mousex = self:ScreenToLocal(gui.MouseX())
			local mousey = self:ScreenToLocal(gui.MouseY())
			
			if (self.Dragging) then
				local x = mousex - self.Dragging[1]
				local y = mousey - self.Dragging[2]

				main:SetPos( x, y )
			end
   		end

   		function p:Button()
   			if not p.b then
	   			p.b = vgui.Create("DButton", p)
	   			p.b:SetPos(8, 8)
	   			p.b:SetSize(64, 32)
	   			p.b:SetText("RESET")
	   			p.b:SetFont("Roboto Medium")
	   			p.b.Color = {0, 175, 255}

	   			FancyButton(p.b)

	   			function p.b:DoClick()
	   				main:SetPos(0, 0)
	   				main:SetSize(holder:GetSize())

	   				self:Remove()

	   				p.b = nil
	   			end
	   		end
   		end

   		function p:OnMouseWheeled(code)
   			self:Button()

   			local x, y, w, h = main:GetBounds()
   			if code > 0 then
   				main:SetPos(x-15, y-15)
   				main:SetSize(w+30, h+30)
   			else
   				main:SetPos(x+15, y+15)
   				main:SetSize(w-30, h-30)
   			end
   		end

   		function p:OnMousePressed(code)
   			self:Button()
			self.Dragging = {main:ScreenToLocal(gui.MouseX()), main:ScreenToLocal(gui.MouseY())}
			self:MouseCapture(true)
   		end

   		function p:OnMouseReleased(code)
			self.Dragging = nil
			self:MouseCapture(false)
			self:InvalidateParent()
   		end
   	end
end

function snapper.menu.close()
	gui.EnableScreenClicker(false)
	snapper.menu.frame:Remove()
end

surface.CreateFont( "Info Text", {
    font = "Roboto Medium",
    size = ScreenScale(6.4),
    antialias = true
} )

surface.CreateFont( "Info Header", {
    font = "Roboto Bold",
    size = ScreenScale(8),
    antialias = true
} )

surface.CreateFont( "Info Title", {
    font = "Roboto Medium",
    size = ScreenScale(16),
    antialias = true
} )

surface.CreateFont( "Info Tiny", {
    font = "Roboto Medium",
    size = ScreenScale(5),
    antialias = true
} )

function snapper.menu.admin()
	if snapper.menu.frame then
		snapper.menu.frame:Remove()
	end

	snapper.menu.frame = vgui.Create("DPanel")
   	local frame = snapper.menu.frame

    frame:SetSize(ScrW()/1.3, ScrH()/1.3)
    frame:Center(true)
    frame:NoClipping(true)

    gui.EnableScreenClicker(true)

    function frame.Paint(s, w, h)
        MatUI.DrawCard(0, 0, w, h)
    end

    local frameheader = vgui.Create("DPanel", frame)
    frameheader:Dock(TOP)
    frameheader:SetTall(32)

    function frameheader.Paint(s, w, h)
		surface.SetDrawColor(unpack(snapper.config.color))
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(0, 0, 0, 145)
		surface.DrawRect(0, 0, w, h)
    end

    frameheader.close = vgui.Create("DButton", frameheader)
    frameheader.close:Dock(RIGHT)
    frameheader.close:SetWide(32)
    frameheader.close:SetText("")

    function frameheader.close.Paint(s, w, h)
        surface.SetDrawColor(255, 255, 255, 255 and s:IsHovered() or 175)
        surface.SetMaterial(snapper.icons.closeMat)
        surface.DrawTexturedRect(0, h/2-48/2/2, 48/2, 48/2)
    end

    function frameheader.close.DoClick(s)
        frame:Remove()
        gui.EnableScreenClicker(false)
    end

    local header = vgui.Create("DPanel", frame)
    header:Dock(TOP)
    header:SetTall(64)
    header.text = "Snapper Administration Panel"

    function header.Paint(s, w, h)
        surface.SetDrawColor(unpack(snapper.config.color))
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(snapper.icons.cameraMat)
        surface.DrawTexturedRect(16, 16, 32, 32)

        surface.SetTextColor(255, 255, 255)
        surface.SetFont("Snapper Title")

        local textw, texth = surface.GetTextSize(header.text)

        surface.SetTextPos(64+16, h/2-texth/2)
        surface.DrawText(header.text)
    end

	local openlink = vgui.Create("DButton", header)
	openlink:Dock(RIGHT)
	openlink:DockMargin(0, 16, 16, 16)
	openlink:SetText("Open")
	openlink:SetFont("Roboto Medium")
	openlink:SetTextColor(openlink.link and color_white or Color(200, 200, 200))
	openlink.link = false
	function openlink:Paint(w, h)
		local bw = self.Depressed and 5 or (self.Hovered and 3 or 0)
		draw.RoundedBox( 5+bw, 0, 0, w, h, openlink.link and color_white or Color(200, 200, 200) )
		draw.RoundedBox( 5+bw, 1, 1, w-(1*2), h-(1*2), Color(unpack(snapper.config.color)) )
	end

	function openlink:DoClick()
		if not self.link then
			return
		end

		gui.OpenURL(self.link)
	end

	function openlink:SetLink(link)
		self.link = link
		self:SetTextColor(openlink.link and color_white or Color(200, 200, 200))
	end

	local copy = vgui.Create("DButton", header)
	copy:Dock(RIGHT)
	copy:DockMargin(0, 16, 16, 16)
	copy:SetText("Copy")
	copy:SetFont("Roboto Medium")
	copy:SetTextColor(copy.link and color_white or Color(200, 200, 200))
	copy.link = false
	function copy:Paint(w, h)
		local bw = self.Depressed and 5 or (self.Hovered and 3 or 0)
		draw.RoundedBox( 5+bw, 0, 0, w, h, copy.link and color_white or Color(200, 200, 200) )
		draw.RoundedBox( 5+bw, 1, 1, w-(1*2), h-(1*2), Color(unpack(snapper.config.color)) )
	end

	function copy:DoClick()
		if not self.link then
			return
		end

		SetClipboardText(self.link)
	end

	function copy:SetLink(link)
		self.link = link
		self:SetTextColor(copy.link and color_white or Color(200, 200, 200))
	end

    local snaps = vgui.Create("DTree", frame)
    snaps:Dock(LEFT)
    snaps:SetWide(frame:GetWide()/5)
    snaps.RootNode:DockMargin(8, 8, 8, 8)

   	function snaps:Paint(w, h)
   		surface.SetDrawColor(230, 230, 230)
   		surface.DrawRect(0, 0, w, h)

   		surface.SetDrawColor(175, 175, 175)
   		surface.DrawLine(w-1, 0, w-1, h)

   		/* wtf
   		if self.Items then
   			surface.SetTextColor(100, 100, 100)
   			surface.SetFont("Roboto 24")

   			local text = "Oh boy that's empty!"
   			local tw, th = surface.GetTextSize(text)

   			surface.SetTextPos(w/2-tw/2, h/10-th/2)
   			surface.DrawText(text)
   		end
   		*/
	end

	local holder = vgui.Create("DPanel", frame)
	holder:Dock(FILL)
	holder:InvalidateParent(true)

	holder.Text = "Select a snap to load"
	holder.Text2 = "from the list"
	function holder:Paint(w, h)
		surface.SetTextColor(200, 200, 200)
		surface.SetFont("Roboto Big")
		
		local textw, texth = surface.GetTextSize(self.Text)

		surface.SetTextPos(w/2-textw/2, h/3-texth/2)
		surface.DrawText(self.Text)

		//Newline

		surface.SetTextColor(200, 200, 200)
		surface.SetFont("Roboto Big")
		
		local textw2, texth2 = surface.GetTextSize(self.Text2)

		surface.SetTextPos(w/2-textw2/2, h/3-texth2/2+texth)
		surface.DrawText(self.Text2)

		--surface.SetDrawColor(200, 200, 200)
		--surface.DrawRect(w/2-textw/2, h/3+texth/1.75, textw, 3)
	end

	local main, p, open
	local function open(data)
		main = main or vgui.Create("DHTML", holder)
   		main:SetPos(0, 0)
   		main:SetSize(holder:GetSize())

   		main:InvalidateParent(true)
   		main:SetMouseInputEnabled(true)
		main:SetHTML( '<style type="text/css"> body { margin: 0; padding: 0; overflow: hidden; } img { width: 100%; height: 100%; } </style> <img src="'.. data .. '"> ')
   		main:RequestFocus()

   		if openlink and copy then
   			openlink:SetLink(data)
   			copy:SetLink(data)
   		end

   		if not p then
	   		p = vgui.Create("DPanel", holder)
	   		p:Dock(FILL)
	   		function p:Paint(w, h) end

	   		function p:Think()
				local mousex = self:ScreenToLocal(gui.MouseX())
				local mousey = self:ScreenToLocal(gui.MouseY())
				
				if (self.Dragging) then
					local x = mousex - self.Dragging[1]
					local y = mousey - self.Dragging[2]

					main:SetPos( x, y )
				end
	   		end

	   		function p:Button()
	   			if not p.b then
		   			p.b = vgui.Create("DButton", p)
		   			p.b:SetPos(8, 8)
		   			p.b:SetSize(64, 32)
		   			p.b:SetText("RESET")
		   			p.b:SetFont("Roboto Medium")
		   			p.b.Color = {0, 175, 255}

		   			FancyButton(p.b)

		   			function p.b:DoClick()
		   				main:SetPos(0, 0)
		   				main:SetSize(holder:GetSize())

		   				self:Remove()

		   				p.b = nil
		   			end
		   		end
	   		end

	   		function p:OnMouseWheeled(code)
	   			self:Button()

	   			local x, y, w, h = main:GetBounds()
	   			if code > 0 then
	   				main:SetPos(x-15, y-15)
	   				main:SetSize(w+30, h+30)
	   			else
	   				main:SetPos(x+15, y+15)
	   				main:SetSize(w-30, h-30)
	   			end
	   		end

	   		function p:OnMousePressed(code)
	   			self:Button()
				self.Dragging = {main:ScreenToLocal(gui.MouseX()), main:ScreenToLocal(gui.MouseY())}
				self:MouseCapture(true)
	   		end

	   		function p:OnMouseReleased(code)
				self.Dragging = nil
				self:MouseCapture(false)
				self:InvalidateParent()
	   		end
	   	end
   	end
   	
   	net.Start("Snapper Admin")
   	net.WriteInt(1, 8)
   	net.SendToServer()

   	local png
   	net.Receive("Snapper Admin", function(length, server)
   		local cmd = net.ReadInt(8)

   		if cmd == 1 then
	   		local t = net.ReadTable()
		    local players = {}

		   	for k, v in pairs(t) do
		   		local ply = v:match("%d*")
		   		players[ply] = players[ply] or {}
		   		table.insert(players[ply], tostring(v:match("_%d*"):gsub("_", "")))
		   	end

		   	for k, v in pairs(players) do
		   		local ply = player.GetBySteamID64(k)
		   		if not ply then
		   			continue
		   		end

		   		local node = snaps:AddNode((ply:Name() .. " (" .. k .. ")") or k)
		   		node:SetIcon("icon16/user.png")
		   		node.Label:SetFont("Info Tiny")
				local days = {}

		   		for _, time in pairs(v) do
		   			local day = os.date("%d/%m/%Y", time)
		   			days[day] = days[day] or {}
		   			table.insert(days[day], time)
		   		end

		   		for _, time in pairs(days) do
		   			local day = node:AddNode(_)
		   			day:SetIcon("icon16/time.png")
		   			day.Label:SetFont("Info Tiny")
		   			local used = {}
		   			for __, t in pairs(time) do
		   				if table.HasValue(used, t) then
		   					continue
		   				end

		   				table.insert(used, t)

		   				local n = day:AddNode(os.date("%H:%M:%S", t))
			   			n:SetIcon("icon16/picture.png")
			   			n.Label:SetFont("Info Tiny")
			   			function n:OnNodeSelected()
			   				if main and IsValid(main) and ispanel(main) then
				   				main:Remove()
				   				main = nil
				   			end

				   			if p and IsValid(p) and ispanel(p) then
				   				p:Remove()
				   				p = nil
				   			end

			   				holder.Text = "Requestig image..."
			   				holder.Text2 = ""

			   				png = ("snapper/snaps/" .. k .. "_" .. t .. ".txt")

			   				if file.Exists(png, "DATA") then
			   					open(file.Read(png))

			   					return
			   				end

			   				net.Start("Snapper Admin")
			   				net.WriteInt(2, 8)
			   				net.WriteString(png)
			   				net.SendToServer()
			   			end

			   			function n:DoRightClick()
			   				local menu = DermaMenu()
							local delete = menu:AddOption("Delete", function()
								png = ("snapper/snaps/" .. k .. "_" .. t .. ".txt")

				   				net.Start("Snapper Admin")
				   				net.WriteInt(3, 8)
				   				net.WriteString(png)
				   				net.SendToServer()

				   				n:Remove()
				   				n = nil
							end)

							delete:SetPos(gui.MouseX(), gui.MouseY())
							delete:SetIcon("icon16/cross.png")
							menu:Open()
			   			end
		   			end
		   		end
	   		end
	   	elseif cmd == 2 then
	   		local data = net.ReadString()

	   		open(data)

	   		file.Write(png, data)
	   	elseif cmd == 3 then
	   		if holder and IsValid(holder) and ispanel(holder) then
	   			if main and IsValid(main) and ispanel(main) then
				   	main:Remove()
				   	main = nil
				end

				if p and IsValid(p) and ispanel(p) then
					p:Remove()
					p = nil
				end

		   		holder.Text = "Image deleted!"
		   		holder.Text2 = ""
		   	end
	   	end
   	end)
end

function snapper.download(url, name, res)
	if file.Exists("snapper/".. name ..".png", "DATA") then
		res(Material("../data/snapper/".. name ..".png"))
	end

	http.Fetch(url, function(contents)
		file.Write("snapper/".. name ..".png", contents)

		print("Downloaded menu file (".. name .. ".png)")

		res(Material("../data/snapper/".. name ..".png"))
	end)
end

hook.Add("InitPostEntity", "Download Snapper Content", function()
	snapper.download("http://i.imgur.com/tbT4Zvd.png", "sheet", function(res) snapper.icons.sheetMat = res end)
	snapper.download("http://i.imgur.com/TQj30DE.png", "close", function(res) snapper.icons.closeMat = res end)
	snapper.download("http://i.imgur.com/9rdirBF.png", "camera", function(res) snapper.icons.cameraMat = res end)
end)

concommand.Add("snapper", function()
	snapper.menu.admin()
end)