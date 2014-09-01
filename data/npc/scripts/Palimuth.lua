local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100011
local azerus_storage = 100013
 
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
	if msgcontains(msg, 'job') and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say("I'm an Augur of the city of Yalahar. My special duty consists of coordinating the efforts to keep the city and its services running.", cid)
	end
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == -1 then
             npcHandler:say("You probably heard that we have numerous problems in different quarters of our city. Our forces are limited, so we really could need some help from outsiders. ...",cid)
             npcHandler:say("Would you like to assist us in re-establishing order in our city?",cid, 5000)
			Topic[cid] = 2
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("I'm pleased to hear that. Rarely we meet outsiders that care about our problems. Most people come here looking for wealth and luxury. ...",cid)
            npcHandler:say("However, I have to tell you that our ranking system is quite rigid. So, I'm not allowed to entrust you with important missions as long as you haven't proven yourself as reliable. ...",cid, 6000)
            npcHandler:say("If you are willing to work for the city of Yalahar, you can ask me for a {mission} any time, be it night or day.",cid, 12000)
            setPlayerStorageValue(cid,storage, 1)
		setPlayerStorageValue(cid, 100163, 1)
			Topic[cid] = 0
		end
	elseif Topic[cid] == 4 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("I must warn you, the quarters are in a horrible state. I strongly advise you to stay on the main roads whenever possible while you get those reports. ...",cid)
            npcHandler:say("You'll find our seven guards at the gates of each quarter. Just ask them for their {report} and they will tell you all you need to know.",cid, 6000)
            setPlayerStorageValue(cid,storage, 4)
		setPlayerStorageValue(cid,9987, 1)
			Topic[cid] = 0
		end
	elseif Topic[cid] == 6 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Welcome my fellow friend. Lets finnish the last {mission}.",cid) 
            setPlayerStorageValue(cid,storage, 11)
			Topic[cid] = 0
		end
		Topic[cid] = 0
