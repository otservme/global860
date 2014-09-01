function onUse(cid, item, frompos, item2, topos)
local gatepos = {x=32835, y=32333, z=11}

  	if item.itemid == 1945 then
		doRemoveItem(getTileItemById(gatepos, 6289).uid)
		doTransformItem(item.uid,item.itemid+1)
	else
		doPlayerSendCancel(cid, "This switch has already been used.")
	end
	return true
end
  