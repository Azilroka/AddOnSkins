if not(IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("EasyMail") then return end
local SkinEasyMail = CreateFrame("Frame")
	SkinEasyMail:RegisterEvent("MAIL_SHOW")
	SkinEasyMail:SetScript("OnEvent", function(self, event, addon)
	if (UISkinOptions.EasyMailSkin ~= "Enabled") then return end
	MailFrame:Size(360,440)
		cSkinButton(EasyMail_CheckAllButton)
		cSkinButton(EasyMail_GetAllButton)
		cSkinButton(EasyMail_AttButton)
		cSkinButton(EasyMail_ForwardButton)
		cSkinNextPrevButton(EasyMail_MailButton)
	
		for i = 1, 7 do
			cSkinCheckBox(_G["EasyMail_CheckButton"..i])
		end

		EasyMail_ForwardButton:Point("RIGHT", OpenMailReplyButton, "LEFT", -2, 0)
		InboxTooMuchMail:Point("TOPLEFT", MailFrame, "TOPLEFT", 4, -10)
		InboxPrevPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 63, 104)
		InboxNextPageButton:Point("CENTER", InboxFrame, "BOTTOMLEFT", 314, 104)
		EasyMail_CheckAllButton:Point("TOPLEFT", InboxFrame, "TOPLEFT", 50, -45)
		EasyMail_GetAllButton:Point("TOPLEFT", InboxFrame, "TOPLEFT", 186, -45)
		EasyMail_MailButton:Point("TOPLEFT", SendMailNameEditBox, "TOPRIGHT", 4, 2)
		EasyMail_MailButton:Size(22)
		EasyMail_MailDropdownBackdrop:SetTemplate("Transparent")
		OpenMailCancelButton:Point("BOTTOMRIGHT", OpenMailFrame, "BOTTOMRIGHT", -3, 3)
		EasyMail_AttButton:Point("TOPRIGHT", OpenMailFrame, "TOPRIGHT", -120, -328)
		for i = 1, 7 do	
			local t = _G["MailItem"..i.."ExpireTime"]
				if t then
					t:ClearAllPoints()
					t:Point("TOPRIGHT", -10, -4)
				end				
		end
end)