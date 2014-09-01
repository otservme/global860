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

    	if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, storage2) == 24 and getPlayerStorageValue(cid, 100177) == -1) then
		npcHandler:say("Come on, I have no clue what they are. Better ask my armorer Kroox for such nonsense.Go and ask him for good ol' {Lokurs measurements}, he'll know.",cid)
		setPlayerStorageValue(cid, 100177,1)
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100178) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,100171,29)
		setPlayerStorageValue(cid, storage2, 31)
	end
	end 
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())