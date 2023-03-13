local AS, L, S, R = unpack(AddOnSkins)

function R:Postal(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then return end

	InboxPrevPageButton:SetPoint('CENTER', InboxFrame, 'BOTTOMLEFT', 45, 112)
	InboxNextPageButton:SetPoint('CENTER', InboxFrame, 'BOTTOMLEFT', 295, 112)
	S:Kill(OpenAllMail)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G['MailItem'..i..'ExpireTime']
		if b then
			b:SetPoint('TOPRIGHT', 'MailItem'..i, 'TOPRIGHT', -5, -10)
			if b.returnicon then
				b.returnicon:SetPoint('TOPRIGHT', b, 'TOPRIGHT', 20, 0)
			end
		end
		if _G['PostalInboxCB'..i] then
			S:HandleCheckBox(_G['PostalInboxCB'..i])
		end
	end

	if PostalSelectOpenButton then
		S:HandleButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton:SetPoint('RIGHT', InboxFrame, 'TOP', -41, -48)
	end

	if Postal_OpenAllMenuButton then
		S:HandleNextPrevButton(Postal_OpenAllMenuButton)
		Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 2, 0)
		Postal_OpenAllMenuButton:SetSize(20, 20) -- Original it is 23, 23
	end

	if PostalOpenAllButton then
		S:HandleButton(PostalOpenAllButton, true)
		PostalOpenAllButton:SetPoint('CENTER', InboxFrame, 'TOP', -34, -400)
	end

	if PostalSelectReturnButton then
		S:HandleButton(PostalSelectReturnButton, true)
		PostalSelectReturnButton:SetPoint('LEFT', InboxFrame, 'TOP', -5, -48)
	end

	if Postal_ModuleMenuButton then
		S:HandleNextPrevButton(Postal_ModuleMenuButton)
		Postal_ModuleMenuButton:SetPoint('TOPRIGHT', MailFrame, -53, -6)
	end

	if Postal_BlackBookButton then
		S:HandleNextPrevButton(Postal_BlackBookButton)
		Postal_BlackBookButton:SetPoint('LEFT', SendMailNameEditBox, 'RIGHT', 5, 2)
	end

	AS:UnregisterSkinEvent('Postal', event)
end

AS:RegisterSkin('Postal', nil, 'MAIL_SHOW')
