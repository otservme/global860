local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "INQKill")
	registerCreatureEvent(cid, "expvip")
		registerCreatureEvent(cid, "KdrLook")
	registerCreatureEvent(cid, "killpoint")
	registerCreatureEvent(cid, "deathpoint")
		registerCreatureEvent(cid, "KdrLook")
	registerCreatureEvent(cid, "killpoint")
	registerCreatureEvent(cid, "deathpoint")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "firstitems") 
registerCreatureEvent(cid, "KillingInTheNameOf")
registerCreatureEvent(cid, "receba")
registerCreatureEvent(cid, "BanLogin")
registerCreatureEvent(cid, "frags")
registerCreatureEvent(cid, "fullhpmana")
	registerCreatureEvent(cid, "onPrepareDeath")
registerCreatureEvent(cid, "demonOakDeath")
registerCreatureEvent(cid, "demonOakAttack")
registerCreatureEvent(cid, "demonOakLogout")
registerCreatureEvent(cid, "demonOakComplete")
registerCreatureEvent(cid, "azerus3")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "inquisitionPortals")
	registerCreatureEvent(cid, "svargrond_arena")
	registerCreatureEvent(cid, "reward")
	registerCreatureEvent(cid, "PythiusTheRotten")
registerCreatureEvent(cid, "AZKILL")
registerCreatureEvent(cid, "DISKILL")
registerCreatureEvent(cid, "KILLMORIK")
registerCreatureEvent(cid, "QUARAKILL") 
	return true
end
