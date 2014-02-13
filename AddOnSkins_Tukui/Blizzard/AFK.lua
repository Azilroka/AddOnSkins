-- Blizzard Unit Functions - OnShow / OnEvent
local UnitLevel, IsInGuild, GetGuildInfo, UnitPVPName, UnitIsAFK = UnitLevel, IsInGuild, GetGuildInfo, UnitPVPName, UnitIsAFK
local GetScreenWidth, GetScreenHeight = GetScreenWidth, GetScreenHeight

-- Blizzard Lua Helpers - OnUpdate
local format, random, date = format, random, date

local AddOnName, NS = ...
if ElvUI then AddOnName = 'ElvUI' end
if Tukui then AddOnName = 'Tukui' end
if DuffedUI then AddOnName = 'DuffedUI' end
if AsphyxiaUI then AddOnName = 'AsphyxiaUI-Core' end

local Name, Level, GuildName
local Class, ClassToken = UnitClass('player')
local Race, RaceToken = UnitRace('player')
local FactionToken, Faction = UnitFactionGroup('player')
local Color = RAID_CLASS_COLORS[ClassToken]
local AddOnVersion = GetAddOnMetadata(AddOnName, 'Version')
local AddOnTitle = select(2, GetAddOnInfo(AddOnName))
local Font = [[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]]
local FontFlag = 'OUTLINE'

local CrestPath = [[Interface\AddOns\Tukui_Skins\Media\Crests\]]

