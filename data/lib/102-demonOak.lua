--PLEASE SPECIFY HERE WHAT DISTRO VERSION YOU ARE USING. IF YOU ARE USING (0.40/0.4.0)DEV SPECIFY IT AS 040
--IF YOU ARE USING 0.3.7/0.3.7PL1/0.3.6/0.3.5.... OR ANY OTHER VERSION OF 0.3, SPECIFY IT AS 037/036/035, ETC...
--THE IDEA IS TO SPECIFY IT WITHOUT ANY STRING CHARACTER, JUST NUMBERS
--MUST SPECIFY THIS PROPERLY TO MAKE SCRIPT WORKS CORRECTLY
DISTRO_VERSION = 040
--END
 
_INFO =
{
	UPDATED = "June 26 2012",
	VERSION = "0.70",
	REV = 1,
	AUTHOR = "Darkhaos, edited by Printer",
	CONTACT = "http://otland.net/members/darkhaos/"
}
 
if getStorage(0x65535) < 1 then
	doSetStorage(0x65536, os.clock())
	print("\n>> Loading Demon Oak Lib V" .. (_INFO.VERSION or "?") .. " REV: " .. (_INFO.REV or "?") .. " (" .. (_INFO.UPDATED or "?") .. ") By " .. (_INFO.AUTHOR or "?") .. " (Contact: " .. (_INFO.CONTACT or "?") .. ")")
	doSetStorage(0x65535, 1)
end
 
ITEM_DEADTREE = 2709
 
HALLOWEDAXE_PRICE = 1000
 
ERROR_NOERROR = 0
ERROR_TREEPOSITION = 1
ERROR_NOTENOUGHLEVEL = 2
ERROR_ALREADYDONE = 3
ERROR_ALREADYCUT = 4
ERROR_PLAYERINAREA = 5
ERROR_MISSINGINFO = 6
 
TYPE_PLAYER = 1
TYPE_MONSTER = 2
TYPE_NPC = 3
TYPE_ALL = 4
 
GET_COUNT = 1
GET_UID = 2
 
STORAGE_LIB = 100075
STORAGE_OAKTHINK = 100074
 
oneInArea = true
killAllBeforeCut = false
 
logEnabled = true
 
level = 120
waves = 0
positions =
{
	kick = { x = 32713, y = 32339, z = 7 },
	summon =
	{
		{x = 104, y = 83, z = 7}
	},
	rewardRoom = {x=32713, y = 32399, z = 8},
	demonOak = {x = 32716, y = 32352, z = 7}
}
 
summons =
{
	[1] = {"Rat"},
}
 
questAreaPosition =
{
        {x=32710, y=32346, z=7, stackpos = 255},
        {x=32722, y=32356, z=7, stackpos = 255}
}
 
demonOak = {8288, 8289, 8290, 8291}
 
storages =
{
	done = 35712,
	treeCut = 38551
}
 
blockingTree =
{
	[ITEM_DEADTREE] = {32193, 3614}
}
 
floorDamage =
{
	min = 270,
	max = 310,
	type = COMBAT_EARTHDAMAGE,
	effect = CONST_ME_BIGPLANTS
}
 
rewards =
{
	[12901] = {done = 12900, reward = 2495, count = 1},
	[12902] = {done = 12900, reward = 8905, count = 1},
	[12903] = {done = 12900, reward = 8918, count = 1},
	[12904] = {done = 12900, reward = 8851, count = 1}
}
 
sounds =
{
	[1] = --Messages shown when you wlak on special tiles
	{
		"Release me and you will be rewarded greatefully!",
		"What is this? Demon Legs lying here? Someone might have lost them!",
		"I'm trapped, come here and free me fast!!",
		"I can bring your beloved back from the dead, just release me!",
		"What a nice shiny golden armor. Come to me and you can have it!",
		"Find a way in here and release me! Pleeeease hurry!",
		"You can have my demon set, if you help me get out of here!"
	},
	[2] = --Messages shown when you use axe on Demon Oak
	{
		"MY ROOTS ARE SHARP AS A SCYTHE! FEEL IT?!?",
		"CURSE YOU!",
		"RISE, MINIONS, RISE FROM THE DEAD!!!!",
		"AHHHH! YOUR BLOOD MAKES ME STRONG!",
		"GET THE BONES, HELLHOUND! GET THEM!!",
		"GET THERE WHERE I CAN REACH YOU!!!",
		"ETERNAL PAIN AWAITS YOU! NICE REWARD, HUH?!?!",
		"YOU ARE GOING TO PAY FOR EACH HIT WITH DECADES OF TORTURE!!",
		"ARGG! TORTURE IT!! KILL IT SLOWLY MY MINION!!"
	}
}
 
