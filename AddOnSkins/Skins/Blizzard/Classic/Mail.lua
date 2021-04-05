if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Mail()
	AS:SkinFrame(MailFrame, nil, nil, true)
	AS:CreateShadow(MailFrame)

	AS:SkinCloseButton(MailFrame.CloseButton)

	AS:StripTextures(InboxFrame)

	for Attachment, Num in pairs({ ["SendMailAttachment"] = 16, ["OpenMailAttachmentButton"] = 16, ['MailItem'] = 7 }) do
		for i = 1, Num do
			local Frame = _G[Attachment..i]
			AS:SkinFrame(Frame)

			if Frame.Button then
				AS:SkinFrame(Frame.Button)
				AS:StyleButton(Frame.Button)
				AS:SkinTexture(Frame.Button.Icon)
				AS:SetInside(Frame.Button.Icon)
				Frame.Button.IconBorder:SetAlpha(0)
			else
				Frame.IconBorder:SetAlpha(0)
				if Frame.icon then
					AS:SkinTexture(Frame.icon)
					AS:SetInside(Frame.icon)
				end
			end

			hooksecurefunc((Frame.Button and Frame.Button.IconBorder or Frame.IconBorder), 'SetVertexColor', function(self, r, g, b) (Frame.Button or Frame):SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc((Frame.Button and Frame.Button.IconBorder or Frame.IconBorder), 'Hide', function(self) (Frame.Button or Frame):SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:SkinArrowButton(InboxPrevPageButton)
	AS:SkinArrowButton(InboxNextPageButton)

	AS:SkinTab(MailFrameTab1)
	AS:SkinTab(MailFrameTab2)

	AS:StripTextures(SendMailFrame)
	AS:SkinFrame(SendMailScrollFrame, nil, nil, true)
	AS:SkinScrollBar(SendMailScrollFrame.ScrollBar)

	AS:SkinEditBox(SendMailNameEditBox, nil, 20)
	AS:SkinEditBox(SendMailSubjectEditBox)
	SendMailSubjectEditBox:SetPoint("TOPLEFT", SendMailNameEditBox, "BOTTOMLEFT", 0, -8)
	SendMailCostMoneyFrame:SetPoint("TOPRIGHT", -60, -34)
	AS:SkinEditBox(SendMailMoneyGold)
	AS:SkinEditBox(SendMailMoneySilver)
	AS:SkinEditBox(SendMailMoneyCopper)
	AS:StripTextures(SendMailMoneyBg)
	AS:StripTextures(SendMailMoneyInset)

	AS:SkinButton(SendMailMailButton)
	AS:SkinButton(SendMailCancelButton)

	AS:SkinFrame(OpenMailFrame, nil, nil, true)

	AS:SkinCloseButton(OpenMailFrameCloseButton)
	AS:SkinButton(OpenMailReportSpamButton)
	AS:SkinButton(OpenMailReplyButton)
	AS:SkinButton(OpenMailDeleteButton)
	AS:SkinButton(OpenMailCancelButton)
	AS:SkinButton(OpenAllMail)

	AS:SkinFrame(OpenMailScrollFrame, nil, nil, true)
	AS:SkinScrollBar(OpenMailScrollFrame.ScrollBar)

	SendMailBodyEditBox:SetTextColor(1, 1, 1)
	OpenMailBodyText:SetTextColor(1, 1, 1)
	InvoiceTextFontNormal:SetTextColor(1, 1, 1)

	AS:SkinButton(OpenMailLetterButton)
	AS:SkinTexture(OpenMailLetterButton.icon)
	AS:SetInside(OpenMailLetterButton.icon)

	AS:SkinButton(OpenMailMoneyButton)
	AS:SkinTexture(OpenMailMoneyButton.icon)
	AS:SetInside(OpenMailMoneyButton.icon)

	OpenMailReplyButton:SetPoint("RIGHT", OpenMailDeleteButton, "LEFT", -2, 0)
	OpenMailDeleteButton:SetPoint("RIGHT", OpenMailCancelButton, "LEFT", -2, 0)
	SendMailMailButton:SetPoint("RIGHT", SendMailCancelButton, "LEFT", -2, 0)

	AS:SkinRadioButton(SendMailSendMoneyButton)
	AS:SkinRadioButton(SendMailCODButton)

	hooksecurefunc("SendMailFrame_Update", function()
		for i = 1, ATTACHMENTS_MAX_SEND do
			local Texture = _G["SendMailAttachment"..i]:GetNormalTexture()
			if Texture then
				AS:SkinTexture(Texture)
				AS:SetInside(Texture)
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_Mail', AS.Blizzard_Mail)
