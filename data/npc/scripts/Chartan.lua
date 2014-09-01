local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function greetCallback(cid)
	talkState[cid] = 0
	return true
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storage = 42324
	local doorStorage = 42823
		
		if (getPlayerStorageValue(cid,42324) == 2) then
				--------------------------------------------------
			if(msgcontains(msg, 'mission') and talkState[talkUser] < 1) then
				npcHandler:say({'Mhm, what are you doing here. Who zent you?'}, cid)
				talkState[talkUser] = 1
				--------------------------------------------------
			    elseif(msgcontains(msg, 'zalamon') and talkState[talkUser] == 1) then
				    npcHandler:say({'I zee. Zalamon zent word of ze arrival of a zoftzkin quite zome time ago. Zat muzt be you zen. ...', 'Well, I exzpected zomeone more - imprezzive. However, we will zee how far you can get. You\'ve got newz from ze zouz? ...', 'Hm, I underztand. ...', 'Oh you did. ...', 'I zee. Interezting. ...', 'You being here meanz we have eztablished connectionz to ze zouz. Finally. And you are going to help uz. Well, zere iz zertainly a lot for you to do. Zo better get ztarted.'}, cid)
				    talkState[talkUser] = 0
				    setPlayerStorageValue(cid,42324,3)
		    end
		end
				--------------------------------------------------
				--------------------------------------------------
		if (getPlayerStorageValue(cid,42324) == 3) then
				--------------------------------------------------
			if(msgcontains(msg, 'mission')) then
			    npcHandler:say({'Zo are you ready to get zomezing done?'}, cid)
		        talkState[talkUser] = 3	

			elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
				npcHandler:say({'Alright. Well, az you might not be aware of it yet - we are on top of an old temple complex. It haz been abandoned and it haz crumbled over time. ...', 'Ze teleporter over zere uzed to work juzt fine to get uz back to ze zouz. But it haz ztopped operating for quite zome time. ...', 'My men believe it iz a dizturbanze cauzed by ze corruption zat zpreadz everywhere. Zey are too zcared to go down zere. And zat\'z where you come in. ...', 'Zere were meanz to activate teleporterz zomewhere in ze complex. But zinze you cannot reach all ze roomz, I guezz you will have to improvize. ...', 'Here iz ze key to ze entranze to ze complex. Figure zomezing out, reztore ze teleporter zo we can get back to ze plainz in ze zouz.'}, cid)
			    talkState[talkUser] = 0
				setPlayerStorageValue(cid,42324,4)
				setPlayerStorageValue(cid,doorStorage,1)
			end
		end
				--------------------------------------------------
				--------------------------------------------------
		if (getPlayerStorageValue(cid,42324) == 4) then		
				--------------------------------------------------
			if(msgcontains(msg, 'mission')) then
				npcHandler:say({'Zo? Did you find a way to reztore ze teleporter?'}, cid)	
				talkState[talkUser] = 5	
				
			    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5 and getPlayerStorageValue(cid,42830) == 1) then
				    npcHandler:say({'You did it! Zere waz zome kind of zparkle and I zink it iz working again - oh pleaze feel free to try it, I uhm, I will wait here and be ready juzt in caze zomezing uhm happenz to you. ...', 'And if you head to Zalamon, be zure to inform him about our zituation. Food rationz are running low and we are ztill not well equipped. We need to eztablish a working zupply line.'}, cid)
				    talkState[talkUser] = 0
				    setPlayerStorageValue(cid,42830,2)
			end
		end
				--------------------------------------------------
				--------------------------------------------------
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Great Znake forgive me to converze wiz ziz unworzy blankzkin.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())