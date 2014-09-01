function onStepIn(cid, item, pos, fromPos)
 
	food1 = {x=32173, y=31871, z=15}
	food2 = {x=32180, y=31871, z=15}
 
 
if getTileItemById(food1, 2143).itemid >= 1 and getTileItemById(food2, 2144).itemid >= 1 then
		doTeleportThing(cid, {x=32177, y=31863, z=15})
                doSendMagicEffect(getCreaturePosition(cid), 10)
                doRemoveItem(getTileItemById(food1, 2143).uid,1)
                doRemoveItem(getTileItemById(food2, 2144).uid,1)
		else
		doTeleportThing(cid, {x=32176, y=31870, z=15})
                doSendMagicEffect(getCreaturePosition(cid), 10)
		end
		end