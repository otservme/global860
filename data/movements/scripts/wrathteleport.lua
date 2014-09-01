local safe = {x=33212, y=31066, z=9}
local zao = {x=33137, y=31247, z=6}
local zlak = {x=33077, y=31218, z=8}
local kita = {x=32856, y=31055, z=9}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if item.actionid == 7300 and getPlayerStorageValue(cid, 42830) >= 2 then
		doTeleportThing(cid,safe)
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif item.actionid == 7301 and getPlayerStorageValue(cid, 42830) >= 2 then
		doTeleportThing(cid,zao)
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif item.actionid == 7302  and getPlayerStorageValue(cid, 42830) >= 3 then
		doTeleportThing(cid,zlak)
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif item.actionid == 7303 and getPlayerStorageValue(cid, 42830) >= 3 then
		doTeleportThing(cid,kita)
		doSendMagicEffect(getCreaturePosition(cid),47)
	else
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(getCreaturePosition(cid),47)
	end
end