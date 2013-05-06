local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

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
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow",
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
}

AS.Skins = Skins
function AS:GenerateOptionTable(skinName,order)
	local data = Skins[skinName]
	local addon
	if data and data.addon then
		addon = data.addon
	else
		addon = skinName:gsub("Skin","")
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

function AS:GenerateOptions()
	local function pairsByKeys (t, f)
      local a = {}
      for n in pairs(t) do table.insert(a, n) end
      table.sort(a, f)
      local i = 0      -- iterator variable
      local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
      end
      return iter
    end
    E.Options.args.skins.args.addonEnable = {
    	order = 4,
		type = 'toggle',
		name = 'AddOns',
		get = function(info) return E.private.skins.addons.enable end,
		set = function(info, value) E.private.skins.addons.enable = value; E:StaticPopup_Show("PRIVATE_RL") end,
	}
	E.Options.args.skins.args.addons = {
		order = 1000,
		type = 'group',
		name = 'AddOns',
		get = function(info) return E.private.skins.addons[ info[#info] ] end,
		set = function(info,value)  E.private.skins.addons[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end,
		disabled = function() return not E.private.skins.addons.enable end,
		guiInline = true,
		args = {
			desc = {
				type = 'description',
				name = 'AddOn Skins by Sortokk (based on work by Azilroka) - v'..AS.Version,
				order = 1
			},
			misc = {
				type = 'group',
				name = 'Misc Options',
				order = 500,
				args = {
					DBMSkinHalf = {
						type = 'toggle',
						name = 'DBM Half-bar Skin',
						desc = L["TOGGLESKIN_DESC"],
						order = 1,
						disabled = function() return not IsAddOnLoaded("DBM-Core") or not E.private.skins.addons['DBMSkin'] end
					},
					RecountBackdrop = {
						type = 'toggle',
						name = 'Recount Backdrop',
						desc = L['TOGGLESKIN_DESC'],
						order = 2,
						disabled = function() return not IsAddOnLoaded("Recount") or not E.private.skins.addons["RecountSkin"] end,
					},
					SkadaBackdrop = {
						type = 'toggle',
						name = 'Skada Backdrop',
						desc = L['TOGGLESKIN_DESC'],
						order = 3,
						disabled = function() return not IsAddOnLoaded("Skada") or not E.private.skins.addons["SkadaSkin"] end,
					},
					SkadaBelowTop = {
						type = 'toggle',
						name = 'Embed Skada below the top chat panel',
						desc = L['TOGGLESKIN_DESC'],
						order = 4,
						disabled = function() return not IsAddOnLoaded("Skada") or not E.private.skins.addons["SkadaSkin"] end,
					},
					SkadaTwoThirds = {
						type = 'toggle',
						name = 'Skada Windows 1/3 and 2/3 instead of 1/2 and 1/2',
						desc = L['TOGGLESKIN_DESC'],
						order = 5,
						disabled = function() return not IsAddOnLoaded("Skada") or not E.private.skins.addons["SkadaSkin"] end,
					},	
				}
			},
			embed = {
				order = 1000,
				type = 'group',
				name = 'Embed Settings',
				get = function(info) return E.private.skins.addons[ info[#info] ] end,
				set = function(info,value)  E.private.skins.addons[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
				args = {
					desc = {
						type = 'description',
						name = 'Settings to control addons embedded in right chat panel',
						order = 1
					},
					EmbedRight = {
						type = 'toggle',
						name = 'Embed to Right Chat Panel',
						desc = 'Embed to right chat panel, otherwise left chat panel',
						order = 2
					},
					EmbedRecount = {
						type = 'toggle',
						name = 'Recount',
						desc = L['TOGGLESKIN_DESC'],
						order = 3,
						disabled = function() return not IsAddOnLoaded("Recount") end,
					},
					EmbedSkada = {
						type = 'toggle',
						name = 'Skada',
						desc = L['TOGGLESKIN_DESC'],
						order = 4,
						disabled = function() return not IsAddOnLoaded("Skada") end,
					},
					EmbedOmen = {
						type = 'toggle',
						name = 'Omen',
						desc = L['TOGGLESKIN_DESC'],
						order = 6,
						disabled = function() return not IsAddOnLoaded("Omen") end,
					},
					EmbedRO = {
						type = 'toggle',
						name = 'Recount & Omen',
						desc = L['TOGGLESKIN_DESC'],
						order = 8,
						disabled = function() return not IsAddOnLoaded("Omen") or not IsAddOnLoaded("Recount") end,
					},
					EmbedTDPS = {
						type = 'toggle',
						name = 'TinyDPS',
						desc = L['TOGGLESKIN_DESC'],
						order = 9,
						disabled = function() return not IsAddOnLoaded("TinyDPS") end,
					},
					EmbedOoC = {
						type = 'toggle',
						name = 'Hide while out of combat',
						desc = L['TOGGLESKIN_DESC'],
						order = 10,
					},
					EmbedSexyCooldown = {
						type = 'toggle',
						name = 'Attach SexyCD to action bar',
						desc = L['TOGGLESKIN_DESC'],
						order = 11,
						disabled = function() return not IsAddOnLoaded("SexyCooldown2") end,
					},
					EmbedCoolLine = {
						type = 'toggle',
						name = 'Attach CoolLine to action bar',
						desc = L['TOGGLESKIN_DESC'],
						order = 12,
						disabled = function() return not IsAddOnLoaded("CoolLine") end,
					},
					EmbedRight = {
						type = 'toggle',
						name = 'Embed Right',
						desc = L['TOGGLESKIN_DESC'],
						order = 13,
					},
				}
			}
		}
	}

	local order = 2
	for skinName,_ in pairsByKeys(AS.register) do
		if not V.skins.addons[skinName] == nil then
			print("No default option for", skinName)
		end
		E.Options.args.skins.args.addons.args[skinName] = AS:GenerateOptionTable(skinName,order)
		order = order + 1
	end
end
