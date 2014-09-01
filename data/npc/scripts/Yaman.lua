local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying strange talismans, silver amulets, protection amulets and dragon necklaces."})
keywordHandler:addKeyword({'ring'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying might rings, energy rings, life rings, time rings, dwarven rings and rings of healing."})
keywordHandler:addKeyword({'special'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm currently looking for some special items. Do you have any ankhs or a mysterious fetish?"})
npcHandler:addModule(FocusModule:new())