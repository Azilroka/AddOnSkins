local AS, ASL = unpack(AddOnSkins)
local sort, pairs, gsub, strfind, strlower, strtrim = sort, pairs, gsub, strfind, strlower, strtrim

local DEVELOPER_STRING = ''
local LINE_BREAK = '\n'

local DEVELOPERS = {
	'AcidWeb',
	'Affli',
	'Aldarana',
	'Arstraea',
	'Blazeflack',
	'Cadayron',
	'Camealion',
	'Catok',
	'CJO',
	'Darth Predator',
	'Dec',
	'Drii',
	'Edoc',
	'efaref',
	'Elv',
	'Jasje',
	'Kemat1an',
	'Kkthnx',
	'Konungr',
	'Lockslap',
	'Ludius',
	'luminnas',
	'lolarennt',
	'MaXiMiUS',
	'Merith',
	'MrRuben5',
	'Outofammo',
	'Pat',
	'Pezzer13',
	'Rakkhin',
	'Repooc',
	'Roktaal',
	'Shestak',
	'Shadowcall',
	'Sinaris',
	'Simpy',
	'Tercioo',
	'Tukz',
	'Warmexx',
	'Vito Sansevero',
	'Brian Thurlow',
	'Paul',
	'Jens Jacobsen',
	'Merathilis',
	'Torch',
	'Jason Longwell',
}

sort(DEVELOPERS, function(a, b) return strlower(a) < strlower(b) end)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..devName..'    '
end

