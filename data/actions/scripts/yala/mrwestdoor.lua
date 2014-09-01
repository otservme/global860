local storage = 100015
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid,100016) >= 2 then
	return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end
	if getPlayerStorageValue(cid, storage) <= 3 then
	      if item.itemid == 5289 then return false end
                doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
		setPlayerStorageValue(cid, 100044, 1)
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end