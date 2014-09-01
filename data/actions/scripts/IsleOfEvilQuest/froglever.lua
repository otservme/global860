local tp = {x=32754,y=31470,z=7}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)
		doTeleportThing(cid,tp)
        	doSendMagicEffect(tp,10)
		doCreatureSay(cid,"What a cunning and devious death trap! Rapanaio has not warned you about a mastermind for nothing.",TALKTYPE_ORANGE_1)
	else
		doTransformItem(item.uid, 1945)
	end
	return true
end