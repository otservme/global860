local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling equipment of all kinds. Do you need anything?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Sarina. I am selling everything the adventurer needs."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't sell food."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Since the druids sealed that placed with their magic, rarely anyone was there. Perhaps whatever haunted that place is long gone, who knows."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, fishing rods, worms, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, footballs, and watches. I also sell means of illumination."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, fishing rods, worms, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, footballs, and watches. I also sell means of illumination."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, fishing rods, worms, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, footballs, and watches. I also sell means of illumination."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, fishing rods, worms, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, footballs, and watches. I also sell means of illumination."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, fishing rods, worms, bags, ropes, backpacks, plates, cups, scrolls, documents, parchments, footballs, and watches. I also sell means of illumination."})
keywordHandler:addKeyword({'illumination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, candlesticks, candelabra, and oil."})
npcHandler:addModule(FocusModule:new())