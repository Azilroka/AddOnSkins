local AS, L, S, R = unpack(AddOnSkins)

function R:TalentSetManager(event, addon)
	if addon == 'Blizzard_TalentUI' then
		AS:Delay(0.02, function()
			TalentSetsListEquipSet.ButtonBackground:Hide()
			TalentSetManagerHelpButton:Hide()

			TalentSetsShowButton:ClearAllPoints()
			TalentSetsShowButton:SetPoint("TOPRIGHT", PlayerTalentFrame, 34, -25)
			TalentSetsMainframe:SetWidth(TalentSetsMainframe:GetWidth() - 10)
			TalentSetsMainframe:SetHeight(TalentSetsMainframe:GetHeight() - 11)
			TalentSetsMainframe:ClearAllPoints()
			TalentSetsMainframe:SetPoint("TOPLEFT", TalentSetsShowButton, "BOTTOMLEFT", 0, -3)

			TalentSetsMainframe.title:SetFont(AS.Font, 14)

			S:CreateBackdrop(TalentSetsMainframe)
			S:HandleFrame(TalentSetsMainframe, true)
			S:HandleIcon(TalentSetsMainframe.Bg)
			S:HandleFrame(TalentSetsShowButton)
			S:CreateBackdrop(TalentSetsShowButton)
			TalentSetsShowButton:SetNormalTexture("Interface\\Icons\\achievement_guildperk_ladyluck_rank2")
			S:HandleIcon(TalentSetsShowButton:GetNormalTexture())

			TalentSetsListEquipSet:SetWidth(TalentSetsListEquipSet:GetWidth() - 3)
			S:HandleButton(TalentSetsListEquipSet)
			TalentSetsListSaveSet:SetWidth(TalentSetsListSaveSet:GetWidth() - 3)
			TalentSetsListSaveSet:ClearAllPoints()
			TalentSetsListSaveSet:SetPoint("TOPLEFT", TalentSetsListEquipSet, "TOPRIGHT", 1, 0)
			S:HandleButton(TalentSetsListSaveSet)

			TalentSetsFrameScrollBarScrollUpButton:ClearAllPoints()
			TalentSetsFrameScrollBarScrollUpButton:SetPoint("TOPLEFT", TalentSetsListSaveSet, "TOPRIGHT", 1, 0)
			TalentSetsFrameScrollBar:SetWidth(TalentSetsFrameScrollBar:GetWidth() - 13)
			S:HandleScrollBar(TalentSetsFrameScrollBar)

			for i = 1, #TalentSetsList["buttons"] do
				S:HandleFrame(_G["TalentSetsListButton"..i])
				S:HandleIcon(_G["TalentSetsListButton"..i.."Icon"])
				if i == 1 then
					_G["TalentSetsListButton"..i]:ClearAllPoints()
					_G["TalentSetsListButton"..i]:SetPoint("TOPLEFT", TalentSetsListEquipSet, "BOTTOMLEFT", 0, -1)
				else
					_G["TalentSetsListButton"..i]:ClearAllPoints()
					_G["TalentSetsListButton"..i]:SetPoint("TOPLEFT", _G["TalentSetsListButton"..i - 1], "BOTTOMLEFT", 0, -1)
				end
			end
		end)
	end
end

AS:RegisterSkin('TalentSetManager', nil, "ADDON_LOADED")
