function onStepIn(cid, item, pos)
local storage = 42325
local lightoffid = 12175 --id of light so you can walk
local tpback = {x=33387, y=31142, z=8}
local jail = {x=33362, y=31208, z=8}
local outfit = {lookType = getPlayerStorageValue(cid, 3331), lookHead = getPlayerStorageValue(cid, 3332), lookAddons = getPlayerStorageValue(cid, 3333), lookLegs = getPlayerStorageValue(cid, 3334), lookBody = getPlayerStorageValue(cid, 3335), lookFeet = getPlayerStorageValue(cid, 3336)}
local lightPosition =
{
    {x=33385, y=31139, z=8, stackpos = 255}, 
    {x=33385, y=31134, z=8, stackpos = 255},
    {x=33385, y=31126, z=8, stackpos = 255},
    {x=33385, y=31119, z=8, stackpos = 255},
    {x=33385, y=31118, z=8, stackpos = 255}
}

	if getPlayerStorageValue(cid,storage) ~= 1 then
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
		doTeleportThing(cid, tpback, TRUE)
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	else	
		if (getCreaturePosition(cid).y == lightPosition[1].y) then
			peekhole = getTileItemById(lightPosition[1],lightoffid).uid
			if peekhole < 1 then
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
				doTeleportThing(cid, jail, TRUE)
				doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
				doCreatureChangeOutfit(cid, outfit)
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
                  		doPlayerRemoveItem(cid, 12245, 1)
			end
	
		elseif (getCreaturePosition(cid).y == lightPosition[2].y) then
			peekhole = getTileItemById(lightPosition[2],lightoffid).uid
			if peekhole < 1 then
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
				doTeleportThing(cid, jail, TRUE)
				doCreatureChangeOutfit(cid, outfit)
                  		doPlayerRemoveItem(cid, 12245, 1)
				doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
			end
	
		elseif (getCreaturePosition(cid).y == lightPosition[3].y) then
			peekhole = getTileItemById(lightPosition[3],lightoffid).uid
			if peekhole < 1 then
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
				doTeleportThing(cid, jail, TRUE)
				doCreatureChangeOutfit(cid, outfit)
                  		doPlayerRemoveItem(cid, 12245, 1)
				doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)

				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
			end
	
		elseif (getCreaturePosition(cid).y == lightPosition[4].y) then
			peekhole = getTileItemById(lightPosition[4],lightoffid).uid
			if peekhole < 1 then
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
				doTeleportThing(cid, jail, TRUE)
				doCreatureChangeOutfit(cid, outfit)
                  		doPlayerRemoveItem(cid, 12245, 1)
				doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)

				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
			end
		
		elseif (getCreaturePosition(cid).y == lightPosition[5].y) then
			peekhole = getTileItemById(lightPosition[5],lightoffid).uid
			if peekhole < 1 then
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
				doTeleportThing(cid, jail, TRUE)
                  		doPlayerRemoveItem(cid, 12245, 1)
				doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)

				doCreatureChangeOutfit(cid, outfit)
				doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
			end
		end	
	end
end