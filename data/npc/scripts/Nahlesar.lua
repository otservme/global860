local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 
npcHandler:onThink()
local npc = getNpcId()
if getCreatureOutfit(npc).lookType == 80 then
     doCreatureChangeOutfit(npc, {lookType = 51})
else 
     doCreatureChangeOutfit(npc, {lookType = 80})  
     end
end
 
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
 
-- [ITEMID TO SELL] = {Buy cost (0 = not buyable), sell cost (0 = not sellable)} 
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local storage = 100061
local t = {
							
--[[Ancient Shield]] [2532] = {sell = 450, buy = 0},
--[[Angelic Axe]] [7436] = {sell = 2500, buy = 0},
--[[Black Shield]] [2529] = {sell = 400, buy = 0},
--[[Blue Rob]] [2656] = {sell = 5000, buy = 0},
--[[Bonebreaker]] [7428] = {sell = 5000, buy = 0},
--[[Bonelord shield]] [2518] = {sell = 600, buy = 0},
--[[Boots of haste]] [2195] = {sell = 15000, buy = 0},
--[[Broadsword]] [2413] = {sell = 250, buy = 0},
--[[Butcher's Axe]] [7412] = {sell = 9000, buy = 0},
--[[Crown Armor]] [2487] = {sell = 6000, buy = 0},
--[[Crown Helmet]] [2491] = {sell = 1250, buy = 0},
--[[Crown Legs]] [2488] = {sell = 6000, buy = 0},
--[[Crown Shield]] [2519] = {sell = 4000, buy = 0},
--[[Crusader Helmet]] [2497] = {sell = 3000, buy = 0},
--[[Dark Armor]] [2489] = {sell = 200, buy = 0},
--[[Dark Helmet]] [2490] = {sell = 125, buy = 0},
--[[Dragon Hammer]] [2434] = {sell = 1000, buy = 0},
--[[Dragon Lance]] [2414] = {sell = 4500, buy = 0},
--[[Dragon Shield]] [2516] = {sell = 2000, buy = 0},
--[[Dreaded Cleaver]] [7419] = {sell = 7500, buy = 0},
--[[Fire Axe]] [2432] = {sell = 4000, buy = 0},
--[[Fire Sword]] [2392] = {sell = 2000, buy = 0},
--[[Giant Sword]] [2393] = {sell = 8500, buy = 0},
--[[Glorius Axe]] [7454] = {sell = 1500, buy = 0},
--[[Guardian Shield]] [2515] = {sell = 1000, buy = 0},
--[[Hailstorm Rod]] [2183] = {sell = 1500, buy = 0},
--[[Haunted Blade]] [7407] = {sell = 4000, buy = 0},
--[[Ice Rapier]] [2396] = {sell = 500, buy = 0},
--[[Knight Armor]] [2476] = {sell = 2500, buy = 0},
--[[Knight Axe]] [2430] = {sell = 1000, buy = 0},
--[[Kinght Legs]] [2477] = {sell = 2500, buy = 0},
--[[Moonliht Rod]] [2186] = {sell = 100, buy = 0},
--[[Mystic Turban]] [2663] = {sell = 75, buy = 0},
--[[Necrotic]] [2185] = {sell = 500, buy = 0},
--[[Noble Armor]] [2486] = {sell = 450, buy = 0},
--[[Northwind Rod]] [8911] = {sell = 750, buy = 0},
--[[Obsidian Lance]] [2425] = {sell = 250, buy = 0},
--[[Onyx Flali]] [7421] = {sell = 11000, buy = 0},
--[[Ornamented Axe]] [7411] = {sell = 10000, buy = 0},
--[[Phoenix Shield]] [2539] = {sell = 8000, buy = 0},
--[[Poison Dagger]] [2411] = {sell = 25, buy = 0},
--[[queen's sceptre]] [7410] = {sell = 10000, buy = 0},
--[[Royal Helmet]] [2498] = {sell = 15000, buy = 0},
--[[Scimitar]] [2419] = {sell = 75, buy = 0},
--[[Serpent Sword]] [2409] = {sell = 450, buy = 0},
--[[shadow sceptre]] [7451] = {sell = 5000, buy = 0},
--[[Skull Staff]] [2436] = {sell = 3000, buy = 0},
--[[Snakebite Rod]] [2182] = {sell = 50, buy = 0},
--[[Spike sword]] [2383] = {sell = 500, buy = 0},
--[[Spingsprout Rod]] [8912] = {sell = 1800, buy = 0},
--[[Strange Helmet]] [2479] = {sell = 250, buy = 0},
--[[Terra Rod]] [2181] = {sell = 1000, buy = 0},
--[[Thaian Sword]] [7391] = {sell = 8000, buy = 0},
--[[Titan Axe]] [7413] = {sell = 2000, buy = 0},
--[[Tower shield]] [2528] = {sell = 4000, buy = 0},
--[[Underworld Rod]] [8910] = {sell = 2200, buy = 0},
--[[Vampire shield]] [2534] = {sell = 7500, buy = 0},
--[[wand of cosmic energy]] [2189] = {sell = 1000, buy = 0},
--[[Wand of decay]] [2188] = {sell = 500, buy = 0},
--[[Dragonbreath wand]] [2191] = {sell = 1000, buy = 0},
--[[Wand of inferno]] [2187] = {sell = 1500, buy = 0},
--[[wand of starstorm]] [8920] = {sell = 1800, buy = 0},
--[[wand of voodoo]] [8922] = {sell = 2200, buy = 0},
--[[wand of vortex]] [2190] = {sell = 50, buy = 0},
--[[war hammer]] [2391] = {sell = 600, buy = 0},
--[[warrior helmet]] [2475] = {sell = 2500, buy = 0},
--/////////////////////Buy///////////////////////--
--[[ancient shield]] [2532] = {sell = 0, buy = 2500},
--[[bonelord shield]] [2518] = {sell = 0, buy = 3500},
--[[dark armor]] [2489] = {sell = 0, buy = 750},
--[[dark helmet]] [2490] = {sell = 0, buy = 500},
--[[ice rapier]] [2396] = {sell = 0, buy = 2500},
--[[noble armor]] [2486] = {sell = 0, buy = 4000}, 
--[[obsidian lance]] [2425] = {sell = 0, buy = 6000},
--[[serpent sword]] [2409] = {sell = 0, buy = 3000},
--[[spike sword]] [2383] = {sell = 0, buy = 4000},
--[[war hammer]] [2391] = {sell = 0, buy = 5000} 
 }
                 
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
            if t[item] and not doPlayerRemoveMoney(cid, t[item].buy*amount) then
                    npcHandler:say("You don't have enough money.", cid)
            else
                    doPlayerAddItem(cid, item, amount)
                    doPlayerSendTextMessage(cid, 25, "You have bought " .. amount .. "x " .. getItemInfo(item).name  .. " for " .. t[item].buy*amount .. " gold.")
            end
            return true
    end
local onSell = function(cid, item, subType, amount, ignoreCap, inBackpacks)
        doPlayerRemoveItem(cid, item, amount)
		local x = getPlayerStorageValue(cid, storage) == -1 and 0.5 or 1
		doPlayerAddMoney(cid, t[item].sell*amount*x)
		doPlayerSendTextMessage(cid, 25, "You have sold " .. amount .. "x " .. getItemInfo(item).name .. " for " .. t[item].sell*amount*x .. " gold.")
        return true
    end
    if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
            local x = getPlayerStorageValue(cid, storage) == -1 and 0.5 or 1
            for var, ret in pairs(t) do
                    table.insert(shopWindow, {id = var, subType = 0, sell = (ret.sell*x),  buy = ret.buy, name = getItemNameById(var)})
            end
            openShopWindow(cid, shopWindow, onBuy, onSell)
            end
    end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())