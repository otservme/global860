function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	if getCreatureStorage(cid, 100070) > 1 and getCreatureStorage(cid, 100073) == -1 then
		doTeleportThing(cid, positions.rewardRoom)
		setPlayerStorageValue(cid, 100072, 5)
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
	end
end