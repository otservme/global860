local altars = {
	{x = 32777, y = 31982, z = 9},
	{x = 32779, y = 31977, z = 9},
	{x = 32781, y = 31982, z = 9}
}


local summonPos = {x = 32780, y = 31980, z = 9}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	--if getPlayerStorageValue(cid, 92224) == 24 then
		--setPlayerStorageValue(cid, 92224, 25)
		--setPlayerStorageValue(cid, 100078, 11)
		local k = {}
		for _, v in ipairs(altars) do
			local tmp = getTileItemById(v, 2199).uid
			if tmp == 0 then
				doCreateMonster('The Count', summonPos)
				doSendMagicEffect(summonPos, CONST_ME_TELEPORT)
				return true
			else
				table.insert(k, tmp)
			end
		end
		for i = 1, #k do
			doRemoveItem(k[i])
		end
		doCreateMonster('The Weakened Count', summonPos)
		doSendMagicEffect(summonPos, CONST_ME_TELEPORT)
		return true
	--end
end