-- >> By SasiR --
-- Stone Item ID.
local stoneItemID = 1355

-- Stone Position.
local stonePos = {x = 33314, y = 31592, z = 15, stackpos = 1}

-- Position where the teleport will spawn.
local teleportPos = {x = 33316, y = 31591, z = 15, stackpos = 254}

-- Position where the teleporter will teleport you to.
local tpToPos = {x = 33328, y = 31592, z = 14, stackpos = 255}
-- Config << --

-- Main function.
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == 1945) then
        local stone = getTileItemById(stonePos, stoneItemID)

        -- Avoid removing a non-existent stone.
        if (stone.itemid == stoneItemID) then doRemoveItem(stone.uid) end
        local cueball = getTileItemById(teleportPos, 1387)

        -- Avoid creating 2 teleports.
        if (cueball.itemid == 1387) then doRemoveItem(cueball.uid) end

        doCreateTeleport(1387, tpToPos, teleportPos)
        doSendMagicEffect(teleportPos, CONST_ME_TELEPORT)
        doSendMagicEffect(stonePos, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid + 1)
    elseif (item.itemid == 1946) then
        local stone = getTileItemById(stonePos, stoneItemID)

        -- Avoid placing a 2nd stone.
        if (stone.itemid == stoneItemID) then doRemoveItem(stone.uid) end

        local cueball = getTileItemById(teleportPos, 1387)

        -- Avoid removing a non-existent teleport.
        if (cueball.itemid == 1387) then doRemoveItem(cueball.uid) end

        doCreateItem(stoneItemID, 1, stonePos)
        doSendMagicEffect(stonePos, CONST_ME_TELEPORT)
        doSendMagicEffect(teleportPos, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid - 1)
    end
    return TRUE
end