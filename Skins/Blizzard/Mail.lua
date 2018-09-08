local AS = unpack(AddOnSkins)

function AS:Blizzard_Mail(event, addon)
	AS:SkinFrame(MailFrame, nil, nil, true)
	AS:CreateShadow(MailFrame)
	AS:SkinCloseButton(MailFrameCloseButton)
	AS:StripTextures(MailFrameInset)
	AS:StripTextures(InboxFrame)

	for i = 1, 7 do
		AS:SkinFrame(_G["MailItem"..i])
		AS:SkinFrame(_G["MailItem"..i.."Button"])
		AS:StyleButton(_G["MailItem"..i.."Button"])
		AS:SkinTexture(_G["MailItem"..i.."ButtonIcon"])
		_G["MailItem"..i.."ButtonIcon"]:SetInside()
	end

	AS:SkinNextPrevButton(InboxPrevPageButton)
	AS:SkinNextPrevButton(InboxNextPageButton)

	AS:StripTextures(MailFrameTab1)
	AS:StripTextures(MailFrameTab2)
	AS:SkinTab(MailFrameTab1)
	AS:SkinTab(MailFrameTab2)

	AS:SkinFrame(SendMailScrollFrame, nil, nil, true)
	AS:SkinScrollBar(SendMailScrollFrameScrollBar)

	AS:SkinEditBox(SendMailNameEditBox, nil, 20)
	AS:SkinEditBox(SendMailSubjectEditBox)
	SendMailSubjectEditBox:SetPoint("TOPLEFT", SendMailNameEditBox, "BOTTOMLEFT", 0, -8)
	SendMailCostMoneyFrame:SetPoint("TOPRIGHT", -60, -34)
	AS:SkinEditBox(SendMailMoneyGold)
	AS:SkinEditBox(SendMailMoneySilver)
	AS:SkinEditBox(SendMailMoneyCopper)
	AS:StripTextures(SendMailMoneyBg)
	AS:StripTextures(SendMailMoneyInset)
	AS:StripTextures(SendMailFrame)

	AS:SkinButton(SendMailMailButton)
	AS:SkinButton(SendMailCancelButton)

	AS:SkinFrame(OpenMailFrame, nil, nil, true)
	AS:StripTextures(OpenMailFrameInset)

	AS:SkinCloseButton(OpenMailFrameCloseButton)
	AS:SkinButton(OpenMailReportSpamButton)
	AS:SkinButton(OpenMailReplyButton)
	AS:SkinButton(OpenMailDeleteButton)
	AS:SkinButton(OpenMailCancelButton)
	AS:SkinButton(OpenAllMail)

	AS:StripTextures(OpenMailScrollFrame, true)
	AS:SetTemplate(OpenMailScrollFrame, 'Default')

	AS:SkinScrollBar(OpenMailScrollFrameScrollBar)

	SendMailBodyEditBox:SetTextColor(1, 1, 1)
	OpenMailBodyText:SetTextColor(1, 1, 1)
	InvoiceTextFontNormal:SetTextColor(1, 1, 1)
	OpenMailArithmeticLine:Kill()

	AS:StripTextures(OpenMailLetterButton)
	AS:SetTemplate(OpenMailLetterButton, 'Default', true)
	AS:StyleButton(OpenMailLetterButton)
	AS:SkinTexture(OpenMailLetterButtonIconTexture)
	OpenMailLetterButtonIconTexture:ClearAllPoints()
	OpenMailLetterButtonIconTexture:SetPoint("TOPLEFT", 2, -2)
	OpenMailLetterButtonIconTexture:SetPoint("BOTTOMRIGHT", -2, 2)

	AS:StripTextures(OpenMailMoneyButton)
	AS:SetTemplate(OpenMailMoneyButton, 'Default', true)
	AS:StyleButton(OpenMailMoneyButton)
	AS:SkinTexture(OpenMailMoneyButtonIconTexture)
	OpenMailMoneyButtonIconTexture:ClearAllPoints()
	OpenMailMoneyButtonIconTexture:SetPoint("TOPLEFT", 2, -2)
	OpenMailMoneyButtonIconTexture:SetPoint("BOTTOMRIGHT", -2, 2)

	OpenMailReplyButton:SetPoint("RIGHT", OpenMailDeleteButton, "LEFT", -2, 0)
	OpenMailDeleteButton:SetPoint("RIGHT", OpenMailCancelButton, "LEFT", -2, 0)
	SendMailMailButton:SetPoint("RIGHT", SendMailCancelButton, "LEFT", -2, 0)

	AS:SkinRadioButton(SendMailSendMoneyButton)
	AS:SkinRadioButton(SendMailCODButton)

	for _, Attachment in pairs({"SendMailAttachment", "OpenMailAttachmentButton"}) do
		for i = 1, ATTACHMENTS_MAX_SEND do
			local Button = _G[Attachment..i]
			AS:SkinFrame(Button)
			AS:StyleButton(Button)
			if _G[Attachment..i.."IconTexture"] then
				AS:SkinTexture(_G[Attachment..i.."IconTexture"])
				_G[Attachment..i.."IconTexture"]:SetInside()
			end
		end
	end

	hooksecurefunc("InboxFrame_Update", function()
		local numItems, totalItems = GetInboxNumItems()
		local index = ((InboxFrame.pageNum - 1) * INBOXITEMS_TO_DISPLAY) + 1

		for i = 1, INBOXITEMS_TO_DISPLAY do
			if ( index <= numItems ) then
				local packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, itemCount, wasRead, x, y, z, isGM, firstItemQuantity = GetInboxHeaderInfo(index)
				_G["MailItem"..i.."Button"]:SetBackdropBorderColor(unpack(AS.BorderColor))
				if ( packageIcon ) and ( not isGM ) then
					local ItemLink = GetInboxItemLink(index, 1)
					if ItemLink then
						local Quality = select(3, GetItemInfo(ItemLink))
						if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
							_G["MailItem"..i.."Button"]:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
						end
					end
				elseif isGM then
					_G["MailItem"..i.."Button"]:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[3].r, BAG_ITEM_QUALITY_COLORS[3].g, BAG_ITEM_QUALITY_COLORS[3].b)
				end
			end
		end
	end)

	hooksecurefunc('OpenMailFrame_UpdateButtonPositions', function(letterIsTakeable, textCreated, stationeryIcon, money)
		for i = 1, ATTACHMENTS_MAX_RECEIVE do
			local ItemLink = GetInboxItemLink(InboxFrame.openMailID, i)
			local AttachmentButton = _G["OpenMailAttachmentButton"..i]
			AttachmentButton:SetBackdropBorderColor(unpack(AS.BorderColor))
			if ItemLink then
				local Quality = select(3, GetItemInfo(ItemLink))
				if Quality and Quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[Quality] then
					AttachmentButton:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
				end
			end
		end
	end)

	hooksecurefunc("SendMailFrame_Update", function()
		for i = 1, ATTACHMENTS_MAX_SEND do
			local ItemLink = GetSendMailItemLink(i)
			local AttachmentButton = _G["SendMailAttachment"..i]
			AttachmentButton:SetBackdropBorderColor(unpack(AS.BorderColor))
			if ItemLink then
				local Quality = select(3, GetItemInfo(ItemLink))
				if Quality and Quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[Quality] then
					AttachmentButton:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
				end
			end
			local Texture = _G["SendMailAttachment"..i]:GetNormalTexture()
			if Texture then
				AS:SkinTexture(Texture)
				Texture:SetInside()
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_Mail', AS.Blizzard_Mail)
