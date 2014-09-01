local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100167
local storage2 = 100168
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Captain Bluebear from the Royal Tibia Line."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Royal Tibia Line connects all seaside towns of Tibia."})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Royal Tibia Line connects all seaside towns of Tibia."})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Royal Tibia Line connects all seaside towns of Tibia."})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Royal Tibia Line connects all seaside towns of Tibia."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Royal Tibia Line connects all seaside towns of Tibia."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passenger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Thais, Svargrond, Gengia, Pyre, Oken, Alaska e Vilarejo."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Thais, Svargrond, Gengia, Pyre, Oken, Alaska e Vilarejo."})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Thais, Svargrond, Gengia, Pyre, Oken, Alaska e Vilarejo."})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Thais, Svargrond, Gengia, Pyre, Oken, Alaska e Vilarejo."})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Thais, Svargrond, Gengia, Pyre, Oken, Alaska e Vilarejo."})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Thais, Svargrond, Gengia, Pyre, Oken, Alaska e Vilarejo."})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, but we don't serve the routes to the Ice Islands."})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, but we don't serve the routes to the Ice Islands."})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, but we don't serve the routes to the Ice Islands."})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, but we don't serve the routes to the Ice Islands."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm not sailing there. This route is afflicted by a ghostship! However I've heard that Captain Fearless from Venore sails there."})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many people who sailed to Darashia never returned because they were attacked by a ghostship! I'll never sail there!"})

        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        
	local travelNode = keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Ab\'dendriel for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32734, y=31668, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
			
		
local travelNode = keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Thais for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32310, y=32210, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'alaska'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Alaska for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=31663, y=31807, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
        
	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Edron for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33173, y=31764, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
			
			local travelNode = keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Venore for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32954, y=32022, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
        
	local travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Port Hope for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32527, y=32784, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Svargrond for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32341, y=31108, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

	local travelNode = keywordHandler:addKeyword({'liberty bay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Liberty Bay for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32285, y=32892, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
			
	local travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Yalahar for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32816, y=31272, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
        
	local travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Darashia for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33289, y=32480, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
			
	local travelNode = keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Ankrahmun free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33092, y=32883, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
       

function greetCallback(cid)
	Topic[cid] = 0
	return true
end

local carlin_cost = 0

function creatureSayCallback(cid, type, msg)
        if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("We would like to serve you some time.",cid)
		Topic[cid] = 0
	end 			
        	
	if (msgcontains(msg, "carlin") and getPlayerStorageValue(cid,storage) == 1 and getPlayerStorageValue(cid,storage2) == -1) then
   		npcHandler:say("Do you want to sail to Carlin for free?",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,carlin_cost) and Topic[cid] == 1) then
		doTeleportThing(cid,{x=32387, y=31820, z=6})
		doSendMagicEffect({x=32387, y=31820, z=6},CONST_ME_TELEPORT)
		setPlayerStorageValue(cid,storage2, 1)
		setPlayerStorageValue(cid,100171,3)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end
	if (msgcontains(msg, "carlin")) and (getPlayerStorageValue(cid,storage) == -1) then
   		npcHandler:say("Do you want to sail to Carlin for free?",cid)
		Topic[cid] = 2
  	elseif (Topic[cid] == 2) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,carlin_cost) and Topic[cid] == 2) then
		doTeleportThing(cid,{x=32387, y=31820, z=6})
		doSendMagicEffect({x=32387, y=31820, z=6},CONST_ME_TELEPORT)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end
	if (msgcontains(msg, "carlin")) and (getPlayerStorageValue(cid,storage) >= 1 and getPlayerStorageValue(cid,storage2) >= 1) then
   		npcHandler:say("Do you want to sail to Carlin for free?",cid)
		Topic[cid] = 3
  	elseif (Topic[cid] == 3) then
	if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,carlin_cost) and Topic[cid] == 3) then
		doTeleportThing(cid,{x=32387, y=31820, z=6})
		doSendMagicEffect({x=32387, y=31820, z=6},CONST_ME_TELEPORT)
	else
		npcHandler:say("You dont have enough of gold.",cid)
		end
	end	
	return true	
end
       

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())