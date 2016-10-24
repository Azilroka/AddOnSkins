local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ArtifactPowerUser') then return end

function AS:ArtifactPowerUser(event, addon)
	AS:SkinIconButton(ArtifactPowerUserButton)
	ArtifactPowerUserButton.icon:SetDrawLayer('OVERLAY')
end

AS:RegisterSkin('ArtifactPowerUser', AS.ArtifactPowerUser)