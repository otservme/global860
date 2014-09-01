local config = {
	bosses={---aid of portal, position where it sends, value it sets, text it shows
		[1001] = {pos={x=33069, y=31783, z=13, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[1002] = {pos={x=33371, y=31613, z=14, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[1003] = {pos={x=33153, y=31781, z=12, stackpos=1}, value=3, text="Entering The Vats"},
		[1004] = {pos={x=33038, y=31753, z=15, stackpos=1}, value=4, text="Entering The Arcanum"},
		[1005] = {pos={x=33199, y=31686, z=12, stackpos=1}, value=5, text="Entering The Hive"},
		[1006] = {pos={x=33111, y=31682, z=12, stackpos=1}, value=6, text="Entering The Shadow Nexus"}
		},
	mainroom={---aid, position, lowest value that can use this portal, text
		[2001] = {pos={x=33069, y=31783, z=13, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[2002] = {pos={x=33371, y=31613, z=14, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[2003] = {pos={x=33153, y=31781, z=12, stackpos=1}, value=3, text="Entering The Vats"},
		[2004] = {pos={x=33038, y=31753, z=15, stackpos=1}, value=4, text="Entering The Arcanum"},
		[2005] = {pos={x=33199, y=31686, z=12, stackpos=1}, value=5, text="Entering The Hive"}	},
	portals={---aid, position, text
		[3000] = {pos={x=33163, y=31708, z=14}, text="Escaping back to the Retreat!"},
		[3001] = {pos={x=33158, y=31728, z=11}, text="Entering The Ward of Ushuriel"},
		[3002] = {pos={x=33169, y=31755, z=13}, text="Entering The Undersea Kingdom"},
		[3003] = {pos={x=33124, y=31692, z=11}, text="Entering The Ward of Zugurosh"},
		[3004] = {pos={x=33356, y=31590, z=11}, text="Entering The Foundry"},
		[3005] = {pos={x=33197, y=31767, z=11}, text="Entering The Ward of Madareth"},
		[3006] = {pos={x=33250, y=31632, z=13}, text="Entering The Battlefield"},
		[3007] = {pos={x=33232, y=31733, z=11}, text="Entering The Ward of The Demon Twins"},
		[3008] = {pos={x=33094, y=31575, z=11}, text="Entering The Soul Wells"},
		[3009] = {pos={x=33197, y=31703, z=11}, text="Entering The Ward of Annihilon"},
		[3010] = {pos={x=33105, y=31734, z=11}, text="Entering The Ward of Hellgorak"}	},
	storage=56123,---storage used in boss and mainroom portals
	e={}	}----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}
function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if(config.bosses[item.actionid]) then
			local t= config.bosses[item.actionid]
			if getPlayerStorageValue(cid, config.storage)< t.value then
				setPlayerStorageValue(cid, config.storage, t.value)
			end
			if item.actionid == 1001 and (getPlayerStorageValue(cid, 100079) < 4) then
				setPlayerStorageValue(cid, 100079, 4)
			elseif item.actionid == 1002 and (getPlayerStorageValue(cid, 100078) < 23) then
				setPlayerStorageValue(cid, 100078, 23) 
			elseif item.actionid == 1003 and (getPlayerStorageValue(cid, 100078) < 26) then
				setPlayerStorageValue(cid, 100078, 26) 
			elseif item.actionid == 1004 and (getPlayerStorageValue(cid, 100078) < 29) then
				setPlayerStorageValue(cid, 100078, 29) 
			elseif item.actionid == 1005 and (getPlayerStorageValue(cid, 100078) < 33) then
				setPlayerStorageValue(cid, 100078, 33)
			elseif item.actionid == 1006 and (getPlayerStorageValue(cid, 100080) < 2) then
				setPlayerStorageValue(cid, 100080, 2)
			end
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,19,1, config.e)
		elseif(config.mainroom[item.actionid]) then
			local t= config.mainroom[item.actionid]
			if getPlayerStorageValue(cid, config.storage)>=t.value then
				doTeleportThing(cid, t.pos)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid,t.text,19,1,config.e)
			else
				doTeleportThing(cid, fromPosition)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1)
			end
		elseif(config.portals[item.actionid]) then
			local t= config.portals[item.actionid]
			if item.actionid == 3001 and (getPlayerStorageValue(cid, 100079) < 2) then
				setPlayerStorageValue(cid, 100079, 2)
			elseif item.actionid == 3003 and (getPlayerStorageValue(cid, 100079) < 5) then
				setPlayerStorageValue(cid, 100079, 5) 
			elseif item.actionid == 3005 and (getPlayerStorageValue(cid, 100078) < 24) then
				setPlayerStorageValue(cid, 100078, 24) 
			elseif item.actionid == 3007 and (getPlayerStorageValue(cid, 100078) < 27) then
				setPlayerStorageValue(cid, 100078, 27) 
			elseif item.actionid == 3008 and (getPlayerStorageValue(cid, 100078) < 30) then
				setPlayerStorageValue(cid, 100078, 30)
			elseif item.actionid == 3009 and (getPlayerStorageValue(cid, 100078) < 31) then
				setPlayerStorageValue(cid, 100078, 31)
			elseif item.actionid == 3010 and (getPlayerStorageValue(cid, 100078) < 34) then
				setPlayerStorageValue(cid, 100078, 34)
			end
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,19,1,config.e)
		end
	end
end
