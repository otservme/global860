local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Dalbrect Windtrouser, of the once proud windtrouser family."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am merely a humble fisher now that nothing is left of my noble legacy."})
keywordHandler:addKeyword({'capt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am merely a humble fisher now that nothing is left of my noble legacy."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is my only pride and joy."})
keywordHandler:addKeyword({'ferry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is my only pride and joy."})
keywordHandler:addKeyword({'legacy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'famil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'nobi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'fate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that project."})
keywordHandler:addKeyword({'poverty'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that project."})
keywordHandler:addKeyword({'project'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have only sailed to the isle of the kings once or twice. I dare not anger the monks by bringing travellers there without their permission."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To think my family used to belong to the local nobility! And now those arrogant women are in charge!"})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only isle I visit regularly is the isle of the kings. I bring food and the occasional visitor to the monastery."})
keywordHandler:addKeyword({'monastery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The monks are not exactly fond of visitors, so I rarely take somebody there without their permission."})
keywordHandler:addKeyword({'white raven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think that is the name both of the monastery and of the monks' order."})
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'isle of the kings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Isle of the Kings for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32189, y=31956, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
              
	local travelNode = keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Isle of the Kings for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32189, y=31956, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})


        npcHandler:addModule(FocusModule:new())