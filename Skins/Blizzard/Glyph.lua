local AS = unpack(AddOnSkins)

local name = 'Blizzard_GlyphUI'
function AS:Blizzard_GlyphUI(event, addon)
	if addon ~= 'Blizzard_GlyphUI' then return end

	GlyphFrame.background:SetDrawLayer('BORDER')
	AS:SkinBackdropFrame(GlyphFrame, nil, true)
	GlyphFrame.background:SetInside(GlyphFrame.Backdrop)
	AS:SkinEditBox(GlyphFrameSearchBox)
	AS:SkinDropDownBox(GlyphFrameFilterDropDown, 212)

	for i = 1, 2 do
		_G["GlyphFrameHeader"..i].middle:SetTexture(nil)
		_G["GlyphFrameHeader"..i].leftEdge:SetTexture(nil)
		_G["GlyphFrameHeader"..i].rightEdge:SetTexture(nil)
		AS:SetTemplate(_G["GlyphFrameHeader"..i])
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

	AS:SkinScrollBar(GlyphFrameScrollFrameScrollBar)

	local StripAllTextures = {
		GlyphFrameScrollFrame,
		GlyphFrameSideInset,
		GlyphFrameScrollFrameScrollChild
	}

	for _, object in pairs(StripAllTextures) do
		AS:StripTextures(object)
	end

	if not AS.ParchmentEnabled then
		AS:StripTextures(GlyphFrame)
		AS:SkinTexture(GlyphFrame.specIcon)
		GlyphFrame:HookScript('OnUpdate', function(self)
			self.specIcon:SetAlpha(1 - self.glow:GetAlpha())
		end)

		for i = 1, 6 do
			local Glyph = _G["GlyphFrameGlyph"..i]
			AS:SetTemplate(Glyph)
			Glyph:SetBackdropColor(0,0,0,0)
			Glyph:SetFrameLevel(Glyph:GetFrameLevel() + 5)
			Glyph.ring:Hide()
			Glyph.glyph:Hide()
			Glyph.highlight:SetTexture(nil)

			-- This will make the glyphs nice and square.
			Glyph.glyph:Hide()
			Glyph.icon = Glyph:CreateTexture(nil, 'OVERLAY')
			Glyph.icon:SetInside()
			AS:SkinTexture(Glyph.icon)

			-- Real Highlight shit right here.
			AS:CreateBackdrop(Glyph)
			Glyph.Backdrop:SetAllPoints()
			Glyph.Backdrop:SetFrameLevel(Glyph:GetFrameLevel() + 1)
			Glyph.Backdrop:SetBackdropColor(0, 0, 0, 0)
			Glyph.Backdrop:SetBackdropBorderColor(1, 1, 0)
			Glyph.Backdrop:SetScript('OnUpdate', function(self)
				local Alpha = Glyph.highlight:GetAlpha()
				self:SetAlpha(Alpha)
				if strfind(Glyph.icon:GetTexture(), "Interface\\Spellbook\\UI%-Glyph%-Rune") then
					if Alpha == 0 then
						Glyph.icon:SetVertexColor(1, 1, 1)
						Glyph.icon:SetAlpha(1)
					else
						Glyph.icon:SetVertexColor(1, 1, 0)
						Glyph.icon:SetAlpha(Alpha)
					end
				end
			end)

			hooksecurefunc(Glyph.highlight, 'Show', function()
				Glyph.Backdrop:Show()
			end)

			Glyph.glyph:Hide()
			hooksecurefunc(Glyph.glyph, 'Show', function(self) self:Hide() end)
			
			hooksecurefunc('GlyphFrame_Update', function(self)
				local isActiveTalentGroup = PlayerTalentFrame and PlayerTalentFrame.talentGroup == GetActiveSpecGroup();
				for i = 1, NUM_GLYPH_SLOTS do
					local GlyphSocket = Glyph;
					local _, _, _, _, iconFilename = GetGlyphSocketInfo(i, PlayerTalentFrame.talentGroup)
					if iconFilename then
						GlyphSocket.icon:SetTexture(iconFilename)
					else
						GlyphSocket.icon:SetTexture("Interface\\Spellbook\\UI-Glyph-Rune-"..i)
					end
					GlyphFrameGlyph_UpdateSlot(GlyphSocket);
					SetDesaturation(GlyphSocket.icon, not isActiveTalentGroup);
				end
				SetDesaturation(self.specIcon, not isActiveTalentGroup);
			end)

			if i % 2 == 1 then
				Glyph:Size(Glyph:GetWidth() * .8, Glyph:GetHeight() * .8)
			end
		end
	end

	AS:UnregisterSkinEvent('Blizzard_GlyphUI', 'ADDON_LOADED')
end

AS:RegisterSkin('Blizzard_GlyphUI', AS.Blizzard_GlyphUI, 'ADDON_LOADED')
