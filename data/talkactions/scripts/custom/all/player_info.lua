  --[[
        Player Information Script
        Version 1.0
        By Shawak
]]--


local config = {
        levelToUseCommand = 0,  -- level to use the command
        type = "popup",         -- "Popup" or "Dialog"
        itemForDialog = 1948,   -- Item (works only if u type "Dialoge")
        cost = 0                -- cost to use the command
}

local showing = {
        Skull_HomeTown_Type = "yes",  -- show skull, hometown and type?
        House = "yes",                -- show players house?
        Guild = "yes",                -- Show player guild?
        Skills = "yes"                -- show player skills?
}



local settings = { -- Don't Touch This ----------------------
        skulls = {"Yellow", "White", "Red", "Black"},      --
        access = {"Player", "Gamemaster", "CM", "Admin"}   --  
} -----------------------------------------------------------

function onSay(cid, words, param, channel)

        if getPlayerLevel(cid) < config.levelToUseCommand then
                doSendMagicEffect(getCreaturePosition(cid), 2)
                doPlayerSendTextMessage(cid, 26, "You need to be level "..config.levelToUseCommand.." or higher to use this command.")
                return TRUE
        end

        if doPlayerRemoveMoney(cid, config.cost) == FALSE then
                doSendMagicEffect(getCreaturePosition(cid), 2)
                doPlayerSendTextMessage(cid, 26, "You need "..config.cost.." gold coins to use this command.")
                return TRUE
        end

        local pid = getPlayerByNameWildcard(param)

        if isPlayer(pid) == FALSE then
                doPlayerSendCancel(cid, "A player with this name isn't online.")
                doSendMagicEffect(getCreaturePosition(cid), 2)
                return true
        else
                local access, skull, str = "", "", ""
                if getCreatureSkullType(pid) == 0 then
                        skull = "None"
                else
                        skull = settings.skulls[getCreatureSkullType(pid)]
                end
                if getPlayerGroupId(pid) > #settings.access then
                        access = settings.access[#settings.access]
                else
                        access = settings.access[getPlayerGroupId(pid)]
                end
                str = str.."Player Information:\n\n• Name: "..getPlayerName(pid).."\n• Status:\n¤ Level: "..getPlayerLevel(pid).."\n¤ Exp: "..getPlayerExperience(pid).."\n¤ Vocation: "..getPlayerVocationName(pid)..""
                if string.lower(showing.Skull_HomeTown_Type) == "yes" then
                        str = str.."\n\n¤ Skull: "..skull.."\n¤ Hometown: "..getTownName(getPlayerTown(pid)).."\n¤ Type: "..access..""
                end
                if string.lower(showing.House) == "yes" then
                        str = str.."\n\n• House: "..(getHouseByPlayerGUID(getPlayerGUID(pid)) ~= FALSE and getHouseByPlayerGUID(getPlayerGUID(pid)) or "--")..""
                end
                if string.lower(showing.Guild) == "yes" then
                        str = str.."\n\n• Guild:\n¤ Name: "..(getPlayerGuildName(pid) ~= "" and getPlayerGuildName(pid) or "--").."\n¤ Rank: "..(getPlayerGuildRank(pid) ~= "" and getPlayerGuildRank(pid) or "--")..""
                end
                str = str.."\n\n• Skills:\n¤ Health: "..getCreatureHealth(pid).."/"..getCreatureMaxHealth(pid).."\n¤ Mana:    "..getCreatureMana(pid).."/"..getCreatureMaxMana(pid).."\n"
                if string.lower(showing.Skills) == "yes" then
                        str = str.."\n¤ Fist: "..getPlayerSkillLevel(pid, 0).."\n¤ Club: "..getPlayerSkillLevel(pid, 1).."\n¤ Sword: "..getPlayerSkillLevel(pid, 2).."\n¤ Axe: "..getPlayerSkillLevel(pid, 3).."\n¤ Dist: "..getPlayerSkillLevel(pid, 4).."\n¤ Shield: "..getPlayerSkillLevel(pid, 5).."\n¤ Fish: "..getPlayerSkillLevel(pid, 6)..""
                end
                if string.lower(config.type) == "popup" then
                        return doPlayerPopupFYI(cid, str)
                elseif string.lower(config.type) == "dialog" then
                        return doShowTextDialog(cid, config.itemForDialog, str)
                else
                        return print("Invaild type in player_info.lua, you have to type 'Popup' or ' Dialog'.")
                end
        end
        return TRUE
end