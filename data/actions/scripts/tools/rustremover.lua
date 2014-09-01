local breakChance = 60
local rustyItems = {
    [9808] = {2464, 2465, 2483, 2463, 2476}, --common rusty armor
    [9809] = {2464, 2465, 2483, 2463, 2476, 8891, 2487}, --semi-rare rusty armor
    [9810] = {2465, 2463, 2476, 8891, 2487, 2466, 2492, 2472}, --rare rusty armor
    [9811] = {2468, 2648, 2478, 2647, 2477}, --common rusty legs
    [9812] = {2468, 2648, 2478, 2647, 2477, 2488}, --semi-rare rusty legs
    [9813] = {2468, 2648, 2478, 2647, 2477, 2488, 2470}, --rare rusty legs
    [9814] = {2511, 2510, 2530, 2509, 2513, 2515}, --common rusty shield
    [9815] = {2511, 2510, 2530, 2509, 2513, 2515, 2516, 2519}, --semi-rare rusty shield
    [9816] = {2511, 2510, 2530, 2509, 2513, 2515, 2516, 2519, 2520, 2514}, --rare rusty shield
    [9817] = {2643, 3982, 5462, 7457}, --common rusty boots
    [9818] = {2643, 3982, 5462, 7457, 2195}, --semi-rare rusty boots
    [9819] = {2643, 3982, 5462, 7457, 2195, 2645}, --rare rusty boots
    [9820] = {2458, 2460, 2480, 2481, 2457, 2491}, --common rusty helmet
    [9821] = {2458, 2460, 2480, 2481, 2457, 2491, 2497}, --semi rare rusty helmet
    [9822] = {2458, 2460, 2480, 2481, 2457, 2491, 2497, 2475, 2498} --rare rusty helmet
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if rustyItems[itemEx.itemid] ~= nil then
        if math.random(100) <= breakChance then
            doRemoveItem(itemEx.uid)
            doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You broke it.")
			doSendMagicEffect(getCreaturePosition(cid),34)
        else
            local newId = rustyItems[itemEx.itemid][math.random(#rustyItems[itemEx.itemid])]
            doTransformItem(itemEx.uid,newId)
            doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You removed the rust, revealing a "..getItemNameById(newId))
			doSendMagicEffect(getCreaturePosition(cid),66)
        end
        doRemoveItem(item.uid,1)
        return TRUE
    end
    return FALSE
end