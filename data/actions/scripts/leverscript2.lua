function getPlayersInRange(position, radiusx, radiusy)
  local creaturesList = {}
  for x = -radiusx, radiusx do
    for y = -radiusy, radiusy do
      if not (x == 0 and y == 0) then
        local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z})
        if creature.type == 1 then
          table.insert(creaturesList, creature.uid)
        end
      end
    end
  end

  local creature = getTopCreature(position)
  if creature.type == 1 then
    if not(table.find(creaturesList, creature.uid)) then
      table.insert(creaturesList, creature.uid)
    end
  end
    return creaturesList
end

local t, n, storage = {
  {x=33082, y=31110, z=2} -- Position were player is
}, {
  {x=33078, y=31080, z=13} -- Position were player is going to be tp'd
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
  if item.itemid == 1946 then
    return doTransformItem(item.uid, item.itemid - 1)
  end

  local players = {}
  for i = 1, #t do
    local v = getTopCreature(t[i]).uid 
    players[i] = isPlayer(v) and v or nil
  end
  
  local first = players[1] and 1
  for i = 1 do
    if players[i] then
      doSendMagicEffect(t[i], CONST_ME_TELEPORT)
      doTeleportThing(players[i], n[i])
      doSendMagicEffect(n[i], CONST_ME_TELEPORT)
    end
  end

  doTransformItem(item.uid, item.itemid + 1)
  return true
end