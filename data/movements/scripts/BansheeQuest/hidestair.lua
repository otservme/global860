function onStepIn(cid, item, position, fromPosition)
    local lever = {x=32266, y=31861, z=11}
	if isPlayer(cid) then
		if getTileItemById(lever, 1946).uid > 0 then
			doTransformItem(getTileItemById(lever, 1946).uid, 1945)
			doTransformItem(item.uid,425)
		end 
	return true
end
end

function onStepOut(cid, item, position, fromPosition)
if isPlayer(cid) then
   doTransformItem(item.uid,426)
   end
return true
end