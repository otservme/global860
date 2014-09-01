function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doCreatureSetStorage(cid, STORAGE_PIT, 0)
	doSetMonsterOutfit(cid, "Chicken", 120 * 1000)
	doTeleportThing(cid, POSITION_KICK)
	doCreatureSay(cid, "Coward!", TALKTYPE_MONSTER)
	return true
end