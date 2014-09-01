function onUse(cid, item, fromPosition, itemEx, toPosition)
local outfit = {lookType = getPlayerStorageValue(cid, 3331), lookHead = getPlayerStorageValue(cid, 3332), lookAddons = getPlayerStorageValue(cid, 3333), lookLegs = getPlayerStorageValue(cid, 3334), lookBody = getPlayerStorageValue(cid, 3335), lookFeet = getPlayerStorageValue(cid, 3336)}
local storage = 42325
local areaPosition =
{
    {x=33380, y=31055, z=8, stackpos = 255}, --topleft
    {x=33400, y=31183, z=8, stackpos = 255}, --bottomright
	{x=33370, y=31093, z=8, stackpos = 255}, --topleft
    {x=33397, y=31117, z=8, stackpos = 255}, --bottomright
	{x=33349, y=31165, z=8, stackpos = 255}, --topleft
    {x=33383, y=31192, z=8, stackpos = 255}, --bottomright
	{x=33314, y=31058, z=8, stackpos = 255}, --topleft
    {x=33394, y=31090, z=8, stackpos = 255}, --bottomright
	{x=33327, y=31055, z=9, stackpos = 255}, --topleft
    {x=33387, y=31077, z=9, stackpos = 255}  --bottomright
}

	if isInRange(getCreaturePosition(cid), areaPosition[1], areaPosition[2]) or isInRange(getCreaturePosition(cid), areaPosition[3], areaPosition[4]) or isInRange(getCreaturePosition(cid), areaPosition[5], areaPosition[6]) or isInRange(getCreaturePosition(cid), areaPosition[7], areaPosition[8]) or isInRange(getCreaturePosition(cid), areaPosition[9], areaPosition[10]) then
		if getPlayerStorageValue(cid,storage) ~= 1 then
			setPlayerStorageValue(cid, 3331, getCreatureOutfit(cid).lookType)
			setPlayerStorageValue(cid, 3332, getCreatureOutfit(cid).lookHead)
			setPlayerStorageValue(cid, 3333, getCreatureOutfit(cid).lookAddons)
			setPlayerStorageValue(cid, 3334, getCreatureOutfit(cid).lookLegs)
			setPlayerStorageValue(cid, 3335, getCreatureOutfit(cid).lookBody)
			setPlayerStorageValue(cid, 3336, getCreatureOutfit(cid).lookFeet)
			doSetItemOutfit(cid, 12245, -1)
			setPlayerStorageValue(cid, storage, 1)
			doCreatureSay(cid, 'You remove its top and pull the crate over yourself. Inside it is stifling and you can barely see a thing when looking outward.', TALKTYPE_ORANGE_1)
			
		elseif getPlayerStorageValue(cid,storage) == 1 then
			doCreatureChangeOutfit(cid, outfit)
			setPlayerStorageValue(cid, storage, 0)
			doCreatureSay(cid, 'Somewhat relieved you catch a deep breath of fresh air as you remove your temporary disguise.', TALKTYPE_ORANGE_1)
		end	
	end
	return false
end

