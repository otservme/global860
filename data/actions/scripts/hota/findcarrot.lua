	local fire = createConditionObject(CONDITION_FIRE)
	addDamageCondition(fire, 1, 1, -200)
	
function onUse(cid, item, fromPosition, itemEx, toPosition)
local time = 1
local f = function(p)
	doTransformItem(getTileItemById(p, 1946).uid, 1945)
end

function Back1()  
	local back = getTileItemById({x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z}, 2684, 1)
	if back.uid > 0 then
		doTransformItem(getTileItemById( {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},2684 ).uid, 2662)
	else
		doTransformItem(getTileItemById( {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},2355 ).uid, 2662)
	end
	return true
end
	local remove = getTileItemById({x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z}, 2662, 1)
	if item.itemid == 1945 then
		doTransformItem(item.uid,1946)
		if remove.uid > 0 then
			if math.random(1,3) == 1 then
				doTransformItem(getTileItemById( {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},2662 ).uid, 2684)
				setPlayerStorageValue(cid,100145,1)
				doSendMagicEffect({x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},math.random(28,30))
				e = addEvent(Back1, time *1000, fromPosition)
				f = addEvent(f, time * 1000, fromPosition)
			else
				doAddCondition(cid, fire)
				doTransformItem(getTileItemById( {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},2662 ).uid, 2355)
				doSendMagicEffect({x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},6)
				e = addEvent(Back1, time * 1000, fromPosition)
				f = addEvent(f, time * 1000, fromPosition)
			end
		end
	elseif item.itemid == 1946 then
		setPlayerStorageValue(cid, 100146,-1)
		local carrot = getTileItemById({x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z}, 2684, 1)
		doTransformItem(item.uid,1945)
			if carrot.uid > 0 then
				doTransformItem(getTileItemById( {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},2684 ).uid, 2662)
				stopEvent(e)
				stopEvent(f)
			else
				doTransformItem(getTileItemById( {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},2355 ).uid, 2662)
				stopEvent(e)
				stopEvent(f)
			end
		end
	return true
end