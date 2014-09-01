local poison = createConditionObject(CONDITION_POISON)
setConditionParam(poison, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(poison, 20, 3000, -50)

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if (isPlayer(cid)) then
	doTransformItem(item.uid, 417)	

   local valid_time = 20 -- storage is valid for 1 minute (60 seconds)
   doCreatureSetStorage(cid, 2010, os.time()+valid_time)
   doAddCondition(cid, poison) 
   doSendMagicEffect(getThingPos(cid),7)
   end
   return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if (isPlayer(cid)) then
		doTransformItem(item.uid, 416)
	end
	return true
end