local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100054
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm general Baa'leal. What do you want in Mal'ouquah?"})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm general Baa'leal. What do you want in Mal'ouquah?"})
keywordHandler:addKeyword({"baa'leal" }, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is GENERAL Baa'leal for you, human."})
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
local p = getCreatureName(cid) 
   local v = getPlayerStorageValue(cid, storage)
   if npcHandler:isFocused(cid) then
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("Dont disturb me then.",cid)
		Topic[cid] = 1
		end
	if msgcontains(msg, 'hail malor') then
	    npcHandler:say("Hail to our great leader!",cid)
    end
	end
	if (msgcontains(msg, "DJANNI'HAH")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, storage) == -1 then
    if getPlayerStorageValue(cid, 9030) == 1 and getPlayerStorageValue(cid, 100053) == 1 then
		npcHandler:say("You know the code human! Very well then... What do you want, "..p.."?", cid)
        npcHandler:addFocus(cid)
		Topic[cid] = 1
    end 
	elseif Topic[cid] == 1 and getPlayerStorageValue(cid, 100056) == -1 then
		if msgcontains(msg, 'mission') then
			npcHandler:say("Each mission and operation is a crucial step towards our victory! ...",cid)
			npcHandler:say("Now that we speak of it ...",cid, 1500)
			npcHandler:say("Since you are no djinn, there is something you could help us with. Are you interested, human?",cid, 2000)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 and getPlayerStorageValue(cid, 100056) == -1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Well ... All right. You may only be a human, but you do seem to have the right spirit. ...",cid)
			npcHandler:say("Listen! Since our base of operations is set in this isolated spot we depend on supplies from outside. These supplies are crucial for us to win the war. ...",cid, 1000)
			npcHandler:say("Unfortunately, it has happened that some of our supplies have disappeared on their way to this fortress. At first we thought it was the Marid, but intelligence reports suggest a different explanation. ...",cid, 3000)
			npcHandler:say("We now believe that a human was behind the theft! ...",cid, 5500)
			npcHandler:say("His identity is still unknown but we have been told that the thief fled to the human settlement called Carlin. I want you to find him and report back to me. Nobody messes with the Efreet and lives to tell the tale! ...",cid, 6500)
			npcHandler:say("Now go! Travel to the northern city Carlin! Keep your eyes open and look around for something that might give you a clue!",cid, 10000)
			setPlayerStorageValue(cid, storage, 1)
			setPlayerStorageValue(cid, 100062, 3)
			Topic[cid] = 0
		    end
		    Topic[cid] = 0
    end
   	if (msgcontains(msg, "DJANNI'HAH")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, storage) == 1 then
    if getPlayerStorageValue(cid, 100055) == 1 and getPlayerStorageValue(cid, 100056) == 1 then
		npcHandler:say("You are still alive, "..p.."? Well, what do you want?", cid)
        npcHandler:addFocus(cid)
		Topic[cid] = 3
    end 
  	elseif Topic[cid] == 3 and getPlayerStorageValue(cid, 100056) == 1 then
		if msgcontains(msg, 'mission') or msgcontains(msg, 'report') then
			npcHandler:say("Did you find the thief of our {supplies}?",cid)
			Topic[cid] = 4
        end
  	elseif Topic[cid] == 4 and getPlayerStorageValue(cid, 100056) == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Finally! What is his name then?",cid)
			Topic[cid] = 5
        end
  	elseif Topic[cid] == 5 and getPlayerStorageValue(cid, 100056) == 1 then
		if msgcontains(msg, 'partos') then
			npcHandler:say("You found the thief! Excellent work, soldier! You are doing well - for a human, that is. Here - take this as a reward. ...",cid)
			npcHandler:say("Since you have proven to be a capable soldier, we have another mission for you. ...",cid, 1000)
			npcHandler:say("If you are interested go to {Alesar} and ask him about it.",cid, 1500)
			setPlayerStorageValue(cid, storage, 2)
			doPlayerAddItem(cid,2152,6)
			setPlayerStorageValue(cid, 100062, 5)
			setPlayerStorageValue(cid,100159, 2)
			Topic[cid] = 6
        end
        Topic[cid] = 0
		end
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("Stand down, soldier!",cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		Topic[cid] = 0
	    end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)