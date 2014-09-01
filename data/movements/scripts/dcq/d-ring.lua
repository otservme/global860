local function f()
	for y = 32231, 32233 do
		doCreateItem(2722, 1, {x=32857, y=y, z=11})
	end
end

function onAddItem(moveitem, tileitem, pos)
	if moveitem.itemid == 6300 then
		local t = {}
		for y = 32231, 32233 do
			local c = getTileItemById({x=32857, y=y, z=11}, 2722).uid
			if c == 0 then
				return
			end
			table.insert(t, c)
		end
		for i = 1, 3 do
			doRemoveItem(t[i])
		end
		doRemoveItem(moveitem.uid)
		doSendMagicEffect(pos, CONST_ME_POFF)
		addEvent(f, 15000)
	end
end