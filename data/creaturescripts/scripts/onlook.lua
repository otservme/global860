function onLook(cid, thing, position, lookDistance)
		function getKillsPlayer(cid)
			local Info = db.getResult("SELECT `frags` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
				local frags= Info:getDataInt("frags")
					return frags
			end
 
		function getDeathsPlayer(cid)
			local Info = db.getResult("SELECT `deaths` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
				local deaths= Info:getDataInt("deaths")
					return deaths
			end
		if isPlayer(thing.uid) then
local kdr = getKillsPlayer(thing.uid)/getDeathsPlayer(thing.uid)
				doPlayerSetSpecialDescription(thing.uid, (getPlayerSex(thing.uid) == 0 and "\nShe" or "\nHe") .. " has Killed: ["..getKillsPlayer(thing.uid).."] Players."..(getPlayerSex(thing.uid) == 0 and "\nShe" or "\nHe") .. " has Died: ["..getDeathsPlayer(thing.uid).."] Times.\nThe Kdr(Kill Death Ratio) is: ["..kdr.."].")
			end
		if(thing.uid == cid) then
local kdr = getKillsPlayer(thing.uid)/getDeathsPlayer(thing.uid)
				doPlayerSetSpecialDescription(thing.uid, "\nYou have Killed: ["..getKillsPlayer(thing.uid).."] Players.\nYou have Died: ["..getDeathsPlayer(thing.uid).."] Times.\nYou Kdr(Kill Death Ratio) is: ["..kdr.."].")
			end
			return true
		end