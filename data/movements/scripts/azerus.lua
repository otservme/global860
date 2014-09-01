function onStepIn(cid, item, position, fromPosition)

--Config-->
local queststatus = getPlayerStorageValue(cid, 50006)
--EndConfig-->
	if item.actionid == 1974 and queststatus == -1 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "It seems by defeating Azerus you have stoped this army from entering your world! Better leave this ghastly place forever.")
		setPlayerStorageValue(cid, 4765, 1)
	return TRUE
end

if item.actionid == 1973 and queststatus == -1 then
-- Here is the code start:
starting={x = 32778, y = 31160, z = 10, stackpos = 253}
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
ending={x = 32788, y = 31172, z = 10, stackpos = 253}
players=0
totalmonsters=0
monster = {}
repeat
creature= getThingfromPos(checking)
 if creature.itemid > 0 then
 if getPlayerAccess(creature.uid) == 0 then
 players=players+1
 end
  if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
 totalmonsters=totalmonsters+1
  monster[totalmonsters]=creature.uid
   end
 end
checking.x=checking.x+1
  if checking.x>ending.x then
  checking.x=starting.x
  checking.y=checking.y+1
 end
until checking.y>ending.y
if players==0 then
trash= {x=33193, y=31689, z=15}
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters
end
-- Here is the end of it

doTeleportThing(cid, player_pos_entrada)
doSendMagicEffect(player_pos_entrada, 10)

else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você já terminou a quest!')
end
end