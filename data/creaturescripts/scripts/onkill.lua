function onKill(cid, target, damage, flags)
			if isPlayer(target) == true then
				db.query("UPDATE `players` SET `frags` = `frags` + 1 WHERE id = " .. getPlayerGUID(cid) .. ";") 
				doCreatureSay(cid, '+1 Frag Point!', TALKTYPE_ORANGE_1) 
			end
 
			return true
		end