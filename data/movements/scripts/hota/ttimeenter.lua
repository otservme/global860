function onStepIn(cid, item, position, fromPosition)
    local pos1 = {x=33123, y=32599, z=13}
    local pos2 = {x=33147, y=32524, z=13}
    local pos3 = {x=33130, y=32489, z=13}
    local pos4 = {x=33104, y=32514, z=13}
    local pos5 = {x=33089, y=32514, z=13}
    local pos6 = {x=33077, y=32507, z=13} 
    local pos7 = {x=33036, y=32507, z=13}
    local pos8 = {x=33055, y=32487, z=13}
    local pos9 = {x=33027, y=32530, z=13}
    local pos10 = {x=33006, y=32563, z=13}
    local pos11 = {x=33028, y=32588, z=13}
    local enterpos = {x=33083, y=32568, z=14}
	if isPlayer(cid) then
		if getTileItemById(pos1, 1946).uid > 0 and getTileItemById(pos2, 1946).uid > 0 and getTileItemById(pos3, 1946).uid > 0 and getTileItemById(pos4, 1946).uid > 0 and getTileItemById(pos5, 1946).uid > 0 and getTileItemById(pos6, 1946).uid > 0 and getTileItemById(pos7, 1946).uid > 0 and getTileItemById(pos8, 1946).uid > 0 and getTileItemById(pos9, 1946).uid > 0 and getTileItemById(pos10, 1946).uid > 0 and getTileItemById(pos11, 1946).uid > 0 then
			doTeleportThing(cid, enterpos)
			doSendMagicEffect(getThingPos(cid),10)
		else
			doTeleportThing(cid,fromPosition,true)
			doSendMagicEffect(getThingPos(cid),10)
			end
		end 
	return true
end