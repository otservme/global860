function onStepIn(cid, item, pos)

local punkt = {x=33279, y=31592, z=12}
		doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)		
end  