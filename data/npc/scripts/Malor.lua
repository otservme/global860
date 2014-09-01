local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100058
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
local p = getCreatureName(cid) 
   local v = getPlayerStorageValue(cid, storage)
   if npcHandler:isFocused(cid) then
	if msgcontains(msg, 'no') and Topic[cid] == 2 then
		npcHandler:say("Dont disturb me then.",cid)
		Topic[cid] = 1
	elseif msgcontains(msg, 'no') and Topic[cid] == 4 then
		npcHandler:say("Dont disturb me then.",cid)
		Topic[cid] = 3
		end
	end
	if (msgcontains(msg, "DJANNI'HAH")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, storage) == -1 then
    if getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say("Greetings, human "..p..". My patience with your kind is limited, so speak quickly and choose your words well.", cid)
        npcHandler:addFocus(cid)
		Topic[cid] = 1
	end
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'mission') then
			npcHandler:say("I guess this is the first time I entrust a human with a mission. And such an important mission, too. But well, we live in hard times, and I am a bit short of adequate staff. ...",cid)
			npcHandler:say("Besides, Baa'leal told me you have distinguished yourself well in previous missions, so I think you might be the right person for the job. ...",cid, 2000)
			npcHandler:say("But think carefully, human, for this mission will bring you close to certain death. Are you prepared to embark on this {mission}?",cid, 3500)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Well, listen. We are trying to acquire the ultimate weapon to defeat Gabel: Fa'hradin's lamp! ...",cid)
			npcHandler:say("At the moment it is still in the possession of that good old friend of mine, the Orc King, who kindly released me from it. ...",cid, 2000)
			npcHandler:say("However, for some reason he is not as friendly as he used to be. You better watch out, human, because I don't think you will get the lamp without a fight. ...",cid, 4000)
			npcHandler:say("Once you have found the lamp you must enter Ashta'daramai again. Sneak into Gabel's personal chambers and exchange his sleeping lamp with Fa'hradin's lamp! ...",cid, 7000)
			npcHandler:say("If you succeed, the war could be over one night later!",cid, 10000)
            		setPlayerStorageValue(cid,storage, 1)
			setPlayerStorageValue(cid, 100062, 9)
			setPlayerStorageValue(cid,100159, 4)
			Topic[cid] = 0
		end
		Topic[cid] = 0
	end
	if (msgcontains(msg, "DJANNI'HAH")) and (not npcHandler:isFocused(cid)) and getPlayerStorageValue(cid, storage) == 2 then
	if getPlayerStorageValue(cid, storage) == 2 then
		npcHandler:say("Greetings, human "..p..". My patience with your kind is limited, so speak quickly and choose your words well.", cid)
        npcHandler:addFocus(cid)
		Topic[cid] = 3
	end
	elseif Topic[cid] == 3 then
		if msgcontains(msg, 'mission') then
			npcHandler:say("Have you found Fa'hradin's lamp and placed it in Malor's personal chambers?",cid)
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 then
		if msgcontains(msg, 'yes') and getPlayerStorageValue(cid,100060) == 1 then
			npcHandler:say("Well well, human. So you really have made it - you have smuggled the modified lamp into Gabel's bedroom! ...",cid)
			npcHandler:say("I never thought I would say this to a human, but I must confess I am impressed. ...",cid, 700)
			npcHandler:say("Perhaps I have underestimated you and your kind after all. ...",cid, 1200)
			npcHandler:say("I guess I will take this as a lesson to keep in mind when I meet you on the battlefield. ...",cid, 1600)
			npcHandler:say("But that's in the future. For now, I will confine myself to give you the permission to trade with my people whenever you want to. ...",cid, 2100)
			setPlayerStorageValue(cid, 100061, 1)
			setPlayerStorageValue(cid,storage, 3)
			setPlayerStorageValue(cid, 100062, 12)
			setPlayerStorageValue(cid,100159, 6)
			AddStageExp(cid,100000)
		else
		    npcHandler:say("You better don't return here until you've finished your {mission}.", cid) 
        end
        Topic[cid] = 0
		end
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("Farewell, human. When I have taken my rightful place I shall remember those who served me well. Even if they are only humans.",cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		Topic[cid] = 0
	    end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)