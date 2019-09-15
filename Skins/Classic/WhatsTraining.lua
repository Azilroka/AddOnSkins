local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WhatsTraining') then return end

function AS:WhatsTraining()
	AS:Delay(.5, function()
		AS:StripTextures(WhatsTrainingFrame)

		for i = 1, 22 do
			if i == 1 then
				WhatsTrainingFrame.rows[1]:SetPoint("TOPLEFT", WhatsTrainingFrame, 26, -48)
			else
				WhatsTrainingFrame.rows[i]:SetPoint("TOPLEFT", WhatsTrainingFrame.rows[i - 1], "BOTTOMLEFT", 0, -2)
			end
			AS:SkinTexture(WhatsTrainingFrame.rows[i].spell.icon)
		end

		WhatsTrainingFrame:HookScript("OnShow", function()
			SpellBookSpellIconsFrame:Hide()
			SpellBookPageText:Hide()
			SpellBookPrevPageButton:Hide()
			SpellBookNextPageButton:Hide()
		end)
		WhatsTrainingFrame:HookScript("OnHide", function()
			SpellBookSpellIconsFrame:Show()
			SpellBookPageText:Show()
			SpellBookPrevPageButton:Show()
			SpellBookNextPageButton:Show()
		end)

		AS:SkinScrollBar(WhatsTrainingFrameScrollBarScrollBar)
		WhatsTrainingFrameScrollBar:SetPoint("TOPLEFT", '$parent', 20, -45)
		WhatsTrainingFrameScrollBar:SetPoint("BOTTOMRIGHT", '$parent', -65, 41)
		AS:SkinBackdropFrame(WhatsTrainingFrameScrollBar)

	end)
end

AS:RegisterSkin('WhatsTraining', AS.WhatsTraining)
