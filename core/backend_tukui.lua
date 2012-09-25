if not IsAddOnLoaded("Tukui") then return end

local U = unpack(select(2,...))
UISkinOptions = {}
local s = U.s
local c = U.c
local XS = {}
XS.skins = {}
XS.events = {}
XS.register = {}
U.x = XS
U.tuk = true
local Skins = U.Skins
XS.Init = function(self)
	if self.frame then return end -- In case this gets called twice as can sometimes happen with ElvUI

	local f = CreateFrame("Frame",nil)

	self.frame = f
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			self:RegisterSkin(skin,data.func,data.events)
		end
	end
	for skin,funcs in pairs(XS.skins) do
		if U.CheckOption(skin) then
			for func,_ in pairs(funcs) do
				func(f,"PLAYER_ENTERING_WORLD")
			end
		end
	end
	f:SetScript("OnEvent", function(self,event)
		for skin,funcs in pairs(XS.skins) do
			if U.CheckOption(skin) and XS.events[event][skin] then
				for func,_ in pairs(funcs) do
					func(f,event)
				end
			end
		end
	end)

	self.frame = f
end

XS.RegisterSkin = function(self,skinName,func,...)
	local events = ...
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][func] = true
	for i = 1,#events do
		local event = select(i,events)
		if not event then return end
		if not self.events[event] then self.frame:RegisterEvent(event); self.events[event] = {} end
		self.events[event][skinName] = true
	end
end

XS.UnregisterEvent = function(self,skinName,event)
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

s.CreatePopup["OLD_SKIN_PACKAGE"] = {
	question = "You have the old Tukui_UIPackages_Skins addon.  This addon replaces it and will conflict.  Press accept to disable this addon and reload your UI.",
	answer1 = ACCEPT,
	function1 = function() DisableAddOn("Tukui_UIPackages_Skins"); ReloadUI() end,
	timeout = 0,
	whileDead = 1,
}

