local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onGetPlayerMinMaxValues(cid, level, skill, attack, factor)
	local min = skill * 0.7 + level / 5 + 0
	local max = skill * 0.7  + level / 5 + 5
	return -min, -max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetPlayerMinMaxValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end