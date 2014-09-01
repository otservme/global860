function onStepIn(cid, item, pos)

local thais = {x=2034, y=2635, z=6}

    if item.actionid == 30043 then
        doPlayerSetTown(cid,17) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Oken")
        end
    return 1
end  