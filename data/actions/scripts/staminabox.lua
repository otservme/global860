function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 66677,
		hours = 72
	}
	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you have wait to "..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,config.storage)).." to use this again.")
	end
	local cfg = {}
	cfg.refuel = 42 * 60 * 1000
	if(getPlayerStamina(cid) >= cfg.refuel) then
		doPlayerSendCancel(cid, "Your stamina is already full.")
	else
		doPlayerSetStamina(cid, cfg.refuel)
		setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your stamina has been refilled, please relog to activate.")
		doRemoveItem(item.uid)
	end
	return true
end