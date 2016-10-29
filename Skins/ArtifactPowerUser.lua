local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ArtifactPowerUser') then return end

function AS:ArtifactPowerUser(event, addon)
	if ArtifactPowerUserButton and not ArtifactPowerUserButton.IsSkinned then
		AS:SkinIconButton(ArtifactPowerUserButton)
		ArtifactPowerUserButton.icon:SetDrawLayer('OVERLAY')
		AS:UnregisterSkinEvent('ArtifactPowerUser', 'BAG_UPDATE_DELAYED')
		ArtifactPowerUserButton.IsSkinned = true
	end
end

AS:RegisterSkin('ArtifactPowerUser', AS.ArtifactPowerUser, 'BAG_UPDATE_DELAYED')