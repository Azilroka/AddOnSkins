local AS, ASL = unpack(AddOnSkins)

local sort, pairs, gsub, strfind, strlower, strtrim, tostring, unpack = sort, pairs, gsub, strfind, strlower, strtrim, tostring, unpack
local tinsert = table.insert

local GetAddOnMetadata = GetAddOnMetadata
local GENERAL = GENERAL
local hooksecurefunc = hooksecurefunc

local DEVELOPER_STRING = ''

local DEVELOPERS = {
	'AcidWeb', 'Affli', 'Aldarana', 'Arstraea',
	'Blazeflack', 'Brian Thurlow',
	'Cadayron','Camealion', 'Catok', 'CJO',
	'Darth Predator', 'Dec', 'Drii',
	'Edoc', 'efaref', 'Elv',
	'Jasje', 'Jason Longwell', 'Jens Jacobsen',
	'Kemat1an', 'Kkthnx', 'Konungr',
	'Lockslap', 'Ludius', 'luminnas', 'lolarennt',
	'MaXiMiUS', 'Merathilis', 'Merith', 'MrRuben5',
	'Outofammo',
	'Pat', 'Pezzer13', 'Paul',
	'Rakkhin', 'Repooc', 'Roktaal',
	'Shestak', 'Shadowcall', 'Sinaris', 'Simpy',
	'Tercioo', 'Torch', 'Tukz',
	'Warmexx',
	'Vito Sansevero',
}

sort(DEVELOPERS, function(a, b) return strlower(a) < strlower(b) end)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..devName..'    '
end

local DefaultTemplates = { ClassColor = 'Class Color', Custom = 'Custom', Default = 'Default', Transparent = 'Transparent' }
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

