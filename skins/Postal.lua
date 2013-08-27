local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "PostalSkin"
function AS:SkinPostal()
	InboxPrevPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 45, 112)
	InboxNextPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 295, 112)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G["MailItem"..i.."ExpireTime"]
		b:SetPoint("TOPRIGHT", "MailItem"..i, "TOPRIGHT", -5, -10)
		if b.returnicon then
			b.returnicon:SetPoint("TOPRIGHT", b, "TOPRIGHT", 20, 0)
		end
		if _G['PostalInboxCB'..i] and not _G['PostalInboxCB'..i].handled then
			AS:SkinCheckBox(_G['PostalInboxCB'..i])
			_G['PostalInboxCB'..i].handled = true
		end
	end

	if PostalSelectOpenButton and not PostalSelectOpenButton.handled then
		AS:SkinButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton.handled = true
		PostalSelectOpenButton:Point("RIGHT", InboxFrame, "TOP", -41, -48)
	end

	if Postal_OpenAllMenuButton and not Postal_OpenAllMenuButton.handled then
		AS:SkinNextPrevButton(Postal_OpenAllMenuButton, true)
		Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
		Postal_OpenAllMenuButton.handled = true
	end

	if PostalOpenAllButton and not PostalOpenAllButton.handled then
		AS:SkinButton(PostalOpenAllButton, true)
		PostalOpenAllButton.handled = true
		PostalOpenAllButton:Point("CENTER", InboxFrame, "TOP", -34, -400)
	end

	if PostalSelectReturnButton and not PostalSelectReturnButton.handled then
		AS:SkinButton(PostalSelectReturnButton, true)
		PostalSelectReturnButton.handled = true
		PostalSelectReturnButton:Point("LEFT", InboxFrame, "TOP", -5, -48)
	end

	if Postal_ModuleMenuButton and not Postal_ModuleMenuButton.handled then
		AS:SkinNextPrevButton(Postal_ModuleMenuButton, true)
		Postal_ModuleMenuButton.handled = true
		Postal_ModuleMenuButton:SetPoint('TOPRIGHT', MailFrame, -53, -6)
	end

	if Postal_BlackBookButton and not Postal_BlackBookButton.handled then
		AS:SkinNextPrevButton(Postal_BlackBookButton, true)
		Postal_BlackBookButton.handled = true
		Postal_BlackBookButton:SetPoint('LEFT', SendMailNameEditBox, 'RIGHT', 5, 2)
	end
end

AS:RegisterSkin(name, AS.SkinPostal, 'MAIL_SHOW')