function onSay(cid, words, param, channel)	
	local calosc = "Quest log to tasks by Seminari(The_Hide)(Iranimes)"
	for k,v in pairs(KITNO_Paw_and_Fur_tasks_tbl) do
		if k then
		task_name = k
		task_storage = v.task_started_stg
		counter_storage = v.task_counter_stg
		required_kills = v.task_required_kills
		if v.boss then
			boss_name = v.bossek_tbl.boss_name
		else 
			boss_name = 0
		end
		first_line = '<mission name="Paw and Fur - '.. task_name ..'" storageid="'.. task_storage ..'" startvalue="1" endvalue="2">'
		second_line = '\t <missionstate id="0" description="You already hunted |STORAGE:'.. counter_storage ..'|/'.. required_kills ..' '.. task_name ..'."/>'
		third_line = '\t <missionstate id="1" description="Report back to Grizzly Adams."/>'
		if boss_name ~= nil and boss_name ~= 0 then
			fourth_line = '\t <missionstate id="2" description="Find and kill '.. boss_name ..'"/>'
			fifth_line = '\t <missionstate id="3" description="Report back your task to Grizzly Adams."/>'
		end
		last_line = '</mission>'
		if fourth_line ~= nil and fifth_line ~= nil then
			calosc = ''.. first_line ..'\n'.. second_line ..'\n'.. third_line ..'\n'.. fourth_line ..'\n'.. fifth_line ..'\n'.. last_line ..'\n'
		else
			calosc = ''.. first_line ..'\n'.. second_line ..'\n'.. third_line ..'\n'.. last_line ..'\n'
		end
		f = assert(io.open("./data/logs/quests.txt", "a+"))
		f = io.open("./data/logs/quests.txt", "a+")
		f:write("\n"..calosc .."")
		f:close()
		end
	end
	return true
end