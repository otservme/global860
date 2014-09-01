function onStepIn(cid, item, pos)

local go1 = {x=32875, y=32274, z=14}

    if(item.actionid == 2222) and (item.itemid == 1387) then
		doTeleportThing(cid,go1)
        doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
		local tp = doRemoveItem(item.uid, 1387)
		if getPlayerStorageValue(cid, 100106) < 9 then
			setPlayerStorageValue(cid, 100106, 9)
		end 
        end
    return 1
end  