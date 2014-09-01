local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying spike swords, war hammers and obsidian lances. Furthermore I would buy fire swords, ice rapiers, dragon lances, fire axes and broadswords from you, if you have any."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm just selling beholder shields. But I'm buying guardian shields, dragon shields, beholder shields, crown shields, medusa shields and phoenix shields."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying noble armors. Furthermore I'm buying dragon scale mails, crown armors and blue robes."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm not selling any helmets. I'm only buying crown helmets, crusader helmets and royal helmets."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only buying crown legs. Oh, and I'm also looking for boots of haste!"})
npcHandler:addModule(FocusModule:new())