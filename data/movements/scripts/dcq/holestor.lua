function onStepIn(cid, item, pos)
	if isPlayer(cid) then
	if getPlayerStorageValue(cid, 100106) < 1 then
		setPlayerStorageValue(cid, 100106, 1)
		end
	end
end  