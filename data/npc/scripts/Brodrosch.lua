local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100168
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'farmine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Farmine for 210 gold coins?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =210, destination = {x=33025, y=31553, z=10} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

local cormaya_cost = 160

function creatureSayCallback(cid, type, msg)
        if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("You shouldn\'t miss the experience.",cid)
		Topic[cid] = 0
	end 						
        	
	if (msgcontains(msg, "cormaya") and getPlayerStorageValue(cid,storage) == 3) then
   		npcHandler:say("Do you seek a ride to Cormaya for "..cormaya_cost.." gold coins?",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,cormaya_cost) and Topic[cid] == 1) then
		doTeleportThing(cid,{x=33311, y=31989, z=15})
		doSendMagicEffect({x=33311, y=31989, z=15},CONST_ME_TELEPORT)
		setPlayerStorageValue(cid,storage, 4)
		setPlayerStorageValue(cid,100171,6)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end
	if (msgcontains(msg, "cormaya")) and (getPlayerStorageValue(cid,storage) == -1 or getPlayerStorageValue(cid,storage) >= 4) then
   		npcHandler:say("Do you seek a ride to Cormaya for "..cormaya_cost.." gold coins?",cid)
		Topic[cid] = 2
  	elseif (Topic[cid] == 2) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,cormaya_cost) and Topic[cid] == 2) then
		doTeleportThing(cid,{x=33311, y=31989, z=15})
		doSendMagicEffect({x=33311, y=31989, z=15},CONST_ME_TELEPORT)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end	
	return true	
end

       

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())