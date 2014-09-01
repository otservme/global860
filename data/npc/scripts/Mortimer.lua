local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100004
 
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
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'nautical map') and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say("Now this is getting ridiculous. That map has been lying around, collecting dust for years and now after those madmen stole it, someone else shows up asking for it. ...", cid)
		npcHandler:say("However, the map was completely useless because it only showed the waters around some remote piece of rock in the middle of the sea. We only stored it here for completeness. ...", cid, 4000)
		npcHandler:say("Some days ago some wannabe pirates turned up and threatened to kill me if I did not give them a map. ...", cid, 8000)
		npcHandler:say("As far as I could make out between their boasting and threatening they wanted to start out as pirates and thought it would be easier to start by stealing some maps before getting a whole ship. The only map I had here was that worthless nautical map. ...", cid, 11000)
		npcHandler:say("Luckily enough they seemed to have no idea how to read such maps and were pleased to get a map with some water and lines on it. ...", cid, 16000)
		npcHandler:say("So they took the map, but not before they had ruined the interior decorating and made me dance and sing pirate songs for them. ...", cid, 19000)
		npcHandler:say("I tell you something: If you manage to find those bandits and teach them a lesson you can keep the map. It's worthless anyway. As far as I could make out their hideout is somewhere to the east. ...", cid, 22500)
		npcHandler:say("They referred to it as 'the cave' and said the entrance is hidden. They also mentioned sand and two mossy stones. I hope that helps. I wish you luck.", cid, 27500)
		setPlayerStorageValue(cid, storage, 1)
		setPlayerStorageValue(cid,100063, 16)
		end
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())