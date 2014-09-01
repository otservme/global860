local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


local Topic, Partner = {}, {}


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)           end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)   end
function onThink()                            npcHandler:onThink()                       end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a priest of the great pantheon."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus is our benevolent sovereign."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life is a gift of the gods, honor life and don't destroy it."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to spread knowledge about the gods."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to spread knowledge about the gods."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Lynda. And the spirits tell me that you are |PLAYERNAME|."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world of Tibia is the creation of the gods."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Now, it is "..getWorldTime()..""})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are creatures of the gods of evil!"})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fire is one of the primal elemental forces, sometimes worshipped by tribal shamans."})
keywordHandler:addKeyword({'air'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Air is one of the primal elemental forces, sometimes worshipped by tribal shamans."})




-- Storage IDs --

fmage        = 22663    
smage        = 22006
  
fsummoner    = 22011
ssummoner    = 22012   

newaddon    = 'Ah, right! You want a wand! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function MageFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fmage)
    if addon == -1 then
        if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
        if doPlayerRemoveItem(cid,2181,1) and doPlayerRemoveItem(cid,2182,1) and doPlayerRemoveItem(cid,2183,1) and doPlayerRemoveItem(cid,2185,1) and doPlayerRemoveItem(cid,2186,1) and doPlayerRemoveItem(cid,2187,1) and doPlayerRemoveItem(cid,2188,1) and doPlayerRemoveItem(cid,2189,1) and doPlayerRemoveItem(cid,2190,1) and doPlayerRemoveItem(cid,2191,1) and doPlayerRemoveItem(cid,5904,10) and doPlayerRemoveItem(cid,2193,20) and doPlayerRemoveItem(cid,5809,1) then
            npcHandler:say('Ah, right! You want a wand! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 130, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 141, 1)
			setPlayerStorageValue(cid,fmage, 1)
        end
		end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end





node1 = keywordHandler:addKeyword({'mage wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage wand you need give me wand of vortex,wand of dragonbreath,wand of decay,wand of cosmic energy, wand of inferno, snakebite rod, moonlight rod, necrotic rod, terra rod, hailstorm rod, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
node1:addChildKeyword({'yes'}, MageFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage wand you need give me wand of vortex,wand of dragonbreath,wand of decay,wand of cosmic energy, wand of inferno, snakebite rod, moonlight rod, necrotic rod, terra rod, hailstorm rod, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
node3:addChildKeyword({'yes'}, MageFirst, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'summoner wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get summoner wand you need give me wand of vortex,wand of dragonbreath,wand of decay,wand of cosmic energy, wand of inferno, snakebite rod, moonlight rod, necrotic rod, terra rod, hailstorm rod, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
node2:addChildKeyword({'yes'}, SummonerFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



function say(msg, cid)
	local npc, _msg = getNpcId(), msg:gsub('{', ''):gsub('}', '')
	local pos = getThingPos(npc)
	for _, tid in ipairs(getSpectators(pos, 7, 5, false) or {}) do
		if isPlayer(tid) then
			doCreatureSay(npc, tid ~= cid and _msg or msg, tid == cid and TALKTYPE_PRIVATE_NP or TALKTYPE_SAY, false, tid, pos)
		end
	end
end

local function marry(cid, msg, ext)
	msg = msg:gsub('my heart belongs to ', '')
	local player = getPlayerByName(msg)
	if player then
		if player ~= cid then
			if getPlayerPartner(player) == 0 then
				if getPlayerStorageValue(cid, 46000) == 1 then
					if getPlayerStorageValue(player, 46001) == getPlayerGUID(cid) then
						doCreatureSay(cid, msg, TALKTYPE_SAY)
						say('By the powers of the Gods your souls are now bound together for eternity. As a symbol of your love, receive your engraved wedding rings and festive clothes. ...', cid)
						say('May the Gods watch with grace over your future life as a married couple. Go now and celebrate your honeymoon on the peaceful island of Meluna!', cid)
						for _, pid in ipairs({cid, player}) do
							doPlayerAddOutfitId(pid, 34, 0)
							local v = getCreatureOutfit(pid)
							v.lookType = getPlayerSex(pid) == 0 and 329 or 328
							doCreatureChangeOutfit(pid, v)
							doSendMagicEffect(getThingPos(pid), CONST_ME_HEARTS)
							setPlayerStorageValue(pid, 46002, os.time() + 86400)
						end
						doSendMagicEffect(getNpcPos(), CONST_ME_MAGIC_BLUE)
						local nc, np = getCreatureName(cid), getCreatureName(player)
						doItemSetAttribute(doPlayerAddItem(cid, 10502, 1), 'description', np .. ' & ' .. nc .. ' forever - married on ' .. os.date('%b ' .. os.date('*t').day .. ', %Y') .. '.')
						doItemSetAttribute(doPlayerAddItem(player, 10502, 1), 'description', nc .. ' & ' .. np .. ' forever - married on ' .. os.date('%b ' .. os.date('*t').day .. ', %Y') .. '.')
						doPlayerSetPartner(cid, getPlayerGUID(player))
						doPlayerSetPartner(player, getPlayerGUID(cid))
						Topic[cid] = nil
						return true
					elseif ext == 1 then
						say(getCreatureName(cid) .. ', are you sure of your love to ' .. getCreatureName(player) .. ' and wish to bind your souls together for eternity?', cid)
						Topic[cid] = 5
						Partner[cid] = getPlayerGUID(player)
					end
				else
					say('Oh no! Your ring and outfit box are missing! I hope you didn\'t forget them! Can you please give them to me now?', cid)
					Topic[cid] = 8
					return true
				end
			else
				if ext then say('This person is already married to someone.', cid) end
			end
		else
			if ext then say('You cannot marry yourself.', cid) end
		end
	else
		if ext then say('This person is not online.', cid) end
	end
	if ext then doCreatureSay(cid, msg, TALKTYPE_SAY) end
end

function creatureSayCallback(cid, type, msg)
	if msgcontains(msg, 'my heart belongs to') and not npcHandler:isFocused(cid) then
		local v =  marry(cid, msg)
		if v then
			npcHandler:addFocus(cid)
			return true
		end
	elseif (msgcontains(msg, 'hello') or msgcontains(msg, 'hi')) and (not npcHandler:isFocused(cid)) then
		npcHandler:say('Welcome in the name of the Gods, pilgrim '..getCreatureName(cid)..'!', cid)
		npcHandler:addFocus(cid)
		Topic[cid] = nil
	elseif not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'bye') or msgcontains(msg, 'farewell') then
		npcHandler:say('Good bye, '..getCreatureName(cid)..'. May the Gods watch over you, my child!', cid)
		Topic[cid] = nil
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, 'marriage') or msgcontains(msg, 'marry') or msgcontains(msg, 'ceremony') or msgcontains(msg, 'wedding') then
		if getPlayerPartner(cid) ~= 0 then
			say('Yes, indeed, you are married, ' .. getCreatureName(cid) .. '. I hope your love is still blooming and flourishing.', cid)
			Topic[cid] = nil
		elseif getPlayerStorageValue(cid, 46000) < 1 then
			say('Before we can start the marriage ceremony, each of you need to hand me a blank wedding ring and a box with a wedding outfit. ' .. getCreatureName(cid) .. ', do you have these items with you and are you willing to give them to me now?', cid)
			Topic[cid] = 6
		else
			say('Do you wish me to initiate the marriage ceremony now?', cid)
			Topic[cid] = 1
		end
		doCreatureSay(cid, msg, TALKTYPE_SAY)
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'yes') or (msgcontains(msg, 'i') and msgcontains(msg, 'will')) then
			say('In the name of the Gods of Benevolence, I ask you, ' .. getCreatureName(cid) .. ': are both of you ready and eager to be bound in marriage?', cid)
			Topic[cid] = 2
		else
			say('Perhaps another time, marriage isn\'t a step one should consider without love in the heart.', cid)
			Topic[cid] = nil
		end
		doCreatureSay(cid, msg, TALKTYPE_SAY)
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') or (msgcontains(msg, 'i') and msgcontains(msg, 'will')) then
			say('A moment of silence please... I hereby invoke the eternal powers who watch over our souls and lives. Please repeat after me: {May the gods bless us}!', cid)
			doSendMagicEffect(getNpcPos(), CONST_ME_MAGIC_BLUE)
			Topic[cid] = 3
		end
		doCreatureSay(cid, msg, TALKTYPE_SAY)
	elseif Topic[cid] == 3 then
		if msgcontains(msg, 'may') and msgcontains(msg, 'gods') and msgcontains(msg, 'bless') and msgcontains(msg, 'us') then
			say('I ask thee, ' .. getCreatureName(cid) .. ', what is the name of the person your {heart belongs to}?', cid)
			Topic[cid] = 4
		else
			--
		end
		doCreatureSay(cid, msg, TALKTYPE_SAY)
	elseif Topic[cid] == 4 then
		marry(cid, msg, 1)
	elseif Topic[cid] == 5 then
		if msgcontains(msg, 'yes') or (msgcontains(msg, 'i') and msgcontains(msg, 'will')) then
			say('So by the powers of the Gods, your soul is now bound to your beloved. ' .. getPlayerNameByGUID(Partner[cid]) .. ', now step forward and tell me if your heart belongs to ' .. getCreatureName(cid) .. ' too.', cid)
			setPlayerStorageValue(cid, 46001, Partner[cid])
			Topic[cid] = nil
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
		elseif msgcontains(msg, 'no') then
			say('Your neglection of love hurts my heart. Leave now!', cid)
			Topic[cid] = nil
			npcHandler:releaseFocus(cid)
		end
		doCreatureSay(cid, msg, TALKTYPE_SAY)
	elseif Topic[cid] == 6 then
		if msgcontains(msg, 'yes') or (msgcontains(msg, 'i') and msgcontains(msg, 'will')) then
			if getPlayerItemCount(cid, 2121) ~= 0 and doPlayerRemoveItem(cid, 10503, 1) then
				doPlayerRemoveItem(cid, 2121, 1)
				say('Thank you. I\'ll give them back to you when the time is right. Please make sure that BOTH of you have handed me your items before we start the {ceremony}.', cid)
				setPlayerStorageValue(cid, 46000, 1)
			else
				say('I\'m sorry, but you don\'t seem to have a ring and an outfit. I fear you need to visit a jeweller and the tailor in Venore.', cid)
			end
		else
			say('Hm, then not.', cid)
		end
		Topic[cid] = nil
	elseif msgcontains(msg, 'meluna') then
		if getPlayerPartner(cid) ~= 0 then
			if getPlayerSex(cid) == 1 then
				say('You can travel to Meluna with Kamil who you will find to the south of Fibula, but only on the day of your wedding.  This island is protected by the Gods. They will not allow violence there. But on your honeymoon your thoughts should be on things other than violence. ...', cid)
				say(getCreatureName(cid) .. ', just so that you won\'t have to fear an ambush on your wedding day, would you like me to bring you to the boat on Fibula, from where you can travel to Meluna?', cid)
			else
				say('You can travel to Meluna with Kamil south of Fibula, but only on the day of your wedding. This island is protected by the Gods. They will not allow violence there. ...', cid)
				say(getCreatureName(cid) .. ', since you might not want to get your new clothes dirty, would you like me to bring you to the boat on Fibula, from where you can travel to Meluna?', cid)
			end
			Topic[cid] = 7
		else
			npcHandler:say('You can travel to Meluna with Kamil south of Fibula, but only on the day of your wedding. This island is protected by the Gods. They will not allow violence there.', cid)
			Topic[cid] = nil
		end
	elseif Topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			say(getPlayerSex(cid) == 1 and 'Take care of yourselves!' or 'Enjoy yourselves!', cid)
			Topic[cid] = nil
			doSendMagicEffect(getThingPos(cid), CONST_ME_HEARTS)
			doTeleportThing(cid, {x=32154, y=32456, z=7})
			doSendMagicEffect({x=32154, y=32456, z=7}, CONST_ME_HEARTS)
		else
			say('Hm, then not.', cid)
		end
		Topic[cid] = nil
	elseif Topic[cid] == 8 then
		if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid, 2121) ~= 0 and doPlayerRemoveItem(cid, 10503, 1) then
				doPlayerRemoveItem(cid, 2121, 1)
				say('Thank you. Now let\'s continue - please tell me again whom your heart belongs to!', cid)
				setPlayerStorageValue(cid, 46000, 1)
				Topic[cid] = 9
				return true
			else
				say('I\'m sorry, but you don\'t seem to have a ring and an outfit. I fear you need to visit a jeweller and the tailor in Venore.', cid)
			end
		else
			say('Hm, then not.', cid)
		end
		Topic[cid] = nil
	elseif Topic[cid] == 9 then
		marry(cid, msg, true)
	elseif msgcontains(msg, 'ring') then
		npcHandler:say('You can buy wedding rings from many jewellers. I recommend Carina in Venore though, since the tailor in Venore also has wedding {outfits} in stock. Or - from Hanna, right here in Thais!', cid)
		Topic[cid] = nil
	elseif msgcontains(msg, 'outfit') then
		npcHandler:say('You can buy a box with your wedding outfit from the tailor Norbert in Venore.', cid)
		Topic[cid] = nil
	elseif msgcontains(msg, 'divorce') then
		npcHandler:say('Oh, what a shameful thought! Marriage is meant to be for eternity! Only the most unscrupulous or drunken priests would carry out a divorce.', cid)
		Topic[cid] = nil
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|. May the gods guard you, my child!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'May the Gods be with you!')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)