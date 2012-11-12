
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "RaidBuffStatusSkin"
local function SkinRBS(self)
	AS:SkinFrame(RBSFrame)
	AS:SkinButton(RBSFrameScanButton)
	AS:SkinButton(RBSFrameReadyCheckButton)
	AS:SkinButton(RBSFrameBossButton)
	AS:SkinButton(RBSFrameTrashButton)
	AS:SkinNextPrevButton(RBSFrameOptionsButton)
	AS:SkinNextPrevButton(RBSFrameTalentsButton)
	RBSFrameOptionsButton:Size(20)
	RBSFrameTalentsButton:Size(20)
end

AS:RegisterSkin(name,SkinRBS)