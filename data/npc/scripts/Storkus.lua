local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic, storage, sorrymessage = {}, 9020, "Sorry, ye' don't have enough tokens to progress in rank..."
local ranks = {
	[0] = "You don't have any rank yet.",
	[1] = "You are fluke rank now.",
	[2] = "You are lucky rank now.",
	[3] = "You are determined rank now.",
	[4] = "You are painstaking rank now.",
	[5] = "You are obliterative rank now.",
	[6] = "You are razing rank now."
}
local tokens = {
	[0] = {"Ye' brought the token needed to advance to the first vampire hunter rank. I consider that a fluke, but still, congrats! Let me share some of my experience with ye'.", 1, 1000},
	[1] = {"Ye' brought the four tokens needed to advance to the second vampire hunter rank. Pretty lucky ye' are! Let me share some of my experience with ye'.", 4, 5000},
	[2] = {"Ye' brought the five tokens needed to advance to the third vampire hunter rank. Wow, you're pretty determined! Let me share some of my experience with ye'.", 5, 10000},
	[3] = {"Ye' brought the ten tokens needed to advance to the fourth vampire hunter rank. You're absolutely painstaking! Let me share some of my experience with ye'.", 10, 20000},
	[4] = {"Ye' brought the thirty tokens needed to advance to the fifth vampire hunter rank. You're cpletely obliterative, kid! Let me share some of my experience with ye'.", 30, 50000},
	[5] = {"Ye' brought the fifty tokens needed to advance to the last vampire hunter rank. Now that's something. You're razing-amazing! Let me share some of my experience and a little something with ye'!", 50, 100000}
}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "token") then
		local cpl = getPlayerStorageValue(cid, storage) == 6
		npcHandler:say(cpl and "You are the highest vampire hunter rank now." or "Would ye' like to give me vampire tokens?", cid)
		Topic[cid] = cpl and 0 or 1
	elseif msgcontains(msg, "rank") then
		npcHandler:say(ranks[math.max(0, getPlayerStorageValue(cid, storage))], cid)
		Topic[cid] = 0
	elseif Topic[cid] == 1 then
		local str = getPlayerStorageValue(cid, storage)
		if msgcontains(msg, "yes") then
			local mode = str < 1 and 0 or str
			if doPlayerRemoveItem(cid, 9020, tokens[mode][2]) then
				npcHandler:say(tokens[mode][1], cid)
				setPlayerStorageValue(cid, storage, mode + 1)
				doPlayerAddExp(cid, tokens[mode][3])
				if tokens[mode][4] then
					doPlayerAddItem(cid, 9019, 1)
				end
			else
				npcHandler:say(sorrymessage, cid)
			end
		else
			npcHandler:say("Sure, come back when ye'll have enough tokens.", cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, "job") then
		npcHandler:say("I used to be a carpenter, but that was ages ago. Now I'm a vampire hunter.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "name") then
		npcHandler:say("My name is Storkus Dustmaker, son of Fire from the Savage Axes.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "vampire") and msgcontains(msg, "hunter") then
		npcHandler:say("Yeah, that's my profession. If ye' want to learn more about it, ye will have to get some field experience. Nothing I could tell ye' would prepare ye' for the real thing.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "inquisition") or msgcontains(msg, "mission") then
		local v = getPlayerStorageValue(cid, 92224)
		if v == -1 then
			npcHandler:say("As long as they're helpful, I'm not asking questions, ye' know?", cid)
			Topic[cid] = 0
		elseif v == 1 then
			npcHandler:say("So they've sent another one? I just hope ye' better than the last one. Are ye' ready for a mission?", cid)
			Topic[cid] = 2
		elseif v >= 2 and v <= 21 then
			npcHandler:say("So far ye've brought me "..getPlayerItemCount(cid,5905).." of 20 vampire dusts. Do ye' have any more with ye'?", cid)
			Topic[cid] = 3
		elseif v == 22 or v == 23 then
		    npcHandler:say("While ye' were keeping the lower ranks busy I could get valuable information about some vampire lords. ...", cid)
		    npcHandler:say("One of them is hiding somewhere beneath the green claw swamp. I expect ye' to find him and kill him. ...", cid, 3500)
			npcHandler:say("But be warned: without good preparation ye' might get into trouble. I hope for ye' he will be sleeping in his coffin when ye' arrive. ...", cid, 7000)
			npcHandler:say("Before ye' open his coffin and drag that beast out to destroy it, I advise ye' to place some garlic necklaces on the stone slabs next to his coffin. That will weaken himconsiderably. ...", cid, 11000)
			npcHandler:say("Bring me his {ring} as a proof. And now hurry and good hunt to ye'.", cid, 15500)
			setPlayerStorageValue(cid,92224, 24)
		elseif v == 24 or v == 25 then
			npcHandler:say("Have you brought me the vampire lord's ring?", cid)
			Topic[cid] = 4
	end
	elseif Topic[cid] == 2 and msgcontains(msg, 'yes') then
		npcHandler:say("As they might have told ye', I'm a vampire hunter. If ye' want to be of any help, ye' can assist me with some of my tasks and bring me 20 ounces of vampire dust. This gives me some time to concentrate on a bigger project.", cid)
		setPlayerStorageValue(cid, 100078, 9)
		setPlayerStorageValue(cid, 92224, 2)
		Topic[cid] = 0
	elseif Topic[cid] == 3 and msgcontains(msg, 'yes') then
		local n = getPlayerItemCount(cid, 5905)
		if n > 0 then
			local cur = getPlayerStorageValue(cid, 92224)
			local remove = math.min(22 - cur, n)
			doPlayerRemoveItem(cid, 5905, remove)
			setPlayerStorageValue(cid, 92224, cur + remove)
			if cur + remove == 22 then
                npcHandler:say("Fine, you're done! Ye' should talk to me about your {mission} again now.",cid)
				setPlayerStorageValue(cid, 100078, 10)
			else
				npcHandler:say("Come back when you brought me 20 vampire dusts.", cid)
			end
		else
			npcHandler:say("Come back when you brought me 20 vampire dusts.", cid)
		end
		Topic[cid] = 0
	elseif Topic[cid] == 4 and msgcontains(msg, 'yes') then
    if doPlayerRemoveItem(cid, 8752, 1) then
		npcHandler:say("Ding, dong, the vampire is dead, eh? So I guess ye' can return to {Henricus} and tell him that ye' finished your job here. I'm quite sure he has some more challenging task up his sleeve. ...", cid)
		npcHandler:say("One more thing before ye' leave: I already mentioned the master vampires. ...",cid, 4000)
		npcHandler:say("They are quite hard to find. If ye' stumble across one of them and manage to kill him, he will surely drop some token that proves his death. Bring me these tokens. ..",cid, 6500)
		npcHandler:say("If ye' kill enough of them, I might have a little surprise for ye'.",cid, 10000)
		setPlayerStorageValue(cid, 92224, 26)
		setPlayerStorageValue(cid, 100078, 12)
	else
	    npcHandler:say("There is no vampire ring.", cid)
	end
	end
	return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye!")
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())