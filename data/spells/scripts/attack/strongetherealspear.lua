local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 100) / 1) * 2 + (level / 2)), -((skill + 100) + (level / 5 * 2))
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	local storage = 23018
	local spellname = "Strong Ethereal Spear"
	local time = 15

        if exhaustion.check(cid, storage) == false then
                exhaustion.set(cid, storage, time)
                return doCombat(cid, combat, var) and doCombat(cid, combat, var)
        else
                doPlayerSendCancel(cid, "")
        end
end