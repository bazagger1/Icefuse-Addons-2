--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_tickets/lua/icefuse/ticket/include/views/cl_tickets.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefuseTicket

--------------------------------------------------------------------------------

Addon.TicketView = Addon.TicketView or {__meta__ = {}}
local TicketView = Addon.TicketView

Addon.TicketContainerView = Addon.TicketContainerView or {__meta__ = {}}
local TicketContainerView = Addon.TicketContainerView

--------------------------------------------------------------------------------

surface.CreateFont('IcefuseTicket.title', {
    font = 'Roboto',
    size = 14,
    weight = 800,
    antialias = true,
    shadow = false
})
surface.CreateFont('IcefuseTicket.title2', {
    font = 'Roboto',
    size = 14,
    weight = 500,
    antialias = true,
    shadow = false
})
surface.CreateFont('IcefuseTicket.description', {
    font = 'Roboto',
    size = 15,
    weight = 500,
    antialias = true,
    shadow = false
})
surface.CreateFont('IcefuseTicket.button', {
    font = 'Roboto',
    size = 14,
    weight = 500,
    antialias = true,
    shadow = false
})

--------------------------------------------------------------------------------

local material_blur = Material("pp/motionblur")

--------------------------------------------------------------------------------

--[[
- @arg string text
- @arg string font
- @arg number width
]]
local function textWrap(text, font, width)
    local words = string.Split(text, ' ')

    surface.SetFont(font)
    local length, totalTextW = #words, 0
    for i=1, length, 1 do
        local textW = surface.GetTextSize(i == 1 and words[i] or ' '..words[i])
        if totalTextW + textW > width then
            totalTextW = textW
            words[i] = '\n'..words[i]
        else
            totalTextW = totalTextW + textW
            words[i] = i == 1 and words[i] or ' '..words[i]
        end
    end

    return table.concat(words)
end

--------------------------------------------------------------------------------

--[[
- Draw a blured rectangle on the screen.
- @arg number x
- @arg number y
- @arg number w
- @arg number h
]]
-- local function drawBluredRect(x, y, w, h)
    -- local amount, heavyness = 6, 3

    -- surface.SetMaterial(material_blur)
    -- for i=1, heavyness do
        -- material_blur:SetFloat('$blur', (i / 3) * amount)
        -- material_blur:Recompute()

        -- render.UpdateScreenEffectTexture()
        -- surface.DrawTexturedRect(0, 0, ScrW(), ScrH())

        -- render.SetScissorRect(x, y, x + w, y + h, true)
            -- render.SetMaterial(material_blur)
            -- render.DrawScreenQuad()
        -- render.SetScissorRect(0, 0, 0, 0, false)

    -- end

-- end

--[[
- Draws a blured rectangle over the whole panel.
- @arg panel panel
]]
-- local function drawBluredPanel(panel)
    -- local x, y = panel:LocalToScreen(0, 0)
    -- local w, h = panel:GetSize()

    -- drawBluredRect(x, y, w, h)

-- end

--------------------------------------------------------------------------------

