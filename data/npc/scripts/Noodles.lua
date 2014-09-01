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
	if (msgcontains(msg, 'no') or msgcontains(msg, 'bad')) and (Topic[cid] >= 1) then
		npcHandler:say("Grrr! Woof! Woof!",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'sniff banana skin') or msgcontains(msg, 'banana skin')) and (getPlayerStorageValue(cid, storage2) == 20) then 
        if (getPlayerItemCount(cid,2219) >= 1) then
		npcHandler:say("<sniff><sniff>",cid)
		Topic[cid] = 1
			else
	    npcHandler:say("Grrr! banana?",cid)
   end
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (Topic[cid] == 1) then
		npcHandler:say("Woof!",cid)
		Topic[cid] = 2
	end
	elseif (Topic[cid] == 2) then
	if (msgcontains(msg, 'sniff dirty fur') or msgcontains(msg, 'dirty fur')) and (Topic[cid] == 2) then
    if (getPlayerItemCount(cid,2220) >= 1) then
		npcHandler:say("<sniff><sniff>",cid)
		Topic[cid] = 3
		end
	else
	    npcHandler:say("Grrr! fur?",cid) 
	end 
	elseif (Topic[cid] == 3) then   
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (Topic[cid] == 3) then
		npcHandler:say("Woof!",cid)
		Topic[cid] = 4
	end
	elseif (Topic[cid] == 4) then
    	if (msgcontains(msg, 'sniff mouldy cheese') or msgcontains(msg, 'mouldy cheese')) and (Topic[cid] == 4) then
        if (getPlayerItemCount(cid,2235,1)) then
		npcHandler:say("<sniff><sniff>",cid)
		Topic[cid] = 5
		end
	else
	    npcHandler:say("Grrr! cheese?",cid)
	end 
	elseif (Topic[cid] == 5) then   
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (Topic[cid] == 5) then
		npcHandler:say("Meeep! Grrrrr! <spits>",cid)
		setPlayerStorageValue(cid,storage2,21)
		setPlayerStorageValue(cid,100171,26)
		Topic[cid] = 0
	end
	end
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "<sniff> Woof! <sniff>")
npcHandler:setMessage(MESSAGE_FAREWELL, "Woof! Woof!") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())