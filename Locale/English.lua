local AS, ASL = unpack(AddOnSkins)

function AS:UpdateLocale_enUS()
	ASL.DataText.Toggle = 'Toggle'
	ASL.DataText.Embed = 'Embed'

	ASL.EmbedSystem.ToggleLeftChat = 'Toggle Left Chat Panel'
	ASL.EmbedSystem.ToggleRightChat = 'Toggle Right Chat Panel'
	ASL.EmbedSystem.ToggleEmbed = 'Toggle Embedded AddOn'
	ASL.EmbedSystem.ToggleOptions = 'Toggle Extra Skins/Options'

	ASL.OptionsPanel.SkinDesc = 'Enable/Disable this skin.'
	ASL.OptionsPanel.EmbedDesc = 'Enable/Disable this embed.'
	ASL.OptionsPanel.OptionDesc = 'Enable/Disable this option.'
	ASL.OptionsPanel.MiscellaneousOptions = 'Miscellaneous Options'
end