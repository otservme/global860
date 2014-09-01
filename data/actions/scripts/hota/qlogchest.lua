function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,100147) == -1 then
	   	setPlayerStorageValue(cid,100147, 1)
		setPlayerStorageValue(cid,100158, 1)
    	end
    if item.uid == 30720 and getPlayerStorageValue(cid,100148) == -1 then
	setPlayerStorageValue(cid,100148, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    elseif item.uid == 30721 and getPlayerStorageValue(cid,100149) == -1 then
       	setPlayerStorageValue(cid,100149, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    elseif item.uid == 30722 and getPlayerStorageValue(cid,100150) == -1 then
       	setPlayerStorageValue(cid,100150, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    elseif item.uid == 30723 and getPlayerStorageValue(cid,100151) == -1 then
       	setPlayerStorageValue(cid,100151, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    elseif item.uid == 30724 and getPlayerStorageValue(cid,100152) == -1 then
       	setPlayerStorageValue(cid,100152, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    elseif item.uid == 30725 and getPlayerStorageValue(cid,100153) == -1 then
       	setPlayerStorageValue(cid,100153, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    elseif item.uid == 30729 and getPlayerStorageValue(cid,100154) == -1 then
       	setPlayerStorageValue(cid,100154, 1)
	setPlayerStorageValue(cid, 100158, getPlayerStorageValue(cid, 100158) + 1)
    end
end