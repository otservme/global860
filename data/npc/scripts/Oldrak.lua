local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end

        if msgcontains(msg, 'hallowed axe') or msgcontains(msg, 'axe') then
                npcHandler:say('Do you want to buy a Hallowed Axe from me?', cid)
                talk_state = 1
        elseif msgcontains(msg, 'yes') and talk_state == 1 then
                local price = 1000
            if getPlayerItemCount(cid, 2386) >= 1 and getPlayerMoney(cid) >= price then
                if doPlayerRemoveMoney(cid, price) == true then
                    npcHandler:say('Here you are. You can now defeat the demon oak with this axe.', cid)
                    doPlayerRemoveItem(cid, 2386, 1)
                    doPlayerAddItem(cid, 8293, 1)
                    talk_state = 0
                end
            else
                npcHandler:say('I need an axe and ' .. price .. ' gold coins to make you a {hallowed} {axe}.', cid)
                talk_state = 0
            end
        elseif msgcontains(msg, 'demon oak') then
                npcHandler:say('Did you defeat the demon oak?', cid)
                talk_state = 2
        elseif msgcontains(msg, 'yes') and talk_state == 2 then
            if getPlayerStorageValue(cid, 35700) == 1 then
                npcHandler:say('Good job!', cid)
                doPlayerSetStorageValue(cid, 35700, 2)
                talk_state = 0
            else
                npcHandler:say('Go defeat the demon oak first. You may need a {hallowed} {axe} to defeat him.', cid)
                talk_state = 0
            end
------------------------------------------------ confirm no ------------------------------------------------
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 3) then
            npcHandler:say('Ok well come back when you have something useful to say.', cid)
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())