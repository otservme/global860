local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 90000
 
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

local highLevelPrice = 20000 --(Real Tibia Price: 20000) price for players level 120+, per blessing
        local lowLevelPrice = 2000 --(Real Tibia Price: 2000) price for players level 30 and lower, per blessing
        local pricePerLevel = 200 --(Real Tibia Price: 200) this price only applies to players between level 30 & 120, formula=((pricePerLevel*playerLevel)+lowLevelPrice)

local getCost = function(cid)
	local l, s = getPlayerLevel(cid)
	if l <= 30 then
		s = lowLevelPrice * 4
	elseif l >= 200 then
		s = highLevelPrice * 4
	else
		s = (((l-30) * pricePerLevel) + lowLevelPrice) * 4
	end
	return math.ceil(s)
end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg) 
    local v = getPlayerStorageValue(cid, storage)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'ruthless seven') then
		npcHandler:say('They\'re one of the mightiest weapons that our enemies have at disposal. They\'re the leaders of some of the most powerful forces of demonkind.', cid)
		Topic[cid] = 0
	elseif (msgcontains(msg, 'inquisition') or msgcontains(msg, 'join') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say('Do you want to {join} the inquisition?', cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') and getPlayerStorageValue(cid, 100080) == 3 then
			npcHandler:say('Muito bem sua missão foi finalizada, agora você pode acessar a sala de recompensas.', cid)
			setPlayerStorageValue(cid, storage, 17)
			else
			npcHandler:say('Você não destruiu o nexus.', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'mission') then
		if v == 1 then -- Start Mission 1 - The interrogation
			npcHandler:say("Let's see if you are worthy. Take an inquisitor's field guide from the box in the back room. ...",cid)
			npcHandler:say("Follow the instructions in the guide to talk to the Thaian guards that protect the walls and gates of the city and test their loyalty. Then report to me about your mission.",cid, 6000)
			setPlayerStorageValue(cid, storage, 2)
			setPlayerStorageValue(cid,100078,2)
			Topic[cid] = 0
		elseif v == 2 then
			npcHandler:say("Your current mission is to investigate the reliability of certain guards. Are you done with that {mission}?", cid)
			Topic[cid] = 2
		elseif v == 3 then -- Start Mission 2 - The Eclipse
			npcHandler:say("Listen, we have information about a heretic coven that hides in a mountain called the Big Old One. The witches reach this cursed place on flying brooms and think theyare safe there. ...",cid)
			npcHandler:say("I've arranged a flying carpet that will bring you to their hideout. Travel to Femor Hills and tell the carpet pilot the code word {eclipse}. ...",cid, 6000)
			npcHandler:say("He'll bring you to your destination. At their meeting place, you'll find a cauldron in which they cook some forbidden brew. ...",cid, 12000)
			npcHandler:say("Use this vial of holy water to destroy the brew. Also steal their grimoire and bring it to me.",cid, 17000)
			setPlayerStorageValue(cid, storage, 4)
			doPlayerAddItem(cid, 7494, 1)
			setPlayerStorageValue(cid,100078,5)
			Topic[cid] = 0
		elseif v == 4 then
			npcHandler:say("Your current mission is to destroy this coven. Are you done with that {mission}?", cid)
			Topic[cid] = 3
		elseif v == 5 then -- Start Mission 3 - Vampire Hunt
            npcHandler:say("I think it's time to truly test your abilities. One of our allies has requested assistance. I think you are just the right person to help him ... ",cid)
            npcHandler:say("Storkus is an old and grumpy dwarf who works as a vampire hunter since many, many decades. He's quite successful but even hehas his limits. ... ",cid, 6000)
            npcHandler:say("So occasionally, we send him help. In return he trains and tests our recruits. It's an advantageous agreement for both sides ... ",cid, 12000)
            npcHandler:say("You'll find him in his cave at the mountain outside of Kazordoon. He'll tell you about your next {mission}. ",cid, 17000)
			setPlayerStorageValue(cid, storage, 6)
			setPlayerStorageValue(cid, 92224, 1)
			setPlayerStorageValue(cid,100078,8)
			Topic[cid] = 0
		elseif v == 6 then
		    npcHandler:say("Your current mission is to help the vampire hunter Storkus. Are you done with that {mission}?", cid)
			Topic[cid] = 5   
		elseif v == 4 then
			npcHandler:say("Your current mission is to investigate the reliability of certain guards. Are you done with that mission?", cid)
			Topic[cid] = 4
	elseif v == 7 then
        	npcHandler:say("We've got a report about an abandoned and haunted house in Liberty Bay. I want you to examine this house. It's the only ruin in Liberty Bay so you should have no trouble finding it. ...",cid)
            npcHandler:say("There's an evil being somewhere. I assume that it will be easier to find the right spot at night. Use this vial of holy water on that spot to drive out the evil being.",cid, 6000)
        	setPlayerStorageValue(cid, storage, 8)
        	doPlayerAddItem(cid, 7494, 1)
        	setPlayerStorageValue(cid, 49312, 1)
        	setPlayerStorageValue(cid,100078,14)
       		Topic[cid] = 0
        elseif v == 8 then
        	npcHandler:say("Your current mission is to exorcise an evil being from a house in Liberty Bay. Are you done with that mission?", cid)
        	Topic[cid] = 6
	elseif v == 9 then
        	npcHandler:say("You've handled heretics, witches, vampires and ghosts. Now be prepared to face the most evil creatures we are fighting - demons. Your new task is extremely simple, though far from easy. ...",cid)
        	npcHandler:say("Go and slay demonic creatures wherever you find them. Bring me 20 of their essences as a proof of your accomplishments. ",cid, 6000)
        	setPlayerStorageValue(cid, storage, 10)
        	setPlayerStorageValue(cid,100078,17)
        	Topic[cid] = 0
         elseif v == 10 then
        	npcHandler:say("Your current mission is to gather Demonic Essences. Are you done with that mission?", cid)
        	Topic[cid] = 7
	elseif v == 12 then
        	npcHandler:say("We've got information about something very dangerous going on on the isle of Edron. The demons are preparing something there ...",cid)
        	npcHandler:say("Something that is a threat to all of us. Our investigators were able to acquire vital information before some of them were slain by a demon named Ungreez. ...",cid, 5500)
        	npcHandler:say("It'll be your task to take revenge and to kill that demon. You'll find him in the depths of Edron. Good luck.",cid, 11000)
        	setPlayerStorageValue(cid, storage, 13)
        	setPlayerStorageValue(cid, 57684, 1)
        	setPlayerStorageValue(cid,100078,20)
        	Topic[cid] = 0  
	elseif v == 13 then
	       npcHandler:say("You current mission is to slay the demon Ungreez. Are you done with that mission?", cid)
	       Topic[cid] = 8 
	elseif v == 15 then
		npcHandler:say("Your mission is simple,You must enter in the retreat and destruct the Shadow Nexus. Then report to me about your {mission}.", cid)
		setPlayerStorageValue(cid, storage, 16)
		setPlayerStorageValue(cid,100078,22)
		setPlayerStorageValue(cid,100080,1)
		doPlayerAddItem(cid, 7494, 1)
		Topic[cid] = 0  
	elseif v == 16 then
		npcHandler:say("Your current mission is to destroy the shadow nexus in the Demon Forge. Are you done with that mission?", cid)
		Topic[cid] = 9 
    	end
		elseif Topic[cid] == 2 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid, 13890) == 4 then
			   npcHandler:say("Indeed, this is exactly what my other sources told me. Of course I knew the outcome of this investigation in advance. This was just a test. ...",cid)
			   npcHandler:say("Well, now that you've proven yourself as useful, you can ask me for another mission. Let's see if you can handle some field duty, too.",cid, 6000)
				setPlayerStorageValue(cid, storage, 3)
                setPlayerStorageValue(cid,100078,4)
				setPlayerStorageValue(cid, 100161, 2)
			else
				npcHandler:say("I don't think so. This failure will be noted down. However, continue your investigations and return to me after you're done.", cid)
			end
		else
			npcHandler:say("This lax behaviour is very suspicious. You better don't return here until you've finished your mission.", cid)
		end
        	Topic[cid] = 0
		elseif Topic[cid] == 3 then -- Finish mission 2 - The Eclipse
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid, 99220) == 1 and doPlayerRemoveItem(cid, 8702, 1) then
				npcHandler:say("Fine, fine. You have proven that you can work efficiently. Still, only further missions will show if you're are truly capable. Ask me for another {mission} if you're ready.", cid)
				setPlayerStorageValue(cid, storage, 5)
				setPlayerStorageValue(cid,100078,7)
				setPlayerStorageValue(cid, 100161, 3)
			else
				npcHandler:say("I don't think so. This failure will be noted down. However, continue your mission and return to me when you're done.", cid)
			end
		else
			npcHandler:say("This lax behaviour is very suspicious. You better don't return here until you've finished your mission.", cid)
		end
       	 	Topic[cid] = 0
		elseif Topic[cid] == 5 then -- Finish mission 3 - Vampire Hunt
		if msgcontains(msg, 'yes') then 
			if getPlayerStorageValue(cid, 92224) == 26 then
				npcHandler:say("Good, you've returned. Your skill in practical matters seems to be useful. If you're ready for a further {mission}, just ask.", cid)
				setPlayerStorageValue(cid, storage, 7)
				setPlayerStorageValue(cid,100078,13)
				setPlayerStorageValue(cid, 100161, 4)
			else
				npcHandler:say("I don't think so. This failure will be noted down. However, continue your mission and return to me when you're done.", cid)
			end
		else
			npcHandler:say("This lax behaviour is very suspicious. You better don't return here until you've finished your mission.", cid)
		end
        	Topic[cid] = 0
		elseif Topic[cid] == 6 then -- Finish mission 4 - Libert Bay
		if msgcontains(msg, 'yes') then 
			if getPlayerStorageValue(cid, 49312) == 2 then
				npcHandler:say("Well, this was an easy task, but your next {mission} will be much more challenging.", cid)
				setPlayerStorageValue(cid, storage, 9)
				setPlayerStorageValue(cid,100078,16)
				setPlayerStorageValue(cid, 100161, 5)
			else
				npcHandler:say("I don't think so. This failure will be noted down. However, continue your mission and return to me when you're done.", cid)
			end
		else
			npcHandler:say("This lax behaviour is very suspicious. You better don't return here until you've finished your mission.", cid)
		end  
        	Topic[cid] = 0
		elseif Topic[cid] == 7 then -- Finish mission 5 - outfit
		if msgcontains(msg, 'yes') then
		if doPlayerTakeItem(cid, 6500, 20) and getPlayerStorageValue(cid, storage) == 10 then
		   npcHandler:say("You're indeed a dedicated protector of the true believers. Don't stop now. Kill as many of these creatures as you can. ...",cid)
		   npcHandler:say("I also have a reward for your great efforts. Talk to me about your demon hunter {outfit} anytime from now on. Afterwards, let's talk about the next {mission} that's awaiting you.",cid, 5500)
		   setPlayerStorageValue(cid, storage, 12)
		   setPlayerStorageValue(cid,100078,18)
			setPlayerStorageValue(cid, 100161, 6)
       		else
		   npcHandler:say("Come back when you have the demonic essences.", cid)
		   end
   		else
			npcHandler:say("Come back when you have the demonic essences.", cid)
	   	end
   		Topic[cid] = 0
		elseif Topic[cid] == 8 then -- Finish mission 6 - Ungreez
		if msgcontains(msg, 'yes') then 
			if getPlayerStorageValue(cid, 57684) == 2 then
				npcHandler:say("So the beast is finally dead! Thank the gods. At least some things work out in our favour ...",cid)
				npcHandler:say("Our other operatives were not that lucky, though. But you will learn more about that in your next {mission}. Until then, you may talk to me about your {outfit}.",cid, 3000)
				setPlayerStorageValue(cid, 61923, 1)
				setPlayerStorageValue(cid, storage, 14)
				setPlayerStorageValue(cid, 100161, 7)
			else
				npcHandler:say("I don't think so. This failure will be noted down. However, continue your mission and return to me when you're done.", cid)
			end
		else
			npcHandler:say("This lax behaviour is very suspicious. You better don't return here until you've finished your mission.", cid)
		end 
		Topic[cid] = 0
  		elseif v == 14 then
		if msgcontains(msg, 'outfit') or msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 61923) == 1 then -- Finish mission 6 - Outfit
			npcHandler:say("Here is your demon hunter outfit. You deserve it. Unlock more addons by completing more {missions}.", cid)
			setPlayerStorageValue(cid, storage, 15)
			setPlayerStorageValue(cid, 61923, 2)
			setPlayerStorageValue(cid,100078,19)
		if getPlayerSex(cid) == 0 then
    			doPlayerAddOutfit(cid, 288, 1)
  		elseif getPlayerSex(cid) == 1 then
    			doPlayerAddOutfit(cid, 289, 1)
			end
		end 
		Topic[cid] = 0
		elseif Topic[cid] == 9 then -- Finish mission 7 - Destroy Shadow Nexus
		if msgcontains(msg, 'yes') then 
			if getPlayerStorageValue(cid, 100080) == 3 then
				npcHandler:say("Incredible! You're a true defender of faith! I grant you the title of a High Inquisitor for your noble deeds. From now on you can obtain the blessing of the inquisition which makes the pilgrimage of ashes obsolete. ...", cid)
				npcHandler:say("The blessing of the inquisition will bestow upon you all available blessings for the price of 60000 gold. Also, don't forget to ask me about your {outfit} to receive the final addon as demon hunter.", cid, 4000)
				setPlayerStorageValue(cid, storage, 17)
				setPlayerStorageValue(cid,100080, 4)
				setPlayerStorageValue(cid, 100161, 8)
			else
			    npcHandler:say("My informants tell me otherwise. Don't forget that the inquisition has its eyes everywhere! Finish your {mission} or face the wrath of the inquisition.", cid)
			end
		else
			npcHandler:say("My informants tell me otherwise. Don't forget that the inquisition has its eyes everywhere! Finish your {mission} or face the wrath of the inquisition.", cid)
		end
		Topic[cid] = 0
		elseif v == 17 then -- Finish mission 7 - Destroy Shadow Nexus
		if msgcontains(msg, 'outfit') or msgcontains(msg, 'mission') and v == 17 then 
			npcHandler:say("Here is the final addon for your demon hunter outfit. Congratulations!", cid)
			setPlayerStorageValue(cid, storage, 18)
		if getPlayerSex(cid) == 0 then
    			doPlayerAddOutfit(cid, 288, 2)
  		elseif getPlayerSex(cid) == 1 then
    			doPlayerAddOutfit(cid, 289, 2)
		end
