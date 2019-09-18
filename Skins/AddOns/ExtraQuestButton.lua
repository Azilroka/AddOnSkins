local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtraQuestButton') then return end

function AS:ExtraQuestButton()
	AS:SkinButton(ExtraQuestButton)
	ExtraQuestButton:SetTemplate("Transparent")
	AS:Kill(ExtraQuestButton.Artwork)
	AS:SkinTexture(ExtraQuestButton.Icon)
	ExtraQuestButton.Icon:SetInside()
	ExtraQuestButton:SetCheckedTexture("")
	ExtraQuestButton.HotKey:ClearAllPoints()
	ExtraQuestButton.HotKey:Point('TOP', ExtraQuestButton, 'TOP', 0, -1)
end

AS:RegisterSkin('ExtraQuestButton', AS.ExtraQuestButton)
