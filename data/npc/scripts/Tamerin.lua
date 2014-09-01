local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100041
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   local v = getPlayerStorageValue(cid, storage)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == -1 then
        npcHandler:say("Why should I do something for another human being? I have been on my own for all those years. Hmm, but actually there is something I could need some assistance with. ...", cid)
        npcHandler:say("If you help me to solve my problems, I will help you with your mission. Do you accept?",cid, 5500)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
            npcHandler:say("I ask you for two things! For one thing, I need an {animal cure} and for another thing, I ask you to get rid of the gladiator {Morik} for me.",cid)
			setPlayerStorageValue(cid,storage, 1)
			setPlayerStorageValue(cid, 100086, 14)
			Topic[cid] = 0
		end
	elseif msgcontains(msg, 'animal cure') then
		if doPlayerTakeItem(cid, 9734, 1) then
            npcHandler:say("Thank you very much. As I said, as soon as you have helped me to solve both of my problems, we will talk about your {mission}.",cid)
			setPlayerStorageValue(cid,storage, 2)
		else
		    npcHandler:say("You better don't return here until you've finished your {mission}.", cid)  
		end
	elseif msgcontains(msg, 'morik') then
	if doPlayerTakeItem(cid, 9735, 1) then
            	npcHandler:say("Thank you very much. As I said, as soon as you have helped me to solve both of my problems, we will talk about your {mission}.",cid)
		setPlayerStorageValue(cid,storage, 3)
		setPlayerStorageValue(cid, 100086, 15)
	else
		npcHandler:say("You better don't return here until you've finished your {mission}.", cid)    
	end
end
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == 3 then
        npcHandler:say("You have kept your promise. Now, it's time to fulfil my part of the bargain. What kind of animals shall I raise? {Warbeasts} or {cattle}?",cid)
	Topic[cid] = 2	
	elseif Topic[cid] == 2 and not msgcontains(msg, 'warbeasts')  then
        if msgcontains(msg, 'cattle') then 
           npcHandler:say("So be it! ",cid)
           setPlayerStorageValue(cid,100017, 2)
           setPlayerStorageValue(cid, storage, 4) 
	   setPlayerStorageValue(cid, 100086, 16)
        end
	elseif Topic[cid] == 2 then
        if msgcontains(msg, 'warbeasts') then 
           npcHandler:say("So be it! ",cid) 
           setPlayerStorageValue(cid,100018, 1)
           setPlayerStorageValue(cid, storage, 4) 
	   setPlayerStorageValue(cid,100047, 1)
	   setPlayerStorageValue(cid, 100086, 16)
          end 
         
		Topic[cid] = 0
		end
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())