AS.Options = {
	order = 101,
	type = 'group',
	name = AS.Title,
	childGroups = 'tab',
	args = {
		general = {
			type = 'group',
			name = GENERAL,
			order = 0,
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end,
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
				ThinBorder = {
					name = 'Thin Border',
					order = 4,
					type = 'toggle',
				},
				SkinTemplate = {
					name = ASL['Skin Template'],
					order = 6,
					type = 'select',
					values = {
						['ClassColor'] = 'Class Color',
						['Custom'] = 'Custom',
						['Default'] = 'Default',
						['Transparent'] = 'Transparent',
					}
				},
				Textures = {
					type = 'group',
					name = 'Textures',
					guiInline = true,
					order = 7,
					get = function(info) return AS:CheckOption(info[#info]) end,
					set = function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end,
					args = {
						BackgroundTexture = {
							type = 'select',
							dialogControl = 'LSM30_Statusbar',
							order = 1,
							name = 'Background Texture',
							values = AS.LSM:HashTable('statusbar'),
						},
						StatusBarTexture = {
							type = 'select',
							dialogControl = 'LSM30_Statusbar',
							order = 2,
							name = 'StatusBar Texture',
							values = AS.LSM:HashTable('statusbar'),
						},
					},
				},
				Colors = {
					type = 'group',
					name = 'Colors',
					guiInline = true,
					order = 8,
					get = function(info) return unpack(AS:CheckOption(info[#info])) end,
					set = function(info, r, g, b, a) AS:SetOption(info[#info], { r, g, b, a }) end,
					args = {
						BackdropColor = {
							type = 'color',
							order = 1,
							hasAlpha = true,
							name = 'Backdrop Color',
							desc = 'Only Available with Custom Template',
							disabled = function() return (AS:CheckOption('SkinTemplate') ~= 'Custom' and not AS:CheckOption('ElvUIStyle')) end,
						},
						BorderColor = {
							type = 'color',
							order = 2,
							name = 'Border Color',
							desc = 'Only Available with Custom Template',
							disabled = function() return (AS:CheckOption('SkinTemplate') ~= 'Custom' and not AS:CheckOption('ElvUIStyle')) end,
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
			args = {},
		},
		blizzard = {
			order = 2,
			type = 'group',
			name = ASL['Blizzard Skins'],
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end,
			args = {},
		},
		bossmods = {
			type = 'group',
			name = ASL['BossMod Options'],
			order = 3,
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) end,
			args = {
				BossModHeader = {
					order = 0,
					type = 'header',
					name = AS:GetColor(ASL['BossMod Options']),
				},
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
						['NONE'] = 'None',
						['OUTLINE'] = 'OUTLINE',
						['THICKOUTLINE'] = 'THICKOUTLINE',
						['MONOCHROME'] = 'MONOCHROME',
						['MONOCHROMEOUTLINE'] = 'MONOCHROMEOUTLINE',
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
		embed = {
			order = 4,
			type = 'group',
			name = ASL['Embed Settings'],
			get = function(info) return AS:CheckOption(info[#info]) end,
			set = function(info, value) AS:SetOption(info[#info], value) AS:Embed_Check() end,
			args = {
				EmbedHeader = {
					order = 0,
					type = 'header',
					name = AS:GetColor(ASL['Embed Settings']),
				},
				desc = {
					type = 'description',
					name = ASL['Settings to control Embedded AddOns:\n\nAvailable Embeds: Details | Omen | Skada | Recount | TinyDPS'],
					order = 1
				},
				EmbedSystem = {
					type = 'toggle',
					name = ASL['One Window Embed System'],
					order = 2,
					disabled = function() return AS:CheckOption('EmbedSystemDual') end,
				},
				EmbedMain = {
					type = 'input',
					width = 'full',
					name = ASL['Embed for One Window'],
					disabled = function() return not AS:CheckOption('EmbedSystem') end,
					order = 3,
				},
				EmbedSystemDual = {
					type = 'toggle',
					name = ASL['Two Window Embed System'],
					order = 4,
					disabled = function() return AS:CheckOption('EmbedSystem') end,
				},
				EmbedLeft = {
					type = 'input',
					width = 'full',
					name = ASL["Window One Embed"],
					disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
					order = 5,
				},
				EmbedRight = {
					type = 'input',
					width = 'full',
					name = ASL["Window Two Embed"],
					disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
					order = 6,
				},
				EmbedLeftWidth = {
					type = 'range',
					order = 7,
					name = ASL['Window One Width'],
					min = 100,
					max = 300,
					step = 1,
					disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
					width = 'full',
				},
				EmbedSystemMessage = {
					type = 'toggle',
					name = ASL['Embed System Message'],
					order = 9,
				},
				EmbedFrameStrata = {
					name = ASL['Embed Frame Strata'],
					order = 10,
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
					order = 11,
					type = 'range',
					min = 1,
					max = 255,
					step = 1,
					disabled = function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end,
				},
				EmbedOoC = {
					type = 'toggle',
					name = ASL['Out of Combat (Hide)'],
					order = 12,
				},
				EmbedOoCDelay = {
					name = ASL['Embed OoC Delay'],
					order = 13,
					type = 'range',
					min = 1,
					max = 30,
					step = 1,
					disabled = function() return not ((AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) and AS:CheckOption('EmbedOoC')) end,
				},
				HideChatFrame = {
					name = ASL['Hide Chat Frame'],
					order = 14,
					type = 'select',
					values = function() return AS:GetChatWindowInfo() end,
					disabled = function() return not (AS:CheckOption('EmbedSystemDual') or AS:CheckOption('EmbedSystem')) end,
				},
				EmbedRightChat = {
					type = 'toggle',
					name = ASL['Embed into Right Chat Panel'],
					order = 15,
				},
				TransparentEmbed = {
					type = 'toggle',
					name = ASL['Embed Transparancy'],
					order = 16,
				},
				EmbedBelowTop = {
					type = 'toggle',
					name = ASL['Embed Below Top Tab'],
					order = 17,
				},
				DetailsBackdrop = {
					type = 'toggle',
					name = ASL['Details Backdrop'],
					order = 18,
					disabled = function() return not (AS:CheckOption('Details', 'Details') and AS:CheckEmbed('Details')) end
				},
				RecountBackdrop = {
					type = 'toggle',
					name = ASL['Recount Backdrop'],
					order = 19,
					disabled = function() return not (AS:CheckOption('Recount', 'Recount') and AS:CheckEmbed('Recount')) end
				},
				SkadaBackdrop = {
					type = 'toggle',
					name = ASL['Skada Backdrop'],
					order = 20,
					disabled = function() return not (AS:CheckOption('Skada', 'Skada') and AS:CheckEmbed('Skada')) end
				},
				OmenBackdrop = {
					type = 'toggle',
					name = ASL['Omen Backdrop'],
					order = 21,
					disabled = function() return not (AS:CheckOption('Omen', 'Omen') and AS:CheckEmbed('Omen')) end
				},
				EmbedSexyCooldown = {
					type = 'toggle',
					name = ASL['Attach SexyCD to action bar'],
					order = 22,
					disabled = function() return not AS:CheckOption('SexyCooldown', 'SexyCooldown2') end,
				},
				EmbedCoolLine = {
					type = 'toggle',
					name = ASL['Attach CoolLine to action bar'],
					order = 23,
					disabled = function() return not AS:CheckOption('CoolLine', 'CoolLine') end,
				},
			},
		},
		faq = {
			type = 'group',
			name = ASL["FAQ's"],
			order = 6,
			args = {
				FAQHeader = {
					order = 0,
					type = 'header',
					name = AS:GetColor(ASL["FAQ's"]),
				},
				question1 = {
					type = 'description',
					name = '|cffc41f3b[Q] '..ASL['DBM Half-Bar Skin Spacing looks wrong. How can I fix it?'],
					order = 1,
					fontSize = 'medium',
				},
				answer1 = {
					type = 'description',
					name = '|cffabd473[A] '..ASL['To use the DBM Half-Bar skin. You must change the DBM Options. Offset Y needs to be at least 15.'],
					order = 2,
					fontSize = 'medium',
				},
			},
		},
		about = {
			type = 'group',
			name = ASL['About/Help'],
			order = -2,
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
					fontSize = 'large',
				},
				desc = {
					order = 4,
					type = 'header',
					name = ASL['Links'],
				},
				tukuilink = {
					order = 5,
					type = 'input',
					width = 'full',
					name = ASL['Download Link'],
					get = function() return 'https://www.tukui.org/addons.php?id=3' end,
				},
				changeloglink = {
					order = 6,
					type = 'input',
					width = 'full',
					name = ASL['Changelog Link'],
					get = function() return 'https://www.tukui.org/forum/viewtopic.php?f=35&t=801' end,
				},
				gitlablink = {
					order = 7,
					type = 'input',
					width = 'full',
					name = ASL['GitLab Link / Report Errors'],
					get = function() return 'https://git.tukui.org/Azilroka/AddOnSkins' end,
				},
				skinlink = {
					order = 8,
					type = 'input',
					width = 'full',
					name = ASL['Available Skins / Skin Requests'],
					get = function() return 'https://www.tukui.org/forum/viewforum.php?f=35' end,
				},
				version = {
					order = 9,
					type = 'group',
					name = 'Version',
					guiInline = true,
					args = {
						version = {
							order = 1,
							type = 'description',
							fontSize = 'medium',
							name = AS.Title..AS.Version,
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
			['EmbedOoC'] = false,
			['EmbedOoCDelay'] = 10,
			['EmbedCoolLine'] = false,
			['EmbedSexyCooldown'] = false,
			['EmbedSystem'] = false,
			['EmbedSystemDual'] = false,
			['EmbedMain'] = Embed,
			['EmbedLeft'] = Embed,
			['EmbedRight'] = Embed,
			['EmbedRightChat'] = true,
			['EmbedLeftWidth'] = 200,
			['EmbedBelowTop'] = false,
			['TransparentEmbed'] = false,
			['EmbedIsHidden'] = false,
			['EmbedFrameStrata'] = '2-LOW',
			['EmbedFrameLevel'] = 10,
		-- Misc
			['RecountBackdrop'] = true,
			['SkadaBackdrop'] = true,
			['OmenBackdrop'] = true,
			['DetailsBackdrop'] = true,
			['DBMSkinHalf'] = false,
			['DBMFont'] = 'Arial Narrow',
			['DBMFontSize'] = 12,
			['DBMFontFlag'] = 'OUTLINE',
			['DBMRadarTrans'] = false,
			['SkinTemplate'] = 'Transparent',
			['HideChatFrame'] = 'NONE',
			['Parchment'] = false,
			['SkinDebug'] = false,
			['LoginMsg'] = false,
			['EmbedSystemMessage'] = true,
			['ElvUIStyle'] = false,
			['ThinBorder'] = true,
			['ClassColor'] = false,
			['BackgroundTexture'] = 'Blizzard Raid Bar',
			['StatusBarTexture'] = 'Blizzard Raid Bar',
			['BackdropColor'] = { .5, .5, .5, .8 },
			['BorderColor'] = { 0, 0, 0 },
			['HighlightColor'] = { 1, .8, .1 },
			['SelectedColor'] = { 0, 0.44, .87 },
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
	local function GenerateOptionTable(skinName, order)
		local text = strfind(skinName, 'Blizzard_') and strtrim(skinName:gsub('^Blizzard_(.+)','%1'):gsub('(%l)(%u%l)','%1 %2')) or GetAddOnMetadata(skinName, 'Title') or strtrim(skinName:gsub('(%l)(%u%l)','%1 %2'))
		local options = {
			type = 'toggle',
			name = text,
			order = order,
		}
		if AS:CheckAddOn('ElvUI') and strfind(skinName, 'Blizzard_') then
			options.set = function(info, value) AS:SetOption(info[#info], value) AS:SetElvUIBlizzardSkinOption(info[#info], not value) AS.NeedReload = true end
		end
		return options
	end

	local order, blizzorder = 1, 1
	local skins = {}

	for skinName in pairs(AS.register) do
		tinsert(skins, skinName)
	end

	for skinName in pairs(AS.preload) do
		tinsert(skins, skinName)
	end

	sort(skins)

	for _, skinName in pairs(skins) do
		if strfind(skinName, 'Blizzard_') then
			AS.Options.args.blizzard.args[skinName] = GenerateOptionTable(skinName, blizzorder)
			blizzorder = blizzorder + 1
		else
			AS.Options.args.addons.args.description = {
				type = 'header',
				name = AS:GetColor(ASL['AddOn Skins']),
				order = 0,
			}
			AS.Options.args.addons.args[skinName] = GenerateOptionTable(skinName, order)
			order = order + 1
		end
	end

	if AS:CheckAddOn('ElvUI') then
		AS.Options.args.blizzard.args.description = {
			type = 'header',
			name = AS:GetColor(ASL['Blizzard Skins']),
			order = 0,
		}

		AS.Options.args.general.args.ElvUIStyle = {
			type = 'toggle',
			name = 'ElvUI Style',
			order = 5,
		}

		if AS:CheckAddOn('ElvUI_MerathilisUI') then
			AS.Options.args.general.args.SkinTemplate.values['MerathilisUI'] = 'MerathilisUI'
		end

		if AS:CheckAddOn('ElvUI_KlixUI') then
			AS.Options.args.general.args.SkinTemplate.values['KlixUI'] = 'KlixUI'
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
