--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/client/cl_map.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


function IcefuseAdmin.openMaps(maps)

    local window = vgui.Create('DFrame')
	window:SetTitle("Maps")
	window:SetSize(260 + 8, 320 + 4)

    window:SetDeleteOnClose(true)

	window:Center()
	window:MakePopup()

    local list = vgui.Create('DListView', window)
    list:SetPos(4, 24)
    list:SetSize(260, 300 - 24)
    list:SetMultiSelect(false)
    list:AddColumn('Map')

    for _, map in pairs(maps) do
        list:AddLine(map)
    end

    local changeButton = vgui.Create('DButton', window)
    changeButton:SetPos(4, 300)
    changeButton:SetSize(130, 20)
    changeButton:SetText("Change")

    local cancelButton = vgui.Create('DButton', window)
    cancelButton:SetPos(134, 300)
    cancelButton:SetSize(130, 20)
    cancelButton:SetText("Cancel")

    changeButton.DoClick = function(pnl)
        local selectedId = list:GetSelectedLine()
        if selectedId then
            local map = list:GetLine(selectedId):GetColumnText(1)
            RunConsoleCommand('icefuse', 'changemap', map)
        end
    end

    cancelButton.DoClick = function(pnl)
        window:Close()
    end

end

net.Receive('IcefuseAdmin.map', function()
    local maps = net.ReadTable()
    IcefuseAdmin.openMaps(maps)
end)
