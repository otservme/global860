local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage2 = 100168
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if (not npcHandler:isFocused(cid)) then return false end
	if (msgcontains(msg, 'no') and Topic[cid] >= 1) then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end 

    	if (msgcontains(msg, 'new set of uniforms') or msgcontains(msg, 'uniforms') or msgcontains(msg, 'new set') or msgcontains(msg, 'uniform') or msgcontains(msg, 'set')) and (getPlayerStorageValue(cid, storage2) == 14) then
		npcHandler:say("A new uniform for the post officers? I am sorry but my dog ate the last dress pattern we used. You need to supply us with a {new dress pattern}.",cid)
		Topic[cid] = 1
	elseif (Topic[cid] == 1) then   
	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (Topic[cid] == 1) then
		npcHandler:say("It was ... wonderous beyond wildest imaginations! I have no clue where Kevin Postner got it from. Better ask him.",cid)
		setPlayerStorageValue(cid,storage2,15)
		setPlayerStorageValue(cid,100171,20)
		Topic[cid] = 0
		end
	end
    	if (msgcontains(msg, 'new dress pattern') or msgcontains(msg, 'dress pattern') or msgcontains(msg, 'pattern') or msgcontains(msg, 'dress')) and (getPlayerStorageValue(cid, storage2) == 22) then
		npcHandler:say("By the gods of fashion! Didn't it do that I fed the last dress pattern to my poor dog? Will this mocking of all which is taste and fashion never stop?? Ok, ok, you will get those ugly, stinking uniforms and now get lost, fashion terrorist.",cid)
		setPlayerStorageValue(cid, storage2, 23)
	end 
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())