local XSFrame = CreateFrame("Frame",nil)
XSFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
XSFrame:SetScript("OnEvent",function(self)
	XS:Init()
	if IsAddOnLoaded("Tukui_UIPackages_Skins") then s.ShowPopup("OLD_SKIN_PACKAGE") end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

local DefaultSetSkin = CreateFrame("Frame")
	DefaultSetSkin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	DefaultSetSkin:SetScript( "OnEvent", function(self)
	if(UISkinOptions.RecountBackdrop == nil) then UISkinOptions.RecountBackdrop = "Enabled" end
	if(UISkinOptions.SkadaBackdrop == nil) then UISkinOptions.SkadaBackdrop = "Enabled" end
	if(UISkinOptions.ACPSkin == nil) then UISkinOptions.ACPSkin = "Enabled" end
	if(UISkinOptions.AdiBagsSkin == nil) then UISkinOptions.AdiBagsSkin = "Enabled" end
	if(UISkinOptions.AltoholicSkin == nil) then UISkinOptions.AltoholicSkin = "Enabled" end
	if(UISkinOptions.ArchySkin == nil) then UISkinOptions.ArchySkin = "Enabled" end
	if(UISkinOptions.ArkInventorySkin == nil) then UISkinOptions.ArkInventorySkin = "Enabled" end
	if(UISkinOptions.AtlasLootSkin == nil) then UISkinOptions.AtlasLootSkin = "Enabled" end
	if(UISkinOptions.ATSWSkin == nil) then UISkinOptions.ATSWSkin = "Enabled" end
	if(UISkinOptions.AuctionatorSkin == nil) then UISkinOptions.AuctionatorSkin = "Enabled" end
	if(UISkinOptions.AuctioneerSkin == nil) then UISkinOptions.AuctioneerSkin = "Enabled" end
	if(UISkinOptions.BPTSkin == nil) then UISkinOptions.BPTSkin = "Enabled" end
	if(UISkinOptions.BigWigsSkin == nil) then UISkinOptions.BigWigsSkin = "Enabled" end
	if(UISkinOptions.BGDefenderSkin == nil) then UISkinOptions.BGDefenderSkin = "Enabled" end
	if(UISkinOptions.BuyEmAllSkin == nil) then UISkinOptions.BuyEmAllSkin = "Enabled" end
	if(UISkinOptions.ChocolateBarSkin == nil) then UISkinOptions.ChocolateBarSkin = "Enabled" end
	if(UISkinOptions.CliqueSkin == nil) then UISkinOptions.CliqueSkin = "Enabled" end
	if(UISkinOptions.CLCInfoSkin == nil) then UISkinOptions.CLCInfoSkin = "Enabled" end
	if(UISkinOptions.CLCProtSkin == nil) then UISkinOptions.CLCProtSkin = "Enabled" end
	if(UISkinOptions.CLCRetSkin == nil) then UISkinOptions.CLCRetSkin = "Enabled" end
	if(UISkinOptions.DBMSkin == nil) then UISkinOptions.DBMSkin = "Enabled" end
	if(UISkinOptions.DBMSkinHalf == nil) then UISkinOptions.DBMSkinHalf = "Disabled" end
	if(UISkinOptions.DXESkin == nil) then UISkinOptions.DXESkin = "Disabled" end
	if(UISkinOptions.EasyMailSkin == nil) then UISkinOptions.EasyMailSkin = "Enabled" end
	if(UISkinOptions.EnergyWatchSkin == nil) then UISkinOptions.EnergyWatchSkin = "Enabled" end
	if(UISkinOptions.ExtVendorSkin == nil) then UISkinOptions.ExtVendorSkin = "Enabled" end
	if(UISkinOptions.FactionizerSkin == nil) then UISkinOptions.FactionizerSkin = "Enabled" end
	if(UISkinOptions.FlightMapSkin == nil) then UISkinOptions.FlightMapSkin = "Enabled" end
	if(UISkinOptions.KarniCrapSkin == nil) then UISkinOptions.KarniCrapSkin = "Enabled" end
	if(UISkinOptions.LightheadedSkin == nil) then UISkinOptions.LightheadedSkin = "Enabled" end
	if(UISkinOptions.LootCouncilLiteSkin == nil) then UISkinOptions.LootCouncilLiteSkin = "Enabled" end
	if(UISkinOptions.MageNuggetsSkin == nil) then UISkinOptions.MageNuggetsSkin = "Enabled" end
	if(UISkinOptions.MasterLootManagerRemixSkin == nil) then UISkinOptions.MasterLootManagerRemixSkin = "Enabled" end
	if(UISkinOptions.MinimalArchaeologySkin == nil) then UISkinOptions.MinimalArchaeologySkin = "Enabled" end
	if(UISkinOptions.MoveAnythingSkin == nil) then UISkinOptions.MoveAnythingSkin = "Enabled" end
	if(UISkinOptions.MRTSkin == nil) then UISkinOptions.MRTSkin = "Enabled" end
	if(UISkinOptions.MyRolePlaySkin == nil) then UISkinOptions.MyRolePlaySkin = "Enabled" end
	if(UISkinOptions.OdysseySkin == nil) then UISkinOptions.OdysseySkin = "Enabled" end
	if(UISkinOptions.OgriLazySkin == nil) then UISkinOptions.OgriLazySkin = "Enabled" end
	if(UISkinOptions.OmenSkin == nil) then UISkinOptions.OmenSkin = "Enabled" end	
	if(UISkinOptions.OutfitterSkin == nil) then UISkinOptions.OutfitterSkin = "Enabled" end
	if(UISkinOptions.PlayerScoreSkin == nil) then UISkinOptions.PlayerScoreSkin = "Enabled" end
	if(UISkinOptions.PoisonerSkin == nil) then UISkinOptions.PoisonerSkin = "Enabled" end
	if(UISkinOptions.PoMTrackerSkin == nil) then UISkinOptions.PoMTrackerSkin = "Enabled" end
	if(UISkinOptions.PostalSkin == nil) then UISkinOptions.PostalSkin = "Enabled" end
	if(UISkinOptions.PowerAurasSkin == nil) then UISkinOptions.PowerAurasSkin = "Enabled" end
	if(UISkinOptions.PowerAurasIconsSkin == nil) then UISkinOptions.PowerAurasIconsSkin = "Enabled" end
	if(UISkinOptions.ProfessionTabsSkin == nil) then UISkinOptions.ProfessionTabsSkin = "Enabled" end
	if(UISkinOptions.QuartzSkin == nil) then UISkinOptions.QuartzSkin = "Enabled" end
	if(UISkinOptions.RaidInviteOrganizerSkin == nil) then UISkinOptions.RaidInviteOrganizerSkin = "Enabled" end
	if(UISkinOptions.RaidBuffStatusSkin == nil) then UISkinOptions.RaidBuffStatusSkin = "Enabled" end
	if(UISkinOptions.RecountSkin == nil) then UISkinOptions.RecountSkin = "Enabled" end
	if(UISkinOptions.EmbedRecount == nil) then UISkinOptions.EmbedRecount = "Disabled" end
	if(UISkinOptions.SearingPlasmaTrackerSkin == nil) then UISkinOptions.SearingPlasmaTrackerSkin = "Enabled" end
	if(UISkinOptions.SexyCooldownSkin == nil) then UISkinOptions.SexyCooldownSkin = "Enabled" end
	if(UISkinOptions.SkadaSkin == nil) then UISkinOptions.SkadaSkin = "Enabled" end
	if(UISkinOptions.EmbedSkada == nil) then UISkinOptions.EmbedSkada = "Disabled" end
	if(UISkinOptions.SkilletSkin == nil) then UISkinOptions.SkilletSkin = "Enabled" end
	if(UISkinOptions.SpineCounterSkin == nil) then UISkinOptions.SpineCounterSkin = "Enabled" end
	if(UISkinOptions.SpySkin == nil) then UISkinOptions.SpySkin = "Enabled" end
	if(UISkinOptions.stAddonManagerSkin == nil) then UISkinOptions.stAddonManagerSkin = "Enabled" end
	if(UISkinOptions.SwatterSkin == nil) then UISkinOptions.SwatterSkin = "Enabled" end
	if(UISkinOptions.TellMeWhenSkin == nil) then UISkinOptions.TellMeWhenSkin = "Enabled" end
	if(UISkinOptions.TinyDPSSkin == nil) then UISkinOptions.TinyDPSSkin = "Enabled" end
	if(UISkinOptions.TitanPanelSkin == nil) then UISkinOptions.TitanPanelSkin = "Enabled" end
	if(UISkinOptions.WeakAurasSkin == nil) then UISkinOptions.WeakAurasSkin = "Enabled" end
	if(UISkinOptions.WhollySkin == nil) then UISkinOptions.WhollySkin = "Enabled" end
	if(UISkinOptions.WowLuaSkin == nil) then UISkinOptions.WowLuaSkin = "Enabled" end
	if(UISkinOptions.ZygorSkin == nil) then UISkinOptions.ZygorSkin = "Enabled" end
	if(UISkinOptions.UISkinMinimap == nil) then UISkinOptions.UISkinMinimap = "Enabled" end
	if(UISkinOptions.LootConfirmer == nil) then UISkinOptions.LootConfirmer = "Enabled" end
	if(UISkinOptions.LootIconsChat == nil) then UISkinOptions.LootIconsChat = "Enabled" end
	if(UISkinOptions.EmbedOoC == nil) then UISkinOptions.EmbedOoC = "Disabled" end
	if(UISkinOptions.EmbedTDPS == nil) then UISkinOptions.EmbedTDPS = "Disabled" end
	if(UISkinOptions.TukuiChatBackground == nil) then UISkinOptions.TukuiChatBackground = "Disabled" end
	if(UISkinOptions.LeftChatBackground == nil) then UISkinOptions.LeftChatBackground = "Interface\\AddOns\\Tukui_ElvUI_Skins\\media\\horde.tga" end
	if(UISkinOptions.RightChatBackground == nil) then UISkinOptions.RightChatBackground = "Interface\\AddOns\\Tukui_ElvUI_Skins\\media\\horde.tga" end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

local SkinOptions = CreateFrame("Frame", "SkinOptions", UIParent)
	SkinOptions:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinOptions:SetScript("OnEvent", function(self)
	if IsAddOnLoaded("Tukui") then UIFont = [[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]] UIFontSize = 12 end
	SkinOptions:Hide()
	SkinOptions:SetTemplate("Transparent")
	SkinOptions:Point("CENTER", UIParent, "CENTER", 0, 0)
	SkinOptions:SetFrameStrata("DIALOG")
	SkinOptions:Width(650)
	SkinOptions:Height(650)
	SkinOptions:SetClampedToScreen(true)
	SkinOptions:SetMovable(true)
	SkinOptions.text = SkinOptions:CreateFontString(nil, "OVERLAY")
	SkinOptions.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions.text:SetPoint("TOP", SkinOptions, 0, -6)
	SkinOptions.text:SetText("|cffC495DDTukui|r Skin Options - Version "..U.Version)
	SkinOptions:EnableMouse(true)
	SkinOptions:RegisterForDrag("LeftButton")
	SkinOptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
	SkinOptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	SkinOptions2 = CreateFrame("Frame", "SkinOptions2", UIParent)
	SkinOptions2:SetTemplate("Transparent")
	SkinOptions2:Point("TOPLEFT", SkinOptions, "TOPLEFT", 0, 0)
	SkinOptions2:SetFrameStrata("DIALOG")
	SkinOptions2:Width(SkinOptions:GetWidth())
	SkinOptions2:Height(SkinOptions:GetHeight())
	SkinOptions2:SetClampedToScreen(true)
	SkinOptions2:SetMovable(true)
	SkinOptions2:EnableMouse(true)
	SkinOptions2:RegisterForDrag("LeftButton")
	SkinOptions2:Hide()
	SkinOptions2.text = SkinOptions2:CreateFontString(nil, "OVERLAY")
	SkinOptions2.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions2.text:SetPoint("TOP", SkinOptions2, 0, -6)
	SkinOptions2.text:SetText("|cffC495DDTukui|r Module Options - Version "..U.Version)

	SkinOptions3 = CreateFrame("Frame", "SkinOptions3", UIParent)
	SkinOptions3:SetTemplate("Transparent")
	SkinOptions3:Point("TOPLEFT", SkinOptions, "TOPLEFT", 0, 0)
	SkinOptions3:SetFrameStrata("DIALOG")
	SkinOptions3:Width(SkinOptions:GetWidth())
	SkinOptions3:Height(SkinOptions:GetHeight())
	SkinOptions3:SetClampedToScreen(true)
	SkinOptions3:SetMovable(true)
	SkinOptions3:EnableMouse(true)
	SkinOptions3:RegisterForDrag("LeftButton")
	SkinOptions3:Hide()
	SkinOptions3.text = SkinOptions3:CreateFontString(nil, "OVERLAY")
	SkinOptions3.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions3.text:SetPoint("TOP", SkinOptions3, 0, -6)
	SkinOptions3.text:SetText("|cffC495DDTukui|r Embed Options - Version "..U.Version)

	ApplySkinSettingsButton = CreateFrame("Button", "ApplySkinSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	ApplySkinSettingsButton:SetPoint("BOTTOMLEFT", 60, -26)
	ApplySkinSettingsButton:Size(100,24)
	U.SkinButton(ApplySkinSettingsButton)
	ApplySkinSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	ApplySkinSettingsButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ApplySkinSettingsButton.text:SetPoint("CENTER", ApplySkinSettingsButton, 0, 0)
	ApplySkinSettingsButton.text:SetText("Apply Settings")
	ApplySkinSettingsButton:HookScript("OnClick", function() ReloadUI() end)

	EmbedWindowSettingsButton = CreateFrame("Button", "EmbedWindowSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	EmbedWindowSettingsButton:SetPoint("RIGHT", ApplySkinSettingsButton, "RIGHT", 102, 0)
	EmbedWindowSettingsButton:Size(100,24)
	U.SkinButton(EmbedWindowSettingsButton)
	EmbedWindowSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	EmbedWindowSettingsButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EmbedWindowSettingsButton.text:SetPoint("CENTER", EmbedWindowSettingsButton, 0, 0)
	EmbedWindowSettingsButton.text:SetText("Embed Options")
	EmbedWindowSettingsButton:HookScript("OnClick", function()
			SkinOptions1Button:SetParent(SkinOptions3)
			SkinOptions2Button:SetParent(SkinOptions3)
			EmbedWindowSettingsButton:SetParent(SkinOptions3)
			ApplySkinSettingsButton:SetParent(SkinOptions3)
			SkinOptionsCloseButton:SetParent(SkinOptions3)
			SkinOptions:Hide()
			SkinOptions2:Hide()
			SkinOptions3:Show()
	end)
	SkinOptions1Button = CreateFrame("Button", "SkinOptions1Button", SkinOptions, "UIPanelButtonTemplate")
	SkinOptions1Button:SetPoint("RIGHT", EmbedWindowSettingsButton, "RIGHT", 102, 0)
	SkinOptions1Button:Size(100,24)
	U.SkinButton(SkinOptions1Button)
	SkinOptions1Button.text = SkinOptions1Button:CreateFontString(nil, "OVERLAY")
	SkinOptions1Button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptions1Button.text:SetPoint("CENTER", SkinOptions1Button, 0, 0)
	SkinOptions1Button.text:SetText("Skin Options")
	SkinOptions1Button:HookScript("OnClick", function()
			SkinOptions1Button:SetParent(SkinOptions)
			SkinOptions2Button:SetParent(SkinOptions)
			EmbedWindowSettingsButton:SetParent(SkinOptions)
			ApplySkinSettingsButton:SetParent(SkinOptions)
			SkinOptionsCloseButton:SetParent(SkinOptions)
			SkinOptions:Show()
			SkinOptions2:Hide()
			SkinOptions3:Hide()
	end)
	SkinOptions2Button = CreateFrame("Button", "SkinOptions2Button", SkinOptions, "UIPanelButtonTemplate")
	SkinOptions2Button:SetPoint("RIGHT", SkinOptions1Button, "RIGHT", 102, 0)
	SkinOptions2Button:Size(100,24)
	U.SkinButton(SkinOptions2Button)
	SkinOptions2Button.text = SkinOptions2Button:CreateFontString(nil, "OVERLAY")
	SkinOptions2Button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptions2Button.text:SetPoint("CENTER", SkinOptions2Button, 0, 0)
	SkinOptions2Button.text:SetText("Module Options")
	SkinOptions2Button:HookScript("OnClick", function() 
			SkinOptions1Button:SetParent(SkinOptions2)
			SkinOptions2Button:SetParent(SkinOptions2)
			EmbedWindowSettingsButton:SetParent(SkinOptions2)
			ApplySkinSettingsButton:SetParent(SkinOptions2)
			SkinOptionsCloseButton:SetParent(SkinOptions2)
			SkinOptions:Hide()
			SkinOptions2:Show()
			SkinOptions3:Hide()
	end)

	SkinOptionsCloseButton = CreateFrame("Button", "SkinOptionsCloseButton", SkinOptions, "UIPanelButtonTemplate")
	SkinOptionsCloseButton:SetPoint("RIGHT", SkinOptions2Button, "RIGHT", 102, 0)
	SkinOptionsCloseButton:Size(100,24)
	U.SkinButton(SkinOptionsCloseButton)
	SkinOptionsCloseButton.text = SkinOptionsCloseButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsCloseButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptionsCloseButton.text:SetPoint("CENTER", SkinOptionsCloseButton, 0, 0)
	SkinOptionsCloseButton.text:SetText("Close Options")
	SkinOptionsCloseButton:HookScript("OnClick", function()
		SkinOptions1Button:SetParent(SkinOptions)
		SkinOptions2Button:SetParent(SkinOptions)
		EmbedWindowSettingsButton:SetParent(SkinOptions)
		ApplySkinSettingsButton:SetParent(SkinOptions)
		SkinOptionsCloseButton:SetParent(SkinOptions)
		SkinOptions:Hide()
		SkinOptions2:Hide()
		SkinOptions3:Hide()
	end)

--Buttons
	SkinOptionsButton = CreateFrame("Button", "SkinOptionsButton", GameMenuFrame, "GameMenuButtonTemplate")
	SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -1)
	SkinOptionsButton:Size(144,21)
	U.SkinButton(SkinOptionsButton)
	SkinOptionsButton.text = SkinOptionsButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsButton.text:SetFont(UIFont, 12)
	if IsAddOnLoaded("ElvUI") then SkinOptionsButton.text:SetFont(c["media"].normFont, 12) end
	SkinOptionsButton.text:SetPoint("CENTER", SkinOptionsButton, 0, 0)
	SkinOptionsButton.text:SetText("Skins")
	SkinOptionsButton:HookScript("OnClick", function() SkinOptions:Show() HideUIPanel(GameMenuFrame) end)

	GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -38)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)
	if IsAddOnLoaded("stAddonmanager") then  
		SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -23)
		GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -60)
	end
