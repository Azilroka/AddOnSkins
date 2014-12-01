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
				if strfind(_G["GlyphFrameGlyph"..i].icon:GetTexture(), "Interface\\Spellbook\\UI%-Glyph%-Rune") then
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

			_G["GlyphFrameGlyph"..i].glyph:Hide()
			hooksecurefunc(_G["GlyphFrameGlyph"..i].glyph, 'Show', function(self) self:Hide() end)
			
			hooksecurefunc('GlyphFrame_Update', function(self)
				local isActiveTalentGroup = PlayerTalentFrame and PlayerTalentFrame.talentGroup == GetActiveSpecGroup();
				for i = 1, NUM_GLYPH_SLOTS do
					local GlyphSocket = _G["GlyphFrameGlyph"..i];
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
				_G["GlyphFrameGlyph"..i]:Size(_G["GlyphFrameGlyph"..i]:GetWidth() * .8, _G["GlyphFrameGlyph"..i]:GetHeight() * .8)
			end
		end
	end

	AS:UnregisterSkinEvent('Blizzard_GlyphUI', 'ADDON_LOADED')
end

AS:RegisterSkin('Blizzard_GlyphUI', AS.Blizzard_GlyphUI, 'ADDON_LOADED')
