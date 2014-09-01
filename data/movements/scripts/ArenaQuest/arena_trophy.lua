function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTransformItem(item.uid, 425)
if isPlayer(cid) then
	local arena = getCreatureStorage(cid, STORAGE_ARENA) - 1
	if arena == item.actionid - 23200 then --trophy tile actionid should be 23201 23202 23203
		if getCreatureStorage(cid, ARENA[arena].reward.trophyStorage) < 1 then
			local pos = getCreaturePosition(cid)
			pos.y = pos.y - 1
			local thing = doCreateItem(ARENA[arena].reward.trophy, 1, pos)
			doItemSetAttribute(thing, "description", string.format(ARENA[arena].reward.desc, getCreatureName(cid)))
			doCreatureSetStorage(cid, ARENA[arena].reward.trophyStorage, 1)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
			return true
		end
	end
	end
	return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTransformItem(item.uid, 426)
end