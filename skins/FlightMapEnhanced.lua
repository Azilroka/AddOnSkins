local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "FlightMapEnhancedSkin"
function AS:SkinFlightMapEnhanced()
	AS:SkinBackdropFrame(FlightMapEnhancedTaxiChoice)
	AS:SkinCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	AS:SkinScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript("OnShow", function()
		for i = 1, 34 do
			if _G["FlightMapEnhancedTaxiChoiceContainerButton"..i] then _G["FlightMapEnhancedTaxiChoiceContainerButton"..i]:StripTextures() end
		end
	end)
	hooksecurefunc("FlightMapEnhancedTaxiChoiceButton_OnEnter", function() GameTooltip:Show() end)
end

AS:RegisterSkin(name, AS.SkinFlightMapEnhanced)