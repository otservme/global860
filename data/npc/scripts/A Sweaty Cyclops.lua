local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day I'll go and look."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me parents live here before town was. Me not care about lil' ones."})
keywordHandler:addKeyword({'old'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mountain in south. Lil' lil' ones living there."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me not fight them, they not fight me."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Always asking me for stuff they can't afford."})
keywordHandler:addKeyword({'orc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Silly ones. Not talk much. Always screaming and hitting."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They were friend with me parents. Long before elves here, they often made visit. No longer come here."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' lil' ones are so fun. We often chat."})
keywordHandler:addKeyword({'lil lil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' lil' ones are so fun. We often chat."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You shut up. Me not want to hear."})
keywordHandler:addKeyword({'smith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Working steel is my profession."})
keywordHandler:addKeyword({'steel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Manny kinds of. Like Mesh Kaha Rogh, Za'Kalortith, Uth'Byth, Uth'Morc, Uth'Amon, Uth'Maer, Uth'Doon, and Zatragil"})
keywordHandler:addKeyword({'Mesh Kaha Rogh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Steel that is singing when forged. No one knows where find today."})
keywordHandler:addKeyword({"Za'Kalortith"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's evil. Demon iron is. No good cyclops goes where you can find and need evil flame to melt."})
keywordHandler:addKeyword({"Uth'Byth"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not good to make stuff off. Bad steel it is. But eating magic, so useful is."})
keywordHandler:addKeyword({"Uth'Morc"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' ones it thieves' steel call sometimes. It's dark and making not much noise."})
keywordHandler:addKeyword({"Uth'Amon"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brigthsteel is. Much art made with it. Sorcerers to lazy and afraid to enchant much."})
keywordHandler:addKeyword({"Uth'Maer"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heartiron from heart of big old mountain, found very deep. Lil' lil ones fiercely defend. Not wanting to have it used for stuff but holy stuff."})
keywordHandler:addKeyword({"Uth'Doon"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's high steel called. Only lil' lil' ones know how make."})
keywordHandler:addKeyword({'Zatragil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Most ancients use dream silver for different stuff. Now ancients most gone. Most not know about."})
keywordHandler:addKeyword({'Teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'Deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'Cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'Kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'cyclops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me people not live here much. Most are far away."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me wish I could make weapon like it."})

-- XVX FORGER START --

function amulet(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,8262) >= 1 and getPlayerItemCount(cid,8263) >= 1 and getPlayerItemCount(cid,8264) >= 1 and  getPlayerItemCount(cid,8265) >= 1 then
        if doPlayerRemoveItem(cid,8262,1) and doPlayerRemoveItem(cid,8263,1) and doPlayerRemoveItem(cid,8264,1) and  doPlayerRemoveItem(cid,8265,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,8266,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function obsidian(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2516) >= 1 and getPlayerItemCount(cid,2425) >= 1 then
        if doPlayerRemoveItem(cid,2516,1) and doPlayerRemoveItem(cid,2425,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5908,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end	

function crude(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2393) >= 1 then
        if doPlayerRemoveItem(cid,2393,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5892,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function draconian(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2516) >= 1 then
        if doPlayerRemoveItem(cid,2516,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5889,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
   end   
end

-- XVX FORGER END --

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can forge Amulet, Obsidian Knife, Huge Chunk of Crude Iron and Piece of Draconian Steel!"})

local node1 = keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hum Humm! Welcume lil. Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil time to make it unbroken. Yes or no??'})
    node1:addChildKeyword({'yes'}, amulet, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'obsidian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade a Dragon Shield and an Obsidian Lance for a Obsidian Knife?'})
    node2:addChildKeyword({'yes'}, obsidian, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node3 = keywordHandler:addKeyword({'crude'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade a Giant Sword for a Huge Chunk of Crude Iron?'})
    node3:addChildKeyword({'yes'}, crude, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})
	
local node4 = keywordHandler:addKeyword({'draconian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade a Dragon Shield for a Piece of Draconian Steel?'})
    node4:addChildKeyword({'yes'}, draconian, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())