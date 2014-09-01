local storage = 100005
local dp = {10290,10316,10300, 10289}
local db = {10291,10318,10292, 10299}
local mh = {10293,10304,10317, 10294}
local bg = {10296,10302,10301, 10295}
local ms = {10298,10303,10297, 10313}
local em = 10308
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 10319 and getPlayerStorageValue(cid,storage) == -1 then
	if getPlayerStorageValue(cid,storage) == 1 then return false end
	   setPlayerStorageValue(cid,storage, 1)
	   doPlayerAddItem(cid, dp[math.random(#dp)], 1)
	   doCreatureSay(cid,"You reap some magnificent loot from this servant of evil!",TALKTYPE_ORANGE_1)
    elseif item.itemid == 10320 then
    if getPlayerStorageValue(cid,storage) == 2 then return false end
    if getPlayerStorageValue(cid,storage) == 1 then
	   setPlayerStorageValue(cid,storage, 2)
	   doPlayerAddItem(cid, db[math.random(#db)], 1)
	   doCreatureSay(cid,"You reap some magnificent loot from this servant of evil!",TALKTYPE_ORANGE_1)
    else
       doCreatureSay(cid,"You most loot Doctor Perhaps first!",TALKTYPE_ORANGE_1)
    end       
    elseif item.itemid == 10323 then
    if getPlayerStorageValue(cid,storage) == 3 then return false end
    if getPlayerStorageValue(cid,storage) == 2 then
	   setPlayerStorageValue(cid,storage, 3)
	   doPlayerAddItem(cid, mh[math.random(#mh)], 1)
	   doCreatureSay(cid,"You reap some magnificent loot from this servant of evil!",TALKTYPE_ORANGE_1)
    else
       doCreatureSay(cid,"You most loot Dirtbeard first!",TALKTYPE_ORANGE_1)
    end
    elseif item.itemid == 10324 then
    if getPlayerStorageValue(cid,storage) == 4 then return false end
    if getPlayerStorageValue(cid,storage) == 3 then
	   setPlayerStorageValue(cid,storage, 4)
	   doPlayerAddItem(cid, bg[math.random(#bg)], 1)
	   doCreatureSay(cid,"You reap some magnificent loot from this servant of evil!",TALKTYPE_ORANGE_1)
    else
       doCreatureSay(cid,"You most loot Mephiles first!",TALKTYPE_ORANGE_1)
    end
    elseif item.itemid == 10322 then
    if getPlayerStorageValue(cid,storage) == 5 then return false end
    if getPlayerStorageValue(cid,storage) == 4 then
	   setPlayerStorageValue(cid,storage, 5)
	   doPlayerAddItem(cid, ms[math.random(#ms)], 1)
	   doCreatureSay(cid,"You reap some magnificent loot from this servant of evil!",TALKTYPE_ORANGE_1)
    else
       doCreatureSay(cid,"You most loot Boogey first!",TALKTYPE_ORANGE_1)
    end
    elseif item.itemid == 10321 then
    if getPlayerStorageValue(cid,storage) == 6 then return false end
    if getPlayerStorageValue(cid,storage) == 5 then
	   setPlayerStorageValue(cid,storage, 6)
	   doPlayerAddItem(cid,10308, 1)
	   doCreatureSay(cid,"You reap some magnificent loot from this servant of evil!",TALKTYPE_ORANGE_1)
	   setPlayerStorageValue(cid,100000, 15)
	   setPlayerStorageValue(cid,100063, 22)
    else
       doCreatureSay(cid,"You most loot Monstor first!",TALKTYPE_ORANGE_1)
       end
    end
    return true
end