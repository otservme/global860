function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 5829) then
		if math.random(1,10) == 1 then
			doSummonCreature("The Keeper", getCreaturePosition(cid))
			doRemoveItem(item.uid, 1)
		else
			return false
		end
	end
end