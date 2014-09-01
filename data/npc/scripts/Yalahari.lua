local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100013
 
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
	if msgcontains(msg, 'no') and Topic[cid] == 1 or Topic[cid] == 2 or Topic[cid] >= 5 then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say("With all the coming and going of strangers here, it would be quite tedious to explain everything again and again. So we have written a manifesto. ...",cid)
        npcHandler:say("Grab a copy from the room behind me. Let's talk about your further career in our ranks once you've read it.",cid, 6000)
        setPlayerStorageValue(cid, storage, 1)  
	elseif Topic[cid] == 4 then
    if msgcontains(msg, 'yes') then 
        npcHandler:say("I knew that you were smart enough to make the right decision! Your next {mission} will be a special one!",cid)
        setPlayerStorageValue(cid, storage, 15)
    end  
	Topic[cid] = 0
--/////////////////////////////////////////Missions///////////////////////////////////////////--
	elseif msgcontains(msg, 'mission') then
		local v = getPlayerStorageValue(cid, storage)
		if v == 1 then -- Start Mission 1 - The interrogation
		if getPlayerStorageValue(cid, 100014) == 1 then
		    npcHandler:say("I'm mildly impressed by your previous deeds in our service. So I'm willing to grant you some more important missions. ...", cid)
            npcHandler:say("If you please us, a life of luxury as an important person in our city is ensured. If you fail, you will be replaced by someone more capable than you. ...",cid, 4500)
            npcHandler:say("So if you are up for a challenge, ask me for a {mission}.",cid, 10500)
		    setPlayerStorageValue(cid, storage, 2)
		setPlayerStorageValue(cid, 100163, 4)
        else
            npcHandler:say("Go and grab a copy from the room behind me.",cid)
        end
		elseif v == 2 then
	         npcHandler:say("The former alchemist quarter was struck by even more disasters than the rest of the city. Fires, explosions, poisonous fumes - all sorts of catastrophes. ...", cid)
             npcHandler:say("The worst plague, however, are unknown diseases that have spread in this quarter and eradicated any human population. We must stop it before other quarters are afflicted. We already identified certain carriers responsible for spreading the plague. ...",cid, 5000)
             npcHandler:say("It will be your task to eliminate them. This spell will protect you from becoming infected yourself. Enter the alchemist quarter and kill the three plague carriers, and at best anything else you might find there. ...",cid, 11000)
             npcHandler:say("Even more important, retrieve the last research notes that the local alchemists made before the plague killed them. They might be the key for a cure or something else....",cid, 16500)
             npcHandler:say("At least we have to make sure that these scientists did not die in vain, and honour their researches. So please bring us these research notes. ...",cid, 20500)
             npcHandler:say("Also, I will inform the guards that you are allowed to pass the centre gate to the alchemist quarter. Just use the gate mechanism to pass.",cid, 26000)
             setPlayerStorageValue(cid, storage, 3)
		elseif v == 3 then
	       npcHandler:say("So you have killed the plague carriers. Have you also retrieved the research papers?",cid)
	       Topic[cid] = 3
		elseif v == 4 then
	       npcHandler:say("We surely cannot allow some underworld kingpin to rule a significant part of the city. Although, I have to admit that his firm grip on the former trade quarter might be useful....",cid)
           npcHandler:say("I expect you to fight your way through his minions and to show him that we are determined and powerful enough to retake the quarter, if necessary by force. Talk to himafter killing some of his henchmen. ...",cid, 6000)
           npcHandler:say("I'm sure he'll understand that he will succumb to a greater power. That's how his little empire has worked after all. ...",cid,12000)
           npcHandler:say("Also, I will inform the guards that you are allowed to pass the centre gate to the trade quarter now. Just use the gate mechanism to pass.",cid, 17000)
	       setPlayerStorageValue(cid, storage, 5)
		setPlayerStorageValue(cid, 100016, 1)
		elseif v == 5 and getPlayerStorageValue(cid, 100046) == -1 then
		if getPlayerStorageValue(cid, 100015) == 4 then
	       npcHandler:say("So he has been too uncooperative for you? Well, you weren't the first we have sent and you won't be the last. ...",cid)
           npcHandler:say("However, if you cannot even serve us as a bully, we might have to rethink if you are the right person for us. That was a bad job and we don't tolerate many of them.",cid, 5000)
	       setPlayerStorageValue(cid, storage, 6)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
		elseif v == 5 then
		if getPlayerStorageValue(cid, 100016) == 2 then
	       npcHandler:say("I hope you gave this criminal a real scare! I'm sure he'll remember what he has to expect if he arouses our anger again. ...",cid)
           npcHandler:say("You have proven yourself as quite valuable with this mission! That was just the first step on your rise through the ranks of our helpers. ...",cid, 5000)
           npcHandler:say("Just ask me for more {missions} and we will see what you are capable of!",cid, 11500)
	       setPlayerStorageValue(cid, storage, 6)
		setPlayerStorageValue(cid, 100086, 12)
		setPlayerStorageValue(cid, 100163, 6)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
		elseif v == 6 then
	       npcHandler:say("As you probably noticed, once our city had a park and a zoo around a grand arena. It was a favourite pastime of our citizens to visit this quarter in their spare time. ...",cid)
           npcHandler:say("Nowadays, the quarter is lost. The animals are on the loose, and an attempt to revitalise the city with new arena games resulted in a revolt of the foreign gladiators. ...",cid, 6000)
           npcHandler:say("Now all kinds of beasts roam the park, and gladiators challenge them and visitors to test their skills. One of the residents is an ancient druid that rather cares foranimals than for people. ...",cid, 12000)
           npcHandler:say("It is said that he is able to use magic to breed animals with changed abilities and appearances. Such skills are of course quite useful for us. ...",cid, 18500)
           npcHandler:say("We lack the manpower to retake all quarters, or just to defend ourselves adequately. If he bred us some guards and warbeasts, we could strengthen our positionconsiderably. ...",cid, 23500)
           npcHandler:say("Travel to the arena quarter and gain his assistance for us. I will inform the guards that you are allowed to pass the centre gate to the arena quarter now. Just use thegate mechanism to pass.",cid,29000)
	       setPlayerStorageValue(cid, storage, 7)
		elseif v == 7 and getPlayerStorageValue(cid, 100047) == -1  then
		if getPlayerStorageValue(cid, 100017) == 3 then
	       npcHandler:say("This druid dares to affront us? We will look into this when we have enough time. But there are other things that needs to be settled. ...",cid)
           npcHandler:say("Although, we probably should not do so after your last failure, we are willing to grant you another {mission}.",cid, 5500)
	       setPlayerStorageValue(cid, storage, 8)
		setPlayerStorageValue(cid, 100086, 17)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)  
        end
		elseif v == 7 then
		if getPlayerStorageValue(cid, 100018) == 1 then
	       npcHandler:say("So have you won us a new ally? Excellent. I knew you would not dare to ruin this mission. Soon we might be able to strengthen our defences and even relocate some of our guards. ...",cid)
           npcHandler:say("Perhaps some day soon, you lead your own unit of men. However, there are more {missions} that need to be accomplished. Let's talk about them.",cid, 3500)
	       setPlayerStorageValue(cid, storage, 8)
	       setPlayerStorageValue(cid,100017, 3)
		setPlayerStorageValue(cid, 100163, 7)
		setPlayerStorageValue(cid, 100086, 17)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
		elseif v == 8 then
	       npcHandler:say("The old cemetery of the city has been abandoned decades ago when the activity of the various undead there became unbearable. The reason for their appearance was never found out or researched. ...",cid)
           npcHandler:say("However, those undead could be useful, at least some of them. Particular ghosts consist of a substance that is very similar to the energy source that powered some of our devices. ...",cid, 6000)
           npcHandler:say("Since we lack most of the original sources, some substitute might come in handy. Take this ghost charm and place it on the strange carving in the cemetery. ...",cid, 11000)
           npcHandler:say("Use it to attract ghosts and slay them. Then use the residues of the ghosts on the charm to capture the essence. ...",cid, 16000)
           npcHandler:say("Once it is filled, ghosts will not be attracted any longer. Then return the charm to me. I will inform the guards that you are allowed to pass the centre gate to the cemetery quarter now. Just use the gate mechanism to pass.",cid, 21000)
		doPlayerAddItem(cid,9737,1)
	       setPlayerStorageValue(cid, storage, 9)
	       elseif v == 9 and getPlayerStorageValue(cid,100048) == -1 then
		if getPlayerStorageValue(cid, 100040) == 1 then
		if doPlayerTakeItem(cid, 9742, 1) then
	       npcHandler:say("Ah, what an unexpected sight. I can almost feel the energy of the charm. It will help to recover some of the past wealth. ...",cid)
           npcHandler:say("You did quite an impressive job. I'm considering to introduce you to my ma.. to my direct superior one day. But there are still other {missions} to fulfil.",cid, 5500)
	       setPlayerStorageValue(cid, storage, 10)
	       setPlayerStorageValue(cid,100049, 1)
		setPlayerStorageValue(cid, 100086, 20)
		setPlayerStorageValue(cid, 100163, 8)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
        else
           npcHandler:say("There is no charm with you! You better don't return here until you've returned the charm.", cid) 
        end
		elseif v == 9 then
		if getPlayerStorageValue(cid, 100019) == 2 then
		setPlayerStorageValue(cid, 100086, 20)
	       npcHandler:say("Destroyed you say? That's impossible! I'm not sure if I can trust you in this matter? One might assume, you fled from the ghosts in terror and left the charm there. ...",cid)
           npcHandler:say("You will have to work twice as hard on your next {missions} to restore the trust you have lost.",cid, 5500)
	       setPlayerStorageValue(cid, storage, 10)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
		elseif v == 10 then
	       npcHandler:say("Recently, our fishermen have been attacked by a maritime race called the quara. They live in the sunken quarter and are a significant threat to our people. I ask you to enter the sunken quarter and slay all their leaders. ...",cid)
           npcHandler:say("We believe that there are three leaders in this area. Your task is simple enough, so you better don't fail! ...",cid, 5500)
           npcHandler:say("I will inform the guards that you are allowed to pass the centre gate to the sunken quarter now. Just use the gate mechanism to pass.",cid, 10000)
           setPlayerStorageValue(cid, storage, 11)
           setPlayerStorageValue(cid, 100022, 1) 
	   setPlayerStorageValue(cid, 100086, 21)
		elseif v == 11 and getPlayerStorageValue(cid, 100022) == 1 then
		if getPlayerStorageValue(cid, 100028) == 1 and getPlayerStorageValue(cid, 100029) == 1 and getPlayerStorageValue(cid, 100030) == 1 then 
	       npcHandler:say("This will teach these fishmen who is the ruler of that area. You have earned yourself a special privilege. But we will talk about that when we speak about your next {mission}.",cid)
	       setPlayerStorageValue(cid, 100022, 2)
	       setPlayerStorageValue(cid, 100050, 1)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
		elseif v == 11 and getPlayerStorageValue(cid, 100022) == 2 then
	       npcHandler:say("In the past, we had many magical factories providing the citizens with everything they needed. Now that most of these factories are shut down, we have trouble getting enough supplies. ...",cid)
           npcHandler:say("We need you to enter one of the lesser damaged factories. Go to the factory district and look for a pattern crystal used for weapon production. Use it on the factory controller. ...",cid, 5000)
           npcHandler:say("It will ensure that the factory will provide us with a suitable amount of weapons which we dearly need to reclaim and secure the most dangerous parts of the city. ...",cid, 10000)
           npcHandler:say("I will inform the guards that you are allowed to pass the centre gate to the factory quarter now. Just use the gate mechanism to pass.",cid, 14000)
	       setPlayerStorageValue(cid, storage, 12)
        elseif v == 12 and getPlayerStorageValue(cid, 100024) == -1 then
		if getPlayerStorageValue(cid, 100023) == 1 then
	       npcHandler:say("Your failure is an outrage! I think we have to talk about the {missions} you have accomplished so far.",cid)
	       setPlayerStorageValue(cid, storage, 13)
		setPlayerStorageValue(cid, 100086, 27)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
        elseif v == 12 then
		if getPlayerStorageValue(cid, 100024) == 1 then
	       npcHandler:say("Impressive! Still, I see your potential. So I ask you to rethink your loyalties. Come back if you have decided to which side you want to belong.",cid)
	       setPlayerStorageValue(cid, storage, 14)
		setPlayerStorageValue(cid, 100086, 27)
		setPlayerStorageValue(cid, 100163, 9)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
		elseif v == 13 then
	       npcHandler:say("I'm quite aware of your connection to this manipulative Palimuth. Still, I see your potential. So I ask you to rethink your loyalties. Come back if you have decided to which side you want to belong.",cid)
	       setPlayerStorageValue(cid, storage, 14)
  		elseif v == 14 then
	       npcHandler:say("So do you want to side with me "..getCreatureName(cid).."?",cid)
	       Topic[cid] = 4
  		elseif v == 15 then
           npcHandler:say("For your noble deeds, we would like to invite you to a special celebration ceremony. ...",cid)
           npcHandler:say("Only the most prominent Yalahari are allowed to join the festivities. I assume you can imagine what honour it is that you've been invited to join us. Meet us in the inner city's centre. ...",cid, 4000)
           npcHandler:say("As our most trusted ally, you may pass all doors to reach the festivity hall. There you will receive your reward for the achievements you have gained so far. ...",cid, 10000)
           npcHandler:say("I'm convinced your reward will be beyond your wildest dreams. And that is just the beginning!",cid, 15500)
           setPlayerStorageValue(cid, storage, 16) 
	   setPlayerStorageValue(cid, 100086, 29)   
		setPlayerStorageValue(cid, 100163, 10)
        elseif v == 16 then
        if getPlayerStorageValue(cid,100051) == 1 then 
           npcHandler:say("You are now allowed to enter the reward room. Also take this outfit as a reward to.",cid)
           setPlayerStorageValue(cid,100011,13)
           setPlayerStorageValue(cid,storage,17)
	   setPlayerStorageValue(cid,100052, 1)
		setPlayerStorageValue(cid, 100086, 31)
		setPlayerStorageValue(cid, 100163, 11)
	   AddStageExp(cid,250000)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
        elseif v == 17 then
           npcHandler:say("I'm quite busy getting accustomed to my new duties, so please excuse me.",cid)
        end
