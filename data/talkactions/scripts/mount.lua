function onSay(cid, words, param, channel)
	local t = string.explode(param, ",")
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
		return true
	end
 
 	local pid = getPlayerByNameWildcard(t[1])
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[1] .. " not found.")
		return true
	end
 
	if(not tonumber(t[2])) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires numeric param.")
		return true
	end
 
	doPlayerAddMount(pid, t[2])
	doSendMagicEffect(getThingPosition(pid), CONST_ME_MAGIC_BLUE)
	return true
end