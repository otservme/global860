local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

item = 'You do not have the required items.'
done = 'Here you are.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
		if msgcontains(msg, 'offer') then
		selfSay('You can here change some items for {spider silk yarn}, {chunk of crude iron}, {draconian steel}, {warrior sweat}, {magic sulphur}, {enchanted chicken wing}, {royal steel}, {hell steel}, {fighting spirit}, {infernal bolt}.', cid)

			elseif msgcontains(msg, 'spider silk yarn') then
			if getPlayerItemCount(cid,5879) >= 10 then
				selfSay('Did you bring me the 10 Giant Silks ?', cid)
				talk_state = 1
			else
				selfSay('I need a {10 Giant Spider Silks}, to give you the spider silk yarn. Come back when you have them.', cid)
				talk_state = 0
			end

			elseif msgcontains(msg, 'yes') and talk_state == 1 then
			talk_state = 0
			if getPlayerItemCount(cid,5879) >= 10 then
			if doPlayerRemoveItem(cid,5879, 10) == TRUE then
							selfSay(done, cid)
			doPlayerAddItem(cid, 5886, 1)
			end
			else
				selfSay(item, cid)
			end

elseif msgcontains(msg, 'chunk of crude iron') then
if getPlayerItemCount(cid,2393) >= 1 then
selfSay('Did you bring me the Giant Sword ?', cid)
talk_state = 2
else
selfSay('I need a {Giant Sword}, to give you the chunk of crude iron. Come back when you have it.', cid)
talk_state = 0
end
elseif msgcontains(msg, 'yes') and talk_state == 2 then
talk_state = 0
if getPlayerItemCount(cid,2393) >= 1 then
if doPlayerRemoveItem(cid,2393,1) == TRUE then
				selfSay(done, cid)
doPlayerAddItem(cid,5892,1)
end
else
selfSay(item, cid)
end
elseif msgcontains(msg, 'draconian steel') then
if getPlayerItemCount(cid,2516) >= 1 then
selfSay('Did you bring me Dragon Shield ?', cid)
talk_state = 3
else
selfSay('I need {Dragon Shield}, to give you the draconian steel. Come back when you have it.', cid)
talk_state = 0
end
elseif msgcontains(msg, 'yes') and talk_state == 3 then
talk_state = 0
if getPlayerItemCount(cid,2516) >= 1 then
if doPlayerRemoveItem(cid,2516,1) == TRUE then
doPlayerAddItem(cid,5889,1)
				selfSay(done, cid)
end
else
selfSay(item, cid)
end

		elseif msgcontains(msg, 'warrior\'s sweat') then
				if getPlayerItemCount(cid,2475) >= 1 and getPlayerItemCount(cid,2475) >= 1 and getPlayerItemCount(cid,2475) >= 1 and getPlayerItemCount(cid,2475) >= 1 then
					selfSay('Did you bring me 4 warrior helmets?', cid)
					talk_state = 4
				else
					selfSay('I need {4 warrior helmet\'s}, to give you the warrior\'s sweat. Come back when you have them.', cid)
					talk_state = 0
				end
		elseif msgcontains(msg, 'yes') and talk_state == 4 then
			talk_state = 0
			if getPlayerItemCount(cid,2475) >= 4 then
					if doPlayerRemoveItem(cid,2475,1) == TRUE and doPlayerRemoveItem(cid,2475,1) == TRUE and doPlayerRemoveItem(cid,2475,1) == TRUE and doPlayerRemoveItem(cid,2475,1) == TRUE then
						doPlayerAddItem(cid,5885,1)
						selfSay(done, cid)
					end
				else
				selfSay(item, cid)
				end

