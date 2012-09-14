-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
local addon,Engine = ...

local AddOn = {};

Engine[1] = AddOn
UISkins = Engine

local s
if ElvUI then
	local E, L, V, P, G, DF = unpack(ElvUI)
	local S = E:GetModule('Skins')
	AddOn.s = S
	AddOn.c = E
	AddOn.ccolor = E.myclass
	s = S
else
	local T, C, L = unpack(Tukui)
	AddOn.s = T
	AddOn.c = C
	AddOn.ccolor = T.myclass
	s = T
end

function cSkinButton(self)
	if ElvUI then
		s:HandleButton(self)
	else
		self:SkinButton()
	end
end

function cSkinScrollBar(self)
	if ElvUI then
		s:HandleScrollBar(self)
	else
		self:SkinScrollBar()
	end
end

function cSkinTab(self)
	if ElvUI then
		s:HandleTab(self)
	else
		self:SkinTab()
	end
end

function cSkinNextPrevButton(self)
	if ElvUI then
		s:HandleNextPrevButton(self)
	else
		s.SkinNextPrevButton(self)
	end
end

function cSkinRotateButton(self)
	if ElvUI then
		s:HandleRotateButton(self)
	else
		self:SkinRotateButton()
	end
end

function cSkinEditBox(self)
	if ElvUI then
		s:HandleEditBox(self)
	else
		self:SkinEditBox()
	end
end

function cSkinDropDownBox(self)
	if ElvUI then
		s:HandleDropDownBox(self)
	else
		self:SkinDropDownBox()
	end
end

function cSkinCheckBox(self)
	if ElvUI then
		s:HandleCheckBox(self)
	else
		self:SkinCheckBox()
	end
end

function cSkinCloseButton(self)
	if ElvUI then
		s:HandleCloseButton(self)
	else
		s.SkinCloseButton(self)
	end
end

function cSkinSliderFrame(self, height)
	if ElvUI then
		s:HandleSliderFrame(self)
	else
		SkinSlideBar(self, height, movetext)
	end
end

function cSkinFrame(self)
	self:StripTextures(True)
	self:SetTemplate("Transparent")
end

function cSkinBackdropFrame(self)
	self:StripTextures(True)
	self:CreateBackdrop("Transparent")
end

function cSkinFrameD(self)
	self:StripTextures(True)
	self:SetTemplate("Default")
end

function cSkinStatusBar(self)
	local s = AddOn.s
	local c = AddOn.c
	self:StripTextures(True)
	self:CreateBackdrop()
	self:SetStatusBarTexture(c["media"].normTex)
end

function cSkinCCStatusBar(self)
	local s = AddOn.s
	local c = AddOn.c
	self:StripTextures(True)
	self:CreateBackdrop("ClassColor")
	self:SetStatusBarTexture(c["media"].normTex)
	local color = RAID_CLASS_COLORS[AddOn.ccolor]
	self:SetStatusBarColor(color.r, color.g, color.b)
end

function cDesaturate(f, point)
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

function cCheckOption(optionName)
	if IsAddOnLoaded("ElvUI") then
		local c = AddOn.c
		return c.db.skins[optionName]
	else
		return UISkinOptions[optionName] == "Enabled"
	end
end

function cDisableOption(optionName)
	if IsAddOnLoaded("ElvUI") then
		local c = AddOn.c
		c.db.skins[optionName] = false
	else
		UISkinOptions[optionName] = "Disabled"
	end
end

function cEnableOption(optionName)
	if IsAddOnLoaded("ElvUI") then
		local c = AddOn.c
		c.db.skins[optionName] = true
	else
		UISkinOptions[optionName] = "Enabled"
	end
end

function cRegisterSkin(skinName,skinFunc,...)
	local events = ...
	local XS = AddOn.x
	local registerMe = { func = skinFunc, events = events or {} }
	if not XS.register[skinName] then XS.register[skinName] = {} end
	XS.register[skinName][skinFunc] = registerMe
end

function cUnregisterEvent(skinName,frame,event)
	local XS = AddOn.x
	XS:UnregisterEvent(skinName,event)
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