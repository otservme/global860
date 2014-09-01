local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH) 
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false) 
 
function onCastSpell(cid, var) 
 local fromPosition = {x = 32617, y = 31364, z = 7} -- top left cornor of the playground
 local toPosition = {x = 32643, y = 31364, z = 7	} -- bottom right cornor of the playground
  if isInArea(getThingPosition(cid), fromPosition, toPosition) then
          return false, doPlayerSendCancel(cid, "You're not allowed to use any rune here.")
 end

        return doCombat(cid, combat, var) 
end