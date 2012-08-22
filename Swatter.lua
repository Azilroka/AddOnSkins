if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("!Swatter") then return end
local SkinSwatter = CreateFrame("Frame")
	SkinSwatter:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinSwatter:SetScript("OnEvent", function(self)
	if (UISkinOptions.SwatterSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(SwatterErrorFrame)
	cSkinButton(Swatter.Error.Done)
	cSkinButton(Swatter.Error.Next)
	cSkinButton(Swatter.Error.Prev)
	cSkinButton(Swatter.Drag)
	cSkinScrollBar(SwatterErrorInputScrollScrollBar)

end)