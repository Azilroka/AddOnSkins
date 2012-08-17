LoadAddOn("epgp")

if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("epgp") then return end
local Skin = CreateFrame("Frame")
	Skin:RegisterEvent("PLAYER_ENTERING_WORLD")
	Skin:SetScript("OnEvent", function(self)
	if (UISkinOptions.EPGPisSkinned == "True") then UISkinOptions.EPGPisSkinned = "False" end

local function SkinEPGP()
	
	if (UISkinOptions.EPGPisSkinned == "True") then return end
	UISkinOptions.EPGPisSkinned = "True"
	EPGPFrame:StripTextures()
	EPGPFrame:SetTemplate("Transparent")
	EPGPLogFrame:SetTemplate("Transparent")
	EPGPScrollFrame:SetTemplate("Transparent")
	EPGPExportImportFrame:SetTemplate("Transparent")
	EPGPSideFrame:SetTemplate("Transparent")
	EPGPSideFrame2:SetTemplate("Transparent")
	EPGPScrollFrameScrollBar:StripTextures()
	EPGPScrollFrameScrollBarBorder:StripTextures()

	cSkinScrollBar(EPGPScrollFrameScrollBar)
	cSkinDropDownBox(EPGPSideFrameGPControlDropDown)
	cSkinDropDownBox(EPGPSideFrameEPControlDropDown)
	cSkinDropDownBox(EPGPSideFrame2EPControlDropDown)
end

hooksecurefunc(EPGP, "ToggleUI", SkinEPGP)

end)