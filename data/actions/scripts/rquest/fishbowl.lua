function onUse(cid, item, fromPosition, itemEx, toPosition)
    local pos = getThingPos(itemEx.uid)
	if item.itemid == 5928 and itemEx.itemid == 5554 then
				doSendMagicEffect(toPosition, 1)
				doTransformItem(item.uid,5929)
				doRemoveItem(itemEx.uid,1)
				addEvent(doCreateItem, 360 * 1000, 5554,1, pos)
				setPlayerStorageValue(cid, 9050, 16)
		end
    return TRUE
end
