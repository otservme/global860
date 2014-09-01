function onKill(cid, target)
 
	local pit = getCreatureStorage(cid, STORAGE_PIT)
	local arena = getCreatureStorage(cid, STORAGE_ARENA)
	if isPlayer(target) then return true end
	if pit < 1 or pit > 10 then return true end
	if arena < 1 then return true end
 
	if isInArray(ARENA[arena].creatures, getCreatureName(target):lower()) then
		local pillar = getTopItem(PITS[pit].pillar)
		local tp = getTopItem(PITS[pit].tp)
  		local pos = PITS[pit].pillar
		local effectpos = { 
		{x=pos.x-1,y=pos.y,z=pos.z},
		{x=pos.x+1,y=pos.y,z=pos.z},
		{x=pos.x+1,y=pos.y-1,z=pos.z},
		{x=pos.x+1,y=pos.y+1,z=pos.z},
		{x=pos.x,y=pos.y,z=pos.z}}  
		if pillar.itemid == ITEM_STONEPILLAR then
		for i = 1, table.maxn(effectpos) do 
			doSendMagicEffect(effectpos[i],12) 
		    end 
			doRemoveItem(pillar.uid)		
			local tpaid = doCreateItem(ITEM_TELEPORT, 1, PITS[pit].tp)
            		doSetItemActionId(tpaid,25200)
		else
			print("[Svargrond Arena::CreatureEvent] Cannot remove stone pillar on position X: " .. PITS[pit].pillar.x .. ", Y: " .. PITS[pit].pillar.y .. ", Z: " .. PITS[pit].pillar.z .. ".")
		end
		doCreatureSetStorage(cid, STORAGE_PIT, pit + 1)
		doCreatureSay(cid, "Victory! Head through the new teleporter into the next room.", TALKTYPE_MONSTER)
	end
	return true
end