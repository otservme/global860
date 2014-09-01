function onStepIn(cid, item, pos, fromPos)
	if isPlayer(cid) then
		doSendMagicEffect(getCreaturePosition(cid), 14)
		end
end