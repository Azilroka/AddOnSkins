local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EasyMail') then return end

function AS:EasyMail(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	MailFrame:SetSize(360, 440)
	AS:Desaturate(EasyMail_CheckAllButton)
	AS:Desaturate(EasyMail_ClearAllButton)
	AS:Desaturate(EasyMail_CheckPageButton)
	AS:Desaturate(EasyMail_ClearPageButton)
	AS:Desaturate(EasyMail_GetAllButton)
	AS:Desaturate(EasyMail_MailButton)
	AS:SkinButton(EasyMail_AttButton)
	AS:SkinButton(EasyMail_ForwardButton)

	for i = 1, 7 do
		AS:SkinCheckBox(_G['EasyMail_CheckButton'..i])
	end

	EasyMail_ForwardButton:SetPoint('RIGHT', OpenMailReplyButton, 'LEFT', -2, 0)
	InboxTooMuchMail:SetPoint('TOPLEFT', MailFrame, 'TOPLEFT', 4, -10)
	InboxPrevPageButton:SetPoint('BOTTOMLEFT', InboxFrame, 'BOTTOMLEFT', 42, 100)
	InboxNextPageButton:SetPoint('LEFT', InboxPrevPageButton, 'RIGHT', 215, 0)
	EasyMail_CheckAllButton:SetPoint('TOPLEFT', InboxFrame, 'TOPLEFT', 42, -30)
	EasyMail_CheckPageButton:SetPoint('LEFT', EasyMail_CheckAllButton, 'RIGHT', 4, 0)
	EasyMail_GetAllButton:SetPoint('LEFT', EasyMail_CheckPageButton, 'RIGHT', 4, 0)
	EasyMail_MailButton:SetPoint('TOPLEFT', SendMailNameEditBox, 'TOPRIGHT', 4, 2)
	EasyMail_MailButton:SetSize(22, 22)

	AS:SetTemplate(EasyMail_MailDropdownBackdrop)

	OpenMailCancelButton:SetPoint('BOTTOMRIGHT', OpenMailFrame, 'BOTTOMRIGHT', -3, 3)
	hooksecurefunc('OpenMail_Update', function()
		EasyMail_AttButton:ClearAllPoints()
		EasyMail_AttButton:SetPoint('TOP', OpenMailScrollFrame, 'BOTTOM', 13, -5)
	end)

	for i = 1, 7 do
		local t = _G['MailItem'..i..'ExpireTime']
		if t then
			t:ClearAllPoints()
			t:SetPoint('TOPRIGHT', -10, -4)
		end
	end

	AS:UnregisterSkinEvent('EasyMail', event)
end

AS:RegisterSkin('EasyMail', AS.EasyMail, 'MAIL_SHOW')