local Tips = {
	'Nearby quest givers that are awaiting your return are shown as a yellow question mark on your mini-map.',
	'Your spell casting can be cancelled by moving, jumping or hitting the escape key.',
	'Clicking on a player name in the chat window lets you send a private message to them.',
	'If you <Shift> Click on a player name in the chat window it tells you additional information about them.',
	'You can <Control> Click on an item to see how you would look wearing that item.',
	'You can <Shift> Click on an item to place an item link into a chat message.',
	'A grey item is an poor quality item and generally can be sold to a vendor.',
	'A white item is useful to players in some way and can be used or sold at the auction house.',
	'If you are lost trying to complete a quest, the quest log will often tell you what to do next.',
	'You can send mail to other players or even to your other characters from any mailbox.',
	'You can remove a friendly spell enhancement on yourself by right-clicking on the spell effect icon.',
	'When you learn a profession or secondary skill the button that allows you to perform that skill is found in the general tab of your spell-book.',
	'All of your action bars can have their hot-keys remapped in the key bindings interface.',
	'If a profession trainer cannot teach you any more, They will generally tell you where to go to get further training.',
	'On your character sheet is a reputation tab that tells you your status with different groups.',
	'You can use the Tab key to select nearby enemies in front of you.',
	'If you are having trouble finding something in a capital city, try asking a guard for directions.',
	'You can perform many fun actions with the emote system, for instance you can type /dance to dance.',
	'A Blizzard employee will NEVER ask for your password.',
	'You can only know two professions at a time, but you can learn all of the secondary skills (archaeology, fishing, cooking and first-aid).',
	'You can right-click on a beneficial spell that has been cast on you to dismiss it.',
	'The interface options menu <Esc> has lots of ways to customize your game play.',
	'You can turn off the slow scrolling of quest text in the interface options menu.',
	'Spend your talent points carefully as once your talents are chosen, you must spend gold to unlearn them.',
	'A mail icon next to the mini-map means you have new mail. Visit a mailbox to retrieve it.',
	'You can add additional action bars to your game interface from the interface options menu.',
	'If you hold down <Shift> while right-clicking on a target to loot, you will automatically loot all items on the target.',
	'Your character can eat and drink at the same time.',
	'If you enjoyed playing with someone, put them on your friends list!',
	'Use the Looking for Group interface (Default "I") to find a group or add more players to your group.',
	'There are a number of different loot options when in a group. The group leader can right-click their own portrait to change the options.',
	'You can choose not to display your helm and/or cloak with an option from the interface options menu.',
	'You can target members of your party with the function keys. F1 targets you; F2 targets the second party member.',
	'Being polite while in a group with others will get you invited back!',
	'Remember to take all things in moderation (even World of Warcraft!)',
	'You can click on a faction in the reputation pane to get additional information and options about that faction.',
	'A monster with a silver dragon around its portrait is a rare monster with better than average treasure.',
	'If you mouse over a chat pane it will become visible and you can right-click on the chat pane tab for options.',
	'Sharing an account with someone else can compromise its security.',
	'You can display the duration of beneficial spells on you from the interface options menu.',
	"You can lock your action bar so you don't accidentally move spells. This is done using the interface options menu.",
	'You can assign a Hot-key to toggle locking/unlocking your action bar. Just look in the Key Bindings options to set it.',
	'You can cast a spell on yourself without deselecting your current target by holding down <Alt> while pressing your hotkey.',
	'Ensure that all party members are on the same stage of an escort quest before beginning it.',
	"You're much less likely to encounter wandering monsters while following a road.",
	'Killing guards gives no Honor Points.',
	'You can hide your interface with <Alt> Z and take screenshots with <Print Screen>.',
	'Typing /macro will bring up the interface to create macros.',
	'Enemy players whose names appear in grey are much lower level than you are and will not give Honor Points when killed.',
	'From the Raid UI you can drag a player to the game field to see their status or drag a class icon to see all members of that class.',
	'A blue question mark above a quest giver means the quest is repeatable.',
	'The assist button (F key) while targeting another player, and it will target the same target as that player.',
	'<Shift> Click on an item being sold by a vendor will let you select how many of that item you wish to purchase.',
	'Playing in a battleground on its holiday weekend increases your Honor Points gained.',
	'If you are having trouble fishing in an area, try attaching a lure to your fishing pole.',
	'You can view messages you previously sent in chat by pressing <Alt> and the up arrow key.',
	'You can <Shift> Click on an item stack to split it into smaller stacks.',
	'Pressing both mouse buttons simultaneously will make your character run.',
	'When replying to a tell from a player (Default "R"), the <Tab> key cycles through people you have recently replied to.',
	'Clicking an item name that appears bracketed in chat will tell you more about the item.',
	"It's considered polite to talk to someone before inviting them into a group, or opening a trade window.",
	'To toggle the display of a health bar over nearby enemies (Default "V").',
	'Your items do not suffer durability damage when you are killed by an enemy player.',
	'<Shift> Click on a quest in your quest log to toggle quest tracking for that quest.',
	'There is no cow level!',
	'The auction houses in each major city are linked together.',
	'Quests completed at maximum level award money instead of experience.',
	'<Shift> B will open all your bags at once.',
	'When interacting with other players a little kindness goes a long way!',
	"Bring your friends to Azeroth, but don't forget to go outside Azeroth with them as well.",
	'If you keep an empty mailbox, the mail icon will let you know when you have new mail waiting!',
	'Never give another player your account information.',
	'When a player not in your group damages a monster before you do, it will display a grey health bar and you will get no loot or experience from killing it.',
	'You can see the spell that your current target is casting by turning on the "Show Enemy Cast Bar" options in the basic interface options.',
	'You can see the target of your current target by turning on the "Show Target of Target" option in the advanced interface options tab.',
	'You can access the map either by clicking the map button in the upper left of the mini-map or by hitting the "M" key.',
	'Many high level dungeons have a heroic mode setting. Heroic mode dungeons are tuned for level 70 players and have improved loot.',
	format('Spend your Honor Points for powerful rewards at the %s', FactionToken == 'Alliance' and "Champion's Hall" or 'Hall of Legends'),
	'The Honor Points you earn each day become available immediately. Check the PvP interface to see how many points you have to spend.',
	'You can turn these tips off in the Interface menu.',
	'Dungeon meeting stones can be used to summon absent party members. It requires two players at the stone to do a summoning.',
	'The Parental Controls section of the Account Management site offers tools to help you manage your play time.',
	'Quest items that are in the bank cannot be used to complete quests.',
	'A quest marked as (Failed) in the quest log can be abandoned and then reacquired from the quest giver.',
	'The number next to the quest name in your log is how many other party members are on that quest.',
	'You cannot advance quests other than (Raid) quests while you are in a raid group.',
	'You cannot cancel your bids in the auction house so bid carefully.',
	'To enter a chat channel, type /join [channel name] and /leave [channel name] to exit.',
	'Mail will be kept for a maximum of 30 days before it disappears.',
	'Once you get a key, they can be found in a special key ring bag that is to the left of your bags.',
	'You can replace a gem that is already socketed into your item by dropping a new gem on top of it in the socketing interface.',
	'City Guards will often give you directions to other locations of note in the city.',
	'You can repurchase items you have recently sold to a vendor from the buyback tab.',
	'A group leader can reset their instances from their portrait right-click menu.',
	'You can always get a new hearthstone from any Innkeeper.',
	'You can open a small map of the current zone either with <Shift> M or as an option from the world map.',
	'Players cannot dodge, parry, or block attacks that come from behind them.',
	'If you Right Click on a name in the combat log a list of options will appear.',
	'You can only have one Battle Elixir and one Guardian Elixir on you at a time.',
	'The calendar can tell you when raids reset.',
	'Creatures cannot make critical hits with spells, but players can.',
	'Creatures can dodge attacks from behind, but players cannot. Neither creatures nor players can parry attacks from behind.',
	'Players with the Inscription profession can make glyphs to improve your favorite spells and abilities.',
	"Don't stand in the fire!",
	'The Raid UI can be customized in a number of different ways, such as how it shows debuffs or current health.',
	'Dungeons are more fun when everyone works together as a team. Be patient with players who are still learning the game.',
}

