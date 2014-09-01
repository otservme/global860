function onUse(cid, item, fromPosition, itemEx, toPosition)
local time = 300 -- 60 = 1min 
local f = function(p)
	doTransformItem(getTileItemById(p, 1945).uid, 1946)
end
 
if item.uid == 42991 and item.itemid == 1946 then
if getPlayerStorageValue(cid,42992) == 1 and getPlayerStorageValue(cid,42991) == -1 then
doTransformItem(item.uid,1945)
setPlayerStorageValue(cid,42991,1)
doSendMagicEffect({x=32217, y=31844, z=14}, 11)
doSendMagicEffect({x=32218, y=31844, z=14}, 11)
doSendMagicEffect({x=32219, y=31843, z=14}, 11)
doSendMagicEffect({x=32220, y=31845, z=14}, 11)
doSendMagicEffect({x=32219, y=31845, z=14}, 11)
addEvent(f, time * 1000, fromPosition)
end
	else
		doPlayerSendCancel(cid, "You have already used this switch.")
	end
	return true
end