local AS, L, S, R = unpack(AddOnSkins)

function R:MailCommander()
	S:HandleFrame(MailCommanderFrame)
	S:HandleCloseButton(MailCommanderFrame.CloseButton)
	S:HandleNextPrevButton(MailCommanderFrame.NextPageButton)
	S:HandleNextPrevButton(MailCommanderFrame.PrevPageButton)

	S:HandleButton(MailCommanderFrame.Send)
	S:HandleButton(MailCommanderFrame.Delete)

	S:HandleDropDownBox(MailCommanderFrame.Filter)

	S:HandleCheckBox(MailCommanderFrame.All)

	S:HandleTab(MailCommanderFrame.tabNEED)
	S:HandleTab(MailCommanderFrame.tabSEND)
	S:HandleTab(MailCommanderFrame.tabFILTER)
	S:HandleTab(MailCommanderFrame.tabCATEGORIES)

	S:HandleTooltip(MailCommanderTooltip)
	hooksecurefunc(LibStub('LibInit'):GetAddon('MailCommander'), 'RenderButtonList', function()
		for _, Table in pairs({'Additional', 'Items'}) do
			local Button = MailCommanderFrame[Table]
			for i = 1, #Button do
				if not Button[i].isSkinned then
					Button[i].Bg:SetTexture()
					Button[i].NameFrame:SetTexture()
					Button[i].SlotTexture:SetTexture()
					S:HandleIcon(Button[i].ItemButton.icon)
					Button[i].ItemButton:SetNormalTexture('')
					Button[i].ItemButton:SetPushedTexture('')
					Button[i].ItemButton:SetHighlightTexture('')
					S:HandleItemButton(Button[i].ItemButton)
					S:CreateBackdrop(Button[i])
					Button[i].backdrop:SetPoint('TOPLEFT', Button[i].NameFrame, 'TOPLEFT', -2, -2)
					Button[i].backdrop:SetPoint('BOTTOMLEFT', Button[i].NameFrame, 'BOTTOMLEFT', -2, 23)
					Button[i].backdrop:SetPoint('RIGHT', Button[i], 'RIGHT', 0, 0)
					Button[i].isSkinned = true
				end
			end
		end
	end)
end

AS:RegisterSkin('MailCommander')
