function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 9738 then  
	local ret = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
    	local ret2 = doCreateMonster("Tormented Ghost", getThingPos(cid), true)    
          doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          doSendMagicEffect(toPosition,65)
          doRemoveItem(item.uid, 1)
          doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9738 ).uid, 9739) 
    elseif itemEx.itemid == 9739 then 
	local ret = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
    	local ret2 = doCreateMonster("Tormented Ghost", getThingPos(cid), true)  
          doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          doSendMagicEffect(toPosition,65)
          doRemoveItem(item.uid, 1)
          doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9739 ).uid, 9740)
    elseif itemEx.itemid == 9740 then 
	local ret = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
    	local ret2 = doCreateMonster("Tormented Ghost", getThingPos(cid), true)  
          doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          doSendMagicEffect(toPosition,65)
          doRemoveItem(item.uid, 1)
          doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9740).uid, 9773)
    elseif itemEx.itemid == 9773 then
	local ret = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
    	local ret2 = doCreateMonster("Tormented Ghost", getThingPos(cid), true)  
          doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          doSendMagicEffect(toPosition,65)
          doRemoveItem(item.uid, 1)
          doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9773).uid, 9742) 
          end  
          return true
end  