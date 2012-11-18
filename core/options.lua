local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local Skins = {
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
		["addon"] = "ACP",
	},
	["AdiBagsSkin"] = {
		["buttonText"] = "AdiBags",
		["addon"] = "AdiBags",
	},
	["AltoholicSkin"] = {
		["addon"] = "Altoholic",
	},
	["AraBrokerGuildFriendsSkin"] = {
		["buttonText"] = "Ara Broker Guild Friends",
		["addon"] = "Ara_Broker_Guild_Friends"
	},
	["ArchySkin"] = {
		["addon"] = "Archy"
	},
	['ArhSkin'] = {
		["buttonText"] = "ArchaeologyHelper",
		["addon"] = "Arh"
	},
	["ArkInventorySkin"] = {
		["addon"] = "ArkInventory"
	},
	["AtlasLootSkin"] = {
		["buttonText"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader"
	},
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow"
	},
	["AuctionatorSkin"] = {
		["addon"] = "Auctionator"
	},
	["AuctioneerSkin"] = {
		["buttonText"] = "Auctioneer",
		["addon"] = "Auc-Advanced"
	},
	["BPTSkin"] = {
		["buttonText"] = "Balance Power Tracker",
		["addon"] = "BalancePowerTracker"
	},
	["BGDefenderSkin"] = {
		["addon"] = "BGDefender"
	},
	["BigWigsSkin"] = {
		["addon"] = "BigWigs"
	},
	["BuyEmAllSkin"] = {
		["addon"] = "BuyEmAll"
	},
	["CLCInfoSkin"] = {
		["addon"] = "CLCInfo",
		["ui"] = "ElvUI"
	},
	["CLCProtSkin"] = {
		["addon"] = "CLCProt",
		["ui"] = "ElvUI"
	},
	["CLCRetSkin"] = {
		["addon"] = "CLCRet",
		["ui"] = "ElvUI"
	},
	["CliqueSkin"] = {
		["addon"] = "Clique"
	},
	["DBMSkin"] = {
		["buttonText"] = "DBM",
		["addon"] = "DBM-Core"
	},
	["EasyMailSkin"] = {
		["addon"] = "EasyMail"
	},
	["EnergyWatchSkin"] = {
		["addon"] = "EnergyWatch"
	},
	["ExtVendorSkin"] = {
		["buttonText"] = "Extended Vendor",
		["addon"] = "ExtVendor"
	},
	["FactionizerSkin"] = {
		["addon"] = "Factionizer"
	},
	["FlightMapSkin"] = {
		["addon"] = "FlightMap"
	},
	["IncomingSkin"] = {
		["addon"] = "Incoming"
	},
	["KarniCrapSkin"] = {
		["buttonText"] = "Karni's Crap Filter",
		["addon"] = "KarniCrap"
	},
	["LightheadedSkin"] = {
		["addon"] = "Lightheaded"
	},
	["LootCouncilLiteSkin"] = {
		["buttonText"] = "LootCouncilLite",
		["addon"] = "LootCouncil_Lite"
	},
	["MageNuggetsSkin"] = {
		["addon"] = "MageNuggets"
	},
	["MasterLootManagerRemixSkin"] = {
		["addon"] = "MasterLootManagerRemix"
	},
	["MinimalArchaeologySkin"] = {
		["addon"] = "MinimalArchaeology"
	},
	["MoveAnythingSkin"] = {
		["addon"] = "MoveAnything"
	},
	["MRTSkin"] = {
		["buttonText"] = "Mizus Raid Tracker",
		["addon"] = "MizusRaidTracker"
	},
	["MyRolePlaySkin"] = {
		["addon"] = "MyRolePlay"
	},
	["OdysseySkin"] = {
		["addon"] = "Odyssey"
	},
	["OgriLazySkin"] = {
		["addon"] = "Ogri'Lazy"
	},
	["OmenSkin"] = {
		["addon"] = "Omen"
	},
	["OutfitterSkin"] = {
		["addon"] = "Outfitter"
	},
	["PoMTrackerSkin"] = {
		["addon"] = "PoMTracker"
	},
	["PostalSkin"] = {
		["addon"] = "Postal"
	},
	["PowerAurasSkin"] = {
		["addon"] = "PowerAuras",
	},
	["PowerAurasIconsSkin"] = {
		["buttonText"] = "PowerAuras Icons",
		["addon"] = "PowerAuras",
		["ui"] = "ElvUI"
	},
	["QuartzSkin"] = {
		["addon"] = "Quartz"
	},
	["RaidInviteOrganizerSkin"] = {
		["buttonText"] = "Raid Invite Organizer",
		["addon"] = "RaidInviteOrganizer"
	},
	["RaidBuffStatusSkin"] = {
		["buttonText"] = "Raid Buff Status",
		["addon"] = "RaidBuffStatus"
	},
	["RecountSkin"] = {
		["addon"] = "Recount"
	},
	["ReforgenatorSkin"] = {
		["addon"] = "Reforgenator"
	},
	["SearingPlasmaTrackerSkin"] = {
		["buttonText"] = "Searing Plasma Tracker",
		["addon"] = "SearingPlasmaTracker"
	},
	["SexyCooldownSkin"] = {
		["buttonText"] = "SexyCooldown",
		["addon"] = "SexyCooldown2"
	},
	["SkadaSkin"] = {
		["addon"] = "Skada"
	},
	["SkilletSkin"] = {
		["addon"] = "Skillet"
	},
	["SpineCounterSkin"] = {
		["buttonText"] = "Spine Blood Counter",
		["addon"] = "SpineCounter"
	},
	["SpySkin"] = {
		["addon"] = "Spy"
	},
	["SwatterSkin"] = {
		["buttonText"] = "Swatter",
		["addon"] = "!Swatter"
	},
	["TellMeWhenSkin"] = {
		["addon"] = "TellMeWhen"
	},
	["TinyDPSSkin"] = {
		["addon"] = "TinyDPS"
	},
	["TradeSkillDWSkin"] = {
		["addon"] = "TradeSkillDW"
	},
	["WeakAurasSkin"] = {
		["addon"] = "WeakAuras",
		["ui"] = "ElvUI",
	},
	["WhollySkin"] = {
		["addon"] = "Wholly",
	},
	["WowLuaSkin"] = {
		["addon"] = "WowLua"
	},
	["ZygorSkin"] = {
		["buttonText"] = "Zygor",
		["addon"] = "ZygorGuidesViewer"
	},
	["PetBattleTeamsSkin"] = {
		["buttonText"] = "PetBattleTeams",
		["addon"] = "PetBattleTeams"
	},
	["BagnonSkin"] = {
		["addon"] = "Bagnon",
	},
	["VengeanceStatusSkin"] = {
		["addon"] = "VengeanceStatus",
	},
	["TomTomSkin"] = {
		["addon"] = "TomTom",
	},
	["ShieldMonitorSkin"] = {
		["buttonText"] = "Shield Monitor",
		["addon"] = "shieldmonitor",
	},
}

AS.Skins = Skins
function AS:GenerateOptionTable(skinName,order)
	local data = Skins[skinName]
	local addon = data.addon
	local text = data.buttonText or addon
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
		set = function(info, value) E.private.skins.adoons.enable = value; E:StaticPopup_Show("PRIVATE_RL") end,
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
				name = 'AddOn Skins by Sortokk (based on work by Azilroka) - v'..self.Version,
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
					EmbedRecount = {
						type = 'toggle',
						name = 'Recount',
						desc = L['TOGGLESKIN_DESC'],
						order = 2,
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
					}
				}
			}
		}
	}

	local order = 2
	for skinName,_ in pairsByKeys(Skins) do
		E.Options.args.skins.args.addons.args[skinName] = self:GenerateOptionTable(skinName,order)
		order = order + 1
	end
end
