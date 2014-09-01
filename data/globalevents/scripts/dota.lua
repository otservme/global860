local config = {
    semana_mes = "semana",
    days = {2,3,5},
	tempo = 300,
	p = {{x=32011,y=32271,z=7},
		{x=32011,y=32272,z=7},
		{x=32011,y=32273,z=7},
		{x=32011,y=32274,z=7},
		{x=32011,y=32275,z=7},
		{x=32095,y=32271,z=7},
		{x=32095,y=32272,z=7},
		{x=32095,y=32272,z=7},
		{x=32095,y=32272,z=7},
		{x=32095,y=32272,z=7}
	},
	idpedra=1304,
	p2 = {{x=32023,y=32271,z=7},
		{x=32023,y=32272,z=7},
		{x=32023,y=32273,z=7},
		{x=32023,y=32274,z=7},
		{x=32023,y=32275,z=7},
		{x=32035,y=32271,z=7},
		{x=32035,y=32272,z=7},
		{x=32035,y=32273,z=7},
		{x=32035,y=32274,z=7},
		{x=32035,y=32275,z=7},
		{x=32048,y=32274,z=7},
		{x=32050,y=32273,z=7},
		{x=32058,y=32271,z=7},
		{x=32056,y=32273,z=7}
	},
	idpedra2=1353,
	p3 = {{x=32071,y=32271,z=7},
		 {x=32071,y=32272,z=7},
		 {x=32071,y=32273,z=7},
	     {x=32071,y=32274,z=7},
	     {x=32071,y=32275,z=7},
         {x=32083,y=32271,z=7},
		{x=32083,y=32272,z=7},
		{x=32083,y=32273,z=7},
		{x=32083,y=32274,z=7},
		{x=32083,y=32275,z=7}
	},
	idpedra3=1354,
	m={{"Gerador Azul I",{x=32017,y=32273,z=7}},
		{"Gerador Vermelho I",{x=32089,y=32273,z=7}}
		},
	nkpos = {{x=1,y=1,z=7},
		{x=1,y=1,z=7},
		{x=1,y=1,z=7},
		{x=1,y=1,z=7},
		{x=1,y=1,z=7},
		{x=1,y=1,z=7}

}} --em segundos

function onTime()
    local time = os.date("*t")
    if (config.semana_mes == "semana" and isInArray(config.days,time.wday)) or (config.semana_mes == "mes" and isInArray(config.daystime.day)) or config.semana_mes == "" then
	for _,k in pairs(config.nkpos) do
		if isMonster(getTopCreature(k).uid) then
			doRemoveCreature(getTopCreature(k).uid)
		end
	end
	for _,k in pairs(config.p) do
		 doRemoveItem(getTileItemById(k,config.idpedra).uid,1)
	end
	for _,k in pairs(config.p2) do
		doRemoveItem(getTileItemById(k,config.idpedra2).uid,1)
	end
	for _,k in pairs(config.p3) do
		doRemoveItem(getTileItemById(k,config.idpedra3).uid,1)
	end

	for _,k in pairs(config.p) do
		doCreateItem(config.idpedra,k)
	end
	for _,k in pairs(config.p2) do
		doCreateItem(config.idpedra2,k)
	end
	for _,k in pairs(config.p3) do
		doCreateItem(config.idpedra3,k)
	end
	for _,o in pairs(config.m) do
		doSummonCreature(o[1],o[2])
	end
	    local mensage1 = "[Evento Dota] Liberada Sala dos Times! Quem quiser Participar, vá para a sala de times até o Evento começar. Depois que começar, sÓ na outra rodada! Gogo (TELEPORTE PARA O DOTA NO TEMPLO DA CIDADE PRINCIPAL)" -- Mensagem Inicial
		gatepos = {x=32087, y=32245, z=7, stackpos=1} -- Posição da Pedra
		getgate = getThingfromPos(gatepos)
		if getgate.itemid == 1304 then
			broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE)
			doRemoveItem(getgate.uid,1)
		end
		addEvent(startDota,config.tempo*1000,nil)
    end
    return true
end

function startDota()
	local mensage1 = "[Evento Dota] Evento Iniciado! Destruam as Torres! quem destruir as 3 Torres primeiro, Ganha!" -- Mensagem Inicial
	local monster1 = "Gerador Azul I" -- Geradores Iniciais
	local monster2 = "Gerador Vermelho I" -- Geradores Iniciais

	gatepos = {x=32011, y=32011, z=7, stackpos=1} -- Posição da Pedras 1
	getgate = getThingfromPos(gatepos)

	gatepos11 = {x=32011, y=32012, z=7, stackpos=1} -- Posição da Pedras 11
	getgate11 = getThingfromPos(gatepos11)

	gatepos12 = {x=32011, y=32013, z=7, stackpos=1} -- Posição da Pedras 12
	getgate12 = getThingfromPos(gatepos12)

	gatepos13 = {x=32011, y=32014, z=7, stackpos=1} -- Posição da Pedras 13
	getgate13 = getThingfromPos(gatepos13)

	gatepos14 = {x=32011, y=32015, z=7, stackpos=1} -- Posição da Pedras 14
	getgate14 = getThingfromPos(gatepos14)


	gatepos2 = {x=32095, y=32271, z=7, stackpos=1} -- Posição da Pedra 2
	getgate2 = getThingfromPos(gatepos2)

	gatepos21 = {x=32095, y=32272, z=7, stackpos=1} -- Posição da Pedra 21
	getgate21 = getThingfromPos(gatepos21)

	gatepos22 = {x=32095, y=32273, z=7, stackpos=1} -- Posição da Pedra 22
	getgate22 = getThingfromPos(gatepos22)

	gatepos23 = {x=32095, y=32274, z=7, stackpos=1} -- Posição da Pedra 23
	getgate23 = getThingfromPos(gatepos23)

	gatepos24 = {x=32095, y=32275, z=7, stackpos=1} -- Posição da Pedra 24
	getgate24 = getThingfromPos(gatepos24)

	if getgate.itemid == 1304 and getgate2.itemid == 1304 then
		broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE)

		doRemoveItem(getgate.uid,1)
		doRemoveItem(getgate11.uid,1)
		doRemoveItem(getgate12.uid,1)
		doRemoveItem(getgate13.uid,1)
		doRemoveItem(getgate14.uid,1)
		doRemoveItem(getgate2.uid,1)
		doRemoveItem(getgate21.uid,1)
		doRemoveItem(getgate22.uid,1)
		doRemoveItem(getgate23.uid,1)
		doRemoveItem(getgate24.uid,1)
		doCreateItem(1304, {x=32087, y=32245, z=7})
	end
end