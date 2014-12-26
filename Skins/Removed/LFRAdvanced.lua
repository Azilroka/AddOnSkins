local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LFRAdvanced') then return end

function AS:LFRAdvanced()
	--AS:SkinButton(PVEFrameRaidBrowserButton)
	AS:SkinButton(LFRBrowseFrameCopyNameButton)
	AS:SkinButton(LFRBrowseFrameCreateRaidButton)
	LFRBrowseFrameColumnHeader8:DisableDrawLayer('BACKGROUND')
end

AS:RegisterSkin('LFRAdvanced', AS.LFRAdvanced)