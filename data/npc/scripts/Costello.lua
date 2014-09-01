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

local storage = 2098

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if msgcontains(msg, 'Fugio') and getPlayerStorageValue(cid,storage) == -1 then
     npcHandler:say("To be honest, I fear the omen in my dreams may be true. Perhaps Fugio is unable to see the danger down there. Perhaps ... you are willing to investigate this matter?", cid)
     Topic[cid] = 1
elseif msgcontains(msg, 'yes') and Topic[cid] == 1 then
       npcHandler:say("Thank you very much! From now on you may open the warded doors to the catacombs.",cid) 
       setPlayerStorageValue(cid, storage, 1)
elseif msgcontains(msg, 'no') and Topic[cid] == 1 then
       npcHandler:say("Well, i really needed your help. But its your own choice.",cid) 
end
return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! Feel free to tell me what has brought you here.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farwell, |PLAYERNAME|!")
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())