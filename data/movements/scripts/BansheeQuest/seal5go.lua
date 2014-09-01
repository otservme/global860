function onStepIn(cid, item, pos, fromPos)
 
local config = {
	ghost1Name = "Warlock", 
	ghost1CreatePos = {x=32213, y=31841, z=15},
 
	ghost2Name = "Warlock", 
	ghost2CreatePos = {x=32218, y=31841, z=15}
}
	if isPlayer(cid) then
	doTransformItem(item.uid,425)
		if getPlayerStorageValue(cid,12984) == -1 then
			doCreateMonster(config.ghost2Name, config.ghost2CreatePos)
			doCreateMonster(config.ghost1Name, config.ghost1CreatePos)
   			setPlayerStorageValue(cid,12984,1)
			doSendMagicEffect(getCreaturePosition(cid), 14)
		
		end
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
if isPlayer(cid) then
   doTransformItem(item.uid,426)
   end
return true
end