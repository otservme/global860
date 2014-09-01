local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
	npcHandler:onThink()
end

--	//	--	//	--	//	--
local orc_teeth = 11109	--<edit me please>
--	//	--	//	--	//	--
local quest_storage = 17935

local function set(cid, val)
	doPlayerSetStorageValue(cid, quest_storage, val)
end

local function get(cid)
	return getPlayerStorageValue(cid, quest_storage)
end
--	//	--	//	--	//	--

local turn = {}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local pid = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if msgcontains(msg, 'mission') then
		if (get(cid) == 8) then
			local function talk_and_set(cid, pid)
				selfSay('Do Krunus dance for us! Step and dance and turn around! You will know when you do good. Make Krunus happy and support our great hunt!', cid)
				set(cid, 9)	-- ready for dance mission
			end
			selfSay('The great hunt! About to begin, but gods are not in favour of us yet. We need all help we get. We please Krunus with special nature dance. ...', cid)
			addEvent(selfSay, 3500, 'You seen Krunus altar south in camp, on mountain top? This is where dance is. If you do right steps Krunus will give you sign. If wrong, he not pleased. ...', cid)
			addEvent(talk_and_set, 7000, cid, pid)
			setPlayerStorageValue(cid, 100105,16)
		elseif (get(cid) == 11) then
			local function talk_and_set(cid, pid)
				selfSay('If you bring us 5 teeth of green men, 5 skin of horned ones and 5 skin of snakemen that already be good. Please help tribe make Pandor happy!', cid)
				set(cid, 12)	-- new mission, collect items
			end
			selfSay('You born dancer! Krunus is pleased and support the great hunt. But he easy to please! Pandor much harder. We weak, so he sad about us. ...', cid)
			addEvent(selfSay, 3500, 'Maybe we can please with sacrifice of body parts of our enemies. But you need help us get it! We much too weak. ...', cid)
			addEvent(talk_and_set, 7000, cid, pid)
			setPlayerStorageValue(cid, 100105,18)
		elseif (get(cid) == 12) then
			selfSay('Please help tribe make Pandor happy! Did you bring us what I asked?', cid)
			turn[pid] = 1
		elseif (get(cid) == 13) then
			local function talk_and_set(cid, pid)
				selfSay('Please find great crystal of Fasuon and pray there for his support!', cid)
				set(cid, 14)	-- ready for go to the crystal
			end
			selfSay('We need make sure Fasuon is on our side. There is laaaaaaaarge crystal on top of mountain. Don\'t know where come from, was there before us. Problem is - way is infested with creatures! ...', cid)
			addEvent(selfSay, 3500, 'Creatures from the other side of mountain. Bony! Scary! We too weak to go through there, can just run and hope to survive.. but you do better! ...', cid)
			addEvent(talk_and_set, 7000, cid, pid)	
			setPlayerStorageValue(cid, 100105,20)	
		elseif (get(cid) == 15) then
			selfSay('You prayed to Fasuon! Me saw ray of lights on mountain top! Beautiful it was. Me thank you for your help. Great hunt almost can\'t go wrong now!', cid)
			set(cid, 16)	-- ready for new mission
			setPlayerStorageValue(cid, 100105,22)
		elseif (get(cid) == 16) then
			local function talk_and_set(cid, pid)
				selfSay('So me will do when you gone. But me thank you very much. Go speak Lazaran and tell the gods are pleased now.', cid)
				set(cid, 17)	-- go back to lazaran
				setPlayerStorageValue(cid, 100105,23)
			end
			selfSay('Uzroth very easy to anger. You been great help so far but me think that need to pray to Uzroth meself. Only me understand what he wants at time and he is veeeeeery moody. Cannot risk to make angry! ...', cid)
			addEvent(talk_and_set, 3500, cid, pid)		
		end
	elseif msgcontains(msg, 'krunus') then
		if (get(cid) == 10) then
			selfSay("Krunus is God for plants and birth. He hidden in all that grows.", cid)
			set(cid, 11)	-- ready for new mission
		end
	elseif msgcontains(msg, 'yes') then
		if (turn[pid] == 1) then
			if (getPlayerItemCount(cid, 5878) >= 5) and (getPlayerItemCount(cid, 5876) >= 5) and (getPlayerItemCount(cid, orc_teeth) >= 5) then
				selfSay("Me thank you! Me will bring sacrifice for Pandor. He surely be pleased with our work. Well your work, but me won't tell him. Teehee.", cid)
				doPlayerRemoveItem(cid, 5878, 5)
				doPlayerRemoveItem(cid, 5876, 5)
				doPlayerRemoveItem(cid, orc_teeth, 5)
				set(cid, 13)	-- ready for new mission
				setPlayerStorageValue(cid, 100105,19)
			else
				selfSay("Please bring the items.", cid)
			end
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 