AS.Options = {
	order = 6,
	type = 'group',
	name = AS.Title,
	childGroups = 'tab',
	args = {
		general = {
			type = 'group',
			name = GENERAL,
			order = 0,
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS:UpdateSettings() AS.NeedReload = true end,
			args = {
				Header = {
					order = 0,
					type = 'header',
					name = AS:GetColor(GENERAL),
				},
				LoginMsg = {
					type = 'toggle',
					name = ASL['Login Message'],
					order = 1,
				},
				SkinDebug = {
					type = 'toggle',
					name = ASL['Enable Skin Debugging'],
					order = 2,
				},
				Parchment = {
					type = 'toggle',
					name = ASL['Parchment']..' (WIP)', -- This doesn't need localized. Once I'm done doing the extra skinning I'll remove it.
					order = 3,
				},
				Theme = {
					name = ASL['Themes'],
					order = 4,
					type = 'select',
					values = {
						PixelPerfect = 'Pixel Perfect',
						TwoPixel = 'Two Pixel',
						ThickBorder = 'Thick Border',
					},
				},
				Shadows = {
					name = ASL['Shadows'],
					order = 7,
					type = 'toggle',
				},
				SkinTemplate = {
					name = ASL['Skin Template'],
					order = 8,
					type = 'select',
					values = function() return DefaultTemplates end,
				},
				Textures = {
					type = 'group',
					name = 'Textures',
					guiInline = true,
					order = 9,
					get = function(info) return AS:CheckOption(info[#info]) end,
					set = function(info, value) AS:SetOption(info[#info], value) AS:UpdateSettings() AS.NeedReload = true end,
					args = {
						BackgroundTexture = {
							type = 'select',
							dialogControl = 'LSM30_Statusbar',
							order = 1,
							name = 'Background Texture',
							values = AS.LSM:HashTable('statusbar'),
							disabled = function() return AS:CheckOption('ElvUIStyle', 'ElvUI') end,
						},
						StatusBarTexture = {
							type = 'select',
							dialogControl = 'LSM30_Statusbar',
							order = 2,
							name = 'StatusBar Texture',
							values = AS.LSM:HashTable('statusbar'),
							disabled = function() return AS:CheckOption('ElvUIStyle', 'ElvUI') end,
						},
						CropIcons = {
							name = ASL['Crop Icons'],
							desc = ASL['Turn off for Full Icons'],
							order = 3,
							type = 'toggle',
						},
					},
				},
				Colors = {
					type = 'group',
					name = 'Colors',
					guiInline = true,
					order = 9,
					get = function(info) return unpack(AS:CheckOption(info[#info])) end,
					set = function(info, r, g, b, a) AS:SetOption(info[#info], { r, g, b, a }) AS:UpdateSettings() end,
					args = {
						CustomBackdropColor = {
							type = 'color',
							order = 1,
							hasAlpha = true,
							name = 'Backdrop Color',
							desc = 'Only Available with Custom Template',
							disabled = function() return (AS:CheckOption('SkinTemplate') ~= 'Custom') or AS:CheckOption('ElvUIStyle') end,
						},
						CustomBorderColor = {
							type = 'color',
							order = 2,
							name = 'Border Color',
							desc = 'Only Available with Custom Template',
							disabled = function() return (AS:CheckOption('SkinTemplate') ~= 'Custom') or AS:CheckOption('ElvUIStyle') end,
						},
						HighlightColor = {
							type = 'color',
							order = 3,
							name = 'Highlight',
						},
						SelectedColor = {
							type = 'color',
							order = 4,
							name = 'Selected / Checked',
						},
						StatusBarColor = {
							type = 'color',
							order = 5,
							name = 'Status Bars',
						},
					},
				},
				dbm = {
					type = 'group',
					name = 'DBM Options',
					guiInline = true,
					order = 10,
					get = function(info) return AS:CheckOption(info[#info]) end,
					set = function(info, value) AS:SetOption(info[#info], value) end,
					args = {
						DBMFont = {
							type = 'select', dialogControl = 'LSM30_Font',
							order = 1,
							name = ASL['DBM Font'],
							values = AS.LSM:HashTable('font'),
						},
						DBMFontSize = {
							type = 'range',
							order = 2,
							name = ASL['DBM Font Size'],
							min = 8, max = 18, step = 1,
						},
						DBMFontFlag = {
							name = ASL['DBM Font Flag'],
							order = 3,
							type = 'select',
							values = {
								NONE = 'None',
								OUTLINE = 'OUTLINE',
								THICKOUTLINE = 'THICKOUTLINE',
								MONOCHROME = 'MONOCHROME',
								MONOCHROMEOUTLINE = 'MONOCHROMEOUTLINE',
							},
						},
						DBMSkinHalf = {
							type = 'toggle',
							name = ASL['DBM Half-bar Skin'],
							order = 4,
						},
						DBMRadarTrans = {
							type = 'toggle',
							name = ASL['DBM Transparent Radar'],
							order = 5,
						},
					},
				},
			},
		},
		addons = {
			order = 1,
			type = 'group',
			name = ASL['AddOn Skins'],
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end,
			args = {
				description = {
					type = 'header',
					name = AS:GetColor(ASL['AddOn Skins']),
					order = 0,
				},
				skins = {
					order = 1,
					type = 'multiselect',
					name = '',
					get = function(_, key) return AS:CheckOption(key) end,
					set = function(_, key, value) AS:SetOption(key, value) AS.NeedReload = true end,
					values = {},
				}
			},
		},
		blizzard = {
			order = 2,
			type = 'group',
			name = ASL['Blizzard Skins'],
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end,
			args = {
				elvuiUsers = {
					type = 'header',
					name = 'DO NOT ENABLE THESE WITH ElvUI Skins turned on.',
					hidden = not AS:CheckAddOn('ElvUI'),
					order = 0
				},
				enableAll = {
					order = 1,
					type = 'execute',
					name = 'Enable All',
					func = function()
						for SkinName in pairs(BlizzardSkins) do
							AS:SetOption(SkinName, true)
						end
					end,
				},
				disableAll = {
					order = 2,
					type = 'execute',
					name = 'Disable All',
					func = function()
						for SkinName in pairs(BlizzardSkins) do
							AS:SetOption(SkinName, false)
						end
					end,
				},
				description = {
					type = 'header',
					name = AS:GetColor(ASL['Blizzard Skins']),
					order = 3,
				},
				skins = {
					order = 4,
					type = 'multiselect',
					name = '',
					get = function(_, key) return AS:CheckOption(key) end,
					set = function(_, key, value) AS:SetOption(key, value) AS.NeedReload = true end,
					values = {},
				}
			},
		},
		embed = {
			order = 4,
			type = 'group',
			name = ASL['Embed Settings'],
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS:Embed_Check() end,
			args = {
				EmbedIsHidden = {
					order = 0,
					type = 'toggle',
					name = ASL['|cFFFF0000Embed is HIDDEN|r'],
					hidden = function() return not AS:CheckOption('EmbedIsHidden') end,
					width = 'full',
				},
				EmbedHeader = {
					order = 1,
					type = 'header',
					name = AS:GetColor(ASL['Embed Settings']),
				},
				EmbedSystemMessage = {
					type = 'toggle',
					name = ASL['Embed System Message'],
					order = 2,
				},
				HideChatFrame = {
					name = ASL['Hide Chat Frame'],
					order = 3,
					type = 'select',
					values = function() return AS:GetChatWindowInfo() end,
					disabled = function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end,
				},
				EmbedRightChat = {
					type = 'toggle',
					name = ASL['Embed into Right Chat Panel'],
					order = 4,
				},
				EmbedBelowTop = {
					type = 'toggle',
					name = ASL['Embed Below Top Tab'],
					order = 5,
				},
				EmbedBackdrop = {
					type = 'toggle',
					name = ASL['Backdrop'],
					order = 6,
				},
				EmbedBackdropTransparent = {
					type = 'toggle',
					name = ASL['Transparent Backdrop'],
					order = 7,
				},
				spacer1 = {
					order = 8,
					type = 'header',
					name = '',
				},
				EmbedSystem = {
					order = 9,
					type = 'toggle',
					name = ASL['One Window Embed System'],
					disabled = function() return AS:CheckOption('EmbedSystemDual') end,
				},
				EmbedMain = {
					order = 10,
					type = 'select',
					name = ASL['Embed for One Window'],
					disabled = function() return not AS:CheckOption('EmbedSystem') end,
					values = Embeds,
				},
				spacer2 = {
					order = 11,
					type = 'header',
					name = '',
				},
				EmbedSystemDual = {
					order = 12,
					type = 'toggle',
					name = ASL['Two Window Embed System'],
					disabled = function() return AS:CheckOption('EmbedSystem') end,
				},
				EmbedLeft = {
					order = 13,
					type = 'select',
					name = ASL["Window One Embed"],
					disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
					values = Embeds,
				},
				EmbedLeftWidth = {
					type = 'range',
					order = 14,
					name = ASL['Window One Width'],
					min = 100, max = 300, step = 1,
					disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
				},
				EmbedRight = {
					order = 15,
					type = 'select',
					name = ASL["Window Two Embed"],
					disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
					values = Embeds,
				},
				spacer3 = {
					order = 16,
					type = 'header',
					name = 'Strata, Level and Combat Options',
				},
				EmbedFrameStrata = {
					name = ASL['Embed Frame Strata'],
					order = 17,
					type = 'select',
					values = {
						['1-BACKGROUND'] = 'BACKGROUND',
						['2-LOW'] = 'LOW',
						['3-MEDIUM'] = 'MEDIUM',
						['4-HIGH'] = 'HIGH',
						['5-DIALOG'] = 'DIALOG',
						['6-FULLSCREEN'] = 'FULLSCREEN',
						['7-FULLSCREEN_DIALOG'] = 'FULLSCREEN_DIALOG',
						['8-TOOLTIP'] = 'TOOLTIP',
					},
					disabled = function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end,
				},
				EmbedFrameLevel = {
					name = ASL['Embed Frame Level'],
					order = 18,
					type = 'range',
					min = 1,
					max = 255,
					step = 1,
					disabled = function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end,
				},
				EmbedOoC = {
					type = 'toggle',
					name = ASL['Out of Combat (Hide)'],
					order = 19,
				},
				EmbedOoCDelay = {
					name = ASL['Embed OoC Delay'],
					order = 20,
					type = 'range',
					min = 1, max = 30, step = 1,
					disabled = function() return not ((AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) and AS:CheckOption('EmbedOoC')) end,
				},
			},
		},
		about = {
			type = 'group',
			name = ASL['About/Help'],
			order = -2,
			childGroups = 'tab',
			args = {
				credits = {
					type = 'group',
					name = 'Credits',
					order = 0,
					args = {
						AuthorHeader = {
							order = 0,
							type = 'header',
							name = 'Authors:',
						},
						Authors = {
							order = 1,
							type = 'description',
							name = AS.Authors,
							fontSize = 'large',
						},
						DevelopersHeader = {
							order = 2,
							type = 'header',
							name = 'Developers:',
						},
						Developers = {
							order = 3,
							type = 'description',
							name = DEVELOPER_STRING,
							fontSize = 'medium',
						},
					},
				},
				links = {
					type = 'group',
					name = ASL['Links'],
					order = 1,
					args = {
						tukuilink = {
							order = 5,
							type = 'input',
							width = 'full',
							name = ASL['Download Link'],
							get = function() return 'https://www.tukui.org/addons.php?id=3' end,
						},
						gitlablink = {
							order = 7,
							type = 'input',
							width = 'full',
							name = ASL['GitLab Link / Report Errors'],
							get = function() return 'https://git.tukui.org/Azilroka/AddOnSkins' end,
						},
					},
				},
			},
		},
	},
}

function AS:BuildProfile()
	local Embed = AS:CheckAddOn('Details') and 'Details' or AS:CheckAddOn('Skada') and 'Skada' or AS:CheckAddOn('Recount') and 'Recount' or ''

	local Defaults = {
		profile = {
		-- Embeds
			['EmbedBackdrop'] = true,
			['EmbedBackdropTransparent'] = true,
			['EmbedBelowTop'] = false,
			['EmbedFrameLevel'] = 10,
			['EmbedFrameStrata'] = '2-LOW',
			['EmbedIsHidden'] = false,
			['EmbedLeftWidth'] = 200,
			['EmbedOoC'] = false,
			['EmbedOoCDelay'] = 10,
			['EmbedRightChat'] = true,
			['EmbedSystem'] = false,
			['EmbedSystemDual'] = false,
			['EmbedLeft'] = Embed,
			['EmbedRight'] = Embed,
			['EmbedMain'] = Embed,
		-- Misc
			['BackgroundTexture'] = 'Blizzard Raid Bar',
			['ClassColor'] = false,
			['CropIcons'] = true,
			['CustomBackdropColor'] = { .5, .5, .5, .8 },
			['CustomBorderColor'] = { 0, 0, 0 },
			['DBMFont'] = 'Arial Narrow',
			['DBMFontFlag'] = 'OUTLINE',
			['DBMFontSize'] = 12,
			['DBMRadarTrans'] = false,
			['DBMSkinHalf'] = false,
			['ElvUIStyle'] = AS:CheckAddOn('ElvUI') and true or false,
			['EmbedSystemMessage'] = true,
			['HideChatFrame'] = 'NONE',
			['HighlightColor'] = { 1, .8, .1 },
			['LoginMsg'] = false,
			['Parchment'] = false,
			['SelectedColor'] = { 0, 0.44, .87 },
			['Shadows'] = true,
			['SkinDebug'] = false,
			['SkinTemplate'] = 'Transparent',
			['StatusBarColor'] = { .01, .39, .1 },
			['StatusBarTexture'] = 'Blizzard Raid Bar',
			['Theme'] = 'PixelPerfect',
		},
	}

	for skin in pairs(AS.register) do
		if AS:CheckAddOn('ElvUI') and strfind(skin, 'Blizzard_') then
			Defaults.profile[skin] = false
		else
			Defaults.profile[skin] = true
		end
	end

	for skin in pairs(AS.preload) do
		if AS:CheckAddOn('ElvUI') and strfind(skin, 'Blizzard_') then
			Defaults.profile[skin] = false
		else
			Defaults.profile[skin] = true
		end
	end

	self.data = LibStub('AceDB-3.0'):New('AddOnSkinsDB', Defaults, true)

	self.data.RegisterCallback(AS, 'OnProfileChanged', 'SetupProfile')
	self.data.RegisterCallback(AS, 'OnProfileCopied', 'SetupProfile')
	self.db = self.data.profile
end

function AS:SetupProfile()
	self.db = self.data.profile
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
			AS.Options.args.blizzard.args.skins.values[skinName] = strfind(skinName, 'Blizzard_') and (BlizzardNames[skinName] or strtrim(skinName:gsub('^Blizzard_(.+)','%1'):gsub('(%l)(%u%l)','%1 %2')))
		else
			AS.Options.args.addons.args.skins.values[skinName] = GetAddOnMetadata(skinName, 'Title') or strtrim(skinName:gsub('(%l)(%u%l)','%1 %2'))
		end
	end

	if AS:CheckAddOn('ElvUI') then
		AS.Options.args.general.args.ElvUIStyle = {
			type = 'toggle',
			name = 'ElvUI Style',
			order = 5,
		}

		if AS:CheckAddOn('ElvUI_MerathilisUI') then
			DefaultTemplates['MerathilisUI'] = '|cffff7d0aMerathilisUI|r'
		end
	end
end

function AS:GetOptions()
	local Ace3OptionsPanel = AS:CheckAddOn('ElvUI') and ElvUI[1] or Enhanced_Config
	Ace3OptionsPanel.Options.args.addonskins = AS.Options

	AS.Options.args.profiles = LibStub('AceDBOptions-3.0'):GetOptionsTable(AS.data)
	AS.Options.args.profiles.order = -2

	if AS:CheckAddOn('ElvUI') then
		hooksecurefunc(LibStub('AceConfigDialog-3.0-ElvUI'), 'CloseAll', function(self, appName)
			if AS.NeedReload then
				ElvUI[1]:StaticPopup_Show("PRIVATE_RL")
			end
		end)
	end
end
