local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'spellbook'}, 2175, 150, 1, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 1, 'magic lightwand')

shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')


shopModule:addBuyableItem({'fire bomb'}, 2305, 55, 1, 'fire bomb')
shopModule:addBuyableItem({'destroy field'}, 2261, 5, 1, 'destroy field rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 1, 1, 'light magic missile rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 2, 1, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 10, 1, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 5, 1, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 100, 1, 'sudden death rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'holy judgment'}, 2300, 120, 1, 'holy judgment rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 30,  1, 'desintegreate rune')
shopModule:addBuyableItem({'fire field'}, 2301, 10,  1, 'fire field rune')
shopModule:addBuyableItem({'energy field'}, 2301, 10,  1, 'energy field rune')
shopModule:addBuyableItem({'avalanche rune'}, 2274, 12,  1, 'avalanche rune')
shopModule:addBuyableItem({'antidote rune'}, 2266, 65,  1, 'antidote rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 32,  1, 'energy wall rune')
shopModule:addBuyableItem({'icicle'}, 2271, 8,  1, 'icicle rune')
shopModule:addBuyableItem({'poison field'}, 2285, 7,  1, 'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 12,  1, 'poison wall rune')
shopModule:addBuyableItem({'blank'}, 2260, 10,  1, 'blank rune')
shopModule:addBuyableItem({'fire ball'}, 2302, 5,  1, 'fire ball rune')
shopModule:addBuyableItem({'thunderstorm rune'}, 2315, 55, 1, 'thunderstorm rune')
shopModule:addBuyableItem({'stone shower rune'}, 2288, 55, 1, 'stone shower rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 200, 1, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 400, 1, 'paralyze rune')
shopModule:addBuyableItem({'animate dead'}, 2316, 375, 1, 'animate dead rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')

shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500,  'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'decay'}, 2188, 5000, 'wand of decay')
shopModule:addBuyableItem({'wand of draconia', 'draconia'}, 8921, 7500,  'wand of draconia')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000,  'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000,  'wand of inferno')
shopModule:addBuyableItem({'wand of starstorm', 'starstorm'}, 8920, 18000,  'wand of starstorm')
shopModule:addBuyableItem({'wand of voodoo', 'voodoo'}, 8922, 22000,  'wand of voodoo')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500,  'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000,  'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 5000,  'necrotic rod')
shopModule:addBuyableItem({'northwind rod', 'northwind'}, 8911, 7500,  'northwind rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000,  'terra rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm'}, 2183, 15000,  'hailstorm rod')
shopModule:addBuyableItem({'springsprout rod', 'springsprout'}, 8912, 18000,  'springsprout rod')
shopModule:addBuyableItem({'underworld rod', 'underworld'}, 8910, 22000,  'underworld rod')

shopModule:addSellableItem({'wand of vortex', 'vortex'}, 2190, 50, 'wand of vortex')
shopModule:addSellableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 500, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of decay', 'decay'}, 2188, 1000, 'wand of decay')
shopModule:addSellableItem({'wand of draconia', 'draconia'}, 8921, 1500, 'wand of draconia')
shopModule:addSellableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 2000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'inferno'},2187, 3000, 'wand of inferno')
shopModule:addSellableItem({'wand of starstorm', 'starstorm'}, 8920, 3600, 'wand of starstorm')
shopModule:addSellableItem({'wand of voodoo', 'voodoo'}, 8922, 4400, 'wand of voodoo')

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 2182, 50,'snakebite rod')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 2186, 500,   'moonlight rod')
shopModule:addSellableItem({'necrotic rod', 'necrotic'}, 2185, 1000, 'necrotic rod')
shopModule:addSellableItem({'northwind rod', 'northwind'}, 8911, 1500, 'northwind rod')
shopModule:addSellableItem({'terra rod', 'terra'}, 2181, 2000, 'terra rod')
shopModule:addSellableItem({'hailstorm rod', 'hailstorm'}, 2183, 3000, 'hailstorm rod')
shopModule:addSellableItem({'springsprout rod', 'springsprout'}, 8912, 3600, 'springsprout rod')
shopModule:addSellableItem({'underworld rod', 'underworld'}, 8910, 4400, 'underworld rod')


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}

	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 30002) == -1) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 30002, 1)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