-- Long Button
	--[[local function CreateButton(name,buttonText,addon,option,x,y,skinOptions2)
		local button = CreateFrame("Button", name, skinOptions2 and SkinOptions2 or SkinOptions, "UIPanelButtonTemplate")
		local yOffset = -30 - (25*(y-1))
		local xTable = {
			[1] = { point = "TOPLEFT", offset = 12 },
			[2] = { point = "TOP", offset = 0 },
			[3] = { point = "TOPRIGHT", offset = -12 }
		}
		button:SetPoint(xTable[x].point, xTable[x].offset, yOffset)
		button:Size(skinOptions2 and 175 or 200,20)
		U.SkinButton(button)
		button.text = button:CreateFontString(nil, "OVERLAY")
		button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
		button.text:SetPoint("CENTER", button, 0, 0)
		if (UISkinOptions[option] == "Enabled") then button.text:SetText(string.format("|cff00ff00%s|r",buttonText)) end
		if (UISkinOptions[option] == "Disabled") then button.text:SetText(string.format("|cffff2020%s|r",buttonText)) end
		if addon then
			if not IsAddOnLoaded(addon) then button:Disable() button.text:SetText(string.format("|cFF808080%s|r",buttonText)) end
		end
		button:HookScript("OnClick", function()
			if (UISkinOptions[option] == "Enabled") then
				UISkinOptions[option] = "Disabled"
				button.text:SetText(string.format("|cffff2020%s|r",buttonText))
			else
				UISkinOptions[option] = "Enabled"
				button.text:SetText(string.format("|cff00ff00%s|r",buttonText))
			end
		end)
	end--]]
