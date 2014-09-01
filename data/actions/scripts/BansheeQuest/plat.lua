 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 2092, -- change to your own storage value :)
        item = 2152, 		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found 100 platinum coins.")
		doPlayerAddItem(cid,config.item,100) 
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 