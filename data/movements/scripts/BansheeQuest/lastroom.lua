function onStepIn(cid, item, position, fromPosition)
	local storage = 32991
	local final = {x=32268,y=31853,z=15}
	local kick = {x=32221,y=31859,z=7}

	if isPlayer(cid) then
		if getPlayerStorageValue(cid, storage) == -1 then
			doTeleportThing(cid,final)
			setPlayerStorageValue(cid,storage, 1)
			doSendMagicEffect(getThingPos(cid),10) 
			doSendMagicEffect(position,10)
			AddStageExp(cid,50000)
		else
			doTeleportThing(cid,kick)
			doSendMagicEffect(getThingPos(cid),10) 
			doSendMagicEffect(position,10)
			end
		end
	return true
end