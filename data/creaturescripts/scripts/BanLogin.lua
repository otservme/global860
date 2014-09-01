function onLogin(cid)
local MyAccount = getPlayerAccountId(cid)
if isAccountBan(MyAccount) then
local baninfo = getBanAccInfo(MyAccount)
doPlayerPopupFYI(cid, "You account has been banished at:\n"..os.date("%d %b %Y",baninfo[1])..".\n\nfor the following reason:\n"..baninfo[2]..".\n\nYour banishment will be lifted at:\n"..os.date("%d %b %Y %X",baninfo[1])..".")
addEvent(doRemoveCreature, 1500, cid)
end
return true
end