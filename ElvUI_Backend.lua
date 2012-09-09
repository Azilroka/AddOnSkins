-- Backend for ElvUI

if not IsAddOnLoaded("ElvUI") then return end

local E, L, V, P, G,_ = unpack(ElvUI)
local XS=E:NewModule('ExtraSkins','AceTimer-3.0','AceEvent-3.0')

XS.skins = {}
XS.events = {}
XS.register = {}

P["skins"] = {
	["RecountBackdrop"] = true,
	["SkadaBackdrop"] = true,
	["ACPSkin"] = true,
	["AdiBagsSkin"] = true,
	["AltoholicSkin"] = true,
	["ArchySkin"] = true,
	["ArkInventorySkin"] = true,
	["AtlasLootSkin"] = true,
	["ATSWSkin"] = true,
	["AuctionatorSkin"] = true,
	["AuctioneerSkin"] = true,
	["BPTSkin"] = true,
	["BigWigsSkin"] = true,
	["BGDefenderSkin"] = true,
	["BuyEmAllSkin"] = true,
	["ChocolateBarSkin"] = true,
	["CliqueSkin"] = true,
	["CLCInfoSkin"] = true,
	["CLCProtSkin"] = true,
	["CLCRetSkin"] = true,
	["DBMSkin"] = true,
	["DBMSkinHalf"] = false,
	["DXESkin"] = false,
	["EasyMailSkin"] = true,
	["EnergyWatchSkin"] = true,
	["ExtVendorSkin"] = true,
	["FactionizerSkin"] = true,
	["FlightMapSkin"] = true,
	["KarniCrapSkin"] = true,
	["LightheadedSkin"] = true,
	["LootCouncilLiteSkin"] = true,
	["MageNuggetsSkin"] = true,
	["MasterLootManagerRemixSkin"] = true,
	["MinimalArchaeologySkin"] = true,
	["MoveAnythingSkin"] = true,
	["MRTSkin"] = true,
	["MyRolePlaySkin"] = true,
	["OdysseySkin"] = true,
	["OgriLazySkin"] = true,
	["OmenSkin"] = true,	
	["OutfitterSkin"] = true,
	["PlayerScoreSkin"] = true,
	["PoisonerSkin"] = true,
	["PoMTackerSkin"] = true,
	["PostalSkin"] = true,
	["PowerAurasSkin"] = true,
	["PowerAurasIconsSkin"] = true,
	["ProfessionTabsSkin"] = true,
	["QuartzSkin"] = true,
	["RaidInviteOrganizerSkin"] = true,
	["RaidBuffStatusSkin"] = true,
	["RecountSkin"] = true,
	["EmbedRecount"] = false,
	["SearingPlasmaTrackerSkin"] = true,
	["SkadaSkin"] = true,
	["EmbedSkada"] = false,
	["SkilletSkin"] = true,
	["SpineCounterSkin"] = true,
	["SpySkin"] = true,
	["stAddonManagerSkin"] = true,
	["SwatterSkin"] = true,
	["TellMeWhenSkin"] = true,
	["TinyDPSSkin"] = true,
	["TitanPanelSkin"] = true,
	["WeakAuraSkin"] = true,
	["WowLuaSkin"] = true,
	["ZygorSkin"] = true,
	["UISkinMinimap"] = true,
	["LootConfirmer"] = true,
	["EmbedOoC"] = false,
}

function XS:Initialize()
	if self.frame then return end -- In case this gets called twice as can sometimes happen with ElvUI

	for skin,data in pairs(self.register) do
		self:RegisterSkin(skin,data.func,data.events)
	end
	local f = CreateFrame("Frame",nil)
	f:RegisterEvent("PLAYER_ENTERING_WORLD")
	f:SetScript("OnEvent", function(self,event)
		if event == "PLAYER_ENTERING_WORLD" then
			for skin,func in pairs(XS.skins) do
				if cCheckOption(skin) then func(f,event) end
			end
		else
			for skin,func in pairs(XS.skin) do
				if XS.events[skin] then
					func(f,event)
				end
			end
		end
	end)

	self.frame = f

	self:GenerateOptions()
end

function XS:RegisterSkin(skinName,func,...)
	local events = ...
	self.skins[skinName] = func
	for i = 1,#events do
		local event = select(i,events)
		if not self.events[event] then self.frame:RegisterEvent(event); self.events[event] = {} end
		self.events[event][skinName] = true
	end
end

