--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/_animation.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local EntityMeta = FindMetaTable('Entity')
local PlayerMeta = FindMetaTable('Player')

--------------------------------------------------------------------------------

local FrameTime = FrameTime
local IsValid = IsValid

local math_Clamp = math.Clamp
local math_Approach = math.Approach

--------------------------------------------------------------------------------

local CLIENT = CLIENT

local MOVETYPE_NOCLIP = MOVETYPE_NOCLIP

local ACT_INVALID = ACT_INVALID
local ACT_LAND = ACT_LAND
local ACT_MP_STAND_IDLE = ACT_MP_STAND_IDLE
local ACT_MP_WALK = ACT_MP_WALK
local ACT_MP_RUN = ACT_MP_RUN
local ACT_MP_SWIM = ACT_MP_SWIM
local ACT_MP_CROUCHWALK = ACT_MP_CROUCHWALK
local ACT_MP_CROUCH_IDLE = ACT_MP_CROUCH_IDLE
local ACT_MP_ATTACK_CROUCH_PRIMARYFIRE = ACT_MP_ATTACK_CROUCH_PRIMARYFIRE
local ACT_MP_ATTACK_STAND_PRIMARYFIRE = ACT_MP_ATTACK_STAND_PRIMARYFIRE
local ACT_MP_RELOAD_CROUCH = ACT_MP_RELOAD_CROUCH
local ACT_MP_RELOAD_STAND = ACT_MP_RELOAD_STAND
local ACT_VM_PRIMARYATTACK = ACT_VM_PRIMARYATTACK
local ACT_VM_SECONDARYATTACK = ACT_VM_SECONDARYATTACK
local ACT_GMOD_NOCLIP_LAYER = ACT_GMOD_NOCLIP_LAYER
local ACT_GMOD_IN_CHAT = ACT_GMOD_IN_CHAT

local GESTURE_SLOT_JUMP = GESTURE_SLOT_JUMP
local GESTURE_SLOT_CUSTOM = GESTURE_SLOT_CUSTOM
local GESTURE_SLOT_ATTACK_AND_RELOAD = GESTURE_SLOT_ATTACK_AND_RELOAD
local GESTURE_SLOT_VCD = GESTURE_SLOT_VCD

local PLAYERANIMEVENT_ATTACK_PRIMARY = PLAYERANIMEVENT_ATTACK_PRIMARY
local PLAYERANIMEVENT_ATTACK_SECONDARY = PLAYERANIMEVENT_ATTACK_SECONDARY
local PLAYERANIMEVENT_RELOAD = PLAYERANIMEVENT_RELOAD
local PLAYERANIMEVENT_JUMP = PLAYERANIMEVENT_JUMP
local PLAYERANIMEVENT_CANCEL_RELOAD = PLAYERANIMEVENT_CANCEL_RELOAD

--------------------------------------------------------------------------------

local Entity_GetTable = EntityMeta.GetTable
local Entity_IsOnGround = EntityMeta.IsOnGround
local Entity_WaterLevel = EntityMeta.WaterLevel
local Entity_GetMoveType = EntityMeta.GetMoveType
local Entity_LookupSequence = EntityMeta.LookupSequence
local Entity_SetPlaybackRate = EntityMeta.SetPlaybackRate
local Entity_SetIK = EntityMeta.SetIK
local Entity_SetFlexWeight = EntityMeta.SetFlexWeight

local Player_InVehicle = PlayerMeta.InVehicle
local Player_GetVehicle = PlayerMeta.GetVehicle
local Player_Crouching = PlayerMeta.Crouching
local Player_IsSpeaking = PlayerMeta.IsSpeaking
local Player_VoiceVolume = PlayerMeta.VoiceVolume
local Player_IsTyping = PlayerMeta.IsTyping
local Player_IsPlayingTaunt = PlayerMeta.IsPlayingTaunt
local Player_GetActiveWeapon = PlayerMeta.GetActiveWeapon
local Player_GetAllowWeaponsInVehicle = PlayerMeta.GetAllowWeaponsInVehicle
local Player_AnimRestartGesture = PlayerMeta.AnimRestartGesture
local Player_AnimRestartMainSequence = PlayerMeta.AnimRestartMainSequence
local Player_AnimResetGestureSlot = PlayerMeta.AnimResetGestureSlot
local Player_AnimSetGestureWeight = PlayerMeta.AnimSetGestureWeight
local Player_TranslateWeaponActivity = PlayerMeta.TranslateWeaponActivity

--------------------------------------------------------------------------------

