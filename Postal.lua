if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("Postal") then return end
local SkinPostal = CreateFrame("Frame")
	SkinPostal:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPostal:SetScript("OnEvent", function(self)
	if (UISkinOptions.PostalSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	if IsAddOnLoaded("ElvUI") then if c.private.skins.blizzard.enable ~= true or c.private.skins.blizzard.mail ~= true then return end end

	MailFrame:Size(350,450)
	PostalOpenAllButton:Point("Center", InboxFrame, "TOP", -22, -420)
	InboxPrevPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 64, 92)
	InboxNextPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 314, 92)

	for i = 1, INBOXITEMS_TO_DISPLAY do
		local b = _G["MailItem"..i.."ExpireTime"]
		b:SetPoint("TOPRIGHT", "MailItem"..i, "TOPRIGHT", -5, -10)
		b.returnicon:SetPoint("TOPRIGHT", b, "TOPRIGHT", 20, 0)	
		
		if _G['PostalInboxCB'..i] then
			cSkinCheckBox(_G['PostalInboxCB'..i])
		end
	end

	if PostalSelectOpenButton and not PostalSelectOpenButton.handled then
		cSkinButton(PostalSelectOpenButton, true)
		PostalSelectOpenButton.handled = true;
	end	
	
	if Postal_OpenAllMenuButton and not Postal_OpenAllMenuButton.handled then
		cSkinNextPrevButton(Postal_OpenAllMenuButton, true)
		Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
		Postal_OpenAllMenuButton.handled = true;
	end	

	if PostalOpenAllButton and not PostalOpenAllButton.handled then
		cSkinButton(PostalOpenAllButton, true)
		PostalOpenAllButton.handled = true;
	end	
	
	if PostalSelectReturnButton then
		cSkinButton(PostalSelectReturnButton, true)	
	end

	if Postal_ModuleMenuButton then
		cSkinNextPrevButton(Postal_ModuleMenuButton, true)
		Postal_ModuleMenuButton:SetPoint('TOPRIGHT', MailFrame, -58, -16)
	end
	
	if Postal_BlackBookButton then
		cSkinNextPrevButton(Postal_BlackBookButton, true)
		Postal_BlackBookButton:SetPoint('LEFT', SendMailNameEditBox, 'RIGHT', 5, 2)
	end
		
	local Postal = LibStub("AceAddon-3.0"):GetAddon("Postal")
	local Postal_OpenAll = Postal:GetModule("OpenAll")	
	Postal_OpenAll.OnEnable_ = Postal_OpenAll.OnEnable
	function Postal_OpenAll:OnEnable(self)
		Postal_OpenAll.OnEnable_(self)
		if Postal_OpenAllMenuButton and not Postal_OpenAllMenuButton.handled then
			cSkinNextPrevButton(Postal_OpenAllMenuButton, true)
			Postal_OpenAllMenuButton:SetPoint('LEFT', PostalOpenAllButton, 'RIGHT', 5, 0)
			Postal_OpenAllMenuButton.handled = true;
		end

		if PostalOpenAllButton and not PostalOpenAllButton.handled then
			cSkinButton(PostalOpenAllButton, true)
			PostalOpenAllButton.handled = true;
		end
	end

	local Postal_Select = Postal:GetModule("OpenAll")		
	Postal_Select.OnEnable_ = Postal_Select.OnEnable
	function Postal_Select:OnEnable()
		Postal_Select.OnEnable_(self)
		
		for i = 1, INBOXITEMS_TO_DISPLAY do
			if _G['PostalInboxCB'..i] and not _G['PostalInboxCB'..i].handled then
				cSkinCheckBox(_G['PostalInboxCB'..i])
				_G['PostalInboxCB'..i].handled = true;
			end
		end		
	end
end)
