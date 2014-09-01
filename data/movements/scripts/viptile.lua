function onStepIn(cid, item, position, fromPosition) 
 
local config = { 
msgDenied = "Só players VIP podem passar nesta area.", 
barco = {x = 32310, y = 32210, z = 6}
} 
 
if isVip(cid) == FALSE then
doTeleportThing(cid,config.barco)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied) 
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
return TRUE 
end 
return TRUE 
end