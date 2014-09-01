local config = {
	bosses = { -- Monster Name,  Teleport Position
		["Inky"] = {stor=100028, value=1},
		["Sharptooth"] = {stor=100029, value=1},
		["Splasher"] = {stor=100030, value=1}
	},
}

function onKill(cid, target, damage, flags)
    if(bit.band(flags, 1) == 1 and isMonster(target) and getPlayerStorageValue(cid, 100086) == 21) then
		local t = config.bosses[getCreatureName(target)]
		if t == nil then
			return true
		end
		if (getPlayerStorageValue(cid, t.stor) < t.value) then
		   setPlayerStorageValue(cid, t.stor, t.value)
        end
	if (getPlayerStorageValue(cid, 100028) == 1 and getPlayerStorageValue(cid, 100029) == 1 and getPlayerStorageValue(cid, 100030) == 1) then
		setPlayerStorageValue(cid,100086, 22)
        end
	end
	return true
end