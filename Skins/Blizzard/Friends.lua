local AS = unpack(AddOnSkins)

function AS:Blizzard_Friends()
	AS:SkinFrame(FriendsFrame)
	FriendsFrameIcon:SetTexture('')
	hooksecurefunc(FriendsFrameIcon, 'SetTexture', function(self, texture)
		if texture ~= '' then
			self:SetTexture('')
		end
	end)
	AS:SkinBackdropFrame(FriendsFrameFriendsScrollFrame)
	FriendsFrameFriendsScrollFrame.Backdrop:SetPoint('TOPLEFT', -4, 3)
	FriendsFrameFriendsScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, -3)
	AS:SkinScrollBar(FriendsFrameFriendsScrollFrameScrollBar)
	AS:StripTextures(FriendsFrameInset)
	AS:SkinFrame(FriendsTooltip, nil, true)
	AS:SkinCloseButton(FriendsFrameCloseButton)
	AS:SkinDropDownBox(FriendsFrameStatusDropDown, 70)
	AS:SkinButton(FriendsFrameMutePlayerButton)
	FriendsFrameMutePlayerButton:SetWidth(107)
	AS:SkinBackdropFrame(FriendsFrameBattlenetFrame)
	FriendsFrameBattlenetFrame.Backdrop:SetPoint('TOPLEFT', -1, -3)
	FriendsFrameBattlenetFrame.Backdrop:SetPoint('BOTTOMRIGHT', -3, 5)
	FriendsFrameBattlenetFrame.Backdrop:SetBackdropColor(24/255, 40/255, 55/255)
	FriendsFrameBattlenetFrame.BroadcastButton:SetSize(17, 17)
	FriendsFrameBattlenetFrame.BroadcastButton:SetPoint("LEFT", FriendsFrameBattlenetFrame, "RIGHT", 2, 1)
	AS:SkinBackdropFrame(FriendsFrameBattlenetFrame.BroadcastButton, nil, true)
	AS:StripTextures(FriendsFrameBattlenetFrame.BroadcastButton)
	FriendsFrameBattlenetFrame.BroadcastButton:SetNormalTexture([[Interface\FriendsFrame\BroadcastIcon]])
	FriendsFrameBattlenetFrame.BroadcastButton.SetNormalTexture = AS.Noop
	FriendsFrameBattlenetFrame.BroadcastButton:SetPushedTexture([[Interface\FriendsFrame\BroadcastIcon]])
	FriendsFrameBattlenetFrame.BroadcastButton.SetPushedTexture = AS.Noop
	AS:SkinFrame(FriendsFrameBattlenetFrame.BroadcastFrame)
	AS:SkinFrame(FriendsFrameBattlenetFrame.BroadcastFrame.ScrollFrame)
	AS:SkinButton(FriendsFrameBattlenetFrame.BroadcastFrame.ScrollFrame.CancelButton)
	AS:SkinButton(FriendsFrameBattlenetFrame.BroadcastFrame.ScrollFrame.UpdateButton)
	AS:SkinButton(FriendsFrameAddFriendButton)
	AS:SkinButton(FriendsFrameSendMessageButton)
	AS:SkinButton(FriendsFrameIgnorePlayerButton)
	AS:SkinButton(FriendsFrameUnsquelchButton)

	AS:StripTextures(IgnoreListFrame)
	AS:SkinScrollBar(FriendsFrameIgnoreScrollFrameScrollBar)
	FriendsFrameIgnoreScrollFrame:SetHeight(294)
	FriendsFrameIgnoreScrollFrameScrollBar:SetPoint("TOPLEFT", FriendsFrameIgnoreScrollFrame, "TOPRIGHT", 42, -10)

	-- AS:StripTextures(PendingListFrame)
	-- AS:SkinButton(FriendsFramePendingButton1AcceptButton)
	-- AS:SkinButton(FriendsFramePendingButton1DeclineButton)
	-- AS:SkinButton(FriendsFramePendingButton2AcceptButton)
	-- AS:SkinButton(FriendsFramePendingButton2DeclineButton)
	-- AS:SkinButton(FriendsFramePendingButton3AcceptButton)
	-- AS:SkinButton(FriendsFramePendingButton3DeclineButton)
	-- AS:SkinButton(FriendsFramePendingButton4AcceptButton)
	-- AS:SkinButton(FriendsFramePendingButton4DeclineButton)

	AS:SkinFrame(FriendsFriendsFrame, nil, nil, true)
	AS:SkinFrame(FriendsFriendsList)
	AS:SkinDropDownBox(FriendsFriendsFrameDropDown, 150)
	AS:SkinScrollBar(FriendsFriendsScrollFrameScrollBar)
	AS:SkinButton(FriendsFriendsSendRequestButton)
	AS:SkinButton(FriendsFriendsCloseButton)

	AS:SkinButton(FriendsTabHeaderRecruitAFriendButton)
	AS:StyleButton(FriendsTabHeaderRecruitAFriendButton)
	FriendsTabHeaderRecruitAFriendButtonIcon:SetDrawLayer("OVERLAY")
	AS:SkinTexture(FriendsTabHeaderRecruitAFriendButtonIcon)
	FriendsTabHeaderRecruitAFriendButtonIcon:SetInside()
	
	AS:SkinFrame(RecruitAFriendFrame)
	AS:SkinEditBox(RecruitAFriendNameEditBox)
	AS:SkinButton(RecruitAFriendFrameSendButton)
	AS:SkinCloseButton(RecruitAFriendFrameCloseButton)
	AS:SkinFrame(RecruitAFriendNoteFrame)
	AS:SkinScrollBar(RecruitAFriendNoteFrameScrollFrameScrollBar)
	AS:StripTextures(RecruitAFriendFrame.CharacterInfo)

	AS:SkinFrame(AddFriendFrame)
	AS:SkinEditBox(AddFriendNameEditBox)
	AddFriendNameEditBox.Backdrop:SetOutside(AddFriendNameEditBox, 1, 1)
	AS:SkinButton(AddFriendEntryFrameAcceptButton)
	AS:SkinButton(AddFriendEntryFrameCancelButton)
	AS:SkinButton(AddFriendInfoFrameContinueButton)

	for i = 1, 4 do
		AS:StripTextures(_G["WhoFrameColumnHeader"..i])
	end

	AS:StripTextures(WhoFrameListInset)
	AS:StripTextures(WhoFrameEditBoxInset)
	AS:SkinScrollBar(WhoListScrollFrameScrollBar)
	AS:SkinButton(WhoFrameWhoButton)
	AS:SkinButton(WhoFrameAddFriendButton)
	AS:SkinButton(WhoFrameGroupInviteButton)

	AS:StripTextures(ChannelListScrollFrame)
	AS:StripTextures(ChannelRoster)
	AS:StripTextures(ChannelFrameLeftInset)
	AS:StripTextures(ChannelFrameRightInset)
	AS:StripTextures(ChannelFrameDaughterFrame)
	AS:SkinButton(ChannelFrameNewButton)
	AS:SkinButton(ChannelFrameDaughterFrameOkayButton)
	AS:SkinButton(ChannelFrameDaughterFrameCancelButton)

	WhoFrameWhoButton:SetPoint("RIGHT", WhoFrameAddFriendButton, "LEFT", -6, 0)
	WhoFrameAddFriendButton:SetPoint("RIGHT", WhoFrameGroupInviteButton, "LEFT", -6, 0)
	WhoFrameWhoButton:SetSize(WhoFrameWhoButton:GetWidth() - 4, WhoFrameWhoButton:GetHeight())
	WhoFrameAddFriendButton:SetSize(WhoFrameAddFriendButton:GetWidth() - 4, WhoFrameAddFriendButton:GetHeight())
	WhoFrameGroupInviteButton:SetSize(WhoFrameGroupInviteButton:GetWidth() - 4, WhoFrameGroupInviteButton:GetHeight())
	AS:SkinEditBox(WhoFrameEditBox, 321, 17)
	WhoFrameEditBox:SetPoint("BOTTOM", 1, 30)
	AS:StripTextures(WhoListScrollFrame, true)

	AS:StripTextures(ChannelRosterScrollFrame, true)
	AS:SkinScrollBar(ChannelRosterScrollFrameScrollBar)
	AS:SkinFrame(ChannelFrameDaughterFrame)
	AS:SkinEditBox(ChannelFrameDaughterFrameChannelName)
	AS:SkinEditBox(ChannelFrameDaughterFrameChannelPassword)			
	
	AS:SkinCloseButton(ChannelFrameDaughterFrameDetailCloseButton)
	AS:SkinDropDownBox(WhoFrameDropDown, 150)

	for i = 1, 4 do
		AS:SkinTab(_G["FriendsFrameTab"..i])
	end

	for i = 1, 3 do
		local Tab = _G["FriendsTabHeaderTab"..i]
		AS:SkinTab(Tab)
		Tab.Backdrop:SetPoint("TOPLEFT", 3, -8)
		Tab.Backdrop:SetPoint("BOTTOMRIGHT", -6, 0)
	end

	hooksecurefunc("ChannelList_Update", function()
		for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
			local button = _G["ChannelButton"..i]
			if button then
				AS:StripTextures(button)
				button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
				
				_G["ChannelButton"..i.."Text"]:SetFont(AS.Font, 12)
			end
		end
	end)

	AS:StripTextures(QuickJoinScrollFrame)
	AS:SkinScrollBar(QuickJoinScrollFrameScrollBar)
	AS:SkinButton(QuickJoinFrame.JoinQueueButton, true)
end

AS:RegisterSkin('Blizzard_Friends', AS.Blizzard_Friends)