local ovens = {1786,1787,1788,1789,1790,1791,1792,1793,9911,9912}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(ovens, itemEx.itemid) == TRUE then   
				setPlayerStorageValue(cid, 100032, 1)
				doPlayerRemoveItem(cid, 9733, 1)
				doSendMagicEffect(toPosition,15)  
          end  
          return true
end  