--/////////////////////////////////////////Missions///////////////////////////////////////////--
	elseif msgcontains(msg, 'mission') then
		local v = getPlayerStorageValue(cid, storage)
		local v2 = getPlayerStorageValue(cid, azerus_storage)
		if v == 1 then -- Start Mission 1 - The interrogation
		    npcHandler:say("I hope your first mission will not scare you off. Even though, we cut off our sewer system from other parts of the city to prevent the worst, it still has deteriorated in the last decades. ...",cid)
            npcHandler:say("Certain parts of the controls are rusty and the drains are stuffed with garbage. Get yourself a crowbar, loosen the controls and clean the pipes from the garbage. ...",cid, 6000)
            npcHandler:say("We were able to locate the 4 worst spots in the sewers. I will mark them for you on your map so you have no trouble finding them. Report to me when you have finished your {mission}.",cid, 12000)
		    setPlayerStorageValue(cid, storage, 2)
		    setPlayerStorageValue(cid, 100086, 1)
		doPlayerAddMapMark(cid, {x=32823, y=31161, z=8}, 4, "Sewer Problem 1")
		doPlayerAddMapMark(cid, {x=32795, y=31152, z=8}, 4, "Sewer Problem 2")
		doPlayerAddMapMark(cid, {x=32842, y=31250, z=8}, 4, "Sewer Problem 3")
		doPlayerAddMapMark(cid, {x=32796, y=31192, z=8}, 4, "Sewer Problem 4")
		elseif v == 2 then
	       npcHandler:say("So are you done with your work?",cid)
	       Topic[cid] = 3
		elseif v == 3 then
            npcHandler:say("We are still present at each quarter's city wall, even though we can do little to stop the chaos from spreading. Still, our garrisons are necessary to maintain some sort of order in the city. ...",cid)
            npcHandler:say("My superiors ask for a first hand report about the current situation in the single city quarters. I need someone to travel to our garrisons to get the reports from the guards. Are you willing to do that?",cid, 6000)
            setPlayerStorageValue(cid,100086, 4)
		    Topic[cid] = 4
		elseif v == 4 then
	       npcHandler:say("Did you get all the reports my superiors asked for?",cid)
	       Topic[cid] = 7
		elseif v == 5 then
	       npcHandler:say("I did my best to impress my superiors with your accomplishments and it seems that it worked quite well. They want you for their own missions now. ...", cid)
           npcHandler:say("Missions that are more important than the ones you've fulfilled for me. However, before you leave, there are still some things I need to tell you. ...",cid, 6000)
           npcHandler:say("Listen, I can't explain you everything in detail right now and here. You never know who might be eavesdropping. ...",cid, 12000)
           npcHandler:say("I left some notes in the small room there. Get them and read them. Talk to me again when you've read the notes.",cid, 17000)
	       setPlayerStorageValue(cid, storage, 6)
		elseif v == 6 then
		if getPlayerStorageValue(cid,100012) == 1 then
	       npcHandler:say("Now you know as much as we do about the things happening in Yalahar. It's up to you what you do with this information. ...", cid)
           npcHandler:say("Now leave and talk to my superior Azerus in the city centre to get your next mission. I urge you, though, to talk to me whenever he sends you on a new mission. ...",cid, 5000)
           npcHandler:say("I think it is important that you hear my opinion about them. Now hurry. I suppose Azerus is already waiting.",cid, 11000)
           setPlayerStorageValue(cid, storage, 7)
        else
           npcHandler:say("Go get the notes.",cid)
        end
		elseif v == 7 and v2 <= 2 then
	       npcHandler:say("Hurry! Talk with my superior Azerus.",cid)
           npcHandler:releaseFocus(cid)
           npcHandler:resetNpc(cid) 
		elseif v2 == 3 and v <= 7 then
	       npcHandler:say("This quarter has been sealed off years ago. To send someone there poses a high risk to spread the plague. I assume these research notes you've mentioned must be very important. ...",cid)
           npcHandler:say("After all those years it is more than strange that someone shows interest in these notes now. Considering what has happened to the alchemists, it is rather unlikely that they contain harmless information. ...",cid, 4000)
           npcHandler:say("I fear these notes will be used to turn the plague into some kind of weapon. Someone with this plague at his disposal could subdue the whole city by blackmailing. ...",cid, 10000)
           npcHandler:say("I beg you to destroy these notes. Just put them into some burning oven to get rid of them and report that you did not find the notes.",cid, 14500)
           setPlayerStorageValue(cid, storage, 8)
		elseif v2 == 5 and getPlayerStorageValue(cid,100015) == -1 then
	       npcHandler:say("Mr. West is a little paranoid. That's the reason for his immense private army of bodyguards. He could surely be helpful, especially as he rules over the former trade quarter. ....",cid)
           npcHandler:say("If you were able to reach him without killing his henchmen, you could probably convince him that you mean no harm to him. ...",cid, 6000)
           npcHandler:say("That would certainly cement our relationship without any needless bloodshed. Perhaps you could use the way through the sewers to avoid his men. ...",cid, 11000)
           npcHandler:say("Mr. West is not a bad man. We should be able to work out some plans to reconstruct the city's safety as soon as he overcomes his paranoia towards us.",cid, 17000)
           setPlayerStorageValue(cid, storage, 9)
	   setPlayerStorageValue(cid, 100086, 10)
           setPlayerStorageValue(cid,100015, 1)
		elseif getPlayerStorageValue(cid,100015) >= 1 and getPlayerStorageValue(cid,100015) <= 2 and getPlayerStorageValue(cid, 100046) == -1 then
		if getPlayerStorageValue(cid,100015) == 2 then 
	       npcHandler:say("You did quite well in gaining a new friend who will work together with us. ...",cid)
           npcHandler:say("I'm sure he'll still try to gain some profit but that's still better than his former one-man rule during which he dictated his own laws.",cid, 4000)
	   setPlayerStorageValue(cid,100015, 4) 
	   setPlayerStorageValue(cid, 100086, 11)
		setPlayerStorageValue(cid, 100163, 6)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end  
	elseif v2 == 7 and getPlayerStorageValue(cid,100017) == -1 then
	   npcHandler:say("Warbeasts? Is this true? People are already starving. ...",cid)
           npcHandler:say("How can we afford to feed an army of hungry beasts? They will not only strengthen the power of the Yalahari over the citizens, they also mean starvation and deathfor the poor. ...",cid, 3000)
           npcHandler:say("Instead of breeding warbeasts, this druid should breed cattle to feed our people. Please I beg you, convince him to do that!",cid, 9000)
	   setPlayerStorageValue(cid, 100086, 13)
           setPlayerStorageValue(cid,100043, 1)
	   setPlayerStorageValue(cid,100017, 1)
	elseif getPlayerStorageValue(cid,100017) == 1 or getPlayerStorageValue(cid,100017) == 2 and getPlayerStorageValue(cid,100047) == -1 then
	if getPlayerStorageValue(cid,100017) == 2 then 
	       npcHandler:say("These are great news indeed. The people of Yalahar will be grateful. The Yalahari probably not, so take care of yourself.",cid)
	       setPlayerStorageValue(cid,100017, 3)
		setPlayerStorageValue(cid, 100086, 17)
		setPlayerStorageValue(cid, 100163, 7)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
           end
		elseif v2 == 9 and getPlayerStorageValue(cid,100019) == -1 then
	       npcHandler:say("What a sick idea to misuse tortured souls to power some device! Though, this charm might be useful to free these poor souls. ...",cid)
           npcHandler:say("Please capture the souls as you have been instructed and then bring the charm to me. I will see to it that the souls are freed to go to the afterlife in peace.",cid, 5000)
           setPlayerStorageValue(cid,100039, 1)
	    setPlayerStorageValue(cid,100019, 1)
		elseif getPlayerStorageValue(cid,100019) == 1 and getPlayerStorageValue(cid,100049) == -1 then
		if getPlayerStorageValue(cid,100040) == 1 then 
		if doPlayerTakeItem(cid, 9742, 1) then
           npcHandler:say("I thank you also in the name of these poor lost souls. I will send the charm to a priest who is able to release them. ...",cid)
           npcHandler:say("Tell the Yalahari that the charm was destroyed by the energy it contained.",cid, 5500)
	   setPlayerStorageValue(cid,100019, 2)
	   setPlayerStorageValue(cid,100048, 1)
	   setPlayerStorageValue(cid, 100086, 18)
		setPlayerStorageValue(cid, 100163, 8)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
        else
           npcHandler:say("There is no charm with you. Please return when you got the charm.", cid) 
        end
        elseif v2 == 11 and getPlayerStorageValue(cid,100021) == -1 then
	       npcHandler:say("The quara are indeed a threat. Yet, they are numerous and reproduce quickly. Slaying some of them will only enrage them even more. ...",cid)
           npcHandler:say("The quara have been there for many generations. They have never threatened anyone who stayed out of their watery realm. ...",cid, 5500)
           npcHandler:say("It would be much more useful to find out what the quara are so upset about. Better avoid slaying their leaders as this will only further the animosities.",cid, 10000)
	   setPlayerStorageValue(cid,100021, 1) 
		setPlayerStorageValue(cid, 100086, 21)
		elseif getPlayerStorageValue(cid,100050) == -1 and getPlayerStorageValue(cid,100021) == 1 or getPlayerStorageValue(cid,100021) == 2 or getPlayerStorageValue(cid,100021) == 3 then
		if getPlayerStorageValue(cid,100021) == 3 then 
	       npcHandler:say("Oh no! So that's the reason for the quara attacks! I will do my best to close these sewage pipes. We will have to use other drains.",cid)
		setPlayerStorageValue(cid,100021, 4)
		setPlayerStorageValue(cid, 100022, 2)
		setPlayerStorageValue(cid, 100086, 23)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
           end 
        elseif v2 == 12 and getPlayerStorageValue(cid,100037) == -1 then
	       npcHandler:say("The constant unrest in the city is to a great extent caused by the lack of food. Weapons will only serve to suppress the poor. ...",cid)
           npcHandler:say("The factory you were sent to was once used for the production of food. Somewhere in the factory you might find an old pattern crystal for the production of food. ...",cid, 4500)
           npcHandler:say("If you use it on the controls instead of the weapon pattern, you will ensure that our people are supplied with the desperately needed food.",cid,10500)
		setPlayerStorageValue(cid, 100086, 24)
           setPlayerStorageValue(cid,100037, 1)
        elseif v2 == 14 and getPlayerStorageValue(cid, 100045) == -1 then
	       npcHandler:say("Well, what can I say? You have to make a decision. You've seen the differences between my goals and those of Azerus. Make up your mind, but choose wisely!",cid)
	       setPlayerStorageValue(cid,storage,10)
		setPlayerStorageValue(cid,100045,1)
        elseif v == 10 then
	       npcHandler:say("So do you want to side with me?",cid)
	       Topic[cid] = 6
        elseif v == 11 then
	       npcHandler:say("I cannot tell you how we acquired this information, but we have heard that a circle of Yalahari is planning some kind of ritual. ...",cid)
           npcHandler:say("They plan to create a portal for some powerful demons and to unleash them in the city to 'purge' it once and for all. ...",cid, 5000)
           npcHandler:say("I doubt those poor fools will be able to control such entities. I can't figure out how they came up with such an insane idea, but they have to be stopped. ...",cid, 10000)
           npcHandler:say("The entrance to their inner sanctum has been opened for you. Please hurry and stop them before it's too late. Be prepared for a HARD battle! Better gather some friends to assist you.",cid, 15500)
           setPlayerStorageValue(cid,storage,12)
		setPlayerStorageValue(cid, 100086, 29)
		setPlayerStorageValue(cid, 100163, 10)
		elseif v == 12 then
		if getPlayerStorageValue(cid,100051) == 1 then 
	       npcHandler:say("So the Yalahari that opposed us are dead or fled from the city. This should bring us more stability and perhaps a true chance to rebuild the city. ...",cid)
	       npcHandler:say("Still, I wonder from where they gained some of the Yalahari secrets. Did they find some source of knowledge? ...",cid, 3000)
	       npcHandler:say("And if so, is this source still around so that we can use it for the benefit of our city? What really troubles me is that none of those false Yalahari had the personality of a great leader. ...",cid, 6000)
	       npcHandler:say("Quite the opposite, they were opportunistic and not exactly bold. Perhaps they were led by some greater power which stayed behind the scenes. ...",cid, 10000)
	       npcHandler:say("I'm afraid we have not seen the last chapter of Yalahar's drama. But anyhow, I wish to thank you for putting your life at stake for our cause. ...",cid, 13000)
	       npcHandler:say("I allow you to enter the Yalaharian treasure room. I'm sure that you can put what you find inside to better use than them. Choose one chest, but think before taking one! ...",cid, 16000)
	       npcHandler:say("Also, take this Yalaharian outfit. Depending on which side you chose previously, you can also acquire one specific addon. Thank you again for your help.",cid, 19500)
	       setPlayerStorageValue(cid,100051,2)   
	       setPlayerStorageValue(cid,storage,13)
	       setPlayerStorageValue(cid, azerus_storage, 17)
	       setPlayerStorageValue(cid,100052, 1)
		setPlayerStorageValue(cid, 100086, 31)
		setPlayerStorageValue(cid, 100163, 11)
		AddStageExp(cid,250000)
        else
           npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
        end
        elseif v == 13 then
           npcHandler:say("I'm afraid we have not seen the last chapter of Yalahar's drama but I don't have any more missions for you.",cid)
        end
