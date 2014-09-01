  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a mystic."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Maealil."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't own one of those little machines."})
keywordHandler:addKeyword({'mystic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a philosopher and healer."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are an ancient race, abandoned by the gods and doomed to find our way alone."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They cultivate earth but don't understand it."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are somewhat orcish in their nature."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My parents were Deraisim but joined the Cenath caste before my birth."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope they don't do something foolish one day."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Unfortunately they are to busy to care for the finer things in life."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They should join our town for their and our own safety."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to learn more about the Teshial."})
keywordHandler:addKeyword({'dream'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to learn more about the Teshial."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The great tree is the beginning for all things living and Priyla helps us to understand that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only another servant of evil."})
keywordHandler:addKeyword({'priyla'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The daughter of the stars gives us knowledge and teaches us magic."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is that a new kind of bug the Deraisim found?"})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know anything of importance."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Druids are great healers."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They understand so few..."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have none here."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach the spells 'Light Healing', 'Antidote', 'Antidote Rune', 'Intense Healing', 'Intense Healing Rune, 'Ultimate Healing', and 'Ultimate Healing Rune'."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can heal you or even teach you some spells of healing."})


local Topic = {}
local highLevelPrice = 20000 --(Real Tibia Price: 20000) price for players level 120+, per blessing
        local lowLevelPrice = 2000 --(Real Tibia Price: 2000) price for players level 30 and lower, per blessing
        local pricePerLevel = 200 --(Real Tibia Price: 200) this price only applies to players between level 30 & 120, formula=((pricePerLevel*playerLevel)+lowLevelPrice)

local getCost = function(cid)
	local l, s = getPlayerLevel(cid)
	if l <= 30 then
		s = lowLevelPrice * 5
	elseif l >= 120 then
		s = highLevelPrice * 5
	else
		s = (((l-30) * pricePerLevel) + lowLevelPrice) * 5
	end
	return math.ceil(s)
end

function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end

local talkstorage = 9906
local endstorage = 9901

if msgcontains(msg, 'wooden stake') then
	if getPlayerStorageValue(cid, endstorage) == 2 then
		npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
		setPlayerStorageValue(cid, talkstorage, 1)
end
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, talkstorage) == 1 then
		npcHandler:say("So receive my prayer: 'Peace may fill your soul - evil shall be cleansed'. Now, bring your stake to Yberius in the Venore temple for the next line of the prayer. I will inform him what to do.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, endstorage, 3)
		setPlayerStorageValue(cid, talkstorage, 2)
		end	
end

if msgcontains(msg, 'heal') then
		npcHandler:say('Do you want to heal your wounds?', cid)
		Topic[cid] = 1
    elseif Topic[cid] == 1 then
        if msgcontains(msg, 'yes') then
	if getCreatureHealth(cid) < 40 then
                doCreatureAddHealth(cid, -getCreatureHealth(cid)+40)
		doSendMagicEffect(getPlayerPosition(cid), 12)
                Topic[cid] = 0
                else
                npcHandler:say("You aren't looking that bad, "..getCreatureName(cid)..". Sorry, I can't help you.", cid)
		Topic[cid] = 0
            end
end
end
--///////////////////////////////////////Blessings//////////////////////////////////////////////////--
	if (msgcontains(msg, 'bless') or msgcontains(msg, 'blessing') or msgcontains(msg, 'blessings')) then
		amount = 0
		for i = 1,5 do
		if getPlayerBlessing(cid, i) then
			amount = amount +1
		end
	end
	npcHandler:say("There are five different blessings available in five sacred places. These blessings are: the {spiritual shielding}, the {spark of the phoenix}, the {embrace of tibia}, the {fire of the suns} and the {wisdom of solitude}. You have "..amount.." out of 5 blessings. I can also provide you with all blessings at once.",cid)
end

	if (msgcontains(msg, 'spiritual shielding')) then
		npcHandler:say("For "..getCost(cid).." gold I will bless you with the Spiritual Shielding. Is that okay?",cid)
		Topic[cid] = 2
	elseif Topic[cid] == 2 then
	if (msgcontains(msg, 'yes')) then
	if doPlayerRemoveMoney(cid, getCost(cid)) then
	if(getPlayerBlessing(cid, 1)) then
		npcHandler:say("Gods have already blessed you with this blessing!", cid)
		Topic[cid] = 0
	else
		doPlayerAddBlessing(cid, 1)
		doSendMagicEffect(getPlayerPosition(cid), 49)
		npcHandler:say('You have been blessed with the Spiritual Shielding.', cid)
		Topic[cid] = 0
	end
	else
		npcHandler:say('You don\'t have enough gold', cid)
	end
end
	elseif (msgcontains(msg, 'spark of the phoenix')) then
		npcHandler:say("For "..getCost(cid).." gold I will bless you with the Spark of the Phoenix. Is that okay?",cid)
		Topic[cid] = 3
	elseif Topic[cid] == 3 then
	if (msgcontains(msg, 'yes')) then
	if doPlayerRemoveMoney(cid, getCost(cid)) then
	if(getPlayerBlessing(cid, 2)) then
		npcHandler:say("Gods have already blessed you with this blessing!", cid)
		Topic[cid] = 0
	else
		doPlayerAddBlessing(cid, 2)
		doSendMagicEffect(getPlayerPosition(cid), 49)
		npcHandler:say('You have been blessed with the Spark of the Phoenix.', cid)
		Topic[cid] = 0
	end
	else
		npcHandler:say('You don\'t have enough gold', cid)
		Topic[cid] = 0
	end
end
	elseif (msgcontains(msg, 'embrace of tibia')) then
		npcHandler:say("For "..getCost(cid).." gold I will bless you with the Embrace of Tibia. Is that okay?",cid)
		Topic[cid] = 4
	elseif Topic[cid] == 4 then
	if (msgcontains(msg, 'yes')) then
	if doPlayerRemoveMoney(cid, getCost(cid)) then
	if(getPlayerBlessing(cid, 3)) then
		npcHandler:say("Gods have already blessed you with this blessing!", cid)
		Topic[cid] = 0
	else
		doPlayerAddBlessing(cid, 3)
		doSendMagicEffect(getPlayerPosition(cid), 49)
		npcHandler:say('You have been blessed with the Embrace of Tibia.', cid)
		Topic[cid] = 0
	end
	else
		npcHandler:say('You don\'t have enough gold', cid)
		Topic[cid] = 0
	end
end
	elseif (msgcontains(msg, 'fire of the suns')) then
		npcHandler:say("For "..getCost(cid).." gold I will bless you with the Fire of the Suns. Is that okay?",cid)
		Topic[cid] = 5
	elseif Topic[cid] == 5 then
	if (msgcontains(msg, 'yes')) then
	if doPlayerRemoveMoney(cid, getCost(cid)) then
	if(getPlayerBlessing(cid, 4)) then
		npcHandler:say("Gods have already blessed you with this blessing!", cid)
		Topic[cid] = 0
	else
		doPlayerAddBlessing(cid, 4)
		doSendMagicEffect(getPlayerPosition(cid), 49)
		npcHandler:say('You have been blessed with the Fire of the Suns.', cid)
		Topic[cid] = 0
	end
	else
		npcHandler:say('You don\'t have enough gold', cid)
		Topic[cid] = 0
	end
end
	elseif (msgcontains(msg, 'wisdom of solitude')) then
		npcHandler:say("For "..getCost(cid).." gold I will bless you with the Wisdom of Solitude. Is that okay?",cid)
		Topic[cid] = 6
	elseif Topic[cid] == 6 then
	if (msgcontains(msg, 'yes')) then
	if doPlayerRemoveMoney(cid, getCost(cid)) then
	if(getPlayerBlessing(cid, 5)) then
		npcHandler:say("Gods have already blessed you with this blessing!", cid)
		Topic[cid] = 0
	else
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 49)
		npcHandler:say('You have been blessed with the Wisdom of Solitude.', cid)
		Topic[cid] = 0
	end
	else
		npcHandler:say('You don\'t have enough gold', cid)
		Topic[cid] = 0
		end
	end
end

	if (msgcontains(msg, 'all')) then
		npcHandler:say(""..getCost(cid).." gold, I will bless you with all the blessings you don't already have. Is that okay?",cid)
		Topic[cid] = 7
	elseif Topic[cid] == 7 then
	if (msgcontains(msg, 'yes')) then
	if(getPlayerBlessing(cid, 1) and getPlayerBlessing(cid, 2) and getPlayerBlessing(cid, 3) and getPlayerBlessing(cid, 4) and getPlayerBlessing(cid, 5)) then
		npcHandler:say("Gods have already blessed you with these blessings!", cid)
		Topic[cid] = 0
	else
	if doPlayerRemoveMoney(cid, getCost(cid)) then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 49)
		npcHandler:say('All the five gods has blessed you.', cid)
		Topic[cid] = 0
	else
		npcHandler:say('You don\'t have enough money for all 5 blessings.', cid)
		Topic[cid] = 0
		end
		end
	end
    end 
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  