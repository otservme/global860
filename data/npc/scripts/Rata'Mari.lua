local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
local donestorage = 9032
local talkstorage = 9038

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if (msgcontains(msg, "PIEDPIPER") or msgcontains(msg, "piedpiper")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, donestorage) == 3 then
        npcHandler:say("Meep? I mean - hello! Sorry, "..getCreatureName(cid).."... Being a rat has kind of grown on me.", cid)
		npcHandler:addFocus(cid)
		Topic[talkUser] = 0
		return true
	end
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		selfSay("Meep!", cid, TRUE)
		Topic[talkUser] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
elseif msgcontains(msg, 'spy report') and getPlayerStorageValue(cid, talkstorage) == -1 then		
	if getPlayerStorageValue(cid, donestorage) == 3 then
        npcHandler:say("You have come for the report? Great! I have been working hard on it during the last months. And nobody came to pick it up. I thought everybody had forgotten about me! ...",cid)
		npcHandler:say("Do you have any idea how difficult it is to hold a pen when you have claws instead of hands? ...",cid, 6000)
		npcHandler:say("But - you know - now I have worked so hard on this report I somehow don't want to part with it. Atleast not without some decent payment. ...",cid, 12000)
		npcHandler:say("All right - listen - I know Fa'hradin would not approve of this, but I can't help it. I need some cheese! I need it now! ...",cid, 17000)
		npcHandler:say("And I will not give the report to you until you get me some! Meep!",cid, 23000)
		setPlayerStorageValue(cid, talkstorage, 1)
	end 
	elseif msgcontains(msg, 'spy report') and getPlayerStorageValue(cid, talkstorage) == 1 then	
	if getPlayerStorageValue(cid, donestorage) == 3 then
        npcHandler:say("Ok, have you brought me the cheese, I've asked for?",cid)
		setPlayerStorageValue(cid, talkstorage, 1)
	end 
	elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, talkstorage) == 1 then	
	if getPlayerStorageValue(cid, donestorage) == 3 and doPlayerRemoveItem(cid,2696,1) then
        npcHandler:say("Meep! Meep! Great! Here is the spy report!",cid)
        npcHandler:say("Meep!",cid, 1000)
        setPlayerStorageValue(cid, talkstorage, 2)
		setPlayerStorageValue(cid, donestorage, 4)
		doPlayerAddItem(cid,2345,1)
		setPlayerStorageValue(cid, 100064, 8) 
	else
	    npcHandler:say("Meep! Cheese! Meep! Missing! Meep!",cid)
	end 
	end  
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Meep! Meep!")  