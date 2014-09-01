local wrongworm = 100002
local rightworm = 100003
local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 500)

function onUse(cid, item, fromPosition, itemEx, toPosition)
    
    if getPlayerStorageValue(cid,wrongworm) == 1 then
       return doPlayerSendCancel(cid, "You need to pay your punish fee to Scutty.")
    end
    
    if (getCreatureCondition(cid, CONDITION_EXHAUST)) then 
       return doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
    end
    
    if itemEx.itemid == 10115 and getPlayerStorageValue(cid,rightworm) <= 4  then
       doSendMagicEffect(toPosition, 31)
       doCreatureSay(cid,"You've got him! That will teach the beast a lesson!",TALKTYPE_ORANGE_1)
       setPlayerStorageValue(cid, rightworm, getPlayerStorageValue(cid, rightworm) + 1)
       doAddCondition(cid, exhaust)
       doSendAnimatedText(toPosition,"+"..getPlayerStorageValue(cid, rightworm).."",TEXTCOLOR_GREEN)
    elseif itemEx.itemid == 10115 and getPlayerStorageValue(cid,rightworm) == 5 then	
       doSendMagicEffect(toPosition, 31)
       doCreatureSay(cid,"You've got him! That was the last one you had to scare off. Report to Scutty about the worms.",TALKTYPE_ORANGE_1)
       setPlayerStorageValue(cid, rightworm, getPlayerStorageValue(cid, rightworm) + 1)
       setPlayerStorageValue(cid,100063, 12)
       doAddCondition(cid, exhaust)
       doSendAnimatedText(toPosition,"+"..getPlayerStorageValue(cid, rightworm).."",TEXTCOLOR_GREEN)
       doPlayerRemoveItem(cid,10119,1)
    elseif itemEx.itemid == 10115 and getPlayerStorageValue(cid,rightworm) >= 6 then	
       doSendMagicEffect(toPosition, 31)
       doAddCondition(cid, exhaust)
    elseif itemEx.itemid == 10114 then
        doSendMagicEffect(toPosition, 4)
        doCreatureSay(cid,"Oh no! You have hit one of Scutty's precious drilling worms!",TALKTYPE_ORANGE_1)
        setPlayerStorageValue(cid,wrongworm, 1)
        doSendAnimatedText(toPosition,"-"..getPlayerStorageValue(cid, wrongworm).."",TEXTCOLOR_RED)
        doPlayerRemoveItem(cid,10119,1)
       end	
    return true
end