function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 2111 then
		if getPlayerStorageValue(cid, 100058) == 2 and doPlayerRemoveItem(cid, 10152, 1) and getPlayerStorageValue(cid, 100060) == -1  then
				setPlayerStorageValue(cid, 100060, 1)
				doPlayerRemoveItem(cid, 2344, 1)
				doSendMagicEffect(toPosition,29)
				doPlayerAddItem(cid,2356,1)
				setPlayerStorageValue(cid, 100062, 11)
		        end
		end
    return TRUE
end