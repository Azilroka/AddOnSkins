if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
UISkinOptions = {}
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

local DefaultSetSkin = CreateFrame("Frame")
	DefaultSetSkin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	DefaultSetSkin:SetScript( "OnEvent", function(self)
	if(UISkinOptions.AltoholicSkin == nil) then UISkinOptions.AltoholicSkin = "Enabled" end
	if(UISkinOptions.ATSWSkin == nil) then UISkinOptions.ATSWSkin = "Enabled" end
	if(UISkinOptions.BigWigsSkin == nil) then UISkinOptions.BigWigsSkin = "Enabled" end
	if(UISkinOptions.BuyEmAllSkin == nil) then UISkinOptions.BuyEmAllSkin = "Enabled" end
	if(UISkinOptions.CliqueSkin == nil) then UISkinOptions.CliqueSkin = "Enabled" end
	if(UISkinOptions.DBMSkin == nil) then UISkinOptions.DBMSkin = "Disabled" end
	if(UISkinOptions.DXESkin == nil) then UISkinOptions.DXESkin = "Disabled" end
	if(UISkinOptions.EnergyWatchSkin == nil) then UISkinOptions.EnergyWatchSkin = "Enabled" end
	if(UISkinOptions.ExtVendorSkin == nil) then UISkinOptions.ExtVendorSkin = "Enabled" end
	if(UISkinOptions.KarniCrapSkin == nil) then UISkinOptions.KarniCrapSkin = "Enabled" end
	if(UISkinOptions.MageNuggetsSkin == nil) then UISkinOptions.MageNuggetsSkin = "Enabled" end
	if(UISkinOptions.MoveAnythingSkin == nil) then UISkinOptions.MoveAnythingSkin = "Enabled" end
	if(UISkinOptions.MRTSkin == nil) then UISkinOptions.MRTSkin = "Enabled" end
	if(UISkinOptions.OdysseySkin == nil) then UISkinOptions.OdysseySkin = "Enabled" end
	if(UISkinOptions.OgriLazySkin == nil) then UISkinOptions.OgriLazySkin = "Enabled" end
	if(UISkinOptions.OmenSkin == nil) then UISkinOptions.OmenSkin = "Disabled" end	
	if(UISkinOptions.OutfitterSkin == nil) then UISkinOptions.OutfitterSkin = "Enabled" end
	if(UISkinOptions.PlayerScoreSkin == nil) then UISkinOptions.PlayerScoreSkin = "Enabled" end
	if(UISkinOptions.PoisonerSkin == nil) then UISkinOptions.PoisonerSkin = "Enabled" end
	if(UISkinOptions.PoMTackerSkin == nil) then UISkinOptions.PoMTrackerSkin = "Enabled" end
	if(UISkinOptions.PowerAurasSkin == nil) then UISkinOptions.PowerAurasSkin = "Enabled" end
	if(UISkinOptions.RaidInviteOrganizerSkin == nil) then UISkinOptions.RaidInviteOrganizerSkin = "Enabled" end
	if(UISkinOptions.RaidBuffStatusSkin == nil) then UISkinOptions.RaidBuffStatusSkin = "Enabled" end
	if(UISkinOptions.SearingPlasmaTrackerSkin == nil) then UISkinOptions.SearingPlasmaTrackerSkin = "Enabled" end
	if(UISkinOptions.SpineCounterSkin == nil) then UISkinOptions.SpineCounterSkin = "Enabled" end
	if(UISkinOptions.SpySkin == nil) then UISkinOptions.SpySkin = "Enabled" end
	if(UISkinOptions.SwatterSkin == nil) then UISkinOptions.SwatterSkin = "Enabled" end
	if(UISkinOptions.TinyDPSSkin == nil) then UISkinOptions.TinyDPSSkin = "Disabled" end
	if(UISkinOptions.XPBarNoneSkin == nil) then UISkinOptions.XPBarNoneSkin = "Enabled" end
	end)

