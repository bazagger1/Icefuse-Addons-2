--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/client/_misc.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

timer.Simple(0, function()

	--
	-- Base gmod entity
	
	do
		local base_gmodentity = scripted_ents.GetStored('base_gmodentity').t
		
		-- Is useless to us and uses unessecary resources...
		base_gmodentity.Think = function() end
	
	end
	
	--
	-- DarkRP stuff
	
	if DarkRP then
		
		if CLIENT then
		
			--
			-- Spawned shipment
			
			do
				local spawned_shipment = scripted_ents.GetStored('spawned_shipment').t
				
				local config_shipmentSpawnTime = GAMEMODE.Config.shipmentspawntime
				
				local FADE_DISTANCE = 300 ^ 2
				local FADE_DISTANCE_LENGTH = 200 ^ 2
				
				--
				-- Add a distance to shipments
				
				--[[ ]]
				function spawned_shipment:Draw()
					local isSpawning = config_shipmentSpawnTime > 0 and (self.height or 0) < self:OBBMaxs().z
					
					if isSpawning == false then
						self:DrawModel()
					end
					
					local distance = self:GetPos():DistToSqr(LocalPlayer():GetViewEntity():GetPos())
					
					if distance > 1200 ^ 2 then
						return
					end
					
					self.height = self.height or 0
					self.colr = self.colr or 1
					self.colg = self.colg or 0
					self.StartTime = self.StartTime or CurTime()

					if isSpawning == true then
						self:drawSpawning()
					end
					
					self:drawFloatingGun()
					
					self.opacity = 1 - math.max(distance - FADE_DISTANCE, 0) / FADE_DISTANCE_LENGTH
					if self.opacity <= 0.1 then
						return
					end
					
					self:drawInfo()
					
				end
				
				--[[ ]]
				function spawned_shipment:drawInfo()
					
					local Pos = self:GetPos()
					local Ang = self:GetAngles()

					local content = self:Getcontents() or ""
					local contents = CustomShipments[content]
					if not contents then return end
					contents = contents.name

					surface.SetFont("HUDNumber5")
					local text = DarkRP.getPhrase("contents")
					local TextWidth = surface.GetTextSize(text)
					local TextWidth2 = surface.GetTextSize(contents)

					-- Contents on the top
					cam.Start3D2D(Pos + Ang:Up() * 35, Ang, 0.2)
						draw.WordBox(2, -TextWidth * 0.5 + 5, -30, text, "HUDNumber5", Color(30, 30, 30, 100 * self.opacity), Color(255, 255, 255, 255 * self.opacity))
						draw.WordBox(2, -TextWidth2 * 0.5 + 5, 18, contents, "HUDNumber5", Color(30, 30, 30, 100 * self.opacity), Color(255, 255, 255, 255 * self.opacity))
					cam.End3D2D()

					Ang:RotateAroundAxis(Ang:Forward(), 90)

					text = DarkRP.getPhrase("amount")
					TextWidth = surface.GetTextSize(text)
					TextWidth2 = surface.GetTextSize(self:Getcount())

					-- Amount on the side
					cam.Start3D2D(Pos + Ang:Up() * 18, Ang, 0.14)
						draw.WordBox(2, -TextWidth * 0.5 + 5, -150, text, "HUDNumber5", Color(30, 30, 30, 100 * self.opacity), Color(255, 255, 255, 255 * self.opacity))
						draw.WordBox(2, -TextWidth2 * 0.5 + 0, -102, self:Getcount(), "HUDNumber5", Color(30, 30, 30, 100 * self.opacity), Color(255, 255, 255, 255 * self.opacity))
					cam.End3D2D()
				end
			
			end
			
			--
			-- Spawned weapon
			
			do
				local spawned_weapon = scripted_ents.GetStored('spawned_weapon').t
				
				local FADE_DISTANCE = 300 ^ 2
				local FADE_DISTANCE_LENGTH = 100 ^ 2
				
				function spawned_weapon:Draw()
					self:DrawModel()
					
					local distance = self:GetPos():DistToSqr(LocalPlayer():GetViewEntity():GetPos())
					self.opacity = 1 - math.max(distance - FADE_DISTANCE, 0) / FADE_DISTANCE_LENGTH
					if self.opacity <= 0.1 then
						return
					end
					
					-- local ret = hook.Call("onDrawSpawnedWeapon", nil, self)
					-- if ret ~= nil then return end
					
					if self.dt.amount == 1 then return end

					local Pos = self:GetPos()
					local Ang = self:GetAngles()
					local text = DarkRP.getPhrase("amount") .. self.dt.amount

					surface.SetFont("HUDNumber5")
					local TextWidth = surface.GetTextSize(text)

					Ang:RotateAroundAxis(Ang:Forward(), 90)

					cam.Start3D2D(Pos + Ang:Up(), Ang, 0.11)
						draw.WordBox(2, 0, -40, text, "HUDNumber5", Color(30, 30, 30, 100 * self.opacity), Color(255, 255, 255, 255 * self.opacity))
					cam.End3D2D()

					Ang:RotateAroundAxis(Ang:Right(), 180)

					cam.Start3D2D(Pos + Ang:Up() * 3, Ang, 0.11)
						draw.WordBox(2, -TextWidth, -40, text, "HUDNumber5", Color(30, 30, 30, 100 * self.opacity), Color(255, 255, 255, 255 * self.opacity))
					cam.End3D2D()
				end
				
			end
			
		end
		
		
	end


end)