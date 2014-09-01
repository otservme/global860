function onLogin(cid)
	if getPlayerStorageValue(cid, 50000) == -1 then
		if isSorcerer(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)

			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2160, 2)
                        doAddContainerItem(bag, 2789, 25)
                        doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 7620, 1)
			
			doPlayerAddItem(cid, 2173, 1)		
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2190, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2124, 1)

		setPlayerStorageValue(cid, 50000, 1)

		elseif isDruid(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)

			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2160, 2)
                        doAddContainerItem(bag, 2789, 25)
                        doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 7620, 1)
			
			doPlayerAddItem(cid, 2173, 1)		
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2182, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2124, 1)

			setPlayerStorageValue(cid, 50000, 1)

		elseif isPaladin(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)

			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2160, 2)
                        doAddContainerItem(bag, 2789, 25)
                        doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 7620, 1)
			
			doPlayerAddItem(cid, 2173, 1)		
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2389, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2124, 1)

			setPlayerStorageValue(cid, 50000, 1)

		elseif isKnight(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)

			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2160, 2)
                        doAddContainerItem(bag, 2789, 25)
                        doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 7620, 1)
			doAddContainerItem(bag, 2428, 1)
			doAddContainerItem(bag, 2394, 1)
		
			doPlayerAddItem(cid, 2173, 1)
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2383, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2124, 1)

			setPlayerStorageValue(cid, 50000, 1)
		end
	end
 	return TRUE
end