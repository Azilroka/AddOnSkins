if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidBuffStatus") then return end
local name = "RaidBuffStatusSkin"
local function SkinRBS(self)
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
end

cRegisterSkin(name,SkinRBS)