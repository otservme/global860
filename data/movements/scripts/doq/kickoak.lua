function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32716, y=32347, z=7}
	local noPosition = {x=32716, y=32340, z=7}
	local tree = getThingPos(cid)
	if isPlayer(cid) then
	if getPlayerStorageValue(cid,100076) == 2 then
		if getPlayerLevel(cid) < 120 then
		   doCreatureSay(cid, "LEAVE LITTLE FISH, YOU ARE NOT WORTH IT!", TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
		   doTeleportThing(cid, noPosition, TRUE)
		   doSendMagicEffect(noPosition, CONST_ME_TELEPORT)
		   return true
        	end
			if canEnter(cid, tree) ~= ERROR_NOERROR then
				doPlayerSendCancel(cid, getError(canEnter(cid, tree), tree))
				doSendMagicEffect(tree, CONST_ME_TELEPORT) 
				doTeleportThing(cid, noPosition, TRUE)
				return true
			end
			if getPlayerStorageValue(cid, 100072) == -1 then
				setPlayerStorageValue(cid, 100072, 1)
			end	
			doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(fromPosition, CONST_ME_BIGPLANTS)
			doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
		    	doCreatureSetStorage(cid, 100065, 1)
		    	doCreatureSetStorage(cid, 100066, 1)
            		doCreatureSetStorage(cid, 100067, 1)
           		doCreatureSetStorage(cid, 100068, 1)
			doCreatureSetStorage(cid, 100071, 0)
			doCreatureSetStorage(cid, 100076, 1)
			doCreatureSay(cid, "I AWAITED YOU! COME HERE AND GET YOUR REWARD!", TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
			setPlayerStorageValue(cid,100077, 2)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doSendMagicEffect(noPosition, CONST_ME_TELEPORT)
			end
		end
	return true
end