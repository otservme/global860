local yalahar = {x=32780, y=31168, z=14, stackpos=253} 
function onStepIn(cid, item, pos)
if isPlayer(cid) == TRUE then
if (item.actionid == 4036) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Yalahar.")
doPlayerSetTown(cid,13)

elseif (item.actionid == 4037) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Carlin.")
doPlayerSetTown(cid,4)

elseif (item.actionid == 4038) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Ab'Dendriel.")
doPlayerSetTown(cid,5)

elseif (item.actionid == 4039) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Kazordoon.")
doPlayerSetTown(cid,3)

elseif (item.actionid == 4040) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Thais.")
doPlayerSetTown(cid,2)

elseif (item.actionid == 4041) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Venore.")
doPlayerSetTown(cid,1)

elseif (item.actionid == 4042) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Darashia.")
doPlayerSetTown(cid,10)

elseif (item.actionid == 4043) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Ankrahmun.")
doPlayerSetTown(cid,9)

elseif (item.actionid == 4044) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Edron.")
doPlayerSetTown(cid,11)

elseif (item.actionid == 4045) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Port Hope.")
doPlayerSetTown(cid,8)

elseif (item.actionid == 4046) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Liberty Bay.")
doPlayerSetTown(cid,7)

elseif (item.actionid == 1007) then
doPlayerSendTextMessage(cid,24,"Você completou a SEAL YALAHAR QUEST.")
doTeleportThing(cid, yalahar, TRUE) 

elseif (item.actionid == 4048) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Farmine.")
doPlayerSetTown(cid,14)

elseif (item.actionid == 4049) then
doPlayerSendTextMessage(cid,24,"Now you are citizen of Gray Island.")
doPlayerSetTown(cid,14)
end
end
end