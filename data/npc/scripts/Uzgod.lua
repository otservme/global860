                                            local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

local Topic = {}
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 5 then
		npcHandler:say("No then.",cid)
		Topic[cid] = 0
	end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	--[[
	REMEMBER TO SET YOUR STORAGE AS YOURSTORAGE!
	]]--
	--[[local storage = 98238
	if(msgcontains(msg, 'piece of draconian steel') or msgcontains(msg, 'obsidian knife')) then
		if(getPlayerStorageValue(cid, storage) < 1) then
			npcHandler:say("You bringing me draconian steel and obsidian lance in exchange for obsidian knife?", cid)
			setPlayerStorageValue(cid, storage, 1)
		elseif(getPlayerStorageValue(cid, storage) == 1) then
			npcHandler:say("Did you bring me the draconian steel and obsidian lance in exchange for obsidian knife?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, storage) == 2) then
			npcHandler:say("Sorry no more trade with you.", cid)
		end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
  		if doPlayerRemoveItem(cid,2425,1) and doPlayerRemoveItem(cid,5889,1) and getPlayerStorageValue(cid, storage) == 1 then
			npcHandler:say("Here you have it.", cid)
			doPlayerAddItem(cid, 5908, 1)
			setPlayerStorageValue(cid, storage, 2)
			talkState[talkUser] = 0
		else
			npcHandler:say("You don't have the neccesary items.", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] > 0) then
		npcHandler:say("Then not.", cid)
		talkState[talkUser] = 0
	--end
	return TRUE
end]]--

local rstorage = 100007
local talkstorage = 100010

if msgcontains(msg, 'crimson sword') and getPlayerStorageValue(cid, talkstorage) == -1 then
	if getPlayerStorageValue(cid, rstorage) == 9 then
		npcHandler:say("Me don't sell {crimson sword}.", cid)
		Topic[cid] = 1
end
elseif Topic[cid] == 1 then
if msgcontains(msg, 'forge') then	
		npcHandler:say("You telling me to forge one?! Especially for you? You making fun of me?",cid)
		Topic[cid] = 2
	end	
elseif Topic[cid] == 2 then
if msgcontains(msg, 'no') then	
		npcHandler:say("Well. Thinking about it, me a smith, so why not. 1000 gold for your personal crimson sword. Ok?",cid)
        Topic[cid] = 3	
end
elseif Topic[cid] == 3 then
if msgcontains(msg, 'no') then	
		npcHandler:say("Too expensive?! You think me work is cheap? Well, if you want cheap, I can make cheap. Hrmpf. I make cheap sword for 300 gold. Ok?",cid)
		Topic[cid] = 4
end
elseif Topic[cid] == 4 then
if msgcontains(msg, 'no') then	
		npcHandler:say("Cheap but good quality? Impossible. Unless... you bring material. Three iron ores, 250 gold. Okay?",cid)
		Topic[cid] = 5
	end
elseif Topic[cid] == 5 then
if (msgcontains(msg, 'yes') and doPlayerRemoveMoney(cid,250) and doPlayerRemoveItem(cid,5880,3)) then
	npcHandler:say("Ah, that's how me like me customers. Ok, me do this... <pling pling> ... another fine swing of the hammer here and there... <ploing>... here you have it!",cid)
        setPlayerStorageValue(cid,talkstorage, 1)
        doPlayerAddItem(cid,8209,1)
	setPlayerStorageValue(cid,100158, 14)
  else
       npcHandler:say("Hmpf... our deal was 250 gold coins och 3 iron ores?",cid)
	end	
	Topic[cid] = 0
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())