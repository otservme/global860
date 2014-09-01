  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

local Topic = {}
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("No then.",cid)
		Topic[cid] = 0
	end
local rstorage = 100007
local talkstorage = 100008

if msgcontains(msg, 'package for Rashid') and getPlayerStorageValue(cid, talkstorage) == -1 and getPlayerStorageValue(cid, rstorage) == 3 then
		npcHandler:say("Oooh, damn, I completely forgot about that. I was supposed to pick it up from the Outlaw Camp. ...", cid)
		npcHandler:say("I can't leave my shop here right now, please go and talk to Snake Eye about that package... I promise he won't make any trouble. ...",cid, 5000)
		npcHandler:say("Don't tell Rashid! I really don't want him to know that I forgot his order. Okay?",cid, 11000)
		Topic[cid] = 1
elseif Topic[cid] == 1 then
if msgcontains(msg, 'yes') then	
		npcHandler:say("Thank you, I appreciate it. Don't forget to mention the {package} to Snake.",cid)
		setPlayerStorageValue(cid,talkstorage, 1)
		setPlayerStorageValue(cid,100158, 4)
	end	
	Topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  