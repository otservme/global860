local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --
local Topic = {}
fcitizen     = 22001 
exhaust     = 26202 

function greetCallback(cid)
  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  Topic[talkUser] = 0
    return true
end

function creatureSayCallback(cid, type, msg)

  if(not npcHandler:isFocused(cid)) then
    return false
  end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  if msgcontains(msg, "addon") and getPlayerStorageValue(cid, fcitizen) == -1 then
     npcHandler:say("Sorry, the backpack I wear is not for sale. It's handmade from rare {minotaur leather}.",cid)
  elseif msgcontains(msg, "minotaur leather") and getPlayerStorageValue(cid, fcitizen) == -1 then
    npcHandler:say("Well, if you really like this {backpack}, I could make one for you, but minotaur leather is hard to come by these days. Are you willing to put some work into this?", cid)
    Topic[talkUser] = 4
  elseif msgcontains(msg, "yes") and Topic[talkUser] == 4 and getPlayerStorageValue(cid, fcitizen) == -1 then
    npcHandler:say("Alright then, if you bring me 100 pieces of fine minotaur leather I will see what I can do for you. You probably have to kill really many minotaurs though... so good luck!", cid)
    setPlayerStorageValue(cid,fcitizen,1)
    Topic[talkUser] = 0
  elseif msgcontains(msg, "backpack") and getPlayerStorageValue(cid, fcitizen) == 1 then
    npcHandler:say("Ah, right, almost forgot about the backpack! Have you brought me 100 pieces of minotaur leather as requested?", cid)
    Topic[talkUser] = 5
  elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, fcitizen) == 1 and Topic[talkUser] == 5 then
  if getPlayerItemCount(cid, 5878) >= 100 then
    npcHandler:say("Great! Alright, I need a while to finish this backpack for you. Come ask me later, okay?", cid)
    Topic[talkUser] = 0
	doPlayerRemoveItem(cid, 5878, 100)
	exhaustion.set(cid, exhaust, 3600)
	setPlayerStorageValue(cid,fcitizen,2)
	setPlayerStorageValue(cid, 27031, 1)
  else
    npcHandler:say("Come back when you have the minotaur leathers!",cid)
  end
  elseif msgcontains(msg, "addon") and getPlayerStorageValue(cid, fcitizen) == 2 and getPlayerStorageValue(cid, 27031) == 1 then
  if(not exhaustion.get(cid, exhaust)) then
    npcHandler:say("Just in time! Your backpack is finished. Here you go, I hope you like it.", cid)
	setPlayerStorageValue(cid, fcitizen, 3)
  if getPlayerSex(cid) == 1 then
    doPlayerAddOutfit(cid, 128, 1)
  elseif getPlayerSex(cid) == 0 then
    doPlayerAddOutfit(cid, 136, 1)
    Topic[talkUser] = 0
	else
	npcHandler:say("Uh... I didn't expect you to return that early. Sorry, but I'm not finished yet with your backpack. I'm doing the best I can, promised.", cid)
  end
  end
----------------------------------PARADOX--------------------------

		local queststate = getPlayerStorageValue(cid,6666)
		
		elseif msgcontains(msg, 'crunor\'s cottage') and queststate == 1 then
			npcHandler:say('Ah yes, I remember my grandfather talking about that name. This house used to be an inn a long time ago. My family bought it from some of these flower', cid)
        Topic[talkUser] = 1
		elseif msgcontains(msg, 'flower guys') and Topic[talkUser] == 1 then
			npcHandler:say('Oh, I mean druids of course. They sold the cottage to my family after some of them died in an accident or something like that.', cid)
                Topic[talkUser] = 2
		elseif msgcontains(msg, 'accident') and Topic[talkUser] == 2 then
			npcHandler:say('As far as I can remember the story, a pet escaped its stable behind the inn. It got somehow involved with powerfull magic at a ritual and was transformed in some way.', cid)
                Topic[talkUser] = 3
		elseif msgcontains(msg, 'stable') and Topic[talkUser] == 3 then
			npcHandler:say('My grandpa told me, in the old days there were some behind this cottage. Nothing big though, just small ones, for chicken or rabbits.', cid)
                setPlayerStorageValue(cid,6667,1)
				Topic[talkUser] = 4
		elseif msgcontains(msg, 'bye') and (Topic[talkUser] >= 1 and Topic[talkUser] <= 4) then
			npcHandler:say('Farewell.', cid)

			Topic[talkUser] = 0
		end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())