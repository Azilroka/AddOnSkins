local AS, L, S, R = unpack(AddOnSkins)

function R:SilverDragon()
	local SilverDragon = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")
	local module = SilverDragon:GetModule("ClickTarget")
	local original = module.Looks.SilverDragon
	function module.Looks:SilverDragon(popup)
		original(self, popup)

		S:HandleFrame(popup)

		S:HandleCloseButton(popup.close, true)
		popup.close.backdrop:SetPoint('TOPLEFT', 7, -8)
		popup.close.backdrop:SetPoint('BOTTOMRIGHT', -8, 8)
		popup.close:ClearAllPoints()
		popup.close:SetFrameLevel(popup:GetFrameLevel() + 2)
		popup.close:SetPoint("TOPRIGHT", popup, 'TOPRIGHT', 4, 4)
		popup.close:SetScale(1)
		popup.close:HookScript("OnEnter", function(self)
			self.Text:SetTextColor(1, .2, .2)
			self.backdrop:SetBackdropBorderColor(1, .2, .2)
		end)

		popup.close:HookScript("OnLeave", function(self)
			self.Text:SetTextColor(1, 1, 1)
			self.backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)

		popup.title:SetFont(AS.Libs.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
		popup.source:SetFont(AS.Libs.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
		popup.source:SetTextColor(1.0, 1.0, 1.0)
		popup.status:SetFont(AS.Libs.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
		popup.status:SetTextColor(1.0, 1.0, 1.0)
	end

end

AS:RegisterSkin('SilverDragon')
