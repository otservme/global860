function onDeath(cid, corpse, deathList)

--[[Death Channel
local strings = {""}
local t, position = 1, 1

local deathType = "killed"
local toSlain, toCrushed, toEliminated = 3, 9, 15

        if #deathList >= toSlain and #deathList < toCrushed then
                deathType = "slain"
        elseif #deathList >= toCrushed and #deathList < toEliminated then
                deathType = "crushed"
        elseif #deathList >= toEliminated then
                deathType = "eliminated"
        end

        for _, pid in ipairs(deathList) do
                if isCreature(pid) == true then
                        strings[position] = t == 1 and "" or strings[position] .. ", "
                        strings[position] = strings[position] .. getCreatureName(pid) .. ""
                        t = t + 1
                else
                        strings[position] = t == 1 and "" or strings[position] .. ", "
                        strings[position] = strings[position] .."a field item"
                        t = t + 1
                end
        end

        for i, str in ipairs(strings) do
                if(str:sub(str:len()) ~= ",") then
                        str = str .. "."
                end

                msg = getCreatureName(cid) .. " was " .. deathType .. " at level " .. getPlayerLevel(cid) .. " by " .. str
        end

        for _, oid in ipairs(getPlayersOnline()) do
                doPlayerSendChannelMessage(oid, "Death channel", msg, TALKTYPE_CHANNEL_O, CHANNEL_DEATH)
        end]]
		
	--[[Heart Reward
	if isPlayer(cid) then
		doSendMagicEffect(getCreaturePosition(cid), 0)
		local v = { killer_name = getCreatureName(deathList[1]), killer_level = getPlayerLevel(deathList[1]), target_name = getCreatureName(cid), target_level = getPlayerLevel(cid) }
		local reward = doAddContainerItem(corpse.uid, 5943, 1)
		doItemSetAttribute(reward, "description", "" .. (getPlayerSex(cid) == 0 and "She" or "He") .. " was killed at level " .. v.target_level .. " by " .. v.killer_name .. " who was level " .. v.killer_level .. " at the time. " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "[Unjustified]" or "[Justified]"))
		doItemSetAttribute(reward, "name", v.target_name .."'s Heart")
	end]]

    return true
end 