local pos, e = {x=32259, y=31890, z=10}, 0
local time = 300 -- 60 = 1min 
local f = function(p)
	doCreateItem(1498, 1, pos)
	doTransformItem(getTileItemById(p, 1946).uid, 1945)
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doRemoveItem(getTileItemById(pos, 1498).uid)
		addEvent(f, time * 1000, fromPosition)
		doTransformItem(item.uid, 1946)
	else
		doPlayerSendCancel(cid, "This switch has already been used.")
	end
	return true
end