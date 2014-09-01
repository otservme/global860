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

local donestorage = 9032
local talkstorage = 9043 
     	 
if msgcontains(msg, "Mission") or msgcontains(msg, "mission") and getPlayerStorageValue(cid, donestorage) == 5 then
if getPlayerStorageValue(cid, donestorage) == 5 then
	if getPlayerStorageValue(cid, donestorage) == 5 then
		npcHandler:say("Sooo. Fa'hradin has told me about your extraordinary exploit, and I must say I am impressed. ...",cid)
		npcHandler:say("Your fragile human form belies your courage and your fighting spirit. ...",cid, 4000)
		npcHandler:say("I hardly dare to ask you because you have already done so much for us, but there is a task to be done, and I cannot think of anybody else who would be better suited to fulfill it than you. ...",cid, 10000)
		npcHandler:say("Think carefully, human, for this mission will bring you into real danger. Are you prepared to do us that final favour?",cid, 15000)
      end
return true
end
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, donestorage) == 5 then
		npcHandler:say("All right. Listen! Thanks to Rata'mari's report we now know what Malor is up to: he wants to do to me what I have done to him - he wants to imprison me in Fa'hradin's lamp! ...",cid)
		npcHandler:say("Of course, that won't happen. Now, we know his plans. ...",cid, 6000)
		npcHandler:say("But I am aiming at something different. We have learnt one important thing: At this point of time, Malor does not have the lamp yet, which means it is still where he left it. We need that lamp! If we get it back we can imprison him again! ...",cid, 10000)
		npcHandler:say("From all we know the lamp is still in the Orc King's possession! Therefore I want to ask you to enter thewell guarded halls over at Ulderek's Rock and find the lamp. ...",cid, 16000)
		npcHandler:say("Once you have acquired the lamp you must enter Mal'ouquah again. Sneak into Malor's personal chambersand exchange his sleeping lamp with Fa'hradin's lamp! ...",cid, 22000)
		npcHandler:say("If you succeed, the war could be over one night later! I and all djinn will be in your debt forever! May Daraman watch over you!",cid, 28000)
		setPlayerStorageValue(cid, donestorage, 5)
		setPlayerStorageValue(cid, 100064, 11) 
		setPlayerStorageValue(cid,100159, 5)
	end 
end 
if msgcontains(msg, "Mission") or msgcontains(msg, "mission") and getPlayerStorageValue(cid, donestorage) == 7 then
   if getPlayerStorageValue(cid, donestorage) == 7 then 
      npcHandler:say("Have you found Fa'hradin's lamp and placed it in Malor's personal chambers?",cid)
   else
	npcHandler:say("Goodluck!",cid)
	npcHandler:releaseFocus(cid)
	npcHandler:resetNpc(cid)
end
elseif msgcontains(msg, "yes") or msgcontains(msg, "Yes") and getPlayerStorageValue(cid, donestorage) == 7 then
    if getPlayerStorageValue(cid, donestorage) == 7 then 
       npcHandler:say("Daraman shall bless you and all humans! You have done us all a huge service! Soon, this awful war will be over! ...",cid)
       npcHandler:say("Know, that from now on you are considered one of us and are welcome to trade with Haroun and Nah'bob whenever you want to!",cid, 6000)
       setPlayerStorageValue(cid, donestorage, 8)
       setPlayerStorageValue(cid, 100061, 1)
       setPlayerStorageValue(cid, 100064, 14) 
	setPlayerStorageValue(cid,100159, 6)
	AddStageExp(cid,100000)
    end
    end
    return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  
npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")