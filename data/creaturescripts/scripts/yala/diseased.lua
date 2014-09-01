local config = {
	bosses = { -- Monster Name,  Teleport Position
		["Diseased Fred"] = {stor=100025, value=1},
		["Diseased Dan"] = {stor=100026, value=1},
		["Diseased Bill"] = {stor=100027, value=1}
	},
}

function onKill(cid, target, damage, flags)
    if(bit.band(flags, 1) == 1 and isMonster(target) and getPlayerStorageValue(cid, 100013) == 3) then
		local t = config.bosses[getCreatureName(target)]
		if t == nil then
			return true
		end
	if (getPlayerStorageValue(cid, t.stor) < t.value) then
		setPlayerStorageValue(cid, t.stor, t.value)
        end
        if (getPlayerStorageValue(cid, 100025) == 1 and getPlayerStorageValue(cid, 100026) == 1 and getPlayerStorageValue(cid, 100027) == 1) then
		   setPlayerStorageValue(cid,100086, 8)
        end
	end
	return true
end