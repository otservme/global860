local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100055
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No news are good news."})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "HAIL TO QUEEN ELOISE!"})
keywordHandler:addKeyword({'leader'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "HAIL TO QUEEN ELOISE!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you think? I am the sheriff of Carlin."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just fine."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If they make trouble, I'll put them behind bars like all others."})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If they make trouble, I'll put them behind bars like all others."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Bonecrusher family is ideally suited for military jobs."})
keywordHandler:addKeyword({'bonecrusher'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Bonecrusher family is ideally suited for military jobs."})
keywordHandler:addKeyword({'enem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you have a crime to report and clues, then do it, but dont waste my time."})
keywordHandler:addKeyword({'criminal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you have a crime to report and clues, then do it, but dont waste my time."})
keywordHandler:addKeyword({'murderer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you have a crime to report and clues, then do it, but dont waste my time."})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The castle is one of the safest places in Carlin."})
keywordHandler:addKeyword({'subject'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our people are fine and peaceful."})
keywordHandler:addKeyword({'tbi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I bet they spy on us... not my business, however."})
keywordHandler:addKeyword({'todd'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I scared this bigmouth so much that he left the town by night. HO, HO, HO!"})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city is is a peacful place, and it's up to me to keep it this way."})
keywordHandler:addKeyword({'hain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the guy responsible to keep the sewers working. Someone has to do such kind of jobs. I can't handle all the garbage of the city myself."})
keywordHandler:addKeyword({'rowenna'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rowenna is one of our local smiths. When you look for weapons, look for Rowenna."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rowenna is one of our local smiths. When you look for weapons, look for Rowenna."})
keywordHandler:addKeyword({'Cornelia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Cornelia is one of our local smiths. When you look for armor, look for Rowenna."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Cornelia is one of our local smiths. When you look for armor, look for Rowenna."})
keywordHandler:addKeyword({'legola'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She has the sharpest eye in the region, I'd say."})
keywordHandler:addKeyword({'padreia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Her peacefulness is sometimes near stupidity."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I worship Banor of course."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "For me, he's the god of justice."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His cult is forbidden in our town."})
keywordHandler:addKeyword({'brog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wouldn't wonder if some males worship him secretly. HO, HO, HO!"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I deal more with the human mosters, you know? HO, HO, HO!"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Would certainly make a good butterknife. HO, HO, HO!"})
keywordHandler:addKeyword({'rebellion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only thing that rebels here now and then is the stomach of a male after trying to make illegal alcohol. HO, HO, HO!"})
keywordHandler:addKeyword({'alcohol'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "For obvious reasons it's forbidden in our city."}) 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   local v = getPlayerStorageValue(cid, storage)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'job') then
        npcHandler:say("What do you think? I am the sheriff of Carlin.", cid)
	end
	if msgcontains(msg, 'water pipe') and getPlayerStorageValue(cid, storage) == -1 and getPlayerStorageValue(cid, 100054) == 1  then
            npcHandler:say("Oh, there's a waterpipe in one of my cells? ...",cid)
            npcHandler:say("I guess my last prisoner forgot it there.",cid, 500)
	    Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'prisoner') then
            npcHandler:say("My last prisoner? Hmm. ...",cid)
            npcHandler:say("I think he was some guy from Darama. Can't remember his name. ...",cid, 500)
            npcHandler:say("He was here just for one night, because he got drunk and annoyed our citizens. ...",cid, 1200)
            npcHandler:say("Obviously he wasn't pleased with this place, because he headed for Thais the next day. ...",cid, 2000)
            npcHandler:say("Something tells me that he won't stay out of trouble for too long.",cid, 2800)
            setPlayerStorageValue(cid,storage, 1)
			Topic[cid] = 0
		end
		Topic[cid] = 0
		end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Howdy!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE QUEEN!") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())