function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 100171) == 33) then
		if item.itemid == 1226 then return false end
            		doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		else
	        	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end