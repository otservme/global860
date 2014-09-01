local config = {
	rateExperience = getConfigInfo('rateExperience'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawnMin = getConfigInfo('rateSpawnMin'),
	rateSpawnMax = getConfigInfo('rateSpawnMax'),
	protectionLevel = getConfigInfo('protectionLevel'),
	stages = getBooleanFromString(getConfigInfo('experienceStages'))
}

function onSay(cid, words, param, channel)
	local exp = config.rateExperience
	if(config.stages) then
		exp = getExperienceStage(getPlayerLevel(cid), getVocationInfo(getPlayerVocation(cid)).experienceMultiplier)
	end

	doPlayerSendTextMessage(cid,27, "Server Information:\n\nExperience rate: x" .. exp .. "\nLoot rate: x" .. config.rateLoot)
	return true
end