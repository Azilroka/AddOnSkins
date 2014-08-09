local AS = unpack(AddOnSkins)

function AS:UpdateLocale()
	local Locale = GetLocale()

	if Locale == "esMX" then
		Locale = "esES"
	end

	AS['UpdateLocale_'..Locale]()
end