function onUse(cid, item, fromPosition, itemEx, toPosition)

  if item.itemid == 1946 then
      return doTransformItem(item.uid, item.itemid - 1)
	elseif(item.actionid == 4830) and item.itemid == 1945 then
       doTeleportThing(getTopCreature({x=32991,y=31539,z=1}).uid, {x=32991,y=31539,z=4})
	elseif (item.actionid == 4831) and item.itemid == 1945 then
		doTeleportThing(getTopCreature({x=32991,y=31539,z=4}).uid, {x=32991,y=31539,z=1})
	elseif (item.actionid == 4832) and item.itemid == 1945 then
		doTeleportThing(getTopCreature({x=32993,y=31547,z=4}).uid, {x=33061,y=31527,z=10})
	elseif (item.actionid == 4833) and item.itemid == 1945 then
		doTeleportThing(getTopCreature({x=33061,y=31527,z=10}).uid, {x=32993,y=31547,z=4})
	end
		  doTransformItem(item.uid, item.itemid + 1)
	return true
end
