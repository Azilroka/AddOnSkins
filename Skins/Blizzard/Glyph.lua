local AS = unpack(AddOnSkins)

local name = 'Blizzard_GlyphUI'
function AS:Blizzard_GlyphUI(event, addon)
	if addon ~= 'Blizzard_GlyphUI' then return end

	AS:CreateBackdrop(GlyphFrame)
	GlyphFrame.Backdrop:Point("TOPLEFT", GlyphFrame, "TOPLEFT", 3, 2)
	GlyphFrame.Backdrop:Point("BOTTOMRIGHT", GlyphFrame, "BOTTOMRIGHT", -3, 0)
	AS:SkinEditBox(GlyphFrameSearchBox)
	AS:SkinDropDownBox(GlyphFrameFilterDropDown, 212)

	GlyphFrameBackground:SetPoint("TOPLEFT", 5, 0)
	GlyphFrameBackground:SetPoint("BOTTOMRIGHT", -5, 2)

	for i = 1, 6 do
		AS:SetTemplate(_G["GlyphFrameGlyph"..i])
		_G["GlyphFrameGlyph"..i]:SetBackdropColor(0,0,0,0)
		_G["GlyphFrameGlyph"..i]:SetFrameLevel(_G["GlyphFrameGlyph"..i]:GetFrameLevel() + 5)
		_G["GlyphFrameGlyph"..i].ring:Hide()
		_G["GlyphFrameGlyph"..i].glyph:Hide()
		_G["GlyphFrameGlyph"..i].highlight:SetTexture(nil)

		-- This will make the glyphs nice and square.
		_G["GlyphFrameGlyph"..i].icon = _G["GlyphFrameGlyph"..i]:CreateTexture(nil, 'OVERLAY')
		_G["GlyphFrameGlyph"..i].icon:SetInside()
		AS:SkinTexture(_G["GlyphFrameGlyph"..i].icon)

		-- Real Highlight shit right here.
		AS:CreateBackdrop(_G["GlyphFrameGlyph"..i])
		_G["GlyphFrameGlyph"..i].Backdrop:SetAllPoints()
		_G["GlyphFrameGlyph"..i].Backdrop:SetFrameLevel(_G["GlyphFrameGlyph"..i]:GetFrameLevel() + 1)
		_G["GlyphFrameGlyph"..i].Backdrop:SetBackdropColor(0, 0, 0, 0)
		_G["GlyphFrameGlyph"..i].Backdrop:SetBackdropBorderColor(1, 1, 0)
		_G["GlyphFrameGlyph"..i].Backdrop:SetScript('OnUpdate', function(self)
			local Alpha = _G["GlyphFrameGlyph"..i].highlight:GetAlpha()
			self:SetAlpha(Alpha)
			if _G["GlyphFrameGlyph"..i].icon:GetTexture() == "Interface\\Spellbook\\UI-Glyph-Rune1" then
				if Alpha == 0 then
					_G["GlyphFrameGlyph"..i].icon:SetVertexColor(1, 1, 1)
					_G["GlyphFrameGlyph"..i].icon:SetAlpha(1)
				else
					_G["GlyphFrameGlyph"..i].icon:SetVertexColor(1, 1, 0)
					_G["GlyphFrameGlyph"..i].icon:SetAlpha(Alpha)
				end
			end
		end)

		hooksecurefunc(_G["GlyphFrameGlyph"..i].highlight, 'Show', function()
			_G["GlyphFrameGlyph"..i].Backdrop:Show()
		end)

		hooksecurefunc(_G["GlyphFrameGlyph"..i].glyph, 'SetTexture', function(self, texture)
			self:Hide()
			local _, _, _, _, iconFilename = GetGlyphSocketInfo(i, PlayerTalentFrame.talentGroup)
			if iconFilename then
				_G["GlyphFrameGlyph"..i].icon:SetTexture(iconFilename)
			else
				_G["GlyphFrameGlyph"..i].icon:SetTexture("Interface\\Spellbook\\UI-Glyph-Rune1")
			end
		end)

		hooksecurefunc(_G["GlyphFrameGlyph"..i].glyph, 'Show', function(self, texture)
			self:Hide()
			local _, _, _, _, iconFilename = GetGlyphSocketInfo(i, PlayerTalentFrame.talentGroup)
			if iconFilename then
				_G["GlyphFrameGlyph"..i].icon:SetTexture(iconFilename)
			else
				_G["GlyphFrameGlyph"..i].icon:SetTexture("Interface\\Spellbook\\UI-Glyph-Rune1")
			end
		end)

		if i % 2 == 1 then
			_G["GlyphFrameGlyph"..i]:Size(_G["GlyphFrameGlyph"..i]:GetWidth() * .8, _G["GlyphFrameGlyph"..i]:GetHeight() * .8)
		end
	end

	GlyphFrameBackground:Hide()

	for i = 1, 2 do
		AS:StripTextures(_G["GlyphFrameHeader"..i])
	end

	for i = 1, 10 do
		local button = _G["GlyphFrameScrollFrameButton"..i]
		local icon = _G["GlyphFrameScrollFrameButton"..i.."Icon"]

		AS:StripTextures(button)

		if icon then
			AS:SkinTexture(icon)
			AS:SkinButton(button)
		end
	end

	AS:SetTemplate(GlyphFrameClearInfoFrame, 'Default')
	AS:SkinTexture(GlyphFrameClearInfoFrameIcon)
	GlyphFrameClearInfoFrameIcon:SetInside()

	GlyphFrameLevelOverlay1:SetParent(GlyphFrame.Backdrop)
	GlyphFrameLevelOverlayText1:SetParent(GlyphFrame.Backdrop)
	GlyphFrameLevelOverlay2:SetParent(GlyphFrame.Backdrop)
	GlyphFrameLevelOverlayText2:SetParent(GlyphFrame.Backdrop)

	AS:SkinScrollBar(GlyphFrameScrollFrameScrollBar)

	local StripAllTextures = {
		GlyphFrameScrollFrame,
		GlyphFrameSideInset,
		GlyphFrameScrollFrameScrollChild
	}

	for _, object in pairs(StripAllTextures) do
		AS:StripTextures(object)
	end

	AS:UnregisterSkinEvent('Blizzard_GlyphUI', 'ADDON_LOADED')
end

AS:RegisterSkin('Blizzard_GlyphUI', AS.Blizzard_GlyphUI, 'ADDON_LOADED')
