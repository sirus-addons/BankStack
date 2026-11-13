local core = BankStack
local L = core.L
local module = core:NewModule("LDB")
local icon = LibStub("LibDBIcon-1.0", true)

local click_actions = {
	sortbags = core.SortBags,
	sortbank = function() core.SortBags('bank') end,
	sortreagent = function() core.SortBags('reagent') end,
	stackbags = function() core.BankStack('bank bags') end,
	stackbank = core.BankStack,
	compressbags = core.Compress,
	compressbank = function() core.Compress('bank') end,
}
local name_map = {
	sortbags = L["Sort Bags"],
	sortbank = L["Sort Bank"],
	sortreagent = L["Sort Reagent Bank"],
	stackbags = L["Stack from bank to bags"],
	stackbank = L["Stack from bags to bank"],
	compressbags = L["Compress stacks in bags"],
	compressbank = L["Compress stacks in bank"],
}
local binding_order = {
	'sortbags', 'sortbank', 'sortreagent', 'stackbags', 'stackbank', 'compressbags', 'compressbank',
	--'BUTTON1', 'ALT-BUTTON1', 'CTRL-BUTTON1', 'ALT-CTRL-BUTTON1', 'SHIFT-BUTTON1',
	--'ALT-SHIFT-BUTTON1', 'CTRL-SHIFT-BUTTON1', 'ALT-CTRL-SHIFT-BUTTON1',
}

local function get_binding_for_action(action)
	for binding, act in pairs(core.db.fubar_keybinds) do
		if action == act then
			return binding
		end
	end
end

local function build_current_keybind()
	-- Note that this does hardcode BUTTON1, because I'm lazy
	return (IsAltKeyDown() and 'ALT-' or '') ..
		(IsControlKeyDown() and 'CTRL-' or '') ..
		(IsShiftKeyDown() and 'SHIFT-' or '') ..
		'BUTTON1'
end
local function pretty_keybind(keybind)
	-- Again, assumes left mouse button
	return keybind and ((string.match(keybind, "ALT-") and "Alt-" or '') ..
		(string.match(keybind, "CTRL-") and "Ctrl-" or '') ..
		(string.match(keybind, "SHIFT-") and "Shift-" or '') ..
		L["Click"]) or L["None"]
end

local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataobject = ldb:GetDataObjectByName("BankStack") or ldb:NewDataObject("BankStack", {
	type = "launcher",
	label = "BankStack",
	icon = [[Interface\Icons\INV_Misc_Shovel_01]],
})
dataobject.OnClick = function(frame, button)
	if button == "RightButton" then
		-- open up the config
		return InterfaceOptionsFrame_OpenToCategory(LibStub("AceConfigDialog-3.0").BlizOptions.BankStack.BankStack.frame)
	end
	if #(core.moves) > 0 then 
		return core.StopStacking(L.aborted)
	end
	--Build the keybind that triggered this.  There might be a better way to do this.
	local keybind = build_current_keybind()
	local action = core.db.fubar_keybinds[keybind]
	if keybind and click_actions[action] then
		click_actions[action]()
	end
end
dataobject.OnTooltipShow = function(tooltip)
	tooltip:AddLine("BankStack")
	for _, action in ipairs(binding_order) do
		tooltip:AddDoubleLine(pretty_keybind(get_binding_for_action(action)), name_map[action], 0, 1, 0, 1, 1, 1)
	end
	tooltip:AddDoubleLine(L["Click while stacking"], L["Abort"], 1, 0, 0, 1, 0, 0)
end


local db
function module:OnInitialize()
	self.db = core.db_object:RegisterNamespace("LDB", {
		profile = {
			minimap = {},
		},
	})
	db = self.db
	if icon then
		icon:Register("BankStack", dataobject, self.db.profile.minimap)
	end
	if core.options then
		core.options.plugins.ldb = {
			minimap = {
				type = "toggle",
				name = L["Show minimap icon"],
				desc = L["Toggle showing or hiding the minimap icon."],
				get = function() return not db.profile.minimap.hide end,
				set = function(info, v)
					local hide = not v
					db.profile.minimap.hide = hide
					if hide then
						icon:Hide("BankStack")
					else
						icon:Show("BankStack")
					end
				end,
				order = 30,
				width = "full",
				hidden = function() return not icon or not dataobject or not icon:IsRegistered("BankStack") end,
			},
		}
	end
end

core.dataobject = dataobject