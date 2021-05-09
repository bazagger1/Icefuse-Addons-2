--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/entities/jail_wall.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "jail_wall"
ENT.Author = "FPtje"
ENT.Spawnable = false

function ENT:CanTool()
    return false
end

function ENT:PhysgunPickup(ply)
    return false
end

if (SERVER) then
    function ENT:Initialize()
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        local phys = self:GetPhysicsObject()
        phys:Wake()
        phys:EnableMotion(false)

        self.SolidPos = self:GetPos()
        self.SolidAng = self:GetAngles()
    end

    function ENT:SetCanRemove(bool)
        self.CanRemove = bool
    end

    function ENT:OnRemove()
        if not self.CanRemove and IsValid(self.target) then
            local Replace = ents.Create("jail_wall")

            Replace:SetPos(self.SolidPos)
            Replace:SetAngles(self.SolidAng)
            Replace:SetModel(self:GetModel())
            Replace:Spawn()
            Replace:Activate()

            Replace.target = self.target
            Replace.targetPos = self.targetPos

            self.target.JailProps = self.target.JailProps or {}
            self.target.JailProps[#self.target.JailProps+1] = Replace

            if self.targetPos then self.target:SetPos(self.targetPos) end -- Back in jail you! :V
        end
    end

    function ENT:Think()
        if not IsValid(self.target) then
            self:SetCanRemove(true)
            self:Remove()
            return
        end
    end
elseif (CLIENT) then
    function ENT:Draw()
        self:DrawModel()
    end
end