--Box Button
--Overlord Red (0.68,0.14,0.14)
--VIP Green (0.11,0.66,0.11)
--Grey (0.8,0.8,0.8)
--Premium Brown (0.77,0.7,0.34,1)
--ElvUI Blue (0.24,0.54,0.78,1)
--Donor Purple (0.6,0,0.86,1)
--Mod Orange (0.83,0.55,0,1)
	local function CreateButton(name,buttonText,addon,option,x,y,skinOptions2)
		local button = CreateFrame("Button", name, skinOptions2 and SkinOptions2 or SkinOptions)
		local yOffset = -30 - (25*(y-1))
		local xTable = {
			[1] = { point = "TOPLEFT", offset = 12 },
			[2] = { point = "TOP", offset = -68 },
			[3] = { point = "TOPRIGHT", offset = -178 }
		}
		button:SetPoint(xTable[x].point, xTable[x].offset, yOffset)
		button:Size(16)
		button:CreateBackdrop()
		button:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

		button.text = button:CreateFontString(nil, "OVERLAY")
		button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
		button.text:SetPoint("LEFT", button, "RIGHT", 10, 0)
		button.text:SetText(buttonText)
		if (UISkinOptions[option] == "Enabled") then button:SetBackdropColor(0.6,0,0.86,1) end
		if (UISkinOptions[option] == "Disabled") then button:SetBackdropColor(0.68,0.14,0.14,1) end
		if addon then
			if not IsAddOnLoaded(addon) then button:Disable() button:SetBackdropColor(0.24,0.54,0.78,1) end
		end
		button:HookScript("OnClick", function()
			if (UISkinOptions[option] == "Enabled") then
				UISkinOptions[option] = "Disabled"
				button:SetBackdropColor(0.68,0.14,0.14,1)
			else
				UISkinOptions[option] = "Enabled"
				button:SetBackdropColor(0.6,0,0.86,1)
			end
		end)
	end
	
	--local function CreateButton(name,buttonText,addon,option,x,y)
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
    local curX,curY,maxY=1,1,22
	for skin,options in pairsByKeys(Skins) do
		local addon = options.addon
		local buttonText = options.buttonText or addon
		if options.ui ~= "ElvUI" then
			CreateButton(string.format('%sButton',skin),buttonText,addon,skin,curX,curY)
			curY = curY + 1
			if curY > maxY then
				curX = curX + 1
				curY = 1
			end
		end
	end

	local Skins2 = {
		["LootConfirmer"] = {
			["buttonText"] = "Loot Confirm",
		},
		["UISkinMinimap"] = {
			["buttonText"] = "Square Minimap Buttons",
		},
		["DBMSkinHalf"] = {
			["buttonText"] = "DBM Half-Bar Skin",
			["addon"] = "DBM-Core",
		},
		["LootIconsChat"] = {
			["buttonText"] = "Loot Icons in Loot Window",
		},
		["CLCProtSkin"] = {
			["buttonText"] = "CLCProt Icons",
			["addon"] = "CLCProt",
		},
		["CLCRetSkin"] = {
			["buttonText"] = "CLCRet Icons",
			["addon"] = "CLCRet",
		},
		["PowerAurasIconsSkin"] = {
			["buttonText"] = "PowerAuras Icons",
			["addon"] = "PowerAuras",
		},
		["WeakAurasSkin"] = {
			["buttonText"] = "WeakAuras Icons",
			["addon"] = "WeakAuras",
		},
	}

	curY = 1
	for skin,options in pairsByKeys(Skins2) do
		local addon = nil
		local buttonText = options.buttonText
		CreateButton(string.format('%sButton',skin),buttonText,addon,skin,1,curY,true)
		curY = curY + 1
	end

