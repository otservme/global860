function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) and getPlayerStorageValue(cid,6076) == -1 then
		doCreatureSay(cid,"You can choose exactly one of these chests. Choose wisely!",TALKTYPE_ORANGE_1)
	end 
end