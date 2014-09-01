 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 100001, -- change to your own storage value :)
        item1 = 10122, 
		

}
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found isle of evil.")
        local item = doPlayerAddItem(cid,config.item1,1)
	setPlayerStorageValue(cid,100063, 2)
        doSetItemText(item,"Eventually we reached an island that was thoroughly evil. It took all our courage and bravery to make our way through the dangerous territory to the dominating structure of the evil tower that loomed over the whole isle. We were well aware that the master of that tower had to be the epitome of evil and we had to enter his tower, regardless of the dangers involved. Only few had ever reached the isle and none of them had ever returned to tell the tale. But we were there and knew that it was our destiny to face the master of the isle. Retreat was not an option. We braved all the dangers that the isle seemed to throw against us and finally stood in front of the tower. Who would carry on our work if we failed? We knew if we did not stop the master of this isle, it might take decades until somebody else would find this isle and then it might be too late to stop the fiendish plot that threatened the whole world.")
        else
                doPlayerSendTextMessage(cid,25,"The box is empty.")
                end
        return TRUE
end 