local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local storage = 8657
local addonstore = 8640
local addonstore2 = 8641

function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg) end
function onThink()             npcHandler:onThink() end

function greetCallback(cid)
  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  Topic[talkUser] = 0
    return true
end

function creatureSayCallback(cid, type, msg)

  if(not npcHandler:isFocused(cid)) then
    return false
  end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  if msgcontains(msg, "mission") and getPlayerStorageValue(cid, storage) < 1 then
    npcHandler:say({'Yez, yez, I could need your azziztanze indeed. I am all alone, all on my own. But ZEY will not leave me in peaze. Zeir zpiritz, zey haunt me. Zeir ghoztz long for me. ...', 'I need... you to bring me what zey are zearching. Zomezing I can give to zem zat ztopz zem from haunting me. In ziz beautiful village I have... lozt zomezing, yez. My memory, you know. ...', 'Zere are 3 cheztz zomewhere in zeze gorgeouz houzez you zee around you. You zee zem, don\'t you? My eyezight, you know. It iz fading. And I can\'t remember... which houzez zey were in. ...', 'But YOU are young, YOU can zee, YOU can find zem. Each of ze cheztz containz a... paper. A will. From memberz of my poor dezeazed family. Pleaze get zem for me, child. Will you help me?'}, cid)
    Topic[talkUser] = 1
	elseif msgcontains(msg, "yes") and Topic[talkUser] == 1 then
    npcHandler:say('Good, good, pleaze hurry. Don\'t take zo long, will you child.', cid)
	setPlayerStorageValue(cid, storage, 1)
    Topic[talkUser] = 0
  elseif getPlayerStorageValue(cid, storage) == 1 and msgcontains(msg, "mission") then
    npcHandler:say('You have returned, I azzume you found ze lazt of ze lazt willz, yez my child? Have you?', cid)
    Topic[talkUser] = 2
  elseif msgcontains(msg, "yes") and Topic[talkUser] == 2 and getPlayerItemCount(cid, 12461) >= 3 then
    npcHandler:say({'Hahahahahahahaaaaaa. You did it. You brought it back. You did what I could not. What I waz forbidden to do. Bound to ziz plaze. Ze very ground I ztood on when dizazter ztruck. ...', 'When everyzing waz ztill bright, ze houzez tidy, ze blozzomz blazing, ze waterz pure - I killed zem. ...', 'I took care of zeir houzeholdz for zo long, zeir roomz, zeir bedz, zeir offzpring. I had enough. I could not ztand zeir fazez anymore. Ztaring down on me, adorning zemzelvez wiz decadenze. ...', 'Yez, I took care of zem one lazt time, each of zem. ...', 'And when I waz done and it waz all water under ze bridge, I returned, to collect my reward. My merit, my payoff. If I got my hand on each lazt will, none would benefit from zeir wealz. And I would have my revenge. ...', 'AND IT WAZ TAKEN FROM ME. ...', 'Zuddenly zomezing happened, ze zky darkened, ze world around me changed, all inhabitantz of ziz poor decal of a village died in ziz horrible cataztrophe. ...', 'To zink zat I would\'ve only had to WAIT. Inztead I ended up BURIED under ze remnantz of ziz dump. ...', 'My goal moving infinitely far out of reach, I finally breazed my lazt. I died here all zoze yearz ago az well. ...', 'Bound to ziz zoil I waz reztlezz wiz ziz unfinished affair. And YOU, YOU achieved what I could not. You retrieved ze lozt willz and NOW I AM THE GAINER. ...', 'Haha, ha... ha. ...', 'Why... why do I not dizappear? What\'z happening? ...', 'Hmmm... what? Ziz lazt document readz zat... large partz of ziz one\'z heir were meant for... me? He didn\'t know ...', 'Zo ziz iz not about my revenge? I am here for... punishment? PUNISHMENT? ZIZ IZ YOUR FAULT HUMAN! BEGONE. LEAVE. Leave me. Leave me... alone.'}, cid)
    doPlayerAddExp(cid, 10050)
	doPlayerRemoveItem(cid, 12461, 3)
	setPlayerStorageValue(cid, storage, 2)
	Topic[talkUser] = 0
  elseif msgcontains(msg, "mission") and getPlayerStorageValue(cid, storage) == 2 then
    npcHandler:say({'Oooh... I am alone again, alone forever. Oooh. And nozing to do, nozing. But I want to help.. want to make up for the trouble I cauzed ...', 'YOU - you zere, I can help you.. maybe, I can clean your houze, no? Or make breakfazt, no? Do you have any trouzerz, {hat}, {cape} or clozez you need to fix, no? Ah, I am alone, ever alone.'},cid)
    Topic[talkUser] = 0
	elseif msgcontains(msg, "cape") or msgcontains(msg, "old cape") and getPlayerStorageValue(cid, storage) == 2 then
    npcHandler:say({'Mh, I zee, well I probably darned more capez in my time than you wore in your entire life. Give it here, one more or lezz will not make a differenze, right?'}, cid)
    Topic[talkUser] = 3
	elseif msgcontains(msg, "yes") and Topic[talkUser] == 3 and getPlayerItemCount(cid, 12618) >= 1 and getPlayerStorageValue(cid, addonstore) == -1 then
    npcHandler:say({'Oh goodie! Thank you! Okay... I guess since my fingers are sticky now anyway, I will help you. From now on, if you bring me 10 pieces of spider silk, I will create one spool of yarn.'}, cid)
    doPlayerRemoveItem(cid, 12618, 1)
	Topic[talkUser] = 0
	setPlayerStorageValue(cid, addonstore, 1)
	doPlayerAddOutfit(cid, 366, 1)
	doPlayerAddOutfit(cid, 367, 1)
	elseif getPlayerStorageValue(cid, storage) == 2 and msgcontains(msg, "sedge hat") or msgcontains(msg, "hat") then
    npcHandler:say({'Do I look like your perzonal hatter?! ...', 'Well, on ze ozer hand, I do have zome experienze from my time working for zeze people. And zat hat surely needz a makeover. Care to give it to me?'}, cid)
    Topic[talkUser] = 4
	elseif msgcontains(msg, "yes") and Topic[talkUser] == 4 and getPlayerItemCount(cid, 12617) >= 1 and getPlayerStorageValue(cid, addonstore2) == -1 then
    npcHandler:say('Alright let me zee. ...', 'Here you are. Now begone.', cid)
    doPlayerRemoveItem(cid, 12617, 1)
	Topic[talkUser] = 0
	setPlayerStorageValue(cid, addonstore2, 1)
	doPlayerAddOutfit(cid, 366, 2)
	doPlayerAddOutfit(cid, 367, 2)
	end
  return TRUE
end

npcHandler:setMessage(MESSAGE_GREET, "Hello zere! Erm, iz... iz zere zomeone zere? Come clozer I can't zee zo good anymore.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
