function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32713, y=32394, z=8}
        if(item.itemid == 1406 and getPlayerStorageValue(cid, 35700) > 0) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                setPlayerStorageValue(cid, 35700, -1)
        end
        return TRUE
end