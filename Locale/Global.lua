local AS = unpack(AddOnSkins)

function AS:UpdateLocale()
	local Locale = GetLocale()

	AS['UpdateLocale_'..Locale]()
end