function onStepIn(cid, item, position, fromPosition)

local train = {x=32949, y=31181, z=9}

    if getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 5461 then
		doTeleportThing(cid,train)
        doSendMagicEffect(getCreaturePosition(cid),53)
    else
        doCreatureSay(cid,"You need to wear a Helmet of the Deep.",TALKTYPE_ORANGE_1)
        doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
        doTeleportThing(cid,fromPosition)
        end
    return 1
end  