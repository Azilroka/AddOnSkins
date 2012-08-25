if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
UISkinOptions = {}
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

local DefaultSetSkin = CreateFrame("Frame")
	DefaultSetSkin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	DefaultSetSkin:SetScript( "OnEvent", function(self)
	if(UISkinOptions.ACPSkin == nil) then UISkinOptions.ACPSkin = "Enabled" end
	if(UISkinOptions.AdiBagsSkin == nil) then UISkinOptions.AdiBagsSkin = "Enabled" end
	if(UISkinOptions.AltoholicSkin == nil) then UISkinOptions.AltoholicSkin = "Enabled" end
	if(UISkinOptions.ArchySkin == nil) then UISkinOptions.ArchySkin = "Enabled" end
	if(UISkinOptions.ArkInventorySkin == nil) then UISkinOptions.ArkInventorySkin = "Enabled" end
	if(UISkinOptions.AtlasLootSkin == nil) then UISkinOptions.AtlasLootSkin = "Enabled" end
	if(UISkinOptions.ATSWSkin == nil) then UISkinOptions.ATSWSkin = "Enabled" end
	if(UISkinOptions.AuctionatorSkin == nil) then UISkinOptions.AuctionatorSkin = "Enabled" end
	if(UISkinOptions.AuctioneerSkin == nil) then UISkinOptions.AuctioneerSkin = "Enabled" end
	if(UISkinOptions.BigWigsSkin == nil) then UISkinOptions.BigWigsSkin = "Enabled" end
	if(UISkinOptions.BGDefenderSkin == nil) then UISkinOptions.BGDefenderSkin = "Enabled" end
	if(UISkinOptions.BuyEmAllSkin == nil) then UISkinOptions.BuyEmAllSkin = "Enabled" end
	if(UISkinOptions.ChocolateBarSkin == nil) then UISkinOptions.ChocolateBarSkin = "Enabled" end
	if(UISkinOptions.CliqueSkin == nil) then UISkinOptions.CliqueSkin = "Enabled" end
	if(UISkinOptions.CLCInfoSkin == nil) then UISkinOptions.CLCInfoSkin = "Enabled" end
	if(UISkinOptions.CLCProtSkin == nil) then UISkinOptions.CLCProtSkin = "Enabled" end
	if(UISkinOptions.CLCRetSkin == nil) then UISkinOptions.CLCRetSkin = "Enabled" end
	if(UISkinOptions.DBMSkin == nil) then UISkinOptions.DBMSkin = "Disabled" end
	if(UISkinOptions.DXESkin == nil) then UISkinOptions.DXESkin = "Disabled" end
	if(UISkinOptions.EasyMailSkin == nil) then UISkinOptions.EasyMailSkin = "Enabled" end
	if(UISkinOptions.EnergyWatchSkin == nil) then UISkinOptions.EnergyWatchSkin = "Enabled" end
	if(UISkinOptions.ExtVendorSkin == nil) then UISkinOptions.ExtVendorSkin = "Enabled" end
	if(UISkinOptions.FactionizerSkin == nil) then UISkinOptions.FactionizerSkin = "Enabled" end
	if(UISkinOptions.KarniCrapSkin == nil) then UISkinOptions.KarniCrapSkin = "Enabled" end
	if(UISkinOptions.LightheadedSkin == nil) then UISkinOptions.LightheadedSkin = "Enabled" end
	if(UISkinOptions.LootCouncilLiteSkin == nil) then UISkinOptions.LootCouncilLiteSkin = "Enabled" end
	if(UISkinOptions.MageNuggetsSkin == nil) then UISkinOptions.MageNuggetsSkin = "Enabled" end
	if(UISkinOptions.MasterLootManagerRemixSkin == nil) then UISkinOptions.MasterLootManagerRemixSkin = "Enabled" end
	if(UISkinOptions.MinimalArchaeologySkin == nil) then UISkinOptions.MinimalArchaeologySkin = "Enabled" end
	if(UISkinOptions.MoveAnythingSkin == nil) then UISkinOptions.MoveAnythingSkin = "Enabled" end
	if(UISkinOptions.MRTSkin == nil) then UISkinOptions.MRTSkin = "Enabled" end
	if(UISkinOptions.OdysseySkin == nil) then UISkinOptions.OdysseySkin = "Enabled" end
	if(UISkinOptions.OgriLazySkin == nil) then UISkinOptions.OgriLazySkin = "Enabled" end
	if(UISkinOptions.OmenSkin == nil) then UISkinOptions.OmenSkin = "Disabled" end	
	if(UISkinOptions.OutfitterSkin == nil) then UISkinOptions.OutfitterSkin = "Enabled" end
	if(UISkinOptions.PlayerScoreSkin == nil) then UISkinOptions.PlayerScoreSkin = "Enabled" end
	if(UISkinOptions.PoisonerSkin == nil) then UISkinOptions.PoisonerSkin = "Enabled" end
	if(UISkinOptions.PoMTackerSkin == nil) then UISkinOptions.PoMTrackerSkin = "Enabled" end
	if(UISkinOptions.PostalSkin == nil) then UISkinOptions.PostalSkin = "Enabled" end
	if(UISkinOptions.PowerAurasSkin == nil) then UISkinOptions.PowerAurasSkin = "Enabled" end
	if(UISkinOptions.PowerAurasIconsSkin == nil) then UISkinOptions.PowerAurasIconsSkin = "Enabled" end
	if(UISkinOptions.ProfessionTabsSkin == nil) then UISkinOptions.ProfessionTabsSkin = "Enabled" end
	if(UISkinOptions.QuartzSkin == nil) then UISkinOptions.QuartzSkin = "Enabled" end
	if(UISkinOptions.RaidInviteOrganizerSkin == nil) then UISkinOptions.RaidInviteOrganizerSkin = "Enabled" end
	if(UISkinOptions.RaidBuffStatusSkin == nil) then UISkinOptions.RaidBuffStatusSkin = "Enabled" end
	if(UISkinOptions.RecountSkin == nil) then UISkinOptions.RecountSkin = "Disabled" end
	if(UISkinOptions.RecountBackdrop == nil) then UISkinOptions.RecountBackdrop = "Enabled" end
	if(UISkinOptions.SearingPlasmaTrackerSkin == nil) then UISkinOptions.SearingPlasmaTrackerSkin = "Enabled" end
	if(UISkinOptions.SkadaSkin == nil) then UISkinOptions.SkadaSkin = "Disabled" end
	if(UISkinOptions.SkadaBackdrop == nil) then UISkinOptions.SkadaBackdrop = "Enabled" end
	if(UISkinOptions.SkilletSkin == nil) then UISkinOptions.SkilletSkin = "Enabled" end
	if(UISkinOptions.SpineCounterSkin == nil) then UISkinOptions.SpineCounterSkin = "Enabled" end
	if(UISkinOptions.SpySkin == nil) then UISkinOptions.SpySkin = "Enabled" end
	if(UISkinOptions.stAddonManagerSkin == nil) then UISkinOptions.stAddonManagerSkin = "Enabled" end
	if(UISkinOptions.SwatterSkin == nil) then UISkinOptions.SwatterSkin = "Enabled" end
	if(UISkinOptions.TellMeWhenSkin == nil) then UISkinOptions.TellMeWhenSkin = "Enabled" end
	if(UISkinOptions.TinyDPSSkin == nil) then UISkinOptions.TinyDPSSkin = "Disabled" end
	if(UISkinOptions.TitanPanelSkin == nil) then UISkinOptions.TitanPanelSkin = "Enabled" end
	if(UISkinOptions.WeakAuraSkin == nil) then UISkinOptions.WeakAuraSkin = "Enabled" end
	if(UISkinOptions.WowLuaSkin == nil) then UISkinOptions.WowLuaSkin = "Enabled" end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

local SkinOptions = CreateFrame("Frame", "SkinOptions", UIParent)
	SkinOptions:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinOptions:SetScript("OnEvent", function(self)
	if IsAddOnLoaded("Tukui") then UIFont = [[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]] UIFontSize = 12 end
	if IsAddOnLoaded("ElvUI") then UIFont = [[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]] UIFontSize = 12 end
	SkinOptions:Hide()
	SkinOptions:SetTemplate("Transparent")
	SkinOptions:Point("CENTER", UIParent, "CENTER", 0, 0)
	SkinOptions:SetFrameStrata("MEDIUM")
	SkinOptions:Width(648)
	SkinOptions:Height(490)
	SkinOptions:SetClampedToScreen(true)
	SkinOptions:SetMovable(true)
	SkinOptions.text = SkinOptions:CreateFontString(nil, "OVERLAY")
	SkinOptions.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions.text:SetPoint("TOP", SkinOptions, 0, -6)
	SkinOptions.text:SetText("|cffC495DDTukui|r & |cff1784d1ElvUI|r Extra Skin Options")
	SkinOptions:EnableMouse(true)
	SkinOptions:RegisterForDrag("LeftButton");
	SkinOptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
	SkinOptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	SkinOptions2 = CreateFrame("Frame", "SkinOptions2", SkinOptions)
	SkinOptions2:SetTemplate("Transparent")
	SkinOptions2:Point("TOPLEFT", SkinOptions, "TOPLEFT", -202, -130)
	SkinOptions2:SetFrameStrata("MEDIUM")
	SkinOptions2:Width(200)
	SkinOptions2:Height(240)

	ApplySkinSettingsButton = CreateFrame("Button", "ApplySkinSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	ApplySkinSettingsButton:SetPoint("BOTTOMLEFT", 0, -26)
	ApplySkinSettingsButton:Size(217,24)
	cSkinButton(ApplySkinSettingsButton)
	ApplySkinSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	ApplySkinSettingsButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ApplySkinSettingsButton.text:SetPoint("CENTER", ApplySkinSettingsButton, 0, 0)
	ApplySkinSettingsButton.text:SetText("Apply Skin Settings")
	ApplySkinSettingsButton:HookScript("OnClick", function() ReloadUI() end)

	EmbedWindowSettingsButton = CreateFrame("Button", "EmbedWindowSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	EmbedWindowSettingsButton:SetPoint("BOTTOM", 0, -26)
	EmbedWindowSettingsButton:Size(212,24)
	cSkinButton(EmbedWindowSettingsButton)
	EmbedWindowSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	EmbedWindowSettingsButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EmbedWindowSettingsButton.text:SetPoint("CENTER", EmbedWindowSettingsButton, 0, 0)
	EmbedWindowSettingsButton.text:SetText("Embedding Window Settings")
	EmbedWindowSettingsButton:HookScript("OnClick", function()
		if EmbeddingWindow:IsVisible() then
			EmbeddingWindow:Hide()
			print("Embedding Window is now |cffff2020Hidden|r.");
		else
			EmbeddingWindow:Show()
			print("Embedding Window is now |cff00ff00Shown|r.");
		end
	end)

	SkinOptionsCloseButton = CreateFrame("Button", "SkinOptionsCloseButton", SkinOptions, "UIPanelButtonTemplate")
	SkinOptionsCloseButton:SetPoint("BOTTOMRIGHT", 0, -26)
	SkinOptionsCloseButton:Size(217,24)
	cSkinButton(SkinOptionsCloseButton)
	SkinOptionsCloseButton.text = SkinOptionsCloseButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsCloseButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptionsCloseButton.text:SetPoint("CENTER", SkinOptionsCloseButton, 0, 0)
	SkinOptionsCloseButton.text:SetText("Close Skin Options")
	SkinOptionsCloseButton:HookScript("OnClick", function() SkinOptions:Hide() end)

--Buttons
	SkinOptionsButton = CreateFrame("Button", "SkinOptionsButton", GameMenuFrame, "GameMenuButtonTemplate")
	SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -1)
	SkinOptionsButton:Size(144,21)
	cSkinButton(SkinOptionsButton)
	SkinOptionsButton.text = SkinOptionsButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsButton.text:SetFont(UIFont, 12)
	SkinOptionsButton.text:SetPoint("CENTER", SkinOptionsButton, 0, 0)
	SkinOptionsButton.text:SetText("Skins")
	SkinOptionsButton:HookScript("OnClick", function() SkinOptions:Show() HideUIPanel(GameMenuFrame) end)

	GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -38)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)
	if IsAddOnLoaded("stAddonmanager") then  
		SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -23)
		GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -60)
	end

	ACPSkinButton = CreateFrame("Button", "ACPSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ACPSkinButton:SetPoint("TOPLEFT", 12, -30)
	ACPSkinButton:Size(200,20)
	cSkinButton(ACPSkinButton)
	ACPSkinButton.text = ACPSkinButton:CreateFontString(nil, "OVERLAY")
	ACPSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ACPSkinButton.text:SetPoint("CENTER", ACPSkinButton, 0, 0)
	if (UISkinOptions.ACPSkin == "Enabled") then ACPSkinButton.text:SetText("|cff00ff00Addon Control Panel|r") end
	if (UISkinOptions.ACPSkin == "Disabled") then ACPSkinButton.text:SetText("|cffff2020Addon Control Panel|r") end
	if not IsAddOnLoaded("ACP") then ACPSkinButton:Disable() ACPSkinButton.text:SetText("|cFF808080Addon Control Panel|r") end
	ACPSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ACPSkin == "Enabled") then
			UISkinOptions.ACPSkin = "Disabled"
			ACPSkinButton.text:SetText("|cffff2020Addon Control Panel|r")
		else
			UISkinOptions.ACPSkin = "Enabled"
			ACPSkinButton.text:SetText("|cff00ff00Addon Control Panel|r")
		end
	end)
	AdiBagsSkinButton = CreateFrame("Button", "AdiBagsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AdiBagsSkinButton:SetPoint("TOPLEFT", 12, -55)
	AdiBagsSkinButton:Size(200,20)
	cSkinButton(AdiBagsSkinButton)
	AdiBagsSkinButton.text = AdiBagsSkinButton:CreateFontString(nil, "OVERLAY")
	AdiBagsSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	AdiBagsSkinButton.text:SetPoint("CENTER", AdiBagsSkinButton, 0, 0)
	if (UISkinOptions.AdiBagsSkin == "Enabled") then AdiBagsSkinButton.text:SetText("|cff00ff00AdiBags|r") end
	if (UISkinOptions.AdiBagsSkin == "Disabled") then AdiBagsSkinButton.text:SetText("|cffff2020AdiBags|r") end
	if not IsAddOnLoaded("AdiBags") then AdiBagsSkinButton:Disable() AdiBagsSkinButton.text:SetText("|cFF808080AdiBags|r") end
	AdiBagsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AdiBagsSkin == "Enabled") then
			UISkinOptions.AdiBagsSkin = "Disabled"
			AdiBagsSkinButton.text:SetText("|cffff2020AdiBags|r")
		else
			UISkinOptions.AdiBagsSkin = "Enabled"
			AdiBagsSkinButton.text:SetText("|cff00ff00AdiBags|r")
		end
	end)
	AltoholicSkinButton = CreateFrame("Button", "AltoholicSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AltoholicSkinButton:SetPoint("TOPLEFT", 12, -80)
	AltoholicSkinButton:Size(200,20)
	cSkinButton(AltoholicSkinButton)
	AltoholicSkinButton.text = AltoholicSkinButton:CreateFontString(nil, "OVERLAY")
	AltoholicSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	AltoholicSkinButton.text:SetPoint("CENTER", AltoholicSkinButton, 0, 0)
	if (UISkinOptions.AltoholicSkin == "Enabled") then AltoholicSkinButton.text:SetText("|cff00ff00Altoholic|r") end
	if (UISkinOptions.AltoholicSkin == "Disabled") then AltoholicSkinButton.text:SetText("|cffff2020Altoholic|r") end
	if not IsAddOnLoaded("Altoholic") then AltoholicSkinButton:Disable() AltoholicSkinButton.text:SetText("|cFF808080Altoholic|r") end
	AltoholicSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AltoholicSkin == "Enabled") then
			UISkinOptions.AltoholicSkin = "Disabled"
			AltoholicSkinButton.text:SetText("|cffff2020Altoholic|r")
		else
			UISkinOptions.AltoholicSkin = "Enabled"
			AltoholicSkinButton.text:SetText("|cff00ff00Altoholic|r")
		end
	end)
	ArchySkinButton = CreateFrame("Button", "ArchySkinButton", SkinOptions, "UIPanelButtonTemplate")
	ArchySkinButton:SetPoint("TOPLEFT", 12, -105)
	ArchySkinButton:Size(200,20)
	cSkinButton(ArchySkinButton)
	ArchySkinButton.text = ArchySkinButton:CreateFontString(nil, "OVERLAY")
	ArchySkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ArchySkinButton.text:SetPoint("CENTER", ArchySkinButton, 0, 0)
	if (UISkinOptions.ArchySkin == "Enabled") then ArchySkinButton.text:SetText("|cff00ff00Archy|r") end
	if (UISkinOptions.ArchySkin == "Disabled") then ArchySkinButton.text:SetText("|cffff2020Archy|r") end
	if not IsAddOnLoaded("Archy") then ArchySkinButton:Disable() ArchySkinButton.text:SetText("|cFF808080Archy|r") end
	ArchySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ArchySkin == "Enabled") then
			UISkinOptions.ArchySkin = "Disabled"
			ArchySkinButton.text:SetText("|cffff2020Archy|r")
		else
			UISkinOptions.ArchySkin = "Enabled"
			ArchySkinButton.text:SetText("|cff00ff00Archy|r")
		end
	end)
	ArkInventorySkinButton = CreateFrame("Button", "ArkInventorySkinButton", SkinOptions, "UIPanelButtonTemplate")
	ArkInventorySkinButton:SetPoint("TOPLEFT", 12, -130)
	ArkInventorySkinButton:Size(200,20)
	cSkinButton(ArkInventorySkinButton)
	ArkInventorySkinButton.text = ArkInventorySkinButton:CreateFontString(nil, "OVERLAY")
	ArkInventorySkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ArkInventorySkinButton.text:SetPoint("CENTER", ArkInventorySkinButton, 0, 0)
	if (UISkinOptions.ArkInventorySkin == "Enabled") then ArkInventorySkinButton.text:SetText("|cff00ff00ArkInventory|r") end
	if (UISkinOptions.ArkInventorySkin == "Disabled") then ArkInventorySkinButton.text:SetText("|cffff2020ArkInventory|r") end
	if not IsAddOnLoaded("ArkInventory") then ArkInventorySkinButton:Disable() ArkInventorySkinButton.text:SetText("|cFF808080ArkInventory|r") end
	ArkInventorySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ArkInventorySkin == "Enabled") then
			UISkinOptions.ArkInventorySkin = "Disabled"
			ArkInventorySkinButton.text:SetText("|cffff2020ArkInventory|r")
		else
			UISkinOptions.ArkInventorySkin = "Enabled"
			ArkInventorySkinButton.text:SetText("|cff00ff00ArkInventory|r")
		end
	end)
	AtlasLootSkinButton = CreateFrame("Button", "AtlasLootSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AtlasLootSkinButton:SetPoint("TOPLEFT", 12, -155)
	AtlasLootSkinButton:Size(200,20)
	cSkinButton(AtlasLootSkinButton)
	AtlasLootSkinButton.text = AtlasLootSkinButton:CreateFontString(nil, "OVERLAY")
	AtlasLootSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	AtlasLootSkinButton.text:SetPoint("CENTER", AtlasLootSkinButton, 0, 0)
	if (UISkinOptions.AtlasLootSkin == "Enabled") then AtlasLootSkinButton.text:SetText("|cff00ff00AtlasLoot|r") end
	if (UISkinOptions.AtlasLootSkin == "Disabled") then AtlasLootSkinButton.text:SetText("|cffff2020AtlasLoot|r") end
	if not IsAddOnLoaded("AtlasLoot_Loader") then AtlasLootSkinButton:Disable() AtlasLootSkinButton.text:SetText("|cFF808080AtlasLoot|r") end
	AtlasLootSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AtlasLootSkin == "Enabled") then
			UISkinOptions.AtlasLootSkin = "Disabled"
			AtlasLootSkinButton.text:SetText("|cffff2020AtlasLoot|r")
		else
			UISkinOptions.AtlasLootSkin = "Enabled"
			AtlasLootSkinButton.text:SetText("|cff00ff00AtlasLoot|r")
		end
	end)
	ATSWSkinButton = CreateFrame("Button", "ATSWSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ATSWSkinButton:SetPoint("TOPLEFT", 12, -180)
	ATSWSkinButton:Size(200,20)
	cSkinButton(ATSWSkinButton)
	ATSWSkinButton.text = ATSWSkinButton:CreateFontString(nil, "OVERLAY")
	ATSWSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ATSWSkinButton.text:SetPoint("CENTER", ATSWSkinButton, 0, 0)
	if (UISkinOptions.ATSWSkin == "Enabled") then ATSWSkinButton.text:SetText("|cff00ff00AdvancedTradeSkillWindow|r") end
	if (UISkinOptions.ATSWSkin == "Disabled") then ATSWSkinButton.text:SetText("|cffff2020AdvancedTradeSkillWindow|r") end
	if not IsAddOnLoaded("AdvancedTradeSkillWindow") then ATSWSkinButton:Disable() ATSWSkinButton.text:SetText("|cFF808080AdvancedTradeSkillWindow|r") end
	ATSWSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ATSWSkin == "Enabled") then
			UISkinOptions.ATSWSkin = "Disabled"
			ATSWSkinButton.text:SetText("|cffff2020AdvancedTradeSkillWindow|r")
		else
			UISkinOptions.ATSWSkin = "Enabled"
			ATSWSkinButton.text:SetText("|cff00ff00AdvancedTradeSkillWindow|r")
		end
	end)
	AuctionatorSkinButton = CreateFrame("Button", "AuctionatorSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AuctionatorSkinButton:SetPoint("TOPLEFT", 12, -205)
	AuctionatorSkinButton:Size(200,20)
	cSkinButton(AuctionatorSkinButton)
	AuctionatorSkinButton.text = AuctionatorSkinButton:CreateFontString(nil, "OVERLAY")
	AuctionatorSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	AuctionatorSkinButton.text:SetPoint("CENTER", AuctionatorSkinButton, 0, 0)
	if (UISkinOptions.AuctionatorSkin == "Enabled") then AuctionatorSkinButton.text:SetText("|cffff2020Auctionator|r") end
	if (UISkinOptions.AuctionatorSkin == "Disabled") then AuctionatorSkinButton.text:SetText("|cff00ff00Auctionator|r") end
	if not IsAddOnLoaded("Auctionator") then AuctionatorSkinButton:Disable() AuctionatorSkinButton.text:SetText("|cFF808080Auctionator|r") end
	AuctionatorSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AuctionatorSkin == "Enabled") then
			UISkinOptions.AuctionatorSkin = "Disabled"
			AuctionatorSkinButton.text:SetText("|cffff2020Auctionator|r")
		else
			UISkinOptions.AuctionatorSkin = "Enabled"
			AuctionatorSkinButton.text:SetText("|cff00ff00Auctionator|r")
		end
	end)
	AuctioneerSkinButton = CreateFrame("Button", "AuctioneerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AuctioneerSkinButton:SetPoint("TOPLEFT", 12, -230)
	AuctioneerSkinButton:Size(200,20)
	cSkinButton(AuctioneerSkinButton)
	AuctioneerSkinButton.text = AuctioneerSkinButton:CreateFontString(nil, "OVERLAY")
	AuctioneerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	AuctioneerSkinButton.text:SetPoint("CENTER", AuctioneerSkinButton, 0, 0)
	if (UISkinOptions.AuctioneerSkin == "Enabled") then AuctioneerSkinButton.text:SetText("|cff00ff00Auctioneer|r") end
	if (UISkinOptions.AuctioneerSkin == "Disabled") then AuctioneerSkinButton.text:SetText("|cffff2020Auctioneer|r") end
	if not IsAddOnLoaded("Auc-Advanced") then AuctioneerSkinButton:Disable() AuctioneerSkinButton.text:SetText("|cFF808080Auctioneer|r") end
	AuctioneerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AuctioneerSkin == "Enabled") then
			UISkinOptions.AuctioneerSkin = "Disabled"
			AuctioneerSkinButton.text:SetText("|cffff2020Auctioneer|r")
		else
			UISkinOptions.AuctioneerSkin = "Enabled"
			AuctioneerSkinButton.text:SetText("|cff00ff00Auctioneer|r")
		end
	end)
	BGDefenderSkinButton = CreateFrame("Button", "BGDefenderSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BGDefenderSkinButton:SetPoint("TOPLEFT", 12, -255)
	BGDefenderSkinButton:Size(200,20)
	cSkinButton(BGDefenderSkinButton)
	BGDefenderSkinButton.text = BGDefenderSkinButton:CreateFontString(nil, "OVERLAY")
	BGDefenderSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	BGDefenderSkinButton.text:SetPoint("CENTER", BGDefenderSkinButton, 0, 0)
	if (UISkinOptions.BGDefenderSkin == "Enabled") then BGDefenderSkinButton.text:SetText("|cff00ff00BGDefender|r") end
	if (UISkinOptions.BGDefenderSkin == "Disabled") then BGDefenderSkinButton.text:SetText("|cffff2020BGDefender|r") end
	if not IsAddOnLoaded("BGDefender") then BGDefenderSkinButton:Disable() BGDefenderSkinButton.text:SetText("|cFF808080BGDefender|r") end
	BGDefenderSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.BGDefenderSkin == "Enabled") then
			UISkinOptions.BGDefenderSkin = "Disabled"
			BGDefenderSkinButton.text:SetText("|cffff2020BGDefender|r")
		else
			UISkinOptions.BGDefenderSkin = "Enabled"
			BGDefenderSkinButton.text:SetText("|cff00ff00BGDefender|r")
		end
	end)
	BigWigsSkinButton = CreateFrame("Button", "BigWigsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BigWigsSkinButton:SetPoint("TOPLEFT", 12, -280)
	BigWigsSkinButton:Size(200,20)
	cSkinButton(BigWigsSkinButton)
	BigWigsSkinButton.text = BigWigsSkinButton:CreateFontString(nil, "OVERLAY")
	BigWigsSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	BigWigsSkinButton.text:SetPoint("CENTER", BigWigsSkinButton, 0, 0)
	if (UISkinOptions.BigWigsSkin == "Enabled") then BigWigsSkinButton.text:SetText("|cff00ff00BigWigs|r") end
	if (UISkinOptions.BigWigsSkin == "Disabled") then BigWigsSkinButton.text:SetText("|cffff2020BigWigs|r") end
	if not IsAddOnLoaded("BigWigs") then BigWigsSkinButton:Disable() BigWigsSkinButton.text:SetText("|cFF808080BigWigs|r") end
	BigWigsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.BigWigsSkin == "Enabled") then
			UISkinOptions.BigWigsSkin = "Disabled"
			BigWigsSkinButton.text:SetText("|cffff2020BigWigs|r")
		else
			UISkinOptions.BigWigsSkin = "Enabled"
			BigWigsSkinButton.text:SetText("|cff00ff00BigWigs|r")
		end
	end)
	BuyEmAllSkinButton = CreateFrame("Button", "BuyEmAllSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BuyEmAllSkinButton:SetPoint("TOPLEFT", 12, -305)
	BuyEmAllSkinButton:Size(200,20)
	cSkinButton(BuyEmAllSkinButton)
	BuyEmAllSkinButton.text = BuyEmAllSkinButton:CreateFontString(nil, "OVERLAY")
	BuyEmAllSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	BuyEmAllSkinButton.text:SetPoint("CENTER", BuyEmAllSkinButton, 0, 0)
	if (UISkinOptions.BuyEmAllSkin == "Enabled") then BuyEmAllSkinButton.text:SetText("|cff00ff00BuyEmAll|r") end
	if (UISkinOptions.BuyEmAllSkin == "Disabled") then BuyEmAllSkinButton.text:SetText("|cffff2020BuyEmAll|r") end
	if not IsAddOnLoaded("BuyEmAll") then BuyEmAllSkinButton:Disable() BuyEmAllSkinButton.text:SetText("|cFF808080BuyEmAll|r") end
	BuyEmAllSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.BuyEmAllSkin == "Enabled") then
			UISkinOptions.BuyEmAllSkin = "Disabled"
			BuyEmAllSkinButton.text:SetText("|cffff2020BuyEmAll|r")
		else
			UISkinOptions.BuyEmAllSkin = "Enabled"
			BuyEmAllSkinButton.text:SetText("|cff00ff00BuyEmAll|r")
		end
	end)
	ChocolateBarSkinButton = CreateFrame("Button", "ChocolateBarSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ChocolateBarSkinButton:SetPoint("TOPLEFT", 12, -330)
	ChocolateBarSkinButton:Size(200,20)
	cSkinButton(ChocolateBarSkinButton)
	ChocolateBarSkinButton.text = ChocolateBarSkinButton:CreateFontString(nil, "OVERLAY")
	ChocolateBarSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ChocolateBarSkinButton.text:SetPoint("CENTER", ChocolateBarSkinButton, 0, 0)
	if (UISkinOptions.ChocolateBarSkin == "Enabled") then ChocolateBarSkinButton.text:SetText("|cff00ff00ChocolateBar|r") end
	if (UISkinOptions.ChocolateBarSkin == "Disabled") then ChocolateBarSkinButton.text:SetText("|cffff2020ChocolateBar|r") end
	if not IsAddOnLoaded("ChocolateBar") then ChocolateBarSkinButton:Disable() ChocolateBarSkinButton.text:SetText("|cFF808080ChocolateBar|r") end
	ChocolateBarSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ChocolateBarSkin == "Enabled") then
			UISkinOptions.ChocolateBarSkin = "Disabled"
			ChocolateBarSkinButton.text:SetText("|cffff2020ChocolateBar|r")
		else
			UISkinOptions.ChocolateBarSkin = "Enabled"
			ChocolateBarSkinButton.text:SetText("|cff00ff00ChocolateBar|r")
		end
	end)
	CliqueSkinButton = CreateFrame("Button", "CliqueSkinButton", SkinOptions, "UIPanelButtonTemplate")
	CliqueSkinButton:SetPoint("TOPLEFT", 12, -355)
	CliqueSkinButton:Size(200,20)
	cSkinButton(CliqueSkinButton)
	CliqueSkinButton.text = CliqueSkinButton:CreateFontString(nil, "OVERLAY")
	CliqueSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	CliqueSkinButton.text:SetPoint("CENTER", CliqueSkinButton, 0, 0)
	if (UISkinOptions.CliqueSkin == "Enabled") then CliqueSkinButton.text:SetText("|cff00ff00Clique|r") end
	if (UISkinOptions.CliqueSkin == "Disabled") then CliqueSkinButton.text:SetText("|cffff2020Clique|r") end
	if not IsAddOnLoaded("Clique") then CliqueSkinButton:Disable() CliqueSkinButton.text:SetText("|cFF808080Clique|r") end
	CliqueSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.CliqueSkin == "Enabled") then
			UISkinOptions.CliqueSkin = "Disabled"
			CliqueSkinButton.text:SetText("|cffff2020Clique|r")
		else
			UISkinOptions.CliqueSkin = "Enabled"
			CliqueSkinButton.text:SetText("|cff00ff00Clique|r")
		end
	end)
	DBMSkinButton = CreateFrame("Button", "DBMSkinButton", SkinOptions, "UIPanelButtonTemplate")
	DBMSkinButton:SetPoint("TOPLEFT", 12, -380)
	DBMSkinButton:Size(200,20)
	cSkinButton(DBMSkinButton)
	DBMSkinButton.text = DBMSkinButton:CreateFontString(nil, "OVERLAY")
	DBMSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	DBMSkinButton.text:SetPoint("CENTER", DBMSkinButton, 0, 0)
	if (UISkinOptions.DBMSkin == "Enabled") then DBMSkinButton.text:SetText("|cff00ff00DBM|r") end
	if (UISkinOptions.DBMSkin == "Disabled") then DBMSkinButton.text:SetText("|cffff2020DBM|r") end
	if not IsAddOnLoaded("DBM-Core") then DBMSkinButton:Disable() DBMSkinButton.text:SetText("|cFF808080DBM|r") end
	DBMSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.DBMSkin == "Enabled") then
			UISkinOptions.DBMSkin = "Disabled"
			DBMSkinButton.text:SetText("|cffff2020DBM|r")
		else
			UISkinOptions.DBMSkin = "Enabled"
			DBMSkinButton.text:SetText("|cff00ff00DBM|r")
		end
	end)
	EasyMailSkinButton = CreateFrame("Button", "EasyMailSkinButton", SkinOptions, "UIPanelButtonTemplate")
	EasyMailSkinButton:SetPoint("TOPLEFT", 12, -405)
	EasyMailSkinButton:Size(200,20)
	cSkinButton(EasyMailSkinButton)
	EasyMailSkinButton.text = EasyMailSkinButton:CreateFontString(nil, "OVERLAY")
	EasyMailSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EasyMailSkinButton.text:SetPoint("CENTER", EasyMailSkinButton, 0, 0)
	if (UISkinOptions.EasyMailSkin == "Enabled") then EasyMailSkinButton.text:SetText("|cff00ff00EasyMail|r") end
	if (UISkinOptions.EasyMailSkin == "Disabled") then EasyMailSkinButton.text:SetText("|cffff2020EasyMail|r") end
	if not IsAddOnLoaded("EasyMail") then EasyMailSkinButton:Disable() EasyMailSkinButton.text:SetText("|cFF808080EasyMail|r") end
	EasyMailSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.EasyMailSkin == "Enabled") then
			UISkinOptions.EasyMailSkin = "Disabled"
			EasyMailSkinButton.text:SetText("|cffff2020EasyMail|r")
		else
			UISkinOptions.EasyMailSkin = "Enabled"
			EasyMailSkinButton.text:SetText("|cff00ff00EasyMail|r")
		end
	end)
	EnergyWatchSkinButton = CreateFrame("Button", "EnergyWatchSkinButton", SkinOptions, "UIPanelButtonTemplate")
	EnergyWatchSkinButton:SetPoint("TOPLEFT", 12, -430)
	EnergyWatchSkinButton:Size(200,20)
	cSkinButton(EnergyWatchSkinButton)
	EnergyWatchSkinButton.text = EnergyWatchSkinButton:CreateFontString(nil, "OVERLAY")
	EnergyWatchSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EnergyWatchSkinButton.text:SetPoint("CENTER", EnergyWatchSkinButton, 0, 0)
	if (UISkinOptions.EnergyWatchSkin == "Enabled") then EnergyWatchSkinButton.text:SetText("|cff00ff00EnergyWatch|r") end
	if (UISkinOptions.EnergyWatchSkin == "Disabled") then EnergyWatchSkinButton.text:SetText("|cffff2020EnergyWatch|r") end
	if not IsAddOnLoaded("EnergyWatch") then EnergyWatchSkinButton:Disable() EnergyWatchSkinButton.text:SetText("|cFF808080EnergyWatch|r") end
	EnergyWatchSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.EnergyWatchSkin == "Enabled") then
			UISkinOptions.EnergyWatchSkin = "Disabled"
			EnergyWatchSkinButton.text:SetText("|cffff2020EnergyWatch|r")
		else
			UISkinOptions.EnergyWatchSkin = "Enabled"
			EnergyWatchSkinButton.text:SetText("|cff00ff00EnergyWatch|r")
		end
	end)
	ExtVendorSkinButton = CreateFrame("Button", "ExtVendorSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ExtVendorSkinButton:SetPoint("TOPLEFT", 12, -455)
	ExtVendorSkinButton:Size(200,20)
	cSkinButton(ExtVendorSkinButton)
	ExtVendorSkinButton.text = ExtVendorSkinButton:CreateFontString(nil, "OVERLAY")
	ExtVendorSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ExtVendorSkinButton.text:SetPoint("CENTER", ExtVendorSkinButton, 0, 0)
	if (UISkinOptions.ExtVendorSkin == "Enabled") then ExtVendorSkinButton.text:SetText("|cff00ff00Extended Vendor|r") end
	if (UISkinOptions.ExtVendorSkin == "Disabled") then ExtVendorSkinButton.text:SetText("|cffff2020Extended Vendor|r") end
	if not IsAddOnLoaded("ExtVendor") then ExtVendorSkinButton:Disable() ExtVendorSkinButton.text:SetText("|cFF808080Extended Vendor|r") end
	ExtVendorSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ExtVendorSkin == "Enabled") then
			UISkinOptions.ExtVendorSkin = "Disabled"
			ExtVendorSkinButton.text:SetText("|cffff2020Extended Vendor|r")
		else
			UISkinOptions.ExtVendorSkin = "Enabled"
			ExtVendorSkinButton.text:SetText("|cff00ff00Extended Vendor|r")
		end
	end)
	FactionizerSkinButton = CreateFrame("Button", "FactionizerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	FactionizerSkinButton:SetPoint("TOP", 0, -30)
	FactionizerSkinButton:Size(200,20)
	cSkinButton(FactionizerSkinButton)
	FactionizerSkinButton.text = FactionizerSkinButton:CreateFontString(nil, "OVERLAY")
	FactionizerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	FactionizerSkinButton.text:SetPoint("CENTER", FactionizerSkinButton, 0, 0)
	if (UISkinOptions.FactionizerSkin == "Enabled") then FactionizerSkinButton.text:SetText("|cff00ff00Factionizer|r") end
	if (UISkinOptions.FactionizerSkin == "Disabled") then FactionizerSkinButton.text:SetText("|cffff2020Factionizer|r") end
	if not IsAddOnLoaded("Factionizer") then FactionizerSkinButton:Disable() FactionizerSkinButton.text:SetText("|cFF808080Factionizer|r") end
	FactionizerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.FactionizerSkin == "Enabled") then
			UISkinOptions.FactionizerSkin = "Disabled"
			FactionizerSkinButton.text:SetText("|cffff2020Factionizer|r")
		else
			UISkinOptions.FactionizerSkin = "Enabled"
			FactionizerSkinButton.text:SetText("|cff00ff00Factionizer|r")
		end
	end)
	KarniCrapSkinButton = CreateFrame("Button", "KarniCrapSkinButton", SkinOptions, "UIPanelButtonTemplate")
	KarniCrapSkinButton:SetPoint("TOP", 0, -55)
	KarniCrapSkinButton:Size(200,20)
	cSkinButton(KarniCrapSkinButton)
	KarniCrapSkinButton.text = KarniCrapSkinButton:CreateFontString(nil, "OVERLAY")
	KarniCrapSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	KarniCrapSkinButton.text:SetPoint("CENTER", KarniCrapSkinButton, 0, 0)
	if (UISkinOptions.KarniCrapSkin == "Enabled") then KarniCrapSkinButton.text:SetText("|cff00ff00Karni's Crap Filter|r") end
	if (UISkinOptions.KarniCrapSkin == "Disabled") then KarniCrapSkinButton.text:SetText("|cffff2020Karni's Crap Filter|r") end
	if not IsAddOnLoaded("KarniCrap") then KarniCrapSkinButton:Disable() KarniCrapSkinButton.text:SetText("|cFF808080Karni's Crap Filter|r") end
	KarniCrapSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.KarniCrapSkin == "Enabled") then
			UISkinOptions.KarniCrapSkin = "Disabled"
			KarniCrapSkinButton.text:SetText("|cffff2020Karni's Crap Filter|r")
		else
			UISkinOptions.KarniCrapSkin = "Enabled"
			KarniCrapSkinButton.text:SetText("|cff00ff00Karni's Crap Filter|r")
		end
	end)
	LightheadedSkinButton = CreateFrame("Button", "LightheadedSkinButton", SkinOptions, "UIPanelButtonTemplate")
	LightheadedSkinButton:SetPoint("TOP", 0, -80)
	LightheadedSkinButton:Size(200,20)
	cSkinButton(LightheadedSkinButton)
	LightheadedSkinButton.text = LightheadedSkinButton:CreateFontString(nil, "OVERLAY")
	LightheadedSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	LightheadedSkinButton.text:SetPoint("CENTER", LightheadedSkinButton, 0, 0)
	if (UISkinOptions.LightheadedSkin == "Enabled") then LightheadedSkinButton.text:SetText("|cff00ff00Lightheaded|r") end
	if (UISkinOptions.LightheadedSkin == "Disabled") then LightheadedSkinButton.text:SetText("|cffff2020Lightheaded|r") end
	if not IsAddOnLoaded("Lightheaded") then LightheadedSkinButton:Disable() LightheadedSkinButton.text:SetText("|cFF808080Lightheaded|r") end
	LightheadedSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.LightheadedSkin == "Enabled") then
			UISkinOptions.LightheadedSkin = "Disabled"
			LightheadedSkinButton.text:SetText("|cffff2020Lightheaded|r")
		else
			UISkinOptions.LightheadedSkin = "Enabled"
			LightheadedSkinButton.text:SetText("|cff00ff00Lightheaded|r")
		end
	end)
	LootCouncilLiteSkinButton = CreateFrame("Button", "LootCouncilLiteSkinButton", SkinOptions, "UIPanelButtonTemplate")
	LootCouncilLiteSkinButton:SetPoint("TOP", 0, -105)
	LootCouncilLiteSkinButton:Size(200,20)
	cSkinButton(LootCouncilLiteSkinButton)
	LootCouncilLiteSkinButton.text = LootCouncilLiteSkinButton:CreateFontString(nil, "OVERLAY")
	LootCouncilLiteSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	LootCouncilLiteSkinButton.text:SetPoint("CENTER", LootCouncilLiteSkinButton, 0, 0)
	if (UISkinOptions.LootCouncilLiteSkin == "Enabled") then LootCouncilLiteSkinButton.text:SetText("|cff00ff00LootCouncilLite|r") end
	if (UISkinOptions.LootCouncilLiteSkin == "Disabled") then LootCouncilLiteSkinButton.text:SetText("|cffff2020LootCouncilLite|r") end
	if not IsAddOnLoaded("LootCouncil_Lite") then LootCouncilLiteSkinButton:Disable() LootCouncilLiteSkinButton.text:SetText("|cFF808080LootCouncilLite|r") end
	LootCouncilLiteSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.LootCouncilLiteSkin == "Enabled") then
			UISkinOptions.LootCouncilLiteSkin = "Disabled"
			LootCouncilLiteSkinButton.text:SetText("|cffff2020LootCouncilLite|r")
		else
			UISkinOptions.LootCouncilLiteSkin = "Enabled"
			LootCouncilLiteSkinButton.text:SetText("|cff00ff00LootCouncilLite|r")
		end
	end)
	MageNuggetsSkinButton = CreateFrame("Button", "MageNuggetsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MageNuggetsSkinButton:SetPoint("TOP", 0, -130)
	MageNuggetsSkinButton:Size(200,20)
	cSkinButton(MageNuggetsSkinButton)
	MageNuggetsSkinButton.text = MageNuggetsSkinButton:CreateFontString(nil, "OVERLAY")
	MageNuggetsSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MageNuggetsSkinButton.text:SetPoint("CENTER", MageNuggetsSkinButton, 0, 0)
	if (UISkinOptions.MageNuggetsSkin == "Enabled") then MageNuggetsSkinButton.text:SetText("|cff00ff00MageNuggets|r") end
	if (UISkinOptions.MageNuggetsSkin == "Disabled") then MageNuggetsSkinButton.text:SetText("|cffff2020MageNuggets|r") end
	if not IsAddOnLoaded("MageNuggets") then MageNuggetsSkinButton:Disable() MageNuggetsSkinButton.text:SetText("|cFF808080MageNuggets|r") end
	MageNuggetsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MageNuggetsSkin == "Enabled") then
			UISkinOptions.MageNuggetsSkin = "Disabled"
			MageNuggetsSkinButton.text:SetText("|cffff2020MageNuggets|r")
		else
			UISkinOptions.MageNuggetsSkin = "Enabled"
			MageNuggetsSkinButton.text:SetText("|cff00ff00MageNuggets|r")
		end
	end)
	MasterLootManagerRemixSkinButton = CreateFrame("Button", "MasterLootManagerRemixSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MasterLootManagerRemixSkinButton:SetPoint("TOP", 0, -155)
	MasterLootManagerRemixSkinButton:Size(200,20)
	cSkinButton(MasterLootManagerRemixSkinButton)
	MasterLootManagerRemixSkinButton.text = MasterLootManagerRemixSkinButton:CreateFontString(nil, "OVERLAY")
	MasterLootManagerRemixSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MasterLootManagerRemixSkinButton.text:SetPoint("CENTER", MasterLootManagerRemixSkinButton, 0, 0)
	if (UISkinOptions.MasterLootManagerRemixSkin == "Enabled") then MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cff00ff00Enabled|r") end
	if (UISkinOptions.MasterLootManagerRemixSkin == "Disabled") then MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cffff2020Disabled|r") end
	if not IsAddOnLoaded("MasterLootManagerRemix") then MasterLootManagerRemixSkinButton:Disable() MasterLootManagerRemixSkinButton.text:SetText("|cFF808080MasterLootManagerRemix|r") end
	MasterLootManagerRemixSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MasterLootManagerRemixSkin == "Enabled") then
			UISkinOptions.MasterLootManagerRemixSkin = "Disabled"
			MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cffff2020Disabled|r")
		else
			UISkinOptions.MasterLootManagerRemixSkin = "Enabled"
			MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cff00ff00Enabled|r")
		end
	end)
	MinimalArchaeologySkinButton = CreateFrame("Button", "MinimalArchaeologySkinButton", SkinOptions, "UIPanelButtonTemplate")
	MinimalArchaeologySkinButton:SetPoint("TOP", 0, -180)
	MinimalArchaeologySkinButton:Size(200,20)
	cSkinButton(MinimalArchaeologySkinButton)
	MinimalArchaeologySkinButton.text = MinimalArchaeologySkinButton:CreateFontString(nil, "OVERLAY")
	MinimalArchaeologySkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MinimalArchaeologySkinButton.text:SetPoint("CENTER", MinimalArchaeologySkinButton, 0, 0)
	if (UISkinOptions.MinimalArchaeologySkin == "Enabled") then MinimalArchaeologySkinButton.text:SetText("|cff00ff00MinimalArchaeology|r") end
	if (UISkinOptions.MinimalArchaeologySkin == "Disabled") then MinimalArchaeologySkinButton.text:SetText("|cffff2020MinimalArchaeology|r") end
	if not IsAddOnLoaded("MinimalArchaeology") then MinimalArchaeologySkinButton:Disable() MinimalArchaeologySkinButton.text:SetText("|cFF808080MinimalArchaeology|r") end
	MinimalArchaeologySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MinimalArchaeologySkin == "Enabled") then
			UISkinOptions.MinimalArchaeologySkin = "Disabled"
			MinimalArchaeologySkinButton.text:SetText("|cffff2020MinimalArchaeology|r")
		else
			UISkinOptions.MinimalArchaeologySkin = "Enabled"
			MinimalArchaeologySkinButton.text:SetText("|cff00ff00MinimalArchaeology|r")
		end
	end)
	MoveAnythingSkinButton = CreateFrame("Button", "MoveAnythingSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MoveAnythingSkinButton:SetPoint("TOP", 0, -205)
	MoveAnythingSkinButton:Size(200,20)
	cSkinButton(MoveAnythingSkinButton)
	MoveAnythingSkinButton.text = MoveAnythingSkinButton:CreateFontString(nil, "OVERLAY")
	MoveAnythingSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MoveAnythingSkinButton.text:SetPoint("CENTER", MoveAnythingSkinButton, 0, 0)
	if (UISkinOptions.MoveAnythingSkin == "Enabled") then MoveAnythingSkinButton.text:SetText("|cff00ff00MoveAnything|r") end
	if (UISkinOptions.MoveAnythingSkin == "Disabled") then MoveAnythingSkinButton.text:SetText("|cffff2020MoveAnything|r") end
	if not IsAddOnLoaded("MoveAnything") then MoveAnythingSkinButton:Disable() MoveAnythingSkinButton.text:SetText("|cFF808080MoveAnything|r") end
	MoveAnythingSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MoveAnythingSkin == "Enabled") then
			UISkinOptions.MoveAnythingSkin = "Disabled"
			MoveAnythingSkinButton.text:SetText("|cffff2020MoveAnything|r")
		else
			UISkinOptions.MoveAnythingSkin = "Enabled"
			MoveAnythingSkinButton.text:SetText("|cff00ff00MoveAnything|r")
		end
	end)
	MRTSkinButton = CreateFrame("Button", "MRTSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MRTSkinButton:SetPoint("TOP", 0, -230)
	MRTSkinButton:Size(200,20)
	cSkinButton(MRTSkinButton)
	MRTSkinButton.text = MRTSkinButton:CreateFontString(nil, "OVERLAY")
	MRTSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	MRTSkinButton.text:SetPoint("CENTER", MRTSkinButton, 0, 0)
	if (UISkinOptions.MRTSkin == "Enabled") then MRTSkinButton.text:SetText("|cff00ff00Mizus Raid Tracker|r") end
	if (UISkinOptions.MRTSkin == "Disabled") then MRTSkinButton.text:SetText("|cffff2020Mizus Raid Tracker|r") end
	if not IsAddOnLoaded("MizusRaidTracker") then MRTSkinButton:Disable() MRTSkinButton.text:SetText("|cFF808080Mizus Raid Tracker|r") end
	MRTSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MRTSkin == "Enabled") then
			UISkinOptions.MRTSkin = "Disabled"
			MRTSkinButton.text:SetText("|cffff2020Mizus Raid Tracker|r")
		else
			UISkinOptions.MRTSkin = "Enabled"
			MRTSkinButton.text:SetText("|cff00ff00Mizus Raid Tracker|r")
		end
	end)
	OdysseySkinButton = CreateFrame("Button", "OdysseySkinButton", SkinOptions, "UIPanelButtonTemplate")
	OdysseySkinButton:SetPoint("TOP", 0, -255)
	OdysseySkinButton:Size(200,20)
	cSkinButton(OdysseySkinButton)
	OdysseySkinButton.text = OdysseySkinButton:CreateFontString(nil, "OVERLAY")
	OdysseySkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	OdysseySkinButton.text:SetPoint("CENTER", OdysseySkinButton, 0, 0)
	if (UISkinOptions.OdysseySkin == "Enabled") then OdysseySkinButton.text:SetText("|cff00ff00Odyssey|r") end
	if (UISkinOptions.OdysseySkin == "Disabled") then OdysseySkinButton.text:SetText("|cffff2020Odyssey|r") end
	if not IsAddOnLoaded("Odyssey") then OdysseySkinButton:Disable() OdysseySkinButton.text:SetText("|cFF808080Odyssey|r") end
	OdysseySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OdysseySkin == "Enabled") then
			UISkinOptions.OdysseySkin = "Disabled"
			OdysseySkinButton.text:SetText("|cffff2020Odyssey|r")
		else
			UISkinOptions.OdysseySkin = "Enabled"
			OdysseySkinButton.text:SetText("|cff00ff00Odyssey|r")
		end
	end)
	OgriLazySkinButton = CreateFrame("Button", "OgriLazySkinButton", SkinOptions, "UIPanelButtonTemplate")
	OgriLazySkinButton:SetPoint("TOP", 0, -280)
	OgriLazySkinButton:Size(200,20)
	cSkinButton(OgriLazySkinButton)
	OgriLazySkinButton.text = OgriLazySkinButton:CreateFontString(nil, "OVERLAY")
	OgriLazySkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	OgriLazySkinButton.text:SetPoint("CENTER", OgriLazySkinButton, 0, 0)
	if (UISkinOptions.OgriLazySkin == "Enabled") then OgriLazySkinButton.text:SetText("|cff00ff00Ogri'Lazy|r") end
	if (UISkinOptions.OgriLazySkin == "Disabled") then OgriLazySkinButton.text:SetText("|cffff2020Ogri'Lazy|r") end
	if not IsAddOnLoaded("Ogri'Lazy") then OgriLazySkinButton:Disable() OgriLazySkinButton.text:SetText("|cFF808080Ogri'Lazy|r") end
	OgriLazySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OgriLazySkin == "Enabled") then
			UISkinOptions.OgriLazySkin = "Disabled"
			OgriLazySkinButton.text:SetText("|cffff2020Ogri'Lazy|r")
		else
			UISkinOptions.OgriLazySkin = "Enabled"
			OgriLazySkinButton.text:SetText("|cff00ff00Ogri'Lazy|r")
		end
	end)
	OmenSkinButton = CreateFrame("Button", "OmenSkinButton", SkinOptions, "UIPanelButtonTemplate")
	OmenSkinButton:SetPoint("TOP", 0, -305)
	OmenSkinButton:Size(200,20)
	cSkinButton(OmenSkinButton)
	OmenSkinButton.text = OmenSkinButton:CreateFontString(nil, "OVERLAY")
	OmenSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	OmenSkinButton.text:SetPoint("CENTER", OmenSkinButton, 0, 0)
	if (UISkinOptions.OmenSkin == "Enabled") then OmenSkinButton.text:SetText("|cff00ff00Omen|r") end
	if (UISkinOptions.OmenSkin == "Disabled") then OmenSkinButton.text:SetText("|cffff2020Omen|r") end
	if not IsAddOnLoaded("Omen") then OmenSkinButton:Disable() OmenSkinButton.text:SetText("|cFF808080Omen|r") end
	OmenSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OmenSkin == "Enabled") then
			UISkinOptions.OmenSkin = "Disabled"
			OmenSkinButton.text:SetText("|cffff2020Omen|r")
		else
			UISkinOptions.OmenSkin = "Enabled"
			OmenSkinButton.text:SetText("|cff00ff00Omen|r")
		end
	end)
	OutfitterSkinButton = CreateFrame("Button", "OutfitterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	OutfitterSkinButton:SetPoint("TOP", 0, -330)
	OutfitterSkinButton:Size(200,20)
	cSkinButton(OutfitterSkinButton)
	OutfitterSkinButton.text = OutfitterSkinButton:CreateFontString(nil, "OVERLAY")
	OutfitterSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	OutfitterSkinButton.text:SetPoint("CENTER", OutfitterSkinButton, 0, 0)
	if (UISkinOptions.OutfitterSkin == "Enabled") then OutfitterSkinButton.text:SetText("|cff00ff00Outfitter|r") end
	if (UISkinOptions.OutfitterSkin == "Disabled") then OutfitterSkinButton.text:SetText("|cffff2020Outfitter|r") end
	if not IsAddOnLoaded("Outfitter") then OutfitterSkinButton:Disable() OutfitterSkinButton.text:SetText("|cFF808080Outfitter|r") end
	OutfitterSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OutfitterSkin == "Enabled") then
			UISkinOptions.OutfitterSkin = "Disabled"
			OutfitterSkinButton.text:SetText("|cffff2020Outfitter|r")
		else
			UISkinOptions.OutfitterSkin = "Enabled"
			OutfitterSkinButton.text:SetText("|cff00ff00Outfitter|r")
		end
	end)
	PoisonerSkinButton = CreateFrame("Button", "PoisonerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PoisonerSkinButton:SetPoint("TOP", 0, -355)
	PoisonerSkinButton:Size(200,20)
	cSkinButton(PoisonerSkinButton)
	PoisonerSkinButton.text = PoisonerSkinButton:CreateFontString(nil, "OVERLAY")
	PoisonerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	PoisonerSkinButton.text:SetPoint("CENTER", PoisonerSkinButton, 0, 0)
	if (UISkinOptions.PoisonerSkin == "Enabled") then PoisonerSkinButton.text:SetText("|cff00ff00Poisoner|r") end
	if (UISkinOptions.PoisonerSkin == "Disabled") then PoisonerSkinButton.text:SetText("|cffff2020Poisoner|r") end
	if not IsAddOnLoaded("Poisoner") then PoisonerSkinButton:Disable() PoisonerSkinButton.text:SetText("|cFF808080Poisoner|r") end
	PoisonerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PoisonerSkin == "Enabled") then
			UISkinOptions.PoisonerSkin = "Disabled"
			PoisonerSkinButton.text:SetText("|cffff2020Poisoner|r")
		else
			UISkinOptions.PoisonerSkin = "Enabled"
			PoisonerSkinButton.text:SetText("|cff00ff00Poisoner|r")
		end
	end)
	PoMTrackerSkinButton = CreateFrame("Button", "PoMTrackerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PoMTrackerSkinButton:SetPoint("TOP", 0, -380)
	PoMTrackerSkinButton:Size(200,20)
	cSkinButton(PoMTrackerSkinButton)
	PoMTrackerSkinButton.text = PoMTrackerSkinButton:CreateFontString(nil, "OVERLAY")
	PoMTrackerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	PoMTrackerSkinButton.text:SetPoint("CENTER", PoMTrackerSkinButton, 0, 0)
	if (UISkinOptions.PoMTrackerSkin == "Enabled") then PoMTrackerSkinButton.text:SetText("|cff00ff00PoMTracker|r") end
	if (UISkinOptions.PoMTrackerSkin == "Disabled") then PoMTrackerSkinButton.text:SetText("|cffff2020PoMTracker|r") end
	if not IsAddOnLoaded("PoMTracker") then PoMTrackerSkinButton:Disable() PoMTrackerSkinButton.text:SetText("|cFF808080PoMTracker|r") end
	PoMTrackerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PoMTrackerSkin == "Enabled") then
			UISkinOptions.PoMTrackerSkin = "Disabled"
			PoMTrackerSkinButton.text:SetText("|cffff2020PoMTracker|r")
		else
			UISkinOptions.PoMTrackerSkin = "Enabled"
			PoMTrackerSkinButton.text:SetText("|cff00ff00PoMTracker|r")
		end
	end)
	PostalSkinButton = CreateFrame("Button", "PostalSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PostalSkinButton:SetPoint("TOP", 0, -405)
	PostalSkinButton:Size(200,20)
	cSkinButton(PostalSkinButton)
	PostalSkinButton.text = PostalSkinButton:CreateFontString(nil, "OVERLAY")
	PostalSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	PostalSkinButton.text:SetPoint("CENTER", PostalSkinButton, 0, 0)
	if (UISkinOptions.PostalSkin == "Enabled") then PostalSkinButton.text:SetText("|cff00ff00Postal|r") end
	if (UISkinOptions.PostalSkin == "Disabled") then PostalSkinButton.text:SetText("|cffff2020Postal|r") end
	if not IsAddOnLoaded("Postal") then PostalSkinButton:Disable() PostalSkinButton.text:SetText("|cFF808080Postal|r") end
	PostalSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PostalSkin == "Enabled") then
			UISkinOptions.PostalSkin = "Disabled"
			PostalSkinButton.text:SetText("|cffff2020Postal|r")
		else
			UISkinOptions.PostalSkin = "Enabled"
			PostalSkinButton.text:SetText("|cff00ff00Postal|r")
		end
	end)
	PowerAurasSkinButton = CreateFrame("Button", "PowerAurasSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PowerAurasSkinButton:SetPoint("TOP", 0, -430)
	PowerAurasSkinButton:Size(200,20)
	cSkinButton(PowerAurasSkinButton)
	PowerAurasSkinButton.text = PowerAurasSkinButton:CreateFontString(nil, "OVERLAY")
	PowerAurasSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	PowerAurasSkinButton.text:SetPoint("CENTER", PowerAurasSkinButton, 0, 0)
	if (UISkinOptions.PowerAurasSkin == "Enabled") then PowerAurasSkinButton.text:SetText("|cff00ff00PowerAuras|r") end
	if (UISkinOptions.PowerAurasSkin == "Disabled") then PowerAurasSkinButton.text:SetText("|cffff2020PowerAuras|r") end
	if not IsAddOnLoaded("PowerAuras") then PowerAurasSkinButton:Disable() PowerAurasSkinButton.text:SetText("|cFF808080PowerAuras|r") end
	PowerAurasSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PowerAurasSkin == "Enabled") then
			UISkinOptions.PowerAurasSkin = "Disabled"
			PowerAurasSkinButton.text:SetText("|cffff2020PowerAuras|r")
		else
			UISkinOptions.PowerAurasSkin = "Enabled"
			PowerAurasSkinButton.text:SetText("|cff00ff00PowerAuras|r")
		end
	end)
	QuartzSkinButton = CreateFrame("Button", "QuartzSkinButton", SkinOptions, "UIPanelButtonTemplate")
	QuartzSkinButton:SetPoint("TOP", 0, -455)
	QuartzSkinButton:Size(200,20)
	cSkinButton(QuartzSkinButton)
	QuartzSkinButton.text = QuartzSkinButton:CreateFontString(nil, "OVERLAY")
	QuartzSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	QuartzSkinButton.text:SetPoint("CENTER", QuartzSkinButton, 0, 0)
	if (UISkinOptions.QuartzSkin == "Enabled") then QuartzSkinButton.text:SetText("|cff00ff00Quartz|r") end
	if (UISkinOptions.QuartzSkin == "Disabled") then QuartzSkinButton.text:SetText("|cffff2020Quartz|r") end
	if not IsAddOnLoaded("Quartz") then QuartzSkinButton:Disable() QuartzSkinButton.text:SetText("|cFF808080Quartz|r") end
	QuartzSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.QuartzSkin == "Enabled") then
			UISkinOptions.QuartzSkin = "Disabled"
			QuartzSkinButton.text:SetText("|cffff2020Quartz|r")
		else
			UISkinOptions.QuartzSkin = "Enabled"
			QuartzSkinButton.text:SetText("|cff00ff00Quartz|r")
		end
	end)
	RaidInviteOrganizerSkinButton = CreateFrame("Button", "RaidInviteOrganizerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	RaidInviteOrganizerSkinButton:SetPoint("TOPRIGHT", -12, -30)
	RaidInviteOrganizerSkinButton:Size(200,20)
	cSkinButton(RaidInviteOrganizerSkinButton)
	RaidInviteOrganizerSkinButton.text = RaidInviteOrganizerSkinButton:CreateFontString(nil, "OVERLAY")
	RaidInviteOrganizerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RaidInviteOrganizerSkinButton.text:SetPoint("CENTER", RaidInviteOrganizerSkinButton, 0, 0)
	if (UISkinOptions.RaidInviteOrganizerSkin == "Enabled") then RaidInviteOrganizerSkinButton.text:SetText("|cff00ff00Raid Invite Organizer|r") end
	if (UISkinOptions.RaidInviteOrganizerSkin == "Disabled") then RaidInviteOrganizerSkinButton.text:SetText("|cffff2020Raid Invite Organizer|r") end
	if not IsAddOnLoaded("RaidInviteOrganizer") then RaidInviteOrganizerSkinButton:Disable() RaidInviteOrganizerSkinButton.text:SetText("|cFF808080Raid Invite Organizer|r") end
	RaidInviteOrganizerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.RaidInviteOrganizerSkin == "Enabled") then
			UISkinOptions.RaidInviteOrganizerSkin = "Disabled"
			RaidInviteOrganizerSkinButton.text:SetText("|cffff2020Raid Invite Organizer|r")
		else
			UISkinOptions.RaidInviteOrganizerSkin = "Enabled"
			RaidInviteOrganizerSkinButton.text:SetText("|cff00ff00Raid Invite Organizer|r")
		end
	end)
	RaidBuffStatusSkinButton = CreateFrame("Button", "RaidBuffStatusSkinButton", SkinOptions, "UIPanelButtonTemplate")
	RaidBuffStatusSkinButton:SetPoint("TOPRIGHT", -12, -55)
	RaidBuffStatusSkinButton:Size(200,20)
	cSkinButton(RaidBuffStatusSkinButton)
	RaidBuffStatusSkinButton.text = RaidBuffStatusSkinButton:CreateFontString(nil, "OVERLAY")
	RaidBuffStatusSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RaidBuffStatusSkinButton.text:SetPoint("CENTER", RaidBuffStatusSkinButton, 0, 0)
	if (UISkinOptions.RaidBuffStatusSkin == "Enabled") then RaidBuffStatusSkinButton.text:SetText("|cff00ff00Raid Buff Status|r") end
	if (UISkinOptions.RaidBuffStatusSkin == "Disabled") then RaidBuffStatusSkinButton.text:SetText("|cffff2020Raid Buff Status|r") end
	if not IsAddOnLoaded("RaidBuffStatus") then RaidBuffStatusSkinButton:Disable() RaidBuffStatusSkinButton.text:SetText("|cFF808080Raid Buff Status|r") end
	RaidBuffStatusSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.RaidBuffStatusSkin == "Enabled") then
			UISkinOptions.RaidBuffStatusSkin = "Disabled"
			RaidBuffStatusSkinButton.text:SetText("|cffff2020Raid Buff Status|r")
		else
			UISkinOptions.RaidBuffStatusSkin = "Enabled"
			RaidBuffStatusSkinButton.text:SetText("|cff00ff00Raid Buff Status|r")
		end
	end)
	RecountSkinButton = CreateFrame("Button", "RecountSkinButton", SkinOptions, "UIPanelButtonTemplate")
	RecountSkinButton:SetPoint("TOPRIGHT", -12, -80)
	RecountSkinButton:Size(200,20)
	cSkinButton(RecountSkinButton)
	RecountSkinButton.text = RecountSkinButton:CreateFontString(nil, "OVERLAY")
	RecountSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RecountSkinButton.text:SetPoint("CENTER", RecountSkinButton, 0, 0)
	if (UISkinOptions.RecountSkin == "Enabled") then RecountSkinButton.text:SetText("|cff00ff00Recount|r") end
	if (UISkinOptions.RecountSkin == "Disabled") then RecountSkinButton.text:SetText("|cffff2020Recount|r") end
	if not IsAddOnLoaded("Recount") then RecountSkinButton:Disable() RecountSkinButton.text:SetText("|cFF808080Recount|r") end
	RecountSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.RecountSkin == "Enabled") then
			UISkinOptions.RecountSkin = "Disabled"
			RecountSkinButton.text:SetText("|cffff2020Recount|r")
		else
			UISkinOptions.RecountSkin = "Enabled"
			RecountSkinButton.text:SetText("|cff00ff00Recount|r")
		end
	end)
	SearingPlasmaTrackerSkinButton = CreateFrame("Button", "SearingPlasmaTrackerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SearingPlasmaTrackerSkinButton:SetPoint("TOPRIGHT", -12, -105)
	SearingPlasmaTrackerSkinButton:Size(200,20)
	cSkinButton(SearingPlasmaTrackerSkinButton)
	SearingPlasmaTrackerSkinButton.text = SearingPlasmaTrackerSkinButton:CreateFontString(nil, "OVERLAY")
	SearingPlasmaTrackerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SearingPlasmaTrackerSkinButton.text:SetPoint("CENTER", SearingPlasmaTrackerSkinButton, 0, 0)
	if (UISkinOptions.SearingPlasmaTrackerSkin == "Enabled") then SearingPlasmaTrackerSkinButton.text:SetText("|cff00ff00Searing Plasma Tracker|r") end
	if (UISkinOptions.SearingPlasmaTrackerSkin == "Disabled") then SearingPlasmaTrackerSkinButton.text:SetText("|cffff2020Searing Plasma Tracker|r") end
	if not IsAddOnLoaded("SearingPlasmaTracker") then SearingPlasmaTrackerSkinButton:Disable() SearingPlasmaTrackerSkinButton.text:SetText("|cFF808080Searing Plasma Tracker|r") end
	SearingPlasmaTrackerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SearingPlasmaTrackerSkin == "Enabled") then
			UISkinOptions.SearingPlasmaTrackerSkin = "Disabled"
			SearingPlasmaTrackerSkinButton.text:SetText("|cffff2020Searing Plasma Tracker|r")
		else
			UISkinOptions.SearingPlasmaTrackerSkin = "Enabled"
			SearingPlasmaTrackerSkinButton.text:SetText("|cff00ff00Searing Plasma Tracker|r")
		end
	end)
	SkadaSkinButton = CreateFrame("Button", "SkadaSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SkadaSkinButton:SetPoint("TOPRIGHT", -12, -130)
	SkadaSkinButton:Size(200,20)
	cSkinButton(SkadaSkinButton)
	SkadaSkinButton.text = SkadaSkinButton:CreateFontString(nil, "OVERLAY")
	SkadaSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkadaSkinButton.text:SetPoint("CENTER", SkadaSkinButton, 0, 0)
	if (UISkinOptions.SkadaSkin == "Enabled") then SkadaSkinButton.text:SetText("|cff00ff00Skada|r") end
	if (UISkinOptions.SkadaSkin == "Disabled") then SkadaSkinButton.text:SetText("|cffff2020Skada|r") end
	if not IsAddOnLoaded("Skada") then SkadaSkinButton:Disable() SkadaSkinButton.text:SetText("|cFF808080Skada|r") end
	SkadaSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SkadaSkin == "Enabled") then
			UISkinOptions.SkadaSkin = "Disabled"
			SkadaSkinButton.text:SetText("|cffff2020Skada|r")
		else
			UISkinOptions.SkadaSkin = "Enabled"
			SkadaSkinButton.text:SetText("|cff00ff00Skada|r")
		end
	end)
	SkilletSkinButton = CreateFrame("Button", "SkilletSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SkilletSkinButton:SetPoint("TOPRIGHT", -12, -155)
	SkilletSkinButton:Size(200,20)
	cSkinButton(SkilletSkinButton)
	SkilletSkinButton.text = SkilletSkinButton:CreateFontString(nil, "OVERLAY")
	SkilletSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkilletSkinButton.text:SetPoint("CENTER", SkilletSkinButton, 0, 0)
	if (UISkinOptions.SkilletSkin == "Enabled") then SkilletSkinButton.text:SetText("|cff00ff00Skillet|r") end
	if (UISkinOptions.SkilletSkin == "Disabled") then SkilletSkinButton.text:SetText("|cffff2020Skillet|r") end
	if not IsAddOnLoaded("Skillet") then SkilletSkinButton:Disable() SkilletSkinButton.text:SetText("|cFF808080Skillet|r") end
	SkilletSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SkilletSkin == "Enabled") then
			UISkinOptions.SkilletSkin = "Disabled"
			SkilletSkinButton.text:SetText("|cffff2020Skillet|r")
		else
			UISkinOptions.SkilletSkin = "Enabled"
			SkilletSkinButton.text:SetText("|cff00ff00Skillet|r")
		end
	end)
	SpineCounterSkinButton = CreateFrame("Button", "SpineCounterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SpineCounterSkinButton:SetPoint("TOPRIGHT", -12, -180)
	SpineCounterSkinButton:Size(200,20)
	cSkinButton(SpineCounterSkinButton)
	SpineCounterSkinButton.text = SpineCounterSkinButton:CreateFontString(nil, "OVERLAY")
	SpineCounterSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SpineCounterSkinButton.text:SetPoint("CENTER", SpineCounterSkinButton, 0, 0)
	if (UISkinOptions.SpineCounterSkin == "Enabled") then SpineCounterSkinButton.text:SetText("|cff00ff00Spine Blood Counter|r") end
	if (UISkinOptions.SpineCounterSkin == "Disabled") then SpineCounterSkinButton.text:SetText("|cffff2020Spine Blood Counter|r") end
	if not IsAddOnLoaded("SpineCounter") then SpineCounterSkinButton:Disable() SpineCounterSkinButton.text:SetText("|cFF808080Spine Blood Counter|r") end
	SpineCounterSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SpineCounterSkin == "Enabled") then
			UISkinOptions.SpineCounterSkin = "Disabled"
			SpineCounterSkinButton.text:SetText("|cffff2020Spine Blood Counter|r")
		else
			UISkinOptions.SpineCounterSkin = "Enabled"
			SpineCounterSkinButton.text:SetText("|cff00ff00Spine Blood Counter|r")
		end
	end)
	SpySkinButton = CreateFrame("Button", "SpySkinButton", SkinOptions, "UIPanelButtonTemplate")
	SpySkinButton:SetPoint("TOPRIGHT", -12, -205)
	SpySkinButton:Size(200,20)
	cSkinButton(SpySkinButton)
	SpySkinButton.text = SpySkinButton:CreateFontString(nil, "OVERLAY")
	SpySkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SpySkinButton.text:SetPoint("CENTER", SpySkinButton, 0, 0)
	if (UISkinOptions.SpySkin == "Enabled") then SpySkinButton.text:SetText("|cff00ff00Spy|r") end
	if (UISkinOptions.SpySkin == "Disabled") then SpySkinButton.text:SetText("|cffff2020Spy|r") end
	if not IsAddOnLoaded("Spy") then SpySkinButton:Disable() SpySkinButton.text:SetText("|cFF808080Spy|r") end
	SpySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SpySkin == "Enabled") then
			UISkinOptions.SpySkin = "Disabled"
			SpySkinButton.text:SetText("|cffff2020Spy|r")
		else
			UISkinOptions.SpySkin = "Enabled"
			SpySkinButton.text:SetText("|cff00ff00Spy|r")
		end
	end)
	stAddonManagerSkinButton = CreateFrame("Button", "stAddonManagerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	stAddonManagerSkinButton:SetPoint("TOPRIGHT", -12, -230)
	stAddonManagerSkinButton:Size(200,20)
	cSkinButton(stAddonManagerSkinButton)
	stAddonManagerSkinButton.text = stAddonManagerSkinButton:CreateFontString(nil, "OVERLAY")
	stAddonManagerSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	stAddonManagerSkinButton.text:SetPoint("CENTER", stAddonManagerSkinButton, 0, 0)
	if (UISkinOptions.stAddonManagerSkin == "Enabled") then stAddonManagerSkinButton.text:SetText("|cff00ff00stAddonManager|r") end
	if (UISkinOptions.stAddonManagerSkin == "Disabled") then stAddonManagerSkinButton.text:SetText("|cffff2020stAddonManager|r") end
	if not IsAddOnLoaded("stAddonmanager") then stAddonManagerSkinButton:Disable() stAddonManagerSkinButton.text:SetText("|cFF808080stAddonManager|r") end
	stAddonManagerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.stAddonManagerSkin == "Enabled") then
			UISkinOptions.stAddonManagerSkin = "Disabled"
			stAddonManagerSkinButton.text:SetText("|cffff2020stAddonManager|r")
		else
			UISkinOptions.stAddonManagerSkin = "Enabled"
			stAddonManagerSkinButton.text:SetText("|cff00ff00stAddonManager|r")
		end
	end)
	SwatterSkinButton = CreateFrame("Button", "SwatterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SwatterSkinButton:SetPoint("TOPRIGHT", -12, -255)
	SwatterSkinButton:Size(200,20)
	cSkinButton(SwatterSkinButton)
	SwatterSkinButton.text = SwatterSkinButton:CreateFontString(nil, "OVERLAY")
	SwatterSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SwatterSkinButton.text:SetPoint("CENTER", SwatterSkinButton, 0, 0)
	if (UISkinOptions.SwatterSkin == "Enabled") then SwatterSkinButton.text:SetText("|cff00ff00Swatter|r") end
	if (UISkinOptions.SwatterSkin == "Disabled") then SwatterSkinButton.text:SetText("|cffff2020Swatter|r") end
	if not IsAddOnLoaded("!Swatter") then SwatterSkinButton:Disable() SwatterSkinButton.text:SetText("|cFF808080Swatter|r") end
	SwatterSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SwatterSkin == "Enabled") then
			UISkinOptions.SwatterSkin = "Disabled"
			SwatterSkinButton.text:SetText("|cffff2020Swatter|r")
		else
			UISkinOptions.SwatterSkin = "Enabled"
			SwatterSkinButton.text:SetText("|cff00ff00Swatter|r")
		end
	end)
	TellMeWhenSkinButton = CreateFrame("Button", "TellMeWhenSkinButton", SkinOptions, "UIPanelButtonTemplate")
	TellMeWhenSkinButton:SetPoint("TOPRIGHT", -12, -280)
	TellMeWhenSkinButton:Size(200,20)
	cSkinButton(TellMeWhenSkinButton)
	TellMeWhenSkinButton.text = TellMeWhenSkinButton:CreateFontString(nil, "OVERLAY")
	TellMeWhenSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	TellMeWhenSkinButton.text:SetPoint("CENTER", TellMeWhenSkinButton, 0, 0)
	if (UISkinOptions.TellMeWhenSkin == "Enabled") then TellMeWhenSkinButton.text:SetText("|cff00ff00TellMeWhen|r") end
	if (UISkinOptions.TellMeWhenSkin == "Disabled") then TellMeWhenSkinButton.text:SetText("|cffff2020TellMeWhen|r") end
	if not IsAddOnLoaded("TellMeWhen") then TellMeWhenSkinButton:Disable() TellMeWhenSkinButton.text:SetText("|cFF808080TellMeWhen|r") end
	TellMeWhenSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.TellMeWhenSkin == "Enabled") then
			UISkinOptions.TellMeWhenSkin = "Disabled"
			TellMeWhenSkinButton.text:SetText("|cffff2020TellMeWhen|r")
		else
			UISkinOptions.TellMeWhenSkin = "Enabled"
			TellMeWhenSkinButton.text:SetText("|cff00ff00TellMeWhen|r")
		end
	end)
	TinyDPSSkinButton = CreateFrame("Button", "TinyDPSSkinButton", SkinOptions, "UIPanelButtonTemplate")
	TinyDPSSkinButton:SetPoint("TOPRIGHT", -12, -305)
	TinyDPSSkinButton:Size(200,20)
	cSkinButton(TinyDPSSkinButton)
	TinyDPSSkinButton.text = TinyDPSSkinButton:CreateFontString(nil, "OVERLAY")
	TinyDPSSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	TinyDPSSkinButton.text:SetPoint("CENTER", TinyDPSSkinButton, 0, 0)
	if (UISkinOptions.TinyDPSSkin == "Enabled") then TinyDPSSkinButton.text:SetText("|cff00ff00TinyDPS|r") end
	if (UISkinOptions.TinyDPSSkin == "Disabled") then TinyDPSSkinButton.text:SetText("|cffff2020TinyDPS|r") end
	if not IsAddOnLoaded("TinyDPS") then TinyDPSSkinButton:Disable() TinyDPSSkinButton.text:SetText("|cFF808080TinyDPS|r") end
	TinyDPSSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.TinyDPSSkin == "Enabled") then
			UISkinOptions.TinyDPSSkin = "Disabled"
			TinyDPSSkinButton.text:SetText("|cffff2020TinyDPS|r")
		else
			UISkinOptions.TinyDPSSkin = "Enabled"
			TinyDPSSkinButton.text:SetText("|cff00ff00TinyDPS|r")
		end
	end)
	TitanPanelSkinButton = CreateFrame("Button", "TitanPanelSkinButton", SkinOptions, "UIPanelButtonTemplate")
	TitanPanelSkinButton:SetPoint("TOPRIGHT", -12, -330)
	TitanPanelSkinButton:Size(200,20)
	cSkinButton(TitanPanelSkinButton)
	TitanPanelSkinButton.text = TitanPanelSkinButton:CreateFontString(nil, "OVERLAY")
	TitanPanelSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	TitanPanelSkinButton.text:SetPoint("CENTER", TitanPanelSkinButton, 0, 0)
	if (UISkinOptions.TitanPanelSkin == "Enabled") then TitanPanelSkinButton.text:SetText("|cff00ff00TitanPanel|r") end
	if (UISkinOptions.TitanPanelSkin == "Disabled") then TitanPanelSkinButton.text:SetText("|cffff2020TitanPanel|r") end
	if not IsAddOnLoaded("Titan") then TitanPanelSkinButton:Disable() TitanPanelSkinButton.text:SetText("|cFF808080TitanPanel|r") end
	TitanPanelSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.TitanPanelSkin == "Enabled") then
			UISkinOptions.TitanPanelSkin = "Disabled"
			TitanPanelSkinButton.text:SetText("|cffff2020TitanPanel|r")
		else
			UISkinOptions.TitanPanelSkin = "Enabled"
			TitanPanelSkinButton.text:SetText("|cff00ff00TitanPanel|r")
		end
	end)
	WowLuaSkinButton = CreateFrame("Button", "WowLuaSkinButton", SkinOptions, "UIPanelButtonTemplate")
	WowLuaSkinButton:SetPoint("TOPRIGHT", -12, -355)
	WowLuaSkinButton:Size(200,20)
	cSkinButton(WowLuaSkinButton)
	WowLuaSkinButton.text = WowLuaSkinButton:CreateFontString(nil, "OVERLAY")
	WowLuaSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	WowLuaSkinButton.text:SetPoint("CENTER", WowLuaSkinButton, 0, 0)
	if (UISkinOptions.WowLuaSkin == "Enabled") then WowLuaSkinButton.text:SetText("|cff00ff00WowLua|r") end
	if (UISkinOptions.WowLuaSkin == "Disabled") then WowLuaSkinButton.text:SetText("|cffff2020WowLua|r") end
	if not IsAddOnLoaded("WowLua") then WowLuaSkinButton:Disable() WowLuaSkinButton.text:SetText("|cFF808080WowLua|r") end
	WowLuaSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.WowLuaSkin == "Enabled") then
			UISkinOptions.WowLuaSkin = "Disabled"
			WowLuaSkinButton.text:SetText("|cffff2020WowLua|r")
		else
			UISkinOptions.WowLuaSkin = "Enabled"
			WowLuaSkinButton.text:SetText("|cff00ff00WowLua|r")
		end
	end)