function XS:UnregisterEvent(skinName,event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end

	self.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self.frame:UnregisterEvent(event)
	end
end

local Skins = {
	["ACPSkin"] = {
		["text"] = "Addon Control Panel",
		["addon"] = "ACP"
	},
	["AdiBagsSkin"] = {
		["addon"] = "AdiBags",
	},
	["AltoholicSkin"] = {
		["addon"] = "Altoholic",
	},
	["ArchySkin"] = {
		["addon"] = "Archy"
	},
	["ArkInventorySkin"] = {
		["addon"] = "ArkInventory"
	},
	["AtlasLootSkin"] = {
		["text"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader"
	},
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow"
	},
	["AuctionatorSkin"] = {
		["addon"] = "Auctionator"
	},
	["AuctioneerSkin"] = {
		["text"] = "Auctioneer",
		["addon"] = "Auc-Advanced"
	},
	["BPTSkin"] = {
		["text"] = "Balance Power Tracker",
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
	["CliqueSkin"] = {
		["addon"] = "Clique"
	},
	["DBMSkin"] = {
		["text"] = "DBM",
		["addon"] = "DBM-Core"
	},
	["EasyMailSkin"] = {
		["addon"] = "EasyMail"
	},
	["EnergyWatchSkin"] = {
		["addon"] = "EnergyWatch"
	},
	["ExtVendorSkin"] = {
		["text"] = "Extended Vendor",
		["addon"] = "ExtVendor"
	},
	["FactionizerSkin"] = {
		["addon"] = "Factionizer"
	},
	["FlightMapSkin"] = {
		["addon"] = "FlightMap"
	},
	["KarniCrapSkin"] = {
		["text"] = "Karni's Crap Filter",
		["addon"] = "KarniCrap"
	},
	["LightheadedSkin"] = {
		["addon"] = "Lightheaded"
	},
	["LootCouncilLiteSkin"] = {
		["text"] = "LootCouncilLite",
		["addon"] = "LootCouncil_Lite"
	},
	["MageNuggetsSkin"] = {
		["addon"] = "MageNuggests"
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
		["text"] = "Mizus Raid Tracker",
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
		["addon"] = "PowerAuras"
	},
	["QuartzSkin"] = {
		["addon"] = "Quartz"
	},
	["RaidInviteOrganizerSkin"] = {
		["text"] = "Raid Invite Organizer",
		["addon"] = "RaidInviteOrganizer"
	},
	["RaidBuffStatusSkin"] = {
		["text"] = "Raid Buff Status",
		["addon"] = "RaidBuffStatus"
	},
	["RecountSkin"] = {
		["addon"] = "Recount"
	},
	["SearingPlasmaTrackerSkin"] = {
		["text"] = "Searing Plasma Tracker",
		["addon"] = "SearingPlasmaTracker"
	},
	["SkadaSkin"] = {
		["addon"] = "Skada"
	},
	["SkilletSkin"] = {
		["addon"] = "Skillet"
	},
	["SpineCounterSkin"] = {
		["text"] = "Spine Blood Counter",
		["addon"] = "SpineCounter"
	},
	["SpySkin"] = {
		["addon"] = "Spy"
	},
	["stAddonManagerSkin"] = {
		["text"] = "stAddonManager",
		["addon"] = "stAddonmanager"
	},
	["SwatterSkin"] = {
		["text"] = "Swatter",
		["addon"] = "!Swatter"
	},
	["TellMeWhenSkin"] = {
		["addon"] = "TellMeWhen"
	},
	["TinyDPSSkin"] = {
		["addon"] = "TinyDPS"
	},
	["TitanPanelSkin"] = {
		["text"] = "TitanPanel",
		["addon"] = "Titan"
	},
	["WowLuaSkin"] = {
		["addon"] = "WowLua"
	},
	["ZygorSkin"] = {
		["text"] = "Zygor",
		["addon"] = "ZygorGuidesViewer"
	},
	["LootConfirmer"] = {
		["text"] = "Loot Confirm"
	},
	["UISkinMinimap"] = {
		["text"] = "Square Minimap Buttons"
	},
	["DBMSkinHalf"] = {
		["text"] = "DBM Half-Bar Skin"
	},
	["CLCInfoSkin"] = {
		["addon"] = "CLCInfo"
	},
	["CLCProtSkin"] = {
		["addon"] = "CLCProt"
	},
	["CLCRetSkin"] = {
		["addon"] = "CLCRet"
	},
	["PowerAurasIconsSkin"] = {
		["text"] = "PowerAuras Icon's",
		["addon"] = "PowerAuras"
	},
	["WeakAurasIconsSkin"] = {
		["text"] = "WeakAuras Icon's",
		["addon"] = "WeakAuras"
	},
}

function XS:GenerateOptionTable(skinName,order)
	local data = Skins[skinName]
	local addon = data.addon
	local text = data.text or addon
	local options = {
		type = 'toggle',
		name = text,
		desc = L['TOGGLESKIN_DESC'],
		order = order,
		disabled = function() if addon then return not IsAddOnLoaded(addon) else return false end end,
	}
	return options
end

function XS:GenerateOptions()
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
	E.Options.args.skins.args.addonSkins = {
		order = 10,
		type = 'group',
		name = 'AddOns',
		get = function(info) return E.db.skins[ info[#info] ] end,
		set = function(info,value)  E.db.skins[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
		args = {
			desc = {
				type = 'description',
				name = 'AddOn Skins by Azilroka & Sortokk',
				order = 1
			}
		}
	}
	local order = 2
	for skinName,_ in pairsByKeys(Skins) do
		E.Options.args.skins.args.addonSkins.args[skinName] = self:GenerateOptionTable(skinName,order)
		order = order + 1
	end
end

E:RegisterModule(XS:GetName())
