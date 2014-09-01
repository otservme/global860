local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the archsorcerer of Carlin. I keep the secrets of our order."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Lea."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is a force we sorcerers will master one day."})
keywordHandler:addKeyword({'wisdom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You need great wisdom to cast spells of power."})
keywordHandler:addKeyword({'male'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some tricks of sorcery are easy enough to be mastered even by males, but they'd better stick to cardtricks."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Any sorcerer dedicates his whole life to the study of the arcane arts."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sorcerers wield arcane powers beyond comprehension of men."})
keywordHandler:addKeyword({'arcane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sorcerers wield arcane powers beyond comprehension of men."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in this world: Sorcerers, paladins, knights, and druids."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A spellbook lists all your spells. There you can find the pronunciation of each spell. You can buy one at the magicians' shop."})
keywordHandler:addKeyword({'wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I'm not having any of those anymore, but please ask Rachel downstairs, I think she got some."})
keywordHandler:addKeyword({'rod'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I'm not having any of those anymore, but please ask Rachel downstairs, I think she got some."})
npcHandler:addModule(FocusModule:new())