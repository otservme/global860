local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100000
local backpos = {x=32700, y=31990, z=15}
 
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
    if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == 14 then
		npcHandler:say("Now that we have arrived you should waste no time and fight your way to the lair of evil and destroy its master before it's too late!",cid)
	end   
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == 15 then
			npcHandler:say("You made it?! Uhm, I mean of course you did! We did it! We have slain the master of all evil! The world will be a happier place from now on, thanks to our efforts. ...",cid)
			npcHandler:say("Concerning this membership card you have found, I think you should take it to King Tibianus, perhaps you will get a reward! Well, nothing stopping us going {back}, now, eh?",cid, 4000)
			setPlayerStorageValue(cid,100063, 23)
			setPlayerStorageValue(cid,100162, 8)
			Topic[cid] = 11 
 	elseif Topic[cid] == 11 then
		if msgcontains(msg, 'back') and Topic[cid] == 13 then
			npcHandler:say("Time to leave this unfriendly place, eh? So are you ready to depart?",cid)
			Topic[cid] = 12
		end 
 	elseif Topic[cid] == 12 then
	if msgcontains(msg, 'yes') then
			npcHandler:say("I thought you were going to stay here forever. Let's go.",cid)
			doTeleportThing(cid,backpos)
			doSendMagicEffect(backpos,10)
			end
		end 
	if msgcontains(msg, 'back') then
			npcHandler:say("Time to leave this unfriendly place, eh? So are you ready to depart?",cid)
			Topic[cid] = 13
 	elseif Topic[cid] == 13 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("I thought you were going to stay here forever. Let's go.",cid)
			doTeleportThing(cid,backpos)
			doSendMagicEffect(backpos,10)
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