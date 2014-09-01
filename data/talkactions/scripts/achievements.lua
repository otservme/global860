function onSay(cid, words, param, channel)
 
	if(param == "") then
		return true
	end
 
	local player, ach
	local DESCR = MESSAGE_INFO_DESCR
	if words == "/addach" then
		param = string.explode(param, ",")
		if not param[2] then
			return doPlayerSendCancel(cid, "Invalid achievement id/name.")
		end
		if not getPlayerByNameWildcard(param[1]) or getPlayerByNameWildcard(param[1]) == "" then
			return doPlayerSendCancel(cid, "Invalid player name.")
		end
 
		player, ach = getPlayerByNameWildcard(param[1]), param[2]
		ach = type(ach) == "string" and getAchievementInfoByName(ach) or getAchievementInfo(tonumber(ach))
		if ach then
			if playerHasAchievement(cid, ach.id) then
				doPlayerSendCancel(cid, "Player already has the achievement \"" .. ach.name .. "\".")
			else
				doPlayerAddAchievement(player, ach.id, (param[3] and true or false))
				doPlayerSendTextMessage(cid, DESCR, "You added achievement " .. ach.id .. " (" .. ach.name .. ") to " .. param[1] .. ".")
				doPlayerSendTextMessage(player, DESCR, "You received the achievement: " .. ach.name)
				doSendMagicEffect(getCreaturePosition(player), CONST_ME_MAGIC_RED)
				return true
			end
		else
			return doPlayerSendCancel(cid, "Invaled achievement.")
		end
 
	elseif words == "/addallach" then
 
		param = string.explode(param, ",")
		player = getPlayerByNameWildcard(param[1])
		if not player or player == "" then
			return doPlayerSendCancel(cid, "Invalid player name.")
		end
 
		doPlayerAddAllAchievements(player, (param[2] and true or false))
		doPlayerSendTextMessage(cid, DESCR, "You added all achievements to " .. param .. ".")
		doPlayerSendTextMessage(player, DESCR, "You received all achievements.")
		doSendMagicEffect(getCreaturePosition(player), CONST_ME_MAGIC_RED)
		return true
 
	elseif words == "/removeach" then
 
		param = string.explode(param, ",")
		if not param[2] then
			return doPlayerSendCancel(cid, "Invalid achievement id/name.")
		end
		if not getPlayerByNameWildcard(param[1]) or getPlayerByNameWildcard(param[1]) == "" then
			return doPlayerSendCancel(cid, "Invalid player name.")
		end
 
		player, ach = getPlayerByNameWildcard(param[1]), tonumber(param[2])
		ach = type(ach) == "string" and getAchievementInfoByName(ach) or getAchievementInfo(tonumber(ach))
		if ach then
			if playerHasAchievement(cid, ach.id) then
				doPlayerRemoveAchievement(player, ach.id)
				doPlayerSendTextMessage(cid, DESCR, "You removed achievement " .. ach.id .. " (" .. ach.name .. ") to " .. param[1] .. ".")
				doPlayerSendTextMessage(player, DESCR, "You lost the achievement: " .. ach.name)
				return true
			else
				return doPlayerSendCancel(cid, "That player doest not has that achievement.")
			end
		else
			return doPlayerSendCancel(cid, "Invaled achievement.")
		end
 
	elseif words == "/removeallach" then
 
		player = getPlayerByNameWildcard(param)
		if not player or player == "" then
			return doPlayerSendCancel(cid, "Invalid player name.")
		end
 
		doPlayerRemoveAllAchievements(player)
		doPlayerSendTextMessage(cid, DESCR, "You removed all achievements to " .. getCreatureName(player) .. ".")
		doPlayerSendTextMessage(player, DESCR, "You lost all achievements.")
		return true
 
	elseif words == "/getach" then
 
		player = getPlayerByNameWildcard(param)
		if not player or player == "" then
			return doPlayerSendCancel(cid, "Invalid player name.")
		end
 
		local ach = getPlayerAchievements(player)
		if #ach > 0 then
			local text = ""
			for i = 1, #ach do
				text = text .. getAchievementInfo(tonumber(ach[i])).id .. " - " .. getAchievementInfo(tonumber(ach[i])).name .. "\n"
			end
			return doShowTextDialog(cid, 2195, "Player " .. param .. " has the following achievements...\n\n" .. text)
		else
			return doPlayerSendTextMessage(cid, DESCR, "Player " .. param .. " does not have any achievements.")
		end
 
	elseif words == "/getsecretach" then
 
		player = getPlayerByNameWildcard(param)
		if not player or player == "" then
			return doPlayerSendCancel(cid, "Invalid player name.")
		end
 
		local ach = getPlayerSecretAchievements(player)
		if #ach > 0 then
			local text = ""
			for i = 1, #ach do
				text = text .. getAchievementInfo(tonumber(ach[i])).id .. " - " .. getAchievementInfo(tonumber(ach[i])).name .. "\n"
			end
			return doShowTextDialog(cid, 2195, "Player " .. param .. " has the following secret achievements...\n\n" .. text)
		else
			return doPlayerSendTextMessage(cid, DESCR, "Player " .. param .. " does not have any secret achievements.")
		end
	end
	return true
end