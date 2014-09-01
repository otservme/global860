-- by Shoeei for OTServ Brásil Fórums --
function onAdvance(cid, skill, oldlevel, newlevel)
if skill == SKILL__LEVEL then
local maxh = getCreatureMaxHealth(cid)
local maxm = getCreatureMaxMana(cid)
doCreatureAddHealth(cid, maxh)
doCreatureAddMana(cid, maxm)
end
return true
end