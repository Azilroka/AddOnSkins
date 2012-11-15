﻿
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "EasyMailSkin"
local function SkinEasyMail(self,event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	MailFrame:Size(360,440)
	S:HandleButton(EasyMail_CheckAllButton)
	S:HandleButton(EasyMail_GetAllButton)
	S:HandleButton(EasyMail_AttButton)
	S:HandleButton(EasyMail_ForwardButton)
	S:HandleNextPrevButton(EasyMail_MailButton)

	for i = 1, 7 do
		S:HandleCheckBox(_G["EasyMail_CheckButton"..i])
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
	hooksecurefunc("OpenMail_Update", function()
		EasyMail_AttButton:ClearAllPoints()
		EasyMail_AttButton:Point("TOP", OpenMailScrollFrame, "BOTTOM", 13, -5)
	end)
	for i = 1, 7 do	
		local t = _G["MailItem"..i.."ExpireTime"]
			if t then
				t:ClearAllPoints()
				t:Point("TOPRIGHT", -10, -4)
			end				
	end
end

AS:RegisterSkin(name,SkinEasyMail,"MAIL_SHOW")