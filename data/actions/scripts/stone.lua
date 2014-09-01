function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney ( cid, 5) then
         doPlayerAddItem(cid,2671,1)
		 else
		 doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You don\'t have money.")
end
return true
end
