function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 2006 and getPlayerStorageValue(cid, 100039) == 1 then   
	    local ret = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
   	 local ret2 = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
          doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          doPlayerRemoveItem(cid,9737, 1)
          doCreateItem(9738,1,toPosition) 
          doSendMagicEffect(toPosition,47)
	  setPlayerStorageValue(cid, 100040, 1)
	  setPlayerStorageValue(cid, 100086, 19)
          end  
          return true
end  