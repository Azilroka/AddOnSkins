local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtraQuestButton') then return end

function AS:ExtraQuestButton()
	AS:SkinButton(ExtraQuestButton)
	ExtraQuestButton:SetTemplate("Transparent")
	AS:Kill(ExtraQuestButton.Artwork)
	AS:SkinTexture(ExtraQuestButton.Icon)
	AS:SetInside(ExtraQuestButton.Icon)
	ExtraQuestButton:SetCheckedTexture("")
	ExtraQuestButton.HotKey:ClearAllPoints()
	ExtraQuestButton.HotKey:SetPoint('TOP', ExtraQuestButton, 'TOP', 0, -1)
end

AS:RegisterSkin('ExtraQuestButton', AS.ExtraQuestButton)
