local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtraQuestButton') then return end

function AS:ExtraQuestButton()
	AS:SkinButton(ExtraQuestButton)
	ExtraQuestButton:SetTemplate("Transparent")
	AS:Kill(ExtraQuestButton.Artwork)
	AS:SkinTexture(ExtraQuestButton.Texture)
	AS:SetInside(ExtraQuestButton.Texture)
	ExtraQuestButton:SetCheckedTexture("")
	ExtraQuestButton.Hotkey:ClearAllPoints()
	ExtraQuestButton.Hotkey:SetPoint('TOPRIGHT', ExtraQuestButton, 'TOPRIGHT', -1, -3)
end

AS:RegisterSkin('ExtraQuestButton', AS.ExtraQuestButton)