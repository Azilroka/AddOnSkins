local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SilverDragon') then return end

local name = 'SilverDragonSkin'
function AS:SkinSilverDragon()
	AS:SkinFrame(SilverDragonPopupButton)
	AS:SkinCloseButton(SilverDragonPopupButton.close)
	SilverDragonPopupButton.close:ClearAllPoints()
	SilverDragonPopupButton.close:SetPoint('TOPRIGHT', SilverDragonPopupButton, 'TOPRIGHT')
	SilverDragonPopupButton.title:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
	SilverDragonPopupButton.details:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
	SilverDragonPopupButton.details:SetTextColor(1.0, 1.0, 1.0)
	SilverDragonPopupButton.subtitle:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
	SilverDragonPopupButton.subtitle:SetTextColor(1.0, 1.0, 1.0)
end

AS:RegisterSkin(name, AS.SkinSilverDragon)