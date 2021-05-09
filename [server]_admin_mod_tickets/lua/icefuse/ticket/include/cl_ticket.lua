--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_tickets/lua/icefuse/ticket/include/cl_ticket.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefuseTicket

--------------------------------------------------------------------------------

Addon.Ticket = Addon.Ticket or {__meta__ = {}}
local Ticket = Addon.Ticket

--------------------------------------------------------------------------------

--[[
- @arg table
]]
Addon._tickets = Addon._tickets or {}
local _tickets = Addon._tickets

--[[
- @arg table
]]
Addon._ticketViews = Addon._ticketViews or {}
local _ticketViews = Addon._ticketViews

--[[
- @arg table
]]
Addon._ticketContainerView = Addon._ticketContainerView or nil

-- Networking
--------------------------------------------------------------------------------

local networkHandlers = {

    -- When a ticket has been opened
    ['ticket.onOpened'] = function()
        local id = net.ReadUInt(32)
        local player = net.ReadEntity()
        local description = net.ReadString()

        if _tickets[id] then
            _ticketViews[id]:remove()
        end

        local ticket = Ticket:new(id, player, description, nil)
        local ticketView = Addon.TicketView:new(ticket)

        _tickets[id], _ticketViews[id] = ticket, ticketView

        ticket:onOpened()
        ticketView:update()

        Addon._ticketContainerView:performLayout()

        surface.PlaySound('HL1/fvox/bell.wav')

    end,

    -- When the ticket has been assigned to someone
    ['ticket.onAssigned'] = function(ply)
        local id = net.ReadUInt(32)
        local assignee = net.ReadEntity()

        -- Ignore tickets we dont know of
        if _tickets[id] == nil then
            return
        end

        -- Remove the ticket if it is not assigned to us
        if assignee ~= LocalPlayer() then

            Addon.onTicketClosed(id)

            return
        end

        local ticket, ticketView = _tickets[id], _ticketViews[id]

        ticket:onAssigned(assignee)
        ticketView:update()

        Addon._ticketContainerView:performLayout()

    end,

    -- When a ticket has been closed
    ['ticket.onClosed'] = function(ply)
        local id = net.ReadUInt(32)
        Addon.onTicketClosed(id)
    end,

}
net.Receive('IcefuseTicket', function(len, ply)
    local handler = networkHandlers[net.ReadString()]
    if handler ~= nil then
        handler(ply)
    end
end)

--------------------------------------------------------------------------------

--[[
- @arg number id
]]
function Addon.onTicketClosed(id)

    -- Ignore tickets we dont know of
    if _tickets[id] == nil then
        return
    end

    local ticket, ticketView = _tickets[id], _ticketViews[id]

    ticket:onClosed()
    ticketView:remove()

    _tickets[id], _ticketViews[id] = nil, nil

    Addon._ticketContainerView:performLayout()

end

--------------------------------------------------------------------------------

-- Initialize the ticket container
hook.Add('Tick', 'IcefuseTicket.ticketContainerInit', function()
    if IsValid(LocalPlayer()) then
        hook.Remove('Tick', 'IcefuseTicket.ticketContainerInit')

        Addon._ticketContainerView = Addon.TicketContainerView:new()
        Addon._ticketContainerView:setTicketViews(_ticketViews)
        Addon._ticketContainerView:performLayout()

    end
end)

-- For debugging purposes
-- timer.Simple(1, function()
--
--     if Addon._ticketContainerView ~= nil then
--         Addon._ticketContainerView:remove()
--         Addon._ticketContainerView = nil
--     end
--
--     Addon._ticketContainerView = Addon.TicketContainerView:new()
--     Addon._ticketContainerView:setTicketViews(_ticketViews)
--
-- end)

--------------------------------------------------------------------------------

--[[
- Ticket
]]
do
    local Static, Meta = Ticket, Ticket.__meta__
    Meta.__index = Meta

    --[[
    - States the ticket can be at.
    ]]
    Static.STATUS_OPEN = 1
    Static.STATUS_IN_PROGRESS = 2
    Static.STATUS_CLOSED = 3

    --[[ @var number ]]
    Meta._id = nil

    --[[
    - @var number - STATUS_*
    ]]
    Meta._status = Static.STATUS_OPEN

    --[[
    - The player that has opened the ticket.
    - @var player
    ]]
    Meta._player = nil

    --[[
    - The player that is assigned to deal with the situation.
    - @var player|nil
    ]]
    Meta._assignee = nil

    --[[
    - The description destribing the situation.
    -@var string
    ]]
    Meta._description = "Unknown"

    --[[
    - @arg number id
    - @arg player player
    - @arg string description
    - @arg string|nil assignee
    ]]
    function Static:new(id, player, description, assignee)
        local instance = setmetatable({}, self.__meta__)

        instance._id = id
        instance._player = player
        instance._description = description

        instance._assignee = assignee or nil

        instance._status = self.STATUS_OPEN

        return instance
    end

    ----------------------------------------------------------------------------

    --[[ ]]
    function Meta:accept()
        net.Start('IcefuseTicket')
            net.WriteString('ticket.accept')
            net.WriteInt(self._id, 32)
        net.SendToServer()
    end

    --[[ ]]
    function Meta:reject()
        net.Start('IcefuseTicket')
            net.WriteString('ticket.reject')
            net.WriteInt(self._id, 32)
        net.SendToServer()
    end

    --[[ ]]
    function Meta:finish()
        net.Start('IcefuseTicket')
            net.WriteString('ticket.finish')
            net.WriteInt(self._id, 32)
        net.SendToServer()
    end

    --[[ ]]
    function Meta:cancel()
        net.Start('IcefuseTicket')
            net.WriteString('ticket.cancel')
            net.WriteInt(self._id, 32)
        net.SendToServer()
    end

    ----------------------------------------------------------------------------

    --[[ ]]
    function Meta:onOpened()

        if self._status == Static.STATUS_IN_PROGRESS then
            self._assignee = nil
        end

        self._status = Static.STATUS_OPEN

    end

    --[[ ]]
    function Meta:onAssigned(assignee)
        self._status = Static.STATUS_IN_PROGRESS
        self._assignee = assignee
    end

    --[[ ]]
    function Meta:onClosed()
        self._status = Static.STATUS_CLOSED
    end

    ----------------------------------------------------------------------------

    --[[ @return boolean ]]
    function Meta:isOpen()
        return self._status == Static.STATUS_OPEN
    end

    --[[ @return boolean ]]
    function Meta:isInProgress()
        return self._status == Static.STATUS_IN_PROGRESS
    end

    --[[ @return boolean ]]
    function Meta:isClosed()
        return self._status == Static.STATUS_CLOSED
    end

    ----------------------------------------------------------------------------

    --[[ @return number ]]
    function Meta:getId()
        return self._id
    end

    --[[ @return player|nil ]]
    function Meta:getPlayer()
        return self._player
    end

    --[[ @return player|nil ]]
    function Meta:getAssignee()
        return self._assignee
    end

    --[[ @return player|nil ]]
    function Meta:getDescription()
        return self._description
    end

end
