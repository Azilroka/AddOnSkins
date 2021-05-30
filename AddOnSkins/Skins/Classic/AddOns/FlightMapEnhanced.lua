local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FlightMapEnhanced') then return end

function AS:FlightMapEnhanced()
	AS:SkinBackdropFrame(FlightMapEnhancedTaxiChoice)
	AS:SkinCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	AS:SkinScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript('OnShow', function()
		for i = 1, 34 do
			if _G['FlightMapEnhancedTaxiChoiceContainerButton'..i] then AS:StripTextures(_G['FlightMapEnhancedTaxiChoiceContainerButton'..i]) end
		end
	end)
	hooksecurefunc('FlightMapEnhancedTaxiChoiceButton_OnEnter', function() GameTooltip:Show() end)
end

AS:RegisterSkin('FlightMapEnhanced', AS.FlightMapEnhanced)
