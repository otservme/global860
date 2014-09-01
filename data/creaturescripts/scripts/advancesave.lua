--//Credits: Cyko//--
local config = {
	savePlayer = true, --Save Player When The Gain Level!
	healPlayerOnLevel = true, --Heal Players Hp And Mana On Level!
}
 
function onAdvance(cid, skill, oldLevel, newLevel)
	if(skill == SKILL__EXPERIENCE) then
		return true
	end   
	
	if(config.savePlayer) then
		doPlayerSave(cid, true)
	end
	
    if(newLevel < oldLevel)then return true end
 
	if(skill == SKILL__LEVEL and config.healPlayerOnLevel) then
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
		doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
    end 
	
    local VocKnig = {4,8}  
    if (getPlayerStorageValue(cid,100132) == -1) then
		if (getPlayerLevel(cid) >= 30 and isInArray(VocKnig, getPlayerVocation(cid))) then 
			setPlayerStorageValue(cid,100132, 1)
			doPlayerAddItem(cid,2516,1)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived a Dragon Shield." )
		if (getPlayerSkill(cid,SKILL_FIST) >= getPlayerSkill(cid,SKILL_AXE) and getPlayerSkill(cid,SKILL_FIST) >= getPlayerSkill(cid,SKILL_CLUB) and getPlayerSkill(cid,SKILL_FIST) >= getPlayerSkill(cid,SKILL_SWORD)) then
			local ITEMS = {7408, 2430, 2434}
			local random = ITEMS[math.random(1, #ITEMS)]
			doPlayerAddItem(cid, random, 1)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived a random weapon, since you are using fist." )
		elseif (getPlayerSkill(cid,SKILL_SWORD) >= getPlayerSkill(cid,SKILL_AXE) and getPlayerSkill(cid,SKILL_SWORD) >= getPlayerSkill(cid,SKILL_CLUB)) then
			doPlayerAddItem(cid,7408,1)               
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived a Wyvern Fang." )
		elseif (getPlayerSkill(cid,SKILL_AXE) >= getPlayerSkill(cid,SKILL_SWORD) and getPlayerSkill(cid,SKILL_AXE) >= getPlayerSkill(cid,SKILL_CLUB)) then
			doPlayerAddItem(cid,2430,1)         
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived a Knight Axe." )
		elseif (getPlayerSkill(cid,SKILL_CLUB) >= getPlayerSkill(cid,SKILL_SWORD) and getPlayerSkill(cid,SKILL_CLUB) >= getPlayerSkill(cid,SKILL_CLUB)) then
			doPlayerAddItem(cid,2434,1)   
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived a Dragon Hammer." )
			end
		end
    end  
	
    local VocSorc = {1,5}  
    if (getPlayerLevel(cid) >= 20 and isInArray(VocSorc, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100120) == -1) then 
		doPlayerAddItem(cid,2188,1)
		setPlayerStorageValue(cid,100120, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 1x "..getItemNameById(2188).."." )
    elseif (getPlayerLevel(cid) >= 35 and isInArray(VocSorc, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100121) == -1) then 
  		doPlayerAddItem(cid,2189,1)
		setPlayerStorageValue(cid,100121, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 1x "..getItemNameById(2189).."." ) 
    end
    local VocDruid = {2,6} 
    if (getPlayerLevel(cid) >= 20 and isInArray(VocDruid, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100122) == -1) then 
  		doPlayerAddItem(cid,2185,1)
		setPlayerStorageValue(cid,100122, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 1x "..getItemNameById(2185).."." )
	end
    if (getPlayerLevel(cid) >= 35 and isInArray(VocDruid, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100123) == -1) then 
  		doPlayerAddItem(cid,2181,1)
		setPlayerStorageValue(cid,100123, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 1x "..getItemNameById(2181).."." ) 
    end 
    local VocPally = {3,7}
    if (getPlayerLevel(cid) >= 15 and isInArray(VocPally, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100124) == -1) then 
  		doPlayerAddItem(cid,2544,200)
		setPlayerStorageValue(cid,100124, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 200x "..getItemNameById(2544).."." )
    if (getPlayerLevel(cid) >= 25 and isInArray(VocPally, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100125) == -1) then 
  		doPlayerAddItem(cid,2455,1)
		setPlayerStorageValue(cid,100125, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 1x "..getItemNameById(2455).."." )    
	end
	if (getPlayerLevel(cid) >= 30 and isInArray(VocPally, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100126) == -1) then 
  		doPlayerAddItem(cid,2543,200)
		setPlayerStorageValue(cid,100126, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 200x "..getItemNameById(2543).."." )
	end
	if (getPlayerLevel(cid) >= 35 and isInArray(VocPally, getPlayerVocation(cid)) and getPlayerStorageValue(cid,100127) == -1) then 
  		doPlayerAddItem(cid,7363,100)
		setPlayerStorageValue(cid,100127, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 100x "..getItemNameById(7363).."." )    
    end
    if (getPlayerLevel(cid) >= 30 and getPlayerStorageValue(cid,100128) == -1) then 
  		doPlayerAddItem(cid,2160,1)
		setPlayerStorageValue(cid,100128, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 1x "..getItemNameById(2160).."." )
	end
    if (getPlayerLevel(cid) >= 50 and getPlayerStorageValue(cid,100129) == -1) then 
  		doPlayerAddItem(cid,2160,2)
		setPlayerStorageValue(cid,100129, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 2x "..getItemNameById(2160).."." ) 
	end
	if (getPlayerLevel(cid) >= 75 and getPlayerStorageValue(cid,100130) == -1) then 
  		doPlayerAddItem(cid,2160,4)
		setPlayerStorageValue(cid,100130, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 4x "..getItemNameById(2160).."." )
   end 
	if (getPlayerLevel(cid) >= 100 and getPlayerStorageValue(cid,100131) == -1) then 
  		doPlayerAddItem(cid,2160,8)
		setPlayerStorageValue(cid,100131, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have recived 8x "..getItemNameById(2160).."." ) 
		end
    end
    return true 
end   