local AS = unpack(AddOnSkins)

function AS:Blizzard_TalkingHeadUI(event, addon)
	if addon ~= "Blizzard_TalkingHeadUI" then return end

	AS:StripTextures(TalkingHeadFrame, true)
	AS:StripTextures(TalkingHeadFrame.MainFrame, true)
	AS:StripTextures(TalkingHeadFrame.PortraitFrame, true)

	TalkingHeadFrame.MainFrame.Model.ModelShadow = TalkingHeadFrame.MainFrame.Model:CreateTexture(nil, "OVERLAY", nil, 2)
	TalkingHeadFrame.MainFrame.Model.ModelShadow:SetAtlas("Artifacts-BG-Shadow")
	AS:SetOutside(TalkingHeadFrame.MainFrame.Model.ModelShadow)
	TalkingHeadFrame.MainFrame.Model.PortraitBg:Hide()

	AS:SkinCloseButton(TalkingHeadFrame.MainFrame.CloseButton)

	AS:SkinBackdropFrame(TalkingHeadFrame.BackgroundFrame, nil, nil, true)
	AS:SetInside(TalkingHeadFrame.BackgroundFrame.Backdrop, TalkingHeadFrame.BackgroundFrame, 8, 8)
	AS:CreateShadow(TalkingHeadFrame.BackgroundFrame.Backdrop)

	TalkingHeadFrame.NameFrame.Name:SetTextColor(1, 0.82, 0.02)
	TalkingHeadFrame.NameFrame.Name.SetTextColor = function() end
	TalkingHeadFrame.NameFrame.Name:SetShadowColor(0.0, 0.0, 0.0, 1.0)
	TalkingHeadFrame.NameFrame.Name:SetShadowOffset(2, -2)

	TalkingHeadFrame.TextFrame.Text:SetTextColor(1, 1, 1)
	TalkingHeadFrame.TextFrame.Text.SetTextColor = function() end
	TalkingHeadFrame.TextFrame.Text:SetShadowColor(0.0, 0.0, 0.0, 1.0)
	TalkingHeadFrame.TextFrame.Text:SetShadowOffset(2, -2)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_TalkingHeadUI", AS.Blizzard_TalkingHeadUI, 'ADDON_LOADED')
