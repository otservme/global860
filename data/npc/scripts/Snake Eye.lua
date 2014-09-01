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

local rstorage = 100007
local willardstorage = 100008

if msgcontains(msg, 'package for Rashid') or msgcontains(msg, 'package') and getPlayerStorageValue(cid, willardstorage) == 1 and getPlayerStorageValue(cid, rstorage) == 3 then
		npcHandler:say("So you're the delivery boy? Go ahead, but I warn you, it's quite heavy. You can take it from the box over there.", cid)
		setPlayerStorageValue(cid,willardstorage, 2)
        end
return TRUE
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bread'}, 2689, 4, 1,'bread') 
shopModule:addBuyableItem({'fish'}, 2667, 5, 1,'fish') 
shopModule:addBuyableItem({'mug of beer'}, 2012, 5, 3, 'mug of beer')

shopModule:addBuyableItem({'meat'}, 2666, 6, 1,'meat')

npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)