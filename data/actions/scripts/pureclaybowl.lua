function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(itemEx.itemid == 11417) then
		doPlayerAddItem(cid,12250,1)
		doCreatureSay(cid, 'Filling the corrupted water into the sacred bowl completly .', TALKTYPE_ORANGE_1)
doRemoveItem(item.uid, 1)		
end
        return true
	end