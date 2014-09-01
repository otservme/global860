function onUse(cid, item, frompos, item2, topos)

--Config-->
local statue_pos = {x = 32783, y = 31166, z = 10}
local portal_quest01_pos = {x = 32783, y = 31175, z = 10, stackpos = 2}
local portal_quest02_pos = {x = 32784, y = 31177, z = 9, stackpos = 2}
local new_portal_pos = {x = 32783, y = 31168, z = 10, stackpos = 1}
local new_pos = {x = 32778, y = 31171, z = 14}
--End Config-->

function Potwory1()
if math.random (1,8) == 4 then
doSummonCreature('Rift Brood', {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Brood', {x = statue_pos.x-1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Brood', {x = statue_pos.x, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x-1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x+1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x+1, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x-1, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
addEvent(Potwory2, 30 * 1000)
else
doSummonCreature('Azerus', {x = statue_pos.x, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Brood', {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Brood', {x = statue_pos.x-1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Brood', {x = statue_pos.x, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x-1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x+1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x+1, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x-1, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
addEvent(Potwory2, 30 * 1000)
end
end

function Potwory2()
doSummonCreature('Rift Brood', {x = statue_pos.x-1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Brood', {x = statue_pos.x, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x-1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Worm', {x = statue_pos.x+1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
addEvent(Potwory3, 35 * 1000)
end

function Potwory3()
doSummonCreature('Rift Scythe', {x = statue_pos.x-1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Scythe', {x = statue_pos.x+1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Scythe', {x = statue_pos.x+1, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('Rift Scythe', {x = statue_pos.x-1, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
addEvent(Potwory4, 40 * 1000)
end

function Potwory4()
doSummonCreature('Azerus', {x = statue_pos.x, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('War Golem', {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('War Golem', {x = statue_pos.x-1, y = statue_pos.y+1, z = statue_pos.z, stackpos = 253})
doSummonCreature('War Golem', {x = statue_pos.x, y = statue_pos.y-1, z = statue_pos.z, stackpos = 253})
doSummonCreature('War Golem', {x = statue_pos.x-1, y = statue_pos.y, z = statue_pos.z, stackpos = 253})
addEvent(NewPortal, 90 * 1000)
end

function NewPortal()
doCreateTeleport(1387, new_pos, new_portal_pos)
addEvent(RemoveAll, 60 * 1000)
end

function RemoveAll()
doRemoveItem(getThingfromPos(portal_quest01_pos).uid,1)
doRemoveItem(getThingfromPos(portal_quest02_pos).uid,1)
doRemoveItem(getThingfromPos(new_portal_pos).uid,1)
end

if item.uid == 11223 and getThingfromPos(portal_quest01_pos).itemid ~= 9772 then
doCreateItem(9772,1,portal_quest01_pos)
doCreateItem(9772,1,portal_quest02_pos)
addEvent(Potwory1, 0)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return TRUE
end