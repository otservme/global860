local storage = 100011
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, storage) >= 12) or (getPlayerStorageValue(cid, 100013) >= 16) then
	      if item.itemid == 1258 then return false end
                doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end