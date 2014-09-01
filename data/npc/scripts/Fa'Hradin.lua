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
local donestorage = 9032
local talkstorage = 9039
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	 
if msgcontains(msg, "Mission") or msgcontains(msg, "mission") and getPlayerStorageValue(cid, donestorage) == 2 then 
if getPlayerStorageValue(cid, donestorage) == 2 then 
		npcHandler:say("I have heard some good things about you from Bo'ques. But I don't know. ...",cid)
		npcHandler:say("Well, all right. I do have a job for you. ...",cid, 4000)
		npcHandler:say(" In order to stay informed about our enemy's doings, we have managed to plant a spy in Mal'ouquah. ...",cid, 9000)
		npcHandler:say("He has kept the Efreet and Malor under surveillance for quite some time. ...",cid, 15000)
		npcHandler:say("But unfortunately, I have lost contact with him months ago. ...",cid, 19000)
		npcHandler:say("I do not fear for his safety because his cover is foolproof, but I cannot contact him either. This is where you come in. ...",cid, 25000)
		npcHandler:say("I need you to infiltrate Mal'ouqhah, contact our man there and get his latest spyreport. The password is {PIEDPIPER}. Remember it well! ...",cid, 31000)
		npcHandler:say("I do not have to add that this is a dangerous mission, do I? If you are discovered expect to be attacked! So goodluck, human!",cid, 37500)
		setPlayerStorageValue(cid, donestorage, 3) 
		setPlayerStorageValue(cid, 100064, 7)  
		return true  
        end
end
if msgcontains(msg, "Mission") or msgcontains(msg, "mission") and getPlayerStorageValue(cid, donestorage) == 4 then
if getPlayerStorageValue(cid, donestorage) == 4 or getPlayerStorageValue(cid, donestorage) == 3 then
		npcHandler:say("Did you already retrieve the spy report?",cid)
		setPlayerStorageValue(cid, talkstorage, 1)
	end 
elseif msgcontains(msg, "yes") or msgcontains(msg, "Yes") then
if getPlayerStorageValue(cid, donestorage) == 4 and getPlayerStorageValue(cid, talkstorage) == 1 and doPlayerRemoveItem(cid,2345,1) then
		npcHandler:say("You really have made it? You have the report? How come you did not get slaughtered? I must say I'm impressed. Your race will never cease to surprise me. ...",cid)
		npcHandler:say("Well, let's see. ...",cid, 4000)
		npcHandler:say("I think I need to talk to Gabel about this. I am sure he will know what to do. Perhaps you should have aword with him, too.",cid, 8000)
		setPlayerStorageValue(cid, donestorage, 5)
		setPlayerStorageValue(cid, 100064, 9) 
		setPlayerStorageValue(cid,100159, 4)
  else
        	npcHandler:say("Come back when you have the spy report!",cid)
        end 
        end 
        return true  
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, human.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")
npcHandler:addModule(FocusModule:new())  