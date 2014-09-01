function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32716, y=32347, z=7}
	local noPosition = {x=32716, y=32340, z=7}
        if getPlayerStorageValue(cid, 9595) == 1 then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(fromPosition, CONST_ME_BIGPLANTS)
			doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                   	doPlayerSetStorageValue(cid, 35735, 1)
                  	doPlayerRemoveItem(cid, 10305, 1)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doSendMagicEffect(noPosition, CONST_ME_TELEPORT)
	end
end
