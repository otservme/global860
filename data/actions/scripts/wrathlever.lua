local FirstLamps = {
    {x=33369, y=31075, z=8}, 
    {x=33372, y=31075, z=8},
    {x=33375, y=31075, z=8}
}

local SecondLamps = {
  	{x=33360, y=31079, z=8}, 
   	{x=33360, y=31081, z=8},
  	{x=33357, y=31077, z=8}
}
local ThirdLamp = {
   	{x=33346, y=31074, z=8}
}

local FourthWall = {
    	{x=33355, y=31068, z=9}, 
    	{x=33355, y=31069, z=9},
    	{x=33355, y=31070, z=9},
	{x=33355, y=31071, z=9}
}

function Close()
	for _, v in ipairs(FirstLamps) do
		doTransformItem(getTileItemById(v, 11402).uid, 11414)
		doTransformItem(getTileItemById({x=33370, y=31067, z=9}, 10045).uid, 10044)
	end
end

function SecondClose()
	for _, v in ipairs(SecondLamps) do
		doTransformItem(getTileItemById(v, 11401).uid, 11416)
		doTransformItem(getTileItemById({x=33359, y=31070, z=9}, 10045).uid, 10044)
	end
end

function ThirdClose()
	for _, v in ipairs(ThirdLamp) do
		doTransformItem(getTileItemById(v, 11401).uid, 11416)
		doTransformItem(getTileItemById({x=33351, y=31069, z=9}, 10045).uid, 10044)
	end
end

function FourthWall()
	for _, v in ipairs(ThirdLamp) do
		doCreateItem(9264, 1, {x=33355, y=31068, z=9})
		doCreateItem(9207, 1, {x=33355, y=31069, z=9})
		doCreateItem(9209, 1, {x=33355, y=31070, z=9})
		doCreateItem(9264, 1, {x=33355, y=31071, z=9})
		doTransformItem(getTileItemById({x=33349, y=31075, z=8}, 10045).uid, 10044)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 24232 and item.itemid == 10044 then
		for _, v in ipairs(FirstLamps) do
			doTransformItem(getTileItemById(v, 11414).uid, 11402)
			doTransformItem(item.uid, item.itemid + 1)
		end
		addEvent(Close, 10000)
	elseif item.actionid == 24233 and item.itemid == 10044 then
		for _, v in ipairs(SecondLamps) do
			doTransformItem(getTileItemById(v, 11416).uid, 11401)
			doTransformItem(item.uid, item.itemid + 1)
		end
		addEvent(SecondClose, 10000)
	elseif item.actionid == 24234 and item.itemid == 10044 then
		for _, v in ipairs(ThirdLamp) do
			doTransformItem(getTileItemById(v, 11416).uid, 11401)
			doTransformItem(item.uid, item.itemid + 1)
		end
		addEvent(ThirdClose, 10000)
	elseif item.actionid == 24235 and item.itemid == 10044 then
		for _, v in ipairs(ThirdLamp) do
		doRemoveItem(getTileItemById({x=33355, y=31068, z=9}, 9264).uid)
		doRemoveItem(getTileItemById({x=33355, y=31069, z=9}, 9207).uid)
		doRemoveItem(getTileItemById({x=33355, y=31070, z=9}, 9209).uid)
		doRemoveItem(getTileItemById({x=33355, y=31071, z=9}, 9264).uid)
			doTransformItem(item.uid, item.itemid + 1)
		end
		addEvent(FourthWall, 10000)
	end
	return true
end