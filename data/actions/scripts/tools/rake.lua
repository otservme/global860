function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(itemEx.itemid == 11528 and getPlayerStorageValue(cid,42825) < 0) then
		doPlayerAddItem(cid,12246,1)
		setPlayerStorageValue(cid, 42825, 1)		
		doCreatureSay(cid, 'You dig out a handful of clay from the temple grounds.', TALKTYPE_ORANGE_1)
		end
        return true
	end