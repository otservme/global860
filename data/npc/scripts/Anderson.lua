local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Anderson from the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'anderson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'svenson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'carlson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'nielson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are ferrymen. We transport goods and passengers to the Ice Islands."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are ferrymen. We transport goods and passengers to the Ice Islands."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'ferry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'ferries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'water'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board our ferries."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, and Vega, and back to Tibia."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, and Vega, and back to Tibia."})
keywordHandler:addKeyword({'round'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The fee for the trip back to Tibia is included."})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We serve the routes to Senja, Folda, and Vega, and back to Tibia."})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We serve the routes to Senja, Folda, and Vega, and back to Tibia."})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This island is Senja."})

    -- Emporia VAPus
    local travelNode = keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Tibia for free?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32235, y=31675, z=7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

    local travelNode = keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Folda for 10 gp?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 10, destination = {x=32045, y=31580, z=7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

    local travelNode = keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Vega for 10 gp?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 10, destination = {x=32024, y=31692, z=7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
        
    keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To Folda, Vega or Tibia?'})
    keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I work on this ferry.'})
    keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I work on this ferry.'})
    -- Emporia VAPus

npcHandler:addModule(FocusModule:new())