function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
 
	local pit = getCreatureStorage(cid, STORAGE_PIT)
	local arena = getCreatureStorage(cid, STORAGE_ARENA)
 
	if pit < 1 or pit > 10 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You can't enter without Halvar's permission.")
		doTeleportThing(cid, fromPosition)
		return true
	end
 
	if PITS[pit] and ARENA[arena] then
		local thing = getCreaturesOnPit(pit)
		local busy = false
		for _, uid in ipairs(thing) do
			if isPlayer(uid) and uid ~= cid then
				busy = true
				break
			end
		end
		if isPlayer(getTopCreature(PITS[pit].pillar).uid) then
			busy = true
		end
		if busy then
		for _, uid in ipairs(thing) do
			if isPlayer(uid) and uid ~= cid then
			if getPlayerSex(cid) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, ""..getCreatureName(uid).." is currently in the next arena pit. You will have to wait until he leaves.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, ""..getCreatureName(uid).." is currently in the next arena pit. You will have to wait until he leaves.")
				end
				doTeleportThing(cid, fromPosition)
				end
			end
			return true
		end
		resetPit(pit)
		doTeleportThing(cid, PITS[pit].center)
		doCreateMonster(ARENA[arena].creatures[pit], PITS[pit].summon)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
		doCreatureSay(cid, "Fight!", TALKTYPE_MONSTER)
		local pillar = getTopItem(PITS[pit].pillar)
		if (getTopItem(PITS[pit].tp).itemid == ITEM_TELEPORT) then
			doRemoveItem(getTopItem(PITS[pit].tp).uid)
		end
		if(pillar.itemid ~= ITEM_STONEPILLAR) then
			doCreateItem(ITEM_STONEPILLAR, 1, PITS[pit].pillar)
		end
		if isInArray(ITEM_FIREFIELD_TIMER, getTopItem(PITS[pit].fromPos).itemid) then
			doRemoveItem(getTopItem(PITS[pit].fromPos).uid)
		end
		startTimer(pit)
	else
		print("[Svargrond Arena::MoveEvent] >> Wrong configuration\nPlayer: " .. getCreatureName(cid) .. "\nAction: Trying to enter to arena\nStorage " .. STORAGE_ARENA .. " for player is: " .. arena .. "\nStorage " .. STORAGE_PIT .. " for player is " .. pit)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Something is wrong, please contact a gamemaster.")
		doTeleportThing(cid, fromPosition)
	end
	return true
end