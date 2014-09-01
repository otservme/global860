local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm an amazon guard. It's my job to keep my eyes open and to keep enemies from passing by. My job here truely is one of the toughest. All because of these nerve-racking beasts."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Thanita. Nice to meet you."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To get rid of them, you need to be quite good in different martial arts."})
keywordHandler:addKeyword({'defeat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To get rid of them, you need to be quite good in different martial arts."})
keywordHandler:addKeyword({'tower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a watchtower of the city of carlin. From here I can see pretty much all of the surrounding lands. Hardly anybody can startle me up here. I see all enemies long before they can see me."})
keywordHandler:addKeyword({'enem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The enemies I fear most here are these nasty orcs."})
npcHandler:addModule(FocusModule:new())