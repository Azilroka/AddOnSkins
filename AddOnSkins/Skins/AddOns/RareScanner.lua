local AS, L, S, R = unpack(AddOnSkins)

function R:RareScanner()
	S:HandleFrame(scanner_button, 'Default')
	S:HandleCloseButton(scanner_button.CloseButton)
	scanner_button.CloseButton:ClearAllPoints()
	scanner_button.CloseButton:SetPoint("TOPRIGHT")
	S:HandleButton(scanner_button.FilterDisabledButton)
	scanner_button.FilterDisabledButton:SetNormalTexture([[Interface\WorldMap\Dash_64Grey]])
	scanner_button.FilterDisabledButton:ClearAllPoints()
	scanner_button.FilterDisabledButton:SetPoint("TOPLEFT", 5, -5)
	S:HandleButton(scanner_button.FilterEnabledButton)
	scanner_button.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
	scanner_button.FilterEnabledButton:ClearAllPoints()
	scanner_button.FilterEnabledButton:SetPoint("TOPLEFT", 5, -5)
end

AS:RegisterSkin('RareScanner')
