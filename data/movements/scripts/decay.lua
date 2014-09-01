function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid)) then
	doTransformItem(item.uid, item.itemid + 1)
	doDecayItem(item.uid)
	end
	return true
end
