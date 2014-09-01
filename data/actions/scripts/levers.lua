local t = {
	[1] = {{x=33268, y=31833, z=10}, 8304, {x=33268, y=31833, z=12}},
	[2] = {{x=33268, y=31838, z=10}, 8305, {x=33267, y=31838, z=12}},
	[3] = {{x=33270, y=31835, z=10}, 8300, {x=33270, y=31835, z=12}},
	[4] = {{x=33266, y=31835, z=10}, 8306, {x=33265, y=31835, z=12}}
}
local fence = {
	[1] = {x1=33266, x2=33270, y1=31828, sound={x=33268, y=31828, z=12}},
	[2] = {x1=33266, x2=33270, y1=31843, sound={x=33267, y=31843, z=12}},
	[3] = {x1=33275, y1=31834, y2=31838, sound={x=33275, y=31836, z=12}},
	[4] = {x1=33260, y1=31834, y2=31838, sound={x=33260, y=31835, z=12}}
}
local machine = {
	[8304] = {49106, 49107},
	[8305] = {49108, 49109},
	[8300] = {49110, 49111},
	[8306] = {49112, 49113}
}
local effects = {
	{x=33261, y=31829, z=12}, {x=33262, y=31830, z=12}, {x=33263, y=31831, z=12},
	{x=33264, y=31832, z=12}, {x=33265, y=31833, z=12}, {x=33266, y=31834, z=12},
	{x=33267, y=31835, z=12}, {x=33268, y=31836, z=12}, {x=33269, y=31837, z=12},
	{x=33270, y=31838, z=12}, {x=33271, y=31839, z=12}, {x=33272, y=31840, z=12},
	{x=33273, y=31841, z=12}, {x=33274, y=31842, z=12}, {x=33274, y=31829, z=12},
	{x=33273, y=31830, z=12}, {x=33272, y=31831, z=12}, {x=33271, y=31832, z=12},
	{x=33270, y=31833, z=12}, {x=33269, y=31834, z=12}, {x=33268, y=31835, z=12},
	{x=33267, y=31836, z=12}, {x=33266, y=31837, z=12}, {x=33265, y=31838, z=12},
	{x=33264, y=31839, z=12}, {x=33263, y=31840, z=12}, {x=33262, y=31841, z=12},
	{x=33261, y=31842, z=12}
}
 
local kickEvent, warnEvent = 0, 0
 
local function kick()
	setGlobalStorageValue(49105, -1)
	for i = 49101, 49105 do
		local v = getGlobalStorageValue(i)
		if isPlayer(v) == TRUE and isInRange(getThingPos(v), {x=33238, y=31806, z=12}, {x=33297, y=31865, z=12}) == TRUE then
			doTeleportThing(v, {x=33265, y=31838, z=10})
			doSendMagicEffect({x=33265, y=31838, z=10}, CONST_ME_TELEPORT)
		end
		setGlobalStorageValue(i, -1)
	end
end
 
