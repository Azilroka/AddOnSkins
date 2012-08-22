if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidBuffStatus") then return end
local SkinRBS = CreateFrame("Frame")
	SkinRBS:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinRBS:SetScript("OnEvent", function(self, event, addon)
	if (UISkinOptions.RaidBuffStatusSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	cSkinFrame(RBSFrame)
	cSkinButton(RaidBuffStatus.scanbutton)
	cSkinButton(RaidBuffStatus.readybutton)
	cSkinButton(RaidBuffStatus.bossbutton)
	cSkinButton(RaidBuffStatus.trashbutton)
	cSkinNextPrevButton(optionsbutton)
	cSkinNextPrevButton(talentsbutton)
	optionsbutton:Size(20)
	talentsbutton:Size(20)
end)
