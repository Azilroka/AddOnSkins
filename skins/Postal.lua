local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = 'PostalSkin'
function AS:SkinPostal()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.mail ~= true then return end

	InboxPrevPageButton:Point('CENTER', InboxFrame, 'BOTTOMLEFT', 45, 112)
	InboxNextPageButton:Point('CENTER', InboxFrame, 'BOTTOMLEFT', 295, 112)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G['MailItem'..i..'ExpireTime']
		b:SetPoint('TOPRIGHT', 'MailItem'..i, 'TOPRIGHT', -5, -10)
		b.returnicon:SetPoint('TOPRIGHT', b, 'TOPRIGHT', 20, 0)

		if _G['PostalInboxCB'..i] then
			S:HandleCheckBox(_G['PostalInboxCB'..i], true)
		end
	end

	if PostalSelectOpenButton then
		S:HandleButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton:Point('RIGHT', InboxFrame, 'TOP', -41, -48)
	end
	
	if Postal_OpenAllMenuButton then
		S:HandleNextPrevButton(Postal_OpenAllMenuButton, true)
		Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
	end

	if PostalOpenAllButton then
		S:HandleButton(PostalOpenAllButton, true)
		PostalOpenAllButton:Point('CENTER', InboxFrame, 'TOP', -34, -400)
	end

	if PostalSelectReturnButton then
		S:HandleButton(PostalSelectReturnButton, true)
		PostalSelectReturnButton:Point('LEFT', InboxFrame, 'TOP', -5, -48)
	end

	if Postal_ModuleMenuButton then
		if not Postal_ModuleMenuButton.handled then
			S:HandleNextPrevButton(Postal_ModuleMenuButton, true)
			Postal_ModuleMenuButton.handled = true
		end
		Postal_ModuleMenuButton:SetPoint('TOPRIGHT', MailFrame, -83, -6)
	end

	if Postal_BlackBookButton then
		if not Postal_BlackBookButton.handled then
			S:HandleNextPrevButton(Postal_BlackBookButton, true)
			Postal_BlackBookButton.handled = true
		end
		Postal_BlackBookButton:SetPoint('LEFT', SendMailNameEditBox, 'RIGHT', 5, 2)
	end
end

AS:RegisterSkin(name, AS.SkinPostal, 'MAIL_SHOW')