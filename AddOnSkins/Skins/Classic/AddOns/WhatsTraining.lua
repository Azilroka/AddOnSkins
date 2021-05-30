local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WhatsTraining') then return end

function AS:WhatsTraining()
	AS:Delay(.5, function()
		AS:StripTextures(WhatsTrainingFrame)

		for i = 1, 22 do
			if (WhatsTrainingFrame.rows[i]) then
				if i == 1 then
					WhatsTrainingFrame.rows[1]:SetPoint("TOPLEFT", WhatsTrainingFrame, 26, -48)
				else
					WhatsTrainingFrame.rows[i]:SetPoint("TOPLEFT", WhatsTrainingFrame.rows[i - 1], "BOTTOMLEFT", 0, -2)
				end
				AS:SkinTexture(WhatsTrainingFrame.rows[i].spell.icon)
			end
		end

		WhatsTrainingFrame:HookScript("OnShow", function()
			local inCombat = InCombatLockdown() or UnitAffectingCombat("player")
			if not inCombat then
				SpellBookSpellIconsFrame:Hide()
			end
			SpellBookPageText:Hide()
			SpellBookPrevPageButton:Hide()
			SpellBookNextPageButton:Hide()
		end)
		WhatsTrainingFrame:HookScript("OnHide", function()
			local inCombat = InCombatLockdown() or UnitAffectingCombat("player")
			if not inCombat then
				SpellBookSpellIconsFrame:Show()
			end
			SpellBookPageText:Show()
			SpellBookPrevPageButton:Show()
			SpellBookNextPageButton:Show()
		end)

		AS:SkinScrollBar(WhatsTrainingFrameScrollBarScrollBar)
		WhatsTrainingFrameScrollBar:SetPoint("TOPLEFT", '$parent', 20, -45)
		WhatsTrainingFrameScrollBar:SetPoint("BOTTOMRIGHT", '$parent', -65, 81)
		AS:SkinBackdropFrame(WhatsTrainingFrameScrollBar)

		if WhatsTrainingTooltip then
			WhatsTrainingTooltip:SetScript("OnShow", function()
				AS:SkinTooltip(WhatsTrainingTooltip)
			end)
		end
	end)
end

AS:RegisterSkin('WhatsTraining', AS.WhatsTraining)