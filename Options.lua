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
	if(UISkinOptions.ProfessionTabsSkin == nil) then UISkinOptions.ProfessionTabsSkin = "Enabled" end
	if(UISkinOptions.RaidInviteOrganizerSkin == nil) then UISkinOptions.RaidInviteOrganizerSkin = "Enabled" end
	if(UISkinOptions.RaidBuffStatusSkin == nil) then UISkinOptions.RaidBuffStatusSkin = "Enabled" end
	if(UISkinOptions.SearingPlasmaTrackerSkin == nil) then UISkinOptions.SearingPlasmaTrackerSkin = "Enabled" end
	if(UISkinOptions.SkilletSkin == nil) then UISkinOptions.SkilletSkin = "Enabled" end
	if(UISkinOptions.SpineCounterSkin == nil) then UISkinOptions.SpineCounterSkin = "Enabled" end
	if(UISkinOptions.SpySkin == nil) then UISkinOptions.SpySkin = "Enabled" end
	if(UISkinOptions.SwatterSkin == nil) then UISkinOptions.SwatterSkin = "Enabled" end
	if(UISkinOptions.TinyDPSSkin == nil) then UISkinOptions.TinyDPSSkin = "Disabled" end
	if(UISkinOptions.TitanPanelSkin == nil) then UISkinOptions.TitanPanelSkin = "Enabled" end
	if(UISkinOptions.WeakAuraSkin == nil) then UISkinOptions.WeakAuraSkin = "Enabled" end
	if(UISkinOptions.WowLuaSkin == nil) then UISkinOptions.WowLuaSkin = "Enabled" end
	end)

local SkinOptions = CreateFrame("Frame", "SkinOptions", UIParent)
	SkinOptions:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinOptions:SetScript( "OnEvent", function(self)
	if IsAddOnLoaded("Tukui") then UIFont = [[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]] end
	if IsAddOnLoaded("ElvUI") then UIFont = [[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]] end
	SkinOptions:Hide()
	SkinOptions:SetTemplate("Transparent")
	SkinOptions:Point("CENTER", UIParent, "CENTER", 0, 0)
	SkinOptions:SetFrameStrata("MEDIUM")
	SkinOptions:Width(648)
	SkinOptions:Height(500)
	SkinOptions:SetClampedToScreen(true)
	SkinOptions:SetMovable(true)
	SkinOptions.text = SkinOptions:CreateFontString(nil, "OVERLAY")
	SkinOptions.text:SetFont(UIFont, 16, "OUTLINE")
	SkinOptions.text:SetPoint("TOP", SkinOptions, 0, -6)
	SkinOptions.text:SetText("|cffC495DDTukui|r & |cff1784d1ElvUI|r Extra Skin Options by |cff2F9E00Azilroka|r")
	SkinOptions:EnableMouse(true)
	SkinOptions:RegisterForDrag("LeftButton");
	SkinOptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
	SkinOptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	ApplySkinSettingsButton = CreateFrame("Button", "ApplySkinSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	ApplySkinSettingsButton:SetPoint("BOTTOMLEFT", 0, -26)
	ApplySkinSettingsButton:Size(217,24)
	cSkinButton(ApplySkinSettingsButton)
	ApplySkinSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	ApplySkinSettingsButton.text:SetFont(UIFont, 12, "OUTLINE")
	ApplySkinSettingsButton.text:SetPoint("CENTER", ApplySkinSettingsButton, 0, 0)
	ApplySkinSettingsButton.text:SetText("Apply Skin Settings")
	ApplySkinSettingsButton:HookScript("OnClick", function() ReloadUI() end)

	EmbedWindowSettingsButton = CreateFrame("Button", "EmbedWindowSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	EmbedWindowSettingsButton:SetPoint("BOTTOM", 0, -26)
	EmbedWindowSettingsButton:Size(212,24)
	cSkinButton(EmbedWindowSettingsButton)
	EmbedWindowSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	EmbedWindowSettingsButton.text:SetFont(UIFont, 12, "OUTLINE")
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
	SkinOptionsCloseButton.text:SetFont(UIFont, 12, "OUTLINE")
	SkinOptionsCloseButton.text:SetPoint("CENTER", SkinOptionsCloseButton, 0, 0)
	SkinOptionsCloseButton.text:SetText("Close Skin Options")
	SkinOptionsCloseButton:HookScript("OnClick", function() SkinOptions:Hide() end)

--Buttons
	GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -40)
	SkinOptionsButton = CreateFrame("Button", "SkinOptionsButton", GameMenuFrame, "GameMenuButtonTemplate")
	SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -1)
	SkinOptionsButton:Size(144,21)
	cSkinButton(SkinOptionsButton)
	SkinOptionsButton.text = SkinOptionsButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsButton.text:SetFont(UIFont, 12)
	SkinOptionsButton.text:SetPoint("CENTER", SkinOptionsButton, 0, 0)
	SkinOptionsButton.text:SetText("Skins")
	SkinOptionsButton:HookScript("OnClick", function() SkinOptions:Show() HideUIPanel(GameMenuFrame) end)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)

	ACPSkinButton = CreateFrame("Button", "ACPSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ACPSkinButton:SetPoint("TOPLEFT", 12, -40)
	ACPSkinButton:Size(200,24)
	cSkinButton(ACPSkinButton)
	ACPSkinButton.text = ACPSkinButton:CreateFontString(nil, "OVERLAY")
	ACPSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	ACPSkinButton.text:SetPoint("CENTER", ACPSkinButton, 0, 0)
	if (UISkinOptions.ACPSkin == "Enabled") then ACPSkinButton.text:SetText("Addon Control Panel Skin |cff00ff00"..UISkinOptions.ACPSkin.."|r") end
	if (UISkinOptions.ACPSkin == "Disabled") then ACPSkinButton.text:SetText("Addon Control Panel Skin |cffff2020"..UISkinOptions.ACPSkin.."|r") end
	if not IsAddOnLoaded("ACP") then ACPSkinButton:Disable() ACPSkinButton.text:SetText("|cFF808080Addon Control Panel Not Detected|r") end
	ACPSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ACPSkin == "Enabled") then
			UISkinOptions.ACPSkin = "Disabled"			
			ACPSkinButton.text:SetText("Addon Control Panel Skin |cffff2020"..UISkinOptions.ACPSkin.."|r")
		else
			UISkinOptions.ACPSkin = "Enabled"
			ACPSkinButton.text:SetText("Addon Control Panel Skin |cff00ff00"..UISkinOptions.ACPSkin.."|r")
		end
	end)
	AdiBagsSkinButton = CreateFrame("Button", "AdiBagsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AdiBagsSkinButton:SetPoint("TOPLEFT", 12, -70)
	AdiBagsSkinButton:Size(200,24)
	cSkinButton(AdiBagsSkinButton)
	AdiBagsSkinButton.text = AdiBagsSkinButton:CreateFontString(nil, "OVERLAY")
	AdiBagsSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	AdiBagsSkinButton.text:SetPoint("CENTER", AdiBagsSkinButton, 0, 0)
	if (UISkinOptions.AdiBagsSkin == "Enabled") then AdiBagsSkinButton.text:SetText("AdiBags Skin |cff00ff00"..UISkinOptions.AdiBagsSkin.."|r") end
	if (UISkinOptions.AdiBagsSkin == "Disabled") then AdiBagsSkinButton.text:SetText("AdiBags Skin |cffff2020"..UISkinOptions.AdiBagsSkin.."|r") end
	if not IsAddOnLoaded("AdiBags") then AdiBagsSkinButton:Disable() AdiBagsSkinButton.text:SetText("|cFF808080AdiBags Not Detected|r") end
	AdiBagsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AdiBagsSkin == "Enabled") then
			UISkinOptions.AdiBagsSkin = "Disabled"			
			AdiBagsSkinButton.text:SetText("AdiBags Skin |cffff2020"..UISkinOptions.AdiBagsSkin.."|r")
		else
			UISkinOptions.AdiBagsSkin = "Enabled"
			AdiBagsSkinButton.text:SetText("AdiBags Skin |cff00ff00"..UISkinOptions.AdiBagsSkin.."|r")
		end
	end)
	AltoholicSkinButton = CreateFrame("Button", "AltoholicSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AltoholicSkinButton:SetPoint("TOPLEFT", 12, -100)
	AltoholicSkinButton:Size(200,24)
	cSkinButton(AltoholicSkinButton)
	AltoholicSkinButton.text = AltoholicSkinButton:CreateFontString(nil, "OVERLAY")
	AltoholicSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	AltoholicSkinButton.text:SetPoint("CENTER", AltoholicSkinButton, 0, 0)
	if (UISkinOptions.AltoholicSkin == "Enabled") then AltoholicSkinButton.text:SetText("Altoholic Skin |cff00ff00"..UISkinOptions.AltoholicSkin.."|r") end
	if (UISkinOptions.AltoholicSkin == "Disabled") then AltoholicSkinButton.text:SetText("Altoholic Skin |cffff2020"..UISkinOptions.AltoholicSkin.."|r") end
	if not IsAddOnLoaded("Altoholic") then AltoholicSkinButton:Disable() AltoholicSkinButton.text:SetText("|cFF808080Altoholic Not Detected|r") end
	AltoholicSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AltoholicSkin == "Enabled") then
			UISkinOptions.AltoholicSkin = "Disabled"			
			AltoholicSkinButton.text:SetText("Altoholic Skin |cffff2020"..UISkinOptions.AltoholicSkin.."|r")
		else
			UISkinOptions.AltoholicSkin = "Enabled"
			AltoholicSkinButton.text:SetText("Altoholic Skin |cff00ff00"..UISkinOptions.AltoholicSkin.."|r")
		end
	end)
	ArchySkinButton = CreateFrame("Button", "ArchySkinButton", SkinOptions, "UIPanelButtonTemplate")
	ArchySkinButton:SetPoint("TOPLEFT", 12, -130)
	ArchySkinButton:Size(200,24)
	cSkinButton(ArchySkinButton)
	ArchySkinButton.text = ArchySkinButton:CreateFontString(nil, "OVERLAY")
	ArchySkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	ArchySkinButton.text:SetPoint("CENTER", ArchySkinButton, 0, 0)
	if (UISkinOptions.ArchySkin == "Enabled") then ArchySkinButton.text:SetText("Archy Skin |cff00ff00"..UISkinOptions.ArchySkin.."|r") end
	if (UISkinOptions.ArchySkin == "Disabled") then ArchySkinButton.text:SetText("Archy Skin |cffff2020"..UISkinOptions.ArchySkin.."|r") end
	if not IsAddOnLoaded("Archy") then ArchySkinButton:Disable() ArchySkinButton.text:SetText("|cFF808080Archy Not Detected|r") end
	ArchySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ArchySkin == "Enabled") then
			UISkinOptions.ArchySkin = "Disabled"			
			ArchySkinButton.text:SetText("Archy Skin |cffff2020"..UISkinOptions.ArchySkin.."|r")
		else
			UISkinOptions.ArchySkin = "Enabled"
			ArchySkinButton.text:SetText("Archy Skin |cff00ff00"..UISkinOptions.ArchySkin.."|r")
		end
	end)
	AtlasLootSkinButton = CreateFrame("Button", "AtlasLootSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AtlasLootSkinButton:SetPoint("TOPLEFT", 12, -160)
	AtlasLootSkinButton:Size(200,24)
	cSkinButton(AtlasLootSkinButton)
	AtlasLootSkinButton.text = AtlasLootSkinButton:CreateFontString(nil, "OVERLAY")
	AtlasLootSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	AtlasLootSkinButton.text:SetPoint("CENTER", AtlasLootSkinButton, 0, 0)
	if (UISkinOptions.AtlasLootSkin == "Enabled") then AtlasLootSkinButton.text:SetText("AtlasLoot Skin |cff00ff00"..UISkinOptions.AtlasLootSkin.."|r") end
	if (UISkinOptions.AtlasLootSkin == "Disabled") then AtlasLootSkinButton.text:SetText("AtlasLoot Skin |cffff2020"..UISkinOptions.AtlasLootSkin.."|r") end
	if not IsAddOnLoaded("AtlasLoot_Loader") then AtlasLootSkinButton:Disable() AtlasLootSkinButton.text:SetText("|cFF808080AtlasLoot Not Detected|r") end
	AtlasLootSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AtlasLootSkin == "Enabled") then
			UISkinOptions.AtlasLootSkin = "Disabled"			
			AtlasLootSkinButton.text:SetText("AtlasLoot Skin |cffff2020"..UISkinOptions.AtlasLootSkin.."|r")
		else
			UISkinOptions.AtlasLootSkin = "Enabled"
			AtlasLootSkinButton.text:SetText("AtlasLoot Skin |cff00ff00"..UISkinOptions.AtlasLootSkin.."|r")
		end
	end)
	ATSWSkinButton = CreateFrame("Button", "ATSWSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ATSWSkinButton:SetPoint("TOPLEFT", 12, -190)
	ATSWSkinButton:Size(200,24)
	cSkinButton(ATSWSkinButton)
	ATSWSkinButton.text = ATSWSkinButton:CreateFontString(nil, "OVERLAY")
	ATSWSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	ATSWSkinButton.text:SetPoint("CENTER", ATSWSkinButton, 0, 0)
	if (UISkinOptions.ATSWSkin == "Enabled") then ATSWSkinButton.text:SetText("ATSW Skin |cff00ff00"..UISkinOptions.ATSWSkin.."|r") end
	if (UISkinOptions.ATSWSkin == "Disabled") then ATSWSkinButton.text:SetText("ATSW Skin |cffff2020"..UISkinOptions.ATSWSkin.."|r") end
	if not IsAddOnLoaded("AdvancedTradeSkillWindow") then ATSWSkinButton:Disable() ATSWSkinButton.text:SetText("|cFF808080ATSW Not Detected|r") end
	ATSWSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ATSWSkin == "Enabled") then
			UISkinOptions.ATSWSkin = "Disabled"			
			ATSWSkinButton.text:SetText("ATSW Skin |cffff2020"..UISkinOptions.ATSWSkin.."|r")
		else
			UISkinOptions.ATSWSkin = "Enabled"
			ATSWSkinButton.text:SetText("ATSW Skin |cff00ff00"..UISkinOptions.ATSWSkin.."|r")
		end
	end)
	AuctionatorSkinButton = CreateFrame("Button", "AuctionatorSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AuctionatorSkinButton:SetPoint("TOPLEFT", 12, -220)
	AuctionatorSkinButton:Size(200,24)
	cSkinButton(AuctionatorSkinButton)
	AuctionatorSkinButton.text = AuctionatorSkinButton:CreateFontString(nil, "OVERLAY")
	AuctionatorSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	AuctionatorSkinButton.text:SetPoint("CENTER", AuctionatorSkinButton, 0, 0)
	if (UISkinOptions.AuctionatorSkin == "Enabled") then AuctionatorSkinButton.text:SetText("Auctionator Skin |cff00ff00"..UISkinOptions.AuctionatorSkin.."|r") end
	if (UISkinOptions.AuctionatorSkin == "Disabled") then AuctionatorSkinButton.text:SetText("Auctionator Skin |cffff2020"..UISkinOptions.AuctionatorSkin.."|r") end
	if not IsAddOnLoaded("Auctionator") then AuctionatorSkinButton:Disable() AuctionatorSkinButton.text:SetText("|cFF808080Auctionator Not Detected|r") end
	AuctionatorSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AuctionatorSkin == "Enabled") then
			UISkinOptions.AuctionatorSkin = "Disabled"			
			AuctionatorSkinButton.text:SetText("Auctionator Skin |cffff2020"..UISkinOptions.AuctionatorSkin.."|r")
		else
			UISkinOptions.AuctionatorSkin = "Enabled"
			AuctionatorSkinButton.text:SetText("Auctionator Skin |cff00ff00"..UISkinOptions.AuctionatorSkin.."|r")
		end
	end)
	AuctioneerSkinButton = CreateFrame("Button", "AuctioneerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AuctioneerSkinButton:SetPoint("TOPLEFT", 12, -250)
	AuctioneerSkinButton:Size(200,24)
	cSkinButton(AuctioneerSkinButton)
	AuctioneerSkinButton.text = AuctioneerSkinButton:CreateFontString(nil, "OVERLAY")
	AuctioneerSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	AuctioneerSkinButton.text:SetPoint("CENTER", AuctioneerSkinButton, 0, 0)
	if (UISkinOptions.AuctioneerSkin == "Enabled") then AuctioneerSkinButton.text:SetText("Auctioneer Skin |cff00ff00"..UISkinOptions.AuctioneerSkin.."|r") end
	if (UISkinOptions.AuctioneerSkin == "Disabled") then AuctioneerSkinButton.text:SetText("Auctioneer Skin |cffff2020"..UISkinOptions.AuctioneerSkin.."|r") end
	if not IsAddOnLoaded("Auc-Advanced") then AuctioneerSkinButton:Disable() AuctioneerSkinButton.text:SetText("|cFF808080Auctioneer Not Detected|r") end
	AuctioneerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.AuctioneerSkin == "Enabled") then
			UISkinOptions.AuctioneerSkin = "Disabled"			
			AuctioneerSkinButton.text:SetText("Auctioneer Skin |cffff2020"..UISkinOptions.AuctioneerSkin.."|r")
		else
			UISkinOptions.AuctioneerSkin = "Enabled"
			AuctioneerSkinButton.text:SetText("Auctioneer Skin |cff00ff00"..UISkinOptions.AuctioneerSkin.."|r")
		end
	end)
