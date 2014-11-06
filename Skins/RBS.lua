local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaidBuffStatus') then return end

function AS:RaidBuffStatus()
	AS:SkinFrame(RBSFrame)
	AS:SkinButton(RBSFrameScanButton)
	AS:SkinButton(RBSFrameReadyCheckButton)
	AS:SkinButton(RBSFrameBossButton)
	AS:SkinButton(RBSFrameTrashButton)
	AS:SkinButton(RBSFramePullButton)
	AS:SkinNextPrevButton(RBSFrameOptionsButton)
	AS:SkinNextPrevButton(RBSFrameTalentsButton)
	RBSFrameOptionsButton:Size(20)
	RBSFrameTalentsButton:Size(20)
end

AS:RegisterSkin('RaidBuffStatus', AS.RaidBuffStatus)