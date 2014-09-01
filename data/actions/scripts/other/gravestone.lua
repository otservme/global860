local newpos = {x = 32791, y = 32332, z = 10}
local splash = {x = 32791, y = 32333, z = 9}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local blood = getTileItemById(splash, 2016)
	local blooda = getTileItemById(splash, 2025)
	if blood.uid > 0 and blood.type == 2 then
		doRemoveItem(blood.uid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_DRAWBLOOD)
		doTeleportThing(cid, newpos)
		doSendMagicEffect(newpos, CONST_ME_TELEPORT)
		doCreatureSay(cid, "Muahahahaha...", TALKTYPE_ORANGE_1)
	elseif blooda.uid > 0 and blooda.type == 2 then
		doRemoveItem(blooda.uid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_DRAWBLOOD)
		doCreatureSay(cid, "Muahahahaha...", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, newpos)
		doSendMagicEffect(newpos, CONST_ME_TELEPORT)
	else	
		doSendMagicEffect(getThingPos(cid), CONST_ME_DRAWBLOOD)
		doCreatureSay(cid, "Muahahahaha...", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, newpos)
		doSendMagicEffect(newpos, CONST_ME_TELEPORT)
		end
	return true
end