local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MailCommander') then return end

function AS:MailCommander()
	AS:SkinFrame(MailCommanderFrame)
	AS:SkinCloseButton(MailCommanderFrame.CloseButton)
	AS:SkinArrowButton(MailCommanderFrame.NextPageButton)
	AS:SkinArrowButton(MailCommanderFrame.PrevPageButton)

	AS:SkinButton(MailCommanderFrame.Send)
	AS:SkinButton(MailCommanderFrame.Delete)

	AS:SkinDropDownBox(MailCommanderFrame.Filter)

	AS:SkinCheckBox(MailCommanderFrame.All)

	AS:SkinTab(MailCommanderFrame.tabNEED)
	AS:SkinTab(MailCommanderFrame.tabSEND)
	AS:SkinTab(MailCommanderFrame.tabFILTER)
	AS:SkinTab(MailCommanderFrame.tabCATEGORIES)

	AS:SkinTooltip(MailCommanderTooltip)
	hooksecurefunc(LibStub('LibInit'):GetAddon('MailCommander'), 'RenderButtonList', function()
		for _, Table in pairs({'Additional', 'Items'}) do
			local Button = MailCommanderFrame[Table]
			for i = 1, #Button do
				if not Button[i].isSkinned then
					Button[i].Bg:SetTexture()
					Button[i].NameFrame:SetTexture()
					Button[i].SlotTexture:SetTexture()
					AS:SkinTexture(Button[i].ItemButton.icon)
					Button[i].ItemButton:SetNormalTexture('')
					Button[i].ItemButton:SetPushedTexture('')
					Button[i].ItemButton:SetHighlightTexture('')
					AS:SkinIconButton(Button[i].ItemButton)
					AS:CreateBackdrop(Button[i])
					Button[i].Backdrop:SetPoint('TOPLEFT', Button[i].NameFrame, 'TOPLEFT', -2, -2)
					Button[i].Backdrop:SetPoint('BOTTOMLEFT', Button[i].NameFrame, 'BOTTOMLEFT', -2, 23)
					Button[i].Backdrop:SetPoint('RIGHT', Button[i], 'RIGHT', 0, 0)
					Button[i].isSkinned = true
				end
			end
		end
	end)
end

AS:RegisterSkin('MailCommander', AS.MailCommander)
