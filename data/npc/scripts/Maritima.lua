  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        
function greetCallback(cid)
	Topic[cid] = 0
	return true
end        

local storage = 100021

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if msgcontains(msg, 'quara') and getPlayerStorageValue(cid, storage) == 1 then
     npcHandler:say("Considering that they are quara, they are rather peaceful as long no one enters their territory. ...", cid)
     npcHandler:say("However, recently the quara got mad because their area is flooded with toxic sewage from the city. If you could inform someone about it, they might stop the sewage and the quara could return to their own business.",cid, 4000)
     setPlayerStorageValue(cid, storage, 3)
     setPlayerStorageValue(cid,100086, 22)
  end
return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_GREET, "Oh hello, visitor from the dry land.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  