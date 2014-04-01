local AS = unpack(AddOnSkins)
local L = AS.Locale
local tinsert, sort, pairs, format, gsub, strfind = tinsert, sort, pairs, format, gsub, strfind

local DEVELOPER_STRING = ''
local LINE_BREAK = '\n'

local DEVELOPERS = {
	'Affli',
	'Arstraea',
	'Azilroka',
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
	'Kkthnx',
	'Konungr',
	'Lockslap',
	'lolarennt',
	'MaXiMUS',
	'Merith',
	'MrRuben5',
	'Outofammo',
	'Pat',
	'Pezzer13',
	'Rakkhin',
	'Repooc',
	'Shestak',
	'Shadowcall',
	'Sinaris',
	'Sortokk',
	'Tukz',
	'Warmexx',
}

sort(DEVELOPERS, function(a, b) return strlower(a) < strlower(b) end)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..LINE_BREAK..devName
end

function AS:Ace3Options()
	local Ace3OptionsPanel = IsAddOnLoaded('Enhanced_Config') and Enhanced_Config[1] or nil
	local function GenerateOptionTable(skinName, order)
		local text = gsub(skinName, 'Skin', '')
		local options = {
			type = 'toggle',
			name = text,
			order = order,
		}
		return options
	end

	Ace3OptionsPanel.Options.args.skins = {
		order = 100,
		type = 'group',
		name = AS.Title,
		args = {},
	}
	Ace3OptionsPanel.Options.args.skins.args.addons = {
		order = 0,
		type = 'group',
		name = 'AddOn Skins',
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = true,
		args = {},
	}
	Ace3OptionsPanel.Options.args.skins.args.blizzard = {
		order = 1,
		type = 'group',
		name = 'Blizzard Skins',
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = true,
		args = {},
	}
	Ace3OptionsPanel.Options.args.skins.args.bossmods = {
		type = 'group',
		name = 'BossMod Options',
		order = 1,
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = false,
		args = {
			DBMFont = {
				type = "select", dialogControl = 'LSM30_Font',
				order = 1,
				name = "DBM Font",
				values = AceGUIWidgetLSMlists.font, 
				disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
			},
			DBMFontSize = {
				type = 'range',
				order = 2,
				name = "DBM Font Size",
				min = 8, max = 18, step = 1, 
				disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
			},
			DBMFontFlag = {
				name = 'DBM Font Flag',
				order = 3,
				type = "select",
				values = {
					['NONE'] = 'None',
					['OUTLINE'] = 'OUTLINE',
					['THICKOUTLINE'] = 'THICKOUTLINE',
					['MONOCHROME'] = 'MONOCHROME',
					['MONOCHROMEOUTLINE'] = 'MONOCHROMEOUTLINE',
				},
				disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
			},
			DBMSkinHalf = {
				type = 'toggle',
				name = 'DBM Half-bar Skin',
				order = 4,
				disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
			},
			BigWigsHalfBar = {
				type = 'toggle',
				name = 'BigWigs Half-Bar',
				order = 4,
				disabled = function() return not AS:CheckOption('BigWigsSkin', 'BigWigs') end
			},
		}
	}
	Ace3OptionsPanel.Options.args.skins.args.embed = {
		order = 2,
		type = 'group',
		name = 'Embed Settings',
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) AS:Embed_Check() end,
		args = {
			desc = {
				type = 'description',
				name = 'Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS',
				order = 1
			},
			EmbedSystem = {
				type = 'toggle',
				name = 'Single Embed System',
				order = 2,
				disabled = function() return AS:CheckOption('EmbedSystemDual') end,
			},
			EmbedMain = {
				type = 'input',
				width = 'full',
				name = 'Embed for Main Panel',
				disabled = function() return not AS:CheckOption('EmbedSystem') end,
				order = 3,
			},
			EmbedSystemDual = {
				type = 'toggle',
				name = 'Dual Embed System',
				order = 4,
				disabled = function() return AS:CheckOption('EmbedSystem') end,
			},
			EmbedLeft = {
				type = 'input',
				width = 'full',
				name = 'Embed for Left Window',
				disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
				order = 5,
			},
			EmbedRight = {
				type = 'input',
				width = 'full',
				name = 'Embed for Right Window',
				disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
				order = 6,
			},
			EmbedLeftWidth = {
				type = 'range',
				order = 7,
				name = "Embed Left Window Width",
				min = 100,
				max = 300,
				step = 1,
				disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
				width = 'full',
			},
			EmbedOoC = {
				type = 'toggle',
				name = 'Out of Combat (Hide)',
				order = 8,
			},
			EmbedSexyCooldown = {
				type = 'toggle',
				name = 'Attach SexyCD to action bar',
				order = 9,
				disabled = function() return not AS:CheckOption('SexyCooldownSkin', 'SexyCooldown2') end,
			},
			EmbedCoolLine = {
				type = 'toggle',
				name = 'Attach CoolLine to action bar',
				order = 10,
				disabled = function() return not AS:CheckOption('CoolLineSkin', 'CoolLine') end,
			},
			TransparentEmbed = {
				type = 'toggle',
				name = 'Embed Transparancy',
				order = 11,
			},
			EmbedBelowTop = {
				type = 'toggle',
				name = 'Embed Below Top Tab',
				order = 12,
			},
			RecountBackdrop = {
				type = 'toggle',
				name = 'Recount Backdrop',
				order = 13,
				disabled = function() return not (AS:CheckOption('RecountSkin', 'Recount') and AS:CheckEmbed('Recount')) end
			},
			SkadaBackdrop = {
				type = 'toggle',
				name = 'Skada Backdrop',
				order = 14,
				disabled = function() return not (AS:CheckOption('SkadaSkin', 'Skada') and AS:CheckEmbed('Skada')) end
			},
			OmenBackdrop = {
				type = 'toggle',
				name = 'Omen Backdrop',
				order = 15,
				disabled = function() return not (AS:CheckOption('OmenSkin', 'Omen') and AS:CheckEmbed('Omen')) end
			},
		}
	}
	Ace3OptionsPanel.Options.args.skins.args.misc = {
		type = 'group',
		name = MISCELLANEOUS,
		order = 3,
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		args = {
			WeakAuraAuraBar = {
				type = 'toggle',
				name = 'WeakAura AuraBar',
				order = 1,
				disabled = function() return not AS:CheckOption('WeakAurasSkin', 'WeakAuras') end,
			},
			AuctionHouse = {
				type = 'toggle',
				name = 'Auction House',
				order = 2,
			}
		}
	}
	Ace3OptionsPanel.Options.args.skins.args.faq = {
		type = 'group',
		name = "FAQ's",
		order = 4,
		args = {
			question1 = {
				type = 'description',
				name = '|cffc41f3b[Q] DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?|r',
				order = 1,
				fontSize = 'medium',
			},
			answer1 = {
				type = 'description',
				name = '|cffabd473[A] To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15.',
				order = 2,
				fontSize = 'medium',
			},
		},
	}
	Ace3OptionsPanel.Options.args.skins.args.credits = {
		type = "group",
		name = "Credits",
		order = -1,
		args = {
			desc = {
				order = 1,
				type = "description",
				name = format('Credits:\n%s', DEVELOPER_STRING),
				fontSize = 'medium',
			},
		},
	}
	Ace3OptionsPanel.Options.args.skins.args.about = {
		type = 'group',
		name = 'About/Help',
		order = -2,
		args = {
			desc = {
				order = 1,
				type = 'description',
				fontSize = 'medium',
				name = 'This is where you can find out more of AddOnSkins.',
			},
			tukuilink = {
				type = 'input',
				width = 'full',
				name = 'Download Link',
				get = function(info) return AS.DownloadLink end,
				order = 2,
			},
			changeloglink = {
				type = 'input',
				width = 'full',
				name = 'Changelog Link',
				get = function(info) return 'http://www.tukui.org/forums/topic.php?id=30607' end,
				order = 3,
			},
			gitlablink = {
				type = 'input',
				width = 'full',
				name = 'GitLab Link / Report Errors',
				get = function(info) return 'http://git.tukui.org/Azilroka/addonskins' end,
				order = 4,
			},
			skinlink = {
				type = 'input',
				width = 'full',
				name = 'Available Skins / Skin Requests',
				get = function(info) return 'http://www.tukui.org/forums/topic.php?id=28550' end,
				order = 5,
			},
		},
	}
	local order, blizzorder = 0, 0
	for skinName, _ in AS:OrderedPairs(AS.register) do
		if skinName ~= 'MiscFixes' then
			if strfind(skinName, 'Blizzard_') then
				Ace3OptionsPanel.Options.args.skins.args.blizzard.args[skinName] = GenerateOptionTable(skinName, blizzorder)
				blizzorder = blizzorder + 1
			else
				Ace3OptionsPanel.Options.args.skins.args.addons.args[skinName] = GenerateOptionTable(skinName, order)
				order = order + 1
			end
		end
	end
end