function onUse(cid, item, fromPosition, itemEx, toPosition)

function Wall1()
doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8754 ).uid, 8755)
end
function Wall2()
doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8756 ).uid, 8757)
end
function Wall3()
doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8758 ).uid, 8759)
end
function Wall4()
doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8759 ).uid, 8754)
end

if (getPlayerStorageValue(cid,100080) < 3) then 
if itemEx.itemid == 8753 then
   doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8753 ).uid, 8754)
   doCreatureSay(toPosition,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_ORANGE_1) 
   addEvent(Wall1, 20*1000)
elseif itemEx.itemid == 8755 then 
   doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8755 ).uid, 8756)
   doCreatureSay(toPosition,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_ORANGE_1) 
   addEvent(Wall2, 20*1000)
elseif itemEx.itemid == 8757 then 
   doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8757 ).uid, 8758)
   addEvent(Wall3, 20*1000)
   doCreatureSay(toPosition,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_ORANGE_1) 
elseif itemEx.itemid == 8759 then 
   addEvent(Wall4, 20*1000)
   doCreatureSay(toPosition,""..getCreatureName(cid).." destroyed the shadow nexus! In 20 seconds it will return to its original state.",TALKTYPE_ORANGE_1) 
   setPlayerStorageValue(cid,100080, 3)
   end
   end
end