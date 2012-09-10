if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SpineCounter") then return end
local name = "SpineCounterSkin"
local function SkinSpineCounter(self)
	cSkinFrame(SCOutput)
end
cRegisterSkin(name,SkinSpineCounter)