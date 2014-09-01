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

if msgcontains(msg, 'report') and getPlayerStorageValue(cid,9987) == 1 and getPlayerStorageValue(cid,9994) == -1 then 
npcHandler:say("A report? What do they think is happening here? <gives an angry and bitter report>.",cid) 
setPlayerStorageValue(cid,9994, 1)
if (getPlayerStorageValue(cid,9988) == 1 and getPlayerStorageValue(cid,9989) == 1 and getPlayerStorageValue(cid,9990) == 1 and getPlayerStorageValue(cid,9991) == 1 and getPlayerStorageValue(cid,9992) == 1 and getPlayerStorageValue(cid,9993) == 1) then
	setPlayerStorageValue(cid,100086, 5)
end
end
return true
end 
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'factory quarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want pass on to Factory Quarter?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32859, y=31302, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
			
			        local travelNode = keywordHandler:addKeyword({'trade quarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want pass on to Trade Quarter?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32854, y=31302, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
        
       

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 