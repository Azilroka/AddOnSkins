-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
local U = unpack(select(2,...))
local s = U.s

local function cSkinButton(self,strip)
	if ElvUI then
		s:HandleButton(self,strip)
	else
		self:SkinButton(strip)
	end
end

U.SkinButton = cSkinButton

local function cSkinScrollBar(self)
	if ElvUI then
		s:HandleScrollBar(self)
	else
		self:SkinScrollBar()
	end
end

U.SkinScrollBar = cSkinScrollBar

local function cSkinTab(self)
	if ElvUI then
		s:HandleTab(self)
	else
		self:SkinTab()
	end
end

U.SkinTab = cSkinTab

local function cSkinNextPrevButton(self, horizonal)
	if ElvUI then
		s:HandleNextPrevButton(self, horizonal)
	else
		self:SkinNextPrevButton(horizonal)
	end
end

U.SkinNextPrevButton = cSkinNextPrevButton

local function cSkinRotateButton(self)
	if ElvUI then
		s:HandleRotateButton(self)
	else
		self:SkinRotateButton()
	end
end

U.SkinRotateButton = cSkinRotateButton

local function cSkinEditBox(self)
	if ElvUI then
		s:HandleEditBox(self)
	else
		self:SkinEditBox()
	end
end

U.SkinEditBox = cSkinEditBox

local function cSkinDropDownBox(self, width)
	if ElvUI then
		s:HandleDropDownBox(self, width)
	else
		self:SkinDropDownBox(width)
	end
end

U.SkinDropDownBox = cSkinDropDownBox

local function cSkinCheckBox(self)
	if ElvUI then
		s:HandleCheckBox(self)
	else
		self:SkinCheckBox()
	end
end

U.SkinCheckBox = cSkinCheckBox

local function cSkinCloseButton(self)
	if ElvUI then
		s:HandleCloseButton(self)
	else
		s.SkinCloseButton(self)
	end
end

U.SkinCloseButton = cSkinCloseButton

local function cSkinSliderFrame(self, height)
	if ElvUI then
		s:HandleSliderFrame(self)
	else
		SkinSlideBar(self, height, movetext)
	end
end

U.SkinSliderFrame = cSkinSliderFrame

local function cSkinFrame(self)
	self:StripTextures(True)
	self:SetTemplate("Transparent")
end

U.SkinFrame = cSkinFrame

local function cSkinBackdropFrame(self)
	self:StripTextures(True)
	self:CreateBackdrop("Transparent")
end

U.SkinBackdropFrame = cSkinBackdropFrame

local function cSkinFrameD(self)
	self:StripTextures(True)
	self:SetTemplate("Default")
end

U.SkinFrameD = cSkinFrameD

local function cSkinStatusBar(self)
	local s = U.s
	local c = U.c
	self:StripTextures(True)
	self:CreateBackdrop()
	self:SetStatusBarTexture(c["media"].normTex)
end

U.SkinStatusBar = cSkinStatusBar

local function cSkinCCStatusBar(self)
	local s = U.s
	local c = U.c
	self:StripTextures(True)
	self:CreateBackdrop("ClassColor")
	self:SetStatusBarTexture(c["media"].normTex)
	local color = RAID_CLASS_COLORS[U.ccolor]
	self:SetStatusBarColor(color.r, color.g, color.b)
end

U.SkinCCStatusBar = cSkinCCStatusBar

local function cDesaturate(f, point)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)

			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end	

	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

U.Desaturate = cDesaturate

local function cCheckOption(optionName)
	if IsAddOnLoaded("ElvUI") then
		local c = U.c
		if not c.db or not c.db.skins then return false end
		return c.db.skins[optionName]
	else
		return UISkinOptions[optionName] == "Enabled"
	end
end

U.CheckOption = cCheckOption

local function cDisableOption(optionName)
	if IsAddOnLoaded("ElvUI") then
		local c = U.c
		c.db.skins[optionName] = false
	else
		UISkinOptions[optionName] = "Disabled"
	end
end

U.DisableOption = cDisableOption

