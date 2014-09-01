function onStepIn(cid, item, position, fromPosition)

local config = { 
yala2 = {x = 32783, y = 31173, z = 10}
} 

doTeleportThing(cid,config.yala2)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE) 
end