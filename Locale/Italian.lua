local AS, ASL = unpack(AddOnSkins)

function AS:UpdateLocale_itIT()
	ASL.DataText.Toggle = "Alterna"
	ASL.DataText.Embed = "Integra"

	ASL.EmbedSystem.ToggleLeftChat = "Alterna Pannello Sinistro della Chat"
	ASL.EmbedSystem.ToggleRightChat = "Alterna Pannello Destro della Chat"
	ASL.EmbedSystem.ToggleEmbed = "Alterna Integrazione dell AddOn"
	ASL.EmbedSystem.ToggleOptions = "Alterna Customizzazioni/Opzioni Aggiuntive"

	ASL.OptionsPanel.SkinDesc = "Abilita/Disabilita questa customizzazione."
	ASL.OptionsPanel.EmbedDesc = "Abilita/Disabilita questa integrazione."
	ASL.OptionsPanel.OptionDesc = "Abilita/Disabilita questa opzione."
end