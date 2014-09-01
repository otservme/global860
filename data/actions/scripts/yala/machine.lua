local machine = {8894, 8895}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(machine, itemEx.itemid) == TRUE then 
       if item.itemid == 9744 and getPlayerStorageValue(cid,100023) == -1 then  --good
		doSendMagicEffect(toPosition,49)
		setPlayerStorageValue(cid, 100023, 1)
		doPlayerRemoveItem(cid,9744,1)
       elseif item.itemid == 9743 and getPlayerStorageValue(cid,100024) == -1 then--bad
                doSendMagicEffect(toPosition,66)
		setPlayerStorageValue(cid, 100024, 1)
		doPlayerRemoveItem(cid,9743,1)
          	end
          end  
          return true
end  