function onStepIn(cid, item, pos)

local punkt = {x=33277, y=31592, z=11}
local tp = {x=33286, y=31589, z=12, stackpos=0}

  	doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)	  
end  