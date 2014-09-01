local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                        npcHandler:onThink() end

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
 
function greetCallback(cid)
	if getPlayerStorageValue(cid,218) == -1 and string.lower(getCreatureName(getNpcId())) == string.lower("The Orc King") then
		selfSay('Arrrrgh! A dirty paleskin! Kill them my guards!', cid)
		pos = getCreaturePosition(getNpcCid())

		local northEast = {x=pos.x+1,y=pos.y-1,z=pos.z}
		local northWest = {x=pos.x-1,y=pos.y-1,z=pos.z}
		local southEast = {x=pos.x+1,y=pos.y+1,z=pos.z}
		local southWest = {x=pos.x-1,y=pos.y+1,z=pos.z}
		local East = {x=pos.x+1,y=pos.y,z=pos.z}
		local West = {x=pos.x-1,y=pos.y,z=pos.z}
		local South = {x=pos.x,y=pos.y+1,z=pos.z}
		local North = {x=pos.x,y=pos.y-1,z=pos.z}
        doAddCondition(cid, condition)
		doSummonCreature('Orc Warlord', northWest)
		doSummonCreature('Orc Warlord', West)
		doSummonCreature('Orc Leader', southWest)
		doSummonCreature('Orc Leader', South)
		doSummonCreature('Orc Leader', southEast)
		doSummonCreature('Slime', East)
		doSummonCreature('Slime', northEast)
		doSummonCreature('Slime', North)
		setPlayerStorageValue(cid,218,1)
	end
	return TRUE
end
local talkstor = 9041
local Topic = {}
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

if msgcontains(msg, "lamp") and getPlayerStorageValue(cid,9032) == 5 and getPlayerStorageValue(cid,100058) == -1 then
   npcHandler:say("I can sense your evil intentions to imprison a djinn! You are longing for the lamp, which I still possess. ...",cid)
   npcHandler:say("Who do you want to trap in this cursed lamp?",cid, 5000)
   setPlayerStorageValue(cid,talkstor, 1)
elseif msgcontains(msg, "malor") and getPlayerStorageValue(cid,talkstor) == 1 then
   npcHandler:say("I was waiting for this day! Take the lamp and let Malor feel my wrath!",cid)
   setPlayerStorageValue(cid,9032, 6)
   setPlayerStorageValue(cid,talkstor, 2)
   doPlayerAddItem(cid,2344,1)
   setPlayerStorageValue(cid, 100064, 12) 
end
if msgcontains(msg, "lamp") and getPlayerStorageValue(cid,100058) == 1 then
   npcHandler:say("I can sense your evil intentions to imprison a djinn! You are longing for the lamp, which I still possess. ...",cid)
   npcHandler:say("Who do you want to trap in this cursed lamp?",cid, 5000)
   Topic[cid] = 1
elseif Topic[cid] == 1 then
if msgcontains(msg, "malor") and getPlayerStorageValue(cid,100058) == 1 then
   npcHandler:say("I was waiting for this day! Take the lamp and let Malor feel my wrath!",cid)
   setPlayerStorageValue(cid,100058, 2)
   doPlayerAddItem(cid,2344,1)
   setPlayerStorageValue(cid, 100062, 10)
   Topic[cid] = 0
end
Topic[cid] = 0
end
   return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Harrrrk! You think you are strong now? You shall never escape my wrath! I am immortal!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'We will meet again.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Yes, flee this place, but you will never escape my revenge!')
npcHandler:addModule(FocusModule:new())