local UpdateElapsed, TipsElapsed, TipNum, TipThrottle, OldTip = 0, 0, 1, 10, 0

local ScreenSaver = CreateFrame('Frame', 'ScreenSaver', WorldFrame)
ScreenSaver:Hide()
ScreenSaver:SetFrameStrata('FULLSCREEN')
ScreenSaver:RegisterEvent('PLAYER_FLAGS_CHANGED')
ScreenSaver:RegisterEvent('PLAYER_LOGIN')

ScreenSaver.Left = ScreenSaver:CreateTexture(nil, 'ARTWORK')
ScreenSaver.Left:SetTexture(CrestPath..FactionToken)
ScreenSaver.Left:SetPoint('LEFT', WorldFrame, 'LEFT', 0, 0)
ScreenSaver.Left:SetSize(256, 256)

ScreenSaver.Right = ScreenSaver:CreateTexture(nil, 'ARTWORK')
ScreenSaver.Right:SetTexture(CrestPath..RaceToken)
ScreenSaver.Right:SetPoint('RIGHT', WorldFrame, 'RIGHT', 0, 0)
ScreenSaver.Right:SetSize(256, 256)

ScreenSaver.Top = CreateFrame('Frame', nil, ScreenSaver)
ScreenSaver.Top:SetTemplate('Transparent')
ScreenSaver.Top:SetPoint('TOP', WorldFrame, 'TOP', 0, 0)

ScreenSaver.Bottom = CreateFrame('Frame', nil, ScreenSaver)
ScreenSaver.Bottom:SetTemplate('Transparent')
ScreenSaver.Bottom:SetPoint('BOTTOM', WorldFrame, 'BOTTOM', 0, 0)

ScreenSaver.Top.Title = ScreenSaver.Top:CreateFontString(nil, 'OVERLAY')
ScreenSaver.Top.Title:SetPoint('BOTTOM', ScreenSaver.Top, 'CENTER', 0, 0)
ScreenSaver.Top.Title:SetFont(Font, 40, FontFlag)
ScreenSaver.Top.Title:SetText(AddOnTitle)

ScreenSaver.Top.Version = ScreenSaver.Top:CreateFontString(nil, 'OVERLAY')
ScreenSaver.Top.Version:SetPoint('TOP', ScreenSaver.Top.Title, 'BOTTOM', 0, -2)
ScreenSaver.Top.Version:SetFont(Font, 15, FontFlag)
ScreenSaver.Top.Version:SetText(format('%s %s', GAME_VERSION_LABEL, AddOnVersion))

ScreenSaver.Top.Date = ScreenSaver.Top:CreateFontString(nil, 'OVERAY')
ScreenSaver.Top.Date:SetPoint('RIGHT', ScreenSaver.Top, 'RIGHT', -20, 0)
ScreenSaver.Top.Date:SetFont(Font, 15, FontFlag)

