local AS = unpack(AddOnSkins)

function AS:Blizzard_Trainer(event, addon)
	if addon ~= 'Blizzard_TrainerUI' then return end

	AS:SkinFrame(ClassTrainerFrame, nil, nil, true)
	AS:SkinCloseButton(ClassTrainerFrameCloseButton)

	AS:SkinButton(ClassTrainerTrainButton, true)

	AS:StripTextures(ClassTrainerFrameInset)
	AS:StripTextures(ClassTrainerFrameBottomInset)
	AS:StripTextures(ClassTrainerScrollFrameScrollChild)

	AS:SkinStatusBar(ClassTrainerStatusBar)
	--ClassTrainerStatusBar:SetStatusBarColor(0, 1, 0)
	ClassTrainerStatusBar:ClearAllPoints()
	ClassTrainerStatusBar:SetPoint("TOPLEFT", ClassTrainerFrame, "TOPLEFT", 15, -35)

	AS:SkinDropDownBox(ClassTrainerFrameFilterDropDown, 155)
	ClassTrainerFrameFilterDropDown:ClearAllPoints()
	ClassTrainerFrameFilterDropDown:SetPoint("TOPRIGHT", ClassTrainerFrame, "TOPRIGHT", 0, -32)
	AS:SkinScrollBar(ClassTrainerScrollFrameScrollBar)

	AS:SkinBackdropFrame(ClassTrainerFrameSkillStepButton)
	AS:SkinTexture(ClassTrainerFrameSkillStepButton.icon)
	ClassTrainerFrameSkillStepButtonHighlight:SetTexture('')

	ClassTrainerFrameSkillStepButton.icon.Backdrop = CreateFrame('Frame', nil, ClassTrainerFrameSkillStepButton)
	AS:SetTemplate(ClassTrainerFrameSkillStepButton.icon.Backdrop)
	ClassTrainerFrameSkillStepButton.icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
	ClassTrainerFrameSkillStepButton.icon.Backdrop:SetOutside(ClassTrainerFrameSkillStepButton.icon)

	ClassTrainerFrameSkillStepButton:HookScript('OnEnter', function(self)
		self.Backdrop:SetBackdropBorderColor(1, .82, 0)
	end)
	ClassTrainerFrameSkillStepButton:HookScript('OnLeave', function(self)
		if self.selectedTex:IsShown() then
			self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
		else
			self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	for i = 1, #ClassTrainerFrame.scrollFrame.buttons do
		local Button = _G["ClassTrainerScrollFrameButton"..i]
		AS:StripTextures(Button)
		AS:StyleButton(Button)
		AS:SkinTexture(Button.icon)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetInside(Button, 1, 1)
		Button:SetHighlightTexture('')
		Button:SetPushedTexture('')
		Button:HookScript('OnEnter', function(self)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.selectedTex:IsShown() then
				self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		Button.icon.Backdrop = CreateFrame('Frame', nil, Button)
		AS:SetTemplate(Button.icon.Backdrop)
		Button.icon.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Button.icon.Backdrop:SetOutside(Button.icon)

		Button.selectedTex:SetTexture('')
	end

	hooksecurefunc('ClassTrainerFrame_SetServiceButton', function(skillButton, skillIndex, playerMoney, selected, isTradeSkill)
		local unavailable = false
		local serviceName, serviceSubText, serviceType, texture, reqLevel = GetTrainerServiceInfo(skillIndex)
		if ( not serviceName ) then
			serviceName = UNKNOWN
		end

		local moneyCost, isProfession = GetTrainerServiceCost(skillIndex)

		if ( ClassTrainerFrame.selectedService and selected == skillIndex ) then
			ClassTrainerFrame.showDialog = nil

			if isProfession then
				ClassTrainerFrame.showDialog = true
				local _, prof2 = GetProfessions()
				if prof2 then
					unavailable = true
				end
			end

			skillButton.Backdrop:SetBackdropBorderColor(0, 0.44, .87)
			if ( serviceType == "available" and not unavailable) then
				ClassTrainerTrainButton:Enable()
			else
				ClassTrainerTrainButton:Disable()
			end
		else
			skillButton.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)
end

AS:RegisterSkin("Blizzard_Trainer", AS.Blizzard_Trainer, 'ADDON_LOADED')