--/////////////////////////////////////////Answers///////////////////////////////////////////--
	elseif Topic[cid] == 3 and getPlayerStorageValue(cid,100032) == -1 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid,100025) == 1 and getPlayerStorageValue(cid,100026) == 1 and getPlayerStorageValue(cid,100027) == 1 and getPlayerStorageValue(cid,100032) == -1 and doPlayerTakeItem(cid, 9733, 1) then
			    npcHandler:say("Impressive indeed! Someone with your skills will quickly raise in our ranks of helpers. You have great potential, and if you are upfor further {missions}, just ask for them.",cid)
				setPlayerStorageValue(cid, storage, 4)
				setPlayerStorageValue(cid, 100086, 9)
				setPlayerStorageValue(cid, 100163, 5)
			else
				npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 3 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'no') then
			if getPlayerStorageValue(cid,100025) == 1 and getPlayerStorageValue(cid,100026) == 1 and getPlayerStorageValue(cid,100027) == 1 and getPlayerStorageValue(cid,100032) == 1 then
                npcHandler:say("Hm, no sign of any notes you say? That's odd - odd and a bit suspicious. I doubt you have tried hard enough. ...",cid)
                npcHandler:say("There are only a few chances to impress us. For those who please us great rewards are in store. If you fail though, you might lose more than you can imagine.",cid, 5000)
                setPlayerStorageValue(cid, storage, 4)
                setPlayerStorageValue(cid, 100086, 9)
		setPlayerStorageValue(cid, 100163, 5)
			else
				npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
		Topic[cid] = 0
		end
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Greetings.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())