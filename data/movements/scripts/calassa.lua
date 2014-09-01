function onStepIn(cid, item, position, fromPosition)

local temple = {x=31914, y=32713, z=12}

   if getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 5461 then
	doTeleportThing(cid,temple)
        doSendMagicEffect(getCreaturePosition(cid),53)
    else
	 doCreatureSay(cid,"You need to wear a Helmet of the Deep.",TALKTYPE_ORANGE_1)
        doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
        doTeleportThing(cid,fromPosition)
        end
    return 1
end  