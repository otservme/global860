local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the grand druid of Carlin. I am responsible for the guild, the fields, and our citizens health."})
keywordHandler:addKeyword({'grand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the grand druid of Carlin. I am responsible for the guild, the fields, and our citizens health."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Padreia, Grand Druid of our fine city."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is just a crystal pillar. The center of creation and life."})
keywordHandler:addKeyword({'member'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our members wield magic powers of protection and healing."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Every member of the Druids is able to learn the numerous spells of our craft."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are druids, preservers of life. Our magic is about defense, healing, and nature."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerers are destrucitve. Their power lies in destruction and pain."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in this world: Druids, paladins, knights, and sorcerers."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In a spellbook, your spells are listed. There you will find the pronunciation of each spell. If you want to buy one, visit Rachel."})
keywordHandler:addKeyword({'caress'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't ask. They were only an unimportant footnote of history."})
function creatureSayCallback(cid, type, msg)
if (not npcHandler:isFocused(cid)) then
        return false
    end

		local queststate = getPlayerStorageValue(cid,6665)
		
		if msgcontains(msg, 'crunor\'s caress') and queststate == 1 then
		npcHandler:say('Don\'t ask. They were only an unimportant footnote of history.', cid)
        talk_state = 1
		elseif msgcontains(msg, 'footnote') and talk_state == 1 then
			npcHandler:say('They thought they have to bring Crunor to the people, if people did not find to Crunor of their own. To achieve that they founded the inn Crunor\'s Cottage, south of Mt. Sternum.', cid)
				setPlayerStorageValue(cid,6666,1)
                talk_state = 2
		elseif msgcontains(msg, 'bye') and (talk_state >= 1 and talk_state <= 2) then
		npcHandler:say('Farewell.', cid)

			talk_state = 0
		end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
