local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a mystic of the suns. I provide protective blessings for those in need."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Edala, pilgrim."})
keywordHandler:addKeyword({'mystic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We mystics are philosophers and healers."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't consider me a member of any caste, and I don't want to talk about this matter."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't consider me a member of any caste, and I don't want to talk about this matter."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't consider me a member of any caste, and I don't want to talk about this matter."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't consider me a member of any caste, and I don't want to talk about this matter."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't consider me a member of any caste, and I don't want to talk about this matter."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Crunor is great in his beauty."})
keywordHandler:addKeyword({'priyla'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The daughter of the stars is my patron."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is true that this weapon brings great power. But you should not look for power. It is wisdom you really need."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "News? I don't care about news."})

local node1 = keywordHandler:addKeyword({'third bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Here on the Suntower you may receive the blessing The Fire of The Suns. But we must ask of you to sacrifice 2000 gold. Are you still interested?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 3, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 120})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})
	
	local node2 = keywordHandler:addKeyword({'fire of the suns'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Here on the Suntower you may receive the blessing The Fire of The Suns. But we must ask of you to sacrifice 2000 gold. Are you still interested?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 3, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 120})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Oh. You do not have enough money.'})

npcHandler:addModule(FocusModule:new())