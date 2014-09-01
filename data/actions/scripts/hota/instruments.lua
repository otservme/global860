local storage = 100137
function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.actionid == 2137 then
doSendMagicEffect(toPosition, math.random(21, 24))
elseif item.uid == 2138 then
if getPlayerStorageValue(cid,storage) == -1 then
   setPlayerStorageValue(cid, storage,1)
   doSendMagicEffect(toPosition, math.random(21, 24))
   else
   doSendMagicEffect(toPosition, math.random(21, 24))
end
elseif item.uid == 2139 then
if getPlayerStorageValue(cid,storage) == 1 then
   setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
   doSendMagicEffect(toPosition, math.random(21, 24))
   else
   doSendMagicEffect(toPosition, math.random(21, 24))
end
elseif item.uid == 2140 then
if getPlayerStorageValue(cid,storage) == 2 then
   setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
   doSendMagicEffect(toPosition, math.random(21, 24))
   else
   doSendMagicEffect(toPosition, math.random(21, 24))
end
elseif item.uid == 2141 then
if getPlayerStorageValue(cid,storage) == 3 then
   setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
   doSendMagicEffect(toPosition, math.random(21, 24))
   else
   doSendMagicEffect(toPosition, math.random(21, 24))
end
elseif item.uid == 2142 then
doSendMagicEffect(toPosition, math.random(21, 24))
if getPlayerStorageValue(cid,storage) == 4 then
   setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
   doSendMagicEffect(toPosition, math.random(21, 24))
   else
   doSendMagicEffect(toPosition, math.random(21, 24))
end
end
return true
end