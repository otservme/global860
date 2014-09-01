local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
-- OTServ event handling functions end

local golden_mug = 2033
local tp = {x = 32598, y = 31402, z = 15}
local to = {x = 32600, y = 31396, z = 14}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, 'quest') or msgcontains(msg, 'pass') then
		npcHandler:say('ANYTHING IS POSSIBLE, I LOVE A SHINY {GOLDEN MUG}!', cid)
	elseif msgcontains(msg, 'golden mug') then
		if getPlayerItemCount(cid, golden_mug) >= 1 then
			npcHandler:say('YOU HAVE ONE!?', cid)
			talk_state = 1
		else
			npcHandler:say('YOU DO NOT, LIERS MUST DIE!', cid)
			local lie1 = {x = 32596, y = 31405, z = 15}
			local lie2 = {x = 32596, y = 31409, z = 15}
			doCreateMonster("Undead Dragon", lie1)
			doCreateMonster("Undead Dragon", lie2)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 1 then
		if getPlayerItemCount(cid, golden_mug) >= 1 then
			if doPlayerRemoveItem(cid, golden_mug, 1) == TRUE then
				npcHandler:say('I LOVE GOLD!', cid)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				doTeleportThing(cid,{x=32566, y=31405, z=15})
				talk_state = 0
			end
		else
			npcHandler:say('YOU DO NOT, LIERS MUST DIE!', cid)
			local lie1 = {x = 32596, y = 31405, z = 15}
			local lie2 = {x = 32596, y = 31409, z = 15}
			doCreateMonster("Undead Dragon", lie1)
			doCreateMonster("Undead Dragon", lie2)
			talk_state = 0
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())