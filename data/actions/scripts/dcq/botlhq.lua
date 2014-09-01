 function onUse(cid, item, frompos, item2, topos)

	local config = {
        storage = 100107, -- change to your own storage value :)
        item = 1955, 		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a book of the lost heros.")
		local item = doPlayerAddItem(cid,config.item,1) 
		setPlayerStorageValue(cid, 100106, 7)
                 doSetItemText(item,"Book of the Lost Heroes:\nAskuro\nMantar\nIldoni\nMaxmof\nXemodo\nOxanti")
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 