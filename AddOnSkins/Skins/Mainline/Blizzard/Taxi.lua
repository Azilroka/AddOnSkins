local AS = unpack(AddOnSkins)

function AS:Blizzard_Taxi()
	AS:StripTextures(TaxiFrame)
	TaxiFrame.TitleText:SetAlpha(0)
	AS:CreateBackdrop(TaxiRouteMap)
	AS:SkinCloseButton(TaxiFrame.CloseButton)
	TaxiFrame.CloseButton:SetFrameLevel(TaxiRouteMap:GetFrameLevel() + 1)
	TaxiFrame.CloseButton:SetPoint("TOPRIGHT", 0, -18)
end

function AS:Blizzard_FlightMap(event, addon)
	if addon ~= 'Blizzard_FlightMap' then return end

	AS:StripTextures(FlightMapFrame)
	AS:CreateBackdrop(FlightMapFrame.ScrollContainer)
	FlightMapFrame.ScrollContainer.Backdrop:SetPoint('TOPLEFT', FlightMapFrame.ScrollContainer, 'TOPLEFT', -1, 0)
	FlightMapFrame.BorderFrame.TitleText:SetText('')

	AS:StripTextures(FlightMapFrame.BorderFrame)
	AS:SkinCloseButton(FlightMapFrame.BorderFrame.CloseButton)
	FlightMapFrame.BorderFrame.CloseButton:SetPoint("TOPRIGHT", 5, -14)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_FlightMap', AS.Blizzard_FlightMap, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_Taxi', AS.Blizzard_Taxi)
