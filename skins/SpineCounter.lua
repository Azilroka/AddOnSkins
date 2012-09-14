if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SpineCounter") then return end
local U = unpack(select(2,...))
local name = "SpineCounterSkin"
local function SkinSpineCounter(self)
	U.SkinFrame(SCOutput)
end
U.RegisterSkin(name,SkinSpineCounter)