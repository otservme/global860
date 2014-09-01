-- By Seminari (The_Hide) (Iranimes)
 
function onStepIn(cid, item, position, fromPosition)
	local function KITNO_lokalny_kickEvent(cid, guid_gracza, p_from_x, p_from_y, p_to_x, p_to_y, p_z, kick_pos, p_fire) 
	local m2={}
		for x=p_from_x, p_to_x do
			for y=p_from_y, p_to_y do
				local v=getTopCreature({x=x, y=y, z=p_z}).uid
				if v ~= 0 then
					if isMonster(v) then
							table.insert(m2, v)
					end
					if isPlayer(v) then
						if getPlayerGUID(v) == guid_gracza then
						doTeleportThing(cid, kick_pos, true)
						doRemoveItem(getThingfromPos(p_fire).uid, 1)
						for i=1, #m do
						doRemoveCreature(m[i])
						end
						return doCreatureSay(cid, 'You have been kicked out from boss room. (Auto kick after 10 minutes).', TALKTYPE_ORANGE_1, false, cid)
						elseif getPlayerGUID(v) ~= guid_gracza then
						return print('Task System [tasks.lua (movements)]: Inny gracz w pomieszczeniu')
						else
						return print('Task System [tasks.lua (movements)]: Error w kick event')
						end	
					end
				end
			end
		end
	end 
 
 
	local k = KITNO_BOSS_MOVEMENTS_TBL[item.uid]
	if k then
		if (not(isPlayer(cid))) then
			doSendMagicEffect(position, CONST_ME_TELEPORT)
			KITNO_TeleportThing(cid, fromPosition, 0)
			doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
			return true
		end
		if k.typ_tasku == "paw_and_fur" then
			local tabliczka = KITNO_Paw_and_Fur_tasks_tbl[k.task_name].bossek_tbl
			-- wychodzenie z roomu
			if k.wejscie_czy_wyjscie == "wyjscie" then
				doSendMagicEffect(position, CONST_ME_TELEPORT)
				KITNO_TeleportThing(cid, tabliczka.pozycja_wyrzucenia, 0)
				doSendMagicEffect(tabliczka.pozycja_wyrzucenia, CONST_ME_TELEPORT)
				if KITNO_getPlayerSTGValue(cid, KITNO_Paw_and_Fur_tasks_tbl[k.task_name].task_started_stg) ~= 3 then
					KITNO_setPlayerSTGValue(cid, KITNO_Paw_and_Fur_tasks_tbl[k.task_name].task_started_stg, -1)
					KITNO_send_player_white_text(cid, "You run out from the room. You won't kill boss now! Task is automatly canceled.")
				end
				stopEvent(KITNO_lokalny_pauseKick)
				return true
			-- wchodzenie do roomu
			elseif k.wejscie_czy_wyjscie == "wejscie" then
				if KITNO_getPlayerSTGValue(cid, KITNO_Paw_and_Fur_tasks_tbl[k.task_name].task_started_stg) ~= 2 then
					doSendMagicEffect(position, CONST_ME_TELEPORT)
					KITNO_TeleportThing(cid, fromPosition, 0)
					doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
					KITNO_send_player_white_text(cid, "You haven't got acces to get there.")
					return true
				elseif KITNO_getPlayerSTGValue(cid, KITNO_Paw_and_Fur_tasks_tbl[k.task_name].task_started_stg) == 2 then
					local m={}
						for x=tabliczka.from.x, tabliczka.to.x do
							for y=tabliczka.from.y, tabliczka.to.y do
							local v=getTopCreature({x=x, y=y, z=tabliczka.from.z}).uid
								if v ~= 0 then
									if isPlayer(v) then
										KITNO_TeleportThing(cid, fromPosition, 0)
										KITNO_send_player_white_text(cid, "Someone else is in the room.")
										return
									elseif isMonster(v) then
										table.insert(m, v)
									end
								end
							end
						end
					for i=1, #m do
						doRemoveCreature(m[i])
					end
					if getThingfromPos(tabliczka.ogien_pos).itemid == KITNO_BOSS_MOVEMENTS_CONFIG.special_fire_field_start_id then
						doRemoveItem(getThingfromPos(tabliczka.ogien_pos).uid, 1)
					end	
					doTeleportThing(cid, tabliczka.tp)
					doSendMagicEffect(position, CONST_ME_TELEPORT)
					doSendMagicEffect(tabliczka.tp, CONST_ME_TELEPORT)
					doCreateMonster(tabliczka.boss_name, tabliczka.spawn)
					doSendMagicEffect(tabliczka.spawn, CONST_ME_TELEPORT)
					doCreateItem(KITNO_BOSS_MOVEMENTS_CONFIG.special_fire_field_start_id, 1, tabliczka.ogien_pos)
					p_from_x = tabliczka.from.x
					p_from_y = tabliczka.from.y
					p_to_x = tabliczka.to.x
					p_to_y = tabliczka.to.y
					p_z = tabliczka.from.z
					kick_pos = tabliczka.pozycja_wyrzucenia
					p_fire = tabliczka.ogien_pos
					guid_gracza = getPlayerGUID(cid)
 
					KITNO_lokalny_pauseKick = addEvent(KITNO_lokalny_kickEvent, KITNO_BOSS_MOVEMENTS_CONFIG.czas * 1000, cid, guid_gracza, p_from_x, p_from_y, p_to_x, p_to_y, p_z, kick_pos, p_fire) 
 
					if KITNO_BOSS_MOVEMENTS_CONFIG.czas >= (1*60) then
						ile = KITNO_BOSS_MOVEMENTS_CONFIG.czas / 60
						minu = 'minutes'	
					elseif KITNO_BOSS_MOVEMENTS_CONFIG.czas < (1*60) then
						ile = KITNO_BOSS_MOVEMENTS_CONFIG.czas
						minu = 'seconds'
					end
 
					doCreatureSay(cid, 'You have ' .. ile ..' ' .. minu .. ' to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1, false, cid)
					return
				end
			end
		end
	end	
	return true
end