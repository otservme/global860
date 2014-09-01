function onStepIn(cid, item, position, fromPosition)
    local pos1 = {x=33176, y=32889, z=11}
    local pos2 = {x=33175, y=32884, z=11}
    local pos3 = {x=33176, y=32880, z=11}
    local pos4 = {x=33182, y=32880, z=11}
    local pos5 = {x=33183, y=32884, z=11}
    local pos6 = {x=33181, y=32889, z=11} 
    local enterpos = {x=33198, y=32885, z=11}
	if isPlayer(cid) then
		if getTileItemById(pos1, 1946).uid > 0 and getTileItemById(pos2, 1946).uid > 0 and getTileItemById(pos3, 1946).uid > 0 and getTileItemById(pos4, 1946).uid > 0 and getTileItemById(pos5, 1946).uid > 0 and getTileItemById(pos6, 1946).uid > 0 then
			doTeleportThing(cid, enterpos)
			doTransformItem(getTileItemById(pos1, 1946).uid, 1945)
			doTransformItem(getTileItemById(pos2, 1946).uid, 1945)
			doTransformItem(getTileItemById(pos3, 1946).uid, 1945)
			doTransformItem(getTileItemById(pos4, 1946).uid, 1945)
			doTransformItem(getTileItemById(pos5, 1946).uid, 1945)
			doTransformItem(getTileItemById(pos6, 1946).uid, 1945)
			doSendMagicEffect(getThingPos(cid),10)
		else
			doTeleportThing(cid,fromPosition,true)
			doSendMagicEffect(getThingPos(cid),10)
			end
		end 
	return true
end