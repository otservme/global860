 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 2012, -- change to your own storage value :)
        item = 9733,
		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found alchemists' formulas.")
                doPlayerAddItem(cid, config.item, 1)
	if getPlayerStorageValue(cid,100025) == 1 and getPlayerStorageValue(cid,100026) == 1 and getPlayerStorageValue(cid,100027) == 1 then
		setPlayerStorageValue(cid, 100086, 9)
	end
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 