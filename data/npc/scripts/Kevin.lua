local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100167
local storage2 = 100168
local bonestorage = 100169
local qlog = 100171  
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

--////Ranks////--
--Storage = 100167, value >= 3 --Assistant Postman
--Storage = 100167, value >= 13 --Postman
--Storage = 100167, value >= 16 --Grand Postman
--Storage = 100167, value >= 19 --Arch Postman
--////Ranks End////--
 
function creatureSayCallback(cid, type, msg) 
    local v = getPlayerStorageValue(cid, storage)
	if not npcHandler:isFocused(cid) then
		return false
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'join')) and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say('You are not a member of our guild yet! We have high standards for our members. To rise in our guild is a difficult but rewarding task. Are you interested in joining?', cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'yes') and Topic[cid] == 1) then
		npcHandler:say("Hm, I might consider your proposal, but first you will have to prove your worth by doing some tasks for us. Are you willing to do that?",cid)
		Topic[cid] = 2 
		setPlayerStorageValue(cid,qlog,1)
	end
 	elseif (Topic[cid] == 2) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 2) then
		npcHandler:say(" Excellent! Your first task will be quite simple. But you should better write my instructions down anyways. You can read and write?",cid)
		Topic[cid] = 3
	end 
 	elseif (Topic[cid] == 3) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 3) then
		npcHandler:say("So listen, you will check certain tours our members have to take to see if there is some trouble. First travel with Captain Bluebear's ship from Thais to Carlin, understood?",cid)
		Topic[cid] = 4
	end
	elseif (Topic[cid] == 4) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 4) then
		npcHandler:say("Excellent! Once you have done that you will travel with Uzon to Edron. You will find him in the Femor Hills. Understood?",cid)
		Topic[cid] = 5
	end
	elseif (Topic[cid] == 5) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 5) then
		npcHandler:say("Fine, fine! Next, travel with Captain Seahorse to the city of Venore. Understood?",cid)
		Topic[cid] = 6
	end
	elseif (Topic[cid] == 6) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 6) then
		npcHandler:say("Good! Finally, find the technomancer Brodrosch and travel with him to the Isle of Cormaya. After this passage report back to me here. Understood?",cid)
		Topic[cid] = 7
	end
	elseif (Topic[cid] == 7) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 7) then
		npcHandler:say("Ok, remember: the Tibian mail service puts trust in you! Don't fail and report back soon. Just tell me about your {MISSION}.",cid)
		setPlayerStorageValue(cid,storage,1)
		setPlayerStorageValue(cid,qlog,2)
		Topic[cid] = 0
	end
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'report')) then
		if (v == 1) then
		if (v == 1 and getPlayerStorageValue(cid,storage2) == 4) then
			npcHandler:say("So you have finally made it! I did not think that you would have it in you ... However: are you ready for another assignment?",cid)
			setPlayerStorageValue(cid,100171,7)
			Topic[cid] = 8
		else
			npcHandler:say("Come back when you have finished your {mission}.",cid)
		end
	elseif v == 2 then
		if (getPlayerStorageValue(cid,storage2) == 6) then
		npcHandler:say("Excellent, you got it fixed! This will teach this mailbox a lesson indeed! Are you interested in another assignment?",cid)
		Topic[cid] = 9
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 3 then
	if (getPlayerStorageValue(cid,storage2) == 8) then
		npcHandler:say("You truly got him? Quite impressive. You are a very promising candidate! I think I have another mission for you. Are you interested?",cid)
		setPlayerStorageValue(cid,100171,13)
		Topic[cid] = 11
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 4 then
	if (getPlayerStorageValue(cid,storage2) == 9) then
	    	npcHandler:say("Do you bring 20 bones for our officers' safety fund?", cid)
	    	Topic[cid] = 12
	else
		npcHandler:say("Come back when you have collected 20 {bones} with you.",cid)
	end
	elseif v == 5 then
	if (getPlayerStorageValue(cid,storage) == 5) then
		npcHandler:say("You have made it! We have enough bones for the fund! You remind me of myself when I was young! Interested in another {mission}?",cid)
		Topic[cid] = 14
	end
	elseif v == 6 then
	if (getPlayerStorageValue(cid,storage2) == 12) then
		npcHandler:say("Splendid, I knew we could trust you. I would like to ask for your help in another matter. Are you interested?",cid)
		setPlayerStorageValue(cid,storage,7)
		setPlayerStorageValue(cid,storage2,13)
		setPlayerStorageValue(cid,100171,18)
		Topic[cid] = 15
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 12 then
	if (getPlayerStorageValue(cid,storage2) == 23) then
		npcHandler:say("Excellent! Another job well done! Would you accept another mission?", cid)
		setPlayerStorageValue(cid,storage,13)
		Topic[cid] = 17
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)	
	end
	elseif v == 13 then
	if (getPlayerStorageValue(cid,storage2) == 23) then
		npcHandler:say("Good, so listen. Hugo Chief informed me that he needs the measurements of our postofficers. Go and bring me the measurements of {Ben}, {Lokur}, {Dove}, {Liane}, {Chrystal} and {Olrik}.", cid)
		setPlayerStorageValue(cid,storage,14)
		setPlayerStorageValue(cid,storage2,24)
		setPlayerStorageValue(cid,100171,28)
	end
	elseif v == 14 then
	if (getPlayerStorageValue(cid,storage2) == 31) then
		npcHandler:say("Once more you have impressed me! Are you willing to do another job?", cid)
		setPlayerStorageValue(cid,100171,30)
		Topic[cid] = 19
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 15 then
	if (getPlayerStorageValue(cid,storage) == 15) then
		npcHandler:say("So Waldo is dead? This is grave news indeed. Did you recover his posthorn?", cid)
		Topic[cid] = 21
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 16 then
	if (getPlayerStorageValue(cid,storage2) == 35) then
		npcHandler:say("So are you ready for another {Mission}?", cid)
		Topic[cid] = 25
	end
	elseif v == 17 then
	if (getPlayerStorageValue(cid,storage2) == 37) then
		npcHandler:say("You did it? I hope you did not catch a flu in the cold! However theres another mission for you. Are you interested?", cid)
		setPlayerStorageValue(cid,100171,35)
		Topic[cid] = 26
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 18 then
	if (getPlayerStorageValue(cid,storage2) == 39) then
		npcHandler:say("You have delivered that letter? You are a true postofficer. All over the land bards shall praise your name. There are no missions for you left right now.", cid)
		setPlayerStorageValue(cid,100171,38)
		Topic[cid] = 27
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif v == 19 then
	if (getPlayerStorageValue(cid,storage2) == 40) then
		npcHandler:say("There is no more {missions} left to you.", cid)
	end
	end
	---------------------New Dress Pattern-----------------------
	elseif (v == 8) and (msgcontains(msg, 'new dress') or msgcontains(msg, 'dress') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress pattern')) then
	if (getPlayerStorageValue(cid,storage2) == 15) then
		npcHandler:say("Oh yes, where did we get that from ...? Let's see, first ask the great technomancer in Kazordoon for the technical details. Return here afterwards.", cid)
		setPlayerStorageValue(cid,storage,9)
		setPlayerStorageValue(cid,storage2,16)
		setPlayerStorageValue(cid,100171,21)
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif (v == 9) and (msgcontains(msg, 'new dress') or msgcontains(msg, 'dress') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress pattern')) then
	if (getPlayerStorageValue(cid,storage2) == 17) then
		npcHandler:say("The mail with Talphion's instructions just arived. I remember we asked {Queen Eloise} of Carlin for the perfect colours. Go there, ask her about the {UNIFORMS} and report back here.", cid)
		setPlayerStorageValue(cid,storage,10)
		setPlayerStorageValue(cid,storage2,18)
		setPlayerStorageValue(cid,100171,23)
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif (v == 10) and (msgcontains(msg, 'new dress') or msgcontains(msg, 'dress') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress pattern')) then
	if (getPlayerStorageValue(cid,storage2) == 19) then
		npcHandler:say("The queen has sent me the samples we needed. The next part is tricky. We need theuniforms to emanate some odor that dogs hate.The dog with the best {taste} in that field is Noodles,the dog of King Tibianus. Do you understand so far?", cid)
		Topic[cid] = 16
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)
	end
	elseif (v == 11) and (msgcontains(msg, 'new dress') or msgcontains(msg, 'dress') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress pattern')) then
	if (getPlayerStorageValue(cid,storage2) == 21) then
		npcHandler:say("Fine, fine. I think that should do it. Tell Hugo that we order those uniforms. The completed dress pattern will soon arrive in Venore. Report to me when you have talked to him.", cid)
		setPlayerStorageValue(cid,storage,12)
		setPlayerStorageValue(cid,storage2,22)
		setPlayerStorageValue(cid,100171,27)
	else
		npcHandler:say("Come back when you have finished your {mission}.",cid)	
	end
	---------------------Agree-----------------------
		elseif Topic[cid] == 8 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("I am glad to hear that. One of our mailboxes was reported to be jammed. It is located on the so called {mountain} on theisle Folda. Get a crowbar and fix the mailbox. Report about your {mission} when you have done so.",cid)
			setPlayerStorageValue(cid,storage,2)
			setPlayerStorageValue(cid,storage2,5)
			setPlayerStorageValue(cid,100171,8)
			Topic[cid] = 0 
		end
		elseif Topic[cid] == 9 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("For your noble deeds I grant you the title Assistant Postofficer. All Postofficers will charge you less money from now on. After every second {mission} ask me for an {ADVANCEMENT}. Your next task will be a bit more challenging. Do you feel ready for it?",cid)
			Topic[cid] = 10
			setPlayerStorageValue(cid,100171,10)
		end
		elseif Topic[cid] == 10 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("I need you to deliver a bill to the stage magician David Brassacres. He's hiding from his creditors somewhere in Venore. It's likely you will have to trick him somehow to reveal his identity. Report back when you delivered this bill.",cid)
			setPlayerStorageValue(cid,storage,3)
			setPlayerStorageValue(cid,storage2,7)
			setPlayerStorageValue(cid,100171,11)
			doPlayerAddItem(cid,2329,1)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 11 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Ok, listen: we have some serious trouble with agressive dogs lately. We have accumulated some bones as a sort ofpacifier but we need more. {Collect 20 bones} like the one in my room to the left and report here.",cid)
			setPlayerStorageValue(cid,storage,4)
			setPlayerStorageValue(cid,storage2,9)
			setPlayerStorageValue(cid,100171,14)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 12 then
		if (msgcontains(msg, 'yes') and doPlayerRemoveItem(cid,2230,20)) then
			npcHandler:say("Excellent! You have collected 20 bones. Just report about your {mission} to continue. ", cid)
			setPlayerStorageValue(cid,bonestorage, 1)
			setPlayerStorageValue(cid,storage, 5)
			setPlayerStorageValue(cid,100171,15)
			Topic[cid] = 0
		else
			npcHandler:say("There is only "..getPlayerItemCount(cid,2230).." {bones} with you! Come back when you have 20 {bones}",cid)
		end
		elseif Topic[cid] == 14 then
		if (msgcontains(msg, 'yes')) and (getPlayerStorageValue(cid,storage) == 5) and (Topic[cid] == 14) then
			npcHandler:say("Since I am convinced I can trust you, this time you must deliver a valuable present to Dermot on Fibula. Do NOT open it!!! You will find the present behind the door here on the lower right side of this room.",cid)
			setPlayerStorageValue(cid,storage,6)
			setPlayerStorageValue(cid,storage2,11)
			setPlayerStorageValue(cid,100171,16)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 15 then
		if (msgcontains(msg, 'yes') and getPlayerStorageValue(cid,storage) == 7) then
			npcHandler:say("Ok. We need a new set of uniforms, and only the best will do for us. Please travel to Venore and negotiate with {Hugo} Chief acontract for {new uniforms}.", cid)
			setPlayerStorageValue(cid,storage,8)
			setPlayerStorageValue(cid,storage2,14)
			setPlayerStorageValue(cid,100171,19)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 16 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 16) then
			npcHandler:say("Good. Go there and find out what taste he dislikes most: moldy cheese, a piece of fur or a banana skin. Tell him to {SNIFF}, then the object. Show him the object and ask {Do you like that?}. DON'T let the guards know what you are doing.", cid)
			setPlayerStorageValue(cid,storage,11)
			setPlayerStorageValue(cid,storage2,20)
			setPlayerStorageValue(cid,100171,25)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 17 then
		if (msgcontains(msg, 'advancement') and Topic[cid] == 17) then
			npcHandler:say("You are worthy indeed. Do you want to advance in our guild?", cid)
			Topic[cid] = 18
		end
		elseif Topic[cid] == 18 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 18) then
			npcHandler:say("From now on it shall be known that you are a grand postman. You are now a privilegedmember until the end of days. Most captains around the world have an agreement with our guild to transport our privileged members, like you, for less gold.", cid)
			setPlayerStorageValue(cid,storage,13)
			setPlayerStorageValue(cid,storage2,23)
		end
		elseif Topic[cid] == 19 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 19) then
			npcHandler:say("Ok but your next assignment might be dangerous. Our Courier Waldo has been missing for a while. I must assume he is dead. Can you follow me so far?", cid)
			Topic[cid] = 20
			setPlayerStorageValue(cid,100171,31)
		end
		elseif Topic[cid] == 20 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 20) then
			npcHandler:say("Find out about his whereabouts and retrieve him or at least his posthorn. He was looking for a new underground passage that is rumoured to be found underneath the troll-infested Mountain east of Thais.", cid)
			setPlayerStorageValue(cid,storage,15)
			setPlayerStorageValue(cid,storage2,33)
		end
		elseif Topic[cid] == 21 then
		if (msgcontains(msg, 'yes') and doPlayerRemoveItem(cid,2332,1)) then
			npcHandler:say("Thank you. We will honour this. Your next mission will be a very special one. Good thing you are a special person as well. Are you ready?", cid)
			Topic[cid] = 22
			setPlayerStorageValue(cid,100171,32)
		else
			npcHandler:say("the posthorn is missing.", cid)	
		end
		elseif Topic[cid] == 22 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 22) then
			npcHandler:say("Your eagerness is a virtue, young one, but first lets talk about {advancement}.", cid)
			Topic[cid] = 23
		end
		elseif Topic[cid] == 23 then
		if (msgcontains(msg, 'advancement') and Topic[cid] == 23) then
			npcHandler:say("You are worthy indeed. Do you want to advance in our guild?", cid)
			Topic[cid] = 24
		end
		elseif Topic[cid] == 24 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 24) then
			npcHandler:say("From now on you are a grand postman for special operations. You are an honoured member of our guild and earned the privilege of your own post horn. Here, take it.", cid)
			doPlayerAddItem(cid,2364,1)
			setPlayerStorageValue(cid,storage,16)
			setPlayerStorageValue(cid,storage2,35)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 25 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 25) then
			npcHandler:say("So listen well. Behind the lower left door you will find a bag. The letters in the bag are for none other than Santa Claus! Deliver them to his house on the isle of Vega, USE the bag on his mailbox and report back here.", cid)
			setPlayerStorageValue(cid,storage,17)
			setPlayerStorageValue(cid,storage2,35)
			setPlayerStorageValue(cid,100171,33)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 26 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 26) then
			npcHandler:say("Excellent. Here is a letter for you to deliver. Well, to be honest, no one else volunteered. It's a letter from the mother of Markwin, the king of Mintwallin. Deliver that letter to him, but note that you will not be welcome there.", cid)
			setPlayerStorageValue(cid,storage,18)
			setPlayerStorageValue(cid,storage2,38)
			doPlayerAddItem(cid, 2333, 1)
			setPlayerStorageValue(cid,100171,36)
			Topic[cid] = 0
		end
		elseif Topic[cid] == 27 then
		if (msgcontains(msg, 'advancement') and Topic[cid] == 27) then
			npcHandler:say("You are worthy indeed. Do you want to advance in our guild?", cid)
			Topic[cid] = 28
		end
		elseif Topic[cid] == 28 then
		if (msgcontains(msg, 'yes') and Topic[cid] == 28) then
			npcHandler:say("I grant you the title of archpostman. You are a legend in our guild. As privilege of your newly aquired status you are allowed to make use of certain mailboxes in dangerous areas. Just look out for them and you'll see.", cid)
			setPlayerStorageValue(cid,storage,19)
			setPlayerStorageValue(cid,storage2,40)
			doPlayerAddItem(cid,2665,1)
			Topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|, what brings you here?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())