function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 17899 then
		if getPlayerStorageValue(cid, 9032) == 6 and doPlayerRemoveItem(cid, 2344, 1) then
				setPlayerStorageValue(cid, 9032, 7)
				doPlayerRemoveItem(cid, 2344, 1)
				doSendMagicEffect(toPosition,29)
				doPlayerAddItem(cid,2356,1)
				setPlayerStorageValue(cid, 100064, 13) 
		        end
		end
    return TRUE
end