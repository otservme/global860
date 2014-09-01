local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage2 = 100168
local talkstor = 100173
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	setPlayerStorageValue(cid,talkstor,-1)
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("What do you mean by no?",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (getPlayerStorageValue(cid,storage2) == 16 and getPlayerStorageValue(cid,talkstor) == -1) then
		npcHandler:say("DRESS FLATTEN? WHO WANTS ME TO FLATTEN A DRESS?",cid)
		Topic[cid] = 1
		setPlayerStorageValue(cid,talkstor,1)
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (Topic[cid] == 1 and getPlayerStorageValue(cid,talkstor) == 1) then
		npcHandler:say("A PRESS LANTERN? NEVER HEARD ABOUT IT!",cid)
		Topic[cid] = 2
	end
	elseif (Topic[cid] == 2) then   
	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (Topic[cid] == 2) then
		npcHandler:say("CHESS? I DONT PLAY CHESS!",cid)
		Topic[cid] = 3
	end
	elseif (Topic[cid] == 3) then   
	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (Topic[cid] == 3) then
		npcHandler:say("A PATTERN IN THIS MESS?? HEY DON'T INSULT MY MACHINEHALL!",cid)
		Topic[cid] = 4
	end
	elseif (Topic[cid] == 4) then   
	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (Topic[cid] == 4) then
		npcHandler:say("AH YES! I WORKED ON THE DRESS PATTERN FOR THOSE UNIFORMS. STAINLESS TROUSERES, STEAM DRIVEN BOOTS! ANOTHERMARVEL TO BEHOLD! I'LL SEND A COPY TO KEVIN IMEDIATELY!",cid)
		setPlayerStorageValue(cid,storage2,17)
		setPlayerStorageValue(cid,100171,22)
		Topic[cid] = 0
	end
	end 
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "HIHOOOO |PLAYERNAME|! <waves his hands>")
npcHandler:setMessage(MESSAGE_FAREWELL, "BYEEE |PLAYERNAME|! <waves his hands>") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())