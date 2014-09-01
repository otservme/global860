function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 2711 and itemEx.actionid == 7343) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doCreateMonster("Thieving Squirrel", toPosition)
		doPlayerRemoveItem(cid, 11399, 1)
		if getPlayerStorageValue(cid, 7344) == -1 then
		setPlayerStorageValue(cid, 7344, 1)
		else
		setPlayerStorageValue(cid, 7344, getPlayerStorageValue(cid, 7344)+1)
		end
		return true
	end

	return false
end
