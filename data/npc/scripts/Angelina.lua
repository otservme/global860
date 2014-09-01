local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'prisoner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think Lorbas liked the idea to 'convert' me to their twisted cult and saw it as a test for their leaders. Now that the magic symbols are turned off, I will gather my strength within some hours and teleport to safety."})
keywordHandler:addKeyword({'humble'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are no records about the foundation of this order, and it is unknown where its 'monks' come from. Yet, travellers told us that they are living near the remains of the dark cathedral."})
keywordHandler:addKeyword({'path'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are no records about the foundation of this order, and it is unknown where its 'monks' come from. Yet, travellers told us that they are living near the remains of the dark cathedral."})
keywordHandler:addKeyword({'monk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I learnt that these monks are impostors that use false promises to lure unwary ones into the arms of their strange cult which seems to have more political than religious agendas."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no idea who is the mastermind behind all this, but it seems too big and too well organised to be the work of only a handful of false monks."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king is a wise ruler but his realm is large and we all need to work hard to make the world a better place."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sadly the trade barons care more about wealth than the gods."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many see Thais as a fallen city but it is only the loudness of an ugly minority that gives people this impression."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The druids have their own way to interpret the gods' will and this has to be respected."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The downfall of some of the most noble knights there should serve us as a warning to stay on guard for the evil that wants to lure us on the wrong path."})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to discuss the teachings of the gods with you but this is neither the time nor the place."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We all have to help to make this world a better place."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves carry bitterness and pain in their souls. But it is them that have forgotten about the gods and not the other way around."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves carry bitterness and pain in their souls. But it is them that have forgotten about the gods and not the other way around."})
keywordHandler:addKeyword({'dwarfs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves carry bitterness and pain in their souls. But it is them that have forgotten about the gods and not the other way around."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The elves have lost their balance and identity. In this unstable state they can easily be misled or might draw the wrong conclusions."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The elves have lost their balance and identity. In this unstable state they can easily be misled or might draw the wrong conclusions."})
keywordHandler:addKeyword({'elfs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The elves have lost their balance and identity. In this unstable state they can easily be misled or might draw the wrong conclusions."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A far away continent that will widen our view of the wonders the gods provide us with."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know only little about the teachings of Daraman but as far as I heard they concentrate too much on the single individual instead on the world as a whole."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This city is the best example where godless philosophies might lead to."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is only one of the many servants of the evil. Eventually he will fall but there will be others to take his place."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day this weapon will be unearthed and then it will be wielded against the servants of the evil."})
keywordHandler:addKeyword({'assassin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The assassins are the eyes and the long arm of this damnable cult. They eliminate the enemies and those who found out too much about their plans. Be aware of that and always watch your back."})
keywordHandler:addKeyword({'dark monk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dark monks are the teachers and seducers of this cult. They work covertly in the cities and train thieves and assassins in the underground base here."})

npcHandler:addModule(FocusModule:new())