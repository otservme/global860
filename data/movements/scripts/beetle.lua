function onStepIn(cid, item, pos)
local tpback = {x=33362, y=31203, z=8}
local out = {x=33356, y=31180, z=8}
--local outfit = {lookType = getPlayerStorageValue(cid, 3431), lookHead = getPlayerStorageValue(cid, 3432), lookAddons = getPlayerStorageValue(cid, 3433), lookLegs = getPlayerStorageValue(cid, 3434), lookBody = getPlayerStorageValue(cid, 3435), lookFeet = getPlayerStorageValue(cid, 3436)}--

	if getCreatureOutfit(cid).lookType == 348 then
		doTeleportThing(cid, out, TRUE)
		doPlayerAddItem(cid,12245,1)
		--doCreatureChangeOutfit(cid, outfit)--
		setPlayerStorageValue(cid, 28292, 1)
	else	
		doTeleportThing(cid, tpback, TRUE)
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
		doCreatureSay(cid, 'Even if you would fit through this hole - a huge \'NO\' is written on the face of the djinn next to you.', TALKTYPE_ORANGE_1)
end
end