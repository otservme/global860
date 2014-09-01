local storage = 100042
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, storage) == -1) then
	local ret = doCreateMonster("Morik the Gladiator", getThingPos(cid),true) 
	    doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
            setPlayerStorageValue(cid,storage, 1)
	        end
	        return true
end