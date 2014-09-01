local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not that I like to talk to you, but I am Elathriel Shadowslayer."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the leader of the Kuridai and the Az'irel of Ab'dendriel. Humans would call it sheriff, executioner, or avenger."})
keywordHandler:addKeyword({'sheriff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes people get imprisoned for some time. True criminals will be cast out and for comitting the worst crimes offenders are thrown into the hellgate."})
keywordHandler:addKeyword({'executioner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes people get imprisoned for some time. True criminals will be cast out and for comitting the worst crimes offenders are thrown into the hellgate."})
keywordHandler:addKeyword({'avenger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes people get imprisoned for some time. True criminals will be cast out and for comitting the worst crimes offenders are thrown into the hellgate."})
keywordHandler:addKeyword({'hellgate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It was here among other structures, like the depot tower, before our people came here. It's secured by a sealed door."})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "For safety we keep the door to the hellgate locked all times. I have the keys to open it when needed."})
keywordHandler:addKeyword({'sealed'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "For safety we keep the door to the hellgate locked all times. I have the keys to open it when needed."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I couldn't care less."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We watch this city and the actions of its inhabitants closely."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The thain kingdom and we share some enemys, so its only logical to cooperate in a few areas."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The merchants of venore provide us with some usefull goods. Still I an convinced that they get more out of our bargain then we do."})
keywordHandler:addKeyword({'roderick'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is tolerated here as the spokesman of the thaian king."})
keywordHandler:addKeyword({'olrik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This human is too unimportant to be even mentioned."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's hard for some of my people to grasp the true concept of a strong leader."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A human weakling, not much more."})
keywordHandler:addKeyword({'eloise'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A human weakling, not much more."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My people are divided in castes in these times, until they comprehend that only the way of the Kuridai can save us all."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We might use the shelter earth and hills provide us, but their obsession for metal is a waste of time."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are useful ... and better stay useful."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Like all inferior races they can be at least used for something good. The other castes are just jealous about our use of them."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's one of the more useful concepts we can learn from the other races."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Arrogant bastards, but they wield quite powerful magics."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are the heart of the elven society. We forge, we build, and we don't allow our people to be pushed around."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Confused cowards. With all their skill they still tend to hide and run. What a waste."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even more undecided then the deraisim."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dreamers are of no practical use. I don't mourn their demise."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even if he'd walk through the town above the other castes won't see the necessity to follow OUR way."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no use for the treething. I worship Mortiur, the ravager, of course."})
keywordHandler:addKeyword({'mortiur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The celestial paladin of revenge. He was one of the greatest elven wariors of all times."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I still doubt it exists."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "News are confidential and not your business."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Druids' magic is too peaceful for my taste."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have seen human sorcerers doing some impressive things ... before they died."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't sell such stuff."})


function key(cid, message, keywords, parameters, node)
   if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys
	
         if player_money >= 5000 then
        if doPlayerRemoveMoney(cid,5000) then
            npcHandler:say('Here it is.', cid)
            local playerID = getPlayerGUID(cid)
                 local item = doPlayerAddItem(cid, 2089, 1)
             doSetItemActionId(item, 3012)
        end
        else
            npcHandler:say('Come back when you have enough money.', cid)
    end
end	

node1 = keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If you are that curious, do you want to buy a key for 5000 gold? Don\'t blame me if you get sucked in.'})
node1:addChildKeyword({'yes'}, key, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Believe me, it\'s better for you that way.', reset = true})

npcHandler:addModule(FocusModule:new())