function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
			if isPlayer(cid) == true then
				db.query("UPDATE `players` SET `deaths` = `deaths` + 1 WHERE id = " .. getPlayerGUID(cid) .. ";") 
				doCreatureSay(cid, '+1 Death Point!', TALKTYPE_ORANGE_1) 
			end
 
			return true
		end