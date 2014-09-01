local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage2 = 100168
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("That just makes me sad.",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'present') and getPlayerStorageValue(cid, storage2) == 11) then
		npcHandler:say("Uh? What do you want?!",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'yes') and Topic[cid] == 1 and doPlayerRemoveItem(cid,2331,1)) then
		npcHandler:say("You have a present for me?? Realy?",cid)
		setPlayerStorageValue(cid,storage2,12)
		setPlayerStorageValue(cid,100171,17)
		Topic[cid] = 0
	else
		npcHandler:say("I dont see any {present} with you!",cid)
	end
	end 
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Hello, traveller player. How can I help you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())