--Chat Background Start
LeftChatBackgroundEditBox = CreateFrame("EditBox", LeftChatBackgroundEditBox, SkinOptions2)
	LeftChatBackgroundEditBox.text = SkinOptions2:CreateFontString(nil, "OVERLAY")
	LeftChatBackgroundEditBox.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	LeftChatBackgroundEditBox.text:SetPoint("LEFT", LeftChatBackgroundEditBox, "LEFT", 0, 20)
	LeftChatBackgroundEditBox.text:SetText("Left Chat Background")
	LeftChatBackgroundEditBox:SetAutoFocus(false)
	LeftChatBackgroundEditBox:SetMultiLine(false)
	LeftChatBackgroundEditBox:SetWidth(280)
	LeftChatBackgroundEditBox:SetHeight(20)
	LeftChatBackgroundEditBox:SetMaxLetters(255)
	LeftChatBackgroundEditBox:SetTextInsets(3,0,0,0)
	LeftChatBackgroundEditBox:SetBackdrop({
		bgFile = [=[Interface\Addons\Tukui\media\textures\blank]=], 
		tiled = false,
	})
	LeftChatBackgroundEditBox:SetBackdropColor(0,0,0,0.5)
	LeftChatBackgroundEditBox:SetBackdropBorderColor(0,0,0,1)
	LeftChatBackgroundEditBox:SetFontObject(GameFontHighlight)
	LeftChatBackgroundEditBox:SetPoint("BOTTOMLEFT", SkinOptions2, 12, 80)
	LeftChatBackgroundEditBox:SetText(UISkinOptions.LeftChatBackground)
	LeftChatBackgroundEditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(UISkinOptions.LeftChatBackground) end)
	LeftChatBackgroundEditBox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus()
		UISkinOptions.LeftChatBackground = self:GetText()
		ApplyLeftChatBackground()
		end)
	LeftChatBackgroundEditBox:SetTemplate("Default")

