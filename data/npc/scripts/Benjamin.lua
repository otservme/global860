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

    	if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, storage2) == 24 and getPlayerStorageValue(cid, 100174) == -1) then
		npcHandler:say("Oh they dont change that much since in the old days as... <tells a boring and confusing story about a cake, a parcel, himself and two squirrels, at least he tells you his measurements in the end>",cid)
		setPlayerStorageValue(cid, 100174,1)
	if (getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100178) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,100171,29)
		setPlayerStorageValue(cid, storage2, 31)
	end
	end 
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())