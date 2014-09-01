function onUse(cid, item, fromPosition, itemEx, toPosition)
	local arena = getCreatureStorage(cid, STORAGE_ARENA) - 1
	if ARENA[arena].reward[item.actionid] then
		local reward = ARENA[arena].reward[item.actionid]
		if getCreatureStorage(cid, ARENA[arena].reward.storage) > 0 then
			return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's empty.")
		end
 
		if reward.container then
			local cont = doPlayerAddItem(cid, reward.id, 1)
			for i = 1, table.maxn(reward.inside) do
				doAddContainerItem(cont, reward.inside[i][1], reward.inside[i][2])
			end
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. getItemArticleById(reward.id) .. " " .. getItemNameById(reward.id) .. ".")
			doCreatureSetStorage(cid, ARENA[arena].reward.storage, 1)
			AddStageExp(cid,25000)
			return true
		else
			doPlayerAddItem(cid, reward.id[1], reward.id[2])
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. (reward.id[2] < 2 and getItemArticleById(reward.id[1]) or "x" .. reward.id[2]) .. " " .. getItemNameById(reward.id[1]) .. ".")
			doCreatureSetStorage(cid, ARENA[arena].reward.storage, 1)
			AddStageExp(cid,25000)
			return true
		end
	end
	return true
end