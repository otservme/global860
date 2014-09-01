function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

	local oldPit = getCreatureStorage(cid, STORAGE_PIT) - 1
	local newPit = getCreatureStorage(cid, STORAGE_PIT)
 
	local arena = getCreatureStorage(cid, STORAGE_ARENA)
	if newPit < 1 then return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Something is wrong, please contact a gamemaster.") and doTeleportThing(cid, fromPosition) end
	if newPit > 10 then
	if getPlayerStorageValue(cid, 100087) <= 1 and getPlayerStorageValue(cid, STORAGE_ARENA) == 1 then
		setPlayerStorageValue(cid,100087,2)
	elseif getPlayerStorageValue(cid, 100087) <= 3 and getPlayerStorageValue(cid, STORAGE_ARENA) == 2 then 
		setPlayerStorageValue(cid,100087,4)
	elseif getPlayerStorageValue(cid, 100087) <= 5 and getPlayerStorageValue(cid, STORAGE_ARENA) == 3 then 
		setPlayerStorageValue(cid,100087,6)
	end
		doTeleportThing(cid, POSITION_REWARD)
		doSendMagicEffect(getCreaturePosition(cid), (arena == 1 and CONST_ME_FIREWORK_BLUE or arena == 2 and CONST_ME_FIREWORK_YELLOW or CONST_ME_FIREWORK_RED))
		doCreatureSetStorage(cid, STORAGE_PIT, 0)
		doCreatureSetStorage(cid, (arena == 1 and ACTION_GREENHORNDOOR or arena == 2 and ACTION_SCRAPPERDOOR or ACTION_WARLORDDOOR), 1)
		doCreatureSetStorage(cid, STORAGE_ARENA, getCreatureStorage(cid, STORAGE_ARENA) + 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You completed " .. ARENA[arena].name .. " arena, you should take your reward now.")
		doCreatureSay(cid, (arena == 1 and "Welcome back, little hero!" or arena == 2 and "Congratulations, brave warrior!" or "Respect and honour to you, champion!"), TALKTYPE_MONSTER)
		return true
	end
	local thing = getCreaturesOnPit(oldPit)
	for _, uid in ipairs(thing) do
		if getCreatureName(uid):lower() == ARENA[arena].creatures[pit] then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Defeat the monster first.")
			doTeleportThing(cid, fromPosition)
			return true
		end
	end
	thing = getCreaturesOnPit(newPit)
	local busy = false
	for _, uid in ipairs(thing) do
		if isPlayer(uid) and uid ~= cid then
			busy = true
			break
		end
	end
	if isPlayer(getTopCreature(PITS[newPit].pillar).uid) then
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
	resetPit(newPit)
	doTeleportThing(cid, PITS[newPit].center)
	doCreateMonster(ARENA[arena].creatures[newPit], PITS[newPit].summon)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	doCreatureSay(cid, "Fight!", TALKTYPE_MONSTER)
	if (getTopItem(PITS[oldPit].tp).itemid == ITEM_TELEPORT) then
		doRemoveItem(getTopItem(PITS[oldPit].tp).uid)
	end
	if (getTopItem(PITS[newPit].tp).itemid == ITEM_TELEPORT) then
		doRemoveItem(getTopItem(PITS[newPit].tp).uid)
	end
	if(getTopItem(PITS[newPit].pillar).itemid ~= ITEM_STONEPILLAR) then
		doCreateItem(ITEM_STONEPILLAR, 1, PITS[newPit].pillar)
	end
	startTimer(newPit)
	if isInArray(ITEM_FIREFIELD_TIMER, getTopItem(PITS[oldPit].fromPos).itemid) then
		doRemoveItem(getTopItem(PITS[oldPit].fromPos).uid)
	end
	return true
end