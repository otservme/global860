local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Adrenius."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a priest of Fafnar."})
keywordHandler:addKeyword({'fafnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fafnar is the stronger one of the two suns above our world."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yyyyess. Yes, it's the capital city of Tibia I think."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin? Don't you mean Thais?"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who needs a king? I don't."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who needs weapons? I never had and i never will have weapons - what for?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Help? Help? Nothing more? Don't we all demand some help?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time? What is time? A word? A thing? An object?"})
keywordHandler:addKeyword({'sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Swords? Don't you have something else to do?"})
keywordHandler:addKeyword({'desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sand, sand and again sand. Sand all over. Yes, I'd say: it's truly a desert!"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What's that? You start annoying me."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Leave me alone. I don't want to fight."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fafnar is the greatest among the gods."})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Way? Which way? I forgot where most ways go to... excuse me."})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who needs doors? Free your mind!"})
keywordHandler:addKeyword({'secret'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Secrets ... What do you mean?"})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Treasures? What is a treasure for you?"})
keywordHandler:addKeyword({'book'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Read books, it increases your intelligence and, furthermore, it's a great source of inspiration!"})
keywordHandler:addKeyword({'gharonk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hmmmm... I don't know much about it."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you religion and mysticism."})
keywordHandler:addKeyword({'library'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard of the library, but I never was very interested in it."})

npcHandler:addModule(FocusModule:new())