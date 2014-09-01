local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100003
 
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
    local v = getPlayerStorageValue(cid, storage)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end
	if msgcontains(msg, 'machine') and getPlayerStorageValue(cid, storage) == -1 and getPlayerStorageValue(cid, 100000) == 9 then
		npcHandler:say("So Rapanaio thinks I'd just hand out one of my greatest creations for a few coins of gold? Wrong! It works like this: you help me, then I'll help you. ...", cid)
		npcHandler:say("At the moment I'm tied up with an ongoing experiment and I could do with some help in a more mundane task. Are you in?",cid, 4000)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Fine. As for the problem: you might know that we dwarfs sometimes use tamed rotworms to help dig our tunnels. Actually the worms we use are specially bred for that purpose. ...", cid)
			npcHandler:say("Though they are tame and docile they are still rotworms of course with their natural instincts. Recently some carrion worms dug their way into our drilling worm kennel. ...",cid, 4000)
			npcHandler:say("Though they pose no actual danger they cause our tame rotworms to panic and become agitated. ...",cid, 8000)
			npcHandler:say("If we leave this unchecked some of our worms might go feral and escape into the depths forever. Long story short, it's up to you to get rid of the carrion worms. Sadly, they are too cowardly to stay for a good fight. ...",cid, 11000)
			npcHandler:say("Instead I will lend you this hammer - the legendary'worm punisher'. Now hitting them with that hammer might teach them a lesson but it won't keep them away for long. ...",cid, 15000)
			npcHandler:say("Therefore you'll have to heat up the hammer on one of the ovens over there and hit a carrion worm while the hammer is still hot. That will make the silly beasts think they have hit a pocket of lava and they will retreat for good. ...",cid, 19000)
			npcHandler:say("I think if you scare off six of those beasts the rest will follow them. But DON'T hit any of the ordinary worms! ...",cid, 23000)
			npcHandler:say("If you scare them even more you will have to pay me 500 gold in compensation before I'll allow you to continue. ...",cid, 26000)
			npcHandler:say("As soon as you have scared away six of the carrion worms talk to me about the worms and I'll give you that machine. Do we have a deal?",cid, 29500)
			Topic[cid] = 2  
		end
   elseif msgcontains(msg, 'no') then
            npcHandler:say("Dont disturb me then!",cid)
            Topic[cid] = 0
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Good. Here is the 'Worm punisher'. Remember DO NOT hurt the drilling worms! If you do it will cost you 500 gold!",cid)
			doPlayerAddItem(cid,10152,1)
			setPlayerStorageValue(cid, storage, 0) 
			setPlayerStorageValue(cid,100063, 11)
		end 
	elseif msgcontains(msg, 'mission') and v >= 0 then
        if v == 8 then
           npcHandler:say("What kind of a silly question is that? But fine: a machine is something that can do everything you can but twice as efficiently. And no, despite these qualities it doesn't have a tail, fur and above all, it doesn't eat bananas!",cid) 
           return true
        end  
		local v = getPlayerStorageValue(cid, storage)
		if v == 6 and getPlayerStorageValue(cid, 100002) == -1 then
		    npcHandler:say("Finally! I could have shaved off and grown a new beard in the time it has taken you to complate that task. However, here is your machine. Now leave me alone, I have experiments to carry out.",cid) 
		    doPlayerAddItem(cid,10307,1)
		    setPlayerStorageValue(cid,storage, 8) 
		    setPlayerStorageValue(cid, 100006, 1)
		    setPlayerStorageValue(cid,100063, 13)
   	    elseif v <= 6 and getPlayerStorageValue(cid, 100002) == -1 then
	       npcHandler:say("You have lost your hammer? You want to buy new one?",cid)
	       Topic[cid] = 4 
   	    elseif getPlayerStorageValue(cid, 100002) == 1 then
	       npcHandler:say("I see you failed my instructions, for 500 gold I will give you a new hammer and let you try again. Do we have a deal?",cid)
	       Topic[cid] = 3 
        end
  elseif Topic[cid] == 3 then
        if msgcontains(msg, 'yes') then
        if doPlayerRemoveMoney(cid,500) then
            npcHandler:say("Good. Here is the 'Worm punisher'. Remember DO NOT hurt the drilling worms! If you do it will cost you 500 gold!",cid)
            setPlayerStorageValue(cid, 100002, -1)
            setPlayerStorageValue(cid, storage, 0)
            doPlayerAddItem(cid,10152,1)
        else
            npcHandler:say("You don't have enough gold.",cid)
            end
        end
  elseif Topic[cid] == 4 then
        if msgcontains(msg, 'yes') then
        if doPlayerRemoveMoney(cid,500) then
            npcHandler:say("Good. Here is the 'Worm punisher'. Remember DO NOT hurt the drilling worms! If you do it will cost you 500 gold!",cid)
            setPlayerStorageValue(cid, 100002, -1)
            setPlayerStorageValue(cid, storage, 0)
            doPlayerAddItem(cid,10152,1)
        else
            npcHandler:say("You don't have enough gold.",cid)
            end
        end
		Topic[cid] = 0
		end
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Hi there.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, bye.")
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())