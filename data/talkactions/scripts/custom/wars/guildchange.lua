  local config = {
        exhaustionInSeconds = 30,
        storage = 34534
}

function onSay(cid, words, param)
        if(exhaustion.check(cid, config.storage) == TRUE) then
                doPlayerSendCancel(cid, "You can change outfit only 1 time per " .. config.exhaustionInSeconds .. " seconds.")
                return TRUE
        end

        local playerGuild = getPlayerGuildId(cid)
        if(playerGuild == FALSE) then
                doPlayerSendCancel(cid, "Sorry, you're not in a guild.")
                return TRUE
        end

        local playerGuildLevel = getPlayerGuildLevel(cid)
        if(playerGuildLevel < GUILDLEVEL_LEADER) then
                doPlayerSendCancel(cid, "You have to be Leader of your guild to change outfits!")
                return TRUE
        end

        local players = getPlayersOnline()
        local outfit = getCreatureOutfit(cid)
        local message = "*Guild* Your outfit has been changed by leader. (" .. getCreatureName(cid) .. ")"
        local members = 0
        local tmp = {}
        for i, tid in ipairs(players) do
                if(getPlayerGuildId(tid) == playerGuild and cid ~= tid) then
                        tmp = outfit
                        if(canPlayerWearOutfit(tid, outfit.lookType, outfit.lookAddons) ~= TRUE) then
                                local tidOutfit = getCreatureOutfit(tid)
                                tmp.lookType = tidOutfit.lookType
                                tmp.lookAddons = tidOutfit.lookAddons
                        end

                        doSendMagicEffect(getCreaturePosition(tid), 66)
                        doCreatureChangeOutfit(tid, tmp)
                        doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, message)
                        members = members + 1
                end
        end

        exhaustion.set(cid, config.storage, config.exhaustionInSeconds)
        doPlayerSendCancel(cid, "Guild members outfit has been changed. (Total: " .. members .. ")")
        return TRUE
end