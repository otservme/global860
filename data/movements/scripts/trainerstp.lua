local train = {x=32238, y=32233, z=7}

function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
	    	doTeleportThing(cid,train)
	    	doSendMagicEffect(getThingPos(cid),CONST_ME_TELEPORT)
	if item.actionid == 2123 then --Ab'Dendriel
           	setPlayerStorageValue(cid,100108, 1)
        elseif item.actionid == 2124 then --Ankrahmun 
           	setPlayerStorageValue(cid,100109, 1)
        elseif item.actionid == 2125 then --Carlin  
           	setPlayerStorageValue(cid,100110, 1)
        elseif item.actionid == 2126 then --Darashia 
           	setPlayerStorageValue(cid,100111, 1)
        elseif item.actionid == 2127 then --Edron 
           	setPlayerStorageValue(cid,100112, 1)
        elseif item.actionid == 2128 then --Kazordoon 
           	setPlayerStorageValue(cid,100113, 1)
        elseif item.actionid == 2129 then --Liberty Bay 
           	setPlayerStorageValue(cid,100114, 1)
        elseif item.actionid == 2130 then --Port Hope 
           	setPlayerStorageValue(cid,100115, 1)
        elseif item.actionid == 2131 then --Svargrond 
           	setPlayerStorageValue(cid,100116, 1)
        elseif item.actionid == 2132 then  --Thais
           	setPlayerStorageValue(cid,100117, 1)
        elseif item.actionid == 2133 then --Venore  
           	setPlayerStorageValue(cid,100118, 1)
        elseif item.actionid == 2134 then --Yalahar
           	setPlayerStorageValue(cid,100119, 1)
	    	end
        end
end  