--[[
-
]]
local function override()

    local GM = gmod.GetGamemode()

    local SPEED_RUN = 150 ^ 2 -- Squared
    local SPEED_WALK = .5 ^ 2 -- Squared

    local curTime

    local ply, pTable
    local calcIdeal, calcSeqOverride

    local velocity

    local moveType
    local isOnGround
    local isInVehicle

    --[[
    -
    ]]
    function GM:CalcMainActivity(_ply, _velocity)

        curTime = CurTime()

        ply, pTable = _ply, Entity_GetTable(_ply)
		calcIdeal, calcSeqOverride = ACT_MP_STAND_IDLE, -1

        velocity = _velocity

        moveType = Entity_GetMoveType(ply)
        isOnGround = Entity_IsOnGround(ply)
        isInVehicle = Player_InVehicle(ply)

		self:HandlePlayerLanding()

		if self:HandlePlayerNoClipping()
			or self:HandlePlayerDriving()
			or self:HandlePlayerVaulting()
			or self:HandlePlayerJumping()
			or self:HandlePlayerSwimming()
			or self:HandlePlayerDucking()
        then

		else

			local speed = velocity:Length2DSqr()
			if speed > SPEED_RUN then
				calcIdeal = ACT_MP_RUN
			elseif speed > SPEED_WALK then
				calcIdeal = ACT_MP_WALK
			end

		end

		pTable.m_bWasOnGround = isOnGround
		pTable.m_bWasNoclipping = moveType == MOVETYPE_NOCLIP and not isInVehicle

		return calcIdeal, calcSeqOverride
	end

    --[[
    -
    ]]
	function GM:HandlePlayerLanding()

		if moveType == MOVETYPE_NOCLIP then
            return
        end

		if isOnGround and not ply.m_bWasOnGround then
			Player_AnimRestartGesture(ply, GESTURE_SLOT_JUMP, ACT_LAND, true)
		end

	end

    --[[
    -
    ]]
	function GM:HandlePlayerNoClipping()

		if moveType ~= MOVETYPE_NOCLIP or isInVehicle then

			if pTable.m_bWasNoclipping then
				pTable.m_bWasNoclipping = nil

				Player_AnimResetGestureSlot(ply, GESTURE_SLOT_CUSTOM)

				if CLIENT then
					Entity_SetIK(ply, true)
				end

			end

			return
		end

    	Player_AnimResetGestureSlot(ply, GESTURE_SLOT_CUSTOM, ACT_GMOD_NOCLIP_LAYER, false)

    	if CLIENT then
			Entity_SetIK(ply, false)
		end

		return true
	end

    --[[
    -
    ]]
	function GM:HandlePlayerDriving()

        if not isInVehicle then
            return
        end

		local vehicle = Player_GetVehicle(ply)
		local class = vehicle:GetClass()

		if not vehicle.HandleAnimation and vehicle.GetVehicleClass then

			local t = list.Get('Vehicles')[vehicle:GetVehicleClass()]
			if t and t.Members and t.Members.HandleAnimation then
				vehicle.HandleAnimation = t.Members.HandleAnimation
			else
                -- Prevent this if block from trying to assign HandleAnimation again.
				vehicle.HandleAnimation = true
			end

		end

		if isfunction(vehicle.HandleAnimation) then
			local seq = vehicle:HandleAnimation(ply)
			if seq ~= nil then
				calcSeqOverride = seq
			end
		end

		if calcSeqOverride == -1 then
            -- vehicle.HandleAnimation did not give us an animation

			if class == 'prop_vehicle_jeep' then
				calcSeqOverride = Entity_LookupSequence(ply, 'drive_jeep')
			elseif ( class == "prop_vehicle_airboat" ) then
				calcSeqOverride = Entity_LookupSequence(ply, 'drive_airboat')
			elseif class == 'prop_vehicle_prisoner_pod' and vehicle:GetModel() == 'models/vehicles/prisoner_pod_inner.mdl' then
				-- HACK!!
				calcSeqOverride = Entity_LookupSequence(ply, 'drive_pd')
			else
				calcSeqOverride = Entity_LookupSequence(ply, 'sit_rollercoaster')
			end

		end

		local useAnims
            = calcSeqOverride == Entity_LookupSequence(ply, 'sit_rollercoaster')
            or calcSeqOverride == Entity_LookupSequence(ply, 'sit')

		if useAnims and Player_GetAllowWeaponsInVehicle(ply) then

            local weapon = Player_GetActiveWeapon(ply)
            if IsValid(weapon) then

                local holdType = weapon:GetHoldType()
    			if holdType == 'smg' then
                    holdType = 'smg1'
                end

    			local seqId = Entity_LookupSequence(ply, 'sit_' .. holdType)
    			if seqId ~= -1 then
    				calcSeqOverride = seqId
    			end

            end

		end

		return true
	end

    --[[
    -
    ]]
	function GM:HandlePlayerVaulting()

		if velocity:Length() < 1000 or isOnGround then
            return
        end

		calcIdeal = ACT_MP_SWIM

		return true
	end

    --[[
    -
    ]]
	function GM:HandlePlayerJumping()

		if moveType == MOVETYPE_NOCLIP then
			pTable.m_bJumping = false
			return
		end

		-- airwalk more like hl2mp, we airwalk until we have 0 velocity, then it's the jump animation
		-- underwater we're alright we airwalking
		if not pTable.m_bJumping and not isOnGround and Entity_WaterLevel(ply) <= 0 then

			if not pTable.m_fGroundTime then
				pTable.m_fGroundTime = curTime

			elseif curTime - pTable.m_fGroundTime > 0 and velocity:Length2DSqr() < SPEED_WALK then
				pTable.m_bJumping = true
				pTable.m_bFirstJumpFrame = false
				pTable.m_flJumpStartTime = 0

			end

		end

		if pTable.m_bJumping then

			if pTable.m_bFirstJumpFrame then
				pTable.m_bFirstJumpFrame = false
				Player_AnimRestartMainSequence(ply)
			end

			if Entity_WaterLevel(ply) >= 2 or curTime - pTable.m_flJumpStartTime > 0.2 and isOnGround then
				pTable.m_bJumping = false
				pTable.m_fGroundTime = nil
				Player_AnimRestartMainSequence(ply)
			end

            if pTable.m_bJumping then
                calcIdeal = ACT_MP_JUMP
                return true
            end

		end

		return false
	end

    --[[
    -
    ]]
	function GM:HandlePlayerSwimming()

		if Entity_WaterLevel(ply) < 2 or isOnGround then
			pTable.m_bInSwim = false
			return false
		end

		calcIdeal = ACT_MP_SWIM
		pTable.m_bInSwim = true

		return true
	end

    --[[
    -
    ]]
	function GM:HandlePlayerDucking()

		if not Player_Crouching(ply) then
            return false
        end

		if velocity:Length2DSqr() > SPEED_WALK then
			calcIdeal = ACT_MP_CROUCHWALK
		else
			calcIdeal = ACT_MP_CROUCH_IDLE
		end

		return true
	end

    ----------------------------------------------------------------------------

    --[[
    -
    ]]
    function GM:GrabEarAnimation(ply)

    	-- Don't show this when we're playing a taunt!
    	if Player_IsPlayingTaunt(ply) then
            return
        end

        local anim_chatGestureWeight = ply.anim_chatGestureWeight or 0

    	if Player_IsTyping(ply) then
    		anim_chatGestureWeight = math_Approach(anim_chatGestureWeight, 1, FrameTime() * 5.0)

    	elseif anim_chatGestureWeight > 0 then
    		anim_chatGestureWeight = math_Approach(anim_chatGestureWeight, 0, FrameTime() * 5.0)

    	end

    	if anim_chatGestureWeight > 0 then
            ply.anim_chatGestureWeight = anim_chatGestureWeight

            Player_AnimRestartGesture(ply, GESTURE_SLOT_VCD, ACT_GMOD_IN_CHAT, true)
    		Player_AnimSetGestureWeight(ply, GESTURE_SLOT_VCD, anim_chatGestureWeight)

    	end

    end

    --[[
    - Moves the mouth when talking on voicecom
    ]]
    function GM:MouthMoveAnimation(ply)
        local speaking = Player_IsSpeaking(ply)

        if speaking == false and ply.anim_wasSpeaking == false then
            return
        end

        ply.anim_wasSpeaking = speaking

        local weight = 0
        if speaking == true then
            weight = math_Clamp(Player_VoiceVolume(ply) * 2, 0, 2)
        end

    	local flexes = {
    		ply:GetFlexIDByName('jaw_drop'),
    		ply:GetFlexIDByName('left_part'),
    		ply:GetFlexIDByName('right_part'),
    		ply:GetFlexIDByName('left_mouth_drop'),
    		ply:GetFlexIDByName('right_mouth_drop')
    	}

    	for _, flex in ipairs(flexes) do
            Entity_SetFlexWeight(ply, flex, weight)
    	end

    end

    --[[ ]]
    function GM:UpdateAnimation(ply, velocity, maxSeqGroundSpeed)

        local len = velocity:Length()
        local movement = 1.0

        if len > 0.2 then
            movement = len / maxSeqGroundSpeed
        end

        local rate = math.min(movement, 2)

        -- if we're under water we want to be constantly swimming..
        if Entity_WaterLevel(ply) >= 2 then
            rate = math.max(rate, 0.5)
        elseif not Entity_IsOnGround(ply) and len >= 1000 then
            rate = 0.1
        end

