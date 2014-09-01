  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods we call the good ones are Fardos, Uman, the Elements, Suon, Crunor, Nornur, Bastesh, Kirok, Toth, and Banor."})
--keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, there's no blessings available in this world."})
keywordHandler:addKeyword({'marri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I've quited that business, but I heard someone could merry people in Thais, go and ask there"})
keywordHandler:addKeyword({'ceremony'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I've quited that business, but I heard someone could merry people in Thais, go and ask there"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a priest of the great pantheon."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, worldly matters are of no concern to me."})
--keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world of Tibia is the creation of the gods."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thank you, I'm fine, the gods give me hope and comfort."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The grace of the gods must be earned, it cannot be bought!"})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods of good guard us and guide us, the gods of evil want to destroy us and steal our souls!"})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The teachings of Crunor tell us to honor life and not to harm it."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The things we priests know about the citizens are confidential."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only a man can fall as low as he did. His soul rotted away already."})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Queen Eloise is wise to listen to the proposals of the druidic followers of Crunor."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Remind: Not everything you call monster is evil to the core!"})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to bring the teachings of the gods to everyone."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to bring the teachings of the gods to everyone."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is MY mission to teach, it is YOUR mission to fight!"})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is MY mission to teach, it is YOUR mission to fight!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The fallen one should be mourned, not feared."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The mythical blade was hidden in ancient times. Its said that powerful wards protect it."})
keywordHandler:addKeyword({'graveyard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's something strange in its neighbourhood. But whom we gonna call for help if not the gods?"})
keywordHandler:addKeyword({'crypt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's something strange in its neighbourhood. But whom we gonna call for help if not the gods?"})
keywordHandler:addKeyword({'mausoleum'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's something strange in its neighbourhood. But whom we gonna call for help if not the gods?"})
keywordHandler:addKeyword({'fardos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fardos is the creator. The great obsever. He is our caretaker."})
keywordHandler:addKeyword({'uman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uman is the positive aspect of magic. He brings us the secrets of the arcane arts."})
keywordHandler:addKeyword({'suon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Suon is the lifebringing sun. He observes the creation with love."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Crunor, the great tree, is the father of all plantlife. He is a prominent god for many druids."})
keywordHandler:addKeyword({'nornur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nornur is the mysterious god of fate. Who knows if he is its creator or just a chronist?"})
keywordHandler:addKeyword({'bastesh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bastesh, the deep one, is the goddess of the sea and its creatures."})
keywordHandler:addKeyword({'kirok'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kirok, the mad one, is the god of scientists and jesters."})
keywordHandler:addKeyword({'toth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Toth, Lord of Death, is the keeper of the souls, the guardian of the afterlife."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Banor, the heavenly warrior, is the patron of all fighters against evil. He is the gift of the gods to inspire humanity."})
keywordHandler:addKeyword({'tibiasula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibiasula lost her life, but out of her essence the world was created."})
--keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia is the essence of the elemental power of earth."})
keywordHandler:addKeyword({'sula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sula is the essence of the elemental power of water."})
keywordHandler:addKeyword({'air'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Air is one of the primal elemental forces, sometimes worshipped by tribal shamans."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fire is one of the primal elemental forces, sometimes worshipped by tribal shamans."})
keywordHandler:addKeyword({'evil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods we call the evil ones are Zathroth, Fafnar, Brog, Urgith, and the Archdemons!"})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Zathroth is the destructive aspect of magic. He is the deciver and the thief of souls."})
keywordHandler:addKeyword({'fafnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fafnar is the scorching sun. She observes the creation with hate and jealousy."})
keywordHandler:addKeyword({'brog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brog, the raging one, is the great destroyer. The berserk of darkness."})
keywordHandler:addKeyword({'urgith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The bonemaster Urgith is the lord of the undead and keeper of the damned souls."})
keywordHandler:addKeyword({'archdemons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The demons are followers of Zathroth. The cruelest are known as the ruthless seven."})
keywordHandler:addKeyword({'ruthless seven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I dont want to talk about that subject!"})

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
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

local talkstorage = 9905
local endstorage = 9901

if msgcontains(msg, 'wooden stake') then
	if getPlayerStorageValue(cid, endstorage) == 1 then
		npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
		setPlayerStorageValue(cid, talkstorage, 1)
end
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, talkstorage) == 1 then
		npcHandler:say("So receive my prayer: 'Hope may fill your heart - doubt shall be banned'. Now, bring your stake to Maealil in the elven settlement for the next line of the prayer. I will inform him what to do.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, endstorage, 2)
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