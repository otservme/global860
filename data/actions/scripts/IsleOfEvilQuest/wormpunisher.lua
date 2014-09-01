function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 10160 then
	   doTransformItem(item.uid,10119)	
       	   doSendMagicEffect(toPosition, 6)
	   doCreatureSay(cid,"You've heated up the hammer for a short while.",TALKTYPE_ORANGE_1)
    elseif itemEx.itemid == 10161 then
           doPlayerSendCancel(cid, "The crucible is off, wait until it starts.")
       end	
    return true
end