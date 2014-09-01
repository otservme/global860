function onStepIn(cid, item, position, fromPosition)

local config = { 
yala1 = {x = 32784, y = 31179, z = 9}
} 

doTeleportThing(cid,config.yala1)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
end