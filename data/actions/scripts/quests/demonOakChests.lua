function onUse(cid, item, fromPosition, itemEx, toPosition)

        if item.uid == 12901 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Demon Legs.")
                        doPlayerAddItem(cid, 2495, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
                end
        elseif item.uid == 12902 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Rainbow Shield.")
                        doPlayerAddItem(cid, 8905, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
                end
        elseif item.uid == 12904 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Spellbook of Dark Mysteries.")
                        doPlayerAddItem(cid, 8918, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
                end
        elseif item.uid == 12903 then
                queststatus = getPlayerStorageValue(cid, 12900)
                if queststatus < 1 then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Royal Crossbow.")
                        doPlayerAddItem(cid, 8851, 1)
                        doPlayerSetStorageValue(cid, 12900, 1)
                else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
                end
        end
                return TRUE
end