function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 62378 then
	doRemoveItem(item.uid)
    	setPlayerStorageValue(cid, 62378, 1)
	doSendMagicEffect(toPosition, CONST_ME_WATERSPLASH)
    	elseif item.actionid == 8271 and getPlayerStorageValue(cid, 8234) == -1 then
	doItemSetAttribute(doPlayerAddItem(cid, 2088, 1), 'aid', 3610)
	doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a silver key.")
    	setPlayerStorageValue(cid, 8234, 1)
end
return true
end