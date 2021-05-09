--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_tickets/lua/icefuse/ticket/sh_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseTicket = IcefuseTicket or {

    version = '1.00.00',
    versionNr = 10000,

    name = "Icefuse Ticket",
    alias = "IcefuseTicket",

    config = {},
    hook = {}

}

--------------------------------------------------------------------------------

--[[
- Includes a file.
- @arg string file
- @arg string type
]]
function IcefuseTicket.include(file, type)
    if type == 'server' or type == 'shared' then
        if SERVER then
            include(file)
        end
    end
    if type == 'client' or type == 'shared' then
        if SERVER then
            AddCSLuaFile(file)
        else
            include(file)
        end
    end
end

--------------------------------------------------------------------------------

-- Include files
do

    IcefuseTicket.include('config/server.lua', 'server')
    IcefuseTicket.include('config/client.lua', 'client')

    IcefuseTicket.include('include/sv_ticket.lua', 'server')
    IcefuseTicket.include('include/cl_ticket.lua', 'client')

    IcefuseTicket.include('include/views/cl_tickets.lua', 'client')

end
