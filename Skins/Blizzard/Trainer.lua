local AS = unpack(AddOnSkins)

function AS:Blizzard_TrainerUI(event, addon)
	if addon ~= 'Blizzard_TrainerUI' then return end

	AS:SkinFrame(ClassTrainerFrame, nil, nil, true)
	AS:SkinCloseButton(ClassTrainerFrame.CloseButton)
	AS:StripTextures(ClassTrainerFrame.Inset)

	AS:SkinStatusBar(ClassTrainerStatusBar)
	ClassTrainerStatusBar:SetPoint("TOPLEFT", ClassTrainerFrame, "TOPLEFT", 15, -35)

	AS:SkinButton(ClassTrainerTrainButton, true)
	AS:StripTextures(ClassTrainerFrame.bottomInset)

	AS:SkinDropDownBox(ClassTrainerFrameFilterDropDown, 155)
	ClassTrainerFrameFilterDropDown:SetPoint("TOPRIGHT", ClassTrainerFrame, "TOPRIGHT", -6, -32)

	AS:SkinScrollBar(ClassTrainerScrollFrameScrollBar)
	AS:StripTextures(ClassTrainerFrame.scrollFrame.ScrollChild)

	AS:SkinFrame(ClassTrainerFrame.skillStepButton)
	AS:SkinTexture(ClassTrainerFrame.skillStepButton.icon)
	ClassTrainerFrame.skillStepButton:SetHighlightTexture('')

	ClassTrainerFrame.skillStepButton:HookScript('OnEnter', function(self)
		self:SetBackdropBorderColor(1, .82, 0)
	end)
	ClassTrainerFrame.skillStepButton:HookScript('OnLeave', function(self)
		if self.selectedTex:IsShown() then
			self:SetBackdropBorderColor(unpack(AS.Color))
		else
			self:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	for _, Button in pairs(ClassTrainerFrame.scrollFrame.buttons) do
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.icon)

		Button:SetHighlightTexture('')
		Button:SetPushedTexture('')
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.selectedTex:IsShown() then
				self:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)

		Button.selectedTex:SetTexture('')
	end

	hooksecurefunc('ClassTrainerFrame_SetServiceButton', function(skillButton, skillIndex, playerMoney, selected, isTradeSkill)
		if ( ClassTrainerFrame.selectedService and selected == skillIndex ) then
			skillButton:SetBackdropBorderColor(unpack(AS.Color))
		else
			skillButton:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_TrainerUI", AS.Blizzard_TrainerUI, 'ADDON_LOADED')
