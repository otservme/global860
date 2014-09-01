 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 100059, -- change to your own storage value :)
        item = 2346, 		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found tear of drama.")
		doPlayerAddItem(cid,config.item,1) 
		setPlayerStorageValue(cid, 100062, 7)
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 