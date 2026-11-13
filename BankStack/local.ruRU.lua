-- BankStack Locale
-- Please use the Localization App on WoWAce to Update this
-- http://www.wowace.com/projects/bank-stack/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("BankStack", "ruRU")
if not L then return end

-- Messages:
L['already_running'] = "BankStack: перемещение предметов уже выполняется."
L['at_bank'] = "BankStack: вы должны быть в банке."
L['complete'] = "BankStack: завершено."
L['confused'] = "BankStack: непредвиденная ситуация. Остановка."
L['moving'] = "BankStack: перемещение %s."
L['opt_set'] = "BankStack: %s установлено в %s."
L['options'] = "BankStack опции:"
L['perfect'] = "BankStack: уже всё в идеальном порядке."
L['to_move'] = "BankStack: предстоит перемещений: %d."
L['aborted'] = "BankStack: прервано."
L['ignoring'] = "Игнорируется: сумка %d, ячейка %d"
L['ignored'] = "Теперь игнорируется: сумка %s, ячейка %s."
L['unignored'] = "Больше не игнорируется: сумка %s, ячейка %s."
L['builtin_groups'] = "Встроенные группы:"
L['custom_groups'] = "Пользовательские группы:"
L['invalid_bag'] = "%s: неверный номер сумки."
L['group_added'] = "Группа добавлена: %s (%s)"
L['group_removed'] = "Группа удалена: %s."
L['launcher_help'] = "BankStack содержит значок запуска LibDataBroker-1.1, который могут показывать аддоны-панели (StatBlockCore, Fortress, ButtonBin, Broker2FuBar и другие). С его помощью можно быстро сортировать сумки."

-- Item types and subtypes:
L['ARMOR'] = "Доспехи"
L['BAG'] = "Сумка"
L['CONSUMABLE'] = "Потребляемые"
L['CONTAINER'] = "Сумки"
L['GEM'] = "Самоцветы"
L['KEY'] = "Ключ"
L['MISC'] = "Разное"
L['PROJECTILE'] = "Боеприпасы"
L['REAGENT'] = "Реагент"
L['RECIPE'] = "Рецепты"
L['QUEST'] = "Задания"
L['QUIVER'] = "Амуниция"
L['TRADEGOODS'] = "Ремесла"
L['WEAPON'] = "Оружие"

--Bindings:
L['BINDING_HEADER_BANKSTACK_HEAD'] = "BankStack"
L['BINDING_NAME_BANKSTACK'] = "Пополнить связки в банке"
L['BINDING_NAME_COMPRESS'] = "Сжать сумки"
L['BINDING_NAME_BAGSORT'] = "Отсортировать сумки"

-- Settings pages:
L['Config'] = "Настройки"
L['Basic settings'] = "Основные настройки"
L['Ignore'] = "Игнорирование"
L['Slots to ignore'] = "Игнорируемые ячейки"
L['Groups'] = "Группы"
L['Bag groups'] = "Группы сумок"
L['Launcher'] = "Значок"
L['Click assignments'] = "Назначение кликов"
L['Modified left-clicks only'] = "Только левый клик с модификаторами"
L['Profiles'] = "Профили"
L['Help'] = "Помощь"

-- Options:
L['Verbosity'] = "Подробность сообщений"
L['Talkativitinessism'] = "Разговорчивость"
L['Junk'] = "Хлам"
L['Move junk to the end'] = "Переместить хлам в конец"
L['Soul'] = "Осколки души"
L['Move soul shards to the end'] = "Переместить осколки души в конец"
L['Conjured'] = "Сотворенные"
L['Move conjured items to the end'] = "Переместить сотворенные предметы в конец"
L['Soulbound'] = "Персональные"
L['Move soulbound items to the front'] = "Переместить персональные предметы в начало"
L['Reverse'] = "Обратный порядок"
L['Reverse the sort'] = "Сортировать в обратном порядке"
L['Show minimap icon'] = "Показывать значок на мини-карте"
L['Toggle showing or hiding the minimap icon.'] = "Показать или скрыть значок на мини-карте."

