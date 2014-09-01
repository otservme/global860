function onAddItem(moveitem, tileitem, position)
	if not(isPlayer(moveitem) or isPlayer(tileitem))then
	doRemoveItem(moveitem.uid)
	end
	return false
end