function onKill(cid, target, lastHit)
 
	local started = getPlayerStartedTasks(cid)
	if isPlayer(target) or isSummon(target) then return true end
	if started and #started > 0 then
		for _, id in ipairs(started) do
			if isInArray(tasks[id].creatures, getCreatureName(target):lower()) then
				if getCreatureStorage(cid, KILLSSTORAGE_BASE + id) < 0 then
					doCreatureSetStorage(cid, KILLSSTORAGE_BASE + id, 0)
				end
				if getCreatureStorage(cid, KILLSSTORAGE_BASE + id) < tasks[id].killsRequired then
					doCreatureSetStorage(cid, KILLSSTORAGE_BASE + id, getCreatureStorage(cid, KILLSSTORAGE_BASE + id) + 1)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureStorage(cid, KILLSSTORAGE_BASE + id) .. "/" .. tasks[id].killsRequired .. " " .. tasks[id].raceName .. " already killed.")
				end
			end
		end
	end
	return true
end