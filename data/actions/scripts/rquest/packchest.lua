 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 100008, -- change to your own storage value :)
        item = 7503, 
		

}
        if getPlayerStorageValue(cid, config.storage) == 2 then
		doPlayerSendTextMessage(cid,25,"You have found a heavy package.")
                doPlayerAddItem(cid, config.item, 1)
		setPlayerStorageValue(cid, config.storage, 3)
		setPlayerStorageValue(cid,100158, 5)
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 