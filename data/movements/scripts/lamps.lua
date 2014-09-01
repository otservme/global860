function onStepIn(cid, item, pos)
local jail = {x=33362, y=31208, z=8}
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	doTeleportThing(cid, jail, TRUE)
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
                  		doPlayerRemoveItem(cid, 12245, 1)
	doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
end