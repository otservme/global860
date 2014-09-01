local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition, 0.8, -72, 0.8, -72)
setCombatCondition(combat, condition)

local disable = createConditionObject(CONDITION_PACIFIED)
setConditionParam(disable, CONDITION_PARAM_TICKS, 10000)
setCombatCondition(combat, disable)

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_SUBID, 1)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 10000)
setCombatCondition(combat, exhaust)

function onCastSpell(cid, var)
    if isPlayer(cid) == TRUE then
        if exhaustion.check(cid, 30030) then
            return FALSE
        else
            return doRemoveCondition(cid, CONDITION_HASTE), doCombat(cid, combat, var)
        end
    else
        return doRemoveCondition(cid, CONDITION_HASTE), doCombat(cid, combat, var)
    end
end  
