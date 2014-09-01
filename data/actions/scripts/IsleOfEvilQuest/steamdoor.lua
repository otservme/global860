local storage = 100000
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, storage) >= 13 then
	     if item.itemid == 8554 then return false end
                doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
		if getPlayerStorageValue(cid, 100063) == -1 then
			setPlayerStorageValue(cid, 100063, 20)
		end
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end