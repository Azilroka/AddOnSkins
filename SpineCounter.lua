if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("SpineCounter") then return end
local SkinSpineCounter = CreateFrame("Frame")
	SkinSpineCounter:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinSpineCounter:SetScript( "OnEvent", function(self)
	if (UISkinOptions.SpineCounterSkin == "Disabled") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
SCOutput:StripTextures()
SCOutput:SetTemplate("Transparent")

end)