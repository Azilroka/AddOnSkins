-- Shared backend for both UIs
if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end

local addon = select(1,...)
local U = unpack(select(2,...))

U.Version = GetAddOnMetadata(addon,"Version")

U.Skins = {
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
		["addon"] = "ACP",
	},
	["AdiBagsSkin"] = {
		["buttonText"] = "AdiBags : Disabled",
		["addon"] = "BROKENPIECEOFSHIT",
	},
	["AltoholicSkin"] = {
		["addon"] = "Altoholic",
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
	["PoisonerSkin"] = {
		["addon"] = "Poisoner"
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
	["stAddonManagerSkin"] = {
		["buttonText"] = "stAddonManager",
		["addon"] = "stAddonmanager"
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
}