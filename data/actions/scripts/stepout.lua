local outfit = {lookType = getPlayerStorageValue(cid, 3331), lookHead = getPlayerStorageValue(cid, 3332), lookAddons = getPlayerStorageValue(cid, 3333), lookLegs = getPlayerStorageValue(cid, 3334), lookBody = getPlayerStorageValue(cid, 3335), lookFeet = getPlayerStorageValue(cid, 3336)}
local storage = 42325

function onStepIn(cid, item, pos)
	if item.actionid == 25232 and getPlayerStorageValue(cid,storage) == 1 then
			doCreatureChangeOutfit(cid, outfit)
			setPlayerStorageValue(cid, storage, 0)
else
end
return false
end