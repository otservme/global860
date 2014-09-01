function onStepIn(cid, item, position, fromPosition)
    local pos1 = {x=33357, y=32749, z=14}
    local pos2 = {x=33305, y=32734, z=14}
    local pos3 = {x=33338, y=32702, z=14}
    local pos4 = {x=33358, y=32701, z=14}
    local pos5 = {x=33349, y=32680, z=14}
    local pos6 = {x=33320, y=32682, z=14} 
    local pos7 = {x=33368, y=32763, z=14}
    local pos8 = {x=33382, y=32786, z=14}
    local enterpos = {x=33367, y=32805, z=14}
	if isPlayer(cid) then
		if getTileItemById(pos1, 1946).uid > 0 and getTileItemById(pos2, 1946).uid > 0 and getTileItemById(pos3, 1946).uid > 0 and getTileItemById(pos4, 1946).uid > 0 and getTileItemById(pos5, 1946).uid > 0 and getTileItemById(pos6, 1946).uid > 0 and getTileItemById(pos7, 1946).uid > 0 and getTileItemById(pos8, 1946).uid > 0 then
			doTeleportThing(cid, enterpos)
			doSendMagicEffect(getThingPos(cid),10)
		else
			doTeleportThing(cid,fromPosition,true)
			doSendMagicEffect(getThingPos(cid),10)
			end
		end 
	return true
end