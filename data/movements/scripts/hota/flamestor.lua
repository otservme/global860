function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local effect = 13
if (isPlayer(cid)) then
    if item.uid == 2151 then
    if (getPlayerStorageValue(cid,100138) == 1 and getPlayerStorageValue(cid,100139) == 1 and getPlayerStorageValue(cid,100140) == 1 and getPlayerStorageValue(cid,100141) == 1 and getPlayerStorageValue(cid,100142) == 1 and getPlayerStorageValue(cid,100143) == 1 and getPlayerStorageValue(cid,100144) == 1) then
       doTeleportThing(cid,{x=33163,y=32694,z=14})
       doSendMagicEffect(getThingPos(cid),CONST_ME_TELEPORT)
	else
       doPlayerSendTextMessage(cid,25, "You are not worthy to enter this teleport.")
       doSendMagicEffect(getThingPos(cid),CONST_ME_TELEPORT)
       doTeleportThing(cid,fromPosition)
	end
	return true
    end

	if item.uid == 2144 and getPlayerStorageValue(cid,100138) == -1 then 
	setPlayerStorageValue(cid,100138, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	elseif item.uid == 2145 and getPlayerStorageValue(cid,100139) == -1 then 
	setPlayerStorageValue(cid,100139, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	elseif item.uid == 2146 and getPlayerStorageValue(cid,100140) == -1 then 
	setPlayerStorageValue(cid,100140, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	elseif item.uid == 2147 and getPlayerStorageValue(cid,100141) == -1 then 
	setPlayerStorageValue(cid,100141, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	elseif item.uid == 2148 and getPlayerStorageValue(cid,100142) == -1 then 
	setPlayerStorageValue(cid,100142, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	elseif item.uid == 2149 and getPlayerStorageValue(cid,100143) == -1 then 
	setPlayerStorageValue(cid,100143, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	elseif item.uid == 2150 and getPlayerStorageValue(cid,100144) == -1 then 
	setPlayerStorageValue(cid,100144, 1)
	doSendMagicEffect(getThingPos(cid),effect)
	end
	end
	return true
end