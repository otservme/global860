function onUse(cid, item, fromPosition, itemEx, toPosition)
	local t = {
		{ x = 32849 , y = 32282 , z = 10 },
		{ x = 32849 , y = 32283 , z = 10 }
	}
	if item.itemid == 1945 then
		for i = 1, #t do
			doRemoveItem(getTileItemById(t[i], 1304).uid)
		end
	else
		for i = 1, #t do
			doRelocate(t[i], getPosByDir({x=t[i].x, y=t[i].y, z=t[i].z}, EAST))
			doCreateItem(1304, 1, t[i])
		end
	end
	return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end