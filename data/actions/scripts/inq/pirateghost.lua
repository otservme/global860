local function Eliminar()
local piedra2 = {x = 32256, y = 32790, z = 7, stackpos = 1}
local piedrapos = getThingfromPos(piedra2)
	doRemoveItem(piedrapos.uid, 1)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
local piedra = {x = 32256, y = 32790, z = 7}
	if item.itemid == 7494 and itemEx.actionid == 18899 then
		if getPlayerStorageValue(cid, 49312) == 1 then
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_EXPLOSIONHIT)
				doSummonCreature("Pirate Ghost", { x =32257, y =32791, z =7})
				setPlayerStorageValue(cid, 49312, 2)
				setPlayerStorageValue(cid, 61923, 1)
				doPlayerRemoveItem(cid, 7494, 1)
				doCreateItem(1304, 1, piedra)
				addEvent(Eliminar, 10*1000)
			if getPlayerStorageValue(cid, 53659) == 1 then
				setPlayerStorageValue(cid,100078,6)
			end
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need hold the item on you.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You arent a inquisition member")
		end
    return TRUE
end