function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 12277 and getPlayerStorageValue(cid, 6787) == -1) then
		doSendMagicEffect(toPosition, CONST_ME_SOUND_GREEN)
		doPlayerAddItem(cid,12284,1)
		setPlayerStorageValue(cid, 6787, 1)
		setPlayerStorageValue(cid, 42324, 3)
		end
end