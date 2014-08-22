local AS, ASL = unpack(AddOnSkins)

function AS:UpdateLocale()
	local Locale = GetLocale()

	ASL.EmbedSystem = {}
	ASL.OptionsPanel = {}
	ASL.DataText = {}

	if Locale == "esMX" then
		Locale = "esES"
	end

	AS['UpdateLocale_'..Locale]()
end