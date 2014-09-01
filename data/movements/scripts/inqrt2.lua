function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) and getPlayerStorageValue(cid,6076) < 2 then
		setPlayerStorageValue(cid, 6076, 2)
	end 
end