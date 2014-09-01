function onSay(cid, words, param)
        local futurelevel = getPlayerLevel(cid) + 1
        local lv = getPlayerLevel(cid)

        if lv > 1 then
  equation = (50 * (lv) * (lv) * (lv) - 150 * (lv) * (lv) + 400 * (lv)) / 3
  msg = "Level ".. futurelevel .." Requires ".. equation .." experience points."
        else
  msg = "Level 2 requires 100 experience to achieve."
        end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg)
        return 0        
end