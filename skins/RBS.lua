if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidBuffStatus") then return end
local U = unpack(select(2,...))
local name = "RaidBuffStatusSkin"
local function SkinRBS(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(RBSFrame)
	U.SkinButton(RBSFrameScanButton)
	U.SkinButton(RBSFrameReadyCheckButton)
	U.SkinButton(RBSFrameBossButton)
	U.SkinButton(RBSFrameTrashButton)
	U.SkinNextPrevButton(RBSFrameOptionsButton)
	U.SkinNextPrevButton(RBSFrameTalentsButton)
	RBSFrameOptionsButton:Size(20)
	RBSFrameTalentsButton:Size(20)
	U.SkinFrame(RBSOptionsFrame)
	U.SkinButton(RBSOptionsFrameButton)
	U.SkinFrame(RBSTalentsFrame)
	U.SkinButton(RBSTalentsFrameButton)
end

U.RegisterSkin(name,SkinRBS)