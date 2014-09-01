local storage = 100105
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, storage) == 1 or getPlayerStorageValue(cid, storage) == 2) then
	      if item.itemid == 6262 then return false end
            	doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	return true
end