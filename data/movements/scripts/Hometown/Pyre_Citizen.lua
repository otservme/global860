function onStepIn(cid, item, pos)

local thais = {x=1145, y=1152, z=6}

    if item.actionid == 30041 then
        doPlayerSetTown(cid,20) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Pyre")
        end
    return 1
end  