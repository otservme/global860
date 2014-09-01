local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100082
local finishstorage = 13890 

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

local fire = createConditionObject(CONDITION_FIRE)
addDamageCondition(fire, 4, 6000, -20)
addDamageCondition(fire, 4, 6000, -10)
 
function creatureSayCallback(cid, type, msg)
	local v = getPlayerStorageValue(cid, storage)
	if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
		return false
	end
	
	if (msgcontains(msg, 'asshole') or msgcontains(msg, 'whore') or msgcontains(msg, 'fuck') or msgcontains(msg, 'bitch')) then
		selfSay("Take this!")
		doCreatureSay(cid, "Ouch!", TALKTYPE_ORANGE_1)
		doTargetCombatCondition(0, cid, fire, CONST_ME_NONE)
		doSendMagicEffect(getCreaturePosition(getNpcCid()),13)
		return true
	end	
	
   	if getPlayerStorageValue(cid, storage) == 1 and getPlayerStorageValue(cid,90000) == 2 then
      		return npcHandler:say("I don't feel like chatting.", cid)
   	end
  
  	if msgcontains(msg, 'trouble') then   
  	if getPlayerStorageValue(cid, storage) == -1 and getPlayerStorageValue(cid,90000) == 2 then
		npcHandler:say("You adventurers become more and more of a pest.",cid)
		Topic[cid] = 1
	end
	elseif Topic[cid] == 1 then
	if (msgcontains(msg, 'authorities')) then
		npcHandler:say("They should throw you all into jail instead of giving you all those quests and rewards an honest watchman can only dream about.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, finishstorage, getPlayerStorageValue(cid, finishstorage) + 1)
		setPlayerStorageValue(cid,storage, 1)
		Topic[cid] = 0
	if getPlayerStorageValue(cid, finishstorage) == 4 then
		setPlayerStorageValue(cid,100078,3)
    	end
	end   
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())