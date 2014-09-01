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

local onecbook = 9034
if msgcontains(msg, "cookbook") then
if getPlayerStorageValue(cid, onecbook) == -1 then
		npcHandler:say("Would you like to buy a cookbook for 150 gold?", cid)
	else                                            
	    npcHandler:say("I just selling one cookbook to each person.", cid) 
	    end
elseif msgcontains(msg, "yes") and doPlayerRemoveMoney(cid,150) then
	if getPlayerStorageValue(cid, 100064) == -1 then
		setPlayerStorageValue(cid, 100064, 4)
	end
        	npcHandler:say("Here you go.", cid)
		setPlayerStorageValue(cid, onecbook, 1)
		doPlayerAddItem(cid,2347,1)
     else
        npcHandler:say("The cookbook costs 150 gold.", cid) 
	    end
	    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  