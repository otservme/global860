function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 10152 and itemEx.actionid == 17899 then
		if getPlayerStorageValue(cid, 9032) == 6 then
				setPlayerStorageValue(cid, 9032, 7)
				doPlayerRemoveItem(cid, 10152, 1)
				doSendMagicEffect(toPosition,29)
				doPlayerAddItem(cid,2356,1)
		        end
		end
    return TRUE
end