--	BigWigsSkinButton = CreateFrame("Button", "BigWigsSkinButton", SkinOptions, "UIPanelButtonTemplate")
--	BigWigsSkinButton:SetPoint("TOPLEFT", 12, -280)
--	BigWigsSkinButton:Size(200,24)
--	cSkinButton(BigWigsSkinButton)
--	BigWigsSkinButton.text = BigWigsSkinButton:CreateFontString(nil, "OVERLAY")
--	BigWigsSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
--	BigWigsSkinButton.text:SetPoint("CENTER", BigWigsSkinButton, 0, 0)
--	if (UISkinOptions.BigWigsSkin == "Enabled") then BigWigsSkinButton.text:SetText("BigWigs Skin |cff00ff00"..UISkinOptions.BigWigsSkin.."|r") end
--	if (UISkinOptions.BigWigsSkin == "Disabled") then BigWigsSkinButton.text:SetText("BigWigs Skin |cffff2020"..UISkinOptions.BigWigsSkin.."|r") end
--	if not IsAddOnLoaded("BigWigs") then BigWigsSkinButton:Disable() BigWigsSkinButton.text:SetText("|cFF808080BigWigs Not Detected|r") end
--	BigWigsSkinButton:HookScript("OnClick", function()
--		if (UISkinOptions.BigWigsSkin == "Enabled") then
--			UISkinOptions.BigWigsSkin = "Disabled"			
--			BigWigsSkinButton.text:SetText("BigWigs Skin |cffff2020"..UISkinOptions.BigWigsSkin.."|r")
--		else
--			UISkinOptions.BigWigsSkin = "Enabled"
--			BigWigsSkinButton.text:SetText("BigWigs Skin |cff00ff00"..UISkinOptions.BigWigsSkin.."|r")
--		end
--	end)
	BGDefenderSkinButton = CreateFrame("Button", "BGDefenderSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BGDefenderSkinButton:SetPoint("TOPLEFT", 12, -280)
	BGDefenderSkinButton:Size(200,24)
	cSkinButton(BGDefenderSkinButton)
	BGDefenderSkinButton.text = BGDefenderSkinButton:CreateFontString(nil, "OVERLAY")
	BGDefenderSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	BGDefenderSkinButton.text:SetPoint("CENTER", BGDefenderSkinButton, 0, 0)
	if (UISkinOptions.BGDefenderSkin == "Enabled") then BGDefenderSkinButton.text:SetText("BGDefender Skin |cff00ff00"..UISkinOptions.BGDefenderSkin.."|r") end
	if (UISkinOptions.BGDefenderSkin == "Disabled") then BGDefenderSkinButton.text:SetText("BGDefender Skin |cffff2020"..UISkinOptions.BGDefenderSkin.."|r") end
	if not IsAddOnLoaded("BGDefender") then BGDefenderSkinButton:Disable() BGDefenderSkinButton.text:SetText("|cFF808080BGDefender Not Detected|r") end
	BGDefenderSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.BGDefenderSkin == "Enabled") then
			UISkinOptions.BGDefenderSkin = "Disabled"			
			BGDefenderSkinButton.text:SetText("BGDefender Skin |cffff2020"..UISkinOptions.BGDefenderSkin.."|r")
		else
			UISkinOptions.BGDefenderSkin = "Enabled"
			BGDefenderSkinButton.text:SetText("BGDefender Skin |cff00ff00"..UISkinOptions.BGDefenderSkin.."|r")
		end
	end)
	BuyEmAllSkinButton = CreateFrame("Button", "BuyEmAllSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BuyEmAllSkinButton:SetPoint("TOPLEFT", 12, -310)
	BuyEmAllSkinButton:Size(200,24)
	cSkinButton(BuyEmAllSkinButton)
	BuyEmAllSkinButton.text = BuyEmAllSkinButton:CreateFontString(nil, "OVERLAY")
	BuyEmAllSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	BuyEmAllSkinButton.text:SetPoint("CENTER", BuyEmAllSkinButton, 0, 0)
	if (UISkinOptions.BuyEmAllSkin == "Enabled") then BuyEmAllSkinButton.text:SetText("BuyEmAll Skin |cff00ff00"..UISkinOptions.BuyEmAllSkin.."|r") end
	if (UISkinOptions.BuyEmAllSkin == "Disabled") then BuyEmAllSkinButton.text:SetText("BuyEmAll Skin |cffff2020"..UISkinOptions.BuyEmAllSkin.."|r") end
	if not IsAddOnLoaded("BuyEmAll") then BuyEmAllSkinButton:Disable() BuyEmAllSkinButton.text:SetText("|cFF808080BuyEmAll Not Detected|r") end
	BuyEmAllSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.BuyEmAllSkin == "Enabled") then
			UISkinOptions.BuyEmAllSkin = "Disabled"			
			BuyEmAllSkinButton.text:SetText("BuyEmAll Skin |cffff2020"..UISkinOptions.BuyEmAllSkin.."|r")
		else
			UISkinOptions.BuyEmAllSkin = "Enabled"
			BuyEmAllSkinButton.text:SetText("BuyEmAll Skin |cff00ff00"..UISkinOptions.BuyEmAllSkin.."|r")
		end
	end)
	ChocolateBarSkinButton = CreateFrame("Button", "ChocolateBarSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ChocolateBarSkinButton:SetPoint("TOPLEFT", 12, -340)
	ChocolateBarSkinButton:Size(200,24)
	cSkinButton(ChocolateBarSkinButton)
	ChocolateBarSkinButton.text = ChocolateBarSkinButton:CreateFontString(nil, "OVERLAY")
	ChocolateBarSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	ChocolateBarSkinButton.text:SetPoint("CENTER", ChocolateBarSkinButton, 0, 0)
	if (UISkinOptions.ChocolateBarSkin == "Enabled") then ChocolateBarSkinButton.text:SetText("ChocolateBar Skin |cff00ff00"..UISkinOptions.ChocolateBarSkin.."|r") end
	if (UISkinOptions.ChocolateBarSkin == "Disabled") then ChocolateBarSkinButton.text:SetText("ChocolateBar Skin |cffff2020"..UISkinOptions.ChocolateBarSkin.."|r") end
	if not IsAddOnLoaded("ChocolateBar") then ChocolateBarSkinButton:Disable() ChocolateBarSkinButton.text:SetText("|cFF808080ChocolateBar Not Detected|r") end
	ChocolateBarSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ChocolateBarSkin == "Enabled") then
			UISkinOptions.ChocolateBarSkin = "Disabled"			
			ChocolateBarSkinButton.text:SetText("ChocolateBar Skin |cffff2020"..UISkinOptions.ChocolateBarSkin.."|r")
		else
			UISkinOptions.ChocolateBarSkin = "Enabled"
			ChocolateBarSkinButton.text:SetText("ChocolateBar Skin |cff00ff00"..UISkinOptions.ChocolateBarSkin.."|r")
		end
	end)
	CliqueSkinButton = CreateFrame("Button", "CliqueSkinButton", SkinOptions, "UIPanelButtonTemplate")
	CliqueSkinButton:SetPoint("TOPLEFT", 12, -370)
	CliqueSkinButton:Size(200,24)
	cSkinButton(CliqueSkinButton)
	CliqueSkinButton.text = CliqueSkinButton:CreateFontString(nil, "OVERLAY")
	CliqueSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	CliqueSkinButton.text:SetPoint("CENTER", CliqueSkinButton, 0, 0)
	if (UISkinOptions.CliqueSkin == "Enabled") then CliqueSkinButton.text:SetText("Clique Skin |cff00ff00"..UISkinOptions.CliqueSkin.."|r") end
	if (UISkinOptions.CliqueSkin == "Disabled") then CliqueSkinButton.text:SetText("Clique Skin |cffff2020"..UISkinOptions.CliqueSkin.."|r") end
	if not IsAddOnLoaded("Clique") then CliqueSkinButton:Disable() CliqueSkinButton.text:SetText("|cFF808080Clique Not Detected|r") end
	CliqueSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.CliqueSkin == "Enabled") then
			UISkinOptions.CliqueSkin = "Disabled"			
			CliqueSkinButton.text:SetText("Clique Skin |cffff2020"..UISkinOptions.CliqueSkin.."|r")
		else
			UISkinOptions.CliqueSkin = "Enabled"
			CliqueSkinButton.text:SetText("Clique Skin |cff00ff00"..UISkinOptions.CliqueSkin.."|r")
		end
	end)
	DBMSkinButton = CreateFrame("Button", "DBMSkinButton", SkinOptions, "UIPanelButtonTemplate")
	DBMSkinButton:SetPoint("TOPLEFT", 12, -400)
	DBMSkinButton:Size(200,24)
	cSkinButton(DBMSkinButton)
	DBMSkinButton.text = DBMSkinButton:CreateFontString(nil, "OVERLAY")
	DBMSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	DBMSkinButton.text:SetPoint("CENTER", DBMSkinButton, 0, 0)
	if (UISkinOptions.DBMSkin == "Enabled") then DBMSkinButton.text:SetText("DBM Skin |cff00ff00"..UISkinOptions.DBMSkin.."|r") end
	if (UISkinOptions.DBMSkin == "Disabled") then DBMSkinButton.text:SetText("DBM Skin |cffff2020"..UISkinOptions.DBMSkin.."|r") end
	if not IsAddOnLoaded("DBM-Core") then DBMSkinButton:Disable() DBMSkinButton.text:SetText("|cFF808080DBM Not Detected|r") end
	DBMSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.DBMSkin == "Enabled") then
			UISkinOptions.DBMSkin = "Disabled"			
			DBMSkinButton.text:SetText("DBM Skin |cffff2020"..UISkinOptions.DBMSkin.."|r")
		else
			UISkinOptions.DBMSkin = "Enabled"
			DBMSkinButton.text:SetText("DBM Skin |cff00ff00"..UISkinOptions.DBMSkin.."|r")
		end
	end)
