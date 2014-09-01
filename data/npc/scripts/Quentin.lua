  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Job? I have no job. I just live for the gods of Tibia."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Quentin."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created Tibia and all life on it."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "On Tibia there are many forms of life. There are plants and people and monsters."})
keywordHandler:addKeyword({'plant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just walk around, you will see grass, trees, and bushes."})
keywordHandler:addKeyword({'people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a simple monk. I just know Sam, Frodo, and Gorn. They all live in the main street to the north."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is our blacksmith. He sells weapons and armour."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the owner of Frodo's Hut, the tavern north of this temple."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is selling equipment. If you still have no backpack you should go and ask him for one."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is the leader of the local Paladins' guild."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Muriel is a famous sorcerer. She is the keeper of arcane secrets that are known only to few mortals."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The leader of the Knights' guild is a man of few words."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I admire the healing skills of Marvik."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king resides in the castle to the west."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is a highly competent priest."})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A hard man but his heart is in the right right place."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about the Tibian army. Ask general Harkath Bloodblade about that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hush! Do not mention the Evil One in these walls."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Harkath Bloodblade is his name."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the king's jester, but he believes himself to be the king of fools."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the guard of the royal castle."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This man is spreading horrible rumours all the time."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please do not mention the fallen one."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Legends tell us that that Excalibug is a gift of the gods. Banor used in his battles.  They say it was passed on to one of his followers."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I know nothing new. Please ask Frodo about that topic."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are really too many of them in Tibia. But who am I to challenge the wisdom of the gods?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'task'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'what'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you need money you should slay monsters and take their gold. Look for spiders and rats."})
keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you need money you should slay monsters and take their gold. Look for spiders and rats."})
keywordHandler:addKeyword({'spider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are spiders' nests beyond our city near Gorn's shop and at the McRonalds' farm in the east."})
keywordHandler:addKeyword({'rat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are sewers underneath the city. They say these sewers are brimming with rats."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can enter the sewers thorugh a sewer grate. But watch out. There are many rats. And don't forget to bring a torch."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should buy a bag or backpack. That way your hands will be free to hold a weapon and a shield."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Take a weapon into your hand and select a target. If you are wounded you should eat some food to heal your wounds."})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Take a weapon into your hand and select a target. If you are wounded you should eat some food to heal your wounds."})
keywordHandler:addKeyword({'eat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you would like to heal your wounds you should eat some food. Frodo sells excellent meals. But if you are very weak you can also come to me. I will heal you."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Gorn for a watch, if you need one."})
keywordHandler:addKeyword({'sacred places'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just ask in which of the five {blessings} you are interested in."})

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

local talkstorage = 9900
local talkstoragea = 9902
local endstorage = 9901

if msgcontains(msg, 'wooden stake') and getPlayerStorageValue(cid, talkstoragea) == -1 then
	if getPlayerStorageValue(cid, talkstorage) == -1 then
		npcHandler:say("A blessed stake to defeat evil spirits? I do know an old prayer which is said to grant sacred power and to be able to bind this power to someone, or something. ...",cid)
		npcHandler:say("However, this prayer needs the combined energy of ten priests. Each of them has to say one line of the prayer. ...",cid, 4000)
		npcHandler:say("I could start with the prayer, but since the next priest has to be in a different location, you probably will have to travel a lot. ...",cid, 7000)
		npcHandler:say("Is this stake really important enough to you so that you are willing to take this burden?",cid, 10000)
		setPlayerStorageValue(cid, talkstorage, 1)
	else
		npcHandler:say("Go talk with Gamon about the stake.", cid) 
end
elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, talkstorage) == 1 then	
	if getPlayerStorageValue(cid, talkstorage) == 1 then
		npcHandler:say(" Alright, I guess you need a stake first. Maybe Gamon can help you, the leg of a chair or something could just do. Try asking him for a stake, and if you have one, bring it back to me.", cid)
		setPlayerStorageValue(cid, talkstorage, 2)
	else
		npcHandler:say("Go talk with Gamon about the stake.", cid)
	end 
elseif msgcontains(msg, 'wooden stake') and getPlayerItemCount(cid,5941) >= 1 then	
	if getPlayerStorageValue(cid, talkstorage) == 2 and getPlayerStorageValue(cid, endstorage) == -1 then
		npcHandler:say("Ah, I see you brought a stake with you. Are you ready to receive my line of the prayer then?", cid)
		setPlayerStorageValue(cid, talkstorage, 3)
	else
		npcHandler:say("I have already blessed your wooden stake.", cid)
	end 
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, talkstorage) == 3 then
		npcHandler:say("So receive my prayer: 'Light shall be near - and darkness afar'. Now, bring your stake to Tibra in the Carlin church for the next line of the prayer. I will inform her what to do.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, endstorage, 1)
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