function ApplyLeftChatBackground()
	if not TukuiChatBackgroundLeft.bg then
		TukuiChatBackgroundLeft.bg = TukuiChatBackgroundLeft:CreateTexture(nil, 'LOW')
		TukuiChatBackgroundLeft.bg:SetInside()
	end
	TukuiChatBackgroundLeft.bg:SetTexture(UISkinOptions.LeftChatBackground)
	TukuiChatBackgroundLeft.bg:SetAlpha(0.7)
	TukuiInfoLeft:StripTextures()
	TukuiTabsLeftBackground:Hide()
end

RightChatBackgroundEditBox = CreateFrame("EditBox", RightChatBackgroundEditBox, SkinOptions2)
	RightChatBackgroundEditBox.text = SkinOptions2:CreateFontString(nil, "OVERLAY")
	RightChatBackgroundEditBox.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RightChatBackgroundEditBox.text:SetPoint("LEFT", RightChatBackgroundEditBox, "LEFT", 0, 20)
	RightChatBackgroundEditBox.text:SetText("Right Chat Background")
	RightChatBackgroundEditBox:SetAutoFocus(false)
	RightChatBackgroundEditBox:SetMultiLine(false)
	RightChatBackgroundEditBox:SetWidth(280)
	RightChatBackgroundEditBox:SetHeight(20)
	RightChatBackgroundEditBox:SetMaxLetters(255)
	RightChatBackgroundEditBox:SetTextInsets(3,0,0,0)
	RightChatBackgroundEditBox:SetBackdrop({
		bgFile = [=[Interface\Addons\Tukui\media\textures\blank]=], 
		tiled = false,
	})
	RightChatBackgroundEditBox:SetBackdropColor(0,0,0,0.5)
	RightChatBackgroundEditBox:SetBackdropBorderColor(0,0,0,1)
	RightChatBackgroundEditBox:SetFontObject(GameFontHighlight)
	RightChatBackgroundEditBox:SetPoint("BOTTOMRIGHT", SkinOptions2, -12, 80)
	RightChatBackgroundEditBox:SetText(UISkinOptions.RightChatBackground)
	RightChatBackgroundEditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(UISkinOptions.RightChatBackground) end)
	RightChatBackgroundEditBox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus()
		UISkinOptions.RightChatBackground = self:GetText()
		ApplyRightChatBackground()
		end)
	RightChatBackgroundEditBox:SetTemplate("Default")

