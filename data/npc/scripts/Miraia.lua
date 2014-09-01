local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                       npcHandler:onThink()    end

local Topic = {}
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("Is it the smell? Dont worry, the smell is worse than the taste.",cid)
		Topic[cid] = 0
	end


if msgcontains(msg, 'scarab cheese') then
	npcHandler:say("Let me cover my nose before I get this for you... Would you REALLY like to buy scarab cheese for 100 gold?", cid)
	Topic[cid] = 1
elseif Topic[cid] == 1 then
if msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,100) then	
	npcHandler:say("Here it is.",cid)
	doPlayerAddItem(cid,8368,1)
	if getPlayerStorageValue(cid,100158) == 7 then
	   setPlayerStorageValue(cid,100158, 8)
    end
else
	npcHandler:say("You dont have enough of money to buy it.",cid)
    	end
	Topic[cid] = 0
	end
	return true
end

-- Storage IDs --

oriental    = 22017
oriental    = 22018 

newaddon    = 'Ah, right! The barbarian axe! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function OrientalSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,soriental)
    if addon == -1 then
        if getPlayerItemCount(cid,5883) >= 100 and getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and getPlayerItemCount(cid,5912) >= 100 then
        if doPlayerRemoveItem(cid,5883,100) and doPlayerRemoveItem(cid,5895,100) and doPlayerRemoveItem(cid,5891,2) and doPlayerRemoveItem(cid,5912,100) then
            npcHandler:say('Ah, right! The oriental turban or oriental veil! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,soriental,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 146, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 150, 2)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end



node1 = keywordHandler:addKeyword({'turban'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get oriental turban you need give me 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth. Do you have them with you?'})
node1:addChildKeyword({'yes'}, OrientalSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get oriental veil you need give me 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth. Do you have them with you?'})
node2:addChildKeyword({'yes'}, OrientalSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})





npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())