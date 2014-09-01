local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)				npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()						npcHandler:onThink()					end

local config = {
	storage = 18256,
	storage2 = 42535
}

local Topic = {}
local storage2 = 100168
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, "Sam send me")) then
		       if getPlayerStorageValue(cid, config.storage) == 1 then
npcHandler:say({'Oh, so its you, he wrote me about? Sadly I have no dwarven armor in stock. But I give you the permission to retrive one from the mines. ...', 'The problem is, some giant spiders made the tunnels where the storage is their new home. Good luck.'}, cid)
			setPlayerStorageValue(cid, config.storage2, 1)
		else
			selfSay("I didn't recieve any letter about you from my dear friend, young one.", cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay("Bye.", cid)
	end

 
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'measurements') or msgcontains(msg, 'lokurs measurements') or msgcontains(msg, 'Lokurs measurements')) and (getPlayerStorageValue(cid, 100178) == -1) then
		npcHandler:say("Hm, well I guess its ok to tell you ... <tells you about Lokurs measurements>",cid)
		setPlayerStorageValue(cid,storage2,29)
	if (getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,100178,29)
		setPlayerStorageValue(cid, storage2, 31)
	end
	else
		npcHandler:say("UH? No clue what you are talking about, jawoll.",cid)
	end 
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())