local function cEnableOption(optionName)
	if IsAddOnLoaded("ElvUI") then
		local c = U.c
		c.db.skins[optionName] = true
	else
		UISkinOptions[optionName] = "Enabled"
	end
end

U.EnableOption = cEnableOption

local function cToggleOption(optionName)
	if cCheckOption(optionName) then
		cDisableOption(optionName)
	else
		cEnableOption(optionName)
	end
end

U.ToggleOption = cToggleOption

local function cRegisterSkin(skinName,skinFunc,...)
	local events = ...
	local XS = U.x
	local registerMe = { func = skinFunc, events = events or {} }
	if not XS.register[skinName] then XS.register[skinName] = {} end
	XS.register[skinName][skinFunc] = registerMe
end

U.RegisterSkin = cRegisterSkin

local function cUnregisterEvent(skinName,frame,event)
	local XS = U.x
	XS:UnregisterEvent(skinName,event)
end

U.UnregisterEvent = cUnregisterEvent

function AzilCompatMode()
	_G["cSkinButton"] = cSkinButton
	_G["cSkinScrollBar"] = cSkinScrollBar
	_G["cSkinTab"] = cSkinTab
	_G["cSkinNextPrevButton"] = cSkinNextPrevButton
	_G["cSkinRotateButton"] = cSkinRotateButton
	_G["cSkinEditBox"] = cSkinEditBox
	_G["cSkinDropDownBox"] = cSkinDropDownBox
	_G["cSkinCheckBox"] = cSkinCheckBox
	_G["cSkinCloseButton"] = cSkinCloseButton
	_G["cSkinSliderFrame"] = cSkinSliderFrame
	_G["cSkinFrame"] = cSkinFrame
	_G["cSkinBackdropFrame"] = cSkinBackdropFrame
	_G["cSkinFrameD"] = cSkinFrameD
	_G["cSkinStatusBar"] = cSkinStatusBar
	_G["cSkinCCStatusBar"] = cSkinCCStatusBar
	_G["cDesaturate"] = cDesaturate
	_G["cCheckOption"] = cCheckOption
	_G["cDisableOption"] = cDisableOption
	_G["cEnableOption"] = cEnableOption
	_G["cToggleOption"] = cToggleOption
	_G["cRegisterSkin"] = cRegisterSkin
	_G["cUnregisterEvent"] = cUnregisterEvent
end

if IsAddOnLoaded("Tukui") then

SLASH_FRAME1 = "/frame"
SlashCmdList["FRAME"] = function(arg)
	if arg ~= "" then
		arg = _G[arg]
	else
		arg = GetMouseFocus()
	end

	if arg ~= nil and arg:GetName() ~= nil then
		local point, relativeTo, relativePoint, xOfs, yOfs = arg:GetPoint()
		ChatFrame1:AddMessage("|cffCC0000~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		ChatFrame1:AddMessage("Name: |cffFFD100"..arg:GetName())
		if arg:GetParent() then
			ChatFrame1:AddMessage("Parent: |cffFFD100"..arg:GetParent():GetName())
		end

		ChatFrame1:AddMessage("Width: |cffFFD100"..format("%.2f",arg:GetWidth()))
		ChatFrame1:AddMessage("Height: |cffFFD100"..format("%.2f",arg:GetHeight()))
		ChatFrame1:AddMessage("Strata: |cffFFD100"..arg:GetFrameStrata())
		ChatFrame1:AddMessage("Level: |cffFFD100"..arg:GetFrameLevel())

		if xOfs then
			ChatFrame1:AddMessage("X: |cffFFD100"..format("%.2f",xOfs))
		end
		if yOfs then
			ChatFrame1:AddMessage("Y: |cffFFD100"..format("%.2f",yOfs))
		end
		if relativeTo then
			ChatFrame1:AddMessage("Point: |cffFFD100"..point.."|r anchored to "..relativeTo:GetName().."'s |cffFFD100"..relativePoint)
		end
		ChatFrame1:AddMessage("|cffCC0000~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	elseif arg == nil then
		ChatFrame1:AddMessage("Invalid frame name")
	else
		ChatFrame1:AddMessage("Could not find frame info")
	end
end

end