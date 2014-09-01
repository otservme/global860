function onStepIn(cid, item, pos, fromPos)
 
local config = {
	ghost1Name = "Ghost", 
	ghost1CreatePos = {x=32275, y=31905, z=13},
 
	ghost2Name = "Ghost", 
	ghost2CreatePos = {x=32274, y=31903, z=13},
 
	dsName = "Demon Skeleton", 
	dsCreatePos = {x=32274, y=31903, z=13}
}
	if isPlayer(cid) then
		if getPlayerStorageValue(cid,32998) == -1 then
			doTeleportThing(cid, {x=32266, y=31849, z=15})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
			doCreateMonster(config.dsName, config.dsCreatePos)
			doCreateMonster(config.ghost2Name, config.ghost2CreatePos)
			doCreateMonster(config.ghost1Name, config.ghost1CreatePos)
   			setPlayerStorageValue(cid,32998,1)
		else
			doTeleportThing(cid, {x=32277, y=31903, z=13})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
			setPlayerStorageValue(cid, 100088, 2)
		end
	end
end