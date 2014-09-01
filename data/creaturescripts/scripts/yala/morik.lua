local config = {
	bosses = { -- Monster Name,  Teleport Position
		["Morik the Gladiator"] = { },
	},
}

function onKill(cid, target, damage, flags)
    if(bit.band(flags, 1) == 1 and isMonster(target)) then
		local t = config.bosses[getCreatureName(target)]
		if t == nil then
			return true
		end
		setPlayerStorageValue(cid,100031, 2)
	end
	return true
end