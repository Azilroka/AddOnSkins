if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Friends()
	AS:SkinFrame(FriendsFrame)
	FriendsFrameIcon:SetPoint('TOPLEFT', FriendsFrame, 'TOPLEFT', 0, 0)
	FriendsFrameIcon:SetTexture([[Interface\AddOns\AddOnSkins\Media\Icons\Bnet]])
	hooksecurefunc(FriendsFrameIcon, 'SetTexture', function(self, texture)
		if texture ~= [[Interface\AddOns\AddOnSkins\Media\Icons\Bnet]] then
			self:SetTexture([[Interface\AddOns\AddOnSkins\Media\Icons\Bnet]])
		end
	end)
	FriendsListFrame:HookScript("OnShow", function() FriendsFrameIcon:SetAlpha(1) end)
	FriendsListFrame:HookScript("OnHide", function() FriendsFrameIcon:SetAlpha(0) end)
	FriendsFrame:HookScript("OnUpdate", function(self, elapsed)
		AnimateTexCoords(FriendsFrameIcon, 512, 256, 64, 64, 25, elapsed, 0.01)
	end)

	AS:SkinButton(_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton, true)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton:SetScript('OnMouseUp', nil)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton:SetScript('OnMouseDown', nil)
	AS:SkinArrowButton(_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.RightArrow)
	AS:SkinArrowButton(_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.DownArrow)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.RightArrow:SetPoint("LEFT", 11, 0)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.DownArrow:SetPoint("TOPLEFT", 8, -10)
	hooksecurefunc(_G.FriendsFrameFriendsScrollFrame.invitePool, "Acquire", function()
		for object in pairs(_G.FriendsFrameFriendsScrollFrame.invitePool.activeObjects) do
			AS:SkinButton(object.AcceptButton)
			AS:SkinButton(object.DeclineButton)
		end
	end)

	AS:SkinCloseButton(FriendsFrame.CloseButton)
	AS:SkinTooltip(FriendsTooltip)

	AS:SkinBackdropFrame(FriendsFrameFriendsScrollFrame)
	FriendsFrameFriendsScrollFrame.Backdrop:SetPoint('TOPLEFT', -4, 1)
	FriendsFrameFriendsScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, -3)

	AS:SkinScrollBar(FriendsFrameFriendsScrollFrameScrollBar)
	AS:SkinDropDownBox(FriendsFrameStatusDropDown, 70)
	FriendsFrameStatusDropDown:SetPoint('TOPLEFT', 43, -24)
	FriendsFrameStatusDropDownStatus:SetPoint('LEFT', '$parent', 'LEFT', 23, 0)

	AS:SkinBackdropFrame(FriendsFrameBattlenetFrame)
	FriendsFrameBattlenetFrame.Backdrop:SetPoint('TOPLEFT', -1, -4)
	FriendsFrameBattlenetFrame.Backdrop:SetPoint('BOTTOMRIGHT', -3, 5)
	FriendsFrameBattlenetFrame.Backdrop:SetBackdropColor(24/255, 40/255, 55/255)

	AS:SkinButton(FriendsFrameBattlenetFrame.BroadcastButton)
	FriendsFrameBattlenetFrame.BroadcastButton:SetPoint("LEFT", FriendsFrameBattlenetFrame, "RIGHT", 2, 0)
	FriendsFrameBattlenetFrame.BroadcastButton:SetSize(20, 20)
	FriendsFrameBattlenetFrame.BroadcastButton:SetNormalTexture([[Interface\FriendsFrame\BroadcastIcon]])
	AS:SetInside(FriendsFrameBattlenetFrame.BroadcastButton:GetNormalTexture())
	FriendsFrameBattlenetFrame.BroadcastButton:SetPushedTexture([[Interface\FriendsFrame\BroadcastIcon]])
	FriendsFrameBattlenetFrame.BroadcastButton.SetNormalTexture = AS.Noop
	FriendsFrameBattlenetFrame.BroadcastButton.SetPushedTexture = AS.Noop

	AS:SkinFrame(FriendsFrameBattlenetFrame.BroadcastFrame)
	AS:SkinBackdropFrame(FriendsFrameBattlenetFrame.BroadcastFrame.ScrollFrame)
	AS:SetOutside(FriendsFrameBattlenetFrame.BroadcastFrame.ScrollFrame.Backdrop, FriendsFrameBattlenetFrame.BroadcastFrame.ScrollFrame, 3, 3)
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

	AS:SkinFrame(FriendsFriendsFrame)
	AS:SkinFrame(FriendsFriendsScrollFrame)
	AS:StripTextures(FriendsFriendsList)
	AS:SkinDropDownBox(FriendsFriendsFrameDropDown)
	AS:SkinScrollBar(FriendsFriendsScrollFrameScrollBar)
	AS:SkinButton(FriendsFriendsSendRequestButton)
	AS:SkinButton(FriendsFriendsCloseButton)

	AS:SkinButton(FriendsTabHeader.RaFButton)
	AS:StyleButton(FriendsTabHeader.RaFButton)
	AS:SkinTexture(FriendsTabHeader.RaFButton.Icon)
	AS:SetInside(FriendsTabHeader.RaFButton.Icon)

	AS:SkinFrame(RecruitAFriendFrame)
	AS:SkinEditBox(RecruitAFriendNameEditBox)
	AS:SkinButton(RecruitAFriendFrameSendButton)
	AS:SkinCloseButton(RecruitAFriendFrameCloseButton)
	AS:SkinFrame(RecruitAFriendNoteFrame)
	AS:SkinScrollBar(RecruitAFriendNoteFrameScrollFrameScrollBar)
	AS:StripTextures(RecruitAFriendFrame.CharacterInfo)

	AS:SkinFrame(AddFriendFrame)
	AS:SkinEditBox(AddFriendNameEditBox)
	AS:SetOutside(AddFriendNameEditBox.Backdrop, AddFriendNameEditBox, 1, 1)
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

	WhoFrameWhoButton:SetPoint("RIGHT", WhoFrameAddFriendButton, "LEFT", -6, 0)
	WhoFrameAddFriendButton:SetPoint("RIGHT", WhoFrameGroupInviteButton, "LEFT", -6, 0)
	WhoFrameWhoButton:SetSize(WhoFrameWhoButton:GetWidth() - 4, WhoFrameWhoButton:GetHeight())
	WhoFrameAddFriendButton:SetSize(WhoFrameAddFriendButton:GetWidth() - 4, WhoFrameAddFriendButton:GetHeight())
	WhoFrameGroupInviteButton:SetSize(WhoFrameGroupInviteButton:GetWidth() - 4, WhoFrameGroupInviteButton:GetHeight())
	AS:SkinEditBox(WhoFrameEditBox, 321, 17)
	WhoFrameEditBox:SetPoint("BOTTOM", 1, 30)
	AS:StripTextures(WhoListScrollFrame, true)

	AS:SkinDropDownBox(WhoFrameDropDown)

	for i = 1, 5 do
		AS:SkinTab(_G["FriendsFrameTab"..i])
	end

	for i = 1, 2 do
		local Tab = _G["FriendsTabHeaderTab"..i]
		AS:SkinTab(Tab)
		Tab.Backdrop:SetPoint("TOPLEFT", 3, -8)
		Tab.Backdrop:SetPoint("BOTTOMRIGHT", -6, 0)
	end
end

AS:RegisterSkin('Blizzard_Friends', AS.Blizzard_Friends)
