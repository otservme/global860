local storage = 100003
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, storage) >= 0 and getPlayerStorageValue(cid, 100006) == -1  then
	     if item.itemid == 8554 then return false end
                doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end