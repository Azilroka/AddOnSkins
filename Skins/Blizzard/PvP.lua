local AS = unpack(AddOnSkins)

function AS:Blizzard_PVPUI(event, addon)
	if addon ~= "Blizzard_PVPUI" then return end
	AS:StripTextures(PVPUIFrame)
	
	AS:StripTextures(HonorFrame.RoleInset)
	
	AS:SkinCheckBox(HonorFrame.RoleInset.DPSIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.RoleInset.TankIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.RoleInset.HealerIcon.checkButton, true)
	
	for i = 1, 4 do
		local Button = PVPQueueFrame['CategoryButton'..i]
		AS:SkinFrame(Button, nil, true)
		Button.Background:Kill()
		Button.Ring:Kill()
		Button.Icon:Size(45)
		AS:SkinTexture(Button.Icon)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetOutside(Button.Icon)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button:SetHighlightTexture('')
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self) 
			if self:GetID() == self.isSelected then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
				self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	PVPQueueFrame.CategoryButton1.Icon:SetTexture("Interface\\Icons\\achievement_bg_winwsg")
	PVPQueueFrame.CategoryButton2.Icon:SetTexture("Interface\\Icons\\achievement_bg_killxenemies_generalsroom")
	PVPQueueFrame.CategoryButton3.Icon:SetTexture("Interface\\Icons\\ability_warrior_offensivestance")
	PVPQueueFrame.CategoryButton4.Icon:SetTexture("Interface\\Icons\\Achievement_General_StayClassy")

	hooksecurefunc('PVPQueueFrame_SelectButton', function(index)
		for i = 1, 4 do
			local Button = PVPQueueFrame["CategoryButton"..i];
			if ( i == index ) then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.isSelected = i
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.isSelected = 0
			end
		end
	end)

	AS:SkinDropDownBox(HonorFrameTypeDropDown)

	AS:StripTextures(HonorFrame.Inset)

	AS:SkinScrollBar(HonorFrameSpecificFrameScrollBar)
	AS:SkinButton(HonorFrameSoloQueueButton, true)
	AS:SkinButton(HonorFrameGroupQueueButton, true)
	AS:StripTextures(HonorFrame.BonusFrame)
	AS:StripTextures(HonorFrame.BonusFrame.ShadowOverlay)
	AS:StripTextures(HonorFrame.BonusFrame.RandomBGButton)
	AS:SkinButton(HonorFrame.BonusFrame.RandomBGButton)
	HonorFrame.BonusFrame.RandomBGButton.SelectedTexture:ClearAllPoints()
	HonorFrame.BonusFrame.RandomBGButton.SelectedTexture:SetAllPoints()
	HonorFrame.BonusFrame.RandomBGButton.SelectedTexture:SetTexture(0, 1, 0, 0.1)
	AS:StripTextures(ConquestFrame.Inset)

	AS:StripTextures(ConquestFrame)
	AS:SkinFrame(ConquestPointsBar)
	ConquestPointsBar.progress:SetTexture(AS.NormTex)
	AS:StripTextures(ConquestFrame.ShadowOverlay)
	AS:StripTextures(ConquestFrame.RatedBG)
	AS:SkinButton(ConquestFrame.RatedBG)
	ConquestFrame.RatedBG.SelectedTexture:ClearAllPoints()
	ConquestFrame.RatedBG.SelectedTexture:SetAllPoints()
	ConquestFrame.RatedBG.SelectedTexture:SetTexture(0, 1, 0, 0.1)	
	AS:SkinButton(ConquestJoinButton, true)

	-->>>WARGRAMES FRAME
	AS:StripTextures(WarGamesFrame)
	AS:StripTextures(WarGamesFrame.RightInset)
	AS:SkinButton(WarGameStartButton, true)
	AS:SkinScrollBar(WarGamesFrameScrollFrameScrollBar)
	AS:StripTextures(WarGamesFrame.HorizontalBar)

	-->>>ARENATEAMS
	AS:StripTextures(ConquestFrame.Arena2v2)
	AS:SkinButton(ConquestFrame.Arena2v2)
	ConquestFrame.Arena2v2.SelectedTexture:ClearAllPoints()
	ConquestFrame.Arena2v2.SelectedTexture:SetAllPoints()
	ConquestFrame.Arena2v2.SelectedTexture:SetTexture(0, 1, 0, 0.1)
	ConquestFrame.Arena2v2.SelectedTexture:ClearAllPoints()
	ConquestFrame.Arena2v2.SelectedTexture:SetAllPoints()
	ConquestFrame.Arena2v2.SelectedTexture:SetTexture(0, 1, 0, 0.1)	

	AS:StripTextures(ConquestFrame.Arena3v3)
	AS:SkinButton(ConquestFrame.Arena3v3)
	ConquestFrame.Arena3v3.SelectedTexture:ClearAllPoints()
	ConquestFrame.Arena3v3.SelectedTexture:SetAllPoints()
	ConquestFrame.Arena3v3.SelectedTexture:SetTexture(0, 1, 0, 0.1)
	ConquestFrame.Arena3v3.SelectedTexture:ClearAllPoints()
	ConquestFrame.Arena3v3.SelectedTexture:SetAllPoints()
	ConquestFrame.Arena3v3.SelectedTexture:SetTexture(0, 1, 0, 0.1)	

	AS:StripTextures(ConquestFrame.Arena5v5)
	AS:SkinButton(ConquestFrame.Arena5v5)
	ConquestFrame.Arena5v5.SelectedTexture:ClearAllPoints()
	ConquestFrame.Arena5v5.SelectedTexture:SetAllPoints()
	ConquestFrame.Arena5v5.SelectedTexture:SetTexture(0, 1, 0, 0.1)
	ConquestFrame.Arena5v5.SelectedTexture:ClearAllPoints()
	ConquestFrame.Arena5v5.SelectedTexture:SetAllPoints()
	ConquestFrame.Arena5v5.SelectedTexture:SetTexture(0, 1, 0, 0.1)

	AS:SetTemplate(ConquestTooltip)
end

AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')