--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_tickets/lua/icefuse/ticket/config/client.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseTicket.config.actionsMenu = {
    {
        icon = 'icon16/page_copy.png',
        text = "Copy SteamID",
        onClick = function(client, player)
            SetClipboardText(player:SteamID())
        end
    },
    {'spacer'},
    {
        icon = 'icon16/user_go.png',
        text = "Go to player",
        onClick = function(client, player)
            RunConsoleCommand('icefuse', 'goto', player:SteamID())
        end
    },
    {
        icon = 'icon16/user_suit.png',
        text = "Bring player",
        onClick = function(client, player)
            RunConsoleCommand('icefuse', 'bring', player:SteamID())
        end
    },
    {
        icon = 'icon16/user.png',
        text = "Return player",
        onClick = function(client, player)
            RunConsoleCommand('icefuse', 'return', player:SteamID())
        end
    }
}
