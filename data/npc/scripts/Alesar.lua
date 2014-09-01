local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100057
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is none of your business."})
keywordHandler:addKeyword({'alesar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is my name. So what!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What does it look like, fool? I'm a guard! But I won't sell you anything until Malor orders me otherwise."})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I won't sell you anything, human. Malor doesn't want me to trade with strangers."})
keywordHandler:addKeyword({'permission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I won't sell you anything, human. Malor doesn't want me to trade with strangers."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't you dare mention Daraman in my presence, human. I am through with his insidious lies and through with your accursed race!"})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we will teach your race a lesson it will never forget."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We need a strong king to unite us in our struggle against the humans."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we djinn will rid this world of evil."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The pharaoh in Ankrahmun is a dangerous fool. Just your typical human, in other words."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So?"})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I like them. They are peaceful, but if they are provoked they fight ferociously. And they are know to eat humans!"})
keywordHandler:addKeyword({"kha'zeel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These mountains are our refuge from those pesky humans. Too bad there are always some who come up here anyway. You, for example."})
keywordHandler:addKeyword({"kha'labal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The desert Kha'labal was once a beautiful land, but it was devastated in the course of the war. Damn humans! This is all your fault!"})
keywordHandler:addKeyword({'melchior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I remember him. He was a greedy, double-dealing hyena. As far as I know his bleached bones are now lying somewhere in the Kha'labal."})
keywordHandler:addKeyword({'djema'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Djema? Well - I suppose she is the only human I still like. But she has been brought up by djinns. Who knows - perhaps humans can learn."})
keywordHandler:addKeyword({"baa'leal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Baa'leal is Malor's lieutenant. Unflinchingly loyal, but not quite as clever as he thinks he is."})
keywordHandler:addKeyword({"bo'ques"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I miss Bo'ques' cooking, but not his pompous airs and graces."})
keywordHandler:addKeyword({"fa'hradin"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fa'hradin, that old cynic is way too smart to believe in Daraman's lies. He should reconsider his loyalties."})
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
local p = getCreatureName(cid) 
   local v = getPlayerStorageValue(cid, storage)
   if npcHandler:isFocused(cid) then
	if msgcontains(msg, 'no') and Topic[cid] == 2 then
		npcHandler:say("Dont disturb me then.",cid)
		Topic[cid] = 1
	elseif msgcontains(msg, 'no') and Topic[cid] >= 4 then
        npcHandler:say("Dont disturb me then.",cid)
		Topic[cid] = 3
		end
	end
	if (msgcontains(msg, "DJANNI'HAH")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, storage) == -1 then
    if  getPlayerStorageValue(cid, 100054) == 2 and getPlayerStorageValue(cid, 9030) == 1 then
		npcHandler:say("What do you want from me, "..p.."?", cid)
        npcHandler:addFocus(cid)
		Topic[cid] = 1 
    end 
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == -1  then
			npcHandler:say("So Baa'leal thinks you are up to do a mission for us? ...",cid)
			npcHandler:say("I think he is getting old, entrusting human scum such as you are with an important mission like that. ...",cid, 1000)
			npcHandler:say("I don't understand why you haven't been slaughtered right at the gates. ...",cid, 2500)
			npcHandler:say("Are you prepared to embark on a dangerous mission for us?",cid, 3500)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') and getPlayerStorageValue(cid, storage) == -1  then
			npcHandler:say("All right then, human. Have you ever heard of the {Tears of Daraman}? ...",cid)
			npcHandler:say("They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...",cid, 1000)
			npcHandler:say("If you want to learn more about these gemstones don't forget to visit our library. ...",cid, 2000)
			npcHandler:say("Anyway, one of them is enough to create thousands of our mighty djinn blades. ...",cid, 3000)
			npcHandler:say("Unfortunately my last gemstone broke and therefore I'm not able to create new blades anymore. ...",cid, 4000)
			npcHandler:say("To my knowledge there is only one place where you can find these gemstones - I know for a fact that the Marid have at least one of them. ...",cid, 5000)
			npcHandler:say("Well... to cut a long story short, your mission is to sneak into Ashta'daramai and to steal it. ...",cid, 6000)
			npcHandler:say("Needless to say, the Marid won't be too eager to part with it. Try not to get killed until you have delivered the stone to me.",cid, 7000)
			setPlayerStorageValue(cid,storage, 1)
			setPlayerStorageValue(cid, 100062, 6)
		end
		Topic[cid] = 0
	end
	if (msgcontains(msg, "DJANNI'HAH")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, storage) == 1 then
    if getPlayerStorageValue(cid, storage) == 1 and getPlayerStorageValue(cid, 9030) == 1 then
		npcHandler:say("What do you want from me, "..p.."?", cid)
        npcHandler:addFocus(cid)
		Topic[cid] = 3 
    end 
	elseif Topic[cid] == 3 then
		if msgcontains(msg, 'mission') then
			npcHandler:say("Did you find the tear of Daraman?",cid)
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 then
		if msgcontains(msg, 'yes') and doPlayerTakeItem(cid, 2346, 1) then
			npcHandler:say("So you have made it? You have really managed to steal a Tear of Daraman? ...",cid)
			npcHandler:say("Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...",cid, 1000)
			npcHandler:say("Nevermind. I hate to say it, but it you have done us a favour, human. That gemstone will serve us well. ...",cid, 3000)
			npcHandler:say("Baa'leal, wants you to talk to {Malor} concerning some {new mission.} ...",cid, 4500)
			npcHandler:say("Looks like you have managed to extended your life expectancy - for just a bit longer.",cid, 5500)
			setPlayerStorageValue(cid,storage, 2)
			setPlayerStorageValue(cid, 100062, 8)
			setPlayerStorageValue(cid,100159, 3)
		else
		    npcHandler:say("You better don't return here until you've got the Tear.", cid)
		    end
        Topic[cid] = 0
		end
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("Finally.",cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		Topic[cid] = 0
	    end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)