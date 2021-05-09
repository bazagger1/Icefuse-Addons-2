--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_main/lua/icefuse_admin/client/cl_jail.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

surface.CreateFont('IcefuseAdmin.jail', {
    font = 'Roboto',
    size = 17,
    weight = 500,
    antialias = true,
    shadow = false
})

local localServed, localServedValue = 0, 0
hook.Add('HUDPaint', 'IcefuseAdmin.jail', function()
    local client = LocalPlayer()

    if IsValid(client) == false then
        return
    end

    if client:GetDataVar('jailed') ~= true then
        return
    end

    local length = client:GetDataVar('jailLength') or 0
    local served = client:GetDataVar('jailServed') or 0
    local reason = client:GetDataVar('jailReason') or ""

    if localServed ~= served then
        localServed, localServedValue = served, served
    end
    localServedValue = localServedValue + RealFrameTime()

    local x, y = ScrW() * .5, 80

    draw.SimpleText("You have been jailed with the following reason:", "IcefuseAdmin.jail",
        x, y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    draw.SimpleText(reason, "IcefuseAdmin.jail",
        x, y + 24, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

    if length ~= 0 then
        draw.SimpleText("You will be released in "..math.ceil(length-localServedValue).." seconds.", "IcefuseAdmin.jail",
            x, y + 54, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    end

end)
