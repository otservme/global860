local ab = {x=32732, y=31634, z=7}
local ank = {x=33194, y=32853, z=8}
local carl = {x=32360, y=31782, z=7}
local dar = {x=33213, y=32454, z=1}
local ed = {x=33217, y=31814, z=8}
local kaz = {x=32649, y=31925, z=11}
local lib = {x=32317, y=32826, z=7}
local port = {x=32594, y=32745, z=7}
local svar = {x=32212, y=31132, z=7}
local th = {x=32369, y=32241, z=7}
local ven = {x=32957, y=32076, z=7}
local yala = {x=32787, y=31276, z=7}

function onStepIn(cid, item, position, fromPosition)
        if isPlayer(cid) then
        if getPlayerStorageValue(cid,100108) == 1 or getPlayerStorageValue(cid,100109) == 1 or getPlayerStorageValue(cid,100110) == 1 or getPlayerStorageValue(cid,100111) == 1 or getPlayerStorageValue(cid,100112) == 1 or getPlayerStorageValue(cid,100113) == 1 or getPlayerStorageValue(cid,100114) == 1 or getPlayerStorageValue(cid,100115) == 1 or getPlayerStorageValue(cid,100116) == 1 or getPlayerStorageValue(cid,100117) == 1 or getPlayerStorageValue(cid,100118) == 1 or getPlayerStorageValue(cid,100119) == 1 then
        if getPlayerStorageValue(cid,100108) == 1 then 
           setPlayerStorageValue(cid,100108, -1)
           doTeleportThing(cid,ab)
        end
        if getPlayerStorageValue(cid,100109) == 1 then 
           setPlayerStorageValue(cid,100109, -1)
           doTeleportThing(cid,ank)
        end
        if getPlayerStorageValue(cid,100110) == 1 then 
           setPlayerStorageValue(cid,100110, -1)
           doTeleportThing(cid,carl)
        end
        if getPlayerStorageValue(cid,100111) == 1 then 
           setPlayerStorageValue(cid,100111, -1)
           doTeleportThing(cid,dar)
        end
        if getPlayerStorageValue(cid,100112) == 1 then 
           setPlayerStorageValue(cid,100112, -1)
           doTeleportThing(cid,ed)
        end
        if getPlayerStorageValue(cid,100113) == 1 then 
           setPlayerStorageValue(cid,100113, -1)
           doTeleportThing(cid,kaz)
        end
        if getPlayerStorageValue(cid,100114) == 1 then 
           setPlayerStorageValue(cid,100114, -1)
           doTeleportThing(cid,lib)
        end
        if getPlayerStorageValue(cid,100115) == 1 then 
           setPlayerStorageValue(cid,100115, -1)
           doTeleportThing(cid,port)
        end
        if getPlayerStorageValue(cid,100116) == 1 then 
           setPlayerStorageValue(cid,100116, -1)
           doTeleportThing(cid,svar)
        end
        if getPlayerStorageValue(cid,100117) == 1 then 
           setPlayerStorageValue(cid,100117, -1)
           doTeleportThing(cid,th)
        end
        if getPlayerStorageValue(cid,100118) == 1 then 
           setPlayerStorageValue(cid,100118, -1)
           doTeleportThing(cid,ven)
        end
        if getPlayerStorageValue(cid,100119) == 1 then 
           setPlayerStorageValue(cid,100119, -1)
           doTeleportThing(cid,yala)
        end
        doSendMagicEffect(getThingPos(cid),CONST_ME_TELEPORT)
        else
      doTeleportThing(cid,th)
      doSendMagicEffect(getThingPos(cid),CONST_ME_TELEPORT)
      end
      end 
      return true
end  