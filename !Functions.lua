-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end

UIPackageSkinFuncs = {}
local s

if ElvUI then
	local E, L, V, P, G, DF = unpack(ElvUI)
	local S = E:GetModule('Skins')
	UIPackageSkinFuncs.s = S
	UIPackageSkinFuncs.c = E
	UIPackageSkinFuncs.ccolor = E.myclass
	s = S
else
	local T, C, L = unpack(Tukui)
	UIPackageSkinFuncs.s = T
	UIPackageSkinFuncs.c = C
	UIPackageSkinFuncs.ccolor = T.myclass
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

function cSkinSliderFrame(self)
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
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	self:StripTextures(True)
	self:CreateBackdrop()
	self:SetStatusBarTexture(c["media"].normTex)
end

function cSkinCCStatusBar(self)
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	self:StripTextures(True)
	self:CreateBackdrop("ClassColor")
	self:SetStatusBarTexture(c["media"].normTex)
	local color = RAID_CLASS_COLORS[UIPackageSkinFuncs.ccolor]
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
	if ElvUI then
		local c = UIPackageSkinFuncs.c
		return c.db.skins[optionName]
	else
		return UISkinOptions[optionName] == "Enabled"
	end
end

function cRegisterSkin(skinName,skinFunc,...)
	if IsAddOnLoaded("Tukui") then
		if not cCheckOption(skinName) then return end

		local events = ...
		local Skin = CreateFrame("Frame")
		Skin:RegisterEvent("PLAYER_ENTERING_WORLD")
		for i = 1,#events do
			Skin:RegisterEvent(select(i,events))
		end
		Skin:SetScript("OnEvent", function(self,event,addon)
			skinFunc(self,event,addon)
			if event == "PLAYER_ENTERING_WORLD" then
				self:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end
		end)
	else
		local c = UIPackageSkinFuncs.c
		local XS = c:GetModule("ExtraSkins")
		local events = ...
		local registerMe = { func = skinFunc, events = events or {} }
		XS.register[skinName] = registerMe
	end
end

function cUnregisterEvent(skinName,frame,event)
	if IsAddOnLoaded("Tukui") then
		frame:UnregisterEvent(event)
	else
		local c = UIPackageSkinFuncs.c
		local XS = c:GetModule("ExtraSkins")
		XS:UnregisterEvent(skinName,event)
	end
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