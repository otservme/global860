function onStepIn(cid, item, pos, fromPos)
 
	food2 = {x=32243, y=31892, z=14, stackpos=1}
	getfood2 = getThingfromPos(food2)
 
	if isPlayer(cid) then
		if getPlayerStorageValue(cid,32995) == -1 and getfood2.itemid == 2016 then
			doTeleportThing(cid, {x=32261, y=31849, z=15})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
                        doRemoveItem(getfood2.uid,1)
   			setPlayerStorageValue(cid,32995,1)
			setPlayerStorageValue(cid, 100091, 2)
		else
			doTeleportThing(cid, {x=32245, y=31891, z=14})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
		end
	end
end