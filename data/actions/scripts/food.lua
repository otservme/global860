local CHANCES = 50 --Chances of advancing to the next stadium
local WATERINGCAN_ID = 7734
local WATERED = {7673, 7670, 7680, 7682, 7684, 7686, 7688, 7690, 7992, 7994, 9982, 9990, 9986, 9988} --Plants that don't need water...for the moment
local PLANTSPECIES = {7680, 7682, 7684, 7686, 9982, 9986} --The first time the plant type will be recognizable
local PLANTADVANCES = {[7679] = {7670, 7673}, [7681] = {7688, 7680}, [7683] = {7690, 7682}, [7685] = {7692, 7684}, [7687] = {7694, 7686}, [9983] = {9990, 9982}, [9987] = {9988, 9986}} --In what will it transforms to if it advances or not
local LASTSTADIUM = {7689, 7691, 7693, 7695, 9991, 9989} --When you water this plant's, they don't change, but the time remaining for them to dry resets
local WHITEREDPLANTS = {[7674] = 7688, [7675] = 7690, [7676] = 7692, [7677] = 7694, [9984] = 9990, [9985] = 9988} --Whitered plants Id's and the plant's they will become when recovered
function onUse(cid, item, fromPosition, itemEx, toPosition)
local RANDOM = math.random(100)
	if WHITEREDPLANTS[itemEx.itemid] ~= nil then
		doCreatureSay(cid,"You finally remembered to water your plant and it recovered.",TALKTYPE_ORANGE_1)
		doTransformItem(itemEx.uid,WHITEREDPLANTS[itemEx.itemid])
	elseif itemEx.itemid == 7655 then
		doCreatureSay(cid,"You should plant some seeds first.",TALKTYPE_ORANGE_1)
	elseif itemEx.itemid == 7665 then
		doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
		doTransformItem(itemEx.uid,itemEx.itemid+8)
	elseif isInArray(WATERED,itemEx.itemid) == TRUE then
		doCreatureSay(cid,"Your plant doesn't need water.",TALKTYPE_ORANGE_1)
	elseif PLANTADVANCES[itemEx.itemid] ~= nil then
		if RANDOM <= CHANCES then
			doTransformItem(itemEx.uid,PLANTADVANCES[itemEx.itemid][1])
			doCreatureSay(cid,"Your plant has grown to the next stage!",TALKTYPE_ORANGE_1)
		else
			doTransformItem(itemEx.uid,PLANTADVANCES[itemEx.itemid][2])
			doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
		end
	elseif itemEx.itemid == 7678 then
		if RANDOM <= CHANCES then
			doCreatureSay(cid,"Your plant has grown to the next stage!",TALKTYPE_ORANGE_1)
			doTransformItem(itemEx.uid,PLANTSPECIES[math.random(4)])
		else
			doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
			doTransformItem(itemEx.uid,itemEx.itemid-8)
		end
	elseif isInArray(LASTSTADIUM, itemEx.itemid) == TRUE then
		doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
		doTransformItem(itemEx.uid,itemEx.itemid-1)
	end
	doDecayItem(itemEx.uid)
	return TRUE
end
