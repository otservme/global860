function onThink(interval, lastExecution)
    local fromPos = {x=32707, y=32345, z=7}
    local toPos = {x=32725, y=32357, z=7}
	local amount = 0
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				if isPlayer(getTopCreature({x=x,y=y,z=z}).uid) then
					amount = amount+1
				end
			end
		end
	end
 
	if getGameState() == GAMESTATE_NORMAL then
		if math.random(1,2) == 1 then
			if positions and positions.demonOak and type(positions.demonOak) == "table" and questAreaPosition and questAreaPosition[1] and type(questAreaPosition[1]) == "table" and questAreaPosition[2] and type(questAreaPosition[2]) == "table" then
				local rangeX, rangeY = getDistanceBetween(positions.demonOak, questAreaPosition[1]) + 3, getDistanceBetween(positions.demonOak, questAreaPosition[2]) + 3
				local list = getSpectators(positions.demonOak, rangeX, rangeY)
				if list and #list > 0 then
					for _, uid in ipairs(list) do
						if (isPlayer(uid) and amount == 0) then
							doCreatureSay(uid, sounds[1][math.random(#sounds[1])], TALKTYPE_MONSTER_YELL, false, uid, positions.demonOak)
						else
						end
					end
				end
			end
		end
	end
	return true
end