if IsAddOnLoaded("ElvUI") then
-- ElvUI Only
	CLCInfoSkinButton = CreateFrame("Button", "CLCInfoSkinButton", SkinOptions2, "UIPanelButtonTemplate")
	CLCInfoSkinButton:SetPoint("TOP", 0, -105)
	CLCInfoSkinButton:Size(175,20)
	cSkinButton(CLCInfoSkinButton)
	CLCInfoSkinButton.text = CLCInfoSkinButton:CreateFontString(nil, "OVERLAY")
	CLCInfoSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	CLCInfoSkinButton.text:SetPoint("CENTER", CLCInfoSkinButton, 0, 0)
	if (UISkinOptions.CLCInfoSkin == "Enabled") then CLCInfoSkinButton.text:SetText("|cff00ff00CLCInfo|r") end
	if (UISkinOptions.CLCInfoSkin == "Disabled") then CLCInfoSkinButton.text:SetText("|cffff2020CLCInfo|r") end
	if not IsAddOnLoaded("CLCInfo") then CLCInfoSkinButton:Disable() CLCInfoSkinButton.text:SetText("|cFF808080CLCInfo|r") end
	CLCInfoSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.CLCInfoSkin == "Enabled") then
			UISkinOptions.CLCInfoSkin = "Disabled"
			CLCInfoSkinButton.text:SetText("|cffff2020CLCInfo|r")
		else
			UISkinOptions.CLCInfoSkin = "Enabled"
			CLCInfoSkinButton.text:SetText("|cff00ff00CLCInfo|r")
		end
	end)
	CLCProtSkinButton = CreateFrame("Button", "CLCProtSkinButton", SkinOptions2, "UIPanelButtonTemplate")
	CLCProtSkinButton:SetPoint("TOP", 0, -130)
	CLCProtSkinButton:Size(175,20)
	cSkinButton(CLCProtSkinButton)
	CLCProtSkinButton.text = CLCProtSkinButton:CreateFontString(nil, "OVERLAY")
	CLCProtSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	CLCProtSkinButton.text:SetPoint("CENTER", CLCProtSkinButton, 0, 0)
	if (UISkinOptions.CLCProtSkin == "Enabled") then CLCProtSkinButton.text:SetText("|cff00ff00CLCProt|r") end
	if (UISkinOptions.CLCProtSkin == "Disabled") then CLCProtSkinButton.text:SetText("|cffff2020CLCProt|r") end
	if not IsAddOnLoaded("CLCProt") then CLCProtSkinButton:Disable() CLCProtSkinButton.text:SetText("|cFF808080CLCProt|r") end
	CLCProtSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.CLCProtSkin == "Enabled") then
			UISkinOptions.CLCProtSkin = "Disabled"
			CLCProtSkinButton.text:SetText("|cffff2020CLCProt|r")
		else
			UISkinOptions.CLCProtSkin = "Enabled"
			CLCProtSkinButton.text:SetText("|cff00ff00CLCProt|r")
		end
	end)
	CLCRetSkinButton = CreateFrame("Button", "CLCRetSkinButton", SkinOptions2, "UIPanelButtonTemplate")
	CLCRetSkinButton:SetPoint("TOP", 0, -155)
	CLCRetSkinButton:Size(175,20)
	cSkinButton(CLCRetSkinButton)
	CLCRetSkinButton.text = CLCRetSkinButton:CreateFontString(nil, "OVERLAY")
	CLCRetSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	CLCRetSkinButton.text:SetPoint("CENTER", CLCRetSkinButton, 0, 0)
	if (UISkinOptions.CLCRetSkin == "Enabled") then CLCRetSkinButton.text:SetText("|cff00ff00CLCRet|r") end
	if (UISkinOptions.CLCRetSkin == "Disabled") then CLCRetSkinButton.text:SetText("|cffff2020CLCRet|r") end
	if not IsAddOnLoaded("CLCRet") then CLCRetSkinButton:Disable() CLCRetSkinButton.text:SetText("|cFF808080CLCRet|r") end
	CLCRetSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.CLCRetSkin == "Enabled") then
			UISkinOptions.CLCRetSkin = "Disabled"
			CLCRetSkinButton.text:SetText("|cffff2020CLCRet|r")
		else
			UISkinOptions.CLCRetSkin = "Enabled"
			CLCRetSkinButton.text:SetText("|cff00ff00CLCRet|r")
		end
	end)
	PowerAurasIconsSkinButton = CreateFrame("Button", "PowerAurasIconsSkinButton", SkinOptions2, "UIPanelButtonTemplate")
	PowerAurasIconsSkinButton:SetPoint("TOP", 0, -180)
	PowerAurasIconsSkinButton:Size(175,20)
	cSkinButton(PowerAurasIconsSkinButton)
	PowerAurasIconsSkinButton.text = PowerAurasIconsSkinButton:CreateFontString(nil, "OVERLAY")
	PowerAurasIconsSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	PowerAurasIconsSkinButton.text:SetPoint("CENTER", PowerAurasIconsSkinButton, 0, 0)
	if (UISkinOptions.PowerAurasIconsSkin == "Enabled") then PowerAurasIconsSkinButton.text:SetText("|cff00ff00PowerAurasIcons Icon's|r") end
	if (UISkinOptions.PowerAurasIconsSkin == "Disabled") then PowerAurasIconsSkinButton.text:SetText("|cffff2020PowerAurasIcons Icon's|r") end
	if not IsAddOnLoaded("PowerAuras") then PowerAurasIconsSkinButton:Disable() PowerAurasIconsSkinButton.text:SetText("|cFF808080PowerAuras|r") end
	PowerAurasIconsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PowerAurasIconsSkin == "Enabled") then
			UISkinOptions.PowerAurasIconsSkin = "Disabled"
			PowerAurasIconsSkinButton.text:SetText("|cffff2020PowerAurasIcons Icon's|r")
		else
			UISkinOptions.PowerAurasIconsSkin = "Enabled"
			PowerAurasIconsSkinButton.text:SetText("|cff00ff00PowerAurasIcons Icon's|r")
		end
	end)
	WeakAuraSkinButton = CreateFrame("Button", "WeakAuraSkinButton", SkinOptions2, "UIPanelButtonTemplate")
	WeakAuraSkinButton:SetPoint("TOP", 0, -205)
	WeakAuraSkinButton:Size(175,20)
	cSkinButton(WeakAuraSkinButton)
	WeakAuraSkinButton.text = WeakAuraSkinButton:CreateFontString(nil, "OVERLAY")
	WeakAuraSkinButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	WeakAuraSkinButton.text:SetPoint("CENTER", WeakAuraSkinButton, 0, 0)
	if (UISkinOptions.WeakAuraSkin == "Enabled") then WeakAuraSkinButton.text:SetText("|cff00ff00WeakAura Icon's|r") end
	if (UISkinOptions.WeakAuraSkin == "Disabled") then WeakAuraSkinButton.text:SetText("|cffff2020WeakAura Icon's|r") end
	if not IsAddOnLoaded("WeakAura") then WeakAuraSkinButton:Disable() WeakAuraSkinButton.text:SetText("|cFF808080WeakAura|r") end
	WeakAuraSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.WeakAuraSkin == "Enabled") then
			UISkinOptions.WeakAuraSkin = "Disabled"
			WeakAuraSkinButton.text:SetText("|cffff2020WeakAura Icon's|r")
		else
			UISkinOptions.WeakAuraSkin = "Enabled"
			WeakAuraSkinButton.text:SetText("|cff00ff00WeakAura Icon's|r")
		end
	end)
end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

SLASH_SKINOPTIONSWINDOW1 = '/skinoptions';
function SlashCmdList.SKINOPTIONSWINDOW(msg, editbox)
	if SkinOptions:IsVisible() then
		SkinOptions:Hide()
		print("Skin Control Panel is now |cffff2020Hidden|r.");
	else
		SkinOptions:Show()
		print("Skin Control Panel is now |cff00ff00Shown|r.");
	end
end

end)