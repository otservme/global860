local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm afraid I do not trade with weapons or armour. Nah'bob only deals with magical equipment."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm afraid I do not trade with weapons or armour. Nah'bob only deals with magical equipment."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm afraid I do not trade with weapons or armour. Nah'bob only deals with magical equipment."})
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'magical'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying bronze amulets, stone skin amulets, elven amulets and garlic necklaces."})
keywordHandler:addKeyword({'ring'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying stealth rings, power rings, sword rings, axe rings, and club rings."})
keywordHandler:addKeyword({'wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm buying wands of vortex, wands of dragonbreath, wands of plague, wands of cosmic energy and wands of inferno as well as magic light wands."})
keywordHandler:addKeyword({'special'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying magic light wands. I'm currently also looking for mind stones, life crystals and orbs."})

function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

local donestorage = 9032 
     	 
if msgcontains(msg, "items") or msgcontains(msg, "change") and getPlayerStorageValue(cid, donestorage) == 8 then
if getPlayerStorageValue(cid, donestorage) == 8 then
        npcHandler:say('I trade Enchanted Chicken Wind  for Boots of Haste ,Warrior Sweat for 4 Warrior Helmets ,Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords and Loterry ticket for 100 empty vials', cid)
  end
    elseif msgcontains(msg,'enchanted chicken wind') or msgcontains(msg,'boots of haste') then
    if getPlayerStorageValue(cid, donestorage) == 8 then
        npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wind?', cid)
        talk_state = 1 
        end
 
    elseif msgcontains(msg,'warrior Sweat') or msgcontains(msg,'warrior helmet') then
    if getPlayerStorageValue(cid, donestorage) == 8 then
        npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
        talk_state = 2 
        end
 
    elseif msgcontains(msg,'fighting Spirit') or msgcontains(msg,'royal helmet') then
    if getPlayerStorageValue(cid, donestorage) == 8 then
        npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)       
        talk_state = 3
        end
 
    elseif msgcontains(msg,'magic sulphur') or msgcontains(msg,'fire sword') then
    if getPlayerStorageValue(cid, donestorage) == 8 then
        npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid) 
        talk_state = 4
        end
 
    elseif msgcontains(msg,'lottery ticket') or msgcontains(msg,'lottery') or msgcontains(msg,'ticket') then
    if getPlayerStorageValue(cid, donestorage) == 8 then
        npcHandler:say('Do you want to trade 100 empty vials for lottery ticket', cid)     
        talk_state = 5
        end
 
    elseif msgcontains(msg,'yes') and talk_state == 1 then
        if getPlayerItemCount(cid,2195) >= 1 then
            if doPlayerRemoveItem(cid,2195,1) then
                npcHandler:say(msg,'Here you are', cid)
                doPlayerAddItem(cid,5891,1)
            end
        else
            npcHandler:say('Sorry you don\'t have the item', cid)
        end
 
    elseif msgcontains(msg,'yes') and talk_state == 2 then
        if getPlayerItemCount(cid,2475) >= 4 then
            if doPlayerRemoveItem(cid,2475,4) then
                npcHandler:say(msg,'Here you are', cid)
                doPlayerAddItem(cid,5885,1)
            end
        else
            npcHandler:say('Sorry you don\'t have the item', cid)
        end
 
    elseif msgcontains (msg,'yes') and talk_state == 3 then
        if getPlayerItemCount(cid,2498) >= 2 then
            if doPlayerRemoveItem(cid,2498,2) then
                npcHandler:say(msg,'Here you are', cid)
                doPlayerAddItem(cid,5884,2)
            end
        else
            npcHandler:say('Sorry but you don\'t have the item', cid)
        end
 
    elseif msgcontains(msg,'yes') and talk_state == 4 then
        if getPlayerItemCount (cid,2392) >= 3 then
            if doPlayerRemoveItem (cid,2392,3) then
                npcHandler:say(msg,'Here you are', cid)
                doPlayerAddItem(cid,5904,1)
            end
        else
            npcHandler:say('Sorry but you don\'t have the item', cid)
        end
 
    elseif msgcontains(msg,'yes') and talk_state == 5 then
        if getPlayerItemCount (cid,2006) >= 100 then
            if doPlayerRemoveItem (cid,2006,100) then
                npcHandler:say(msg,'Here you are', cid)
                doPlayerAddItem(cid,5957,1)
            end
        else
            npcHandler:say('Sorry but you don\'t have the item', cid, cid)
        end
 
        elseif msgcontains(msg,'no') and (talk_state >= 1 and talk_state <= 5) then
             npcHandler:say(msg,'Ok then', cid)
             talk_state = 0
    end
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  
npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")