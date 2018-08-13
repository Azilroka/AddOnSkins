local AS = unpack(AddOnSkins)

function AS:Blizzard_TalkingHeadUI(event, addon)
	if addon ~= "Blizzard_TalkingHeadUI" then return end

	AS:StripTextures(TalkingHeadFrame, true)
	AS:StripTextures(TalkingHeadFrame.MainFrame, true)
	AS:StripTextures(TalkingHeadFrame.PortraitFrame, true)

	TalkingHeadFrame.MainFrame.Model.ModelShadow = TalkingHeadFrame.MainFrame.Model:CreateTexture(nil, "OVERLAY", nil, 2)
	TalkingHeadFrame.MainFrame.Model.ModelShadow:SetAtlas("Artifacts-BG-Shadow")
	TalkingHeadFrame.MainFrame.Model.ModelShadow:SetPoint('TOPLEFT')
	TalkingHeadFrame.MainFrame.Model.ModelShadow:SetPoint('BOTTOMRIGHT', 0, -2)
	TalkingHeadFrame.MainFrame.Model.PortraitBg:Hide()

	AS:SkinCloseButton(TalkingHeadFrame.MainFrame.CloseButton)

	AS:SkinBackdropFrame(TalkingHeadFrame.BackgroundFrame, 'Transparent', nil, true)
	TalkingHeadFrame.BackgroundFrame.Backdrop:SetPoint('TOPLEFT', TalkingHeadFrame.BackgroundFrame, 'TOPLEFT', 8, -8)
	TalkingHeadFrame.BackgroundFrame.Backdrop:SetPoint('BOTTOMRIGHT', TalkingHeadFrame.BackgroundFrame, 'BOTTOMRIGHT', -8, 8)
end

AS:RegisterSkin("Blizzard_TalkingHeadUI", AS.Blizzard_TalkingHeadUI, 'ADDON_LOADED')