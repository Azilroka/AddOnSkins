if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidBuffStatus") then return end
local U = unpack(select(2,...))
local name = "RaidBuffStatusSkin"
local function SkinRBS(self)
	local s = U.s
	local c = U.c

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