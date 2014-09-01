local t = {
	[8933] = {
		{x = 32800, y = 32336, z = 11}, -- Where players will be teleported if standing on the bridge.
		{x = 32801, y = 32336, z = 11, stackpos = 0}, -- The position of the bridge tile that must change.
		{x = 32800, y = 32339, z = 11, stackpos = 1} -- The position of the lever (where the oil goes).
	}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local v = t[item.uid]
	if v then
		local water, bridge = getTileItemById(v[2], 493).uid, getTileItemById(v[2], 5770).uid
		if water > 0 then
			local oil = getThingFromPos(v[3])
			if oil.itemid == 2016 and oil.type == 11 then
				doRemoveItem(water)
				doCreateItem(5770, 1, v[2])
			else
				return doCreatureSay(cid, "The lever is creeking and rusty.", TALKTYPE_MONSTER, nil, nil, v[3])
			end
		else
			if bridge > 0 then
				doCreateItem(493, 1, v[2])
				local k = getThingFromPos(v[2]).uid
				if k ~= 0 then
					doRelocate(v[2], v[1])
				end
			end
		end
	end
	return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end