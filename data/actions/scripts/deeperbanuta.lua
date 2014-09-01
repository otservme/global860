local newsPosition = {x=32808, y=32632, z=11}
local storageWrath = 42324 -- Storagevalue Wrath of the Emperor (finished = )

function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,42830) == 2 and getPlayerStorageValue(cid,storageWrath) == 4 and getPlayerStorageValue(cid,12288) == 1 then
            doCreatureSay(cid, "Welcome to Deeper Banuta", TALKTYPE_ORANGE_1)
            pos = getPlayerPosition(cid)

            if pos.x == topos.x then
                if pos.y < topos.y then
                    pos.y = topos.y + 1
                else
                    pos.y = topos.y - 1
                end
            elseif pos.y == topos.y then
                if pos.x < topos.x then
                    pos.x = topos.x + 1
                else
                    pos.x = topos.x - 1
                end
            else
                doPlayerSendTextMessage(cid,22,'Please stand in front of the door.')
            return TRUE
            end

            doTeleportThing(cid, newsPosition, TRUE)
		    doSendMagicEffect(newsPosition, CONST_ME_POFF)
        else
            doCreatureSay(cid, 'You dont have enough energy to enter this place.', TALKTYPE_ORANGE_1)
        end
        return TRUE
end