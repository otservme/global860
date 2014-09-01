local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
        
function greetCallback(cid)
	Topic[cid] = 0
	return true
end  

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if (msgcontains(msg, "hi") or msgcontains(msg, "Hello")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, 100016) == 1 and getPlayerStorageValue(cid, 100044) == -1 then
        npcHandler:say("Murderer! But .. I give in, you won! ...", cid)
        npcHandler:say("Dictate me your conditions but please, I beg you, spare my life. What do you want?",cid, 2000)
		npcHandler:addFocus(cid)
		Topic[cid] = 1
	end
	if (msgcontains(msg, "hi") or msgcontains(msg, "Hello")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, 100015) == 1 then
        npcHandler:say("Wh .. What? How did you get here? Where are all the guards? You .. you could have killed me but yet you chose to talk? What a relief! ...", cid)
        npcHandler:say("So what brings you here my friend, if I might call you like that?",cid, 4000)
		npcHandler:addFocus(cid)
		Topic[cid] = 2
	end
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, 'no') then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		selfSay("Farewell!", cid, TRUE)
		Topic[cid] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
       end
  if msgcontains(msg, "mission") and Topic[cid] == 1 and getPlayerStorageValue(cid, 100016) == 1 then
     npcHandler:say("Yes, for the sake of my life I'll accept those terms. I know when I have lost. Tell your master I will comply with his orders.",cid)
     setPlayerStorageValue(cid, 100016, 2)
     setPlayerStorageValue(cid, 100046, 1)
     setPlayerStorageValue(cid, 100086, 11)
  end
    if msgcontains(msg, "mission") and Topic[cid] == 2 and getPlayerStorageValue(cid, 100015) == 1 then
     npcHandler:say("Indeed, I can see the benefits of a mutual agreement. I will later read the details and send a letter to your superior.",cid)
     setPlayerStorageValue(cid, 100015, 2)
     setPlayerStorageValue(cid, 100086, 11)
  end
  return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 