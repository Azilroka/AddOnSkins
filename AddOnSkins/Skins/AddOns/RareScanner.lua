local AS, L, S, R = unpack(AddOnSkins)

function R:RareScanner()
	S:HandleFrame(RARESCANNER_BUTTON, 'Default')
	S:HandleButton(RARESCANNER_BUTTON.CloseButton)
	RARESCANNER_BUTTON.CloseButton:ClearAllPoints()
	RARESCANNER_BUTTON.CloseButton:SetPoint("TOPRIGHT", -5, -5)
	S:HandleButton(RARESCANNER_BUTTON.FilterEntityButton)
	RARESCANNER_BUTTON.FilterEntityButton:SetNormalTexture([[Interface\WorldMap\Dash_64Grey]])
	RARESCANNER_BUTTON.FilterEntityButton:ClearAllPoints()
	RARESCANNER_BUTTON.FilterEntityButton:SetPoint("TOPLEFT", 5, -5)
	S:HandleButton(RARESCANNER_BUTTON.UnfilterEnabledButton)
	RARESCANNER_BUTTON.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
	RARESCANNER_BUTTON.UnfilterEnabledButton:ClearAllPoints()
	RARESCANNER_BUTTON.UnfilterEnabledButton:SetPoint("TOPLEFT", 5, -5)
end

AS:RegisterSkin('RareScanner')