local function fail(cid)
	return TRUE, doCreatureSay(cid, 'You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31835, z=10})
end
 
function isMonster(cid)
	return isCreature(cid) == TRUE and cid >= 0x40000000 and cid < 0x80000000
end
 
local function cleanTile(pos)
	pos.stackpos = 1
	local v = getThingfromPos(pos)
	while v.uid ~= 0 do
		if isMonster(v.uid) then
			doRemoveCreature(v.uid)
		elseif isCreature(v.uid) == FALSE and isInArray({1387, 1945, 1946}, v.itemid) == FALSE then
			doRemoveItem(v.uid)
		else
			pos.stackpos = pos.stackpos + 1
		end
		v = getThingfromPos(pos)
	end
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 49105 then
		if getGlobalStorageValue(49105) > 0 then
			return TRUE, doCreatureSay(cid, 'Wait for the current team to exit.', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31835, z=10})
		end
		for k, v in pairs(t) do
			local player = getTopCreature(v[1]).uid
			if isPlayer(player) == FALSE then
				return fail(cid)
			end
			local voc = getPlayerVocation(player)
			if voc > 4 then
				voc = voc - 4
			end
			if voc ~= k or getPlayerItemCount(player, v[2]) < 1 or getPlayerStorageValue(player, 65100) < 2 then
				return fail(cid)
			end
		end
		setGlobalStorageValue(49105, 1)
		stopEvent(kickEvent)
		stopEvent(warnEvent)
		for x = 33261, 33274 do
			for y = 31829, 31842 do
				cleanTile({x=x, y=y, z=12})
			end
		end
		for k, v in ipairs(fence) do
			for x = v.x1, v.x2 or v.x1 do
				for y = v.y1, v.y2 or v.y1 do
					local c = getTileItemById({x=x, y=y, z=12}, k < 3 and 8861 or 8862).uid
					if c > 0 then
						doRemoveItem(c)
					end
				end
			end
		end
		local effectTable = {}
		for k, v in pairs(t) do
			local player = getTopCreature(v[1]).uid
			setGlobalStorageValue(49100 + k, player)
			setPlayerStorageValue(cid, 65049, -1)
			doTeleportThing(player, v[3])
			doSendMagicEffect(v[1], CONST_ME_TELEPORT)
			table.insert(effectTable, v[3])
		end
		for _, v in ipairs(effectTable) do
			doSendMagicEffect(v, CONST_ME_TELEPORT)
			v = nil
		end
		for _, y in ipairs({8304, 8305, 8300, 8306}) do
			setGlobalStorageValue(y, -1)
		end
		for i = 49101, 49104 do
			doTransformItem(getThing(i).uid, 1945)
		end
		for i = 49106, 49113 do
			local v = getThing(i)
			if v.itemid > 7914 then
				doTransformItem(v.uid, v.itemid - 983)
			end
		end
		warnEvent = addEvent(doCreatureSay, 5 * 60 * 1000, getTopCreature({x=33266, y=31835, z=13}).uid, 'You have 5 minutes from now on until you get teleported out.', TALKTYPE_ORANGE_2)
		kickEvent = addEvent(kick, 10 * 60 * 1000)
	else
		if item.itemid == 1945 then
			local voc, p = getPlayerVocation(cid), getThingPos(cid)
			if voc > 4 then
				voc = voc - 4
			end
			if voc ~= item.uid - 49100 or getThing(machine[t[voc][2]][1]).itemid < 7915 or getThingfromPos({x=p.x, y=p.y, z=p.z, stackpos=0}).uid ~= item.uid + 100 then
				return TRUE, doCreatureSay(cid, 'Charge the four machines and stand at the marked spots beside the levers.', TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
			end
			local c = fence[voc]
			for x = c.x1, c.x2 or c.x1 do
				for y = c.y1, c.y2 or c.y1 do
					doCreateItem(voc < 3 and 8861 or 8862, 1, {x=x, y=y, z=12})
				end
			end
			doCreatureSay(cid, 'ZOOOOOOOOM', TALKTYPE_ORANGE_1, false, 0, c.sound)
			doTransformItem(item.uid, 1946)
			for i = 49101, 49104 do
				if getThing(i).itemid == 1945 then return TRUE end
			end
			for _, v in ipairs(effects) do
				doSendMagicEffect(v, CONST_ME_ENERGYHIT)
			end
			stopEvent(warnEvent)
			stopEvent(kickEvent)
			doCreatureSay(getTopCreature({x=33266, y=31835, z=13}).uid, 'You have 10 minutes from now on until you get teleported out.', TALKTYPE_ORANGE_2)
			warnEvent = addEvent(doCreatureSay, 5 * 60 * 1000, getTopCreature({x=33266, y=31835, z=13}).uid, 'You have 5 minutes from now on until you get teleported out.', TALKTYPE_ORANGE_2)
			kickEvent = addEvent(kick, 10 * 60 * 1000)
			doSummonCreature('Lord of the Elements', {x=33267, y=31836, z=12})
			setGlobalStorageValue(49105, 2)
		else
			doCreatureSay(cid, 'You can\'t turn it off again.', TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
		end
	end
	return TRUE
end
