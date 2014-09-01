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

local talkstorage = 9914
local talkstoragea = 9915
local endstorage = 9901

if msgcontains(msg, 'wooden stake') and getPlayerStorageValue(cid, talkstoragea) == -1 then
	if  getPlayerStorageValue(cid, endstorage) == 10 or getPlayerStorageValue(cid, endstorage) == 11 then
		npcHandler:say("Ten prayers for a blessed stake? Don't tell me they made you travel whole Tibia for it! Listen, child, if you bring me a wooden stake, I'll bless it for you. <chuckles>", cid)
		setPlayerStorageValue(cid, talkstoragea, 1)
end
elseif msgcontains(msg, 'wooden stake') then	
	if getPlayerStorageValue(cid, talkstoragea) == 1 then
		npcHandler:say("Would you like to receive a spiritual prayer to bless your stake?", cid)
		setPlayerStorageValue(cid, talkstorage, 1)
	end
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, talkstorage) == 1 and doPlayerRemoveItem(cid, 5941, 1) then
		npcHandler:say("So receive my prayer: 'Your mind shall be a vessel for joy, light and wisdom' - uh, wow, something happened. Well, I guess that's it, but next time if you need some mumbo jumbo rather go to Chondur.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, endstorage, 11)
		setPlayerStorageValue(cid, talkstoragea,-1)
		setPlayerStorageValue(cid, talkstorage,-1)
		doPlayerAddItem(cid,5942,1)
	else
		npcHandler:say("There is no wooden stake with you.", cid)
		end	
	end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  