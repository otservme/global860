local config = {
level1= 50,
level2 = 20,      
level3 = 100,    
level4 = 160,                                    
storage = 2020, 
msg = "Parabéns, você foi promovido com sucesso!", 
days = 1,
msg4 = "Parabéns, por alcançar o level 100, você recebeu 10 crystal coins",
msg5 = "Parabéns, por alcançar o level 160, você recebeu 15 crystal coins",
msgtype = MESSAGE_EVENT_ADVANCE,
msg2 = "Parabéns, por alcançar o level 50, você recebeu 40k!",
item = 2160
}
 
function onAdvance(cid, oldLevel, newLevel)
	if getPlayerStorageValue(cid, config.storage) == -1 and getPlayerLevel(cid) >= config.level2 then
		setPlayerPromotionLevel(cid, 1)
		doPlayerSendTextMessage(cid, config.msgtype, config.msg)
		setPlayerStorageValue(cid, config.storage, 1)
	end
	if getPlayerLevel(cid) >= config.level3 and getGlobalStorageValue(getPlayerAccountId(cid)+461) <= 0 then
		setGlobalStorageValue(getPlayerAccountId(cid)+461, 1)
		doPlayerAddItem(cid, config.item, 10)
		doPlayerSendTextMessage(cid, config.msgtype, config.msg4)
	end
	if getPlayerLevel(cid) >= config.level1 and getGlobalStorageValue(getPlayerAccountId(cid)+455) <= 0 then
		setGlobalStorageValue(getPlayerAccountId(cid)+455, 1)
		doPlayerSendTextMessage(cid, config.msgtype, config.msg2)
		doPlayerAddItem(cid, config.item, 4)
	end
	if getPlayerLevel(cid) >= config.level4 and getGlobalStorageValue(getPlayerAccountId(cid)+455) <= 0 then
		setGlobalStorageValue(getPlayerAccountId(cid)+455, 1)
		doPlayerSendTextMessage(cid, config.msgtype, config.msg5)
		doPlayerAddItem(cid, config.item, 15)
	end
return TRUE
end