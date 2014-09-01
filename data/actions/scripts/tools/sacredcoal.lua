function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 1484) then
		doTransformItem(getTileItemById({x=33241, y=31046, z=10}, 1484).uid, 1482)
		doPlayerAddItem(cid,12251,1)
		doRemoveItem(item.uid, 1)
		addEvent(reOpen, 15000)
	end
		
	function ThirdClose()
		doTransformItem(getTileItemById({x=33241, y=31046, z=10}, 1484).uid, 1482)
		end
			return true
		end