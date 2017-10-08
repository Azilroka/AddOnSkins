local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtraQuestButton') then return end

function AS:ExtraQuestButton()
	AS:SkinButton(ExtraQuestButton)
	ExtraQuestButton:SetTemplate("Transparent")
	ExtraQuestButtonArtwork:Kill()
	ExtraQuestButtonHotKey:ClearAllPoints()
	ExtraQuestButtonHotKey:Point('TOP', ExtraQuestButton, 'TOP', 0, -1)
end

AS:RegisterSkin('ExtraQuestButton', AS.ExtraQuestButton)