-- Auto:
L['Auto'] = "Автоматически"
L['Bank opened'] = "При открытии банка"
L['Going AFK'] = "При статусе «Отсутствует»"
L['Nothing'] = "Ничего"

-- Actions:
L['Sort Bags'] = "Сортировать сумки"
L['Sort Bank'] = "Сортировать банк"
L['Sort Reagent Bank'] = "Сортировать банк материалов"
L['Sort Bags and Bank'] = "Сортировать сумки и банк"
L['Stack to Bank'] = "Пополнить связки в банке"
L['Stack to Bags'] = "Пополнить связки в сумках"
L['Compress Bags'] = "Сжать сумки"
L['Compress Bank'] = "Сжать банк"
L['Compress Bags and Bank'] = "Сжать сумки и банк"

-- Click assignments:
L['Left Click'] = "Левый клик"
L['Alt Left Click'] = "Alt + левый клик"
L['Ctrl Left Click'] = "Ctrl + левый клик"
L['Ctrl Alt Left Click'] = "Ctrl + Alt + левый клик"
L['Shift Left Click'] = "Shift + левый клик"
L['Alt Shift Left Click'] = "Alt + Shift + левый клик"
L['Ctrl Shift Left Click'] = "Ctrl + Shift + левый клик"
L['Ctrl Alt Shift Left Click'] = "Ctrl + Alt + Shift + левый клик"

-- Minimap icon tooltip:
L['Stack from bank to bags'] = "Пополнить связки в сумках из банка"
L['Stack from bags to bank'] = "Пополнить связки в банке из сумок"
L['Compress stacks in bags'] = "Сжать связки в сумках"
L['Compress stacks in bank'] = "Сжать связки в банке"
L['Click'] = "Клик"
L['None'] = "Нет"
L['Click while stacking'] = "Клик во время работы"
L['Abort'] = "Прервать"

-- Ignore and Groups pages:
L['List all ignored slots'] = "Показать все игнорируемые ячейки"
L['Add'] = "Добавить"
L['Add an ignore'] = "Добавить игнорируемую ячейку"
L['Remove'] = "Удалить"
L['Remove an ignore'] = "Убрать ячейку из игнорируемых"
L['[bag] [slot] (see http://wowwiki.com/BagID)'] = "[сумка] [ячейка] (см. http://wowwiki.com/BagID)"
L['List'] = "Список"
L['List all groups'] = "Показать все группы"
L['Add a group (see http://wowwiki.com/BagID)'] = "Добавить группу (см. http://wowwiki.com/BagID)"
L['[name] [bagid],[bagid],[bagid]'] = "[название] [номер сумки],[номер сумки],[номер сумки]"
L['Remove a group'] = "Удалить группу"
L['[name]'] = "[название]"

-- Help page:
L['BankStack Help'] = "BankStack: справка"
L['BankStack: Things in your bags, they move'] = "BankStack: предметы в сумках приходят в движение"
L['/bankstack -- this menu.'] = "/bankstack -- это меню."
L['/sort -- rearrange your bags'] = "/sort -- упорядочить сумки"
L['/sort bank -- rearrange your bank'] = "/sort bank -- упорядочить банк"
L['/sort reagent -- rearrange your reagent bank'] = "/sort reagent -- упорядочить банк материалов"
L['/stack -- fills stacks in your bank from your bags'] = "/stack -- пополнить связки в банке предметами из сумок"
L['/stack bank bags -- fills stacks in your bags from your bank'] = "/stack bank bags -- пополнить связки в сумках предметами из банка"
L['/compress -- merges stacks in your bags'] = "/compress -- объединить связки в сумках"
L['/compress bank -- merges stacks in your bank'] = "/compress bank -- объединить связки в банке"
L['/fill -- fills empty slots in your bank from your bags'] = "/fill -- заполнить пустые ячейки в банке предметами из сумок"