--	DXESkinButton = CreateFrame("Button", "DXESkinButton", SkinOptions, "UIPanelButtonTemplate")
--	DXESkinButton:SetPoint("TOP", 0, -100)
--	DXESkinButton:Size(200,24)
--	cSkinButton(DXESkinButton)
--	DXESkinButton.text = DXESkinButton:CreateFontString(nil, "OVERLAY")
--	DXESkinButton.text:SetFont(UIFont, 12, "OUTLINE")
--	DXESkinButton.text:SetPoint("CENTER", DXESkinButton, 0, 0)
--	if (UISkinOptions.DXESkin == "Enabled") then DXESkinButton.text:SetText("DXE Skin |cff00ff00"..UISkinOptions.DXESkin.."|r") end
--	if (UISkinOptions.DXESkin == "Disabled") then DXESkinButton.text:SetText("DXE Skin |cffff2020"..UISkinOptions.DXESkin.."|r") end
--	if not IsAddOnLoaded("DXE_Loader") then DXESkinButton:Disable() DXESkinButton.text:SetText("|cFF808080DXE Not Detected|r") end
--	DXESkinButton:HookScript("OnClick", function()
--		if (UISkinOptions.DXESkin == "Enabled") then
--			UISkinOptions.DXESkin = "Disabled"			
--			DXESkinButton.text:SetText("DXE Skin |cffff2020"..UISkinOptions.DXESkin.."|r")
--		else
--			UISkinOptions.DXESkin = "Enabled"
--			DXESkinButton.text:SetText("DXE Skin |cff00ff00"..UISkinOptions.DXESkin.."|r")
--		end
--	end)
	EasyMailSkinButton = CreateFrame("Button", "EasyMailSkinButton", SkinOptions, "UIPanelButtonTemplate")
	EasyMailSkinButton:SetPoint("TOPLEFT", 12, -430)
	EasyMailSkinButton:Size(200,24)
	cSkinButton(EasyMailSkinButton)
	EasyMailSkinButton.text = EasyMailSkinButton:CreateFontString(nil, "OVERLAY")
	EasyMailSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	EasyMailSkinButton.text:SetPoint("CENTER", EasyMailSkinButton, 0, 0)
	if (UISkinOptions.EasyMailSkin == "Enabled") then EasyMailSkinButton.text:SetText("EasyMail Skin |cff00ff00"..UISkinOptions.EasyMailSkin.."|r") end
	if (UISkinOptions.EasyMailSkin == "Disabled") then EasyMailSkinButton.text:SetText("EasyMail Skin |cffff2020"..UISkinOptions.EasyMailSkin.."|r") end
	if not IsAddOnLoaded("EasyMail") then EasyMailSkinButton:Disable() EasyMailSkinButton.text:SetText("|cFF808080EasyMail Not Detected|r") end
	EasyMailSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.EasyMailSkin == "Enabled") then
			UISkinOptions.EasyMailSkin = "Disabled"			
			EasyMailSkinButton.text:SetText("EasyMail Skin |cffff2020"..UISkinOptions.EasyMailSkin.."|r")
		else
			UISkinOptions.EasyMailSkin = "Enabled"
			EasyMailSkinButton.text:SetText("EasyMail Skin |cff00ff00"..UISkinOptions.EasyMailSkin.."|r")
		end
	end)
	EnergyWatchSkinButton = CreateFrame("Button", "EnergyWatchSkinButton", SkinOptions, "UIPanelButtonTemplate")
	EnergyWatchSkinButton:SetPoint("TOPLEFT", 12, -460)
	EnergyWatchSkinButton:Size(200,24)
	cSkinButton(EnergyWatchSkinButton)
	EnergyWatchSkinButton.text = EnergyWatchSkinButton:CreateFontString(nil, "OVERLAY")
	EnergyWatchSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	EnergyWatchSkinButton.text:SetPoint("CENTER", EnergyWatchSkinButton, 0, 0)
	if (UISkinOptions.EnergyWatchSkin == "Enabled") then EnergyWatchSkinButton.text:SetText("EnergyWatch Skin |cff00ff00"..UISkinOptions.EnergyWatchSkin.."|r") end
	if (UISkinOptions.EnergyWatchSkin == "Disabled") then EnergyWatchSkinButton.text:SetText("EnergyWatch Skin |cffff2020"..UISkinOptions.EnergyWatchSkin.."|r") end
	if not IsAddOnLoaded("EnergyWatch") then EnergyWatchSkinButton:Disable() EnergyWatchSkinButton.text:SetText("|cFF808080EnergyWatch Not Detected|r") end
	EnergyWatchSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.EnergyWatchSkin == "Enabled") then
			UISkinOptions.EnergyWatchSkin = "Disabled"			
			EnergyWatchSkinButton.text:SetText("EnergyWatch Skin |cffff2020"..UISkinOptions.EnergyWatchSkin.."|r")
		else
			UISkinOptions.EnergyWatchSkin = "Enabled"
			EnergyWatchSkinButton.text:SetText("EnergyWatch Skin |cff00ff00"..UISkinOptions.EnergyWatchSkin.."|r")
		end
	end)
	ExtVendorSkinButton = CreateFrame("Button", "ExtVendorSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ExtVendorSkinButton:SetPoint("TOP", 0, -40)
	ExtVendorSkinButton:Size(200,24)
	cSkinButton(ExtVendorSkinButton)
	ExtVendorSkinButton.text = ExtVendorSkinButton:CreateFontString(nil, "OVERLAY")
	ExtVendorSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	ExtVendorSkinButton.text:SetPoint("CENTER", ExtVendorSkinButton, 0, 0)
	if (UISkinOptions.ExtVendorSkin == "Enabled") then ExtVendorSkinButton.text:SetText("Extended Vendor Skin |cff00ff00"..UISkinOptions.ExtVendorSkin.."|r") end
	if (UISkinOptions.ExtVendorSkin == "Disabled") then ExtVendorSkinButton.text:SetText("Extended Vendor Skin |cffff2020"..UISkinOptions.ExtVendorSkin.."|r") end
	if not IsAddOnLoaded("ExtVendor") then ExtVendorSkinButton:Disable() ExtVendorSkinButton.text:SetText("|cFF808080Extended Vendor Not Detected|r") end
	ExtVendorSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.ExtVendorSkin == "Enabled") then
			UISkinOptions.ExtVendorSkin = "Disabled"			
			ExtVendorSkinButton.text:SetText("Extended Vendor Skin |cffff2020"..UISkinOptions.ExtVendorSkin.."|r")
		else
			UISkinOptions.ExtVendorSkin = "Enabled"
			ExtVendorSkinButton.text:SetText("Extended Vendor Skin |cff00ff00"..UISkinOptions.ExtVendorSkin.."|r")
		end
	end)
	FactionizerSkinButton = CreateFrame("Button", "FactionizerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	FactionizerSkinButton:SetPoint("TOP", 0, -70)
	FactionizerSkinButton:Size(200,24)
	cSkinButton(FactionizerSkinButton)
	FactionizerSkinButton.text = FactionizerSkinButton:CreateFontString(nil, "OVERLAY")
	FactionizerSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	FactionizerSkinButton.text:SetPoint("CENTER", FactionizerSkinButton, 0, 0)
	if (UISkinOptions.FactionizerSkin == "Enabled") then FactionizerSkinButton.text:SetText("Extended Vendor Skin |cff00ff00"..UISkinOptions.FactionizerSkin.."|r") end
	if (UISkinOptions.FactionizerSkin == "Disabled") then FactionizerSkinButton.text:SetText("Extended Vendor Skin |cffff2020"..UISkinOptions.FactionizerSkin.."|r") end
	if not IsAddOnLoaded("Factionizer") then FactionizerSkinButton:Disable() FactionizerSkinButton.text:SetText("|cFF808080Extended Vendor Not Detected|r") end
	FactionizerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.FactionizerSkin == "Enabled") then
			UISkinOptions.FactionizerSkin = "Disabled"			
			FactionizerSkinButton.text:SetText("Extended Vendor Skin |cffff2020"..UISkinOptions.FactionizerSkin.."|r")
		else
			UISkinOptions.FactionizerSkin = "Enabled"
			FactionizerSkinButton.text:SetText("Extended Vendor Skin |cff00ff00"..UISkinOptions.FactionizerSkin.."|r")
		end
	end)
	KarniCrapSkinButton = CreateFrame("Button", "KarniCrapSkinButton", SkinOptions, "UIPanelButtonTemplate")
	KarniCrapSkinButton:SetPoint("TOP", 0, -100)
	KarniCrapSkinButton:Size(200,24)
	cSkinButton(KarniCrapSkinButton)
	KarniCrapSkinButton.text = KarniCrapSkinButton:CreateFontString(nil, "OVERLAY")
	KarniCrapSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	KarniCrapSkinButton.text:SetPoint("CENTER", KarniCrapSkinButton, 0, 0)
	if (UISkinOptions.KarniCrapSkin == "Enabled") then KarniCrapSkinButton.text:SetText("Karni's Crap Filter Skin |cff00ff00"..UISkinOptions.KarniCrapSkin.."|r") end
	if (UISkinOptions.KarniCrapSkin == "Disabled") then KarniCrapSkinButton.text:SetText("Karni's Crap Filter Skin |cffff2020"..UISkinOptions.KarniCrapSkin.."|r") end
	if not IsAddOnLoaded("KarniCrap") then KarniCrapSkinButton:Disable() KarniCrapSkinButton.text:SetText("|cFF808080Karni's Crap Filter Not Detected|r") end
	KarniCrapSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.KarniCrapSkin == "Enabled") then
			UISkinOptions.KarniCrapSkin = "Disabled"			
			KarniCrapSkinButton.text:SetText("Karni's Crap Filter Skin |cffff2020"..UISkinOptions.KarniCrapSkin.."|r")
		else
			UISkinOptions.KarniCrapSkin = "Enabled"
			KarniCrapSkinButton.text:SetText("Karni's Crap Filter Skin |cff00ff00"..UISkinOptions.KarniCrapSkin.."|r")
		end
	end)
	LightheadedSkinButton = CreateFrame("Button", "LightheadedSkinButton", SkinOptions, "UIPanelButtonTemplate")
	LightheadedSkinButton:SetPoint("TOP", 0, -130)
	LightheadedSkinButton:Size(200,24)
	cSkinButton(LightheadedSkinButton)
	LightheadedSkinButton.text = LightheadedSkinButton:CreateFontString(nil, "OVERLAY")
	LightheadedSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	LightheadedSkinButton.text:SetPoint("CENTER", LightheadedSkinButton, 0, 0)
	if (UISkinOptions.LightheadedSkin == "Enabled") then LightheadedSkinButton.text:SetText("Lightheaded Skin |cff00ff00"..UISkinOptions.LightheadedSkin.."|r") end
	if (UISkinOptions.LightheadedSkin == "Disabled") then LightheadedSkinButton.text:SetText("Lightheaded Skin |cffff2020"..UISkinOptions.LightheadedSkin.."|r") end
	if not IsAddOnLoaded("Lightheaded") then LightheadedSkinButton:Disable() LightheadedSkinButton.text:SetText("|cFF808080Lightheaded Not Detected|r") end
	LightheadedSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.LightheadedSkin == "Enabled") then
			UISkinOptions.LightheadedSkin = "Disabled"			
			LightheadedSkinButton.text:SetText("Lightheaded Skin |cffff2020"..UISkinOptions.LightheadedSkin.."|r")
		else
			UISkinOptions.LightheadedSkin = "Enabled"
			LightheadedSkinButton.text:SetText("Lightheaded Skin |cff00ff00"..UISkinOptions.LightheadedSkin.."|r")
		end
	end)
	LootCouncilLiteSkinButton = CreateFrame("Button", "LootCouncilLiteSkinButton", SkinOptions, "UIPanelButtonTemplate")
	LootCouncilLiteSkinButton:SetPoint("TOP", 0, -160)
	LootCouncilLiteSkinButton:Size(200,24)
	cSkinButton(LootCouncilLiteSkinButton)
	LootCouncilLiteSkinButton.text = LootCouncilLiteSkinButton:CreateFontString(nil, "OVERLAY")
	LootCouncilLiteSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	LootCouncilLiteSkinButton.text:SetPoint("CENTER", LootCouncilLiteSkinButton, 0, 0)
	if (UISkinOptions.LootCouncilLiteSkin == "Enabled") then LootCouncilLiteSkinButton.text:SetText("LootCouncilLite Skin |cff00ff00"..UISkinOptions.LootCouncilLiteSkin.."|r") end
	if (UISkinOptions.LootCouncilLiteSkin == "Disabled") then LootCouncilLiteSkinButton.text:SetText("LootCouncilLite Skin |cffff2020"..UISkinOptions.LootCouncilLiteSkin.."|r") end
	if not IsAddOnLoaded("LootCouncil_Lite") then LootCouncilLiteSkinButton:Disable() LootCouncilLiteSkinButton.text:SetText("|cFF808080LootCouncilLite Not Detected|r") end
	LootCouncilLiteSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.LootCouncilLiteSkin == "Enabled") then
			UISkinOptions.LootCouncilLiteSkin = "Disabled"			
			LootCouncilLiteSkinButton.text:SetText("LootCouncilLite Skin |cffff2020"..UISkinOptions.LootCouncilLiteSkin.."|r")
		else
			UISkinOptions.LootCouncilLiteSkin = "Enabled"
			LootCouncilLiteSkinButton.text:SetText("LootCouncilLite Skin |cff00ff00"..UISkinOptions.LootCouncilLiteSkin.."|r")
		end
	end)
	MageNuggetsSkinButton = CreateFrame("Button", "MageNuggetsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MageNuggetsSkinButton:SetPoint("TOP", 0, -190)
	MageNuggetsSkinButton:Size(200,24)
	cSkinButton(MageNuggetsSkinButton)
	MageNuggetsSkinButton.text = MageNuggetsSkinButton:CreateFontString(nil, "OVERLAY")
	MageNuggetsSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	MageNuggetsSkinButton.text:SetPoint("CENTER", MageNuggetsSkinButton, 0, 0)
	if (UISkinOptions.MageNuggetsSkin == "Enabled") then MageNuggetsSkinButton.text:SetText("MageNuggets Skin |cff00ff00"..UISkinOptions.MageNuggetsSkin.."|r") end
	if (UISkinOptions.MageNuggetsSkin == "Disabled") then MageNuggetsSkinButton.text:SetText("MageNuggets Skin |cffff2020"..UISkinOptions.MageNuggetsSkin.."|r") end
	if not IsAddOnLoaded("MageNuggets") then MageNuggetsSkinButton:Disable() MageNuggetsSkinButton.text:SetText("|cFF808080MageNuggets Not Detected|r") end
	MageNuggetsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MageNuggetsSkin == "Enabled") then
			UISkinOptions.MageNuggetsSkin = "Disabled"			
			MageNuggetsSkinButton.text:SetText("MageNuggets Skin |cffff2020"..UISkinOptions.MageNuggetsSkin.."|r")
		else
			UISkinOptions.MageNuggetsSkin = "Enabled"
			MageNuggetsSkinButton.text:SetText("MageNuggets Skin |cff00ff00"..UISkinOptions.MageNuggetsSkin.."|r")
		end
	end)
	MasterLootManagerRemixSkinButton = CreateFrame("Button", "MasterLootManagerRemixSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MasterLootManagerRemixSkinButton:SetPoint("TOP", 0, -220)
	MasterLootManagerRemixSkinButton:Size(200,24)
	cSkinButton(MasterLootManagerRemixSkinButton)
	MasterLootManagerRemixSkinButton.text = MasterLootManagerRemixSkinButton:CreateFontString(nil, "OVERLAY")
	MasterLootManagerRemixSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	MasterLootManagerRemixSkinButton.text:SetPoint("CENTER", MasterLootManagerRemixSkinButton, 0, 0)
	if (UISkinOptions.MasterLootManagerRemixSkin == "Enabled") then MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cff00ff00"..UISkinOptions.MasterLootManagerRemixSkin.."|r") end
	if (UISkinOptions.MasterLootManagerRemixSkin == "Disabled") then MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cffff2020"..UISkinOptions.MasterLootManagerRemixSkin.."|r") end
	if not IsAddOnLoaded("MasterLootManagerRemix") then MasterLootManagerRemixSkinButton:Disable() MasterLootManagerRemixSkinButton.text:SetText("|cFF808080MasterLootManagerRemix Not Detected|r") end
	MasterLootManagerRemixSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MasterLootManagerRemixSkin == "Enabled") then
			UISkinOptions.MasterLootManagerRemixSkin = "Disabled"			
			MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cffff2020"..UISkinOptions.MasterLootManagerRemixSkin.."|r")
		else
			UISkinOptions.MasterLootManagerRemixSkin = "Enabled"
			MasterLootManagerRemixSkinButton.text:SetText("MasterLootManagerRemix Skin |cff00ff00"..UISkinOptions.MasterLootManagerRemixSkin.."|r")
		end
	end)
	MinimalArchaeologySkinButton = CreateFrame("Button", "MinimalArchaeologySkinButton", SkinOptions, "UIPanelButtonTemplate")
	MinimalArchaeologySkinButton:SetPoint("TOP", 0, -250)
	MinimalArchaeologySkinButton:Size(200,24)
	cSkinButton(MinimalArchaeologySkinButton)
	MinimalArchaeologySkinButton.text = MinimalArchaeologySkinButton:CreateFontString(nil, "OVERLAY")
	MinimalArchaeologySkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	MinimalArchaeologySkinButton.text:SetPoint("CENTER", MinimalArchaeologySkinButton, 0, 0)
	if (UISkinOptions.MinimalArchaeologySkin == "Enabled") then MinimalArchaeologySkinButton.text:SetText("MinimalArchaeology Skin |cff00ff00"..UISkinOptions.MinimalArchaeologySkin.."|r") end
	if (UISkinOptions.MinimalArchaeologySkin == "Disabled") then MinimalArchaeologySkinButton.text:SetText("MinimalArchaeology Skin |cffff2020"..UISkinOptions.MinimalArchaeologySkin.."|r") end
	if not IsAddOnLoaded("MinimalArchaeology") then MinimalArchaeologySkinButton:Disable() MinimalArchaeologySkinButton.text:SetText("|cFF808080MinimalArchaeology Not Detected|r") end
	MinimalArchaeologySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MinimalArchaeologySkin == "Enabled") then
			UISkinOptions.MinimalArchaeologySkin = "Disabled"			
			MinimalArchaeologySkinButton.text:SetText("MinimalArchaeology Skin |cffff2020"..UISkinOptions.MinimalArchaeologySkin.."|r")
		else
			UISkinOptions.MinimalArchaeologySkin = "Enabled"
			MinimalArchaeologySkinButton.text:SetText("MinimalArchaeology Skin |cff00ff00"..UISkinOptions.MinimalArchaeologySkin.."|r")
		end
	end)
	MoveAnythingSkinButton = CreateFrame("Button", "MoveAnythingSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MoveAnythingSkinButton:SetPoint("TOP", 0, -280)
	MoveAnythingSkinButton:Size(200,24)
	cSkinButton(MoveAnythingSkinButton)
	MoveAnythingSkinButton.text = MoveAnythingSkinButton:CreateFontString(nil, "OVERLAY")
	MoveAnythingSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	MoveAnythingSkinButton.text:SetPoint("CENTER", MoveAnythingSkinButton, 0, 0)
	if (UISkinOptions.MoveAnythingSkin == "Enabled") then MoveAnythingSkinButton.text:SetText("MoveAnything Skin |cff00ff00"..UISkinOptions.MoveAnythingSkin.."|r") end
	if (UISkinOptions.MoveAnythingSkin == "Disabled") then MoveAnythingSkinButton.text:SetText("MoveAnything Skin |cffff2020"..UISkinOptions.MoveAnythingSkin.."|r") end
	if not IsAddOnLoaded("MoveAnything") then MoveAnythingSkinButton:Disable() MoveAnythingSkinButton.text:SetText("|cFF808080MoveAnything Not Detected|r") end
	MoveAnythingSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MoveAnythingSkin == "Enabled") then
			UISkinOptions.MoveAnythingSkin = "Disabled"			
			MoveAnythingSkinButton.text:SetText("MoveAnything Skin |cffff2020"..UISkinOptions.MoveAnythingSkin.."|r")
		else
			UISkinOptions.MoveAnythingSkin = "Enabled"
			MoveAnythingSkinButton.text:SetText("MoveAnything Skin |cff00ff00"..UISkinOptions.MoveAnythingSkin.."|r")
		end
	end)
	MRTSkinButton = CreateFrame("Button", "MRTSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MRTSkinButton:SetPoint("TOP", 0, -310)
	MRTSkinButton:Size(200,24)
	cSkinButton(MRTSkinButton)
	MRTSkinButton.text = MRTSkinButton:CreateFontString(nil, "OVERLAY")
	MRTSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	MRTSkinButton.text:SetPoint("CENTER", MRTSkinButton, 0, 0)
	if (UISkinOptions.MRTSkin == "Enabled") then MRTSkinButton.text:SetText("Mizus Raid Tracker Skin |cff00ff00"..UISkinOptions.MRTSkin.."|r") end
	if (UISkinOptions.MRTSkin == "Disabled") then MRTSkinButton.text:SetText("Mizus Raid Tracker Skin |cffff2020"..UISkinOptions.MRTSkin.."|r") end
	if not IsAddOnLoaded("MizusRaidTracker") then MRTSkinButton:Disable() MRTSkinButton.text:SetText("|cFF808080Mizus Raid Tracker Not Detected|r") end
	MRTSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.MRTSkin == "Enabled") then
			UISkinOptions.MRTSkin = "Disabled"			
			MRTSkinButton.text:SetText("Mizus Raid Tracker Skin |cffff2020"..UISkinOptions.MRTSkin.."|r")
		else
			UISkinOptions.MRTSkin = "Enabled"
			MRTSkinButton.text:SetText("Mizus Raid Tracker Skin |cff00ff00"..UISkinOptions.MRTSkin.."|r")
		end
	end)
	OdysseySkinButton = CreateFrame("Button", "OdysseySkinButton", SkinOptions, "UIPanelButtonTemplate")
	OdysseySkinButton:SetPoint("TOP", 0, -340)
	OdysseySkinButton:Size(200,24)
	cSkinButton(OdysseySkinButton)
	OdysseySkinButton.text = OdysseySkinButton:CreateFontString(nil, "OVERLAY")
	OdysseySkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	OdysseySkinButton.text:SetPoint("CENTER", OdysseySkinButton, 0, 0)
	if (UISkinOptions.OdysseySkin == "Enabled") then OdysseySkinButton.text:SetText("Odyssey Skin |cff00ff00"..UISkinOptions.OdysseySkin.."|r") end
	if (UISkinOptions.OdysseySkin == "Disabled") then OdysseySkinButton.text:SetText("Odyssey Skin |cffff2020"..UISkinOptions.OdysseySkin.."|r") end
	if not IsAddOnLoaded("Odyssey") then OdysseySkinButton:Disable() OdysseySkinButton.text:SetText("|cFF808080Odyssey Not Detected|r") end
	OdysseySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OdysseySkin == "Enabled") then
			UISkinOptions.OdysseySkin = "Disabled"			
			OdysseySkinButton.text:SetText("Odyssey Skin |cffff2020"..UISkinOptions.OdysseySkin.."|r")
		else
			UISkinOptions.OdysseySkin = "Enabled"
			OdysseySkinButton.text:SetText("Odyssey Skin |cff00ff00"..UISkinOptions.OdysseySkin.."|r")
		end
	end)
	OgriLazySkinButton = CreateFrame("Button", "OgriLazySkinButton", SkinOptions, "UIPanelButtonTemplate")
	OgriLazySkinButton:SetPoint("TOP", 0, -370)
	OgriLazySkinButton:Size(200,24)
	cSkinButton(OgriLazySkinButton)
	OgriLazySkinButton.text = OgriLazySkinButton:CreateFontString(nil, "OVERLAY")
	OgriLazySkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	OgriLazySkinButton.text:SetPoint("CENTER", OgriLazySkinButton, 0, 0)
	if (UISkinOptions.OgriLazySkin == "Enabled") then OgriLazySkinButton.text:SetText("Ogri'Lazy Skin |cff00ff00"..UISkinOptions.OgriLazySkin.."|r") end
	if (UISkinOptions.OgriLazySkin == "Disabled") then OgriLazySkinButton.text:SetText("Ogri'Lazy Skin |cffff2020"..UISkinOptions.OgriLazySkin.."|r") end
	if not IsAddOnLoaded("Ogri'Lazy") then OgriLazySkinButton:Disable() OgriLazySkinButton.text:SetText("|cFF808080Ogri'Lazy Not Detected|r") end
	OgriLazySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OgriLazySkin == "Enabled") then
			UISkinOptions.OgriLazySkin = "Disabled"			
			OgriLazySkinButton.text:SetText("Ogri'Lazy Skin |cffff2020"..UISkinOptions.OgriLazySkin.."|r")
		else
			UISkinOptions.OgriLazySkin = "Enabled"
			OgriLazySkinButton.text:SetText("Ogri'Lazy Skin |cff00ff00"..UISkinOptions.OgriLazySkin.."|r")
		end
	end)
	OmenSkinButton = CreateFrame("Button", "OmenSkinButton", SkinOptions, "UIPanelButtonTemplate")
	OmenSkinButton:SetPoint("TOP", 0, -400)
	OmenSkinButton:Size(200,24)
	cSkinButton(OmenSkinButton)
	OmenSkinButton.text = OmenSkinButton:CreateFontString(nil, "OVERLAY")
	OmenSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	OmenSkinButton.text:SetPoint("CENTER", OmenSkinButton, 0, 0)
	if (UISkinOptions.OmenSkin == "Enabled") then OmenSkinButton.text:SetText("Omen Skin |cff00ff00"..UISkinOptions.OmenSkin.."|r") end
	if (UISkinOptions.OmenSkin == "Disabled") then OmenSkinButton.text:SetText("Omen Skin |cffff2020"..UISkinOptions.OmenSkin.."|r") end
	if not IsAddOnLoaded("Omen") then OmenSkinButton:Disable() OmenSkinButton.text:SetText("|cFF808080Omen Not Detected|r") end
	OmenSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OmenSkin == "Enabled") then
			UISkinOptions.OmenSkin = "Disabled"			
			OmenSkinButton.text:SetText("Omen Skin |cffff2020"..UISkinOptions.OmenSkin.."|r")
		else
			UISkinOptions.OmenSkin = "Enabled"
			OmenSkinButton.text:SetText("Omen Skin |cff00ff00"..UISkinOptions.OmenSkin.."|r")
		end
	end)
	OutfitterSkinButton = CreateFrame("Button", "OutfitterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	OutfitterSkinButton:SetPoint("TOP", 0, -430)
	OutfitterSkinButton:Size(200,24)
	cSkinButton(OutfitterSkinButton)
	OutfitterSkinButton.text = OutfitterSkinButton:CreateFontString(nil, "OVERLAY")
	OutfitterSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	OutfitterSkinButton.text:SetPoint("CENTER", OutfitterSkinButton, 0, 0)
	if (UISkinOptions.OutfitterSkin == "Enabled") then OutfitterSkinButton.text:SetText("Outfitter Skin |cff00ff00"..UISkinOptions.OutfitterSkin.."|r") end
	if (UISkinOptions.OutfitterSkin == "Disabled") then OutfitterSkinButton.text:SetText("Outfitter Skin |cffff2020"..UISkinOptions.OutfitterSkin.."|r") end
	if not IsAddOnLoaded("Outfitter") then OutfitterSkinButton:Disable() OutfitterSkinButton.text:SetText("|cFF808080Outfitter Not Detected|r") end
	OutfitterSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.OutfitterSkin == "Enabled") then
			UISkinOptions.OutfitterSkin = "Disabled"			
			OutfitterSkinButton.text:SetText("Outfitter Skin |cffff2020"..UISkinOptions.OutfitterSkin.."|r")
		else
			UISkinOptions.OutfitterSkin = "Enabled"
			OutfitterSkinButton.text:SetText("Outfitter Skin |cff00ff00"..UISkinOptions.OutfitterSkin.."|r")
		end
	end)
	PoisonerSkinButton = CreateFrame("Button", "PoisonerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PoisonerSkinButton:SetPoint("TOP", 0, -460)
	PoisonerSkinButton:Size(200,24)
	cSkinButton(PoisonerSkinButton)
	PoisonerSkinButton.text = PoisonerSkinButton:CreateFontString(nil, "OVERLAY")
	PoisonerSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	PoisonerSkinButton.text:SetPoint("CENTER", PoisonerSkinButton, 0, 0)
	if (UISkinOptions.PoisonerSkin == "Enabled") then PoisonerSkinButton.text:SetText("Poisoner Skin |cff00ff00"..UISkinOptions.PoisonerSkin.."|r") end
	if (UISkinOptions.PoisonerSkin == "Disabled") then PoisonerSkinButton.text:SetText("Poisoner Skin |cffff2020"..UISkinOptions.PoisonerSkin.."|r") end
	if not IsAddOnLoaded("Poisoner") then PoisonerSkinButton:Disable() PoisonerSkinButton.text:SetText("|cFF808080Poisoner Not Detected|r") end
	PoisonerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PoisonerSkin == "Enabled") then
			UISkinOptions.PoisonerSkin = "Disabled"			
			PoisonerSkinButton.text:SetText("Poisoner Skin |cffff2020"..UISkinOptions.PoisonerSkin.."|r")
		else
			UISkinOptions.PoisonerSkin = "Enabled"
			PoisonerSkinButton.text:SetText("Poisoner Skin |cff00ff00"..UISkinOptions.PoisonerSkin.."|r")
		end
	end)
	PoMTrackerSkinButton = CreateFrame("Button", "PoMTrackerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PoMTrackerSkinButton:SetPoint("TOPRIGHT", -12, -40)
	PoMTrackerSkinButton:Size(200,24)
	cSkinButton(PoMTrackerSkinButton)
	PoMTrackerSkinButton.text = PoMTrackerSkinButton:CreateFontString(nil, "OVERLAY")
	PoMTrackerSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	PoMTrackerSkinButton.text:SetPoint("CENTER", PoMTrackerSkinButton, 0, 0)
	if (UISkinOptions.PoMTrackerSkin == "Enabled") then PoMTrackerSkinButton.text:SetText("PoMTracker Skin |cff00ff00"..UISkinOptions.PoMTrackerSkin.."|r") end
	if (UISkinOptions.PoMTrackerSkin == "Disabled") then PoMTrackerSkinButton.text:SetText("PoMTracker Skin |cffff2020"..UISkinOptions.PoMTrackerSkin.."|r") end
	if not IsAddOnLoaded("PoMTracker") then PoMTrackerSkinButton:Disable() PoMTrackerSkinButton.text:SetText("|cFF808080PoMTracker Not Detected|r") end
	PoMTrackerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PoMTrackerSkin == "Enabled") then
			UISkinOptions.PoMTrackerSkin = "Disabled"			
			PoMTrackerSkinButton.text:SetText("PoMTracker Skin |cffff2020"..UISkinOptions.PoMTrackerSkin.."|r")
		else
			UISkinOptions.PoMTrackerSkin = "Enabled"
			PoMTrackerSkinButton.text:SetText("PoMTracker Skin |cff00ff00"..UISkinOptions.PoMTrackerSkin.."|r")
		end
	end)
	PostalSkinButton = CreateFrame("Button", "PostalSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PostalSkinButton:SetPoint("TOPRIGHT", -12, -70)
	PostalSkinButton:Size(200,24)
	cSkinButton(PostalSkinButton)
	PostalSkinButton.text = PostalSkinButton:CreateFontString(nil, "OVERLAY")
	PostalSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	PostalSkinButton.text:SetPoint("CENTER", PostalSkinButton, 0, 0)
	if (UISkinOptions.PostalSkin == "Enabled") then PostalSkinButton.text:SetText("Postal Skin |cff00ff00"..UISkinOptions.PostalSkin.."|r") end
	if (UISkinOptions.PostalSkin == "Disabled") then PostalSkinButton.text:SetText("Postal Skin |cffff2020"..UISkinOptions.PostalSkin.."|r") end
	if not IsAddOnLoaded("Postal") then PostalSkinButton:Disable() PostalSkinButton.text:SetText("|cFF808080Postal Not Detected|r") end
	PostalSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PostalSkin == "Enabled") then
			UISkinOptions.PostalSkin = "Disabled"			
			PostalSkinButton.text:SetText("Postal Skin |cffff2020"..UISkinOptions.PostalSkin.."|r")
		else
			UISkinOptions.PostalSkin = "Enabled"
			PostalSkinButton.text:SetText("Postal Skin |cff00ff00"..UISkinOptions.PostalSkin.."|r")
		end
	end)
	PowerAurasSkinButton = CreateFrame("Button", "PowerAurasSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PowerAurasSkinButton:SetPoint("TOPRIGHT", -12, -100)
	PowerAurasSkinButton:Size(200,24)
	cSkinButton(PowerAurasSkinButton)
	PowerAurasSkinButton.text = PowerAurasSkinButton:CreateFontString(nil, "OVERLAY")
	PowerAurasSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	PowerAurasSkinButton.text:SetPoint("CENTER", PowerAurasSkinButton, 0, 0)
	if (UISkinOptions.PowerAurasSkin == "Enabled") then PowerAurasSkinButton.text:SetText("Power Auras Skin |cff00ff00"..UISkinOptions.PowerAurasSkin.."|r") end
	if (UISkinOptions.PowerAurasSkin == "Disabled") then PowerAurasSkinButton.text:SetText("Power Auras Skin |cffff2020"..UISkinOptions.PowerAurasSkin.."|r") end
	if not IsAddOnLoaded("PowerAuras") then PowerAurasSkinButton:Disable() PowerAurasSkinButton.text:SetText("|cFF808080Power Auras Not Detected|r") end
	PowerAurasSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PowerAurasSkin == "Enabled") then
			UISkinOptions.PowerAurasSkin = "Disabled"			
			PowerAurasSkinButton.text:SetText("Power Auras Skin |cffff2020"..UISkinOptions.PowerAurasSkin.."|r")
		else
			UISkinOptions.PowerAurasSkin = "Enabled"
			PowerAurasSkinButton.text:SetText("Power Auras Skin |cff00ff00"..UISkinOptions.PowerAurasSkin.."|r")
		end
	end)
	RaidInviteOrganizerSkinButton = CreateFrame("Button", "RaidInviteOrganizerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	RaidInviteOrganizerSkinButton:SetPoint("TOPRIGHT", -12, -130)
	RaidInviteOrganizerSkinButton:Size(200,24)
	cSkinButton(RaidInviteOrganizerSkinButton)
	RaidInviteOrganizerSkinButton.text = RaidInviteOrganizerSkinButton:CreateFontString(nil, "OVERLAY")
	RaidInviteOrganizerSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	RaidInviteOrganizerSkinButton.text:SetPoint("CENTER", RaidInviteOrganizerSkinButton, 0, 0)
	if (UISkinOptions.RaidInviteOrganizerSkin == "Enabled") then RaidInviteOrganizerSkinButton.text:SetText("Raid Invite Organizer Skin |cff00ff00"..UISkinOptions.RaidInviteOrganizerSkin.."|r") end
	if (UISkinOptions.RaidInviteOrganizerSkin == "Disabled") then RaidInviteOrganizerSkinButton.text:SetText("Raid Invite Organizer Skin |cffff2020"..UISkinOptions.RaidInviteOrganizerSkin.."|r") end
	if not IsAddOnLoaded("RaidInviteOrganizer") then RaidInviteOrganizerSkinButton:Disable() RaidInviteOrganizerSkinButton.text:SetText("|cFF808080Raid Invite Organizer Not Detected|r") end
	RaidInviteOrganizerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.RaidInviteOrganizerSkin == "Enabled") then
			UISkinOptions.RaidInviteOrganizerSkin = "Disabled"			
			RaidInviteOrganizerSkinButton.text:SetText("Raid Invite Organizer Skin |cffff2020"..UISkinOptions.RaidInviteOrganizerSkin.."|r")
		else
			UISkinOptions.RaidInviteOrganizerSkin = "Enabled"
			RaidInviteOrganizerSkinButton.text:SetText("Raid Invite Organizer Skin |cff00ff00"..UISkinOptions.RaidInviteOrganizerSkin.."|r")
		end
	end)
	RaidBuffStatusSkinButton = CreateFrame("Button", "RaidBuffStatusSkinButton", SkinOptions, "UIPanelButtonTemplate")
	RaidBuffStatusSkinButton:SetPoint("TOPRIGHT", -12, -160)
	RaidBuffStatusSkinButton:Size(200,24)
	cSkinButton(RaidBuffStatusSkinButton)
	RaidBuffStatusSkinButton.text = RaidBuffStatusSkinButton:CreateFontString(nil, "OVERLAY")
	RaidBuffStatusSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	RaidBuffStatusSkinButton.text:SetPoint("CENTER", RaidBuffStatusSkinButton, 0, 0)
	if (UISkinOptions.RaidBuffStatusSkin == "Enabled") then RaidBuffStatusSkinButton.text:SetText("Raid Buff Status Skin |cff00ff00"..UISkinOptions.RaidBuffStatusSkin.."|r") end
	if (UISkinOptions.RaidBuffStatusSkin == "Disabled") then RaidBuffStatusSkinButton.text:SetText("Raid Buff Status Skin |cffff2020"..UISkinOptions.RaidBuffStatusSkin.."|r") end
	if not IsAddOnLoaded("RaidBuffStatus") then RaidBuffStatusSkinButton:Disable() RaidBuffStatusSkinButton.text:SetText("|cFF808080Raid Buff Status Not Detected|r") end
	RaidBuffStatusSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.RaidBuffStatusSkin == "Enabled") then
			UISkinOptions.RaidBuffStatusSkin = "Disabled"			
			RaidBuffStatusSkinButton.text:SetText("Raid Buff Status Skin |cffff2020"..UISkinOptions.RaidBuffStatusSkin.."|r")
		else
			UISkinOptions.RaidBuffStatusSkin = "Enabled"
			RaidBuffStatusSkinButton.text:SetText("Raid Buff Status Skin |cff00ff00"..UISkinOptions.RaidBuffStatusSkin.."|r")
		end
	end)
	SearingPlasmaTrackerSkinButton = CreateFrame("Button", "SearingPlasmaTrackerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SearingPlasmaTrackerSkinButton:SetPoint("TOPRIGHT", -12, -190)
	SearingPlasmaTrackerSkinButton:Size(200,24)
	cSkinButton(SearingPlasmaTrackerSkinButton)
	SearingPlasmaTrackerSkinButton.text = SearingPlasmaTrackerSkinButton:CreateFontString(nil, "OVERLAY")
	SearingPlasmaTrackerSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	SearingPlasmaTrackerSkinButton.text:SetPoint("CENTER", SearingPlasmaTrackerSkinButton, 0, 0)
	if (UISkinOptions.SearingPlasmaTrackerSkin == "Enabled") then SearingPlasmaTrackerSkinButton.text:SetText("Searing Plasma Tracker Skin |cff00ff00"..UISkinOptions.SearingPlasmaTrackerSkin.."|r") end
	if (UISkinOptions.SearingPlasmaTrackerSkin == "Disabled") then SearingPlasmaTrackerSkinButton.text:SetText("Searing Plasma Tracker Skin |cffff2020"..UISkinOptions.SearingPlasmaTrackerSkin.."|r") end
	if not IsAddOnLoaded("SearingPlasmaTracker") then SearingPlasmaTrackerSkinButton:Disable() SearingPlasmaTrackerSkinButton.text:SetText("|cFF808080Searing Plasma Tracker Not Detected|r") end
	SearingPlasmaTrackerSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SearingPlasmaTrackerSkin == "Enabled") then
			UISkinOptions.SearingPlasmaTrackerSkin = "Disabled"			
			SearingPlasmaTrackerSkinButton.text:SetText("Searing Plasma Tracker Skin |cffff2020"..UISkinOptions.SearingPlasmaTrackerSkin.."|r")
		else
			UISkinOptions.SearingPlasmaTrackerSkin = "Enabled"
			SearingPlasmaTrackerSkinButton.text:SetText("Searing Plasma Tracker Skin |cff00ff00"..UISkinOptions.SearingPlasmaTrackerSkin.."|r")
		end
	end)
	SkilletSkinButton = CreateFrame("Button", "SkilletSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SkilletSkinButton:SetPoint("TOPRIGHT", -12, -220)
	SkilletSkinButton:Size(200,24)
	cSkinButton(SkilletSkinButton)
	SkilletSkinButton.text = SkilletSkinButton:CreateFontString(nil, "OVERLAY")
	SkilletSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	SkilletSkinButton.text:SetPoint("CENTER", SkilletSkinButton, 0, 0)
	if (UISkinOptions.SkilletSkin == "Enabled") then SkilletSkinButton.text:SetText("Skillet Skin |cff00ff00"..UISkinOptions.SkilletSkin.."|r") end
	if (UISkinOptions.SkilletSkin == "Disabled") then SkilletSkinButton.text:SetText("Skillet Skin |cffff2020"..UISkinOptions.SkilletSkin.."|r") end
	if not IsAddOnLoaded("Skillet") then SkilletSkinButton:Disable() SkilletSkinButton.text:SetText("|cFF808080Skillet Not Detected|r") end
	SkilletSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SkilletSkin == "Enabled") then
			UISkinOptions.SkilletSkin = "Disabled"			
			SkilletSkinButton.text:SetText("Skillet Skin |cffff2020"..UISkinOptions.SkilletSkin.."|r")
		else
			UISkinOptions.SkilletSkin = "Enabled"
			SkilletSkinButton.text:SetText("Skillet Skin |cff00ff00"..UISkinOptions.SkilletSkin.."|r")
		end
	end)
	SpineCounterSkinButton = CreateFrame("Button", "SpineCounterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SpineCounterSkinButton:SetPoint("TOPRIGHT", -12, -250)
	SpineCounterSkinButton:Size(200,24)
	cSkinButton(SpineCounterSkinButton)
	SpineCounterSkinButton.text = SpineCounterSkinButton:CreateFontString(nil, "OVERLAY")
	SpineCounterSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	SpineCounterSkinButton.text:SetPoint("CENTER", SpineCounterSkinButton, 0, 0)
	if (UISkinOptions.SpineCounterSkin == "Enabled") then SpineCounterSkinButton.text:SetText("Spine Blood Counter Skin |cff00ff00"..UISkinOptions.SpineCounterSkin.."|r") end
	if (UISkinOptions.SpineCounterSkin == "Disabled") then SpineCounterSkinButton.text:SetText("Spine Blood Counter Skin |cffff2020"..UISkinOptions.SpineCounterSkin.."|r") end
	if not IsAddOnLoaded("SpineCounter") then SpineCounterSkinButton:Disable() SpineCounterSkinButton.text:SetText("|cFF808080Spine Blood Counter Not Detected|r") end
	SpineCounterSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SpineCounterSkin == "Enabled") then
			UISkinOptions.SpineCounterSkin = "Disabled"			
			SpineCounterSkinButton.text:SetText("Spine Blood Counter Skin |cffff2020"..UISkinOptions.SpineCounterSkin.."|r")
		else
			UISkinOptions.SpineCounterSkin = "Enabled"
			SpineCounterSkinButton.text:SetText("Spine Blood Counter Skin |cff00ff00"..UISkinOptions.SpineCounterSkin.."|r")
		end
	end)
	SpySkinButton = CreateFrame("Button", "SpySkinButton", SkinOptions, "UIPanelButtonTemplate")
	SpySkinButton:SetPoint("TOPRIGHT", -12, -280)
	SpySkinButton:Size(200,24)
	cSkinButton(SpySkinButton)
	SpySkinButton.text = SpySkinButton:CreateFontString(nil, "OVERLAY")
	SpySkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	SpySkinButton.text:SetPoint("CENTER", SpySkinButton, 0, 0)
	if (UISkinOptions.SpySkin == "Enabled") then SpySkinButton.text:SetText("Spy Skin |cff00ff00"..UISkinOptions.SpySkin.."|r") end
	if (UISkinOptions.SpySkin == "Disabled") then SpySkinButton.text:SetText("Spy Skin |cffff2020"..UISkinOptions.SpySkin.."|r") end
	if not IsAddOnLoaded("Spy") then SpySkinButton:Disable() SpySkinButton.text:SetText("|cFF808080Spy Not Detected|r") end
	SpySkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SpySkin == "Enabled") then
			UISkinOptions.SpySkin = "Disabled"			
			SpySkinButton.text:SetText("Spy Skin |cffff2020"..UISkinOptions.SpySkin.."|r")
		else
			UISkinOptions.SpySkin = "Enabled"
			SpySkinButton.text:SetText("Spy Skin |cff00ff00"..UISkinOptions.SpySkin.."|r")
		end
	end)
	SwatterSkinButton = CreateFrame("Button", "SwatterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SwatterSkinButton:SetPoint("TOPRIGHT", -12, -310)
	SwatterSkinButton:Size(200,24)
	cSkinButton(SwatterSkinButton)
	SwatterSkinButton.text = SwatterSkinButton:CreateFontString(nil, "OVERLAY")
	SwatterSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	SwatterSkinButton.text:SetPoint("CENTER", SwatterSkinButton, 0, 0)
	if (UISkinOptions.SwatterSkin == "Enabled") then SwatterSkinButton.text:SetText("Swatter Skin |cff00ff00"..UISkinOptions.SwatterSkin.."|r") end
	if (UISkinOptions.SwatterSkin == "Disabled") then SwatterSkinButton.text:SetText("Swatter Skin |cffff2020"..UISkinOptions.SwatterSkin.."|r") end
	if not IsAddOnLoaded("!Swatter") then SwatterSkinButton:Disable() SwatterSkinButton.text:SetText("|cFF808080Swatter Not Detected|r") end
	SwatterSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.SwatterSkin == "Enabled") then
			UISkinOptions.SwatterSkin = "Disabled"			
			SwatterSkinButton.text:SetText("Swatter Skin |cffff2020"..UISkinOptions.SwatterSkin.."|r")
		else
			UISkinOptions.SwatterSkin = "Enabled"
			SwatterSkinButton.text:SetText("Swatter Skin |cff00ff00"..UISkinOptions.SwatterSkin.."|r")
		end
	end)
	TinyDPSSkinButton = CreateFrame("Button", "TinyDPSSkinButton", SkinOptions, "UIPanelButtonTemplate")
	TinyDPSSkinButton:SetPoint("TOPRIGHT", -12, -340)
	TinyDPSSkinButton:Size(200,24)
	cSkinButton(TinyDPSSkinButton)
	TinyDPSSkinButton.text = TinyDPSSkinButton:CreateFontString(nil, "OVERLAY")
	TinyDPSSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	TinyDPSSkinButton.text:SetPoint("CENTER", TinyDPSSkinButton, 0, 0)
	if (UISkinOptions.TinyDPSSkin == "Enabled") then TinyDPSSkinButton.text:SetText("TinyDPS Skin |cff00ff00"..UISkinOptions.TinyDPSSkin.."|r") end
	if (UISkinOptions.TinyDPSSkin == "Disabled") then TinyDPSSkinButton.text:SetText("TinyDPS Skin |cffff2020"..UISkinOptions.TinyDPSSkin.."|r") end
	if not IsAddOnLoaded("TinyDPS") then TinyDPSSkinButton:Disable() TinyDPSSkinButton.text:SetText("|cFF808080TinyDPS Not Detected|r") end
	TinyDPSSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.TinyDPSSkin == "Enabled") then
			UISkinOptions.TinyDPSSkin = "Disabled"			
			TinyDPSSkinButton.text:SetText("TinyDPS Skin |cffff2020"..UISkinOptions.TinyDPSSkin.."|r")
		else
			UISkinOptions.TinyDPSSkin = "Enabled"
			TinyDPSSkinButton.text:SetText("TinyDPS Skin |cff00ff00"..UISkinOptions.TinyDPSSkin.."|r")
		end
	end)
	TitanPanelSkinButton = CreateFrame("Button", "TitanPanelSkinButton", SkinOptions, "UIPanelButtonTemplate")
	TitanPanelSkinButton:SetPoint("TOPRIGHT", -12, -370)
	TitanPanelSkinButton:Size(200,24)
	cSkinButton(TitanPanelSkinButton)
	TitanPanelSkinButton.text = TitanPanelSkinButton:CreateFontString(nil, "OVERLAY")
	TitanPanelSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	TitanPanelSkinButton.text:SetPoint("CENTER", TitanPanelSkinButton, 0, 0)
	if (UISkinOptions.TitanPanelSkin == "Enabled") then TitanPanelSkinButton.text:SetText("TitanPanel Skin |cff00ff00"..UISkinOptions.TitanPanelSkin.."|r") end
	if (UISkinOptions.TitanPanelSkin == "Disabled") then TitanPanelSkinButton.text:SetText("TitanPanel Skin |cffff2020"..UISkinOptions.TitanPanelSkin.."|r") end
	if not IsAddOnLoaded("Titan") then TitanPanelSkinButton:Disable() TitanPanelSkinButton.text:SetText("|cFF808080TitanPanel Not Detected|r") end
	TitanPanelSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.TitanPanelSkin == "Enabled") then
			UISkinOptions.TitanPanelSkin = "Disabled"			
			TitanPanelSkinButton.text:SetText("TitanPanel Skin |cffff2020"..UISkinOptions.TitanPanelSkin.."|r")
		else
			UISkinOptions.TitanPanelSkin = "Enabled"
			TitanPanelSkinButton.text:SetText("TitanPanel Skin |cff00ff00"..UISkinOptions.TitanPanelSkin.."|r")
		end
	end)
	WowLuaSkinButton = CreateFrame("Button", "WowLuaSkinButton", SkinOptions, "UIPanelButtonTemplate")
	WowLuaSkinButton:SetPoint("TOPRIGHT", -12, -400)
	WowLuaSkinButton:Size(200,24)
	cSkinButton(WowLuaSkinButton)
	WowLuaSkinButton.text = WowLuaSkinButton:CreateFontString(nil, "OVERLAY")
	WowLuaSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	WowLuaSkinButton.text:SetPoint("CENTER", WowLuaSkinButton, 0, 0)
	if (UISkinOptions.WowLuaSkin == "Enabled") then WowLuaSkinButton.text:SetText("WowLua Skin |cff00ff00"..UISkinOptions.WowLuaSkin.."|r") end
	if (UISkinOptions.WowLuaSkin == "Disabled") then WowLuaSkinButton.text:SetText("WowLua Skin |cffff2020"..UISkinOptions.WowLuaSkin.."|r") end
	if not IsAddOnLoaded("WowLua") then WowLuaSkinButton:Disable() WowLuaSkinButton.text:SetText("|cFF808080WowLua Not Detected|r") end
	WowLuaSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.WowLuaSkin == "Enabled") then
			UISkinOptions.WowLuaSkin = "Disabled"			
			WowLuaSkinButton.text:SetText("WowLua Skin |cffff2020"..UISkinOptions.WowLuaSkin.."|r")
		else
			UISkinOptions.WowLuaSkin = "Enabled"
			WowLuaSkinButton.text:SetText("WowLua Skin |cff00ff00"..UISkinOptions.WowLuaSkin.."|r")
		end
	end)

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

