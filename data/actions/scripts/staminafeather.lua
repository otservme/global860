function onUse(cid, item, frompos, item2, topos) 
local config = { 
staminafull = 42*60, effect = 53 } 
player = getPlayerPosition(cid) 
playerstamina = getPlayerStamina(cid) 
playeracc = getPlayerAccess(cid) 
playerfood = getPlayerFood(cid) 
if playeracc <= 2 then 
    if playerfood ~= 0 then 
        if playerstamina ~= config.staminafull then 
            setPlayerStamina(cid, config.staminafull) 
            doRemoveItem(item.uid, 1) 
            doPlayerSendTextMessage(cid,22,"Stamina added by a feather of time!") 
            doSendMagicEffect(player, config.effect) 
        else 
            doPlayerSendTextMessage(cid,22,"You dont need a feather of time!") 
        end 
    else 
        doPlayerSendTextMessage(cid,22,"You can't use it if hungry!") 
    end 
else 
doPlayerSendTextMessage(cid,22,"You are a member of the staff. You dont Need it!") 
end 
return true 
end