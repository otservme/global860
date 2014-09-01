local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED) 
local condition = createConditionObject(CONDITION_PARALYZE) 
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000) 
setConditionFormula(condition, -1, 40, -1, 40) 
setCombatCondition(combat, condition) 
function onCastSpell(cid, var) 
local paradelay = getConfigInfo('paralyzeDelay') 
    if isPlayer(variantToNumber(var)) == TRUE then 
        return doCombat(cid, combat, var), exhaustion.set(variantToNumber(var), 30030, paradelay/1000), doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) 
    else 
        return doCombat(cid, combat, var), doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) 
    end 
end  
