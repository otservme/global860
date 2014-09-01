local config = { 
    message = "Go into the teleport, else the teleport will disappear in 180seconds.", 
    timeToRemove = 30, -- seconds 
    teleportId = 1387, 
    bosses = { -- Monster Name, Teleport To Position, Teleport Position 
         ["Azerus3"] = {}
     } 
} 

local function removal(position)
	position.stackpos = 1
	if getThingfromPos(position).itemid == config.teleportId then
		doRemoveItem(getThingfromPos(position).uid)
	end
	return TRUE
end

function onKill(cid, target, damage, flags)
    if(bit.band(flags, 1) == 1 and isMonster(target)) then
		local t = config.bosses[getCreatureName(target)]
		if t == nil then
			return true
		end
		doCreateTeleport(config.teleportId, {x=32783, y=31168, z=10}, { x = 32783, y = 31168, z = 10 })
		doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(removal, config.timeToRemove * 1000, { x = 32783, y = 31168, z = 10 })
	end
	return true
end
	