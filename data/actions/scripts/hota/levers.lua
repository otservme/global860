function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)
        	doSendMagicEffect(toPosition, math.random(28, 30))
	else
		doPlayerSendCancel(cid, "This switch has already been used.")
	end
	return true
end