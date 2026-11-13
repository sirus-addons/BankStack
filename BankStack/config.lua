local core = BankStack
local L = core.L

local announce = core.announce

local sorted_bag_groups = {}
local function print_groups(groups)
	for group in pairs(groups) do
		table.insert(sorted_bag_groups, group)
	end
	table.sort(sorted_bag_groups)
	for _,group in ipairs(sorted_bag_groups) do
		announce(0, "-"..group..": "..string.join(", ", unpack(groups[group])), 1, 1, 1)
	end
	wipe(sorted_bag_groups)
end

local options = {
	name = L["Config"], desc = L["Basic settings"], type = "group", order = 10,
	get = function(info) return core.db[info[#info]] end,
	set = function(info, value) core.db[info[#info]] = value end,
	args = {
		verbosity = {
			name = L["Verbosity"], desc = L["Talkativitinessism"], type = "range", min = 0, max = 2, step = 1,
			descStyle = "inline",
		},
		junk = {
			name = L["Junk"], desc = L["Move junk to the end"], type = "toggle",
			descStyle = "inline",
		},
		soul = {
			name = L["Soul"], desc = L["Move soul shards to the end"], type = "toggle",
			descStyle = "inline",
		},
		conjured = {
			name = L["Conjured"], desc = L["Move conjured items to the end"], type = "toggle",
			descStyle = "inline",
		},
		soulbound = {
			name = L["Soulbound"], desc = L["Move soulbound items to the front"], type = "toggle",
			descStyle = "inline",
		},
		reverse = {
			name = L["Reverse"], desc = L["Reverse the sort"], type = "toggle",
			descStyle = "inline",
		},
		--[[conservative_guild = {
			name = "Cautious guild",
			desc = "If this option is enabled, only one move at a time will be made. This is slower, but is certain to work.",
			descStyle = "inline",
			type = "toggle",
		},--]]
	},
	plugins = {},
}
core.options = options

local ignore_options = {
	name = L["Ignore"], desc = L["Slots to ignore"], type = "group", order = 20,
	args = {
		list = {
			name = L["List"], desc = L["List all ignored slots"], type = "execute", order = 1,
			func = function()
				for ignored,_ in pairs(core.db.ignore) do
					local bag, slot = core.decode_bagslot(ignored)
					core.announce(0, string.format(L.ignoring, bag, slot), 1, 1, 1)
				end
			end,
		},
		add = {
			name = L["Add"], desc = L["Add an ignore"], type = "input", order = 2,
			get = false,
			set = function(info, v)
				local bag, slot = string.match(v, "^([-%d]+) (%d+)$")
				if bag and slot then
					local bagslot = core.encode_bagslot(tonumber(bag), tonumber(slot))
					core.db.ignore[bagslot] = true
					core.announce(0, string.format(L.ignored, bag, slot), 1, 1, 1)
				end
			end,
			usage = L["[bag] [slot] (see http://wowwiki.com/BagID)"],
			validate = function(info, v)
				-- "and true or false" because returning a string counts as false
				return string.match(v, "^[-%d]+ %d+$") and true or false
			end,
		},
		remove = {
			name = L["Remove"], desc = L["Remove an ignore"], type = "input", order = 3,
			get = false,
			set = function(info, v)
				local bag, slot = string.match(v, "^([-%d]+) (%d+)$")
				if bag and slot then
					local bagslot = core.encode_bagslot(tonumber(bag), tonumber(slot))
					core.db.ignore[bagslot] = nil
					announce(0, string.format(L.unignored, bag, slot), 1, 1, 1)
				end
			end,
			usage = L["[bag] [slot] (see http://wowwiki.com/BagID)"],
		},
	},
}
local group_options = {
	name = L["Groups"], desc = L["Bag groups"], type = "group", order = 30,
	args = {
		list = {
			name = L["List"], desc = L["List all groups"], type = "execute", order = 1,
			func = function()
				announce(0, L.builtin_groups, 1, 1, 1)
				print_groups(core.groups)
				announce(0, L.custom_groups, 1, 1, 1)
				print_groups(core.db.groups)
			end,
		},
		add = {
			name = L["Add"], desc = L["Add a group (see http://wowwiki.com/BagID)"], type = "input", order = 2,
			get = false,
			set = function(info, v)
				local group, action = string.match(v, "^([^%s]+) (.*)$")
				if not core.db.groups[group] then
					core.db.groups[group] = {}
				end
				local bags = wipe(core.db.groups[group])
				-- Populate with the new group:
				for v in string.gmatch(action, "[^%s,]+") do
					local bag = tonumber(v)
					if core.is_valid_bag(bag) or core.is_guild_bank_bag(bag) then
						table.insert(bags, bag)
					else
						announce(0, string.format(L.invalid_bag, v), 1, 0, 0)
					end
				end
				announce(0, string.format(L.group_added, group, string.join(", ", unpack(bags))), 1, 1, 1)
			end,
			usage = L["[name] [bagid],[bagid],[bagid]"],
			validate = function(_, v) return string.match(v, "^[^%s]+ [%d%s,]+$") and true or false end,
		},
		remove = {
			name = L["Remove"], desc = L["Remove a group"], type = "input", order = 3,
			get = false,
			set = function(info, v)
				core.db.groups[v] = nil
				announce(0, string.format(L.group_removed, v), 1, 1, 1)
			end,
			usage = L["[name]"],
		}
	},
}

local help_options = {
	name = L["BankStack Help"], type="group",
	args = {
		header = { name = L["BankStack: Things in your bags, they move"], type = "header", order = 10, },
		commands = {
			type = "description", order = 20,
			name = L["/bankstack -- this menu."].."\n"..
				L["/sort -- rearrange your bags"].."\n"..
				L["/sort bank -- rearrange your bank"].."\n"..
				L["/sort reagent -- rearrange your reagent bank"].."\n"..
				L["/stack -- fills stacks in your bank from your bags"].."\n"..
				L["/stack bank bags -- fills stacks in your bags from your bank"].."\n"..
				L["/compress -- merges stacks in your bags"].."\n"..
				L["/compress bank -- merges stacks in your bank"].."\n"..
				L["/fill -- fills empty slots in your bank from your bags"],
		},
	},
}

local keybindings = {
	['BUTTON1'] = L["Left Click"],
	['ALT-BUTTON1'] = L["Alt Left Click"],
	['CTRL-BUTTON1'] = L["Ctrl Left Click"],
	['ALT-CTRL-BUTTON1'] = L["Ctrl Alt Left Click"],
	['SHIFT-BUTTON1'] = L["Shift Left Click"],
	['ALT-SHIFT-BUTTON1'] = L["Alt Shift Left Click"],
	['CTRL-SHIFT-BUTTON1'] = L["Ctrl Shift Left Click"],
	['ALT-CTRL-SHIFT-BUTTON1'] = L["Ctrl Alt Shift Left Click"],
}

local launcher_options = {
	name = L["Click assignments"], desc = L["Modified left-clicks only"],
	type = "group",
	get = function(info)
		local k = info[#info]
		for b, a in pairs(core.db.fubar_keybinds) do
			if a == k then
				return b
			end
		end
	end,
	set = function(info, v)
		-- clear current binding
		local k = info[#info]
		for b, a in pairs(core.db.fubar_keybinds) do
			if a == k then
				core.db.fubar_keybinds[b] = false
			end
		end
		-- set new binding
		if keybindings[v] then
			core.db.fubar_keybinds[v] = k
		end
	end,
	args = {
		help = {
			type = "description", order = 1,
			name = L.launcher_help,
		},
		
		sortbags = {name = L["Sort Bags"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 10,},
		sortbank = {name = L["Sort Bank"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 20,},
		sortreagent = {name = L["Sort Reagent Bank"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 25,},
		stackbank = {name = L["Stack to Bank"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 30,},
		stackbags = {name = L["Stack to Bags"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 40,},
		compressbags = {name = L["Compress Bags"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 50,},
		compressbank = {name = L["Compress Bank"], desc = L["Modified left-clicks only"], type = "select", values = keybindings, order = 60,},
	},
}

core.setup_config = function()
	local acreg = LibStub("AceConfigRegistry-3.0")
	acreg:RegisterOptionsTable("BankStack", options)
	acreg:RegisterOptionsTable("BankStack Profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(core.db_object))
	acreg:RegisterOptionsTable("BankStack Help", help_options)
	acreg:RegisterOptionsTable("BankStack Launcher", launcher_options)
	acreg:RegisterOptionsTable("BankStack Groups", group_options)
	acreg:RegisterOptionsTable("BankStack Ignore", ignore_options)

	local acdia = LibStub("AceConfigDialog-3.0")
	acdia:AddToBlizOptions("BankStack", "BankStack")
	acdia:AddToBlizOptions("BankStack Ignore", L["Ignore"], "BankStack")
	acdia:AddToBlizOptions("BankStack Groups", L["Groups"], "BankStack")
	acdia:AddToBlizOptions("BankStack Launcher", L["Launcher"], "BankStack")
	acdia:AddToBlizOptions("BankStack Profiles", L["Profiles"], "BankStack")
	acdia:AddToBlizOptions("BankStack Help", L["Help"], "BankStack")
end

SLASH_BANKSTACKCONFIG1 = "/bankstack"
SlashCmdList["BANKSTACKCONFIG"] = function(arg)
	-- I'm not sure why the doubled-"BankStack" is necessary here...
	InterfaceOptionsFrame_OpenToCategory(LibStub("AceConfigDialog-3.0").BlizOptions.BankStack.BankStack.frame)
	--LibStub("AceConfigDialog-3.0"):Open("BankStack")
end

