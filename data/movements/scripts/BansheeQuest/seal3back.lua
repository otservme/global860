function onStepIn(cid, item, pos, fromPos)
	if isPlayer(cid) then
		doTeleportThing(cid, {x=32186, y=31938, z=14})
                        doSendMagicEffect(getCreaturePosition(cid), 10)
		end
end