local AS = unpack(AddOnSkins)

function AS:Blizzard_Channels(event, addon)
	if addon ~= 'Blizzard_Channels' then return end

	AS:SkinBackdropFrame(ChannelFrame)
	ChannelFrame.Backdrop:SetPoint('TOPLEFT', -1, -1)
	ChannelFrame.Backdrop:SetPoint('BOTTOMRIGHT', -1, 2)

	AS:SkinBackdropFrame(CreateChannelPopup)

	AS:SkinCloseButton(ChannelFrame.CloseButton)
	AS:SkinButton(ChannelFrame.NewButton)
	AS:SkinButton(ChannelFrame.SettingsButton)

	ChannelFrame.ChannelRoster.ScrollFrame.scrollBar.ScrollDownButton = ChannelFrame.ChannelRoster.ScrollFrame.scrollDown
	ChannelFrame.ChannelRoster.ScrollFrame.scrollBar.ScrollUpButton = ChannelFrame.ChannelRoster.ScrollFrame.scrollUp

	AS:SkinScrollBar(ChannelFrame.ChannelRoster.ScrollFrame.scrollBar)
	ChannelFrame.ChannelRoster.ScrollFrame.scrollBar:SetPoint('TOPLEFT', ChannelFrame.ChannelRoster.ScrollFrame, 'TOPRIGHT', 1, -13)
	ChannelFrame.ChannelRoster.ScrollFrame.scrollBar:SetPoint('BOTTOMLEFT', ChannelFrame.ChannelRoster.ScrollFrame, 'BOTTOMRIGHT', 1, 13)

	AS:SkinBackdropFrame(ChannelFrame.ChannelRoster.ScrollFrame)
	ChannelFrame.ChannelRoster.ScrollFrame:SetPoint('TOPLEFT', 3, 1)
	ChannelFrame.ChannelRoster.ScrollFrame:SetPoint('BOTTOMRIGHT', -3, 5)

	AS:SkinScrollBar(ChannelFrame.ChannelList.ScrollBar)
	ChannelFrame.ChannelList.ScrollBar:SetPoint('BOTTOMLEFT', ChannelFrame.ChannelList, 'BOTTOMRIGHT', 0, 15)

	AS:SkinBackdropFrame(ChannelFrame.ChannelList)

	ChannelFrame.ChannelList.Backdrop:SetPoint('TOPLEFT', -3, 4)
	ChannelFrame.ChannelList.Backdrop:SetPoint('BOTTOMRIGHT', 0, -1)
	ChannelFrame.ChannelList:SetPoint('TOPLEFT', ChannelFrame, 'TOPLEFT', 4, -66)
	ChannelFrame.ChannelList:SetPoint('BOTTOMLEFT', ChannelFrame, 'BOTTOMLEFT', 4, 33)

	AS:SkinCloseButton(CreateChannelPopup.CloseButton)
	AS:SkinButton(CreateChannelPopup.OKButton)
	AS:SkinButton(CreateChannelPopup.CancelButton)

	AS:SkinEditBox(CreateChannelPopup.Name)
	AS:SkinEditBox(CreateChannelPopup.Password)

	AS:SkinBackdropFrame(VoiceChatPromptActivateChannel)
	AS:SkinButton(VoiceChatPromptActivateChannel.AcceptButton)
	AS:SkinCloseButton(VoiceChatPromptActivateChannel.CloseButton)

	-- Hide the Channel Header Textures
	hooksecurefunc(ChannelButtonHeaderMixin, "Update", function(self)
		AS:SkinButton(self)
		self.NormalTexture:SetTexture("")
		self.HighlightTexture:SetTexture("")
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_Channels", AS.Blizzard_Channels, 'ADDON_LOADED')