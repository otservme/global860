function onLogin(cid)

local rate = 1.3 -- 30%
local config = {
welvip = "você tem "..((rate - 1)*100).."% de exp a mais agora!",
not_vip = "Compre seus dias de VIP ACC e dispare no ranking.",
vip = isVip(cid) 
}

if (config.vip == TRUE) then
doPlayerSetExperienceRate(cid, rate)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.welvip)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.not_vip)
end
return TRUE
end