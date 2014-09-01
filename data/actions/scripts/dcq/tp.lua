function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 33227 and itemEx.itemid == 2249 then
		doTransformItem(itemEx.uid, 1387)
		doSendMagicEffect({x=32848, y=32232, z=9}, 5)
		doSendMagicEffect({x=32849, y=32232, z=9}, 5)
		doSendMagicEffect({x=32849, y=32233, z=9}, 5)
		doSendMagicEffect({x=32850, y=32231, z=9}, 5)
		doSendMagicEffect({x=32849, y=32231, z=9}, 5)
		doSendMagicEffect({x=32848, y=32231, z=9}, 5)
		doSendMagicEffect({x=32847, y=32231, z=9}, 5)
		doSendMagicEffect({x=32848, y=32230, z=9}, 5)
		doSendMagicEffect({x=32849, y=32230, z=9}, 5)
	    	doRemoveItem(item.uid,1)	
	if itemEx.itemid == 2605 then
		doTransformItem(itemEx.uid, 2604)
		doSendMagicEffect(toPosition, CONST_ME_HITBYFIRE)

	end
end

if(itemEx.itemid == 5466) then
	doSendMagicEffect(toPosition, CONST_ME_HITBYFIRE)
	doTransformItem(itemEx.uid, 5465)

	doRemoveItem(item.uid, 1)
	doDecayItem(itemEx.uid)
	end
        return true
end
