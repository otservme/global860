function onUse(cid, item, fromPosition, itemEx, toPosition)
gatepos = {x=685, y=42, z=7, stackpos=1} -- Posição da Parede 1
getgate = getThingfromPos(gatepos)
gatepos2 = {x=601, y=42, z=7, stackpos=1} -- Posição da Parede 2
getgate2 = getThingfromPos(gatepos2)

if item.uid == 5533 and item.itemid == 1945 and getgate.itemid == 1304 and getgate2.itemid == 1304 then
doRemoveItem(getgate.uid,1)
doRemoveItem(getgate2.uid,1)
doTransformItem(item.uid,1946)

elseif item.uid == 5533 and item.itemid == 1946 and getgate.itemid == 1304 and getgate2.itemid == 1304 then
doRemoveItem(getgate.uid,1)
doRemoveItem(getgate2.uid,1)
doTransformItem(item.uid,1945)
end
return 1
end