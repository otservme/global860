local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:addModule(FocusModule:new())
function onCreatureSay(cid, type, msg)
local jail = {x=33362, y=31208, z=8}
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
	doTeleportThing(cid, jail, TRUE)
	doCreatureSay(cid, 'The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.', TALKTYPE_ORANGE_1)
	doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)
                  		doPlayerRemoveItem(cid, 12245, 1)
end	