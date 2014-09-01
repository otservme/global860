local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function greetCallback(cid)
	talkState[cid] = 0
	return true
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storage = 42337
	local storage2 = 42325
	local move = {x=33365, y=31204, z=8}
	local locationcrate = {x=33356, y=31181, z=8, stackpos = 255}
	local outfit = {lookType = getPlayerStorageValue(cid, 3431), lookHead = getPlayerStorageValue(cid, 3432), lookAddons = getPlayerStorageValue(cid, 3433), lookLegs = getPlayerStorageValue(cid, 3434), lookBody = getPlayerStorageValue(cid, 3435), lookFeet = getPlayerStorageValue(cid, 3436)}

		if (getPlayerStorageValue(cid,storage2) == 0) then
			
			if(msgcontains(msg, 'exit') and talkState[talkUser] < 1) then
				npcHandler:say({'Oh of course, may I show you around a bit before? You want to go straight to the exit? Would you please follow me. Oh right, I am terribly sorry but THERE IS NONE. Will you finally give it up please?'}, cid)
				talkState[talkUser] = 1
		
			elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
				npcHandler:say({'You are starting to get on my nerves. Is this the only topic you know?'}, cid)
				talkState[talkUser] = 2
				
			elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then	
				npcHandler:say({'Muhahaha. Then I will give you a test. How many years do you think have I been here? {89}, {164} or {278?}'}, cid)
				talkState[talkUser] = 3
				
			elseif(msgcontains(msg, '278') and talkState[talkUser] == 3) then	
				npcHandler:say({'Correct human, and that is not nearly how high you would need to count to tell all the lost souls I\'ve seen dying here. I AM PERPETUAL. Muahahaha.'}, cid)
				talkState[talkUser] = 4
				
			elseif(msgcontains(msg, 'exit') and talkState[talkUser] == 4) then	
				npcHandler:say({'Oh, you mean - if I have ever been out of here in those 278 years? Well, I - I can\'t remember. No, I can\'t remember. Sorry'}, cid)
				talkState[talkUser] = 5	

			elseif(msgcontains(msg, 'exit') and talkState[talkUser] == 5) then	
				npcHandler:say({'No, I really can\'t remember. I enjoyed my stay here so much that I forgot how it looks outside of this hole. Outside. The air, the sky, the light. Oh well... well.'}, cid)
				talkState[talkUser] = 6
				
			elseif(msgcontains(msg, 'exit') and talkState[talkUser] == 6) then	
				npcHandler:say({'Oh yes, yes. I... I never really thought about how you creatures feel in here I guess. I... just watched all these beings die here. ...'}, cid)
				talkState[talkUser] = 7	

			elseif(msgcontains(msg, 'exit') and talkState[talkUser] == 7) then	
				npcHandler:say({'Oh, excuse me of course, you... wanted to go. Like all... the others. I am sorry, so sorry. You... you can leave. Yes. You can go. You are free. I shall stay here and help every poor soul which ever gets thrown in here from this day onward. ...'}, cid)
				talkState[talkUser] = 8
				
			elseif(msgcontains(msg, 'exit') and talkState[talkUser] == 8) then	
				npcHandler:say({'Alright, as I said you are free now. There will not be an outside for the next three centuries, but you - go. ...','Oh and I recovered the strange crate you where hiding in, it will wait for you at the exit since you can\'t carry it as... a beetle, muhaha. Yes, you shall now crawl through the passage as a beetle. There you go.'}, cid)
				setPlayerStorageValue(cid, storage, 1)
				setPlayerStorageValue(cid, storage2, 1)
				setPlayerStorageValue(cid, 3431, getCreatureOutfit(cid).lookType)
				setPlayerStorageValue(cid, 3432, getCreatureOutfit(cid).lookHead)
				setPlayerStorageValue(cid, 3433, getCreatureOutfit(cid).lookAddons)
				setPlayerStorageValue(cid, 3434, getCreatureOutfit(cid).lookLegs)
				setPlayerStorageValue(cid, 3435, getCreatureOutfit(cid).lookBody)
				setPlayerStorageValue(cid, 3436, getCreatureOutfit(cid).lookFeet)
				doTeleportThing(cid, move, TRUE)
				doSetMonsterOutfit(cid, "Lancer Beetle", -1)
				talkState[talkUser] = 0
			end	
		
		elseif (getPlayerStorageValue(cid,storage) == 1) then
		
			if(msgcontains(msg, 'exit')) then	
				npcHandler:say({'It\'s you, why did they throw you in here again? Anyway, I will just transform you once more. I also recovered your crate which will wait for you at the exit. There, feel free to go.'}, cid)
				doSetMonsterOutfit(cid, "Lancer Beetle", -1)
				doTeleportThing(cid, move, TRUE)
			end	
		end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Another visitor to this constricted, cosy, calm realm, perfect except for an {exit}. Muhaha.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())