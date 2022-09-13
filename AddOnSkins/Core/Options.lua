local AS, ASL = unpack(_G.AddOnSkins)

local wipe = wipe
local tinsert = tinsert
local sort = sort
local pairs = pairs
local strfind = strfind
local strlower = strlower
local strtrim = strtrim
local unpack = unpack

local GetAddOnMetadata = GetAddOnMetadata
local GENERAL = GENERAL
local hooksecurefunc = hooksecurefunc
local tContains = tContains
local CopyTable = CopyTable

local ACH = AS.Libs.ACH

local DEVELOPERS = { 'AcidWeb', 'Affli', 'Aldarana', 'Arstraea', 'Blazeflack', 'Brian Thurlow', 'Cadayron', 'Camealion', 'Catok', 'CJO', 'Darth Predator', 'Dec', 'Drii', 'Edoc', 'efaref', 'Elv', 'Jasje', 'Jason Longwell', 'Jens Jacobsen', 'Kemat1an', 'Kkthnx', 'Konungr', 'Lockslap', 'Ludius', 'luminnas', 'lolarennt', 'MaXiMiUS', 'Merathilis', 'Merith', 'MrRuben5', 'Outofammo', 'Pat', 'Pezzer13', 'Paul', 'Rakkhin', 'Repooc', 'Roktaal', 'Shestak', 'Shadowcall', 'Sinaris', 'Simpy', 'Tercioo', 'Torch', 'Tukz', 'Warmexx', 'Vito Sansevero' }

sort(DEVELOPERS, function(a, b) return strlower(a) < strlower(b) end)
local DEVELOPER_STRING = table.concat(DEVELOPERS, '|n')

local DefaultTemplates = { ClassColor = ASL['Class Color'], Custom = ASL['Custom'], Default = ASL['Default'], Transparent = ASL['Transparent'] }
local Embeds = { NONE = 'None', Details = 'Details', Omen = 'Omen', Skada = 'Skada', Recount = 'Recount', TinyDPS = 'TinyDPS' }
local BlizzardSkins = {}

local BlizzardNames = {
	Blizzard_AbilityButton = 'Ability Button',
	Blizzard_AchievementUI = 'Achievement',
	Blizzard_AddonManager = 'AddOn Manager',
	Blizzard_AdventureMap = 'Adventure Map',
	Blizzard_Alerts = 'Alerts',
	Blizzard_AlliedRacesUI = 'Allied Races',
	Blizzard_ArchaeologyUI = 'Archaeology',
	Blizzard_ArtifactUI = 'Artifact',
	Blizzard_AuctionUI = 'Auction',
	Blizzard_AzeriteRespecUI = 'Azerite Respec',
	Blizzard_AzeriteUI = 'Azerite',
	Blizzard_Bags = 'Bags',
	Blizzard_BarbershopUI = 'Barbershop',
	Blizzard_BattlefieldMap = 'Battlefield Map',
	Blizzard_BindingUI = 'Keybindings',
	Blizzard_BlackMarketUI = 'Black Market',
	Blizzard_Calendar = 'Calendar',
	Blizzard_ChallengesUI = 'Challenges',
	Blizzard_Channels = 'Channels',
	Blizzard_Character = 'Character',
	Blizzard_ChatBubbles = 'Chat Bubbles',
	Blizzard_Collections = 'Collections',
	Blizzard_Communities = 'Communities',
	Blizzard_Contribution = 'Contribution',
	Blizzard_DeathRecap = 'Death Recap',
	Blizzard_DebugTools = 'Debug Tools',
	Blizzard_DressUpFrame = 'DressUp Frame',
	Blizzard_EncounterJournal = 'Encounter Journal',
	Blizzard_ExtraActionButton = 'Extra Action Button',
	Blizzard_FlightMap = 'Flight Map',
	Blizzard_Friends = 'Friends',
	Blizzard_GarrisonUI = 'Garrison',
	Blizzard_GuildBankUI = 'Guild Bank',
	Blizzard_GuildControlUI = 'Guild Control',
	Blizzard_GuildUI = 'Guild',
	Blizzard_InspectUI = 'Inspect',
	Blizzard_IslandsPartyPoseUI = 'Islands Party Pose',
	Blizzard_IslandsQueueUI = 'Islands Queue',
	Blizzard_ItemSocketingUI = 'Item Socketing',
	Blizzard_ItemUpgradeUI = 'Item Upgrade',
	Blizzard_LookingForGuildUI = 'Looking For Guild',
	Blizzard_LootFrames = 'Loot Frames',
	Blizzard_MacroUI = 'Macro',
	Blizzard_Mail = 'Mail',
	Blizzard_Merchant = 'Merchant',
	Blizzard_Options = 'Options',
	Blizzard_StackSplit = 'Stack Split',
	Blizzard_ObliterumUI = 'Obliterum',
	Blizzard_OrderHallUI = 'Order Hall',
	Blizzard_PartyPoseUI = 'Party Pose',
	Blizzard_PetStable = 'Pet Stable',
	Blizzard_PVPUI = 'PvP',
	Blizzard_PvE = 'PvE',
	Blizzard_RaidUI = 'Raid',
	Blizzard_ScrappingMachineUI = 'Scrapping Machine',
	Blizzard_Spellbook = 'Spellbook',
	Blizzard_SocialUI = 'Social',
	Blizzard_TalentUI = 'Talents',
	Blizzard_TalkingHeadUI = 'Talking Head',
	Blizzard_Taxi = 'Taxi',
	Blizzard_Gossip = 'Gossip',
	Blizzard_Quest = 'Quest',
	Blizzard_TimeManager = 'TIme Manager',
	Blizzard_TradeSkillUI = 'Trade Skill',
	Blizzard_TradeWindow = 'Trade Window',
	Blizzard_TrainerUI = 'Trainer',
	Blizzard_UIWidgets = 'UI Widgets',
	Blizzard_VoidStorageUI = 'Void Storage',
	Blizzard_WarboardUI = 'Warboard',
	Blizzard_WarfrontsPartyPoseUI = 'Warfronts Party Pose',
	Blizzard_WorldMap = 'World Map',
	Blizzard_WorldStateScore = 'World State Score',
}

