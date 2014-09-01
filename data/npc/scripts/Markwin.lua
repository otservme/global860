local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                        npcHandler:onThink() end

local storage2 = 100168 
function greetCallback(cid)
	if getPlayerStorageValue(cid,219) == -1 and string.lower(getCreatureName(getNpcId())) == string.lower("Markwin") then
		selfSay('No! The hornless have reached my city! BODYGUARDS TO ME!', cid)
		pos = getCreaturePosition(getNpcCid())

		local northEast = {x=pos.x+1,y=pos.y-1,z=pos.z}
		local northWest = {x=pos.x-1,y=pos.y-1,z=pos.z}
		local southEast = {x=pos.x+1,y=pos.y+1,z=pos.z}
		local southWest = {x=pos.x-1,y=pos.y+1,z=pos.z}
		local East = {x=pos.x+1,y=pos.y,z=pos.z}
		local West = {x=pos.x-1,y=pos.y,z=pos.z}
		local South = {x=pos.x,y=pos.y+1,z=pos.z}
		local North = {x=pos.x,y=pos.y-1,z=pos.z}
		doSummonCreature('Minotaur Archer', northWest)
		doSummonCreature('Minotaur Archer', West)
		doSummonCreature('Minotaur Archer', southWest)
		doSummonCreature('Minotaur Archer', South)
		doSummonCreature('Minotaur Guard', southEast)
		doSummonCreature('Minotaur Guard', East)
		doSummonCreature('Minotaur Mage', northEast)
		doSummonCreature('Minotaur Mage', North)
		setPlayerStorageValue(cid,219,1)
	end
	return TRUE
end
local Topic = {}

function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end

	function greetCallback(cid)
		Topic[cid] = 0
		return true
	end
        
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end 

    if (msgcontains(msg, 'letter') and getPlayerStorageValue(cid, storage2) == 38) then
		npcHandler:say("A letter from my Moohmy?? Do you have a letter from my Moohmy to me?",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 1 and doPlayerRemoveItem(cid, 2333,1)) then
		npcHandler:say("Uhm, well thank you, hornless beeing.",cid)
		setPlayerStorageValue(cid,storage2,39)
		setPlayerStorageValue(cid,100171,37)
		Topic[cid] = 0
	end 
	Topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Well ... you defeated my guards! Now everything is over! I guess I will have to answer your questions now.')
npcHandler:addModule(FocusModule:new())