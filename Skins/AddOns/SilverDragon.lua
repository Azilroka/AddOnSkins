local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SilverDragon') then return end

function AS:SilverDragon()
	AS:SkinFrame(SilverDragonPopupButton)

	AS:SkinBackdropFrame(SilverDragonPopupButton.close)
	SilverDragonPopupButton.close.Backdrop:SetPoint('TOPLEFT', 7, -8)
	SilverDragonPopupButton.close.Backdrop:SetPoint('BOTTOMRIGHT', -8, 8)
	SilverDragonPopupButton.close.Text = SilverDragonPopupButton.close:CreateFontString(nil, 'OVERLAY')
	SilverDragonPopupButton.close.Text:SetFont(AS.Font, 16, 'OUTLINE')
	SilverDragonPopupButton.close.Text:SetText('x')
	SilverDragonPopupButton.close.Text:SetJustifyH('CENTER')
	SilverDragonPopupButton.close.Text:SetPoint('CENTER', SilverDragonPopupButton.close, 'CENTER')
	SilverDragonPopupButton.close:ClearAllPoints()
	SilverDragonPopupButton.close:SetFrameLevel(SilverDragonPopupButton:GetFrameLevel() + 2)
	SilverDragonPopupButton.close:SetPoint("TOPRIGHT", SilverDragonPopupButton, 'TOPRIGHT', 4, 4)
	SilverDragonPopupButton.close:SetScale(1)
	SilverDragonPopupButton.close:HookScript("OnEnter", function(self)
		self.Text:SetTextColor(1, .2, .2)
		self.Backdrop:SetBackdropBorderColor(1, .2, .2)
	end)

	SilverDragonPopupButton.close:HookScript("OnLeave", function(self)
		self.Text:SetTextColor(1, 1, 1)
		self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)

	SilverDragonPopupButton.title:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
	SilverDragonPopupButton.source:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
	SilverDragonPopupButton.source:SetTextColor(1.0, 1.0, 1.0)
	SilverDragonPopupButton.status:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
	SilverDragonPopupButton.status:SetTextColor(1.0, 1.0, 1.0)
end

AS:RegisterSkin('SilverDragon', AS.SilverDragon)