--[[
- TicketView
]]
do
    local Static, Meta = TicketView, TicketView.__meta__
    Meta.__index = Meta

    --[[ @var table ]]
    Meta._options = nil

    --[[ @var panel ]]
    Meta._panel = nil

    --[[ @var [Ticket] ]]
    Meta._ticket = nil

    --[[ ]]
    function Static:new(ticket)
        local instance = setmetatable({}, self.__meta__)

        instance._options = nil
        instance._panel = nil

        instance._ticket = ticket

        instance:_init()

        return instance
    end

    --[[ ]]
    function Meta:remove()
        self._panel:Remove()
    end

    --[[ ]]
    function Meta:show()
        self._panel:SetVisible(true)
    end

    --[[ ]]
    function Meta:hide()
        self._panel:SetVisible(false)
    end

    --[[ ]]
    function Meta:_init()

        local options = {
            title = ""
        }
        self._options = options

        local window = vgui.Create('EditablePanel')
        self._panel = window

        window:SetVisible(false)
        window:SetPos(40, 40)
        window:SetSize(200, 100)
        window.Paint = function(pnl, w, h)

            surface.SetDrawColor(255, 255, 255)
            -- drawBluredPanel(pnl)

            surface.SetDrawColor(0, 0, 0, 220)
            surface.DrawRect(0, 0, w, h)

            surface.SetDrawColor(0, 0, 0)
            surface.DrawOutlinedRect(0, 0, w, h)

            surface.SetDrawColor(0, 0, 0, 60)
            surface.DrawRect(0, 0, w, 24)

            surface.SetDrawColor(0, 0, 0)
            surface.DrawOutlinedRect(0, 0, w, 24)

            draw.SimpleText(options.title, 'IcefuseTicket.title',
                6, 12,
                Color(240, 240, 240), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        end

        local container = vgui.Create('DPanel', window)
        window.container = container
        container:SetPos(0, 28)
        container:SetSize(window:GetWide(), 0)
        container.Paint = function(pnl, w, h) end

        local descriptionLabel = vgui.Create('DLabel', container)
        window.descriptionLabel = descriptionLabel
        descriptionLabel:SetPos(8, 0)
        descriptionLabel:SetSize(container:GetWide() - 16, 0)
        descriptionLabel:SetFont('IcefuseTicket.description')
        descriptionLabel:SetTextColor(Color(230, 230, 230))
        descriptionLabel.Paint = function(pnl, w, h) end

        local buttonContainer = vgui.Create('DPanel', container)
        window.buttonContainer = buttonContainer
        buttonContainer:SetPos(0, 0)
        buttonContainer:SetSize(container:GetWide(), 24)
        buttonContainer.Paint = function(pnl, w, h) end

        function options.updateButtonPanel()

            buttonContainer:Clear()

            local actionsButton = vgui.Create('DButton', buttonContainer)
            actionsButton:SetPos(5, 0)
            actionsButton:SetSize(60, 24)
            actionsButton:SetFont('IcefuseTicket.button')
            actionsButton:SetTextColor(Color(255, 255, 255, 180))
            actionsButton:SetText("Actions")
            actionsButton.Paint = function(pnl, w, h)
                if pnl:IsHovered() then
                    surface.SetDrawColor(255, 100, 0, 160)
                else
                    surface.SetDrawColor(255, 255, 255, 10)
                end
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(0, 0, 0, 200)
                surface.DrawOutlinedRect(0, 0, w, h)
            end
            actionsButton.DoClick = function(pnl)

                local addOptions
                addOptions = function(menu, options)
                    for _, option in pairs(options) do
                        if option[1] == 'spacer' then
                            menu:AddSpacer()
                        elseif option[1] == 'submenu' then
                            local subMenu = menu:AddSubMenu(option[2])
                            addOptions(subMenu, option[3])
                        else
                            local func = function()
                                option.onClick(LocalPlayer(), self._ticket:getPlayer())
                            end
                            local optionButton = menu:AddOption(option.text, func)
                            if Material(tostring(option.icon)) ~= nil then
                                optionButton:SetIcon(option.icon)
                            end
                        end
                    end
                end

                local menu = DermaMenu()

                addOptions(menu, Addon.config.actionsMenu)

                -- if self._ticket:getAssignee() ~= LocalPlayer() then
                    -- menu:AddSpacer()
                    -- menu:AddOption("Close window", function()
                        -- Addon.onTicketClosed(self._ticket:getId())
                    -- end)
                -- end

                menu:Open()

            end

            if self._ticket:isInProgress() then

                local finishButton = vgui.Create('DButton', buttonContainer)
                finishButton:SetPos(120 + 15, 0)
                finishButton:SetSize(60, 24)
                finishButton:SetFont('IcefuseTicket.button')
                finishButton:SetTextColor(Color(255, 255, 255, 180))
                finishButton:SetText("Finish")
                finishButton.Paint = function(pnl, w, h)
                    if pnl:IsHovered() then
                        surface.SetDrawColor(0, 200, 0, 160)
                    else
                        surface.SetDrawColor(255, 255, 255, 10)
                    end
                    surface.DrawRect(0, 0, w, h)
                    surface.SetDrawColor(0, 0, 0, 200)
                    surface.DrawOutlinedRect(0, 0, w, h)
                end

                local cancelButton = vgui.Create('DButton', buttonContainer)
                cancelButton:SetPos(60 + 10, 0)
                cancelButton:SetSize(60, 24)
                cancelButton:SetFont('IcefuseTicket.button')
                cancelButton:SetTextColor(Color(255, 255, 255, 180))
                cancelButton:SetText("Cancel")
                cancelButton.Paint = function(pnl, w, h)
                    if pnl:IsHovered() then
                        surface.SetDrawColor(255, 0, 0, 160)
                    else
                        surface.SetDrawColor(255, 255, 255, 10)
                    end
                    surface.DrawRect(0, 0, w, h)
                    surface.SetDrawColor(0, 0, 0, 200)
                    surface.DrawOutlinedRect(0, 0, w, h)
                end

                finishButton.DoClick = function(pnl)
                    self._ticket:finish()
                end
                cancelButton.DoClick = function(pnl)
                    self._ticket:cancel()
                end

            else

                local acceptButton = vgui.Create('DButton', buttonContainer)
                acceptButton:SetPos(120 + 15, 0)
                acceptButton:SetSize(60, 24)
                acceptButton:SetFont('IcefuseTicket.button')
                acceptButton:SetTextColor(Color(255, 255, 255, 180))
                acceptButton:SetText("Accept")
                acceptButton.Paint = function(pnl, w, h)
                    if pnl:IsHovered() then
                        surface.SetDrawColor(0, 200, 0, 160)
                    else
                        surface.SetDrawColor(255, 255, 255, 10)
                    end
                    surface.DrawRect(0, 0, w, h)
                    surface.SetDrawColor(0, 0, 0, 200)
                    surface.DrawOutlinedRect(0, 0, w, h)
                end

                local rejectButton = vgui.Create('DButton', buttonContainer)
                rejectButton:SetPos(60 + 10, 0)
                rejectButton:SetSize(60, 24)
                rejectButton:SetFont('IcefuseTicket.button')
                rejectButton:SetTextColor(Color(255, 255, 255, 180))
                rejectButton:SetText("Ignore")
                rejectButton.Paint = function(pnl, w, h)
                    if pnl:IsHovered() then
                        surface.SetDrawColor(255, 0, 0, 160)
                    else
                        surface.SetDrawColor(255, 255, 255, 10)
                    end
                    surface.DrawRect(0, 0, w, h)
                    surface.SetDrawColor(0, 0, 0, 200)
                    surface.DrawOutlinedRect(0, 0, w, h)
                end

                acceptButton.DoClick = function(pnl)
                    self._ticket:accept()
                end
                rejectButton.DoClick = function(pnl)
                    -- self._ticket:reject()
					Addon.onTicketClosed(self._ticket:getId())
                end

            end
			
        end

    end

    --[[ ]]
    function Meta:update()

        local panel = self._panel
        local options = self._options

        options.title = self._ticket:getId().."  -  "..self._ticket:getPlayer():Nick()

        local descriptionLabel = panel.descriptionLabel
        descriptionLabel:SetText(textWrap(self._ticket:getDescription(), descriptionLabel:GetFont(), descriptionLabel:GetWide()))
        descriptionLabel:SizeToContentsY(6)

        local buttonContainer = panel.buttonContainer
        buttonContainer:SetPos(0, descriptionLabel:GetTall() + 4)

        options.updateButtonPanel()

        -- Size to children
        local container = panel.container
        container:SizeToChildren(false, true)
        container:SetTall(container:GetTall() + 6)

        -- Size to children
        panel:SizeToChildren(false, true)

    end

    --[[
    - @return panel
    ]]
    function Meta:getPanel()
        return self._panel
    end

    --[[
    - @return table
    ]]
    function Meta:getOptions()
        return self._options
    end

end

--[[
- TicketContainerView
]]
do
    local Static, Meta = TicketContainerView, TicketContainerView.__meta__
    Meta.__index = Meta
    -- TODO: Redo, this was kinda rushed

    --[[ @var table ]]
    Meta._options = nil

    --[[ @var panel ]]
    Meta._panel = nil

    --[[ @var table ]]
    Meta._ticketViews = nil

    --[[ ]]
    function Static:new()
        local instance = setmetatable({}, self.__meta__)

        instance._options = {}
        instance._panel = nil
        instance._ticketViews = {}

        instance:_init()

        return instance
    end

    --[[ ]]
    function Meta:remove()
        for _, panel in pairs(self._panel.container:GetChildren()) do
            panel:SetParent(nil)
        end
        self._panel:Remove()
    end

    --[[ ]]
    function Meta:show()
        self._panel:SetVisible(true)
    end

    --[[ ]]
    function Meta:hide()
        self._panel:SetVisible(false)
    end

    --[[ ]]
    function Meta:_init()

        local options = self._options

        options.title = ""

        local window = vgui.Create('EditablePanel')
        self._panel = window

        window:SetPos(10, 10)
        window:SetSize(200, ScrH() - 150)
        window.Paint = function(pnl, w, h) end

        local titlePanel = vgui.Create('DButton', window)
        titlePanel:SetPos(0, 0)
        titlePanel:SetSize(window:GetWide(), 24)
        titlePanel:SetText("")
        titlePanel.Paint = function(pnl, w, h)

            surface.SetDrawColor(255, 255, 255)
            -- drawBluredPanel(pnl)

            surface.SetDrawColor(0, 0, 0, 220)
            surface.DrawRect(0, 0, w, h)

            surface.SetDrawColor(0, 0, 0)
            surface.DrawOutlinedRect(0, 0, w, h)

            draw.SimpleText(options.title, 'IcefuseTicket.title2',
                6, 12,
                Color(240, 240, 240), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            if window.container:IsVisible() then
                draw.SimpleText("-", 'IcefuseTicket.title',
                    w - 6, 12,
                    Color(240, 240, 240), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("+", 'IcefuseTicket.title',
                    w - 6, 12,
                    Color(240, 240, 240), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            end

        end
        titlePanel.DoClick = function(pnl)
            window.container:SetVisible(not window.container:IsVisible())
        end

        local container = vgui.Create('DPanel', window)
        window.container = container

        container:SetPos(0, 28)
        container:SetSize(window:GetWide(), window:GetTall() - 28)
        container.Paint = function(pnl, w, h) end

    end

    --[[ ]]
    function Meta:performLayout()

        local container = self._panel.container

        local total, visible = 0, 0

        local y = 0
        for ticketId, ticketView in SortedPairs(self._ticketViews) do

            local panel = ticketView:getPanel()
            panel:SetParent(container)
            panel:SetPos(0, y)

            if y + panel:GetTall() > container:GetTall() then
                ticketView:hide()
            else
                visible = visible + 1
                ticketView:show()
            end

            total = total + 1

            y = y + panel:GetTall() + 8

        end

        self._options.title = "Tickets "..visible..(total ~= visible and " + "..(total - visible) or "")

        if total == 0 then
            self:hide()
        else
            self:show()
        end
        
    end

    --[[
    - @arg table ticketViews
    ]]
    function Meta:setTicketViews(ticketViews)
        self._ticketViews = ticketViews
    end

    --[[
    - @return panel
    ]]
    function Meta:getPanel()
        return self._panel
    end

    --[[
    - @return table
    ]]
    function Meta:getOptions()
        return self._options
    end

end
