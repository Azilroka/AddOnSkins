if ElvUI then
	local E, L, DF = unpack(ElvUI)
	local S = E:GetModule('Skins')
	s = S
	c = E
	ccolor = E.myclass
else
	local T, C, L = unpack(Tukui)
	s = T
	c = C
	ccolor = T.myclass
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
		s.SkinSliderFrame(self)
	end
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