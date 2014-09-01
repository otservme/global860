function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,5000) == -1 then
    AddStageExp(cid,100000)
end
    if item.uid == 49111 then
        queststatus = getPlayerStorageValue(cid,5000)
        if queststatus == -1 then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a demon armor.")
            doPlayerAddItem(cid,2494,1)
            setPlayerStorageValue(cid,5000,1)
        else
             doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
    elseif item.uid == 49112 then
   
        queststatus = getPlayerStorageValue(cid,5000)
       
        if queststatus == -1 then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a magic sword.")
            doPlayerAddItem(cid,2400,1)
            setPlayerStorageValue(cid,5000,1)
        else
             doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
    elseif item.uid == 49113 then
   
        queststatus = getPlayerStorageValue(cid,5000)
       
        if queststatus == -1 then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a stonecutter axe.")
            doPlayerAddItem(cid,2431,1)
            setPlayerStorageValue(cid,5000,1)
        else
             doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
    elseif item.uid == 49114 then
   
        queststatus = getPlayerStorageValue(cid,5000)
       
        if queststatus == -1 then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a present box.")
            box = doPlayerAddItem(cid,1990,1)
			doAddContainerItem(box, 2326, 1)
            setPlayerStorageValue(cid,5000,1)
        else
             doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
    end
    return true
end  