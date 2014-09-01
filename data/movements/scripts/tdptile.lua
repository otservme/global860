function onStepIn(cid, item, position, fromPosition) 

	if (isPlayer(cid)) and (getPlayerStorageValue(cid, 100079) == -1) then
		setPlayerStorageValue(cid,100079,1)
	end
end