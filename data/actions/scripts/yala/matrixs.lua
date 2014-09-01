 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 100038, -- change to your own storage value :)
        item = 9744, --good 
        item2 = 9743, --bad		

}
        if item.actionid == 2030 and getPlayerStorageValue(cid, 100037) == 1 then
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a matrix crystal.")
                doPlayerAddItem(cid, config.item, 1)
		setPlayerStorageValue(cid, 100086, 25)
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
		return true
                end
	if item.actionid == 2107 and getPlayerStorageValue(cid, 100037) == 1 then
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a matrix crystal.")
                doPlayerAddItem(cid, config.item2, 1)
		setPlayerStorageValue(cid, 100086, 25)
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
		return true
                end
end 