local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6.3, 8.4, 32, 48)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
