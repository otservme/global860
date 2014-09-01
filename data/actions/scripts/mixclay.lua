function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(itemEx.itemid == 12258) then
		doPlayerAddItem(cid,12261,1)
		doCreatureSay(cid, 'You carefully mix the clay with the sacred earth.', TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid, 1)	
		doPlayerRemoveItem(cid, 12258, 1)
	end
        return true
	end