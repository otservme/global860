local player1 = {x=33190, y=31629, z=13} 
local player2 = {x=33191, y=31629, z=13} 
local id = 1058 -- wall id
local walls = -- walls positions
	{
		{x=33210, y=31631, z=13, stackpos=1},
		{x=33211, y=31631, z=13, stackpos=1},
		{x=33212, y=31631, z=13, stackpos=1},
	}
function onStepIn(cid, item, frompos, item2, topos)
doTransformItem(item.uid, 425)
if isPlayer(cid) then
	if getTileItemById(player1, 425).uid > 0 and getTileItemById(player2, 425).uid > 0 then  
		for i = 1, #walls do
		local w = getTileItemById(walls[i], id).uid
			if w ~= 0 then
				doRemoveItem(w)
				end
			end
		end
	end
	return true
end

function onStepOut(cid, item, frompos, item2, topos)
doTransformItem(item.uid, 426)
if isPlayer(cid) then
	for i = 1, #walls do
    	local w2 = getTileItemById(walls[i], id).uid
		if w2 == 0 then
			doCreateItem(id,1, walls[i])
            		end
        	end
	end
	return true
end