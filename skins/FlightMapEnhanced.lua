local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "FlightMapEnhancedSkin"
function AS:SkinFlightMapEnhanced()
	if not FlightMapEnhancedTaxiChoice then return end
	AS:SkinBackdropFrame(FlightMapEnhancedTaxiChoice, true)
	S:HandleCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	S:HandleScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript("OnShow", function()
		for i = 1, 34 do
			if _G["FlightMapEnhancedTaxiChoiceContainerButton"..i] then _G["FlightMapEnhancedTaxiChoiceContainerButton"..i]:StripTextures() end
		end
	end)
	hooksecurefunc("FlightMapEnhancedTaxiChoiceButton_OnEnter", function() GameTooltip:Show() end)
end
AS:RegisterSkin(name, AS.SkinFlightMapEnhanced)