--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_bp/lua/autorun/client/_voice.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local __identifier = 'ifn-ff'

local STATUS_TALKING = 0
local STATUS_SILENT = 1

local _status = STATUS_SILENT

--[[
- Send the voice status of the local player to the server.
-
- @param int status - STATUS_*
]]
local function sendVoiceStatus(status)

    net.Start(__identifier)
        net.WriteUInt(status, 1)
    net.SendToServer()

end

--[[
- Change the voice status.
-
- @param int status - STATUS_*
- @param bool network=false
]]
local function changeVoiceStatus(status, network)
    _status = status
    network = network or false

    if network == true then
        sendVoiceStatus(_status)
    end

end

--[[
-- Called whenever the local player starts the voice chat.
]]
local function onPlayerStartVoice(ply)

    -- To make sure it is only called for the local player.. (which it should)
    if ply ~= LocalPlayer() then
        return
    end

    -- Change the status to talking..
    changeVoiceStatus(STATUS_TALKING, true)

end
hook.Add('PlayerStartVoice', __identifier, onPlayerStartVoice)

--[[
-- Called whenever the local player end the voice chat.
]]
local function onPlayerEndVoice(ply)

    -- To make sure it is only called for the local player.. (which it should)
    if ply ~= LocalPlayer() then
        return
    end

    -- Change the status to silent..
    changeVoiceStatus(STATUS_SILENT, true)

end
hook.Add('PlayerEndVoice', __identifier, onPlayerEndVoice)

do

    local _nextTick = 0

    --[[
    - Called every tick.
    ]]
    local function onTick()

        -- Don't have to send our status if not talking..
        if _status ~= STATUS_TALKING then
            return
        end

        if _nextTick > SysTime() then
            return
        end
        _nextTick = SysTime() + .5

        sendVoiceStatus(_status)

    end
    hook.Add('Tick', __identifier, onTick)

end