--/////////////////////////////////////////Answers///////////////////////////////////////////--
	elseif Topic[cid] == 3 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid,100033) == 1 and getPlayerStorageValue(cid,100034) == 1 and getPlayerStorageValue(cid,100035) == 1 and getPlayerStorageValue(cid,100036) == 1 then
			    npcHandler:say("Thank you very much. You have no idea how hard it was to find someone volunteering for that job. If you feel ready for further {missions}, just tell me.",cid)
				setPlayerStorageValue(cid, storage, 3)
				setPlayerStorageValue(cid, 100086, 3)
				setPlayerStorageValue(cid, 100163,2)
				Topic[cid] = 0
			else
				npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 7 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid,9987) == 1 and getPlayerStorageValue(cid,9988) == 1 and getPlayerStorageValue(cid,9989) == 1 and getPlayerStorageValue(cid,9990) == 1 and getPlayerStorageValue(cid,9992) == 1 and  getPlayerStorageValue(cid,9993) == 1 and getPlayerStorageValue(cid,9994) == 1 then
			    npcHandler:say("Excellent! My superiors will be pleased to get these reports. I will for sure emphasise your efforts in this mission. Please come back soon to see if there are any more {missions} available for you.",cid)
				setPlayerStorageValue(cid, storage, 5)
				setPlayerStorageValue(cid,100086, 6)
				setPlayerStorageValue(cid, 100163, 3)
				Topic[cid] = 0
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