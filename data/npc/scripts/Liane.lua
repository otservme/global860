local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kevin Postner was already leader of the guild as I joined. I can't imagine anyone better for that position."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kevin Postner was already leader of the guild as I joined. I can't imagine anyone better for that position."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our guild relys heavily on the honor and trustworthyness of its members."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You might apply for a membership in our haedquarter."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its just south oh Kazordoon. Follow the road and you will run right into it."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am working here at the post office. If you have questions about the Royal Carlin Mail System or the depots ask me."})
keywordHandler:addKeyword({'office'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I rarely leave my office. You are welcome at any time."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Liane."})
keywordHandler:addKeyword({'depot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The depots are very easily to use. Just step in front of them and you will find your items in them. They are free for all citizens. Hail our Queen!"})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our Queen's rule makes Carlin prosper."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our wonderful town is protected by the wise Queen Eloise."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A town ruled by men, a dangerous place. Anyway, we bring also letters and parcels there."})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the postman in Thais and somewhat stupid. But he never sents wrong letters or parcels."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't deliver letters or parcels there, sorry."})
keywordHandler:addKeyword({'wally'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wally and I became pen-pals in the course of years."})


local Topic = {}
local storage2 = 100168
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, storage2) == 24 and getPlayerStorageValue(cid, 100175) == -1) then
		npcHandler:say("I have more urgent problem to attend then that. Those hawks are hunting my carrier pigeons. Bring me 12 arrows and I'll see if I have the time for this nonsense. Do you have 12 arrows with you?",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'yes') and Topic[cid] == 1 and doPlayerRemoveItem(cid,2544,12)) then
		npcHandler:say("Great! Now I'll teach them a lesson ... For those measurements ... <tells you her measurements>",cid)
		setPlayerStorageValue(cid, 100175,1)
		Topic[cid] = 0
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100178) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,100171,29)
		setPlayerStorageValue(cid, storage2, 31)
	end
    else
        npcHandler:say("I dont see the 12 arrows with you.",cid)
	end
	end 
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())