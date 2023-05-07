local AS, L, S, R = unpack(AddOnSkins)

function R:RareScanner()
	S:HandleFrame(scanner_button, 'Default')
	S:HandleCloseButton(scanner_button.CloseButton)
	scanner_button.CloseButton:ClearAllPoints()
	scanner_button.CloseButton:SetPoint("TOPRIGHT")
	S:HandleButton(scanner_button.FilterEntityButton)
	scanner_button.FilterEntityButton:SetNormalTexture([[Interface\WorldMap\Dash_64Grey]])
	scanner_button.FilterEntityButton:ClearAllPoints()
	scanner_button.FilterEntityButton:SetPoint("TOPLEFT", 5, -5)
	S:HandleButton(scanner_button.UnfilterEnabledButton)
	scanner_button.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
	scanner_button.UnfilterEnabledButton:ClearAllPoints()
	scanner_button.UnfilterEnabledButton:SetPoint("TOPLEFT", 5, -5)
end

AS:RegisterSkin('RareScanner')