AS.Options = ACH:Group(AS.Title, nil, 6, 'tab')
AS.Options.args.general = ACH:Group(GENERAL, nil, 0, nil, function(info) return AS:CheckOption(info[#info]) end, function(info, value) AS:SetOption(info[#info], value) AS:UpdateSettings() AS.NeedReload = true end)
AS.Options.args.general.args.general = ACH:Group(' ', nil, 1)
AS.Options.args.general.args.general.inline = true
AS.Options.args.general.args.general.args.LoginMsg = ACH:Toggle(ASL['Login Message'], nil, 1)
AS.Options.args.general.args.general.args.SkinDebug = ACH:Toggle(ASL['Enable Skin Debugging'], nil, 2)

AS.Options.args.general.args.Theme = ACH:Select(ASL['Themes'], nil, 2, { PixelPerfect = ASL['Thin Border'], TwoPixel = ASL['Two Pixel'], ThickBorder = ASL['Thick Border'] })
AS.Options.args.general.args.SkinTemplate = ACH:Select(ASL['Template'], nil, 3, function() local tbl = CopyTable(DefaultTemplates) if AS:CheckOption('ElvUIStyle', 'ElvUI') then tbl.Custom = nil end return tbl end)

AS.Options.args.general.args.Textures = ACH:Group(ASL['Textures'], nil, 4)
AS.Options.args.general.args.Textures.inline = true
AS.Options.args.general.args.Textures.args.BackgroundTexture = ACH:SharedMediaStatusbar('Background Texture', nil, 1, nil, nil, nil, nil, function() return AS:CheckOption('ElvUIStyle', 'ElvUI') end)
AS.Options.args.general.args.Textures.args.StatusBarTexture = ACH:SharedMediaStatusbar('StatusBar Texture', nil, 2, nil, nil, nil, nil, function() return AS:CheckOption('ElvUIStyle', 'ElvUI') end)
AS.Options.args.general.args.Textures.args.CropIcons = ACH:Toggle(ASL['Crop Icons'], nil, 3)
AS.Options.args.general.args.Textures.args.Parchment = ACH:Toggle(ASL['Parchment']..' (WIP)', nil, 3)
AS.Options.args.general.args.Textures.args.Shadows = ACH:Toggle(ASL['Shadows'], nil, 4)
AS.Options.args.general.args.Textures.args.DBMSkinHalf = ACH:Toggle(ASL['DBM Half-bar Skin'], nil, 5)

AS.Options.args.general.args.Colors = ACH:Group(ASL['Colors'], nil, 5, nil, function(info) return unpack(AS:CheckOption(info[#info])) end, function(info, r, g, b, a) AS:SetOption(info[#info], { r, g, b, a }) AS:UpdateSettings() end)
AS.Options.args.general.args.Colors.inline = true
AS.Options.args.general.args.Colors.args.CustomBackdropColor = ACH:Color('Backdrop Color', nil, 1, true, nil, nil, nil, nil, function() return (AS:CheckOption('SkinTemplate') ~= 'Custom') or AS:CheckOption('ElvUIStyle', 'ElvUI') end)
AS.Options.args.general.args.Colors.args.CustomBorderColor = ACH:Color('Border Color', nil, 2, true, nil, nil, nil, nil, function() return (AS:CheckOption('SkinTemplate') ~= 'Custom') or AS:CheckOption('ElvUIStyle', 'ElvUI') end)
AS.Options.args.general.args.Colors.args.HighlightColor = ACH:Color(ASL['Highlight'], nil, 3)
AS.Options.args.general.args.Colors.args.SelectedColor = ACH:Color(ASL['Selected / Checked'], nil, 4)
AS.Options.args.general.args.Colors.args.StatusBarColor = ACH:Color(ASL['Status Bars'], nil, 5)

AS.Options.args.skins = ACH:Group(ASL['Skins'], nil, 1, nil, function(info) return AS:CheckOption(info[#info]) end, function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end)
AS.Options.args.skins.args.addons = ACH:MultiSelect(ASL['AddOns'], nil, 1, nil, nil, nil, function(_, key) return AS:CheckOption(key) end, function(_, key, value) AS:SetOption(key, value) AS.NeedReload = true end)
AS.Options.args.skins.args.blizzard = ACH:MultiSelect(ASL['Blizzard'], nil, 2, nil, nil, nil, function(_, key) return AS:CheckOption(key) end, function(_, key, value) AS:SetOption(key, value) AS.NeedReload = true end)
AS.Options.args.skins.args.blizzardEnableAll = ACH:Execute(ASL['Blizzard: Enable All'], nil, 3, function() for SkinName in pairs(BlizzardSkins) do AS:SetOption(SkinName, true) end end)
AS.Options.args.skins.args.blizzardDisableAll = ACH:Execute(ASL['Blizzard: Disable All'], nil, 4, function() for SkinName in pairs(BlizzardSkins) do AS:SetOption(SkinName, false) end end)

AS.Options.args.embed = ACH:Group(ASL['Embed Settings'], nil, 4, nil, function(info) return AS:CheckOption(info[#info]) end, function(info, value) AS:SetOption(info[#info], value) AS:Embed_Check() end)
AS.Options.args.embed.args.EmbedIsHidden = ACH:Toggle(ASL['|cFFFF0000Embed is currently HIDDEN|r'], nil, 0, nil, nil, 'full', nil, nil, nil, function() return not AS:CheckOption('EmbedIsHidden') end)

AS.Options.args.embed.args.General = ACH:Group(ASL['General'], nil, 1)
AS.Options.args.embed.args.General.inline = true
AS.Options.args.embed.args.General.args.EmbedSystemMessage = ACH:Toggle(ASL['Embed System Message'], nil, 1)
AS.Options.args.embed.args.General.args.EmbedRightChat = ACH:Toggle(ASL['Embed into Right Chat Panel'], nil, 2)
AS.Options.args.embed.args.General.args.HideChatFrame = ACH:Select(ASL['Hide Chat Frame'], nil, 3, function() return AS:GetChatWindowInfo() end, nil, nil, nil, nil, function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end)
AS.Options.args.embed.args.General.args.EmbedBelowTop = ACH:Toggle(ASL['Embed Below Top Tab'], nil, 4)
AS.Options.args.embed.args.General.args.EmbedBackdrop = ACH:Toggle(ASL['Backdrop'], nil, 5)
AS.Options.args.embed.args.General.args.EmbedBackdropTransparent = ACH:Toggle(ASL['Transparent Backdrop'], nil, 6)

AS.Options.args.embed.args.SingleEmbedSystem = ACH:Group(ASL['One Window Embed System'], nil, 4)
AS.Options.args.embed.args.SingleEmbedSystem.inline = true
AS.Options.args.embed.args.SingleEmbedSystem.args.EmbedSystem = ACH:Toggle(ASL['Enable'], nil, 9, nil, nil, nil, nil, nil, function() return AS:CheckOption('EmbedSystemDual') end)
AS.Options.args.embed.args.SingleEmbedSystem.args.EmbedMain = ACH:Select(ASL['Embed'], nil, 10, Embeds, nil, nil, nil, nil, function() return not AS:CheckOption('EmbedSystem') end)

AS.Options.args.embed.args.DualEmbedSystem = ACH:Group(ASL['Two Window Embed System'], nil, 5)
AS.Options.args.embed.args.DualEmbedSystem.inline = true
AS.Options.args.embed.args.DualEmbedSystem.args.EmbedSystemDual = ACH:Toggle(ASL['Enable'], nil, 1, nil, nil, nil, nil, nil, function() return AS:CheckOption('EmbedSystem') end)
AS.Options.args.embed.args.DualEmbedSystem.args.EmbedLeft = ACH:Select(ASL["Window One Embed"], nil, 2, Embeds, nil, nil, nil, nil, function() return not AS:CheckOption('EmbedSystemDual') end)
AS.Options.args.embed.args.DualEmbedSystem.args.EmbedLeftWidth = ACH:Range(ASL['Window One Width'], nil, 3, { min = 100, max = 300, step = 1 }, nil, nil, nil, function() return not AS:CheckOption('EmbedSystemDual') end)
AS.Options.args.embed.args.DualEmbedSystem.args.EmbedRight = ACH:Select(ASL["Window Two Embed"], nil, 4, Embeds, nil, nil, nil, nil, function() return not AS:CheckOption('EmbedSystemDual') end)

AS.Options.args.embed.args.OoC = ACH:Group(ASL['Out of Combat'], nil, 6)
AS.Options.args.embed.args.OoC.inline = true
AS.Options.args.embed.args.OoC.args.EmbedOoC = ACH:Toggle(ASL['Hide'], nil, 1)
AS.Options.args.embed.args.OoC.args.EmbedOoCDelay = ACH:Range(ASL['Hide Delay'], nil, 2, { min = 1, max = 30, step = 1 })

AS.Options.args.embed.args.strataLevel = ACH:Group(ASL['Strata and Frame Level'], nil, 7)
AS.Options.args.embed.args.strataLevel.inline = true
AS.Options.args.embed.args.strataLevel.args.EmbedFrameStrata = ACH:Select(ASL['Embed Frame Strata'], nil, 1, { ['1-BACKGROUND'] = 'BACKGROUND', ['2-LOW'] = 'LOW', ['3-MEDIUM'] = 'MEDIUM', ['4-HIGH'] = 'HIGH' }, nil, nil, nil, nil, function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end)
AS.Options.args.embed.args.strataLevel.args.EmbedFrameLevel = ACH:Range(ASL['Embed Frame Level'], nil, 2, { min = 1, max = 255, step = 1 }, nil, nil, nil, function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end)

AS.Options.args.about = ACH:Group(ASL['About/Help'], nil, -2, 'tab')

AS.Options.args.about.args.links = ACH:Group(ASL['Links'], nil, 1)
AS.Options.args.about.args.links.inline = true
AS.Options.args.about.args.links.args.tukuilink = ACH:Input(ASL['Download Link'], nil, 1, nil, 'full', function() return 'https://www.tukui.org/addons.php?id=3' end)
AS.Options.args.about.args.links.args.gitlablink = ACH:Input(ASL['GitLab Link / Report Errors'], nil, 2, nil, 'full', function() return 'https://github.com/Azilroka/AddOnSkins' end)

AS.Options.args.about.args.credits = ACH:Group(ASL['Credits'], nil, -1)
AS.Options.args.about.args.credits.inline = true
AS.Options.args.about.args.credits.args.AuthorHeader = ACH:Header('Authors:', 0)
AS.Options.args.about.args.credits.args.Authors = ACH:Description(AS.Authors, 1, 'large')
AS.Options.args.about.args.credits.args.CreditsHeader = ACH:Header('Credits:', 2)
AS.Options.args.about.args.credits.args.Credits = ACH:Description(DEVELOPER_STRING, 3, 'medium')

function AS:BuildProfile()
	local Embed = AS:CheckAddOn('Details') and 'Details' or AS:CheckAddOn('Skada') and 'Skada' or AS:CheckAddOn('Recount') and 'Recount' or ''

	local Defaults = {
		profile = {
		-- Embeds
			EmbedBackdrop = true,
			EmbedBackdropTransparent = true,
			EmbedBelowTop = false,
			EmbedFrameLevel = 10,
			EmbedFrameStrata = '2-LOW',
			EmbedIsHidden = false,
			EmbedLeftWidth = 200,
			EmbedOoC = false,
			EmbedOoCDelay = 10,
			EmbedRightChat = true,
			EmbedSystem = false,
			EmbedSystemDual = false,
			EmbedLeft = Embed,
			EmbedRight = Embed,
			EmbedMain = Embed,
		-- Misc
			BackgroundTexture = 'Blizzard Raid Bar',
			ClassColor = false,
			CropIcons = true,
			CustomBackdropColor = { .5, .5, .5, .8 },
			CustomBorderColor = { 0, 0, 0 },
			DBMFont = 'Arial Narrow',
			DBMFontFlag = 'OUTLINE',
			DBMFontSize = 12,
			DBMRadarTrans = false,
			DBMSkinHalf = false,
			ElvUIStyle = AS:CheckAddOn('ElvUI') and true or false,
			EmbedSystemMessage = true,
			HideChatFrame = 'NONE',
			HighlightColor = { 1, .8, .1 },
			LoginMsg = false,
			Parchment = false,
			SelectedColor = { 0, 0.44, .87 },
			Shadows = true,
			SkinDebug = false,
			SkinTemplate = 'Transparent',
			StatusBarColor = { .01, .39, .1 },
			StatusBarTexture = 'Blizzard Raid Bar',
			Theme = 'PixelPerfect',
		},
	}

	for _, tbl in pairs({ 'preload', 'register'}) do
		for skin in pairs(AS[tbl]) do
			if AS:CheckAddOn('ElvUI') and strfind(skin, 'Blizzard_') then
				Defaults.profile[skin] = false
			else
				Defaults.profile[skin] = true
			end
		end
	end

	AS.data = AS.Libs.ADB:New('AddOnSkinsDB', Defaults, true)

	AS.data.RegisterCallback(AS, 'OnProfileChanged', 'SetupProfile')
	AS.data.RegisterCallback(AS, 'OnProfileCopied', 'SetupProfile')
	AS.db = AS.data.profile
end

function AS:SetupProfile()
	AS.db = AS.data.profile
end

function AS:BuildOptions()
	local skins = {}

	for skinName in pairs(AS.register) do
		tinsert(skins, skinName)
	end

	for skinName, data in pairs(AS.preload) do
		if not data.addon or data.addon and not tContains(skins, data.addon) then
			tinsert(skins, skinName)
		end
	end

	for _, skinName in pairs(skins) do
		if strfind(skinName, 'Blizzard_') then
			BlizzardSkins[skinName] = true
			AS.Options.args.skins.args.blizzard.values[skinName] = strfind(skinName, 'Blizzard_') and (BlizzardNames[skinName] or strtrim(skinName:gsub('^Blizzard_(.+)','%1'):gsub('(%l)(%u%l)','%1 %2')))
		else
			AS.Options.args.skins.args.addons.values[skinName] = GetAddOnMetadata(skinName, 'Title') or strtrim(skinName:gsub('(%l)(%u%l)','%1 %2'))
		end
	end

	wipe(skins)

	if AS:CheckAddOn('ElvUI') then
		AS.Options.args.general.args.Textures.args.ElvUIStyle = ACH:Toggle(ASL['ElvUI Style'], nil, 0)

		if AS:CheckAddOn('ElvUI_MerathilisUI') then
			DefaultTemplates['MerathilisUI'] = '|cffff7d0aMerathilisUI|r'
		end
	end

	if not AS:CheckAddOn('ElvUI') then
		AS.Libs.AC:RegisterOptionsTable('AddOnSkins', AS.Options)
		AS.Libs.ACD:AddToBlizOptions('AddOnSkins', 'AddOnSkins')
	end
end

function AS:GetOptions()
	AS.Options.args.profiles = _G.LibStub('AceDBOptions-3.0'):GetOptionsTable(AS.data)
	AS.Options.args.profiles.order = -2

	if AS:CheckAddOn('ElvUI') then
		_G.ElvUI[1].Options.args.addonskins = AS.Options
		hooksecurefunc(_G.LibStub('AceConfigDialog-3.0-ElvUI'), 'CloseAll', function()
			if AS.NeedReload then
				_G.ElvUI[1]:StaticPopup_Show("PRIVATE_RL")
			end
		end)
	end
end
