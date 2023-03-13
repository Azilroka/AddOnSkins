local AS, L, S, R = unpack(AddOnSkins)

function R:ExtraQuestButton()
	S:HandleButton(ExtraQuestButton)
	ExtraQuestButton:SetTemplate("Transparent")
	S:Kill(ExtraQuestButton.Artwork)
	S:HandleIcon(ExtraQuestButton.Texture)
	S:SetInside(ExtraQuestButton.Texture)
	ExtraQuestButton:SetCheckedTexture("")
	ExtraQuestButton.Hotkey:ClearAllPoints()
	ExtraQuestButton.Hotkey:SetPoint('TOPRIGHT', ExtraQuestButton, 'TOPRIGHT', -1, -3)
end

AS:RegisterSkin('ExtraQuestButton')
