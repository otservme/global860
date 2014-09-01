function onStepIn(cid, item, pos, fromPos)
	if math.abs(pos.x - fromPos.x) == math.abs(pos.y - fromPos.y) then
		if item.actionid == 100 then
			doItemSetAttribute(item.uid, "aid", 0)
		else
			doItemSetAttribute(getTileItemById(fromPos, 10764).uid, "aid", 100)
			doTeleportThing(cid, fromPos, false)
		end
	end
end

function onAddItem(moveItem, tileItem, position, cid)
	if not isInArray({8304, 8306, 8310, 9468, 10570}, moveItem.itemid) then
		doRemoveItem(moveItem.uid)
	end
end