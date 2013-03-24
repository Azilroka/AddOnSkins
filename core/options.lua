local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local Skins = {
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
		["addon"] = "ACP",
	},
	["AdiBagsSkin"] = {
		["addon"] = "AdiBags",
	},
	["AffDotsSkin"] = {
		["addon"] = "AffDots",
	},
	["AltoholicSkin"] = {
		["addon"] = "Altoholic",
	},
	["AnalystSkin"] = {
		["addon"] = "Analyst",
	},
	["AraBrokerGuildFriendsSkin"] = {
		["buttonText"] = "Ara Broker Guild Friends",
		["addon"] = "Ara_Broker_Guild_Friends",
	},
	["AraBrokerTradeskillsSkin"] = {
		["buttonText"] = "Ara Broker Tradeskills",
		["addon"] = "Ara_Broker_Tradeskills",
	},
	["ArchySkin"] = {
		["addon"] = "Archy",
	},
	['ArhSkin'] = {
		["buttonText"] = "Archaeology Helper",
		["addon"] = "Arh",
	},
	["ArkInventorySkin"] = {
		["addon"] = "ArkInventory",
	},
	["AtlasLootSkin"] = {
		["buttonText"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader",
	},
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow",
	},
	["AuctionatorSkin"] = {
		["addon"] = "Auctionator",
	},
	["AuctioneerSkin"] = {
		["buttonText"] = "Auctioneer",
		["addon"] = "Auc-Advanced",
	},
	["AuctionLiteSkin"] = {
		["addon"] = "AuctionLite",
	},
	["BagnonSkin"] = {
		["addon"] = "Bagnon",
	},
	["BGDefenderSkin"] = {
		["addon"] = "BGDefender",
	},
	["BigBrotherSkin"] = {
		["addon"] = "BigBrother",
	},
	["BPTSkin"] = {
		["buttonText"] = "Balance Power Tracker",
		["addon"] = "BalancePowerTracker",
	},
	["BuyEmAllSkin"] = {
		["addon"] = "BuyEmAll",
	},
	["CliqueSkin"] = {
		["addon"] = "Clique",
	},
	["CombustionHelperSkin"] = {
		["addon"] = "CombustionHelper",
	},
	["CoolLineSkin"] = {
		["addon"] = "CoolLine",
	},
	["CorkSkin"] = {
		["addon"] = "Cork",
	},
	["CritlineSkin"] = {
		["addon"] = "Critline",
	},
	["DBMSkin"] = {
		["buttonText"] = "DBM",
		["addon"] = "DBM-Core",
	},
	["DresserSkin"] = {
		["addon"] = "Dresser",
	},
	["EasyMailSkin"] = {
		["addon"] = "EasyMail",
	},
	["EavesDropSkin"] = {
		["addon"] = "EavesDrop",
	},
	["EnergyWatchSkin"] = {
		["addon"] = "EnergyWatch",
	},
	["ExaminerSkin"] = {
		["addon"] = "Examiner",
	},
	["ExtVendorSkin"] = {
		["buttonText"] = "Extended Vendor",
		["addon"] = "ExtVendor",
	},
	["EveryGoldToBankerSkin"] = {
		["addon"] = "EveryGoldToBanker",
	},
	["FactionizerSkin"] = {
		["addon"] = "Factionizer",
	},
	["FlightMapSkin"] = {
		["addon"] = "FlightMap",
	},
	["FlightMapEnhancedSkin"] = {
		["addon"] = "FlightMapEnhanced",
	},
	["GuildMemberInfo_TradeSkillsSkin"] = {
		["addon"] = "GuildMemberInfo_TradeSkills",
	},
	["GupPetSkin"] = {
		["addon"] = "GupPet",
	},
	["HealiumSkin"] = {
		["addon"] = "Healium",
	},
	["IncomingSkin"] = {
		["addon"] = "Incoming",
	},
	["InspectEquipSkin"] = {
		["addon"] = "InspectEquip",
	},
	["KarniCrapSkin"] = {
		["buttonText"] = "Karni's Crap Filter",
		["addon"] = "KarniCrap",
	},
	["LightheadedSkin"] = {
		["addon"] = "Lightheaded",
	},
	["LinkWranglerSkin"] = {
		["addon"] = "LinkWrangler",
	},
	["LootCouncilLiteSkin"] = {
		["buttonText"] = "LootCouncilLite",
		["addon"] = "LootCouncil_Lite",
	},
	["MageNuggetsSkin"] = {
		["addon"] = "MageNuggets",
	},
	["MasterLootManagerRemixSkin"] = {
		["addon"] = "MasterLootManagerRemix",
	},
	["MinimalArchaeologySkin"] = {
		["addon"] = "MinimalArchaeology",
	},
	["MogItSkin"] = {
		["addon"] = "MogIt",
	},
	["MoveAnythingSkin"] = {
		["addon"] = "MoveAnything",
	},
	["MRTSkin"] = {
		["buttonText"] = "Mizus Raid Tracker",
		["addon"] = "MizusRaidTracker",
	},
	["MyRolePlaySkin"] = {
		["addon"] = "MyRolePlay",
	},
	["NumerationSkin"] = {
		["addon"] = "Numeration",
	},
	["OdysseySkin"] = {
		["addon"] = "Odyssey",
	},
	["OgriLazySkin"] = {
		["addon"] = "Ogri'Lazy",
	},
	["OmenSkin"] = {
		["addon"] = "Omen",
	},
	["OneClickEnchantScrollSkin"] = {
		["addon"] = "OneClickEnchantScroll",
	},
	["OutfitterSkin"] = {
		["addon"] = "Outfitter",
	},
	["OvaleSkin"] = {
		["addon"] = "Ovale",
	},
	["PetBattleTeamsSkin"] = {
		["addon"] = "PetBattleTeams",
	},
	["PetTrackerSkin"] = {
		["addon"] = "PetTracker",
	},
	["PoMTrackerSkin"] = {
		["addon"] = "PoMTracker",
	},
	["PostalSkin"] = {
		["addon"] = "Postal",
	},
	["QuartzSkin"] = {
		["addon"] = "Quartz",
	},
	["QuestCompletistSkin"] = {
		["addon"] = "QuestCompletist",
	},
	["QuestItemBarSkin"] = {
		["addon"] = "QuestItemBar",
	},
	["RaidInviteOrganizerSkin"] = {
		["buttonText"] = "Raid Invite Organizer",
		["addon"] = "RaidInviteOrganizer",
	},
	["RaidBuffStatusSkin"] = {
		["buttonText"] = "Raid Buff Status",
		["addon"] = "RaidBuffStatus",
	},
	["RavenSkin"] = {
		["addon"] = "Raven",
	},
	["RecountSkin"] = {
		["addon"] = "Recount",
	},
	["ReforgenatorSkin"] = {
		["addon"] = "Reforgenator",
	},
	["SearingPlasmaTrackerSkin"] = {
		["buttonText"] = "Searing Plasma Tracker",
		["addon"] = "SearingPlasmaTracker",
	},
	["SexyCooldownSkin"] = {
		["buttonText"] = "SexyCooldown 2",
		["addon"] = "SexyCooldown2",
	},
	["ShieldBarsSkin"] = {
		["addon"] = "ShieldBars",
	},
	["ShieldMonitorSkin"] = {
		["buttonText"] = "Shield Monitor",
		["addon"] = "shieldmonitor",
	},
	["SkadaSkin"] = {
		["addon"] = "Skada",
	},
	["SkilletSkin"] = {
		["addon"] = "Skillet",
	},
	["SoundtrackSkin"] = {
		["addon"] = "Soundtrack",
	},
	["SpineCounterSkin"] = {
		["buttonText"] = "Spine Blood Counter",
		["addon"] = "SpineCounter",
	},
	["SpySkin"] = {
		["addon"] = "Spy",
	},
	["SwatterSkin"] = {
		["buttonText"] = "Swatter",
		["addon"] = "!Swatter",
	},
	["SymbiosisTipSkin"] = {
		["addon"] = "SymbiosisTip",
	},
	["TinyDPSSkin"] = {
		["addon"] = "TinyDPS",
	},
	["TomTomSkin"] = {
		["addon"] = "TomTom",
	},
	["TradeSkillDWSkin"] = {
		["addon"] = "TradeSkillDW",
	},
	["VengeanceStatusSkin"] = {
		["addon"] = "VengeanceStatus",
	},
	["WhollySkin"] = {
		["addon"] = "Wholly",
	},
	["WowLuaSkin"] = {
		["addon"] = "WowLua",
	},
	["WoWProSkin"] = {
		["addon"] = "WowPro",
	},
	["xMerchantSkin"] = {
		["addon"] = "xMerchant",
	},
	["ZygorSkin"] = {
		["buttonText"] = "Zygor",
		["addon"] = "ZygorGuidesViewer",
	},
	["DBMSkinHalf"] = {
		["buttonText"] = "DBM Half-Bar Skin",
		["addon"] = "DBM-Core",
		["ui"] = "ElvUI",
	},
	["CLCInfoSkin"] = {
		["buttonText"] = "CLCInfo Icons",
		["addon"] = "CLCInfo",
		["ui"] = "ElvUI",
	},
	["CLCProtSkin"] = {
		["buttonText"] = "CLCProt Icons",
		["addon"] = "CLCProt",
		["ui"] = "ElvUI",
	},
	["CLCRetSkin"] = {
		["buttonText"] = "CLCRet Icons",
		["addon"] = "CLCRet",
		["ui"] = "ElvUI",
	},
	["WeakAurasSkin"] = {
		["buttonText"] = "WeakAuras Icons",
		["addon"] = "WeakAuras",
		["ui"] = "ElvUI",
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
	for skinName,_ in pairsByKeys(Skins) do
		if not V.skins.addons[skinName] == nil then
			print("No default option for", skinName)
		end
		E.Options.args.skins.args.addons.args[skinName] = AS:GenerateOptionTable(skinName,order)
		order = order + 1
	end
end
