function onSay(cid, words, param)
    if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) or getPlayerBlessing(cid, 4) or getPlayerBlessing(cid, 5) then
        doPlayerSendCancel(cid,'You have already got one or more blessings!')
    else
        if doPlayerRemoveMoney(cid, 50000) == TRUE then
            doPlayerAddBlessing(cid, 1)
            doPlayerAddBlessing(cid, 2)
            doPlayerAddBlessing(cid, 3)
            doPlayerAddBlessing(cid, 4)
            doPlayerAddBlessing(cid, 5)
			doSendMagicEffect(getPlayerPosition(cid), 29)
            doCreatureSay(cid,'I have been blessed by the gods!', TALKTYPE_ORANGE_1)
        else
            doPlayerSendCancel(cid, "You need 50k to get blessed!")
        end
    end    
    return 1
end