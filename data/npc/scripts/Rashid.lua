local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100007
 
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
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say("Well, you could attempt the mission to become a recognised trader, but it requires a lot of travelling. Are you willing to try?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Very good! I need talented people who are able to handle my wares with care, find good offers and the like, so I'm going to test you. ...",cid)
            		npcHandler:say("First, I'd like to see if you can dig up rare wares. Something like a ... mastermind shield! ...",cid, 5500)
            		npcHandler:say("Haha, just kidding, fooled you there, didn't I? Always control your nerves, that's quite important during bargaining. ...",cid, 11000)
            		npcHandler:say("Okay, all I want from you is one of these rare deer trophies. I have a customer here in Svargrond who ordered one, so I'd like you to deliver it tome while I'm in Svargrond. ...",cid, 16000)
            		npcHandler:say("Everything clear and understood?",cid, 20000)
            		Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Fine. Then get a hold of that deer trophy and bring it to me while I'm in Svargrond. Just ask me about your {mission}.",cid)
		   setPlayerStorageValue(cid,storage, 1)
		   setPlayerStorageValue(cid,100158, 1)
		   setPlayerStorageValue(cid,100165, 1)
		   Topic[cid] = 0
        end
       	elseif Topic[cid] == 4 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Alright, that's good to hear. From you as my trader and deliveryman, I expect more than finding rare items. ...",cid)
           npcHandler:say("You also need to be able to transport heavy wares, weaklings won't get far here. I have ordered a special package from Edron. ...",cid, 6000)
           npcHandler:say("Pick it up from Willard and bring it back to me while I'm in Liberty Bay. Everything clear and understood?",cid, 11000)
		   Topic[cid] = 5
        end
       	elseif Topic[cid] == 5 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Fine. Then off you go, just ask Willard about the {package for Rashid}.",cid)
		   setPlayerStorageValue(cid,storage, 3)
		   setPlayerStorageValue(cid,100158, 3)
		   Topic[cid] = 0
        end
       	elseif Topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
           	npcHandler:say("Well, that's good to hear. From you as my trader and deliveryman, I expect more than carrying heavy packages. ...",cid)
           	npcHandler:say("You also need to be fast and deliver wares in time. I have ordered a very special cheese wheel made from Darashian milk. ...",cid, 6000)
           	npcHandler:say("Unfortunately, the high temperature in the desert makes it rot really fast, so it must not stay in the sun for too long. ...",cid, 12000)
           	npcHandler:say("I'm also afraid that you might not be able to use ships because of the smell of the cheese. ...",cid, 18000)
           	npcHandler:say("Please get the cheese from Miraia and bring it to me while I'm in Port Hope. Everything clear and understood?",cid, 23000)
		   Topic[cid] = 8
        end
       	elseif Topic[cid] == 8 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Okay, then please find Miraia in Darashia and ask her about the {scarab cheese}.",cid)
		   setPlayerStorageValue(cid,storage, 5)
		   setPlayerStorageValue(cid,100158, 7)
		   Topic[cid] = 0
        end
       	elseif Topic[cid] == 10 then
		if msgcontains(msg, 'yes') then
           npcHandler:say("Well, that's good to hear. From you as my trader and deliveryman, I expect more than bringing stinky cheese. ...",cid)
           npcHandler:say("I wonder if you are able to deliver goods so fragile they almost break when looked at. ...",cid, 6000)
           npcHandler:say("I have ordered a special elven vase from Briasol in Ab'Dendriel. Get it from him and don't even touch it, just bring it to me while I'm in Ankrahmun. Everything clear and understood?",cid, 12000)
		   Topic[cid] = 11
        end
       	elseif Topic[cid] == 11 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Okay, then please find Briasol in Ab'Dendriel and ask for a {fine vase}.",cid)
		   setPlayerStorageValue(cid,storage, 7)
		   setPlayerStorageValue(cid,100158, 10)
		   Topic[cid] = 0
        end
       	elseif Topic[cid] == 13 then
		if msgcontains(msg, 'yes') then
           npcHandler:say("Fine! There's one more skill that I need to test and which is cruicial for a successful trader. ...",cid)
           npcHandler:say("Of course you must be able to haggle, else you won't survive long in this business. To make things as hard as possible for you, I have the perfect trade partner for you. ...",cid, 6000)
           npcHandler:say("Dwarves are said to be the most stubborn of all traders. Travel to Kazordoon and try to get the smith Uzgod to sell a crimson sword to you. ...",cid, 12000)
           npcHandler:say("Of course, it has to be cheap. Don't come back with anything more expensive than 400 gold. ...",cid, 18000)
           npcHandler:say("And the quality must not suffer, of course! Everything clear and understood?",cid, 23000)
		   Topic[cid] = 14
        end
    	elseif Topic[cid] == 14 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Okay, I'm curious how you will do with Uzgod. Good luck!",cid)
		   setPlayerStorageValue(cid,storage, 9)
			setPlayerStorageValue(cid,100158, 13)
		   Topic[cid] = 0
        end
       	elseif Topic[cid] == 16 then
		if msgcontains(msg, 'yes') then
          npcHandler:say("My friend, it seems you have already learnt a lot about the art of trading. I think you are more than worthy to become a recognised trader. ...",cid)
          npcHandler:say("There is just one little favour that I would ask from you... something personal, actually, forgive my boldness. ...",cid, 6000)
          npcHandler:say("I have always dreamed to have a small pet, one that I could take with me and which wouldn't cause problems. ...",cid, 12000)
          npcHandler:say("Could you - just maybe - bring me a small goldfish in a bowl? I know that you would be able to get one, wouldn't you?",cid, 18000)
		   Topic[cid] = 17
        end
       	elseif Topic[cid] == 17 then
		if msgcontains(msg, 'yes') then
		   npcHandler:say("Thanks so much! I'll be waiting eagerly for your return then.",cid)
		   setPlayerStorageValue(cid,storage, 11)
			setPlayerStorageValue(cid,100158, 16)
		   Topic[cid] = 0
        end
        Topic[cid] = 0
	--//////////////////////////////////////////Missions/////////////////////////////////////////////--
	elseif msgcontains(msg, 'mission') then
		local v = getPlayerStorageValue(cid, storage)
		if v == 1 then -- Start Mission 1 - The interrogation
		    npcHandler:say("Have you managed to obtain a rare deer trophy for my customer?",cid)
		    Topic[cid] = 3
  		elseif v == 2 then
	       npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)  
	       Topic[cid] = 4
  		elseif v == 3 then
	       npcHandler:say("Did you bring me the package?",cid) 
	       Topic[cid] = 6
  		elseif v == 4 then
	       npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)  
	       Topic[cid] = 7 
  		elseif v == 5 then
	       npcHandler:say("Have you brought the cheese?",cid)  
	       Topic[cid] = 9
  		elseif v == 6 then
	       npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)  
	       Topic[cid] = 10
  		elseif v == 7 then
	       npcHandler:say("Have you brought the vase?",cid)  
	       Topic[cid] = 12
  		elseif v == 8 then
	       npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)  
	       Topic[cid] = 13
  		elseif v == 9 then
	       npcHandler:say("Have you brought a cheap but good crimson sword?",cid)  
	       Topic[cid] = 15
  		elseif v == 10 then
	       npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)  
	       Topic[cid] = 16
  		elseif v == 11 then
	       npcHandler:say("Have you brought me a gold fish??",cid)
	       Topic[cid] = 18
  		elseif v == 12 then
	       npcHandler:say("Ah, right. <ahem> I hereby declare you - one of my recognised traders! Feel free to offer me your wares!", cid)
	       setPlayerStorageValue(cid, storage, 13)
		setPlayerStorageValue(cid,100158, 18)
		setPlayerStorageValue(cid,100165, 8)
		AddStageExp(cid,50000)
  		elseif v == 13 then
	       npcHandler:say("I have no more missions left. Im happy to {trade} with you.", cid)
	       setPlayerStorageValue(cid, storage, 13)
        end  
    --////////////////////////////////Answers///////////////////////////////////////////////--
	elseif Topic[cid] == 3 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if doPlayerTakeItem(cid, 7397, 1) then
			    npcHandler:say("Well done! I'll take that from you. <snags it>. Say {mission} to continue.",cid)
				setPlayerStorageValue(cid, storage, 2)
				setPlayerStorageValue(cid,100158, 2)
				setPlayerStorageValue(cid,100165, 2)
			else
				npcHandler:say("Come back when you the deer trophy.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 6 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') and getPlayerStorageValue(cid, 100008) >= 2 then
        if doPlayerRemoveItem(cid, 7503, 1) then
			    npcHandler:say("Great. Just place it over there - yes, thanks, that's it. Say {mission} to continue.",cid)
				setPlayerStorageValue(cid, storage, 4)
				setPlayerStorageValue(cid, 100008, 4)
				setPlayerStorageValue(cid,100158, 6)
				setPlayerStorageValue(cid,100165, 3)
			else
				npcHandler:say("Come back when you have the package.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
  	elseif Topic[cid] == 9 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
        	if doPlayerRemoveItem(cid, 8368, 1) then
			    	npcHandler:say("Mmmhh, the lovely odeur of scarab cheese! I really can't understand why most people can't stand it. Thanks, well done! Say {mission} to continue.",cid)
				setPlayerStorageValue(cid, storage, 6)
				setPlayerStorageValue(cid,100158, 9)
				setPlayerStorageValue(cid,100165, 4)
			else
				npcHandler:say("Come back when you have the cheese.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
  	elseif Topic[cid] == 12 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
        if doPlayerRemoveItem(cid, 7582, 1) then
			    npcHandler:say("I'm surprised that you managed to bring this vase without a single crack. That was what I needed to know, thank you. Thanks, well done! Say {mission} to continue.",cid)
				setPlayerStorageValue(cid, storage, 8)
				setPlayerStorageValue(cid, 100009, 1)
				setPlayerStorageValue(cid,100158, 12)
				setPlayerStorageValue(cid,100165, 5)
			else
				npcHandler:say("Come back when you have the vase.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
  	elseif Topic[cid] == 15 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') and getPlayerStorageValue(cid, 100010) == 1 then
        if doPlayerRemoveItem(cid, 8209, 1) then
			    npcHandler:say("Ha! You are clever indeed, well done! I'll take this from you. I think we two might get into business after all. Say {mission} to continue.",cid)
				setPlayerStorageValue(cid, storage, 10)
				setPlayerStorageValue(cid,100158, 15)
				setPlayerStorageValue(cid,100165, 6)
			else
				npcHandler:say("Come back when you have the sword.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
  	elseif Topic[cid] == 18 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
        if doPlayerRemoveItem(cid, 5929, 1) then
			    npcHandler:say("Thank you!! Ah, this makes my day! Say {mission} to continue.",cid)
				setPlayerStorageValue(cid, storage, 12)
				setPlayerStorageValue(cid,100158, 17)
				setPlayerStorageValue(cid,100165, 7)
			else
				npcHandler:say("Come back when you have the fish.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        	end
		Topic[cid] = 0
		end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())