local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local storageChildren = 8823 -- Storagevalue Children of the Revolution Quest (finished = 2)
	local storageWrath = 42324 -- Storagevalue Wrath of the Emperor (finished = )
	local mark1 = {x = 33356,y = 31180, z = 7} -- First mark (entrance)(Wrath)
	local mark2 = {x = 33173,y = 31075, z = 7} -- Second mark (Wrath)

	--Josef part--
	local storage = getPlayerStorageValue(cid, 93800)
    local storagee = getPlayerStorageValue(cid, 93802)
	--Josef part--

	if (getPlayerStorageValue(cid,storageChildren) ~= 2) then
		--Josef part2--
		if msgcontains(msg, 'mission') then
			if (storage ~= 1) then
				--npcHandler:say({'Zzo you are offering your help to a lizzard? Hmm, unuzzual. I don\'t know if I can fully truzzt you yet. ...', 'You\'ll have to work to earn my truzzt.'}, cid)
				npcHandler:say("Zzo you are offering your help to a lizzard? Hmm, unuzzual. I don\'t know if I can fully truzzt you yet. ...",cid)
				npcHandler:say("You\'ll have to work to earn my truzzt.",cid, 2000)
				setPlayerStorageValue(cid, 93800, 1)
			elseif (storagee == 1) then
				npcHandler:say('What newzz do you bring? Did you find any cluezz about zzeir whereaboutzz?', cid)
				talkState[cid] = 3		
			elseif (storagee == 5) then
				--npcHandler:say({'If I\'m correct, zze portal in zze chamber beyond zze mechanizzm will lead you to zze great gate. It izz perfectly pozzible, however, zzat you will not be tranzzported directly into zze area. ...', 'You will razzer be brought to a plazze clozze by your goal. Where exzzactly, I cannot zzay. ...','Take all your courage and walk zze pazz zzrough zze portal. At leazzt TRY it - after all, I didn\'t make you my pupil for nozzing, '.. getCreatureName(cid) ..'. I hope you are prepared. ...', 'You did well on your quezzt zzo far. I hope you will reach zze great gate in time. If we are lucky, it will zztill be open. ...', 'If not, it will be already overrun by enemy zzoldierzz. Direct confrontation will be inevitable in zzat cazze, palezzkin. Now clear your mind and approach zze portal.'}, cid)
				npcHandler:say("If I\'m correct, zze portal in zze chamber beyond zze mechanizzm will lead you to zze great gate. It izz perfectly pozzible, however, zzat you will not be tranzzported directly into zze area. ...",cid)
				npcHandler:say("You will razzer be brought to a plazze clozze by your goal. Where exzzactly, I cannot zzay. ...",cid, 4000)
				npcHandler:say("Take all your courage and walk zze pazz zzrough zze portal. At leazzt TRY it - after all, I didn\'t make you my pupil for nozzing, '.. getCreatureName(cid) ..'. I hope you are prepared. ...",cid, 7000)
				npcHandler:say("You did well on your quezzt zzo far. I hope you will reach zze great gate in time. If we are lucky, it will zztill be open. ...",cid, 11000)
				npcHandler:say("If not, it will be already overrun by enemy zzoldierzz. Direct confrontation will be inevitable in zzat cazze, palezzkin. Now clear your mind and approach zze portal.",cid, 15000)
				setPlayerStorageValue(cid, 39721, 1)
				setPlayerStorageValue(cid, 93802, 7)
			elseif (storagee == 7) then
				if getPlayerStorageValue(cid, 8823) == 1 then
					--npcHandler:say({'Too clozze, far too clozze. I felt a huge impact not long after you left. Zze war machinery of zze emperor muzzt finally have been zztarted. ...', 'I focuzzed and could only hope zzat I would reach you before everyzzing wazz too late. If I hadn\'t been able to tranzzport you here, our cauzze would have been lozzt. ...', 'I\'m afraid we cannot continue zzizz fight here today. Zze rezzizztanzze izz zztill fragile. I\'m afraid, zzere izz zztill much left to do. We\'ll have to prepare for war. ...', 'You\'ve helped uzz a great deal during zzezze dark hourzz, I\'ve got zzomezzing for you my friend. Pleazze, take zzizz zzerpent crezzt azz a zzign of my deep rezzpect. ...', 'Rezzt for now, you will need it - you have earned it.'}, cid)
					npcHandler:say("Too clozze, far too clozze. I felt a huge impact not long after you left. Zze war machinery of zze emperor muzzt finally have been zztarted. ...",cid)
					npcHandler:say("I focuzzed and could only hope zzat I would reach you before everyzzing wazz too late. If I hadn\'t been able to tranzzport you here, our cauzze would have been lozzt. ...",cid, 3000)
					npcHandler:say("I\'m afraid we cannot continue zzizz fight here today. Zze rezzizztanzze izz zztill fragile. I\'m afraid, zzere izz zztill much left to do. We\'ll have to prepare for war. ...",cid, 6000)
					npcHandler:say("You\'ve helped uzz a great deal during zzezze dark hourzz, I\'ve got zzomezzing for you my friend. Pleazze, take zzizz zzerpent crezzt azz a zzign of my deep rezzpect. ...",cid, 9000)
					npcHandler:say("Rezzt for now, you will need it - you have earned it.",cid, 12000)
					doPlayerAddItem(cid, 11112, 1)
					doPlayerAddExperience(cid, 10000)
					setPlayerStorageValue(cid, 8823, 2)
				end
			end 
		elseif msgcontains(msg, 'yes') and (talkState[cid] == 3) then
			--npcHandler:say({'Aaah, zzezze look zzertainly interezzting. Zzezze manuzzcriptzz show uzz zzeveral locationzz of zze enemy troopzz. ...', 'I\'m imprezzed, zzoftzzkin. Maybe you can be of zzome more help.'}, cid)
			npcHandler:say("Aaah, zzezze look zzertainly interezzting. Zzezze manuzzcriptzz show uzz zzeveral locationzz of zze enemy troopzz. ...",cid)
			npcHandler:say("I\'m imprezzed, zzoftzzkin. Maybe you can be of zzome more help.",cid)
			setPlayerStorageValue(cid, 93802, 5)
			talkState[cid] = 0
		end
		--Josef part2--
	else
		if (getPlayerStorageValue(cid,storageWrath) == 0) then
	
			if(msgcontains(msg, 'mission')) then
				npcHandler:say('Zze attackzz have weakened our enemy zzignificantly. Yet, your quezzt continuezz. Bezzidezz zzome tazzkzz you could take, zze zzreat of zze {emperor} izz zztill hanging over our headzz like a rain cloud. ...', cid)
                npcHandler:say('Zzo, are you indeed willing to continue zze fight for our cauzze?', cid, 4000)
				talkState[cid] = 1
		
			elseif(msgcontains(msg, 'yes') and talkState[cid] == 1) then
				npcHandler:say('You continue to imprezz, zzoftzzkin ...','A contact of zze rezzizztanzze izz located furzzer in zze norzz of Zao ...',cid)
                npcHandler:say('Zze emperor will drag hizz forzzezz to zze {great gate}  now to bolzzter hizz defenzze. Zzinzze we attacked zze gate directly, he will not expect uzz taking a completely different route to reach zze norzzern territoriezz. ...',cid, 2000)
                npcHandler:say('I azzume you are already geared up and ready to conquer zze norzz?', cid, 6000)
				talkState[cid] = 2
		
			elseif(msgcontains(msg, 'yes') and talkState[cid] == 2) then	
				npcHandler:say('Your determination izz highly appreciated. To zzneak pazzt zze eyezz of zze enemy, you will have to uzze a diverzzion. Zzere are zzeveral old {tunnelzz}h beneazz zze zzoil of Zzao. ...',cid)
                npcHandler:say('One of zzem izz uzzed azz a maintenanzze connection by enemy lizardzz. To enter it, you will have to uzze a dizzguizze. Zzomezzing like a crate perhapzz.',cid, 4000)
                npcHandler:say('Mh, if you can find zzome nailzz - 3 should be enough - and 1 piezze of wood, I should be able to create an appropriate cazzing. Return to me if you found zze itemzz and we will talk about zze next zztep.', cid, 8000)
				talkState[cid] = 0
				setPlayerStorageValue(cid,storageWrath,1)
		
			end
		
		elseif (getPlayerStorageValue(cid,storageWrath) == 1) then
		
			if(msgcontains(msg, 'mission')) then
				npcHandler:say('Ah you have returned. I azzume you already found zzome itemzz to {build} a proper dizzguizze?', cid)
				talkState[cid] = 1
			
			elseif(msgcontains(msg, 'yes') and talkState[cid] == 1) then
				if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 8309) >= 3) then
					npcHandler:say('Very good, I am confident zzizz will zzuffizze. Now I can {build} and mark a {crate} large enough for you to fit in - while zztill being able to breazze of courzze - and I will mark it in our tongue zzo it will look lezz zzuzzpizziouzz. ...',cid)
                    npcHandler:say('Wizz zzeir eyezz towardzz zze {gate}, your chanzzezz to zzlip zzrough have never been better. I will keep zze zzpare materialzz here wizz me, we can alwayzz {build} a new one if you need to.', cid, 4500)
					talkState[cid] = 2
				else	
					npcHandler:say('Mh, if you can find zzome nailzz - 3 should be enough - and 1 piezze of wood, I should be able to create an appropriate cazzing. Return to me if you found zze itemzz and we will talk about zze next zztep.', cid)
				end
			elseif(msgcontains(msg, 'crate') and talkState[cid] == 2) then		
				npcHandler:say({'Ah I zzee. You are ready for your mizzion and waiting for me to create and mark zze crate?'}, cid)
				talkState[cid] = 3
			
			elseif(msgcontains(msg, 'yes') and talkState[cid] == 3) then		
				npcHandler:say('Alright. Let uzz create a crate. Hm. Let me zzee.','Good. Zzat will do. ...',cid)
                npcHandler:say('Zze maintenanzze tunnelzz are in zze eazzt of zze plainzz, near ze coazt. Here, I will mark zzem on your map.',cid, 2000)
                npcHandler:say('Uzze zze dizzguizze wizzely, try to hide in zze dark and avoid being zzeen at all cozzt. ...',cid, 4000)
                npcHandler:say('Onzze you have reached zze norzz, you can find zze rezzizztanzze hideout at zze ozzer zzpot I marked on your map. Now hurry.', cid, 6000)
				if doPlayerRemoveItem(cid,5901,1) and doPlayerRemoveItem(cid,8309,3) then
					doPlayerAddItem(cid,12245,1)
					setPlayerStorageValue(cid,storageWrath,2)
					doPlayerAddMapMark(cid, mark1, MAPMARK_CROSS, 'Maintenance Tunnel Entry')
					doPlayerAddMapMark(cid, mark2, MAPMARK_CROSS, 'Resistance Hideout')
					talkState[cid] = 0
				end
			end
	-------------------- MISSION 2 ----------------
		elseif (getPlayerStorageValue(cid,storageWrath) == 2) and (getPlayerStorageValue(cid,42830) == 2) then
		
			if(msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,42830) == 2 and getPlayerStorageValue(cid,storageWrath) == 2) then
				npcHandler:say('You ezztablished zze connection to zze hideout, good. But zzizz izz no time to rezzt. Your new tazzk will be quite different. ...',cid)
                npcHandler:say('Zze gardenzz are plagued by a creature. Zze former keeper of zzizz garden became an abomination of madnezz zzat needzz to be zztopped. ...',cid,3000)
                npcHandler:say('He hidezz deep underground and it will be dangerouzz to challenge him in hizz lair but I am willing to rizzk it. ...',cid,6000)
                npcHandler:say('Find him, dezztroy him, bring me hizz - I uhm, mean it izz utterly nezzezzary for you to deliver me a proof of hizz deazz. ...',cid,9000)
                npcHandler:say('Now go - what are you waiting for, zzoftzzkin? Ready to finish what needzz to be finished?', cid, 12000)
				talkState[cid] = 1
			elseif(msgcontains(msg, 'yes') and talkState[cid] == 1) then
				npcHandler:say('Fine. I guezz poizzoning zzome of hizz plantzz will be enough to lure him out of hizz conzzealment. Zzizz plant poizzon here should allow you to do zzome zzignificant damage, take it. ...',cid)
                npcHandler:say('You can find him eazzt of zze corrupted gardenzz. Zzere uzzed to be a zzmall domizzile zzere but it hazz probably been conzzumed by zze corruption zzo beware. And now - go.', cid, 4500)
				doPlayerAddItem(cid,12281,1)
				talkState[cid] = 0
			end
					-------------------- MISSION 3 ----------------
		elseif (getPlayerStorageValue(cid,42830) == 2 and getPlayerStorageValue(cid,storageWrath) == 3) then
			if(msgcontains(msg, 'mission')) then
				npcHandler:say('Zzo... you finished him. Show me hizz head, will you?', cid)
				talkState[cid] = 4
			elseif(msgcontains(msg, 'yes') and talkState[cid] == 4 and getPlayerItemCount(cid, 12284) >= 1) then
					npcHandler:say('Zzizz izz not hizz head but clearly belonged to zze keeper. I - I am imprezzed. You can go now. Leave me alone for a zzecond.', cid)
					setPlayerStorageValue(cid,storageWrath,4)
					doPlayerRemoveItem(cid, 12284, 1)
					talkState[cid] = 0
					end
					
						-------------------- MISSION 4 ----------------
		elseif (getPlayerStorageValue(cid,42830) == 2 and getPlayerStorageValue(cid,storageWrath) == 4 and getPlayerStorageValue(cid,12288) == -1) then
			if(msgcontains(msg, 'mission')) then
				npcHandler:say('At zze dawn of time, zze children of zze Great Zznake were numerouzz. Zzey daringly colonizzed many partzz of zze world. But all bravery did not help againzzt zze sheer number of enemiezz zzey encountered. ...',cid)
                npcHandler:say('And while zze entitiezz zze unbelieverzz call godzz battled for power out of vanity, zze fazze of zze world changed violently. ...',cid,3500)
                npcHandler:say('Many zzentrezz of our magnifizzent zzivilizzation were dezztroyed and only two realmzz zzat we know of remained intact but lozzt contact to each ozzer. ...',7000)
                npcHandler:say('In vizzionzz, zze Great Zznake revealed to Zalamon zze exzzizztenzze of ozzer lizzard people in a vazzt jungle in a far away land. ...',cid,10000)
                npcHandler:say('Zzough zze lizardzz of zze land failed zze Great Zznake and lozzt itzz favour, zzey are zztill in pozzezzion of ancient reliczz of immenzze power, onzze imbued by zze Great Zznake himzzelf. ...',cid,13000)
                npcHandler:say('I had vizzionzz of an - item. Yezz. It may be uzzeful for uzz - I mean you, ezzpecially you. ...',cid,16000)
                npcHandler:say('We need a zzeptre of power zzat can be found in zze underground of an ancient temple. It hazz been overrun by zzavage apezz and you will have to fight zzem and zze ancient guardianzz of zze temple azz well. Get uzz zzat zzeptre wherever it might be. ...', cid,18000)
                npcHandler:say('It wazz revealed zzat it hazz been zzplit into 3 partzz for reazzonzz zzat are of no importanzze anymore. Zzizz powerful devizze could help uzz in our battle againzzt zze emperor. ...',cid,25000)
                npcHandler:say('A shaft, a cuzzp, and an emerald form a zzeptre of zzuch power zzat zze partzz were hidden and are now guarded by vile creaturezz. ...',cid,28000)
                npcHandler:say('Find it. Retrieve it. And bring it back to me.', cid, 31000)
				setPlayerStorageValue(cid,82382,1)
				setPlayerStorageValue(cid,12288,1)
				talkState[cid] = 0
				end
				
		elseif (getPlayerStorageValue(cid,42830) == 2 and getPlayerStorageValue(cid,storageWrath) == 4 and getPlayerStorageValue(cid,12288) == 1)then
				if(msgcontains(msg, 'mission')) then
					npcHandler:say('You - azzembled zze zzeptre? Hand it out, give it to me, will you?', cid)
					talkState[cid] = 5
					elseif(msgcontains(msg, 'yes') and talkState[cid] == 5) then
				if(getPlayerItemCount(cid, 12288) >= 1 ) then
					npcHandler:say('Finally. At lazzt. Zze zzeptre izz - ourzz. Ourzz of courzze. A weapon we should uzze wizzely for our cauzze. I need a zzecond or two. Do you leave me already?', cid)
					setPlayerStorageValue(cid,storageWrath,5)
					doPlayerRemoveItem(cid, 12288, 1)
					talkState[cid] = 0
					end
					-------------------- MISSION 5 ----------------
		elseif (getPlayerStorageValue(cid,42830) == 2 and getPlayerStorageValue(cid,storageWrath) == 5 and getPlayerStorageValue(cid,12288) == 1) then
			if(msgcontains(msg, 'mission')) then
				npcHandler:say('Now we need to get clozzer to zze {emperor} himzzelf. A hive of beezz would defend zzeir queen wizz zzeir lives in cazze an enemy gained entranzze. Zzizz makezz a formidable defenzze line, nearly inviolable. ...',cid)
                npcHandler:say('But a zztranger directly in zze midzzt of zze hive will be acczzepted - after all it izz not pozzible to overcome zzuch a formidable defenzze which izz nearly inviolable, or izz it? Ha. ...',cid, 4000)
                npcHandler:say('Now zzat you overcame zzeir linezz of defenzze at zze {great gate}, you only need to find a way to enter zzeir home. ...',cid,6000)
                npcHandler:say('Head zztraight to zze entranzze of zze zzity. If you can convinzze zze guardzz to let you enter zze zzity, you should be able to reach our contact zzere wizz eazze. ...',cid,9000)
                npcHandler:say('We have alzzo forged zome paperzz for you and zzent zzem to zze zzity. Your victory in zze arena iz well known in our land. Wizz zze help of zzezze paperzz you will pretend zzat zzome of zze higher officialzz want to talk to you about your battle. ...',cid,13000)
                npcHandler:say('Zzizz way you will be able to enter zze zzity of zze dragon emperor and meet our contact zzere in zze imperial offizze. He will give you zze next inzztructionzz.', cid,17000)
				setPlayerStorageValue(cid,23382,1)
				talkState[cid] = 0
				end
		end	
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())