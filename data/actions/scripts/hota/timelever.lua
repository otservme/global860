function onUse(cid, item, fromPosition, itemEx, toPosition)
local time = 240 -- 60 = 1min 
local f = function(p)
	doTransformItem(getTileItemById(p, 1946).uid, 1945)
end
	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)
        	addEvent(f, time * 1000, fromPosition)
        	doSendMagicEffect(toPosition,7)
	else
		doPlayerSendCancel(cid, "This switch has already been used.")
	end
	return true
end