local SkinOptions = CreateFrame("Frame", "SkinOptions", UIParent)
	SkinOptions:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinOptions:SetScript( "OnEvent", function(self)
	if IsAddOnLoaded("Tukui") then UIFont = c["media"].font end
	if IsAddOnLoaded("ElvUI") then UIFont = c["media"].normFont end
	SkinOptions:Hide()
	SkinOptions:SetTemplate("Transparent")
	SkinOptions:Point("CENTER", UIParent, "CENTER", 0, 0)
	SkinOptions:SetFrameStrata("MEDIUM")
	SkinOptions:Width(648)
	SkinOptions:Height(410)
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
	if IsAddOnLoaded("Tukui") then GameMenuFrame:HookScript("OnShow", function(self) self:Size(195, 325) end) end
	if IsAddOnLoaded("ElvUI") then GameMenuFrame:HookScript("OnShow", function(self) self:Size(195, 305) end) end
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

	AltoholicSkinButton = CreateFrame("Button", "AltoholicSkinButton", SkinOptions, "UIPanelButtonTemplate")
	AltoholicSkinButton:SetPoint("TOPLEFT", 12, -40)
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
	ATSWSkinButton = CreateFrame("Button", "ATSWSkinButton", SkinOptions, "UIPanelButtonTemplate")
	ATSWSkinButton:SetPoint("TOPLEFT", 12, -70)
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
	BigWigsSkinButton = CreateFrame("Button", "BigWigsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BigWigsSkinButton:SetPoint("TOPLEFT", 12, -100)
	BigWigsSkinButton:Size(200,24)
	cSkinButton(BigWigsSkinButton)
	BigWigsSkinButton.text = BigWigsSkinButton:CreateFontString(nil, "OVERLAY")
	BigWigsSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	BigWigsSkinButton.text:SetPoint("CENTER", BigWigsSkinButton, 0, 0)
	if (UISkinOptions.BigWigsSkin == "Enabled") then BigWigsSkinButton.text:SetText("BigWigs Skin |cff00ff00"..UISkinOptions.BigWigsSkin.."|r") end
	if (UISkinOptions.BigWigsSkin == "Disabled") then BigWigsSkinButton.text:SetText("BigWigs Skin |cffff2020"..UISkinOptions.BigWigsSkin.."|r") end
	if not IsAddOnLoaded("BigWigs") then BigWigsSkinButton:Disable() BigWigsSkinButton.text:SetText("|cFF808080BigWigs Not Detected|r") end
	BigWigsSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.BigWigsSkin == "Enabled") then
			UISkinOptions.BigWigsSkin = "Disabled"			
			BigWigsSkinButton.text:SetText("BigWigs Skin |cffff2020"..UISkinOptions.BigWigsSkin.."|r")
		else
			UISkinOptions.BigWigsSkin = "Enabled"
			BigWigsSkinButton.text:SetText("BigWigs Skin |cff00ff00"..UISkinOptions.BigWigsSkin.."|r")
		end
	end)
	BuyEmAllSkinButton = CreateFrame("Button", "BuyEmAllSkinButton", SkinOptions, "UIPanelButtonTemplate")
	BuyEmAllSkinButton:SetPoint("TOPLEFT", 12, -130)
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
	CliqueSkinButton = CreateFrame("Button", "CliqueSkinButton", SkinOptions, "UIPanelButtonTemplate")
	CliqueSkinButton:SetPoint("TOPLEFT", 12, -160)
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
	DBMSkinButton:SetPoint("TOPLEFT", 12, -190)
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
	DXESkinButton = CreateFrame("Button", "DXESkinButton", SkinOptions, "UIPanelButtonTemplate")
	DXESkinButton:SetPoint("TOPLEFT", 12, -220)
	DXESkinButton:Size(200,24)
	cSkinButton(DXESkinButton)
	DXESkinButton.text = DXESkinButton:CreateFontString(nil, "OVERLAY")
	DXESkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	DXESkinButton.text:SetPoint("CENTER", DXESkinButton, 0, 0)
	if (UISkinOptions.DXESkin == "Enabled") then DXESkinButton.text:SetText("DXE Skin |cff00ff00"..UISkinOptions.DXESkin.."|r") end
	if (UISkinOptions.DXESkin == "Disabled") then DXESkinButton.text:SetText("DXE Skin |cffff2020"..UISkinOptions.DXESkin.."|r") end
	if not IsAddOnLoaded("DXE_Loader") then DXESkinButton:Disable() DXESkinButton.text:SetText("|cFF808080DXE Not Detected|r") end
	DXESkinButton:HookScript("OnClick", function()
		if (UISkinOptions.DXESkin == "Enabled") then
			UISkinOptions.DXESkin = "Disabled"			
			DXESkinButton.text:SetText("DXE Skin |cffff2020"..UISkinOptions.DXESkin.."|r")
		else
			UISkinOptions.DXESkin = "Enabled"
			DXESkinButton.text:SetText("DXE Skin |cff00ff00"..UISkinOptions.DXESkin.."|r")
		end
	end)
	EnergyWatchSkinButton = CreateFrame("Button", "EnergyWatchSkinButton", SkinOptions, "UIPanelButtonTemplate")
	EnergyWatchSkinButton:SetPoint("TOPLEFT", 12, -250)
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
	ExtVendorSkinButton:SetPoint("TOPLEFT", 12, -280)
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
	KarniCrapSkinButton = CreateFrame("Button", "KarniCrapSkinButton", SkinOptions, "UIPanelButtonTemplate")
	KarniCrapSkinButton:SetPoint("TOPLEFT", 12, -310)
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
	MageNuggetsSkinButton = CreateFrame("Button", "MageNuggetsSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MageNuggetsSkinButton:SetPoint("TOPLEFT", 12, -340)
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
	MoveAnythingSkinButton = CreateFrame("Button", "MoveAnythingSkinButton", SkinOptions, "UIPanelButtonTemplate")
	MoveAnythingSkinButton:SetPoint("TOPLEFT", 12, -370)
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
	MRTSkinButton:SetPoint("TOP", 0, -40)
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
	OdysseySkinButton:SetPoint("TOP", 0, -70)
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
	OgriLazySkinButton:SetPoint("TOP", 0, -100)
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
	OmenSkinButton:SetPoint("TOP", 0, -130)
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
	OutfitterSkinButton:SetPoint("TOP", 0, -160)
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
	PlayerScoreSkinButton = CreateFrame("Button", "PlayerScoreSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PlayerScoreSkinButton:SetPoint("TOP", 0, -190)
	PlayerScoreSkinButton:Size(200,24)
	cSkinButton(PlayerScoreSkinButton)
	PlayerScoreSkinButton.text = PlayerScoreSkinButton:CreateFontString(nil, "OVERLAY")
	PlayerScoreSkinButton.text:SetFont(UIFont, 12, "OUTLINE")
	PlayerScoreSkinButton.text:SetPoint("CENTER", PlayerScoreSkinButton, 0, 0)
	if (UISkinOptions.PlayerScoreSkin == "Enabled") then PlayerScoreSkinButton.text:SetText("PlayerScore Skin |cff00ff00"..UISkinOptions.PlayerScoreSkin.."|r") end
	if (UISkinOptions.PlayerScoreSkin == "Disabled") then PlayerScoreSkinButton.text:SetText("PlayerScore Skin |cffff2020"..UISkinOptions.PlayerScoreSkin.."|r") end
	if not IsAddOnLoaded("GearScore") then PlayerScoreSkinButton:Disable() PlayerScoreSkinButton.text:SetText("|cFF808080PlayerScore Not Detected|r") end
	PlayerScoreSkinButton:HookScript("OnClick", function()
		if (UISkinOptions.PlayerScoreSkin == "Enabled") then
			UISkinOptions.PlayerScoreSkin = "Disabled"			
			PlayerScoreSkinButton.text:SetText("PlayerScore Skin |cffff2020"..UISkinOptions.PlayerScoreSkin.."|r")
		else
			UISkinOptions.PlayerScoreSkin = "Enabled"
			PlayerScoreSkinButton.text:SetText("PlayerScore Skin |cff00ff00"..UISkinOptions.PlayerScoreSkin.."|r")
		end
	end)
	PoisonerSkinButton = CreateFrame("Button", "PoisonerSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PoisonerSkinButton:SetPoint("TOP", 0, -220)
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
	PoMTrackerSkinButton:SetPoint("TOP", 0, -250)
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
	PowerAurasSkinButton = CreateFrame("Button", "PowerAurasSkinButton", SkinOptions, "UIPanelButtonTemplate")
	PowerAurasSkinButton:SetPoint("TOP", 0, -280)
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
	RaidInviteOrganizerSkinButton:SetPoint("TOP", 0, -310)
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
	RaidBuffStatusSkinButton:SetPoint("TOP", 0, -340)
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
	SearingPlasmaTrackerSkinButton:SetPoint("TOP", 0, -370)
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
	SpineCounterSkinButton = CreateFrame("Button", "SpineCounterSkinButton", SkinOptions, "UIPanelButtonTemplate")
	SpineCounterSkinButton:SetPoint("TOPRIGHT", -12, -40)
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
	SpySkinButton:SetPoint("TOPRIGHT", -12, -70)
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
	SwatterSkinButton:SetPoint("TOPRIGHT", -12, -100)
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
	TinyDPSSkinButton:SetPoint("TOPRIGHT", -12, -130)
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

