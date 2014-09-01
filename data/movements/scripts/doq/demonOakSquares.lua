function onStepIn(cid, item, position, fromPos, fromPosition)
	local storage = 100069
	if isPlayer(cid) then
	if item.uid == 13005 and getPlayerStorageValue(cid, storage) == -1 then
		setPlayerStorageValue(cid,storage, 1)
		doCreatureSay(cid, sounds[1][math.random(1, #sounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
	elseif item.uid == 13006 and getPlayerStorageValue(cid, storage) == 1 then
		setPlayerStorageValue(cid,storage, 2)
		doCreatureSay(cid, sounds[1][math.random(1, #sounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
	elseif item.uid == 13007  and getPlayerStorageValue(cid, storage) == 2 then
		setPlayerStorageValue(cid,storage, 3)
		doCreatureSay(cid, sounds[1][math.random(1, #sounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
	elseif item.uid == 13008  and getPlayerStorageValue(cid, storage) == 3 then
		setPlayerStorageValue(cid,storage, 4) 
		doCreatureSay(cid, sounds[1][math.random(1, #sounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
	elseif item.uid == 13009 and getPlayerStorageValue(cid, storage) == 4 then
		setPlayerStorageValue(cid,storage, 5) 
		doCreatureSay(cid, sounds[1][math.random(1, #sounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
		end
	end
	return true
end