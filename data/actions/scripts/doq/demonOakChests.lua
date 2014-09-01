function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	if rewards[item.uid] then
		local t = rewards[item.uid]
                if(getCreatureStorage(cid, 100073) < 1) then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. getItemArticleById(t.reward) .. " " .. getItemNameById(t.reward) .. ".")
                        doPlayerAddItem(cid, t.reward, t.count)
                        doCreatureSetStorage(cid, 100073, 1)
                        AddStageExp(cid,250000)
			return true
                end
 
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's empty.")
        end
        return false
end