local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaidBuffStatus') then return end

local name = 'RaidBuffStatusSkin'
function AS:SkinRaidBuffStatus()
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

AS:RegisterSkin(name, AS.SkinRaidBuffStatus)