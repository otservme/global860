local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function greetCallback(cid)
	talkState[cid] = 0
	return true
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storage = 42337
	local storage2 = 42325
	local move = {x=33365, y=31204, z=8}
	local locationcrate = {x=33356, y=31181, z=8, stackpos = 255}
		
			if(msgcontains(msg, 'exit')) then	
				selfSay('Its you, why did they throw you in here again? Anyway, I will just transform you once more. I also recovered your crate which will wait for you at the exit. There, feel free to go.', cid)
				setPlayerStorageValue(cid, storage, 1)
				setPlayerStorageValue(cid, storage2, 1)
				doSetMonsterOutfit(cid, "Lancer Beetle", -1)
				doTeleportThing(cid, move)
			end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Another visitor to this constricted, cosy, calm realm, perfect except for an {exit}. Muhaha.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())