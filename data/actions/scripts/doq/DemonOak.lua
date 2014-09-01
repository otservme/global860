local config = {
	pos1 = {x=32713, y=32348, z=7},
	pos2 = {x=32720, y=32349, z=7},
	pos3 = {x=32720, y=32354, z=7},
	pos4 = {x=32711, y=32353, z=7}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local leftarm = 100065 
    local bird = 100066
    local rightarm = 100067
    local face = 100068
	if isInArray(demonOak, itemEx.itemid) then
 
	if getPlayerStorageValue(cid,rightarm) >= 11 and getPlayerStorageValue(cid,face) >= 11 and getPlayerStorageValue(cid,bird) >= 11 and getPlayerStorageValue(cid,leftarm) >= 11 then
    	local monsters = {}
    	local  from = {x=32707, y=32345, z=7}
    	local to = {x=32725, y=32357, z=7}
	for z = from.z, to.z do
        	for y = from.y, to.y do
            		for x = from.x, to.x do
                	local v = getTopCreature({x=x, y=y, z=z})
               			if isMonster(v.uid) and (cid ~= v.uid) then
                		return true
				end
			end
		end
	end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Tell Oldrak about your great victory against the demon oak.")
		setPlayerStorageValue(cid, 100077, 2)
		setPlayerStorageValue(cid,100070, 1)
		setPlayerStorageValue(cid, 100072, 3)
		doTeleportThing(cid, positions.kick)
		return true
	end
		
	function Dohit(cid)
		doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
		doCreatureSay(cid, "-krrrrak-", TALKTYPE_MONSTER_YELL, false, cid, getThingPos(itemEx.uid))
		doTargetCombatHealth(0, cid, floorDamage.type, -floorDamage.min, -floorDamage.max, floorDamage.effect) 
	if math.random(100) >= 50 then
	    doTargetCombatHealth(0, cid, floorDamage.type, -floorDamage.min, -floorDamage.max, floorDamage.effect)
		end  
	end
		
		if getPlayerStorageValue(cid, leftarm) >= 11 and getPlayerStorageValue(cid, bird) >= 11 and getPlayerStorageValue(cid, rightarm) >= 11 and getPlayerStorageValue(cid, face) >= 11 then
		   doCreatureSay(cid, "HOW IS THAT POSSIBLE?!? MY MASTER WILL CRUSH YOU!! AHRRGGG!", TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
		else
		if math.random(100) <= 20 then
			doCreatureSay(cid, sounds[2][math.random(1, #sounds[2])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
			end
		end
		
        --////////////////////////////First Part////////////////////////////////////////-- 
		if itemEx.itemid == 8289 and getPlayerStorageValue(cid,leftarm) <= 4 then 
			setPlayerStorageValue(cid, leftarm, getPlayerStorageValue(cid, leftarm) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)  
        elseif itemEx.itemid == 8289 and getPlayerStorageValue(cid,leftarm) == 5 then
			local mon1 = doCreateMonster("Braindeath",config.pos1,true) 
			local mon2 = doCreateMonster("Braindeath",config.pos2,true) 
			local mon3 = doCreateMonster("Braindeath",config.pos3,true) 
			local mon4 = doCreateMonster("Bonebeast",config.pos4,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon2), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon3), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon4), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, leftarm, getPlayerStorageValue(cid, leftarm) + 1) 
        elseif itemEx.itemid == 8289 and getPlayerStorageValue(cid,leftarm) == 6 or getPlayerStorageValue(cid,leftarm) == 7 or getPlayerStorageValue(cid,leftarm) == 8 or getPlayerStorageValue(cid,leftarm) == 9 then
			setPlayerStorageValue(cid, leftarm, getPlayerStorageValue(cid, leftarm) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD) 
			Dohit(cid)
        elseif itemEx.itemid == 8289 and getPlayerStorageValue(cid,leftarm) == 10 then
        if getPlayerStorageValue(cid,rightarm) >= 10 and getPlayerStorageValue(cid,face) >= 10 and getPlayerStorageValue(cid,bird) >= 10 then
			local mon1 = doCreateMonster("Demon",config.pos1,true)
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			setPlayerStorageValue(cid, leftarm, getPlayerStorageValue(cid, leftarm) + 1)
			Dohit(cid)
        else
			local mon1 = doCreateMonster("Betrayed Wraith",config.pos1,true) 
			local mon4 = doCreateMonster("Betrayed Wraith",config.pos4,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon4), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, leftarm, getPlayerStorageValue(cid, leftarm) + 1)
        end
        elseif itemEx.itemid == 8289 and getPlayerStorageValue(cid,leftarm) >= 10 then
			doSendMagicEffect(toPosition, CONST_ME_POFF)
        end  
        --////////////////////////////Second Part////////////////////////////////////////-- 
   		if itemEx.itemid == 8288 and getPlayerStorageValue(cid,bird) <= 4 then 
			setPlayerStorageValue(cid, bird, getPlayerStorageValue(cid, bird) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
        elseif itemEx.itemid == 8288 and getPlayerStorageValue(cid,bird) == 5 then
			local mon1 = doCreateMonster("Lich",config.pos1,true) 
			local mon2 = doCreateMonster("Lich",config.pos2,true) 
			local mon3 = doCreateMonster("Lich",config.pos3,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon2), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon3), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, bird, getPlayerStorageValue(cid, bird) + 1)
        elseif itemEx.itemid == 8288 and getPlayerStorageValue(cid,bird) == 6 or getPlayerStorageValue(cid,bird) == 7 or getPlayerStorageValue(cid,bird) == 8 or getPlayerStorageValue(cid,bird) == 9 then
			setPlayerStorageValue(cid, bird, getPlayerStorageValue(cid, bird) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
        elseif itemEx.itemid == 8288 and getPlayerStorageValue(cid,bird) == 10 then
			local mon1 = doCreateMonster("Dark Torturer",config.pos1,true) 
			local mon4 = doCreateMonster("Blightwalker",config.pos4,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon4), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, bird, getPlayerStorageValue(cid, bird) + 1)
        elseif itemEx.itemid == 8288 and getPlayerStorageValue(cid,bird) >= 10 then
			doSendMagicEffect(toPosition, CONST_ME_POFF)
        end
        --////////////////////////////Thrid Part////////////////////////////////////////-- 
   		if itemEx.itemid == 8290 and getPlayerStorageValue(cid,rightarm) <= 4 then 
			setPlayerStorageValue(cid, rightarm, getPlayerStorageValue(cid, rightarm) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
        elseif itemEx.itemid == 8290 and getPlayerStorageValue(cid,rightarm) == 5 then
			local mon1 = doCreateMonster("Banshee",config.pos1,true) 
			local mon2 = doCreateMonster("Banshee",config.pos2,true) 
			local mon3 = doCreateMonster("Banshee",config.pos3,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon2), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon3), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, rightarm, getPlayerStorageValue(cid, rightarm) + 1)
        elseif itemEx.itemid == 8290 and getPlayerStorageValue(cid,rightarm) == 6 or getPlayerStorageValue(cid,rightarm) == 7 or getPlayerStorageValue(cid,rightarm) == 8 or getPlayerStorageValue(cid,rightarm) == 9 then
			setPlayerStorageValue(cid, rightarm, getPlayerStorageValue(cid, rightarm) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
        elseif itemEx.itemid == 8290 and getPlayerStorageValue(cid,rightarm) == 10 then
			local mon1 = doCreateMonster("Grim Reaper",config.pos1,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, rightarm, getPlayerStorageValue(cid, rightarm) + 1)
        elseif itemEx.itemid == 8290 and getPlayerStorageValue(cid,rightarm) >= 10 then
			doSendMagicEffect(toPosition, CONST_ME_POFF)
        end
        --////////////////////////////Fourth Part////////////////////////////////////////-- 
   		if itemEx.itemid == 8291 and getPlayerStorageValue(cid,face) <= 4 then 
			setPlayerStorageValue(cid, face, getPlayerStorageValue(cid, face) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
        elseif itemEx.itemid == 8291 and getPlayerStorageValue(cid,face) == 5 then
			local mon1 = doCreateMonster("Giant Spider",config.pos1,true) 
			local mon2 = doCreateMonster("Giant Spider",config.pos2,true) 
			local mon3 = doCreateMonster("Lich",config.pos3,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon2), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon3), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, face, getPlayerStorageValue(cid, face) + 1)
        elseif itemEx.itemid == 8291 and getPlayerStorageValue(cid,face) == 6 or getPlayerStorageValue(cid,face) == 7 or getPlayerStorageValue(cid,face) == 8 or getPlayerStorageValue(cid,face) == 9 then
			setPlayerStorageValue(cid, face, getPlayerStorageValue(cid, face) + 1)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
        elseif itemEx.itemid == 8291 and getPlayerStorageValue(cid,face) == 10 then
        if getPlayerStorageValue(cid,rightarm) >=  10 and getPlayerStorageValue(cid,leftarm) >=  10 and getPlayerStorageValue(cid,bird) >=  10 then
			local mon1 = doCreateMonster("Demon",config.pos1,true)
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, face, getPlayerStorageValue(cid, face) + 1)
        else
			local mon1 = doCreateMonster("Undead Dragon",config.pos1,true)
			local mon3 = doCreateMonster("Hand of Cursed Fate",config.pos3,true) 
			doSendMagicEffect(getThingPos(mon1), CONST_ME_TELEPORT)
			doSendMagicEffect(getThingPos(mon3), CONST_ME_TELEPORT)
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			Dohit(cid)
			setPlayerStorageValue(cid, face, getPlayerStorageValue(cid, face) + 1)
        end
        elseif itemEx.itemid == 8291 and getPlayerStorageValue(cid,face) >= 10 then
			doSendMagicEffect(toPosition, CONST_ME_POFF)
        end
        --////////////////////////////////END////////////////////////////////////////-- 
		end
	return true
end