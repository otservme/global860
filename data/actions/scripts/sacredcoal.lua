function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 1484) then
		doTransformItem(getTileItemById({x=33241, y=31046, z=10}, 1484).uid, 1482)
		doPlayerAddItem(cid,12251,1)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect({x=33241, y=31046, z=10}, CONST_ME_FIREAREA, TRUE)
		addEvent(reOpen, 15000)
	end
end
	
function reOpen()
	doTransformItem(getTileItemById({x=33241, y=31046, z=10}, 1482).uid, 1484)
	return true
end