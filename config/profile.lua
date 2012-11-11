local E, L, V, P, G,_ = unpack(ElvUI)
local XS = E:GetModule('ExtraSkins')

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
	["ChocolateBarSkin"] = {
		["addon"] = "ChocolateBar"
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
	--["PoisonerSkin"] = {
	--	["addon"] = "Poisoner"
	--},
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
	["TitanPanelSkin"] = {
		["buttonText"] = "TitanPanel",
		["addon"] = "Titan"
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
}

XS.Skins = Skins

local exceptions = {
	"EmbedOoC", 
	"EmbedRecount", 
	"EmbedSkada", 
	"EmbedOmen", 
	"EmbedRO", 
	"EmbedTDPS", 
	"EmbedSexyCooldown"
}

P["skins"] = {
	["DBMSkinHalf"] = false,
	["RecountBackdrop"] = true,
	["SkadaBackdrop"] = true,
}

for k, _ in pairs(Skins) do
	P.skins[k] = true
end

for k, _ in pairs(exceptions) do
	P.skins[k] = false
end
