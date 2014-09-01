function onAttack(cid, target)
	if not isPlayer(cid) or not isMonster(target) then return true end
	if not isInRange(getCreaturePosition(cid), questAreaPosition[1], questAreaPosition[2]) and isInRange(getCreaturePosition(target), questAreaPosition[1], questAreaPosition[2]) then
		return false
	end
	return true
end