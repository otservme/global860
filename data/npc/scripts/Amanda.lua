  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a humble nun."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sister Amanda."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created the world and all life on it."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a religious man. A shining example."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a religious man. A shining example."})
--keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's our world."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army lives to the ideals of Banor."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army lives to the ideals of Banor."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a pawn of evil."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only a being loyal to Banor will wield this blade."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I rarely have time to chat."})
keywordHandler:addKeyword({'blessing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "he lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "he lifeforce of this world is waning. There are no more blessings avaliable on this world."})

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

local talkstorage = 9909
local endstorage = 9901

if msgcontains(msg, 'wooden stake') then
	if getPlayerStorageValue(cid, endstorage) == 5 then
		npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
		setPlayerStorageValue(cid, talkstorage, 1)
end
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, talkstorage) == 1 then
		npcHandler:say("So receive my prayer: 'Wicked curses shall be broken'. Now, bring your stake to Kasmir in Darashia for the next line of the prayer. I will inform him what to do.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, endstorage, 6)
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