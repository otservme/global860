function onUse(cid, item, fromPosition, itemEx, toPosition)

  if item.itemid == 1946 then
    return doTransformItem(item.uid, item.itemid - 1)
	elseif(item.actionid == 23232) and item.itemid == 1945 then
       doTeleportThing(getTopCreature({x=33078,y=31080,z=13}).uid, {x=33082,y=31110,z=2})
	elseif (item.actionid == 23233) and item.itemid == 1945 then
		doTeleportThing(getTopCreature({x=33082,y=31110,z=2}).uid, {x=33078,y=31080,z=13})
	end
	  doTransformItem(item.uid, item.itemid + 1)
	return true
end