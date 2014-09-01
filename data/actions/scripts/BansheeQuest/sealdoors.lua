local seal1 = 32998
local seal2 = 32997
local seal3 = 32996
local seal4 = 32995
local seal5 = 32994
local seal6 = 32993
local seal7 = 32992
local last = 32991
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == 5106 or item.itemid == 5115 then return false end
	if item.uid == 2019 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
 	elseif item.uid == 2020 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
   	elseif item.uid == 2021 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
   	elseif item.uid == 2022 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
   	elseif item.uid == 2023 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
   	elseif item.uid == 2024 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
   	elseif item.uid == 2025 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
   	elseif item.actionid == 2026 then
                doTransformItem(item.uid, item.itemid + 1)
		        doTeleportThing(cid, toPosition, TRUE)
	else
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	        end
	        return true
end