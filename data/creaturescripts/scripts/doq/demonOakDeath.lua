function onDeath(cid, corpse)
	if getCreatureStorage(cid, 100071) == 1 and getCreatureStorage(cid, 100070) < 1 then
		doCreatureSetStorage(cid, 100065, 1)
		doCreatureSetStorage(cid, 100066, 1)
		doCreatureSetStorage(cid, 100067, 1)
		doCreatureSetStorage(cid, 100068, 1)
		doCreatureSetStorage(cid, 100071, 0)
		checkAreaM(cid, {x=32707,y=32345,z=7},{x=32725,y=32357,z=7})
		end
	return true
end