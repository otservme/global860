local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100085
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
		npcHandler:say("Ah, well. Just this morning my new toothbrush fell into the toilet.",cid)
		Topic[cid] = 1
	end
	elseif Topic[cid] == 1 then
	if msgcontains(msg, 'authorities') then
		npcHandler:say("What do you mean? Of course they will immediately send someone with extra long and thin arms to retrieve it!",cid)
		Topic[cid] = 2
	end
	elseif Topic[cid] == 2 then
	if msgcontains(msg, 'avoided') then
		npcHandler:say("Your humour might let end you up beaten in some dark alley, you know? No, I don't think someone could have prevented that accident!",cid)
		Topic[cid] = 3
	end
	elseif Topic[cid] == 3 then
	if (msgcontains(msg, 'gods allow') or msgcontains(msg, 'gods would allow')) then
		npcHandler:say("It's not a drama!! I think there is just no god who's responsible for toothbrush safety, that's all ...", cid)
		npcHandler:say("And even IF through some miracle the stupid toothbrush had jumped out of the toilet into my hand, I honestly doubt I would ever use it again.", cid, 2000)
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