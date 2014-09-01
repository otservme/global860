local storage = 100022
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, storage) == 1) and (getPlayerStorageValue(cid, 100021) <= 1)  then
	      if item.itemid == 1258 then return false end
	      if item.itemid == 1258 then return false end
          if item.itemid == 9178 then return false end
                doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end