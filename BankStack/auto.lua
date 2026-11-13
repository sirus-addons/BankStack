local core = BankStack
local L = core.L
local module = core:NewModule("Auto", "AceEvent-3.0")
local Debug = core.Debug

local db
function module:OnInitialize()
	self.db = core.db_object:RegisterNamespace("Auto", {
		profile = {
			bank_opened = "none",
			afk = "none",
		},
	})
	db = self.db
	if core.options then
		core.options.plugins.auto = {
			auto = {
				type = "group",
				name = L["Auto"],
				inline = true,
				get = function(info) return db.profile[info[#info]] end,
				set = function(info, value) db.profile[info[#info]] = value end,
				args = {
					bank_opened = {
						type = "select",
						name = L["Bank opened"],
						values = {
							none = L["Nothing"],
							sort_bags = L["Sort Bags"],
							sort_bank = L["Sort Bank"],
							sort_both = L["Sort Bags and Bank"],
							stack_to_bank = L["Stack to Bank"],
							stack_to_bags = L["Stack to Bags"],
							compress_bags = L["Compress Bags"],
							compress_bank = L["Compress Bank"],
							compress_both = L["Compress Bags and Bank"],
						},
					},
					afk = {
						type = "select",
						name = L["Going AFK"],
						values = {
							none = L["Nothing"],
							sort_bags = L["Sort Bags"],
							compress_bags = L["Compress Bags"],
						},
					},
				},
			},
		}
	end

	self:RegisterEvent("BANKFRAME_OPENED")
	-- self:RegisterEvent("GUILDBANKFRAME_OPENED", "BANKFRAME_OPENED")
	self:RegisterEvent("PLAYER_FLAGS_CHANGED")
end

local actions = {
	sort_bags = function() core.SortBags("bags") end,
	sort_bank = function() core.SortBags("bank") end,
	sort_both = function() core.SortBags("bank bags") end,
	stack_to_bank = function() core.BankStack("bags bank") end,
	stack_to_bags = function() core.BankStack("bank bags") end,
	compress_bags = function() core.Compress("bags") end,
	compress_bank = function() core.Compress("bank") end,
	compress_both = function() core.Compress("bags bank") end,
}

function module:BANKFRAME_OPENED()
	if not actions[db.profile.bank_opened] then return end
	actions[db.profile.bank_opened]()
end

function module:PLAYER_FLAGS_CHANGED(event, unit)
	if unit ~= "player" then return end
	if not UnitIsAFK("player") then return end
	if not actions[db.profile.afk] then return end
	actions[db.profile.afk]()
end
