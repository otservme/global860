function onStepIn(cid, item, pos)

local bk = {x=32874, y=31953, z=12}
		doTeleportThing(cid,bk)
     	doSendMagicEffect(bk,CONST_ME_TELEPORT)
end  