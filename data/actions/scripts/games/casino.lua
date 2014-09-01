function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == 7568 and
doPlayerRemoveItem (cid, 6527, 2) == TRUE then
rand = math.random(0, 6)
if rand >= 0 and rand <= 1 then
doPlayerRemoveItem(cid,6527,2)
    doPlayerSendTextMessage(cid,22,"Oh No! You have bad luck. You lost two tokens!!!")
            doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
elseif rand > 1 and rand <= 2 then
doPlayerRemoveItem(cid,6527,3)
    doPlayerSendTextMessage(cid,22,"Oh No! You have bad luck. You lost three tokens!")
            doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
elseif rand > 2 and rand <= 3 then
doPlayerRemoveItem(cid,6527,1)
            doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
    doPlayerSendTextMessage(cid,22,"Oh No! You have bad luck. You lost a token!")
elseif rand > 3 and rand <= 4 then
doPlayerAddItem(cid,2160,2)
            doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
    doPlayerSendTextMessage(cid,22,"Wooo! Its your lucky day. You won a crystal coin!")
elseif rand > 4 and rand <= 5 then
doPlayerAddItem(cid,2160,2)
            doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
    doPlayerSendTextMessage(cid,22,"Wooo! Its your lucky day. You won a two crystal coins!")
elseif rand > 5 and rand <= 6 then
doPlayerAddItem(cid,2160,3)
            doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
    doPlayerSendTextMessage(cid,22,"Wooo! Its your lucky day. You won three crystal coins!")
end
else
doPlayerSendCancel(cid, "You need 2 tokens to play.")
end
return TRUE
end