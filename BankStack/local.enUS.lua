-- BankStack Locale
-- Please use the Localization App on WoWAce to Update this
-- http://www.wowace.com/projects/bank-stack/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("BankStack", "enUS", true)
if not L then return end

-- Messages:
L['already_running'] = "BankStack: A stacker is already running."
L['at_bank'] = "BankStack: You must be at the bank."
L['complete'] = "BankStack: Complete."
L['confused'] = "BankStack: Confusion. Stopping."
L['moving'] = "BankStack: Moving %s."
L['opt_set'] = "BankStack: %s set to %s."
L['options'] = "BankStack options:"
L['perfect'] = "BankStack: Perfection already exists."
L['to_move'] = "BankStack: %d moves to make."
L['aborted'] = "BankStack: Aborted."
L['ignoring'] = "Ignoring: %d %d"
L['ignored'] = "%s %s ignored."
L['unignored'] = "%s %s no longer ignored."
L['builtin_groups'] = "Built in groups:"
L['custom_groups'] = "Custom groups:"
L['invalid_bag'] = "%s was not a valid bag id."
L['group_added'] = "Added group: %s (%s)"
L['group_removed'] = "%s removed."
L['launcher_help'] = "BankStack contains a LibDataBroker-1.1 launcher, which can be shown by display addons such as StatBlockCore, Fortress, ButtonBin, Broker2FuBar, and others, which can be used as a quick way to sort your bags."

-- Item types and subtypes:
L['ARMOR'] = "Armor"
L['BAG'] = "Bag"
L['CONSUMABLE'] = "Consumable"
L['CONTAINER'] = "Container"
L['GEM'] = "Gem"
L['KEY'] = "Key"
L['MISC'] = "Miscellaneous"
L['PROJECTILE'] = "Projectile"
L['REAGENT'] = "Reagent"
L['RECIPE'] = "Recipe"
L['QUEST'] = "Quest"
L['QUIVER'] = "Quiver"
L['TRADEGOODS'] = "Trade Goods"
L['WEAPON'] = "Weapon"

--Bindings:
L['BINDING_HEADER_BANKSTACK_HEAD'] = "BankStack"
L['BINDING_NAME_BANKSTACK'] = "Stack to bank"
L['BINDING_NAME_COMPRESS'] = "Compress bags"
L['BINDING_NAME_BAGSORT'] = "Sorts bags"

-- Settings pages:
L['Config'] = true
L['Basic settings'] = true
L['Ignore'] = true
L['Slots to ignore'] = true
L['Groups'] = true
L['Bag groups'] = true
L['Launcher'] = true
L['Click assignments'] = true
L['Modified left-clicks only'] = true
L['Profiles'] = true
L['Help'] = true

-- Options:
L['Verbosity'] = true
L['Talkativitinessism'] = true
L['Junk'] = true
L['Move junk to the end'] = true
L['Soul'] = true
L['Move soul shards to the end'] = true
L['Conjured'] = true
L['Move conjured items to the end'] = true
L['Soulbound'] = true
L['Move soulbound items to the front'] = true
L['Reverse'] = true
L['Reverse the sort'] = true
L['Show minimap icon'] = true
L['Toggle showing or hiding the minimap icon.'] = true

-- Auto:
L['Auto'] = true
L['Bank opened'] = true
L['Going AFK'] = true
L['Nothing'] = true

-- Actions:
L['Sort Bags'] = true
L['Sort Bank'] = true
L['Sort Reagent Bank'] = true
L['Sort Bags and Bank'] = true
L['Stack to Bank'] = true
L['Stack to Bags'] = true
L['Compress Bags'] = true
L['Compress Bank'] = true
L['Compress Bags and Bank'] = true

-- Click assignments:
L['Left Click'] = true
L['Alt Left Click'] = true
L['Ctrl Left Click'] = true
L['Ctrl Alt Left Click'] = true
L['Shift Left Click'] = true
L['Alt Shift Left Click'] = true
L['Ctrl Shift Left Click'] = true
L['Ctrl Alt Shift Left Click'] = true

-- Minimap icon tooltip:
L['Stack from bank to bags'] = true
L['Stack from bags to bank'] = true
L['Compress stacks in bags'] = true
L['Compress stacks in bank'] = true
L['Click'] = true
L['None'] = true
L['Click while stacking'] = true
L['Abort'] = true

-- Ignore and Groups pages:
L['List all ignored slots'] = true
L['Add'] = true
L['Add an ignore'] = true
L['Remove'] = true
L['Remove an ignore'] = true
L['[bag] [slot] (see http://wowwiki.com/BagID)'] = true
L['List'] = true
L['List all groups'] = true
L['Add a group (see http://wowwiki.com/BagID)'] = true
L['[name] [bagid],[bagid],[bagid]'] = true
L['Remove a group'] = true
L['[name]'] = true

-- Help page:
L['BankStack Help'] = true
L['BankStack: Things in your bags, they move'] = true
L['/bankstack -- this menu.'] = true
L['/sort -- rearrange your bags'] = true
L['/sort bank -- rearrange your bank'] = true
L['/sort reagent -- rearrange your reagent bank'] = true
L['/stack -- fills stacks in your bank from your bags'] = true
L['/stack bank bags -- fills stacks in your bags from your bank'] = true
L['/compress -- merges stacks in your bags'] = true
L['/compress bank -- merges stacks in your bank'] = true
L['/fill -- fills empty slots in your bank from your bags'] = true
