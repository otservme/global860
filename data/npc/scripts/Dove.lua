local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()			end

local Topic = {}
local storage2 = 100168
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, storage2) == 24 and getPlayerStorageValue(cid, 100178) == -1) then
		npcHandler:say("Oh no! I knew that day would come! I am slightly above the allowed weight and if you can't supply me with some grapes to slim down I will get fired. Do you happen to have some grapes with you?",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then
    	if (msgcontains(msg, 'yes') and doPlayerRemoveItem(cid,2681,1)) then
		npcHandler:say("Oh thank you! Thank you so much! So listen ... <whispers her measurements>",cid)
		setPlayerStorageValue(cid, 100178,1)
		Topic[cid] = 0
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,100171,29)
		setPlayerStorageValue(cid, storage2, 31)
	end
	else
		npcHandler:say("There is no grapes with you!",cid)
	end 
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())