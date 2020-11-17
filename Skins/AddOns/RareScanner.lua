local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RareScanner') then return end

function AS:RareScanner()
	AS:SkinFrame(scanner_button, 'Default')
	AS:SkinCloseButton(scanner_button.CloseButton)
	scanner_button.CloseButton:ClearAllPoints()
	scanner_button.CloseButton:SetPoint("TOPRIGHT")
	AS:SkinButton(scanner_button.FilterDisabledButton)
	scanner_button.FilterDisabledButton:SetNormalTexture([[Interface\WorldMap\Dash_64Grey]])
	scanner_button.FilterDisabledButton:ClearAllPoints()
	scanner_button.FilterDisabledButton:SetPoint("TOPLEFT", 5, -5)
	AS:SkinButton(scanner_button.FilterEnabledButton)
	scanner_button.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
	scanner_button.FilterEnabledButton:ClearAllPoints()
	scanner_button.FilterEnabledButton:SetPoint("TOPLEFT", 5, -5)
end

AS:RegisterSkin('RareScanner', AS.RareScanner)