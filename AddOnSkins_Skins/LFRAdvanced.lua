local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LFRAdvanced') then return end

local name = 'LFRAdvancedSkin'
function AS:SkinLFRAdvanced()
	AS:SkinButton(PVEFrameRaidBrowserButton)
	AS:SkinButton(LFRBrowseFrameCopyNameButton)
	AS:SkinButton(LFRBrowseFrameCreateRaidButton)
	LFRBrowseFrameColumnHeader8:DisableDrawLayer('BACKGROUND')
end

AS:RegisterSkin(name, AS.SkinLFRAdvanced)