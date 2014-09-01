function onStepIn(cid, item, position, fromPosition)
	local fleePosition = {x=32716, y=32340, z=7}

	if isPlayer(cid) and getPlayerStorageValue(cid, 100070) == 1 then 
		doTeleportThing(cid, fleePosition, TRUE)
		doSendMagicEffect(fleePosition, CONST_ME_TELEPORT) 
	return true
	end
	if isPlayer(cid) then
		doTeleportThing(cid, fleePosition, TRUE)
		doSendMagicEffect(fleePosition, CONST_ME_TELEPORT)
		doCreatureSetStorage(cid, 100065, 1)
		doCreatureSetStorage(cid, 100066, 1)
		doCreatureSetStorage(cid, 100067, 1)
		doCreatureSetStorage(cid, 100068, 1)
		doCreatureSetStorage(cid, 100071, 0)
		checkAreaM(cid, {x=32707,y=32345,z=7},{x=32725,y=32357,z=7})
	end
	return true
end


	
