local config = {
	timeToRemove = 180 , -- seconds
	message = "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear",
	teleportId = 1387,
	bosses = { -- Monster Name,  Teleport Position
		["Ushuriel"] = {  pos={ x=33157, y=31725, z=11 }, aid=1001, stor=100079, value=3},
		["Zugurosh"] = {  pos={ x=33123, y=31689, z=11 }, aid=1002, stor=100079, value=6},
		["Madareth"] = {  pos={ x=33194, y=31768, z=11 }, aid=1003, stor=100078, value=25},
		["Golgordan"] = { pos={ x=33235, y=31734, z=11 }, aid=1004, brother = "Latrivan", stor=100078, value=28},
		["Latrivan"] = { pos={ x=33235, y=31734, z=11 }, aid=1004, brother = "Golgordan", stor=100078, value=28},
		["Annihilon"] = {  pos={ x=33200, y=31704, z=11 }, aid=1005, stor=100078, value=32},
		["Hellgorak"] = {  pos={ x=33107, y=31735, z=11 }, aid=1006, stor=100078, value=35},
	},
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
		if t.brother then
			for x = 33224, 33240 do
				for y = 31722, 31734 do
					local v = getTopCreature({x=x, y=y, z=11})
					if v.type == 2 and getCreatureName(v.uid) == t.brother then
						return true
					end
				end
			end
		end
		if (getPlayerStorageValue(cid, t.stor) < t.value) then
		setPlayerStorageValue(cid, t.stor, t.value)
        end
		doItemSetAttribute(doCreateItem(config.teleportId, t.pos), "aid", t.aid)
		doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(removal, config.timeToRemove * 1000, t.pos)
	end
	return true
end