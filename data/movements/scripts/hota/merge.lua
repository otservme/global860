-- ver. 1 2011-11-24
-- author tfs, otland.net/members/andypsylon
local c = {
	{2335, 2336, 2337, 2338, 2339, 2340, 2341},
	{2342, 2147}
}
local rew = {2342, 2343}
 
function onAddItem(moveItem, tileItem, position, cid)
 
	for r, v in ipairs(c) do
		if isInArray(v, moveItem.itemid) then
			local itemy = {}
			for i = 1, #v do
				local tmp = getTileItemById(position, v[i])
				if tmp.itemid == v[i] then
					table.insert(itemy, tmp)
				end
			end
			if table.maxn(itemy) == #v then
				for _, q in ipairs(itemy) do
					doRemoveItem(q.uid, 1)
				end
				doCreateItem(rew[r], 1, position)
				doSendMagicEffect(position, CONST_ME_FIREAREA)
				if getPlayerStorageValue(cid,100155) == -1 then
					setPlayerStorageValue(cid,100155, 1)
					AddStageExp(cid,150000)
					setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
				end
			end
			return true
		end
	end
	return false
end