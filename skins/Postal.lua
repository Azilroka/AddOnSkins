if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Postal") then return end
local U = unpack(select(2,...))
local name = "PostalSkin"
local function SkinPostal(self)
	local s = U.s
	local c = U.c
	if IsAddOnLoaded("ElvUI") then if c.private.skins.blizzard.enable ~= true or c.private.skins.blizzard.mail ~= true then return end end

	InboxPrevPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 45, 112)
	InboxNextPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 295, 112)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G["MailItem"..i.."ExpireTime"]
		b:SetPoint("TOPRIGHT", "MailItem"..i, "TOPRIGHT", -5, -10)
		b.returnicon:SetPoint("TOPRIGHT", b, "TOPRIGHT", 20, 0)	
		
		if _G['PostalInboxCB'..i] then
			U.SkinCheckBox(_G['PostalInboxCB'..i])
		end
	end

	if PostalSelectOpenButton and not PostalSelectOpenButton.handled then
		U.SkinButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton.handled = true;
		PostalSelectOpenButton:Point("RIGHT", InboxFrame, "TOP", -41, -48)
	end	
	
	if Postal_OpenAllMenuButton and not Postal_OpenAllMenuButton.handled then
		U.SkinNextPrevButton(Postal_OpenAllMenuButton, true)
		Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
		Postal_OpenAllMenuButton.handled = true;
	end	

	if PostalOpenAllButton and not PostalOpenAllButton.handled then
		U.SkinButton(PostalOpenAllButton, true)
		PostalOpenAllButton.handled = true;
		PostalOpenAllButton:Point("Center", InboxFrame, "TOP", -34, -400)
	end	
	
	if PostalSelectReturnButton then
		U.SkinButton(PostalSelectReturnButton, true)
		PostalSelectReturnButton:Point("LEFT", InboxFrame, "TOP", -5, -48)
	end

	if Postal_ModuleMenuButton then
		U.SkinNextPrevButton(Postal_ModuleMenuButton, true)
		Postal_ModuleMenuButton:SetPoint('TOPRIGHT', MailFrame, -53, -6)
	end
	
	if Postal_BlackBookButton then
		U.SkinNextPrevButton(Postal_BlackBookButton, true)
		Postal_BlackBookButton:SetPoint('LEFT', SendMailNameEditBox, 'RIGHT', 5, 2)
	end
		
	local Postal = LibStub("AceAddon-3.0"):GetAddon("Postal")
	local Postal_OpenAll = Postal:GetModule("OpenAll")	
	Postal_OpenAll.OnEnable_ = Postal_OpenAll.OnEnable
	function Postal_OpenAll:OnEnable(self)
		Postal_OpenAll.OnEnable_(self)
		if Postal_OpenAllMenuButton and not Postal_OpenAllMenuButton.handled then
			U.SkinNextPrevButton(Postal_OpenAllMenuButton, true)
			Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
			Postal_OpenAllMenuButton.handled = true;
		end

		if PostalOpenAllButton and not PostalOpenAllButton.handled then
			U.SkinButton(PostalOpenAllButton, true)
			PostalOpenAllButton.handled = true;
		end
	end

	local Postal_Select = Postal:GetModule("OpenAll")		
	Postal_Select.OnEnable_ = Postal_Select.OnEnable
	function Postal_Select:OnEnable()
		Postal_Select.OnEnable_(self)
		
		for i = 1, INBOXITEMS_TO_DISPLAY do
			if _G['PostalInboxCB'..i] and not _G['PostalInboxCB'..i].handled then
				U.SkinCheckBox(_G['PostalInboxCB'..i])
				_G['PostalInboxCB'..i].handled = true;
			end
		end		
	end
end

U.RegisterSkin(name,SkinPostal)