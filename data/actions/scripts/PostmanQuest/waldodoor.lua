local storage = 100168
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(getPlayerStorageValue(cid, storage) == 33) then
		if (item.itemid == 5115) then return false end
            		doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		else
	        	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end