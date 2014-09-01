local pos = {x=32266, y=31860, z=11}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doRemoveItem(getTileItemById(pos, 1498).uid)
		doTransformItem(item.uid, 1946)
	else
		doPlayerSendCancel(cid, "This switch has already been used.")
	end
	return true
end