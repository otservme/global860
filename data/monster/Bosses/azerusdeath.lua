local config = {
	timeToRemove = 300 , -- seconds
	yalahar = {x=32780, y=31168, z=14, stackpos=253},
}

function onStepIn(cid, item, position, fromPosition) 

local function removal(position)
	position.stackpos = 1
	if getThingfromPos(position).itemid == config.teleportId then
		doRemoveItem(getThingfromPos(config.yalahar).uid)
	end
	return TRUE
end

local yalahar = {x=32780, y=31168, z=14, stackpos=253} 

        if item.itemid == 9738 then 
        doTeleportThing(cid, yalahar, TRUE) 
        doSendMagicEffect(yalahar,12) 
		addEvent(removal, config.timeToRemove * 1000, t.pos)
        end 
     
    return TRUE 
end  