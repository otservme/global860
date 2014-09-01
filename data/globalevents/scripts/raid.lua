--[[
- hour should be exact SERVER hour
- to do the raid at clock 00 minutes 00
- to do the raid at exaxt date use type "exact"
- to do the raid weekly use type "weekly"
- days names are used only for weekly type and should be 
- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"
- also should be inside a array -> {}
]]

local raids =
	{
		[1] = 
			{
				name = 'Morgaroth',
				type = 'weekly',
				days = {'friday'},
				hour = 18,
				minu = 00
			},
		[2] = 
			{
				name = 'Zulazza the Corruptor',
				type = 'weekly',
				days = {'tuesday'},
				hour = 20,
				minu = 00
			},
		[3] = 
			{
				name = 'RatsThais',
				type = 'weekly',
				days = {'monday'},
				hour = 8,
				minu = 00
			},
		[4] = 
			{
				name = 'OrcsThais',
				type = 'weekly',
				days = {'wednesday'},
				hour = 12,
				minu = 00
			},
		[5] = 
			{
				name = 'Barbarian',
				type = 'weekly',
				days = {'thursday'},
				hour = 10,
				minu = 00
			},
		[6] = 
			{
				name = 'Demodras',
				type = 'weekly',
				days = {'sunday'},
				hour = 15,
				minu = 00
			},
		[7] = 
			{
				name = 'Elfos',
				type = 'weekly',
				days = {'tuesday'},
				hour = 10,
				minu = 00
			},
		[8] = 
			{
				name = 'Ferumbras',
				type = 'weekly',
				days = {'saturday'},
				hour = 22,
				minu = 00
			},
		[9] = 
			{
				name = 'Ghazbaran',
				type = 'weekly',
				days = {'monday'},
				hour = 16,
				minu = 00
			},
		[10] = 
			{
				name = 'Horned Fox',
				type = 'weekly',
				days = {'sunday'},
				hour = 8,
				minu = 00
			},
		[11] = 
			{
				name = 'Necropharus',
				type = 'weekly',
				days = {'thursday'},
				hour = 20,
				minu = 00
			},
		[12] = 
			{
				name = 'Nomads',
				type = 'weekly',
				days = {'wednesday'},
				hour = 8,
				minu = 00
			},
		[13] = 
			{
				name = 'Orshabaal',
				type = 'weekly',
				days = {'sunday'},
				hour = 18,
				minu = 00
			},
		[14] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'saturday'},
				hour = 6,
				minu = 00
			},
		[15] = 
			{
				name = 'Quaras',
				type = 'weekly',
				days = {'friday'},
				hour = 4,
				minu = 00
			},
		[16] = 
			{
				name = 'Scarabs',
				type = 'weekly',
				days = {'tuesday'},
				hour = 5,
				minu = 00
			},
		[17] = 
			{
				name = 'Old Widow',
				type = 'weekly',
				days = {'wednesday'},
				hour = 19,
				minu = 00
			},
		[18] = 
			{
				name = 'Undead Army',
				type = 'weekly',
				days = {'thursday'},
				hour = 20,
				minu = 00
			},
		[19] = 
			{
				name = 'Undead Darashia',
				type = 'weekly',
				days = {'friday'},
				hour = 12,
				minu = 00
			},
		[20] = 
			{
				name = 'Sir Valorcrest',
				type = 'weekly',
				days = {'monday'},
				hour = 11,
				minu = 00
			},
		[21] = 
			{
				name = 'Zevelong Duskbringer',
				type = 'weekly',
				days = {'tuesday'},
				hour = 3,
				minu = 00
			},
		[22] = 
			{
				name = 'Diblis The Fair',
				type = 'weekly',
				days = {'saturday'},
				hour = 12,
				minu = 00
			},
		[23] = 
			{
				name = 'Arachir the Ancient One',
				type = 'weekly',
				days = {'monday'},
				hour = 15,
				minu = 00
			},
		[24] = 
			{
				name = 'Halloween Hare',
				type = 'exact',
				date = {day = 31, month = 10},
				hour = 16,
				minu = 00
			}	
	}
	
local last_execsutes = {}

function onThink(interval, lastExecution, thinkInterval)
	local static_time = os.time()
	for k, raid in ipairs(raids) do
		if (raid.type == 'weekly') then
			local day = os.date("%A", static_time):lower()
			if isInArray(raid.days, day) then
				local hour = tonumber(os.date("%H", static_time))
				if (raid.hour == hour) then
					local minute = tonumber(os.date("%M", static_time))
					if (raid.minu == minute) then
						local day_number = tonumber(os.date("%d", static_time))
						if (last_execsutes[k] ~= day_number) then
							last_execsutes[k] = day_number
							doExecuteRaid(raid.name)
						end
					end
				end
			end
		elseif (raid.type == 'exact') then
			local month = tonumber(os.date("%m", static_time))
			if (raid.date.month == month) then
				local day = tonumber(os.date("%d", static_time))
				if (raid.date.day == day) then
					local hour = tonumber(os.date("%H", static_time))
					if (raid.hour == hour) then
						local minute = tonumber(os.date("%M", static_time))
						if (raid.minu == minute) then
							if (last_execsutes[k] ~= day) then
								last_execsutes[k] = day
								doExecuteRaid(raid.name)
							end
						end
					end
				end
			end
		end
	end
	return true
end