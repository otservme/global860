function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (item.itemid == 2330 and itemEx.uid == 2162 and getPlayerStorageValue(cid,100171) == 33) then	
	    	doSendMagicEffect(toPosition, 21)
	   	setPlayerStorageValue(cid,100168,37)
		doPlayerRemoveItem(cid,2330,1)
		doPlayerAddItem(cid,1993)
		setPlayerStorageValue(cid,100171,34)
       	end	
   	return true
end