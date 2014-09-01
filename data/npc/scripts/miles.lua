local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talk = {}
local storage = 100084
local finishstorage = 13890 
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 							npcHandler:onThink() end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid) end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid) end
 
function creatureGreetCallback(cid)
	talk[cid] = 0
	return true
end

local fire = createConditionObject(CONDITION_FIRE)
addDamageCondition(fire, 4, 6000, -20)
addDamageCondition(fire, 4, 6000, -10)
 
function messageDefaultCallback(cid, type, msg)
	local v = getPlayerStorageValue(cid, storage)
	if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and talk[cid] >= 1 then
		npcHandler:say("Not then.",cid)
		talk[cid] = 0
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

	if talk[cid] == 3 then
	if msg:lower() == "trouble will arise in near future" then
		npcHandler:say("I think the gods and the government do their best to keep away harm from the citizens.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, finishstorage, getPlayerStorageValue(cid, finishstorage) + 1)
		setPlayerStorageValue(cid,storage, 1)
		talk[cid] = 0
	if getPlayerStorageValue(cid, finishstorage) == 4 then
		setPlayerStorageValue(cid,100078,3)
    		end
	end
	elseif msgcontains(msg, 'trouble')  then
		npcHandler:say("I'm fine. There's no trouble at all.",cid)
		talk[cid] = 1
	elseif talk[cid] == 1 then
	if msgcontains(msg, 'foresight of authorities') then
		npcHandler:say("Well, of course. We live in safety and peace.",cid)
		talk[cid] = 2
	end
	elseif talk[cid] == 2 then
	if msgcontains(msg, 'also for the gods') then
		npcHandler:say("I think the gods are looking after us and their hands shield us from evil.",cid)
		talk[cid] = 3

	end   
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, messageDefaultCallback)  
npcHandler:setCallback(CALLBACK_GREET, creatureGreetCallback)
npcHandler:addModule(FocusModule:new())