function canEnter(cid, tree)
	if type(questAreaPosition) == "table" and type(questAreaPosition[1]) == "table" and type(questAreaPosition[2]) == "table" and level and type(storages) == "table" then
		if getPlayerLevel(cid) < level then
			return ERROR_NOTENOUGHLEVEL
		elseif getCreatureStorage(cid, storages.done) > 0 then
			return ERROR_ALREADYDONE
		elseif oneInArea then
		local monsters = {}
		local  from = {x=32707, y=32345, z=7}
		local to = {x=32725, y=32357, z=7}
			for z = from.z, to.z do
				for y = from.y, to.y do
					for x = from.x, to.x do
						local v = getTopCreature({x=x, y=y, z=z})
						if isPlayer(v.uid) and (cid ~= v.uid) then
						return ERROR_PLAYERINAREA
						end
					end
				end
			end
		end
	else
		return ERROR_MISSINGINFO
	end
	return ERROR_NOERROR
end
 
 
function getError(data, tree)
	if data == ERROR_TREEPOSITION then
		return print("[!] --> [Warning - Action::Demon Oak Script] Dead tree position is inside the quest area positions.\nDead tree position: (x: " .. tree.x .. ", y: " .. tree.y .. ", z: " .. tree.z .. ")\nNorth-West area position (x: " .. questAreaPosition[1].x .. ", y: " .. questAreaPosition[1].y .. ", z: " .. questAreaPosition[1].z .. ")\nSouth-West area position (x: " .. questAreaPosition[2].x .. ", y: " .. questAreaPosition[2].y .. ", z: " .. questAreaPosition[2].z .. ")\nScript will not work correctly, please fix it.") and "Something is wrong, please contact a staff member."
	elseif data == ERROR_NOTENOUGHLEVEL then
		return "You need level " .. level .. " or higher to enter to the quest area."
	elseif data == ERROR_ALREADYDONE then
		return "You already done this quest."
	elseif data == ERROR_ALREADYCUT then
		return "You can not leave the quest area by here."
	elseif data == ERROR_PLAYERINAREA then
		return "Wait until the player inside the quest area finishes the quest."
	elseif data == ERROR_MISSINGINFO then
		return "Sorry, not possible."
	end
	return ""
end
 
