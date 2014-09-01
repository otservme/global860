function onUse(cid, item, fromPosition, itemEx, toPosition)

local time = 20

function Wall1()
	doDecayItem(doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8754).uid, 8755))
end

function Wall2()
	doDecayItem(doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8756).uid, 8757))
end

function Wall3()
	--[[local w3 = getTileItemById({x=33115,y=31702,z =12}, 8758).uid
	if w3 == 1 then]]--
	doDecayItem(doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8758).uid, 8759))
end

if (getPlayerStorageValue(cid,100080) == 2) then 
	if itemEx.itemid == 8753 then
		doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8753 ).uid, 8754)
		doCreatureSay(cid,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_MONSTER_YELL, false, cid, getThingPos(itemEx.uid)) 
		mw1 = addEvent(Wall1, time*1000)
		doSendMagicEffect(toPosition,49)
	elseif itemEx.itemid == 8755 then 
		doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8755 ).uid, 8756)
		doCreatureSay(cid,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_MONSTER_YELL, false, cid, getThingPos(itemEx.uid)) 
		mw2 = addEvent(Wall2, time*1000)
		doSendMagicEffect(toPosition,49)
		stopEvent(mw1)
	elseif itemEx.itemid == 8757 then 
		doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8757 ).uid, 8758)
		addEvent(Wall3, time*1000)
		doSendMagicEffect(toPosition,49)
		stopEvent(mw2)
		doCreatureSay(cid,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_MONSTER_YELL, false, cid, getThingPos(itemEx.uid)) 
	elseif itemEx.itemid == 8759 then 
		doCreatureSay(cid,""..getCreatureName(cid).." destroyed the shadow nexus! In 20 seconds it will return to its original state.",TALKTYPE_MONSTER_YELL, false, cid, getThingPos(itemEx.uid))
		setPlayerStorageValue(cid,100080, 3)
		doSendMagicEffect(toPosition,49)
		doPlayerRemoveItem(cid, 7494, 1)
		end
	return TRUE
end

if itemEx.actionid == 18898 and getPlayerStorageValue(cid, 99220) == -1 then
    if getPlayerStorageValue(cid, 90000) == 4 then
	doSendMagicEffect(toPosition, 6)
	doPlayerRemoveItem(cid, 7494, 1)
	setPlayerStorageValue(cid, 99220, 1)
	if getPlayerStorageValue(cid, 99221) == 1 then
		setPlayerStorageValue(cid,100078,6)
		end
	end 
	return TRUE
end
	
local function reset()
doTransformItem(getTileItemById( {x=32260,y=32791,z =7},8696 ).uid, 8697)
end

if itemEx.actionid == 18899 then
	if getPlayerStorageValue(cid, 49312) == 1 then
	doSendMagicEffect(toPosition, CONST_ME_HOLYAREA)
	doSummonCreature("Pirate Ghost", { x =32257, y =32791, z =7})
	setPlayerStorageValue(cid, 49312, 2)
	doPlayerRemoveItem(cid, 7494, 1)
	addEvent(reset, 10*1000)
	doTransformItem(getTileItemById( {x=32260,y=32791,z =7},8697 ).uid, 8696)
	setPlayerStorageValue(cid,100078,15)
	end
	return TRUE
	end
end