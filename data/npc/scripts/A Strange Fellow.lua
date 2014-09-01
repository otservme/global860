local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage2 = 100168
local hatstor = 100172
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	setPlayerStorageValue(cid,hatstor,-1)
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'hat') and getPlayerStorageValue(cid, storage2) == 7 and getPlayerStorageValue(cid,hatstor) == -1) then
		npcHandler:say("Uh? What do you want?!",cid)
		Topic[cid] = 1
		setPlayerStorageValue(cid,hatstor,1)
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'hat') and Topic[cid] == 1) then
		npcHandler:say("What? My hat?? Theres... nothing special about it!",cid)
		Topic[cid] = 2 
	end
 	elseif (Topic[cid] == 2) then
	if (msgcontains(msg, 'hat') and Topic[cid] == 2) then
		npcHandler:say("Stop bugging me about that hat, do you listen?",cid)
		Topic[cid] = 3
	end 
 	elseif (Topic[cid] == 3) then
	if (msgcontains(msg, 'hat') and Topic[cid] == 3) then
		npcHandler:say("Hey! Don't touch that hat! Leave it alone!!! Don't do this!!!!",cid)
		Topic[cid] = 4
	end
	elseif (Topic[cid] == 4) then
	if (msgcontains(msg, 'hat') and Topic[cid] == 4) then
		npcHandler:say("Noooooo! Argh, ok, ok, I guess I can't deny it anymore, I am David Brassacres, the magnificent, so what doyou want?",cid)
		Topic[cid] = 5
	local summons = {["Rabbit"] = 4}
	if (getPlayerStorageValue(cid,100170) == -1) then 
    		for k, v in pairs(summons) do
          		for i=1, v do
				local ret = doCreateMonster(k, getThingPos(getNpcId()), true)
				doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid,100170,1)
          			end
			end
     		end
	end
	elseif (Topic[cid] == 5) then
	if (msgcontains(msg, 'bill') and Topic[cid] == 5) then
		npcHandler:say("A bill? Oh boy so you are delivering another bill to poor me?",cid)
		Topic[cid] = 6
	end
	elseif (Topic[cid] == 6) then
	if (msgcontains(msg, 'yes') and Topic[cid] == 6 and doPlayerRemoveItem(cid,2329,1)) then
		npcHandler:say("Ok, ok, I'll take it. I guess I have no other choice anyways. And now leave me alone in my misery please.",cid)
		setPlayerStorageValue(cid,storage2,8)
		setPlayerStorageValue(cid,100171,12)
		Topic[cid] = 5
	else
		npcHandler:say("I dont see any {bill} with you!",cid)
	end
	end 
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|, what brings you here?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())