-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka
-- Important: cSkinSlideBar is for Tukui / cSkinSliderFrame is for ElvUI. Tukui doesn't have a slider function. I was given permission to use the code by Sinaris.
-- cSkinSlideBar usage: cSkinSlideBar(FrameName, Height, Movetext) Example: cSkinSlideBar(TukuiSlider, 10, True)

UIPackageSkinFuncs = {}
local s

if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
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
		s.SkinButton(self)
	end
end

function cSkinScrollBar(self)
	if ElvUI then
		s:HandleScrollBar(self)
	else
		s.SkinScrollBar(self)
	end
end

function cSkinTab(self)
	if ElvUI then
		s:HandleTab(self)
	else
		s.SkinTab(self)
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
		s.SkinRotateButton(self)
	end
end

function cSkinEditBox(self)
	if ElvUI then
		s:HandleEditBox(self)
	else
		s.SkinEditBox(self)
	end
end

function cSkinDropDownBox(self)
	if ElvUI then
		s:HandleDropDownBox(self)
	else
		s.SkinDropDownBox(self)
	end
end

function cSkinCheckBox(self)
	if ElvUI then
		s:HandleCheckBox(self)
	else
		s.SkinCheckBox(self)
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
	end
end

function cSkinFrame(self)
	self:StripTextures(True)
	self:SetTemplate("Transparent")
end

function cSkinFrameD(self)
	self:StripTextures(True)
	self:SetTemplate("Default")
end

function cSkinStatusBar(self)
	self:StripTextures(True)
	self:CreateBackdrop()
	self:SetStatusBarTexture(c["media"].normTex)
end

function cSkinCCStatusBar(self)
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

function cSkinSlideBar(self, height, movetext)
	self:StripTextures(True)
	self:SetTemplate("Default")
	self:SetBackdropColor(0, 0, 0, .8)

	if not height then
		height = self:GetHeight()
	end
	
	local slidername = self:GetName()

	if(movetext) then
		if(_G[slidername.."Low"]) then _G[slidername.."Low"]:Point("BOTTOM", 0, -18) end
		if(_G[slidername.."High"]) then _G[slidername.."High"]:Point("BOTTOM", 0, -18) end
		if(_G[slidername.."Text"]) then _G[slidername.."Text"]:Point("TOP", 0, 19) end
	end

	local c = UIPackageSkinFuncs.c

	_G[slidername]:SetThumbTexture(c["media"].blank)
	_G[slidername]:GetThumbTexture():SetVertexColor(unpack(c["media"].bordercolor))
	if(self:GetWidth() < self:GetHeight()) then
		self:Width(height)
		_G[slidername]:GetThumbTexture():Size(self:GetWidth(),self:GetWidth()+4)
	else
		self:Height(height)
		_G[slidername]:GetThumbTexture():Size(height+4,height)
	end
end