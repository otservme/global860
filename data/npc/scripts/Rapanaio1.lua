local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100000
local newpos = {x=32667, y=31452, z=7}
 
-- Storages:
-- 1 = Joining Inquisition
-- 2 = Start Mission 1
-- 3 = Finish Mission 1
-- 4 = Start Mission 2
-- 5 = Finish Mission 2
-- 6 = Start Mission 3
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then return false end
		if msgcontains(msg, 'no') and Topic[cid] >= 1 then
			npcHandler:say("Not then.",cid)
			Topic[cid] = 0
		end 
   local v = getPlayerStorageValue(cid, storage)
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == 13 then
		npcHandler:say("Hello, my friend, what took you so long? Some sightseeing in my cavern, perhaps? You did not even notice me when I passed you in the cavern earlier. Tsk, you really should be more alert if you value your life. ...",cid)
		npcHandler:say("This here is my secret. An underwater boat! Evil will not even see us coming! I hope you are prepared for a big battle on that isle! If not, you had better go and get some additional resources and then return. So, do you feel ready for our trip?",cid, 4000)
		Topic[cid] = 1  
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("You are aware that this could mean your death? I mean the evil is probably overpowering and .. and I will not be able to help you. I will have to stay with the boat to ensure the fight goes on even if you die. So, do you still think it is a good idea?",cid)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Now seriously, we .. I mean, you don't have to do this! I would not blame you at all. You probably have plans for your future which don't contain being chained up in some madman's dungeon for the rest of your life, being cruelly tortured. ...",cid)
			npcHandler:say("Do you really want to take the risk upon yourself?",cid, 4500)
			Topic[cid] = 3
		end
	elseif Topic[cid] == 3 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Are you absolutely sure?",cid)
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Honestly?",cid)
			Topic[cid] = 5
		end
	elseif Topic[cid] == 5 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("This is your last chance - do you really want to do this?",cid)
			Topic[cid] = 6
		end
	elseif Topic[cid] == 6 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Well .. I guess then it is time for us to depart, right?",cid)
			Topic[cid] = 7
		end
	elseif Topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("I really hope I won't regret what you are doing here. Uhm, I mean I hope that we will not regret what we are doing, of course. We had better talk about your future mission when we arrive. So .. shall we really depart?",cid)
			Topic[cid] = 8
		end
		if msgcontains(msg, 'yes') then
			npcHandler:say("So be it!",cid)
			doTeleportThing(cid,newpos)
			doSendMagicEffect(newpos,10)
			setPlayerStorageValue(cid, storage, 14)
			setPlayerStorageValue(cid,100063, 21)
		    end
		end
		if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) >= 15 then
			npcHandler:say("I don't have any new mission for you, but I can take you to the {Isle of Evil}.",cid)
			Topic[cid] = 9
	elseif Topic[cid] == 9 then
		if msgcontains(msg, 'isle of evil') then
			npcHandler:say("Do you want to go to {Isle of Evil}?",cid)
			Topic[cid] = 10
		end
	elseif Topic[cid] == 10 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("So bet it!",cid)
			doTeleportThing(cid,newpos)
			doSendMagicEffect(newpos,10)
		end
		Topic[cid] = 0
		end
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Psht! Not that loud! Evil lurks everywhere.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care and watch your back, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())