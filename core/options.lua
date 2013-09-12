local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local format, gsub, pairs, ipairs, tinsert, sort = format, gsub, pairs, ipairs, tinsert, sort

local Skins = {
	["AchieveItSkin"] = {
		["buttonText"] = "Achieve It",
	},
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
	},
	["AraBrokerGuildFriendsSkin"] = {
		["buttonText"] = "Ara Broker Guild Friends",
		["addon"] = "Ara_Broker_Guild_Friends",
	},
	["AraBrokerTradeskillsSkin"] = {
		["buttonText"] = "Ara Broker Tradeskills",
		["addon"] = "Ara_Broker_Tradeskills",
	},
	['ArhSkin'] = {
		["buttonText"] = "Archaeology Helper",
	},
	["AtlasLootSkin"] = {
		["buttonText"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader",
	},
	["AuctioneerSkin"] = {
		["buttonText"] = "Auctioneer",
		["addon"] = "Auc-Advanced",
	},
	["BPTSkin"] = {
		["buttonText"] = "Balance Power Tracker",
		["addon"] = "BalancePowerTracker",
	},
	["DailyTamerCheckSkin"] = {
		["buttonText"] = "Daily Tamer Check",
	},
	["DBMSkin"] = {
		["buttonText"] = "DBM",
		["addon"] = "DBM-Core",
	},
	["ExtVendorSkin"] = {
		["buttonText"] = "Extended Vendor",
	},
	["KarniCrapSkin"] = {
		["buttonText"] = "Karni's Crap Filter",
	},
	["LootCouncilLiteSkin"] = {
		["buttonText"] = "LootCouncilLite",
		["addon"] = "LootCouncil_Lite",
	},
	["MRTSkin"] = {
		["buttonText"] = "Mizus Raid Tracker",
		["addon"] = "MizusRaidTracker",
	},
	["OgriLazySkin"] = {
		["addon"] = "Ogri'Lazy",
	},
	["RaidInviteOrganizerSkin"] = {
		["buttonText"] = "Raid Invite Organizer",
	},
	["RaidBuffStatusSkin"] = {
		["buttonText"] = "Raid Buff Status",
	},
	["SearingPlasmaTrackerSkin"] = {
		["buttonText"] = "Searing Plasma Tracker",
	},
	["SexyCooldownSkin"] = {
		["buttonText"] = "SexyCooldown 2",
		["addon"] = "SexyCooldown2",
	},
	["ShieldMonitorSkin"] = {
		["buttonText"] = "Shield Monitor",
		["addon"] = "shieldmonitor",
	},
	["SpineCounterSkin"] = {
		["buttonText"] = "Spine Blood Counter",
	},
	["SwatterSkin"] = {
		["buttonText"] = "Swatter",
		["addon"] = "!Swatter",
	},
	["ZygorSkin"] = {
		["buttonText"] = "Zygor",
		["addon"] = "ZygorGuidesViewer",
	},
	["CLCInfoSkin"] = {
		["buttonText"] = "CLCInfo Icons",
	},
	["CLCProtSkin"] = {
		["buttonText"] = "CLCProt Icons",
	},
	["CLCRetSkin"] = {
		["buttonText"] = "CLCRet Icons",
	},
	["WeakAurasSkin"] = {
		["buttonText"] = "WeakAuras Icons",
	},
	["ParchmentRemover"] = {
		["buttonText"] = "Parchment Remover",
		["addon"] = "ElvUI_AddOnSkins"
	},
	['TitanPanelSkin'] = {
		['buttonText'] = 'Titan Panel',
		['addon'] = 'Titan',
	}
}

AS.Skins = Skins
function AS:GenerateOptionTable(skinName, order)
	local data = Skins[skinName]
	local addon
	if data and data.addon then
		addon = data.addon
	else
		addon = gsub(skinName, "Skin", "")
	end
	local text = data and data.buttonText or addon
	local options = {
		type = 'toggle',
		name = text,
		desc = L['TOGGLESKIN_DESC'],
		order = order,
		disabled = function() if addon then return not IsAddOnLoaded(addon) else return false end end,
	}
	return options
end

local DEVELOPER_STRING = ""
local LINE_BREAK = "\n"

local DEVELOPERS = {
	"Affli",
	"Arstraea",
	"Azilroka",
	"Blazeflack",
	"Cadayron",
	"Camealion",
	"Catok",
	"Darth Predator",
	"Dec",
	"Edoc",
	"Elv",
	"Jasje",
	"Kkthnx",
	"Konungr",
	"Lockslap",
	"Lolarennt",
	"Outofammo",
	"Pat",
	"Repooc",
	"Shadowcall",
	"Sinaris",
	"Sortokk",
	"Tukz",
}

sort(DEVELOPERS)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..LINE_BREAK..devName
end

function AS:GenerateOptions()
	E.Options.args.addonskins = {
		order = 100,
		type = 'group',
		name = AS.Title,
		args = {},
	}
	E.Options.args.addonskins.args.addons = {
		order = 0,
		type = 'group',
		name = 'Skins',
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = true,
		args = {},
	}
	E.Options.args.addonskins.args.dbm = {
		type = 'group',
		name = 'DBM Options',
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
				name = 'BigWigs Half-bar Skin',
				order = 4,
				--disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
			},
		}
	}
	E.Options.args.addonskins.args.embed = {
		order = 2,
		type = 'group',
		name = 'Embed Settings',
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) AS:EmbedSystem_WindowResize() AS:Embed_Check() end,
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
			EmbedLeftChat = {
				type = 'toggle',
				name = 'Embed to Left Chat Window',
				order = 12,
			},
			RecountBackdrop = {
				type = 'toggle',
				name = 'Recount Backdrop',
				order = 14,
				disabled = function() return not AS:CheckOption('RecountSkin', 'Recount') end
			},
			SkadaBackdrop = {
				type = 'toggle',
				name = 'Skada Backdrop',
				order = 15,
				disabled = function() return not AS:CheckOption('SkadaSkin', 'Skada') end
			},
			OmenBackdrop = {
				type = 'toggle',
				name = 'Omen Backdrop',
				order = 16,
				disabled = function() return not AS:CheckOption('OmenSkin', 'Omen') end
			},
		}
	}
	E.Options.args.addonskins.args.credits = {
		type = "group",
		name = "Credits",
		order = -1,
		args = {
			desc = {
				order = 1,
				type = "description",
				fontSize = Large,
				name = L['Coding:']..LINE_BREAK..DEVELOPER_STRING,
			},
		},
	}
	local order = 2
	for skinName, _ in AS:OrderedPairs(AS.register) do
		if skinName ~= 'MiscFixes' then
			if V.addonskins[skinName] == nil then
				AS:Print(format("Config: No default option for %s", skinName))
			end
			E.Options.args.addonskins.args.addons.args[skinName] = AS:GenerateOptionTable(skinName, order)
			order = order + 1
		end
	end
end
