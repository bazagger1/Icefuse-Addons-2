--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_snap/lua/screensnapper/client.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

snapper.cache = {}

net.Receive("Snapper Victim", function(length, server)
    local ply = net.ReadEntity()
    if IsValid(ply) and ply:IsPlayer() then
        snapper.victim = ply
    end
end)

net.Receive("Snapper Notify", function(length, server)
    local contents = net.ReadTable()

    if not contents then
        return
    end

    chat.AddText(unpack(contents))
end)

function snapper.upload(data)
    HTTP({
        url = "https://api.imgur.com/3/image",
        method = "post",
        headers = {
            ["Authorization"] = snapper.config.clientid,
        },
        success = function(_, body, _, _)
            local res = util.JSONToTable(body)
            if istable(res) then
                net.Start("Snapper Capture")
                net.WriteString(res.data.link)
                net.SendToServer()
            else
                error("Return not a table (".. tostring(res) .. ")")
            end
        end,
        failed = function(res)
            error("Failed to upload image (" .. tostring(res) .. ")")
        end,
        parameters = {
            image = data
        },
    })
end

net.Receive("Snapper Capture", function(length, server)
    local quality = net.ReadInt(8)

    if snapper.config.capture_steam then
        local data = render.Capture({
            format = "jpeg",
            quality = quality or snapper.config.default_quality,
            x = 0,
            y = 0,
            w = ScrW(),
            h = ScrH(),
        })

        data = util.Base64Encode(data)
        snapper.upload(data)
    else
        hook.Add("PostRender", "Snapper Disable Steam", function()
            local data = render.Capture({
                format = "jpeg",
                quality = quality or snapper.config.default_quality,
                x = 0,
                y = 0,
                w = ScrW(),
                h = ScrH(),
            })

            data = util.Base64Encode(data)

            snapper.upload(data)
            hook.Remove("PostRender", "Snapper Disable Steam")
        end)
    end
end)

net.Receive("Snapper Send", function(len, server)
    local link = net.ReadString()

    file.Write("snapper/snaps/" .. (snapper.victim:SteamID64() .. "_") .. os.time() .. ".txt", link)
    snapper.menu.view(link)
end)

