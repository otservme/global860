function onStepIn(cid, item, pos, fromPos)
 
	if isPlayer(cid) then
	if getPlayerStorageValue(cid,32996) == -1 then
			doTeleportThing(cid, {x=32268, y=31856, z=15})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
   			setPlayerStorageValue(cid,32996,1)
			setPlayerStorageValue(cid, 100090, 2)
		else
			doTeleportThing(cid, {x=32186, y=31938, z=14})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
		end
	end
end