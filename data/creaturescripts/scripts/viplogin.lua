function onLogin(cid)
        local vip = isVip(cid)
        if getVipTime(cid) > 0  and vip == FALSE then
                local townid = 1
                doPlayerSetTown(cid, townid)
                local templePos = getTownTemplePosition(getPlayerTown(cid))
                doTeleportThing(cid, templePos, false)
                setVipTime(cid, 0)
                doTeleportPlayers(cid, templePos)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seus dias de VIP ACC acabaram.")
        elseif vip == TRUE then
                local duration = getVipDate(cid)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você possui "..getVipDays(cid).." dia(s) de vip acc."..(duration and (" Ela irá durar até "..duration..".") or ""))
        end
        return TRUE
end