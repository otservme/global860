local coins = {
	[2195] = {
		to = 5891, effect = TEXTCOLOR_YELLOW
	},
	[5891] = {
		from = 2195, effect = TEXTCOLOR_LIGHTBLUE
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local coin = coins[item.itemid]
	if(not coin) then
		return false
	end

	if(item.itemid == 2195 and doPlayerRemoveItem(cid, 2195, 1)) then
		doPlayerAddItem(cid, 5891, 1)
		doSendAnimatedText(fromPosition, "Fusham", coins[coin.to].effect)
	elseif(item.itemid == 5891 and doPlayerRemoveItem(cid, 5891, 1)) then
		doPlayerAddItem(cid, 2195, 1)
		doSendAnimatedText(fromPosition, "Fushum", coins[coin.from].effect)
	end

	return true
end
