local AS = unpack(AddOnSkins)
local L = AS.Locale
local tinsert, sort, pairs, format, gsub, strfind = tinsert, sort, pairs, format, gsub, strfind

AS.Credits = {
	'Affli',
	'Arstraea',
	'Azilroka',
	'Blazeflack',
	'Cadayron',
	'Camealion',
	'Catok',
	'Darth Predator',
	'Dec',
	'Driizt',
	'Edoc',
	'Elv',
	'Jasje',
	'Kkthnx',
	'Konungr',
	'Lockslap',
	'lolarennt',
	'MaXiMUS',
	'Outofammo',
	'Pat',
	'Repooc',
	'Shadowcall',
	'Sinaris',
	'Sortokk',
	'Tukz',
	'Warmexx',
}

AS.CreditsString = ''

sort(AS.Credits)
for Key, Person in pairs(AS.Credits) do
	AS.CreditsString = AS.CreditsString..'\n'..Person
end

if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

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
		order = 0,
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
		set = function(info, value) AS:SetOption(info[#info], value) AS:EmbedSystem_WindowResize() AS:Embed_Check(nil, true) end,
		guiInline = false,
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
				min = floor(EmbedSystem_MainWindow:GetWidth() * .25),
				max = floor(EmbedSystem_MainWindow:GetWidth() * .75),
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
				disabled = function() return not AS:CheckOption('RecountSkin', 'Recount') end
			},
			SkadaBackdrop = {
				type = 'toggle',
				name = 'Skada Backdrop',
				order = 14,
				disabled = function() return not AS:CheckOption('SkadaSkin', 'Skada') end
			},
			OmenBackdrop = {
				type = 'toggle',
				name = 'Omen Backdrop',
				order = 15,
				disabled = function() return not AS:CheckOption('OmenSkin', 'Omen') end
			},
		}
	}
	Ace3OptionsPanel.Options.args.skins.args.credits = {
		type = "group",
		name = "Credits",
		order = 3,
		args = {
			desc = {
				order = 1,
				type = "description",
				name = format('Credits:\n%s', AS.CreditsString),
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