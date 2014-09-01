function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (isPlayer(cid) and getPlayerStorageValue(cid, 100136) == -1) then
		setPlayerStorageValue(cid, 100136,1)
		AddStageExp(cid,250000)
	end
end
