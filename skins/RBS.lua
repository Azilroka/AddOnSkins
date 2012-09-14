if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidBuffStatus") then return end
local U = unpack(select(2,...))
local name = "RaidBuffStatusSkin"
local function SkinRBS(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(RBSFrame)
	U.SkinButton(RaidBuffStatus.scanbutton)
	U.SkinButton(RaidBuffStatus.readybutton)
	U.SkinButton(RaidBuffStatus.bossbutton)
	U.SkinButton(RaidBuffStatus.trashbutton)
	U.SkinNextPrevButton(optionsbutton)
	U.SkinNextPrevButton(talentsbutton)
	optionsbutton:Size(20)
	talentsbutton:Size(20)
end

U.RegisterSkin(name,SkinRBS)