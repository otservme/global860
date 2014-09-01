function onUse(cid, item, fromPosition, itemEx, toPosition)
                if(itemEx.itemid == 5464) then
                                doTransformItem(itemEx.uid, 5463)
                                doCreateItem(5467, 1, toPosition)
                                doDecayItem(itemEx.uid)
                                return true
                end
                return destroyItem(cid, itemEx, toPosition)
end