end
	elseif msgcontains(msg, 'blessing') and v >= 17 then
		npcHandler:say('Do you want to receive the blessing of the inquisition - which means all five available blessings - for '..getCost(cid)..' gold?', cid)
		Topic[cid] = 10 
    elseif Topic[cid] == 10 then -- Blessing
		if msgcontains(msg, 'yes') and v >= 17 then  
		if(getPlayerBlessing(cid, 1) and getPlayerBlessing(cid, 2) and getPlayerBlessing(cid, 3) and getPlayerBlessing(cid, 4) and getPlayerBlessing(cid, 5)) then
		npcHandler:say("Gods have already blessed you with this blessing!", cid)
		Topic[cid] = 0
		else
		if doPlayerRemoveMoney(cid, getCost(cid)) then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		npcHandler:say("So be it!", cid)
		Topic[cid] = 0
		else
		npcHandler:say('You don\'t have enough money for all 5 blessings.', cid)
		Topic[cid] = 0
		end
		end
	end
	elseif msgcontains(msg, 'name') then
		npcHandler:say('I\'m Henricus, the Lord Inquisitor.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'job') then
		npcHandler:say('By edict of the churches I\'m the Lord Inquisitor.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'beliver') then
		npcHandler:say('Belive on the gods and they will show you the path.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'inquisitor') then
		npcHandler:say('The churches of the gods entrusted me with the enormous and responsible task to lead the inquisition. I leave the field work to inquisitors who I recruit from fitting people that cross my way.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'church') then
		npcHandler:say('The churches of the gods united to fight heresy and dark magic. They are the shield of the true believers, while the inquisition is the sword that fights all enemies of virtuousness.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'gods') then
		npcHandler:say('We owe to the gods of good our creation and continuing existence. If it weren\'t for them, we would surely fall prey to the minions of the vile and dark gods.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'dark') then
		npcHandler:say('The dark powers are always present. If a human shows only the slightest weakness, they try to corrupt him and to lure him into their service. ...', cid)
		npcHandler:say('We must be constantly aware of evil that comes in many disguises.', cid, 3000)
		Topic[cid] = 0
	elseif msgcontains(msg, 'king') then
		npcHandler:say('The Thaian kings are crowned by a representative of the churches. This means they reign in the name of the gods of good and are part of the godly plan for humanity. ...', cid)
		npcHandler:say('As nominal head of the church of Banor, the kings aren\'t only worldly but also spiritual authorities. ...', cid, 4000)
		npcHandler:say('The kings fund the inquisition and sometimes provide manpower in matters of utmost importance. The inquisition, in return, protects the realm from heretics and individuals that aim to undermine the holy reign of the kings.', cid, 7000)
		Topic[cid] = 0
	elseif msgcontains(msg, 'banor') then
		npcHandler:say('In the past, the order of Banor was the only order of knighthood in existence. In the course of time,  the order concentrated more and more on spiritual matters rather than on worldly ones. ...', cid)
		npcHandler:say('Nowadays, the order of Banor sanctions new orders and offers spiritual guidance to the fighters of good.', cid, 4000)
		Topic[cid] = 0
	elseif msgcontains(msg, 'fardos') then
		npcHandler:say('The priests of Fardos are often mystics who have secluded themselves from worldly matters. Others provide guidance and healing to people in need in the temples.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'uman') then
		npcHandler:say('The church of Uman oversees the education of the masses as well as the doings of the sorcerer and druid guilds. It decides which lines of research are in accordance with the will of Uman and which are not. ...', cid)
		npcHandler:say('Concerned, the inquisition watches the attempts of these guilds to become more and more independent and to make own decisions. ...', cid, 4000)
		npcHandler:say('Unfortunately, the sorcerer guild has become dangerously influential and so the hands of our priests are tied due to political matters ...', cid, 7000)
		npcHandler:say('The druids lately claim that they are serving Crunor\'s will and not Uman\'s. Such heresy could only become possible with the independence of Carlin from the Thaian kingdom. ...', cid, 10000)
		npcHandler:say('The spiritual centre of the druids switched to Carlin where they have much influence and cannot be supervised by the inquisition.', cid, 13500)
		Topic[cid] = 0
	elseif msgcontains(msg, 'crunor') then
		npcHandler:say('The church of Crunor works closely together with the druid guild. This makes a cooperation sometimes difficult.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'zathroth') then
		npcHandler:say('We can see his evil influence almost everywhere. Keep your eyes open or the dark one will lead you on the wrong way and destroy you.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'fafnar') then
		npcHandler:say('Fafnar is mostly worshipped by the peasants and farmers in rural areas. ...', cid)
		npcHandler:say('The inquisition has a close eye on these activities. Simply people tend to mix local superstitions with the teachings of the gods. This again may lead to heretical subcults.', cid, 2500)
		Topic[cid] = 0
	elseif msgcontains(msg, 'carlin') then
		npcHandler:say('Carlin is a city of sin and heresy. After the reunion of Carlin with the kingdom, the inquisition will have much work to purify the city and its inhabitants.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'demon') then
		npcHandler:say('Demons exist in many different shapes and levels of power. In general, they are servants of the dark gods and command great powers of destruction.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'darashia') then
		npcHandler:say('Darashia is a godless town full of mislead fools. One day, it will surely share the fate of its sister town Drefia.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'drefia') then
		npcHandler:say('Drefia used to be a city of sin and heresy, just like Carlin nowadays. One day, the gods decided to destroy this town and to erase all evil there.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'venore') then
		npcHandler:say('Venore is somewhat difficult to handle. The merchants have a close eye on our activities in their city and our authority is limited there. However, we will use all of our influence to prevent a second Carlin.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'edron') then
		npcHandler:say('Edron illustrates perfectly why the inquisition is needed and why we need more funds and manpower. ...', cid)
		npcHandler:say('Our agents were on their way to investigate certain occurrences there when some faithless knights fled to some unholy ruins. ...', cid, 3000)
		npcHandler:say('We were unable to wipe them out and the local order of knighthood was of little help. ...', cid, 6000)
		npcHandler:say('It\'s almost sure that something dangerous is going on there, so we have to continue our efforts.', cid, 9000)
		Topic[cid] = 0
	elseif msgcontains(msg, 'ankrahmun') then
		npcHandler:say('Even though they claim differently, this city is in the firm grip of Zathroth and his evil minions. Their whole twisted religion is a mockery of the teachings of our gods ...', cid)
		npcHandler:say('As soon as we have gathered the strength, we should crush this city once and for all.', cid, 4000)
		Topic[cid] = 0
	elseif msgcontains(msg, 'elves') or msgcontains(msg, 'ab\'dendriel') then
		npcHandler:say('Those elves are hardly any more civilised than orcs. They can become a threat to mankind at any time.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'dwarf') or msgcontains(msg, 'kazordoon') then
		npcHandler:say('The dwarfs are allied with Thais but follow their own obscure religion. Although dwarfs keep mostly to themselves, we have to observe this alliance closely.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'druid') then
		npcHandler:say('The druids here still follow the old rules. Sadly, the druids of Carlin have left the right path in the last years.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'sorcerer') then
		npcHandler:say('Those who wield great power have to resist great temptations. We have the burden to eliminate all those who give in to the temptations.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'knight') then
		npcHandler:say('Nowadays, most knights seem to have forgotten the noble cause to which all knights were bound in the past. Only a few have remained pious, serve the gods and follow their teachings.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'paladin') then
		npcHandler:say('It\'s a shame that only a few paladins still use their abilities to further the cause of the gods of good. Too many paladins have become selfish and greedy.', cid)
		Topic[cid] = 0
	end
	return true
end

 
npcHandler:setMessage(MESSAGE_GREET, "Greetings, fellow {believer} |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())