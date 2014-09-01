function onStepIn(cid, item, position, fromPosition)
    local pos1 = {x=32220, y=31842, z=15}
    local pos2 = {x=32220, y=31843, z=15}
    local pos3 = {x=32220, y=31844, z=15}
    local pos4 = {x=32220, y=31845, z=15}
    local pos5 = {x=32220, y=31846, z=15}
 
	if isPlayer(cid) then
		if getPlayerStorageValue(cid,42988) == 1 and getPlayerStorageValue(cid,32994) == -1 then
			doTeleportThing(cid, {x=32271, y=31857, z=15})
            doSendMagicEffect(getCreaturePosition(cid), 10)
   			setPlayerStorageValue(cid,32994,1)  
			setPlayerStorageValue(cid, 100092, 2)
            if getTileItemById(pos1, 1945).uid > 0 then
            doTransformItem(getTileItemById(pos1, 1945).uid, 1946)
            end
            if getTileItemById(pos2, 1945).uid > 0 then
            doTransformItem(getTileItemById(pos2, 1945).uid, 1946)
            end
            if getTileItemById(pos3, 1945).uid > 0 then
            doTransformItem(getTileItemById(pos3, 1945).uid, 1946)
            end
            if getTileItemById(pos4, 1945).uid > 0 then
            doTransformItem(getTileItemById(pos4, 1945).uid, 1946)
            end
            if getTileItemById(pos5, 1945).uid > 0 then   
			doTransformItem(getTileItemById(pos5, 1945).uid, 1946)
			end
		else
			doTeleportThing(cid, {x=32216, y=31846, z=15})
            doSendMagicEffect(getCreaturePosition(cid), 10)
		end
	end
end