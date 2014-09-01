local ITEM_IDS = {
                [5469] = 5513,
                [5470] = 5514
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
                if(itemEx.itemid == 5469 or itemEx.itemid == 5470) then
                                doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
                                doTransformItem(itemEx.uid, ITEM_IDS[itemEx.itemid])
                          
                                doRemoveItem(item.uid, 1)
                                doDecayItem(itemEx.uid)
                                return true
                elseif itemEx.itemid == 5513 or itemEx.itemid == 5514 then
                                return doPlayerSendCancel(cid, "This machine is processing a bunch already.")
                end
end
