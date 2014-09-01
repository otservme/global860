  local config = {
        storage = 53659,
        item = 8702 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found The Witches' Grimoire.")
                doPlayerAddItem(cid, config.item, 1)
		setPlayerStorageValue(cid, 99221, 1)
	if getPlayerStorageValue(cid, 99220) == 1 then
		setPlayerStorageValue(cid,100078,6)
	end
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
	return true
end 