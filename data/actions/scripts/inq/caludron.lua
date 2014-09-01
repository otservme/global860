function onUse(cid, item, fromPosition, itemEx, toPosition) 
	if itemEx.actionid == 18898 then
    if getPlayerStorageValue(cid, 90000) == 4 then
				doSendMagicEffect(toPosition, 6)
				doPlayerRemoveItem(cid, 7494, 1)
				setPlayerStorageValue(cid, 99220, 1)
			else
			end
	  else
	end 
	
local function reset()
doTransformItem(getTileItemById( {x=32260,y=32791,z =7},8696 ).uid, 8697)
end

	if itemEx.actionid == 18899 then
		if getPlayerStorageValue(cid, 49312) == 1 then
				doSendMagicEffect(toPosition, CONST_ME_HOLYAREA)
				doSummonCreature("Pirate Ghost", { x =32257, y =32791, z =7})
				setPlayerStorageValue(cid, 49312, 2)
				doPlayerRemoveItem(cid, 7494, 1)
				addEvent(reset, 10*1000)
				doTransformItem(getTileItemById( {x=32260,y=32791,z =7},8697 ).uid, 8696)
				setPlayerStorageValue(cid,100078,15)
			else
	end
    return TRUE
end
end