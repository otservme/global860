local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a healer."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My Name is Albert Fibulanian."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The sinful city of Thais is a monument of corruption and murder. I am glad I left for Edron and thank the gods every day for this isle."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The sinful city of Thais is a monument of corruption and murder. I am glad I left for Edron and thank the gods every day for this isle."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods of good take care of us."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king does much to enhance the life of his people, but he could do more."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king does much to enhance the life of his people, but he could do more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia is a world big enough for everyone. I wish people would realize that."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I dream of times which see no need for armies or warriors."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I dream of times which see no need for armies or warriors."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The fallen one is a perfect example where evil leads us to."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's only another instrument of pain and destruction."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have only news about weather, taxes, and harvests. I heared nothing that might interest a traveller like you."})
keywordHandler:addKeyword({'daniel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I healed his wounds, but nothing can heal his soul after the betrayal of some of his knightly brethren."})
keywordHandler:addKeyword({'kaine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Another victim of his own ambitions. I mourn for his soul."})


npcHandler:addModule(FocusModule:new())