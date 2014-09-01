local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Job? JOB? Hey man - I am in prison! But you know - once upon a time - I was a powerful mage! A mage ... come to think of it .., what is that - a mage?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is - uhm - hang on? I knew it yesterday, didn't I? Doesn't matter!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better save time than comitting a crime. I am a poet and I know it!"})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the mightiest sorcerer from here to there! Yeah!"})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Power. Hmmm. Once while we were crossing the mountains together a man named Aureus said to me that parcels are equal to power. Any idea what that meant?"})
keywordHandler:addKeyword({'books'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have many books in my home. But only powerful people can read them. I bet you will only see three dots after the headline! Hehehe! Hahaha! Excellent!"})
keywordHandler:addKeyword({'mad mage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey! That's me! You got it! Thanks mate - now I remember my name!"})
keywordHandler:addKeyword({'riddle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Great riddle, isn´t it? If you can tell me the correct answer, I will give you something. Hehehe!"})
keywordHandler:addKeyword({'something'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No! I won´t tell you. Shame coz it would be useful for you - hehehe."})
keywordHandler:addKeyword({'escape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How could I escape? They only give me rotten food here. I can´t regain my powers because I have no mana!"})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sure I have the key! Hehehe! Perhaps I will give it to you. IF you can solve my riddle."})
keywordHandler:addKeyword({'mino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are trying to capture me! Or hang on! Haven't they already captured me? Hmmm - I will have to think about this."})
keywordHandler:addKeyword({'markwin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the worst of them all! He is the king of the minos! May he burn in hell!"})
keywordHandler:addKeyword({'labyrinth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'palkar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the leader of the outcasts. I hope he will never conquer the city of Mintwallin. That would be the end of me!"})
keywordHandler:addKeyword({'karl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tataah!"})
keywordHandler:addKeyword({'demon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only monster I cannot conjure. But soon I will be powerful enough!"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'conjure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'home'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})

npcHandler:addModule(FocusModule:new())

