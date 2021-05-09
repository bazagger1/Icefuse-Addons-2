--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bodily_functions/lua/weapons/bathroom/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

AddCSLuaFile()

if ( CLIENT ) then
    SWEP.PrintName = "Bathroom (Pee/Poop)"
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.Author = "Icefuse"
SWEP.Instructions = "Left-click to pee.\nRight-click to take a poop."
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.WorldModel = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix  = "rpg"

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Icefuse Utilities"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType( "normal" )
end

function SWEP:Deploy()

    if ( CLIENT || !IsValid( self:GetOwner() ) ) then
		return true
	end
	
    self:GetOwner():DrawWorldModel( false )
    return true
end

function SWEP:Holster()
	
	if ( CLIENT ) then return end
	return ( not self:GetOwner().Peeing )
end

function SWEP:PreDrawViewModel()
    return true
end

function SWEP:PrimaryAttack()

	if ( CLIENT ) then return end
	self:GetOwner():goPee()
end

function SWEP:SecondaryAttack()

	if ( CLIENT ) then return end
	self:GetOwner():goPoop()
end

function SWEP:Reload()
end

if ( CLIENT ) then
	
	local pee = 0
	local poop = 0
	
	function SWEP:DrawHUD()
		
		local w, h = 200, 50
		local x, y = ScrW()/2 - w/2, ScrH() - h - 5
		local rPee = LocalPlayer():getDarkRPVar( "Pee" )
		local rPoo = LocalPlayer():getDarkRPVar( "Poop" )
		
		pee = Lerp( FrameTime() * 2, pee, rPee )
		poop = Lerp( FrameTime() * 2, poop, rPoo )
		
		draw.RoundedBox( 2, ScrW()/2 - w/2, ScrH() - 55, w, h, Color( 33, 33, 33, 150 ) )
		
		draw.RoundedBox( 2, x + 5, y + 5, w - 10, 19, Color( 33, 33, 33, 150 ) )
		draw.RoundedBox( 2, x + 6, y + 6, ( w - 12 ) * ( pee / 100 ), 17, Color( 128, 128, 0, 255 ) )
		
		draw.SimpleTextOutlined( "Pee: " .. rPee .. "%", "Default", x + w/2, y + 4 + 19/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, color_black )
		
		
		draw.RoundedBox( 2, x + 5, y + h/2 + 2, w - 10, 19, Color( 33, 33, 33, 150 ) )
		draw.RoundedBox( 2, x + 6, y + h/2 + 3, ( w - 12 ) * ( poop / 100 ), 17, Color( 153, 102, 0 ) )
		
		draw.SimpleTextOutlined( "Poop: " .. rPoo .. "%", "Default", x + w/2, y + 7 + 19 + 19/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, color_black )
	end
end