local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100056
 
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
	if msgcontains(msg, 'prison') and getPlayerStorageValue(cid, storage) == -1 and getPlayerStorageValue(cid, 100055) == 1 then
        npcHandler:say("You mean that's a JAIL? They told me it's the finest hotel in town! THAT explains the lousy roomservice!", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'ankrahmun') then
            npcHandler:say("Yes, I've lived in Ankrahmun for quite some time. Ahh, good old times! ...",cid)
            npcHandler:say("Unfortunately I had to relocate. <sigh> ...",cid, 700)
            npcHandler:say("Business reasons - you know.",cid, 1200)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'supplies') then
            npcHandler:say("What!? I bet, Baa'leal sent you! ...",cid)
            npcHandler:say("I won't tell you anything! Shove off!",cid, 500)
            setPlayerStorageValue(cid,storage, 1)
	    setPlayerStorageValue(cid, 100062, 4)
			Topic[cid] = 0
		end
		Topic[cid] = 0
		end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my little kingdom, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, visit me again. I will be here, promised.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())