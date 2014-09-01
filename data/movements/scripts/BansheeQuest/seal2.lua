function onStepIn(cid, item, pos, fromPos)
	food1 = {x=32310, y=31975, z=13, stackpos=1}
	food2 = {x=32310, y=31976, z=13, stackpos=1}
	food3 = {x=32312, y=31975, z=13, stackpos=1}
	food4 = {x=32312, y=31976, z=13, stackpos=1}
 
	food5 = {x=32314, y=31975, z=13, stackpos=1}
	food6 = {x=32314, y=31976, z=13, stackpos=1}
 
	getfood1 = getThingfromPos(food1)
	getfood2 = getThingfromPos(food2)
	getfood3 = getThingfromPos(food3)
	getfood4 = getThingfromPos(food4)
 
	getfood5 = getThingfromPos(food5)
	getfood6 = getThingfromPos(food6)
 if isPlayer(cid) then
	if getPlayerStorageValue(cid,32997) == -1 and getfood1.itemid == 1946 and getfood2.itemid == 1946 and getfood3.itemid == 1946 and getfood4.itemid == 1946 and getfood5.itemid == 1945 and getfood6.itemid == 1945 then
		doTeleportThing(cid, {x=32261, y=31856, z=15})
		doSendMagicEffect(pos, 6)
		doSendMagicEffect(getThingPos(cid), 12)
		setPlayerStorageValue(cid,32997,1)
		setPlayerStorageValue(cid, 100089, 2)
 
	else
		doTeleportThing(cid, {x=32311, y=31977, z=13})
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		end
 
	end
	return 0
end