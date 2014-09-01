local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
    	-- NPC The Queen of the Banshees feito por Rodrigo (Nottinghster) 
    	-- Inicio The Queen of the Banshees NPC
 
            local primeiro_selo = getPlayerStorageValue(cid, 32998)
            local segundo_selo = getPlayerStorageValue(cid, 32997)
            local terceiro_selo = getPlayerStorageValue(cid, 32996)
            local quarto_selo = getPlayerStorageValue(cid, 32995)
            local quinto_selo = getPlayerStorageValue(cid, 32994)
            local sexto_selo = getPlayerStorageValue(cid, 32993)
            local setimo_selo = getPlayerStorageValue(cid, 32992)
    	local teletransporte = {x=32202, y=31812, z=8, stackpos =0}
 
    	if msgcontains(msg, 'seventh') and getPlayerLevel(cid) < 60 or msgcontains(msg, 'last') and getPlayerLevel(cid) < 60 then
			selfSay("You are not experienced enough to master the challenges ahead or to receive knowledge about the seventh seal. Go and learn more before asking me again.",cid)
 
    	elseif msgcontains(msg,'seventh seal') or msgcontains(msg,'seventh') and getPlayerLevel(cid) > 59 or msgcontains(msg, 'last') and getPlayerLevel(cid) > 59 then
			selfSay("If you have passed the first six seals and entered the blue fires that lead to the chamber of the seal you might receive my kiss ... It will open the last seal. Do you think you are ready?",cid)
			talk_state = 2
 
    	elseif msgcontains(msg, 'kiss') and setimo_selo == -1 and talk_state == 8 then
			selfSay('Are you prepared to receive my kiss, even though this will mean that your death as well as a part of your soul will forever belong to me, my dear?',cid)
			talk_state = 1
    	elseif (msgcontains(msg, 'kiss') and getPlayerStorageValue(cid, 32993) == 1 and getPlayerStorageValue(cid, 32994) == 1 and getPlayerStorageValue(cid, 32995) == 1 and getPlayerStorageValue(cid, 32996) == 1 and getPlayerStorageValue(cid, 32997) == 1 and getPlayerStorageValue(cid, 32998) == 1 and getPlayerStorageValue(cid,32992) == -1) then
			selfSay('To receive my kiss you have to pass all other seals first.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'kiss') and getPlayerStorageValue(cid,32992) == 1 then
			selfSay('You have already received my kiss. You should know better then to ask for it.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 1 then
			selfSay('So be it! Hmmmmmm...',cid)
			doTeleportThing(cid, teletransporte)
			doSendMagicEffect(teletransporte,10)
			setPlayerStorageValue(cid, 32992, 1)
			setPlayerStorageValue(cid, 100094, 2)
    	elseif msgcontains(msg, 'no') and talk_state == 1 then
			selfSay('Perhaps it is the better choice for you, my dear.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 2 and quarto_selo == 1 then
			selfSay('Yessss, I can sense you have passed the seal of sacrifice. Have you passed any other seal yet?',cid)
			talk_state = 3
    	elseif msgcontains(msg, 'yes') and talk_state == 2 and quarto_selo == -1 then
			selfSay('You have not passed the seal of sacrifice yet. Return to me when you are better prepared.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'no') and talk_state == 2 then
			selfSay('Then try to be better prepared next time we meet.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 3 and primeiro_selo == 1 then
			selfSay('I sense you have passed the hidden seal as well. Have you passed any other seal yet?',cid)
			talk_state = 4
    	elseif msgcontains(msg, 'yes') and talk_state == 3 and primeiro_selo == -1 then
			selfSay('You have not found the hidden seal yet. Return when you are better prepared.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'no') and talk_state == 3 then
			selfSay('Then try to be better prepared next time we meet.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 4 and segundo_selo == 1 then
			selfSay('Oh yes, you have braved the plagueseal. Have you passed any other seal yet?',cid)
			talk_state = 5
    	elseif msgcontains(msg, 'yes') and talk_state == 4 and segundo_selo == -1 then
			selfSay('You have not faced the plagueseal yet. Return to me when you are better prepared.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'no') and talk_state == 4 then
			selfSay('Then try to be better prepared next time we meet.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 5 and terceiro_selo == 1 then
			selfSay('Ah, I can sense the power of the seal of demonrage burning in your heart. Have you passed any other seal yet?',cid)
			talk_state = 6
    	elseif msgcontains(msg, 'yes') and talk_state == 5 and terceiro_selo == -1 then
			selfSay('You are not filled with the fury of the imprisoned demon. Return when you are better prepared.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'no') and talk_state == 5 then
			selfSay('Then try to be better prepared next time we meet.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 6 and quinto_selo == 1 then
			selfSay('So, you have managed to pass the seal of the 1 path. Have you passed any other seal yet?',cid)
			talk_state = 7
    	elseif msgcontains(msg, 'yes') and talk_state == 6 and quinto_selo == -1 then
			selfSay('You have not found your 1 path yet. Return when you are better prepared.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'no') and talk_state == 6 then
			selfSay('Then try to be better prepared next time we meet.',cid)
			talk_state = 0
 
    	elseif msgcontains(msg, 'yes') and talk_state == 7 and sexto_selo == 1 then
			selfSay('I see! You have mastered the seal of logic. You have made the sacrifice, you have seen the unseen, you possess fortitude, you have filled yourself with power and found your path. You may ask me for my {kiss} now.',cid)
			talk_state = 8
    	elseif msgcontains(msg, 'yes') and talk_state == 7 and sexto_selo == -1 then
			selfSay('You have not found your 1 path yet. Return to meh when you are better prepared.',cid)
			talk_state = 0
    	elseif msgcontains(msg, 'no') and talk_state == 7 then
			selfSay('Then try to be better prepared next time we meet.',cid)
			talk_state = 0
 
    	elseif (msgcontains(msg, 'spectral dress')) then
            selfSay('Your wish for a spectral dress is silly. Allthough I will grant you the permission to take one. My maidens left one in a box in a room, directly south of here.',cid)
            setPlayerStorageValue(cid, 327, 1)
            doPlayerAddItem(cid, 2657, 1)
 
        elseif (msgcontains(msg, 'bye')) and (talkState[talkUser] >= 1 and talkState[talkUser] <= 8) then
            selfSay('We will meet again.',cid)
            talkState[talkUser] = 0
 
 
		elseif (msgcontains(msg, 'addon') or msgcontains(msg, 'Addon')) and getPlayerStorageValue(cid, 6870) == 5 then
            selfSay('Say... I have been longing for something for an eternity now... if you help me retrieve it, I will reward you. Do you consent to this arrangement?',cid)
            talkState[talkUser] = 15
 
        elseif talkState[talkUser] == 15 then
            if (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) then
				local msgs4={                         
							"Listen... there are no blooming flowers down here and the only smell present is that of death and decay. ...",
							"I wish that I could breathe the lovely smell of beautiful flowers just one more time, especially those which elves cultivate. ...",
							"Could you please bring me 50 holy orchids?"
						}
                doNPCTalkALot(msgs4,9000) --if the 2750 is ommited, it uses 3000 alway
                talkState[talkUser] = 16
            else
                selfSay('Then not.',cid)
            end
 
        elseif talkState[talkUser] == 16 then
            if (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) then
				setPlayerStorageValue(cid, 6870,6)
				selfSay('Thank you. I will wait for your return.',cid)
				talkState[talkUser] = 0
            else
                selfSay('Then not.',cid)
            end
 
 
		elseif (msgcontains(msg, 'holy') or msgcontains(msg, 'Holy')) and (msgcontains(msg, 'orchid') or msgcontains(msg, 'Orchid')) and getPlayerStorageValue(cid, 6870) == 6 then
            selfSay('Have you really brought me 50 holy orchids?',cid)
            talkState[talkUser] = 18
 
 
		elseif talkState[talkUser] == 18 then
            if (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) then
				if doPlayerRemoveItem(cid,5922,50) then
					setPlayerStorageValue(cid, 6870,7)
					doSendMagicEffect(getPlayerPosition(cid),12)
					doPlayerAddOutfit(cid,149,1)
					doPlayerAddOutfit(cid,145,1) 
					selfSay('Thank you! You have no idea what that means to me. As promised,here is your reward... as a follower of Zathroth, I hope that you will like this accessory.',cid)
					talkState[talkUser] = 0
				else
					selfSay('You don\'t have this items.',cid)
                end
            end
        end
 
        return true
    end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())