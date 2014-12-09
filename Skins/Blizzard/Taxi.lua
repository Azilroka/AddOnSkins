local AS = unpack(AddOnSkins)

function AS:Blizzard_Taxi()
	AS:StripTextures(TaxiFrame)
	TaxiFrame.TitleText:SetAlpha(0)
	AS:CreateBackdrop(TaxiRouteMap)
	AS:SkinCloseButton(TaxiFrame.CloseButton)
	TaxiFrame.CloseButton:SetFrameLevel(TaxiRouteMap:GetFrameLevel() + 1)
	TaxiFrame.CloseButton:SetPoint("TOPRIGHT", 0, -18)
end

AS:RegisterSkin('Blizzard_Taxi', AS.Blizzard_Taxi)