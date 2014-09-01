  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

local talkstorage = 9903
local talkstoragea = 9904

if msgcontains(msg, 'wooden stake') and getPlayerStorageValue(cid, talkstoragea) == -1 then
	if getPlayerStorageValue(cid, 9900) == 2 then
		npcHandler:say("Making a stake from a chair? Are you insane??! I won't waste my chairs on you for free! You will have to pay for it, but since I consider your plan a blasphemy, it will cost 5000 gold pieces. Okay?", cid)
		setPlayerStorageValue(cid, talkstorage, 1)
end
elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, talkstorage) == 1 then	
	if doPlayerRemoveMoney(cid, 5000) then
		npcHandler:say("Argh... my heart aches! Alright... a promise is a promise. Here - take this wooden stake, and now get lost.", cid)
		setPlayerStorageValue(cid, 9902, 1)
		setPlayerStorageValue(cid, talkstorage, 2)
		setPlayerStorageValue(cid, talkstoragea, 2)
		doPlayerAddItem(cid,5941,1)
	else
		npcHandler:say("Hmpf... You missing 5000 gold pieces!", cid)
	end
	end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  