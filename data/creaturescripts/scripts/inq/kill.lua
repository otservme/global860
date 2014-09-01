function onKill(cid, target, damage, flags)
    local Vamp,Demon = {"The Count", "The Weakened Count"},{"Ungreez"}
    if(bit.band(flags, 1) == 1 and isMonster(target)) then  
	if isInArray(Vamp, getCreatureName(target)) and getPlayerStorageValue(cid,100078) == 10 then
		setPlayerStorageValue(cid, 100078, 11)
	elseif isInArray(Demon, getCreatureName(target)) then
		setPlayerStorageValue(cid,57684, 2)
		setPlayerStorageValue(cid,100078,21)
		end  
	end
	return true
end