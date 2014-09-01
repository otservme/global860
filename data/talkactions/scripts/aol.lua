function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 20000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doCreatureSay(cid, "Você acaba de comprar um AOL!", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Você não tem dinheiro suficiente, precisa de 2 crystal coins.", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end