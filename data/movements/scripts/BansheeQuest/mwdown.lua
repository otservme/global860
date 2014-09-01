function onStepIn(cid, item, position, fromPosition)
    local pos = getCreaturePosition(cid)
local wall1 = {x=32266, y=31860, z=11}
	if isPlayer(cid) then
        doTeleportThing(cid,{x=pos.x, y=pos.y, z=pos.z + 1}) 
	setPlayerStorageValue(cid, 100088, 1)
	setPlayerStorageValue(cid, 100089, 1)
	setPlayerStorageValue(cid, 100090, 1)
	setPlayerStorageValue(cid, 100091, 1)
	setPlayerStorageValue(cid, 100092, 1)
	setPlayerStorageValue(cid, 100093, 1)
	setPlayerStorageValue(cid, 100094, 1)
        local w2 = getTileItemById(wall1, 1498).uid
        if w2 == 0 then
	    addEvent(create, 1*1)
	    end
	end
	return true
end

function create()
local wall = {x=32266, y=31860, z=11}
doCreateItem(1498,1, wall)
return true
end