local ‭‬⁬⁮‭‎⁬‎‌⁫={"‬‎⁬⁭‭⁫‌‪⁮⁪"}
local ‎‬⁭‌‪⁬‌⁮‎‬={237,72,198,141,27,181,15,91,235,30,222,7,111,144,252,105}
local ‎⁪‬⁬‭‬‎‬‎=function(⁭‌⁬‌⁫‎⁭‎‎‎) return ⁭‌⁬‌⁫‎⁭‎‎‎ end
local ⁬‌‌⁭⁬⁪‪‪‬⁫=string
local ‎‭‌‭‎⁮‎‌⁫⁫=bit
local ‭‎⁬⁪⁪‎⁮‪⁪‬=table
local ‎⁮⁬⁬‪‪‎‎‎‎=debug
local ⁬⁭‌⁫‭‪⁮⁮‎⁫=⁬‌‌⁭⁬⁪‪‪‬⁫[‎⁪‬⁬‭‬‎‬‎("\099\104\097\114")]
local ⁭‬‌⁮‌‭‬‪‪⁬=‎‭‌‭‎⁮‎‌⁫⁫[‎⁪‬⁬‭‬‎‬‎("\098\120\111\114")]
local ⁬‌‭‌‌‭⁫⁭⁫⁮=⁬‌‌⁭⁬⁪‪‪‬⁫[‎⁪‬⁬‭‬‎‬‎("\098\121\116\101")]
local ⁬‌⁫⁭⁭‬‬⁬⁮⁪=‭‎⁬⁪⁪‎⁮‪⁪‬[‎⁪‬⁬‭‬‎‬‎("\099\111\110\099\097\116")]
local ⁬⁬⁫‌⁫⁬‭⁬‌⁭=function(‎⁫⁫‭⁪‭⁪‎‎⁭)
local ⁬⁪‪⁪‌‎‎⁫⁪⁮={}
for ⁭⁮‌⁫⁮⁫‎⁫‬⁫=1,#‎⁫⁫‭⁪‭⁪‎‎⁭ do
⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫]=⁬⁭‌⁫‭‪⁮⁮‎⁫(⁭‬‌⁮‌‭‬‪‪⁬(⁬‌‭‌‌‭⁫⁭⁫⁮(‎⁫⁫‭⁪‭⁪‎‎⁭,⁭⁮‌⁫⁮⁫‎⁫‬⁫),‎‬⁭‌‪⁬‌⁮‎‬[(⁭⁮‌⁫⁮⁫‎⁫‬⁫-1)%#‎‬⁭‌‪⁬‌⁮‎‬+1]))
end
return ⁬‌⁫⁭⁭‬‬⁬⁮⁪(⁬⁪‪⁪‌‎‎⁫⁪⁮)
end
local ‎‭‌‪‭⁪⁮‌‎‎={
⁬⁫‬‌‬‭⁪⁬⁬⁭=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\138\045\178\235\126\219\121"),
⁭⁪⁮‎‪‎‎⁮‪⁮=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\178\023\167\233\127"),
⁫⁭⁬⁭‎‎⁮‎⁭=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\153\039\181\249\105\220\097\060"),
⁭⁪⁫‌⁬⁫⁬‬⁮=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\153\039\168\248\118\215\106\041"),
‎‎‭⁬‭⁫‎‬‭‌=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\174\039\179\227\111"),
⁪‬⁫‭‌‬‌‬⁪=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\152\060\160\181"),
⁭⁮⁫⁭⁭‌⁪‌‪‪=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\142\039\162\232\104"),
⁭‌⁪⁮‬⁫⁪‪‪‭=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\142\039\162\232\107\218\102\053\159"),
⁬⁭‌⁫‭‪⁮⁮‎⁫=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\142\032\167\255"),
⁬‬⁫⁮‪‎⁬⁫‎‭=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\152\038\182\236\120\222"),
⁭‪⁭‎⁬‪⁬⁭⁫⁫=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\152\060\175\225"),
⁭⁪⁭⁮⁮⁬⁪‌⁮‪=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\174\026\133"),
⁬⁭‌⁭⁭⁮‎⁫‭⁫=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\153\049\182\232"),
⁬‌‌⁭⁬⁪‪‪‬⁫=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\158\060\180\228\117\210"),
‌‪⁪‌‪⁮⁫⁭‎=⁬⁬⁫‌⁫⁬‭⁬‌⁭("\158\045\178\224\126\193\110\047\138\124\178\098")
}
local ⁬‭⁮‪⁭⁮‪⁪⁪‎=‎⁮⁬⁬‪‪‎‎‎‎[‎‭‌‪‭⁪⁮‌‎‎.⁬⁫‬‌‬‭⁪⁬⁬⁭](‎⁪‬⁬‭‬‎‬‎)
local ⁭⁭⁭‌‪‭⁫⁫⁬‬={
[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁮‎‪‎‎⁮‪⁮]=function(⁭‌‌⁮‎⁪‎⁮‪‎,⁭‭⁬‭‭⁬⁪‬‌‎)
if not ⁭‌‌⁮‎⁪‎⁮‪‎[2] then
⁭‌‌⁮‎⁪‎⁮‪‎[2]={}
local ⁭⁮‌⁫⁮⁫‎⁫‬⁫=0
for _,⁭‌⁪⁮‬⁫⁪‪‪‭ in ⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁪‬⁫‭‌‬‌‬⁪][‎‭‌‪‭⁪⁮‌‎‎.⁭⁮⁫⁭⁭‌⁪‌‪‪](⁭‌‌⁮‎⁪‎⁮‪‎[1]) do
⁭‌‌⁮‎⁪‎⁮‪‎[2][⁭‌⁪⁮‬⁫⁪‪‪‭]=⁭⁮‌⁫⁮⁫‎⁫‬⁫
⁭⁮‌⁫⁮⁫‎⁫‬⁫=⁭⁮‌⁫⁮⁫‎⁫‬⁫+1
end
end
⁭‭⁬‭‭⁬⁪‬‌‎=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁫⁭⁬⁭‎‎⁮‎⁭](⁭‭⁬‭‭⁬⁪‬‌‎)
if ‭‎⁬⁪⁪‎⁮‪⁪‬[‎‭‌‪‭⁪⁮‌‎‎.‎‎‭⁬‭⁫‎‬‭‌]({⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁪‬⁫‭‌‬‌‬⁪][‎‭‌‪‭⁪⁮‌‎‎.⁭‌⁪⁮‬⁫⁪‪‪‭](⁭‭⁬‭‭⁬⁪‬‌‎,1,-1)})%4~=0 then
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‎⁫⁮⁪‎‭⁮⁬⁪⁪](⁫⁮‎⁭‎‭⁬‌‌)
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][⁬‌‪‌‎‪‬⁪‌‎]()
end
local ⁬⁪‪⁪‌‎‎⁫⁪⁮={}
local ⁭⁭⁮‪⁫⁭‬⁮‬⁮={}
local ⁭⁮‌⁫⁮⁫‎⁫‬⁫=1
local ⁬‎⁭‪⁭⁫⁬‎⁭⁪=1
for ⁬‎‌‎‪‌‭‬‎⁬,⁭‌⁪⁮‬⁫⁪‪‪‭ in ⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁪‬⁫‭‌‬‌‬⁪][‎‭‌‪‭⁪⁮‌‎‎.⁭⁮⁫⁭⁭‌⁪‌‪‪](⁭‭⁬‭‭⁬⁪‬‌‎) do
if ⁭‌‌⁮‎⁪‎⁮‪‎[2][⁭‌⁪⁮‬⁫⁪‪‪‭] then
if ⁭⁮‌⁫⁮⁫‎⁫‬⁫<11 then
if ⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁬⁭‌⁭⁭⁮‎⁫‭⁫](⁭⁭⁮‪⁫⁭‬⁮‬⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫])~=‎‭‌‪‭⁪⁮‌‎‎.⁬‌‌⁭⁬⁪‪‪‬⁫ then
⁭⁭⁮‪⁫⁭‬⁮‬⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫]=""
end
⁭⁭⁮‪⁫⁭‬⁮‬⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫]=⁭⁭⁮‪⁫⁭‬⁮‬⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫]..⁭‌‌⁮‎⁪‎⁮‪‎[2][⁭‌⁪⁮‬⁫⁪‪‪‭]
else
if ⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁬⁭‌⁭⁭⁮‎⁫‭⁫](⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫-10])~=‎‭‌‪‭⁪⁮‌‎‎.⁬‌‌⁭⁬⁪‪‪‬⁫ then
⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫-10]=""
end
⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫-10]=⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫-10]..⁭‌‌⁮‎⁪‎⁮‪‎[2][⁭‌⁪⁮‬⁫⁪‪‪‭]
end
else
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‎⁫⁮⁪‎‭⁮⁬⁪⁪](⁫⁮‎⁭‎‭⁬‌‌)
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][⁬‌‪‌‎‪‬⁪‌‎]()
end
if ⁬‎⁭‪⁭⁫⁬‎⁭⁪%4==0 then
if ⁭⁮‌⁫⁮⁫‎⁫‬⁫<11 then
⁭⁭⁮‪⁫⁭‬⁮‬⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫]=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](⁭⁭⁮‪⁫⁭‬⁮‬⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫])
else
⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫-10]=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](⁬⁪‪⁪‌‎‎⁫⁪⁮[⁭⁮‌⁫⁮⁫‎⁫‬⁫-10])
end
⁭⁮‌⁫⁮⁫‎⁫‬⁫=⁭⁮‌⁫⁮⁫‎⁫‬⁫+1
end
⁬‎⁭‪⁭⁫⁬‎⁭⁪=⁬‎⁭‪⁭⁫⁬‎⁭⁪+1
end
local ⁭‬‌⁫⁮⁫⁬‬⁭‎=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁪‬⁫‭‌‬‌‬⁪][‎‭‌‪‭⁪⁮‌‎‎.⁬⁭‌⁫‭‪⁮⁮‎⁫](⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁬‬⁫⁮‪‎⁬⁫‎‭](⁬⁪‪⁪‌‎‎⁫⁪⁮))
local ⁭⁫‎⁮⁫⁬⁬‬‭‬=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁪‬⁫‭‌‬‌‬⁪][‎‭‌‪‭⁪⁮‌‎‎.⁬⁭‌⁫‭‪⁮⁮‎⁫](⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁬‬⁫⁮‪‎⁬⁫‎‭](⁭⁭⁮‪⁫⁭‬⁮‬⁮))
if ⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭‪⁭‎⁬‪⁬⁭⁫⁫][‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁭⁮⁮⁬⁪‌⁮‪](⁭‬‌⁫⁮⁫⁬‬⁭‎)) == ⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](⁭⁫‎⁮⁫⁬⁬‬‭‬,16) then
return ⁭‬‌⁫⁮⁫⁬‬⁭‎
else
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‎⁫⁮⁪‎‭⁮⁬⁪⁪](⁫⁮‎⁭‎‭⁬‌‌)
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][⁬‌‪‌‎‪‬⁪‌‎]()
end
end
}
⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.‌‪⁪‌‪⁮⁫⁭‎](‭‬⁬⁮‭‎⁬‎‌⁫,⁭⁭⁭‌‪‭⁫⁫⁬‬)
local ‎⁭⁬‌‭‬⁮⁬⁬⁫=⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁬‬‎‬⁬‬‬‭⁮‬‎‬⁬‬‬⁫‭‬‬⁫‬‬‬⁫‬‬‬‭⁪‬‎‎⁫‬‎‎‬‬‬⁪‪‬‎‎⁬‬‎‎⁬‬‎‬‎‬‎‎‭"]
local ‭‬‪⁫‭⁬‪⁭⁬‪=‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬⁬‬‬⁫‬‬‎‬‎‬‬⁪‪‬‬‭⁪‬‬⁫⁭‬‎‬⁬‬‎‬⁬‬‎‎‬‬‎‬‎‬‎‎‌"
local ⁬‌‪‌‎‪‬⁪‌‎=‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‎‬⁬‬‬⁫‌‬‬⁫‎‬‬⁫‬‬‬‭⁮‬‎‬‬‬‬‭⁪‬‬⁮⁭‬‎‬‎‬‎‎‬‬‎‬‬‬‬⁮‭‬‎‎‎‬‬⁮⁭‬‎‬‎‬‎‎‭‬‎‎⁮‬‎‬‎‬‎‎‭"
local ‎⁫⁮⁪‎‭⁮⁬⁪⁪=‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁭‬‎‬‎‬‬⁪⁮‬‬⁫‌‬‬⁫⁫‬‬⁪‪‬‬⁫‌‬‬⁪⁮‬‬⁮⁭‬‎‎‌‬‬⁪‪‬‎‎‭‬‎‎‌"
local ⁫⁮‎⁭‎‭⁬‌‌=‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‌‬‎‬⁬‬‬‭⁪‬‬⁫‎‬‬⁫⁬‬‬⁫⁬‬‬⁫⁫‬‬⁫‭‬‬‪‎‬‬‪‪‬‎‎‎‬‎‬‬‬‬⁮⁭‬‬⁪‪‬‎‎⁮‬‎‬‎‌‎⁫⁮"
‎⁭⁬‌‭‬⁮⁬⁬⁫[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‬‬‎‬⁬‬‬⁫⁫‬‬⁫‬‬‬⁫⁫‬‬‭⁮‬‬⁫‌‬‬⁫⁭‬‎‎‎‬‎‎‭‬‎‬⁫‬‎‬⁭‬‎‬⁫‬‎‎‬‬‬⁪‪‬‎‬⁮"]=‎⁭⁬‌‭‬⁮⁬⁬⁫[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‬‬‎‬⁬‬‬⁫⁫‬‬⁫‬‬‬⁫⁫‬‬‭⁮‬‬⁫‌‬‬⁫⁭‬‎‎‎‬‎‎‭‬‎‬⁫‬‎‬⁭‬‎‬⁫‬‎‎‬‬‬⁪‪‬‎‬⁮"] or ⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‬⁫⁬‬‬⁫⁭‬‬⁪⁪‬‬⁫‪‬‬⁫‪‬‬⁫‭‬‬⁪‪‬‎‎‭‬‎‬‎‬‎‎‬‬‎‬‬‬‎‬‎‬‎‎‭"][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁬‬‬⁫⁬‬‬⁫⁬‬‬⁫‎‬‬⁫‪‬‎‬⁬‬‬⁫⁫‬‬⁫‪‬‬‌‪‬‬⁪‪‬‎‎⁬‬‎‎‌‬‎‎‪‬‎‎‭‬‎‬‎"]
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁪‪‬‬‭⁮‬‬⁪⁪‬‎‬‎‬‬‭⁮‬‬⁫‌‬‬⁪‪‬‎‬‬‬‬⁮⁬‬‎‬‎‬‬⁪⁪‬‎‬‎‬‎‬⁫‬‎‎⁮‬‎‬‎"](⁫⁮‎⁭‎‭⁬‌‌,function()
local ‭‪‌⁬⁫⁬⁪‭‌=⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁪⁮‬‬⁫‬‬‬⁫⁭‬‬⁫⁬‬‬⁪⁪‬‬⁫‬‬‎‬‎‬‬⁫‎‬‬⁮⁬‬‎‬‎‬‬⁪‪‬‎‬‬‬‬‪⁭‬‎‎‬‬‎‎‌"](⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬⁬‬‬⁪‪‬‬‭⁮‬‬‭⁮‬‬⁫⁭‬‬⁫⁫‬‬‭⁪‬‬⁫‎‬‬⁫‌"))
local ⁬‭⁭⁪‪‎‬‭⁭⁪=⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁪⁮‬‬⁫‬‬‬⁫⁭‬‬⁫⁬‬‬⁪⁪‬‬⁫‬‬‎‬‎‬‬⁫‎‬‬⁮⁬‬‎‬‎‬‬⁪‪‬‎‬‬‬‬‪⁭‬‎‎‬‬‎‎‌"](⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬⁬‬‬⁪‪‬‬‭⁮‬‬‭⁮‬‬⁫⁭‬‬⁫⁫‬‬‭⁪‬‬⁫‎‬‬⁫‌"))
local ‎‌⁫‪⁪‌‬⁭‌‪=⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‬⁫⁬‬‬⁫⁭‬‬⁪⁪‬‬⁫‪‬‬⁫‪‬‬⁫‭‬‬⁪‪‬‎‎‭‬‎‬‎‬‎‎‬‬‎‬‬‬‎‬‎‬‎‎‭"][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁬‬‬⁫⁬‬‬⁫⁬‬‬⁫‎‬‬⁫‪‬‎‬⁬‬‬⁫⁫‬‬⁫‪‬‬‌‪‬‬⁪‪‬‎‎⁬‬‎‎‌‬‎‎‪‬‎‎‭‬‎‬‎"]({
[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬‬‬‎‬‎‬‬⁪⁮‬‬⁪‪‬‬⁫⁫‬‬⁫‬‬‎‬‬‬‎‬⁬‬‎‬⁬‬‎‎‎‬‎‎‭‬‎‬⁪‬‬⁪‪‬‎‎‌"]=‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‌‬‬⁫‎‬‬‭⁪‬‬⁫‌‬‬‭⁮‬‬⁫‎‬‬⁫‪‬‬‭⁮‬‎‎⁬‬‎‎‬‬‎‬⁭",
[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁫‬‬⁪⁪‬‬⁪⁮‬‬⁫‬‬‬‭⁮‬‬⁪⁮‬‬‭⁪‬‬‭⁮‬‎‎⁭‬‎‎‪‬‬⁪‪‬‎‬⁮‬‎‬⁫‬‎‎‌‬‎⁬‎"]=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‌‬‬⁫‎‬‎‬‬‬‬⁪⁪‬‎‬‎‬‎‬⁬‬‬⁪⁮‬‬⁫⁫‬‬‭⁪"),
[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‌‬‬⁪⁪‬‎‬‬‬‬⁪⁪‬‬‭⁪‬‬⁫‭‬‬⁫‌‬‬⁫‎‬‎⁬‬"]=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬⁬‬‬⁫⁬‬‎‬‬‬‬⁪⁮‬‎‬‬‬‎‬⁬‬‬⁫‬‬‬‭⁪‬‬‭⁮"),
[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬⁬‬‬⁪⁮‬‎‬‬‬‬⁪⁮‬‬⁫‬‬‬⁫‭‬‬‭⁪‬‬⁫⁭‬‎⁬‎"]=⁬‭⁮‪⁭⁮‪⁪⁪‎[‎‭‌‪‭⁪⁮‌‎‎.⁭⁪⁫‌⁬⁫⁬‬⁮](‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬⁬‬‬⁫⁬‬‎‬‬‬‬⁪⁮‬‎‬‬‬‎‬⁬‬‬⁫‬‬‬‭⁪‬‬‭⁮"),
[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬‭⁪‬‬⁪⁪‬‬⁫‭‬‬⁫‎‬‬‭⁮‬‬⁪⁮‬‬‭⁪‬‬⁫‬‬‎‎⁪"]=‭‪‌⁬⁫⁬⁪‭‌,
[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‬‭⁪‬‬⁫‭‬‬⁪⁮‬‬‭⁮‬‬⁫‭‬‎‬‎‬‬⁫⁫‬‎‬‭"]=⁬‭⁭⁪‪‎‬‭⁭⁪
})
if (‎⁭⁬‌‭‬⁮⁬⁬⁫[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‬‬‎‬⁬‬‬⁫⁫‬‬⁫‬‬‬⁫⁫‬‬‭⁮‬‬⁫‌‬‬⁫⁭‬‎‎‎‬‎‎‭‬‎‬⁫‬‎‬⁭‬‎‬⁫‬‎‎‬‬‬⁪‪‬‎‬⁮"]~=⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‬⁫⁬‬‬⁫⁭‬‬⁪⁪‬‬⁫‪‬‬⁫‪‬‬⁫‭‬‬⁪‪‬‎‎‭‬‎‬‎‬‎‎‬‬‎‬‬‬‎‬‎‬‎‎‭"][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁬‬‬⁫⁬‬‬⁫⁬‬‬⁫‎‬‬⁫‪‬‎‬⁬‬‬⁫⁫‬‬⁫‪‬‬‌‪‬‬⁪‪‬‎‎⁬‬‎‎‌‬‎‎‪‬‎‎‭‬‎‬‎"]) then
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‎⁫⁮⁪‎‭⁮⁬⁪⁪](⁫⁮‎⁭‎‭⁬‌‌)
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][⁬‌‪‌‎‪‬⁪‌‎]()
return
end
local ⁭‭‎‭‪‌⁫⁪‎‎=⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‭‬‬⁪⁪‬‬⁪‪‬‬⁫⁭‬‬⁫⁬‬‬⁫⁫‬‬⁪‪‬‬⁫⁫‬‎‬‬‬‎‬‎‬‬⁪⁮‬‎‎‪‬‎‬⁭"][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‭‬‎‬‬‬‎‬‬‬‬⁪⁮‬‬⁫‪‬‬⁪⁮‬‬⁪⁮‬‬⁫‌‬‎‬⁭‬‎‬‎‬‎‎‌‬‎‬⁫‬‎‎‬‬‎‬⁬‬‎‎‎"](⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‬⁫⁬‬‬⁫⁭‬‬⁪⁪‬‬⁫‪‬‬⁫‪‬‬⁫‭‬‬⁪‪‬‎‎‭‬‎‬‎‬‎‎‬‬‎‬‬‬‎‬‎‬‎‎‭"][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁬‬‬⁫⁬‬‬⁫⁬‬‬⁫‎‬‬⁫‪‬‎‬⁬‬‬⁫⁫‬‬⁫‪‬‬‌‪‬‬⁪‪‬‎‎⁬‬‎‎‌‬‎‎‪‬‎‎‭‬‎‬‎"])
if not (⁭‭‎‭‪‌⁫⁪‎‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁪⁮‬‬⁪‪‬‎‬‎‬‬⁫‭‬‬⁫‎‬‬⁫‬‬‬⁫‭‬‬⁫‬‬‎‎⁪‬‎‬‭‬‬⁪‪‬‎‎‌"] == ‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‎‬‎‬‬‬‎‬‬‬‬⁫⁫‬‎‬⁬‬‎‬⁬‬‬⁪‪‬‬⁫⁫‬‬‌‪" and ⁭‭‎‭‪‌⁫⁪‎‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁭‬‎‬⁬‬‬⁫‌‬‬⁪‪‬‬⁫⁫‬‎‬⁬‬‬⁫⁫‬‬⁫‎‬‎‎⁫‬‎‎‎‬‎‎‪‬‎‎‭‬‬⁪⁪‬‎‬‎"] == ‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‌‬‎‬‬‬‬⁫‭‬‬⁫‬‬‬‭⁮‬‎‬⁬‬‬⁪⁮‬‎‬‎‬‬‌‎‬‬⁪‎‬‬‌‪‬‬⁪⁭" and ⁭‭‎‭‪‌⁫⁪‎‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬‭⁪‬‬⁫⁫‬‬‭⁮‬‬⁫⁬‬‬⁫‭‬‬⁫⁬‬‬‭⁪‬‬⁫‬‬‎‎⁫‬‎‬‭‬‎‎‎‬‎‎‭‬‎‎‌‬‬⁪⁫‬‎‎⁫‬‎‎‭‬‬⁪⁪"] == ‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫⁭‬‬‭⁪‬‬⁫‬‬‬⁫‭‬‬⁫‬‬‬⁫‪‬‬⁪⁪‬‬⁪⁪‬‬⁪‎‬‬‌‪‬‬⁪⁭") then
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‎⁫⁮⁪‎‭⁮⁬⁪⁪](⁫⁮‎⁭‎‭⁬‌‌)
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][⁬‌‪‌‎‪‬⁪‌‎]()
return
end
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‎⁫⁮⁪‎‭⁮⁬⁪⁪](⁫⁮‎⁭‎‭⁬‌‌)
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‎‬‎‬‎‬‬‬‬⁫‌‬‬⁫⁭‬‬⁫‪‬‬⁫‎‬‬⁫‭‬‬‭⁪‬‬⁮‪‬‎‎‭‬‎‬⁫‬‎‎‌‬‎‬‎‬‬‌⁮‬‬⁪‪‬‎‎‌‬‬⁪‪"](‎‌⁫‪⁪‌‬⁭‌‪, ⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬⁫‪‬‎‬‎‬‬⁪⁮‬‎‬‎‬‬⁪⁮‬‬⁫‬‬‬⁪‪‬‬⁫‪‬‎‎⁫‬‎‎‌‬‎‎‭‬‎‬⁫‬‎‎‬‬‎‬⁭"][‭‬⁬⁮‭‎⁬‎‌⁫+"‬‬‭⁮‬‬‭⁮‬‬‭⁮‬‬⁪⁪‬‬‭⁮‬‬⁪⁪‬‬⁫‎‬‬⁫‌‬‎‬‎‬‬⁪⁮‬‎‬⁮‬‎‬‎‬‎‎‬"](‎‌⁫‪⁪‌‬⁭‌‪))
⁬‭⁮‪⁭⁮‪⁪⁪‎[‭‬‪⁫‭⁬‪⁭⁬‪][⁬‌‪‌‎‪‬⁪‌‎]()
end)