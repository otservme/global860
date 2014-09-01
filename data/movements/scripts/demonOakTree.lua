--- Made by Mazen ---
function onStepOut(cid, item, position, fromPosition)
    if item.uid == 32193 then
        doTransformItem(item.uid, 2709)
    end
    return TRUE
end