local messages = {
	"Por favor, reporte bugs e criaturas faltando/npcs/quests no forum de nosso servidor com imagens e descrição.",
	"Somos um dos únicos servidores a oferecer quest log em diversas quests como: poi, inquisition e banshee.",
	"Sistema de task system 100% disponível para você.",
	"Nosso servidor recebe updates diarios, temos uma equipe trabalhando sempre.",
	"Estamos prontos para receber 400+ players.",
	"Vocações e spells balanceadas para uma war agradável.",
	"Por favor, pense duas vezes antes de matar um dog. Eles só querem ser seu amigo!"
}

local i = 0
function onThink(interval, lastExecution)
local message = messages[(i % #messages) + 1]
    doBroadcastMessage("Informação: " .. message .. "", MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
    return TRUE
end