------------------------------------------------------------------------------------
-- King davids Lightsaber animation speed fix
------------------------------------------------------------------------------------

        
		if ply:Alive() and IsValid( ply:GetActiveWeapon() ) and ply:GetActiveWeapon().IsLightsaber then
			Entity_SetPlaybackRate( ply, ply.SeqOverrideRate or rate )
		else
			Entity_SetPlaybackRate( ply, rate )
		end

        if CLIENT then
            self:GrabEarAnimation(ply)
            self:MouthMoveAnimation(ply)
        end

    end

    ----------------------------------------------------------------------------

    local idleActivityTranslate = {
        [ACT_MP_STAND_IDLE]				          = ACT_HL2MP_IDLE,
        [ACT_MP_WALK]						      = ACT_HL2MP_IDLE + 1,
        [ACT_MP_RUN]							  = ACT_HL2MP_IDLE + 2,
        [ACT_MP_CROUCH_IDLE]			          = ACT_HL2MP_IDLE + 3,
        [ACT_MP_CROUCHWALK]			              = ACT_HL2MP_IDLE + 4,
        [ACT_MP_ATTACK_STAND_PRIMARYFIRE]         = ACT_HL2MP_IDLE + 5,
        [ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	      = ACT_HL2MP_IDLE + 5,
        [ACT_MP_RELOAD_STAND]				      = ACT_HL2MP_IDLE + 6,
        [ACT_MP_RELOAD_CROUCH]				      = ACT_HL2MP_IDLE + 6,
        [ACT_MP_JUMP]						      = ACT_HL2MP_JUMP_SLAM,
        [ACT_MP_SWIM]						      = ACT_HL2MP_IDLE + 9,
        [ACT_LAND]							      = ACT_LAND
    }

    --[[
	-- it is preferred you return ACT_MP_* in CalcMainActivity, and if you have a specific need to not tranlsate through the weapon do it here
    ]]
	function GM:TranslateActivity(ply, act)
		local newact = Player_TranslateWeaponActivity(ply, act)

		-- select idle anims if the weapon didn't decide
		if act == newact then
			return idleActivityTranslate[act]
		end

		return newact
	end


    ----------------------------------------------------------------------------

    --[[
    -
    ]]
	function GM:DoAnimationEvent(ply, event, data)

		if event == PLAYERANIMEVENT_ATTACK_PRIMARY then

			if Player_Crouching(ply) then
				Player_AnimRestartGesture(ply, GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_ATTACK_CROUCH_PRIMARYFIRE, true)
			else
				Player_AnimRestartGesture(ply, GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_ATTACK_STAND_PRIMARYFIRE, true)
			end

			return ACT_VM_PRIMARYATTACK

		elseif event == PLAYERANIMEVENT_ATTACK_SECONDARY then

			-- there is no gesture, so just fire off the VM event
			return ACT_VM_SECONDARYATTACK

		elseif event == PLAYERANIMEVENT_RELOAD then

			if Player_Crouching(ply) then
				Player_AnimRestartGesture(ply, GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_RELOAD_CROUCH, true)
			else
				Player_AnimRestartGesture(ply, GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_RELOAD_STAND, true)
			end

			return ACT_INVALID

		elseif event == PLAYERANIMEVENT_JUMP then

			ply.m_bJumping = true
			ply.m_bFirstJumpFrame = true
			ply.m_flJumpStartTime = CurTime()

			Player_AnimRestartMainSequence(ply)

			return ACT_INVALID

		elseif event == PLAYERANIMEVENT_CANCEL_RELOAD then

			Player_AnimResetGestureSlot(ply, GESTURE_SLOT_ATTACK_AND_RELOAD)

			return ACT_INVALID
		end

	end

end

--[[
-
--]]
local function onLoad()
    _animation_loaded = true
    -- timer.Simple(0, function()
        override()
    -- end)
end
hook.Add('PostGamemodeLoaded', '_bp-animation', onLoad)
hook.Add('OnReloaded', '_bp-animation', onLoad)

-- Debugging
if _animation_loaded then
    onLoad()
end
