function onUse(cid, item, fromPosition, itemEx, toPosition)
local time = 10 -- 60 = 1min 
local f = function(p)
	if item.itemid == 1945 then
		doTransformItem(getTileItemById(p, 1945).uid, 1946)
	end
end
 
if item.uid == 42992 and item.itemid == 1946 then
if getPlayerStorageValue(cid,42992) == -1 then
doTransformItem(item.uid,1945)
setPlayerStorageValue(cid,42992,1)
doSendMagicEffect({x=32217, y=31845, z=14}, 11)
doSendMagicEffect({x=32218, y=31845, z=14}, 11)
doSendMagicEffect({x=32219, y=31845, z=14}, 11)
doSendMagicEffect({x=32220, y=31845, z=14}, 11)
doSendMagicEffect({x=32217, y=31843, z=14}, 11)
doSendMagicEffect({x=32218, y=31842, z=14}, 11)
doSendMagicEffect({x=32219, y=31841, z=14}, 11)
addEvent(f, time * 1000, fromPosition)
end
	else
		doPlayerSendCancel(cid, "This switch has been already used.")
	end
	return true
end