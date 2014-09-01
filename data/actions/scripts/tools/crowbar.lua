function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pos = getPlayerPosition(cid) 
	local effectpos = { 
	{x=pos.x+1,y=pos.y-1,z=pos.z}, 
	{x=pos.x-1,y=pos.y-1,z=pos.z}, 
	{x=pos.x+1,y=pos.y,z=pos.z}, 
	{x=pos.x-1,y=pos.y,z=pos.z}, 
	{x=pos.x,y=pos.y-1,z=pos.z}} 
	local effectpos2 = { 
	{x=pos.x,y=pos.y-1,z=pos.z}, 
	{x=pos.x,y=pos.y-2,z=pos.z}, 
	{x=pos.x,y=pos.y-3,z=pos.z}, 
	{x=pos.x,y=pos.y+1,z=pos.z}} 
	local quest = 100011
        local quest1 = 100033
	local quest2 = 100034
	local quest3 = 100035
	local quest4 = 100036
----------Yahari Script Starts--------------------------
	if item.itemid == 2416 and itemEx.uid == 1701 then
		if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest1) == -1 then
			doSetMonsterOutfit(cid, "skeleton", 3000) 
			doSendMagicEffect(pos, 11) 
			setPlayerStorageValue(cid, quest1, 1)
		if getPlayerStorageValue(cid, quest1) == 2 and getPlayerStorageValue(cid, quest1) == 3 and getPlayerStorageValue(cid, quest1) == 4 then
			setPlayerStorageValue(cid, 100086, 2)
		end
		for i = 1, table.maxn(effectpos) do 
			doSendMagicEffect(effectpos[i],48) 
		end
	end
end
	if item.itemid == 2416 and itemEx.uid == 1702 then
		if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest2) == -1 then
			doCreateMonster("Cave Rat", getThingPos(cid), true)
			doCreateMonster("Rat", getThingPos(cid), true)
			doCreateMonster("Rat", getThingPos(cid), true)
			setPlayerStorageValue(cid, quest2, 1)
		if getPlayerStorageValue(cid, quest1) == 1 and getPlayerStorageValue(cid, quest1) == 3 and getPlayerStorageValue(cid, quest1) == 4 then
			setPlayerStorageValue(cid, 100086, 2)
		end
	for i = 1, table.maxn(effectpos2) do 
		doSendMagicEffect(effectpos2[i],36)
		end
	end
end
	if item.itemid == 2416 and itemEx.uid == 1703 then
		if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest3) == -1 then
			doSendMagicEffect(toPosition,47)
			setPlayerStorageValue(cid, quest3, 1)
		if getPlayerStorageValue(cid, quest1) == 1 and getPlayerStorageValue(cid, quest1) == 2 and getPlayerStorageValue(cid, quest1) == 4 then
			setPlayerStorageValue(cid, 100086, 2)
		end
		end
	end
	if item.itemid == 2416 and itemEx.uid == 1704 then
		if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest4) == -1 then
			doSetMonsterOutfit(cid, "bog raider", 5000)
			setPlayerStorageValue(cid, quest4, 1) 
			doSendMagicEffect(toPosition,53)
		if getPlayerStorageValue(cid, quest1) == 1 and getPlayerStorageValue(cid, quest1) == 2 and getPlayerStorageValue(cid, quest1) == 3 then
			setPlayerStorageValue(cid, 100086, 2)
		end
			end
		end
----------Yalahari Script End--------------------------

----------Postman Script End--------------------------
	if (item.itemid == 2416 and itemEx.uid == 2155 and getPlayerStorageValue(cid,100168) == 5) then	
       	   	doSendMagicEffect(toPosition, 14)
	   	setPlayerStorageValue(cid,100168,6)
		setPlayerStorageValue(cid,100171,9)
	end
	return true
end
----------Postman Script End--------------------------