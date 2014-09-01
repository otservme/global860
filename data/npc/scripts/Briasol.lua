  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a jeweller and exchange money."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Briasol Crithanath."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know the time, sorry. I do not care for this concept. Watches are your master, they tell you what to do and when."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our lifespan is longer then that of other races. We should keep that in mind everytime."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They live that long and make not much out of it."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I mourn them. As soon as you get to know one he's dead."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We take care of them, give them shelter, and a reason to live."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin is a quite lovely city, given that its a city of humans."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais has a high demand on the jewelry that I craft."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The tradesmen of Venore offer high prices for my wares."})
keywordHandler:addKeyword({'roderick'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have only little dealings with him."})
keywordHandler:addKeyword({'olrik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only talk to him when I send a parcel to one of my customers in a far away city. He seems friendly and is a bit eager to please."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are the ones responsible for most of the magic and the like in this town."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our caste are workers out of passion."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They hunt for us and patrol the woods."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about them."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are lost in time."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He will be gone sooner or later."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Gods are eternal. They learn so much in their existence."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a weapon of times long gone. It's lost for our time."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know nothing of importance."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy and sell small diamonds, sapphires, rubies, emeralds, and amethysts."})
keywordHandler:addKeyword({'pearl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have white and black pearls for sale, but you also can sell me some."})
keywordHandler:addKeyword({'jewel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can purchase our fine dwarfish wares like wedding rings, golden amulets, and ruby necklaces."})
keywordHandler:addKeyword({'talon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't trade with them."})

local Topic = {}
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("No then",cid)
		Topic[cid] = 0
	end

local rstorage = 100007
local talkstorage = 100009

if msgcontains(msg, 'fine vase') and getPlayerStorageValue(cid, rstorage) == 7 and getPlayerStorageValue(cid, talkstorage) == -1 then
	npcHandler:say("Rashid sent you, I suppose. Before I sell you that vase, one word of advice. ...", cid)
	npcHandler:say("Make room in your backpack so that I can place the vase carefully inside it. If it falls to the floor, it will most likely shatter or break if you try to pick it up again. ...",cid, 6000)
	npcHandler:say("This vase it not meant to be touched by human hands, so just keep your hands off it. Are you ready to buy that vase for 1000 gold?",cid, 12000)
	Topic[cid] = 1
	elseif Topic[cid] == 1 then
	if msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,1000) then
		npcHandler:say("Here you are.",cid)
		doPlayerAddItem(cid,7582,1)
	if setPlayerStorageValue(cid,100158) == 10 then
		setPlayerStorageValue(cid,100158, 11)
	end
	else
	    npcHandler:say("You dont have enough of money to buy it.",cid)
	end	
	Topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  