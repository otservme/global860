function onStepIn(cid, item, pos)
	if isPlayer(cid) then
	if getPlayerStorageValue(cid, 100106) < 3 then
		setPlayerStorageValue(cid, 100106, 3)
	end
	end
end  