ScreenSaver.Top.Time = ScreenSaver.Top:CreateFontString(nil, 'OVERLAY')
ScreenSaver.Top.Time:SetPoint('TOP', ScreenSaver.Top.Date, 'BOTTOM', 0, -2)
ScreenSaver.Top.Time:SetFont(Font, 20, FontFlag)

ScreenSaver.Top.PlayerName = ScreenSaver.Top:CreateFontString(nil, 'OVERLAY')
ScreenSaver.Top.PlayerName:SetPoint('LEFT', ScreenSaver.Top, 'LEFT', 20, 0)
ScreenSaver.Top.PlayerName:SetFont(Font, 30, FontFlag)

ScreenSaver.Top.Guild = ScreenSaver.Top:CreateFontString(nil, 'OVERLAY')
ScreenSaver.Top.Guild:SetPoint('TOP', ScreenSaver.Top.PlayerName, 'BOTTOM', 0, -2)
ScreenSaver.Top.Guild:SetFont(Font, 15, FontFlag)

ScreenSaver.Top.PlayerInfo = ScreenSaver.Top:CreateFontString(nil, 'OVERLAY')
ScreenSaver.Top.PlayerInfo:SetPoint('TOP', ScreenSaver.Top.Guild, 'BOTTOM', 0, -2)
ScreenSaver.Top.PlayerInfo:SetFont(Font, 15, FontFlag)

ScreenSaver.ScrollFrame = CreateFrame('ScrollingMessageFrame', nil, ScreenSaver)
ScreenSaver.ScrollFrame:SetFont(Font, 20, FontFlag)
ScreenSaver.ScrollFrame:SetShadowColor(0, 0, 0, 0)
ScreenSaver.ScrollFrame:SetFading(false)
ScreenSaver.ScrollFrame:SetFadeDuration(0)
ScreenSaver.ScrollFrame:SetTimeVisible(1)
ScreenSaver.ScrollFrame:SetMaxLines(1)
ScreenSaver.ScrollFrame:SetSpacing(2)

ScreenSaver:SetScript('OnShow', function(self)
	Level, Name, GuildName, TipNum = UnitLevel('player'), UnitPVPName('player'), IsInGuild() and GetGuildInfo('player') or '', random(1, #Tips)
	local Width, Height = (GetScreenWidth() * GetCVar('uiScale')) + 2, (GetScreenHeight() * GetCVar('uiScale')) / 5
	self.Top.PlayerName:SetText(format('|c%s%s|r', Color.colorStr, Name))
	self.Top.Guild:SetText(format('|cff00AAFF%s|r', GuildName))
	self.Top.PlayerInfo:SetText(format('%s %s %s %s', LEVEL, Level, Faction, Class))
	self.Top:SetSize(Width, Height)
	self.Bottom:SetSize(Width, Height)
	self.ScrollFrame:SetSize(Width, 24)
	self.ScrollFrame:SetPoint('CENTER', self.Bottom, 'CENTER', 0, 0)
	self.ScrollFrame:AddMessage(Tips[TipNum], 1, 1, 1)
end)

ScreenSaver:SetScript('OnUpdate', function(self, elapsed)
	UpdateElapsed = UpdateElapsed + elapsed
	TipsElapsed = TipsElapsed + elapsed
	if UpdateElapsed > 0.5 then
		self.Top.Time:SetText(format('%s', date('%I|cff00AAFF:|r%M|cff00AAFF:|r%S %p')))
		self.Top.Date:SetText(format('%s', date('|cff00AAFF%A|r %B %d')))
		UpdateElapsed = 0
	end
	if TipsElapsed > TipThrottle then
		TipNum = random(1, #Tips)
		if TipNum == OldTip then TipNum = random(1, #Tips) end
		self.ScrollFrame:AddMessage(Tips[TipNum], 1, 1, 1) 
		OldTip = TipNum
		TipsElapsed = 0
	end
end)

ScreenSaver:SetScript('OnEvent', function(self, event, unit)
	if UnitIsAFK('player') then
		self:Show()
		UIFrameFadeIn(Minimap, .5, 1, 0)
		UIFrameFadeIn(UIParent, .5, 1, 0)
	else
		if self:IsShown() then
			self:Hide()
			UIFrameFadeIn(UIParent, .5, 0, 1)
			UIFrameFadeIn(Minimap, .5, 0, 1)
		end
	end
end)