function onKill(cid, target, lastHit)
if(isPlayer(target) ~= true) then
return true
end

if (isPlayer(cid) == true) and (isPlayer(target) == true) then
if getPlayerSkullType(target) == SKULL_WHITE then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_YELLOW then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_RED then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_BLACK then
addPlayerFrag(cid, 1)
elseif getPlayerSkullType(target) == SKULL_NONE then
addPlayerFrag(cid, 1)
end
return TRUE
end
end 