function ApplyRightChatBackground()
	if not TukuiChatBackgroundRight.bg then
		TukuiChatBackgroundRight.bg = TukuiChatBackgroundRight:CreateTexture(nil, 'LOW')
		TukuiChatBackgroundRight.bg:SetInside()
	end
	TukuiChatBackgroundRight.bg:SetTexture(UISkinOptions.RightChatBackground)
	TukuiChatBackgroundRight.bg:SetAlpha(0.7)
	TukuiInfoRight:StripTextures()
	TukuiTabsRightBackground:Hide()
end
	TukuiChatBackgroundButton = CreateFrame("Button", "TukuiChatBackgroundButton", SkinOptions2)
	TukuiChatBackgroundButton:SetPoint("BOTTOM", SkinOptions2, -80, 150)
	TukuiChatBackgroundButton:Size(16)
	TukuiChatBackgroundButton:CreateBackdrop()
	TukuiChatBackgroundButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

	TukuiChatBackgroundButton.text = TukuiChatBackgroundButton:CreateFontString(nil, "OVERLAY")
	TukuiChatBackgroundButton.text:SetFont(UIFont, 14, "OUTLINE")
	TukuiChatBackgroundButton.text:SetPoint("LEFT", TukuiChatBackgroundButton, "RIGHT", 12, 0)
	TukuiChatBackgroundButton.text:SetText("|cffC495DDTukui|r Chat Background")
	if (U.CheckOption("TukuiChatBackground")) then TukuiChatBackgroundButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("TukuiChatBackground")) then TukuiChatBackgroundButton:SetBackdropColor(0.68,0.14,0.14,1) end
	TukuiChatBackgroundButton:SetScript("OnClick", function()
		if (U.CheckOption("TukuiChatBackground")) then
			U.DisableOption("TukuiChatBackground")
			LeftChatBackgroundEditBox:Disable()
			RightChatBackgroundEditBox:Disable()
			LeftChatBackgroundEditBox:SetAlpha(0)
			LeftChatBackgroundEditBox.text:SetAlpha(0)
			RightChatBackgroundEditBox:SetAlpha(0)
			RightChatBackgroundEditBox.text:SetAlpha(0)
			TukuiChatBackgroundButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			LeftChatBackgroundEditBox:Enable()
			RightChatBackgroundEditBox:Enable()
			LeftChatBackgroundEditBox:SetAlpha(1)
			LeftChatBackgroundEditBox.text:SetAlpha(1)
			RightChatBackgroundEditBox:SetAlpha(1)
			RightChatBackgroundEditBox.text:SetAlpha(1)
			U.EnableOption("TukuiChatBackground")
			TukuiChatBackgroundButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

if not TukuiChatBackgroundLeft then
	LeftChatBackgroundEditBox:Disable()
	RightChatBackgroundEditBox:Disable()
	LeftChatBackgroundEditBox:SetAlpha(0)
	LeftChatBackgroundEditBox.text:SetAlpha(0)
	RightChatBackgroundEditBox:SetAlpha(0)
	RightChatBackgroundEditBox.text:SetAlpha(0)
	SkinOptions2.text3 = SkinOptions2:CreateFontString(nil, "OVERLAY")
	SkinOptions2.text3:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions2.text3:SetPoint("BOTTOM", SkinOptions2, 0, 80)
	SkinOptions2.text3:SetText("You must have Chat Backgrounds Enabled in Tukui. \n\n Tukui -> Chat -> Enable Chat Panel Background")
end

if (U.CheckOption("TukuiChatBackground")) then
	ApplyLeftChatBackground()
	ApplyRightChatBackground()
end

--Chat Background End

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