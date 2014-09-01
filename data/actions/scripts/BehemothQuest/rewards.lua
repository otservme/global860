function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,100104) == -1 then
setPlayerStorageValue(cid,100104, 1)
AddStageExp(cid,50000) 
end

local storage1 = 2100
local item1 = 2466
local storage2 = 2101
local item2 = 2520
local storage3 = 2102
local item3 = 2427
local storage4 = 2103
        if getPlayerStorageValue(cid, storage1) == -1 and item.uid == 1296 then
                setPlayerStorageValue(cid, storage1, 1)
		        doPlayerSendTextMessage(cid,25,"You have found a golden armor.")
		        doPlayerAddItem(cid,item1,1)
         elseif getPlayerStorageValue(cid, storage2) == -1 and item.uid == 1297 then
                setPlayerStorageValue(cid, storage2, 1)
		        doPlayerSendTextMessage(cid,25,"You have found a demon shield.")
		        doPlayerAddItem(cid,item2,1) 
          elseif getPlayerStorageValue(cid, storage3) == -1 and item.uid == 1299 then
                setPlayerStorageValue(cid, storage3, 1)
		        doPlayerSendTextMessage(cid,25,"You have found a guardian halberd.")
		        doPlayerAddItem(cid,item3,1)
          elseif getPlayerStorageValue(cid, storage4) == -1 and item.uid == 1298 then
                setPlayerStorageValue(cid, storage4, 1)
		        doPlayerSendTextMessage(cid,25,"You have found a bag.")
		        local container = doPlayerAddItem(cid, 1987, 1)
                doAddContainerItem(container, 2171, 1)  
                doAddContainerItem(container, 2168, 1)
                doAddContainerItem(container, 2124, 1)
                doAddContainerItem(container, 2146, 4)
                doAddContainerItem(container, 2145, 3)
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end 