function onStepIn(cid, item, pos, fromPos)
 
	if isPlayer(cid) and getPlayerStorageValue(cid,32993) == -1 then
			doTeleportThing(cid, {x=32272, y=31849, z=15})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
   			setPlayerStorageValue(cid,32993,1)
			setPlayerStorageValue(cid, 100093, 2)
		else
			doTeleportThing(cid, {x=32171, y=31855, z=15})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
		end
	end