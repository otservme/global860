local words = {"YOU ARE DREAMING !","WAKE UP !"}
function onStepIn(cid, item, position, fromPosition)
        local pos = getThingPos(cid) 
		pos.x = pos.x + math.random(-3,3)
		pos.y = pos.y + math.random(-3,3)
	if isPlayer(cid) then
		doCreatureSay(cid, words[math.random(#words)], TALKTYPE_ORANGE_1, false, 0, pos)
	end 
	return true
end