function getCreaturesInQuestArea(type, fromPos, toPos, get, countSummon)
 
	local types = 
	{
		[TYPE_PLAYER] = isPlayer,
		[TYPE_MONSTER] = isMonster,
		[TYPE_NPC] = isNpc,
		[TYPE_ALL] = isCreature
	}
 
	local tmp = {}
	local t = types[type]
	if not t then
		return print("[!] --> [Warning - Function::getCreaturesInQuestArea] Unknow type " .. (type or "(nil value)"))
	end
 
	local thing
	local pos
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				pos = {x = x, y = y, z = z}
				thing = getTopCreature(pos)
				if t(thing.uid) then
					table.insert(tmp, thing.uid)
					if not countSummon and isSummon(thing.uid) then
						for i = 1, #tmp do
							if tmp[i] == thing.uid then
								table.remove(tmp, i)
								break
							end
						end
					end
				end
			end
		end
	end
	return (get == GET_COUNT and #tmp or get == GET_UID and tmp or print("[Warning - Function::getCreaturesInQuestArea] Unknow type to get " .. (get or "(nil value)")))
end
 
function monsterExists(name)
 
	local file = "data/monster/monsters.xml"
	local openFile = io.open(file, "r")
	local m_name, getName, getFile, m_file = 0, 0, 0, 0
	local monsterExists, fileExists = false, false
	if openFile ~= nil then
		for line in io.lines(file) do
			if line:find('name=".*".*') and line:find('file=".*".*') then
				getName = string.match(line, 'name=".*".*')
				getFile = string.match(line, 'file=".*".*')
				if getName and getFile then
					m_name = string.sub(getName, string.find(getName, '="') + 2, (string.find(getName, '" ') or string.find(getName, '"f') or 1) - 1)
					m_file = string.sub(getFile, string.find(getFile, '="') + 2, (string.find(getFile, '"/') or string.find(getFile, '" ') or 1) - 1)
					if m_name:lower() == name:lower() then
						monsterExists = true
						mfile = io.open("data/monster/" .. m_file, "r")
						if mfile ~= nil then
							fileExists = true
							mfile:close()
						end
					end
				end
			end
		end
		openFile:close()
	end
	return monsterExists and fileExists or false
end
 
function isSummon(cid)
	if DISTRO_VERSION < 040 then
		return getCreatureMaster(cid) ~= cid or false
	else
		return getCreatureMaster(cid) ~= nil or false
	end
end
 
function isLastCut(cid)
	local k, s = 0, 0
	if not demonOak or type(demonOak) ~= "table" then
		return false
	end
	for i = demonOak[1], demonOak[#demonOak] do
		if getCreatureStorage(cid, i) == #summons + 1 then
			k = k + 1
		end
		if getCreatureStorage(cid, i) == #summons then
			s = s + 1
		end
	end
	return (k == 3 and s == 1 and true or false)
end
function checkLib()
 
	local final = "[" .. os.date() .. "]\n"
	print("\n[!] -> Checking demon oak lib...")
	local start = os.clock()
	local r = 0
	if not ITEM_DEADTREE or type(ITEM_DEADTREE) ~= "number" then
		print("[!] --> [Warning - Lib::DemonOak] Cannot load dead tree id (number expected, got " .. (type(ITEM_DEADTREE) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load dead tree id (number expected, got " .. (type(ITEM_DEADTREE) or "nil") .. ")\n"
		r = r + 1
	end
	if not HALLOWEDAXE_PRICE or type(HALLOWEDAXE_PRICE) ~= "number" then
		print("[!] --> [Warning - Lib::DemonOak] Cannot load hallowed axe price (number expected, got " .. (type(HALLOWEDAXE_PRICE) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load hallowed axe price (number expected, got " .. (type(HALLOWEDAXE_PRICE) or "nil") .. ")\n"
		r = r + 1
	end
	if not ERROR_NOERROR or type(ERROR_NOERROR) ~= "number" or not ERROR_TREEPOSITION or type(ERROR_TREEPOSITION) ~= "number"
	or not ERROR_NOTENOUGHLEVEL or type(ERROR_NOTENOUGHLEVEL) ~= "number" or not ERROR_ALREADYDONE or type(ERROR_ALREADYDONE) ~= "number"
	or not ERROR_ALREADYCUT or type(ERROR_ALREADYCUT) ~= "number" or not ERROR_PLAYERINAREA or type(ERROR_PLAYERINAREA) ~= "number"
	or not ERROR_MISSINGINFO or type(ERROR_MISSINGINFO) ~= "number" then
		print("[!] --> [Warning - Lib::DemonOak] Cannot load variables for function 'getError'")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load variables for function 'getError'\n"
		r = r + 1
	end
	if not TYPE_PLAYER or type(TYPE_PLAYER) ~= "number" or not TYPE_MONSTER or type(TYPE_MONSTER) ~= "number"
	or not TYPE_NPC or type(TYPE_NPC) ~= "number" or not TYPE_ALL or type(TYPE_ALL) ~= "number" 
	or not GET_COUNT or type(GET_COUNT) ~= "number" or not GET_UID or type(GET_UID) ~= "number" then
		print("[!] --> [Warning - Lib::DemonOak] Cannot load variables for function 'getCreaturesInQuestArea'")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load variables for function 'getCreaturesInQuestArea'\n"
		r = r + 1
	end
	if not STORAGE_LIB or not isInArray({"number", "string"}, type(STORAGE_LIB)) then
		print("[!] --> [Warning - Lib::DemonOak] Cannot load storage lib, lib will be checked more than once.")
		final = final .. "	[Warning - Lib::DemonOak] Cannot storage lib, lib will be checked more than once.\n"
		r = r + 1
	end
	if type(summons) == "table" then
		for k, v in pairs(summons) do
			if v and type(v) == "table" then
				for _, s in ipairs(v) do
					if not monsterExists(s) then
						print("[!] --> [Warning - Lib::DemonOak] Table: summons, Id: " .. k .. ", Monster " .. s .. " does not exists. Check if it is well writen in monsters.xml and also check if the file really exists.")
						final = final .. "	[Warning - Lib::DemonOak] Table: summons, Id: " .. k .. ", Monster " .. s .. " does not exists. Check if it is well writen in monsters.xml and also check if the file really exists.\n"
						r = r + 1
					end
				end
			else
				print("[!] --> [Warning - Lib::DemonOak] Table: summons, Id: " .. k .. ", cannot load summons (table expected, got " .. (type(v) or "nil") .. ")")
				final = final .. "	[Warning - Lib::DemonOak] Table: summons, Id: " .. k .. ", cannot load summons (table expected, got " .. (type(v) or "nil") .. ")\n"
				r = r + 1
			end
		end
	else
		print("[!] --> [Warning - Lib::DemonOak] Cannot load summons (table expected, got " .. (type(summons) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load summons (table expected, got " .. (type(summons) or "nil") .. ")\n"
		r = r + 1
	end
	if type(positions) == "table" then
		if type(positions.kick) ~= "table" then
			print("[!] --> [Warning - Lib::DemonOak] Invalid position for kick (table expected, got " .. (type(positions.kick) or "nil") .. ")")
			final = final .. "	[Warning - Lib::DemonOak] Invalid position for kick (table expected, got " .. (type(positions.kick) or "nil") .. ")\n"
			r = r + 1
		elseif type(positions.rewardRoom) ~= "table" then
			print("[!] --> [Warning - Lib::DemonOak] Invalid position for reward room (table expected, got " .. (type(positions.rewardRoom) or "nil") .. ")")
			final = final .. "	[Warning - Lib::DemonOak] Invalid position for reward room (table expected, got " .. (type(positions.rewardRoom) or "nil") .. ")\n"
			r = r + 1
		elseif type(positions.demonOak) ~= "table" then
			print("[!] --> [Warning - Lib::DemonOak] Cannot load demonOak position, scripts will use player position.")
			final = final .. "	[Warning - Lib::DemonOak] Cannot load demonOak position, scripts will use player position.\n"
			r = r + 1
		end
		if type(positions.summon) == "table" then
			for i = 1, #positions.summon do
				if type(positions.summon[i]) ~= "table" then
					print("[!] --> [Warning - Lib::DemonOak] Invalid summon position on index " .. i .. " (table expected, got " .. (type(positions.summon[i]) or "nil") .. ")")
					final = final .. "	[Warning - Lib::DemonOak] Invalid summon position on index " .. i .. " (table expected, got " .. (type(positions.summon[i]) or "nil") .. ")\n"
					r = r + 1
				end
			end
		else
			print("[!] --> [Warning - Lib::DemonOak] Cannot load summons position (table expected, got " .. (type(positions.summon) or "nil") .. ")")
			final = final .. "	[Warning - Lib::DemonOak] Cannot load summons position (table expected, got " .. (type(positions.summon) or "nil") .. ")\n"
			r = r + 1
		end
	else
		print("[!] --> [Warning - Lib::DemonOak] Cannot load positions (table expected, got " .. (type(positions) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load positions (table expected, got " .. (type(positions) or "nil") .. ")\n"
		r = r + 1
	end
	if not questAreaPosition or type(questAreaPosition[1]) ~= "table" or type(questAreaPosition[2]) ~= "table" then
		print("[!] --> [Warning - Lib::DemonOak] Invalid area positions!")
		final = final .. "	[Warning - Lib::DemonOak] Invalid area positions!\n"
		r = r + 1
	end
	if type(demonOak) ~= "table" then
		print("[!] --> [Warning - Lib::DemonOak] Cannot load 'demonOak' ids (table expected, got " .. (type(demonOak) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load 'demonOak' ids (table expected, got " .. (type(demonOak) or "nil") .. ")\n"
		demonOak = {8288, 8289, 8290, 8291}
		r = r + 1
	end
	if storages and storages.done and storages.treeCut then
		if storages.done == storages.treeCut then 
			print("[!] --> [Warning - Lib::DemonOak] Storage for dead tree (" .. storages.cutTree .. ") and storage to check if demonOak is finished (" .. storages.done .. ") are the same, change it or script will not work correctly.")
			final = final .. "	[Warning - Lib::DemonOak] Storage for dead tree (" .. storages.cutTree .. ") and storage to check if demonOak is finished (" .. storages.done .. ") are the same, change it or script will not work correctly.\n"
			r = r + 1
		end
	else
		print("[!] --> [Warning - Lib::Demon Oak] Cannot load storages (table expected, got " .. (type(storages) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load storages (table expected, got " .. (type(storages) or "nil") .. ")\n"
		r = r + 1
	end
	if type(blockingTree) == "table" then
		for k, v in pairs(blockingTree) do
			if type(v) ~= "table" then
				print("[!] --> [Warning - Lib::DemonOak] Cannot load info about dead tree id: " .. k .. " (table expected, got " .. (type(v) or "nil") .. ")")
				final = final .. "	[Warning - Lib::DemonOak] Cannot load info about dead tree id: " .. k .. " (table expected, got " .. (type(v) or "nil") .. ")\n"
				r = r + 1
			end
		end
	else
		print("[!] --> [Warning - Lib::DemonOak] Cannot load info about dead tree (table expected, got " .. (type(blockingTree) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load info about dead tree (table expected, got " .. (type(blockingTree) or "nil") .. ")\n"
		r = r + 1
	end
	if type(rewards) == "table" then
		for k, v in pairs(rewards) do
			if type(v) ~= "table" or not v.done or not v.reward or not v.count then
				print("[!] --> [Warning - Lib::DemonOak] Cannot load reward id " .. k .. "!")
				final = final .. "	[Warning - Lib::DemonOak] Cannot load reward id " .. k .. "!\n"
				r = r + 1
			end
		end
	else
		print("[!] --> [Warning - Lib::DemonOak] Cannot load rewards (table expected, got " .. (type(rewards) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load rewards (table expected, got " .. (type(rewards) or "nil") .. ")\n"
		r = r + 1
	end
	if type(sounds) == "table" then
		for k, v in pairs(sounds) do
			if type(v) ~= "table" then
				print("[!] --> [Warning - Lib::DemonOak] Cannot load sounds on index " .. k .. " (table expected, got " .. (type(v) or "nil") .. ")")
				final = final .. "	[Warning - Lib::DemonOak] Cannot load sounds on index " .. k .. " (table expected, got " .. (type(v) or "nil") .. ")\n"
				r = r + 1
			end
		end
	else
		print("[!] --> [Warning - Lib::DemonOak] Cannot load sounds (table expected, got " .. (type(sounds) or "nil") .. ")")
		final = final .. "	[Warning - Lib::DemonOak] Cannot load sounds (table expected, got " .. (type(sounds) or "nil") .. ")\n"
		r = r + 1
	end
 
	print("[!] ->  " .. r .. " problems loaded in " .. os.clock() - start .. " seconds.\n")
	local logFile = "data/logs/demonOak.txt"
	local f = io.open(logFile, "a+")
	if logEnabled then
		if f ~= nil then
			f:write((r > 0 and final .. "\n\n" or ""))
			f:close()
		end
	end
end
 
if getStorage(STORAGE_LIB) < 1 then
	checkLib()
	doSetStorage(STORAGE_LIB, 1)
end
 
if getStorage(0x65537) < 1 then
	print("[!] ->  Demon Oak Lib loaded in " .. os.clock() - getStorage(0x65536) .. " seconds.\n")
	doSetStorage(0x65537, 1)
end