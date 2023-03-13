local AS, L, S, R = unpack(AddOnSkins)

function R:FlightMapEnhanced()
	S:HandleFrame(FlightMapEnhancedTaxiChoice, true)
	S:HandleCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	S:HandleScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript('OnShow', function()
		for i = 1, 34 do
			if _G['FlightMapEnhancedTaxiChoiceContainerButton'..i] then S:StripTextures(_G['FlightMapEnhancedTaxiChoiceContainerButton'..i]) end
		end
	end)
end

AS:RegisterSkin('FlightMapEnhanced')
