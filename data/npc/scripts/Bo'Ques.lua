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

local talkstor = 9033
local bookstor = 9035
local donestorage = 9032 
     	 
if msgcontains(msg, "Mission") or msgcontains(msg, "mission") then
if getPlayerStorageValue(cid, donestorage) == 1 then
	if getPlayerStorageValue(cid, donestorage) == 1 then
		npcHandler:say("My collection of recipes is almost complete. There are only but a few that are missing. ...",cid)
		npcHandler:say("Hmmm... now that we talk about it. There is something you could help me with. Are you interested?",cid, 4000)
		setPlayerStorageValue(cid, talkstor, 1)
		setPlayerStorageValue(cid, bookstor, 1)
	else
	    npcHandler:say("You have no rights to talk with me human!", cid) 
        end
     else 
        npcHandler:say("Thanks for the cookbook.", cid) 
end
elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, talkstor) == 1 then	
	if getPlayerStorageValue(cid, donestorage) == 1 then
		npcHandler:say("Fine! Even though I know so many recipes, I'm looking for the description of some dwarven meals. ...",cid)
		npcHandler:say("So, if you could bring me a {cookbook} of the dwarven kitchen I will reward you well.",cid, 4500)
		setPlayerStorageValue(cid, 100064, 3)
	end 
	elseif msgcontains(msg, 'cookbook') then	
	if getPlayerStorageValue(cid, donestorage) == 1 then
		npcHandler:say("Do you have the cookbook of the dwarven kitchen with you? Can I have it?", cid)
		setPlayerStorageValue(cid, talkstor, 2)
	end 
	elseif msgcontains(msg, 'yes') and getPlayerStorageValue(cid, talkstor) == 2 then	
	if getPlayerStorageValue(cid, donestorage) == 1 and doPlayerRemoveItem(cid,2347,1) then
		npcHandler:say("The book! You have it! Let me see! <browses the book> ...",cid)
		npcHandler:say("Dragon Egg Omelette, Dwarven beer sauce... it's all there. This is great! Here is your well-deserved reward. ...",cid, 4000)
		npcHandler:say("Incidentally, I have talked to Fa'hradin about you during dinner. I think he might have some work for you. Why don't you talk to him about it?",cid, 10000)
		setPlayerStorageValue(cid, talkstor, 3)
		setPlayerStorageValue(cid, donestorage, 2)
		doPlayerAddItem(cid,2146,3)
		setPlayerStorageValue(cid, 100064, 5)
		setPlayerStorageValue(cid,100159, 3)
	else
	    npcHandler:say("I dont see any cookbook.", cid)
	end
	end  
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye. I am sure you will come back for more. They all do.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")