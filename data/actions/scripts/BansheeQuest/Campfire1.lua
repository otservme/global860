function onUse(cid, item, fromPosition, itemEx, toPosition)
gatepos = {x=32309, y=31975, z=13, stackpos=1}
getgate = getThingfromPos(gatepos)
local time = 300 -- 60 = 1min 
local f = function(p)
	doTransformItem(getTileItemById(p, 1946).uid, 1945)
	doCreateItem(1423,1,gatepos)
end
 
if item.uid == 42998 and item.itemid == 1945 and getTileItemById(gatepos, 1423).uid > 0 then
doRemoveItem(getTileItemById(gatepos, 1423).uid)
doCreateItem(1421,1,gatepos)
doTransformItem(item.uid,1946)
e = addEvent(f, time * 1000, fromPosition)
 
elseif item.uid == 42998 and item.itemid == 1946 and getTileItemById(gatepos, 1421).uid > 0 then
doRemoveItem(getTileItemById(gatepos, 1421).uid)
doCreateItem(1423,1,gatepos)
doTransformItem(item.uid,1945)
stopEvent(e)
e = 0
end
return 1
end