elseif msgcontains(msg, 'magic sulphur') then
if getPlayerItemCount(cid,2392) >= 1 and getPlayerItemCount(cid,2392) >= 1 and getPlayerItemCount(cid,2392) >= 1 then
selfSay('Did you bring me 3 fire swords?', cid)
talk_state = 5
else
selfSay('I need {3 fire sword\'s}, to give you the magic sulpher. Come back when you have them.', cid)
talk_state = 0
end

		elseif msgcontains(msg, 'yes') and talk_state == 5 then
			talk_state = 0
			if getPlayerItemCount(cid,2392) >= 3 then
					if doPlayerRemoveItem(cid,2392,1) == TRUE and doPlayerRemoveItem(cid,2392,1) == TRUE and doPlayerRemoveItem(cid,2392,1) == TRUE then
						doPlayerAddItem(cid,5904,1)
										selfSay(done, cid)
				end
			else
				selfSay(item, cid)
			end

		elseif msgcontains(msg, 'enchanted chicken wing') then
			if getPlayerItemCount(cid,2195) >= 1 then
				selfSay('Did you bring me boots of haste?', cid)
				talk_state = 6
			else
				selfSay('I need {boots of haste}, to give you the enchanted chicken wing. Come back when you have them.', cid)
				talk_state = 0
			end

		elseif msgcontains(msg, 'yes') and talk_state == 6 then
			talk_state = 0
			if getPlayerItemCount(cid,2195) >= 1 then
					if doPlayerRemoveItem(cid,2195,1) == TRUE then
						doPlayerAddItem(cid,5891,1)
										selfSay(done, cid)
					end
			else
				selfSay(item, cid)
			end



		elseif msgcontains(msg, 'royal steel') then
			if getPlayerItemCount(cid,2487) >= 1 then
				selfSay('Did you bring me the Crown Armor ?', cid)
				talk_state = 7
			else
				selfSay('I need a {Crown Armor}, to give you the royal steel. Come back when you have it.', cid)
				talk_state = 0
			end
		elseif msgcontains(msg, 'yes') and talk_state == 7 then
			talk_state = 0
			if getPlayerItemCount(cid,2487) >= 1 then
					if doPlayerRemoveItem(cid,2487,1) == TRUE then
						doPlayerAddItem(cid,5887,1)
										selfSay(done, cid)
					end
			else
				selfSay(item, cid)
			end


		elseif msgcontains(msg, 'hell steel') then
			if getPlayerItemCount(cid,2462) >= 1 then
				selfSay('Did you bring me the Devil Helmet ?', cid)
				talk_state = 8
			else
				selfSay('I need a {Devil Helmet}, to give you the hell steel. Come back when you have it.', cid)
				talk_state = 0
			end

		elseif msgcontains(msg, 'yes') and talk_state == 8 then
			talk_state = 0
			if getPlayerItemCount(cid,2462) >= 1 then
					if doPlayerRemoveItem(cid,2462,1) == TRUE then
						doPlayerAddItem(cid,5888,1)
										selfSay(done, cid)
					end
			else
				selfSay(item, cid)
			end

		elseif msgcontains(msg, 'fighting spirit') then
			if getPlayerItemCount(cid,2498) >= 1 and getPlayerItemCount(cid,2498) >= 1 then
				selfSay('Did you bring me the 2 Royal Helmets?', cid)
				talk_state = 10
			else
				selfSay('I need a {2 Royal Helmet\'s}, to give you the Fighting Spirit. Come back when you have them.', cid)
				talk_state = 0
			end
		elseif msgcontains(msg, 'yes') and talk_state == 10 then
			talk_state = 0
			if getPlayerItemCount(cid,2498) >= 2 then
					if doPlayerRemoveItem(cid,2498,1) == TRUE and doPlayerRemoveItem(cid,2498,1) == TRUE then
						doPlayerAddItem(cid,5884,1)
										selfSay(done, cid)
					end

			else
				selfSay(item, cid)
			end


		elseif msgcontains(msg, 'infernal bolt') then
			if getPlayerItemCount(cid,5944) >= 1 then
				selfSay('Did you bring me the Soul Orb?', cid)
				talk_state = 11
			else
				selfSay('I need a {Soul Orb}, to give you the 10 Infernal Bolts. Come back when you have it.', cid)
				talk_state = 0
			end
		elseif msgcontains(msg, 'yes') and talk_state == 11 then
			talk_state = 0
			if getPlayerItemCount(cid,5944) >= 1 then
					if doPlayerRemoveItem(cid,5944,1) == TRUE then
						doPlayerAddItem(cid,6529,10)
										selfSay(done, cid)
					end

			else
				selfSay(item, cid)
			end

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('So Leave, LEAVE ME NOW!')
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
