 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 2096, -- change to your own storage value :) 		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		        doPlayerSendTextMessage(cid,25,"You have found a backpack.")
		        local container = doPlayerAddItem(cid, 1988, 1)
                doAddContainerItem(container, 2237, 1) 
                doAddContainerItem(container, 2238, 1)
                doAddContainerItem(container, 1955, 1)
                doAddContainerItem(container, 2236, 1)
        else
                doPlayerSendTextMessage(cid,25,"The body is empty.")
                end
        return TRUE
end 