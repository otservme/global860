local FirstLamps = {
    {x=33369, y=31075, z=8}, 
    {x=33372, y=31075, z=8},
    {x=33375, y=31075, z=8}
}

local SecondLamps = {
    {x=33360, y=31079, z=8}, 
    {x=33360, y=31081, z=8},
    {x=33357, y=31077, z=8}
}
local ThirdLamp = {
    {x=33346, y=31074, z=8}
}

local jail = {x=33362, y=31208, z=8}

function onStepIn(cid, item, pos)

if item.actionid == 27232 then
for _, v in ipairs(FirstLamps) do
if getTileItemById(v, 11414).uid > 0 then
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	doTeleportThing(cid, jail, TRUE)
	doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
                  		doPlayerRemoveItem(cid, 12245, 1)
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	end
	end
elseif item.actionid == 27233 then
for _, v in ipairs(SecondLamps) do
if getTileItemById(v, 11416).uid > 0 then
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	doTeleportThing(cid, jail, TRUE)
	doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
                  		doPlayerRemoveItem(cid, 12245, 1)
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	end
	end
elseif item.actionid == 27234 then
for _, v in ipairs(ThirdLamp) do
if getTileItemById(v, 11416).uid > 0 then
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	doTeleportThing(cid, jail, TRUE)
	doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
                  		doPlayerRemoveItem(cid, 12245, 1)
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	end
	end
else
return false
end
end