local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:RaiderIO()
	if _G.RaiderIO_CustomDropDownListMenuBackdrop then
		S:HandleTooltip(_G.RaiderIO_CustomDropDownListMenuBackdrop)
	end

	if _G.Raiderio_CustomDropDownListMenuBackdrop then
		S:HandleTooltip(_G.Raiderio_CustomDropDownListMenuBackdrop)
	end


	_G.PVEFrame:HookScript("OnShow", function(self)
		if _G.Raiderio_ProfileTooltip and not _G.Raiderio_ProfileTooltip.IsSkinned then
			S:HandleFrame(_G.Raiderio_ProfileTooltip)

			_G.Raiderio_ProfileTooltip.IsSkinned = true
		end
		if _G.RaiderIO_ProfileTooltip and not _G.RaiderIO_ProfileTooltip.IsSkinned then
			S:HandleFrame(_G.RaiderIO_ProfileTooltip)

			_G.RaiderIO_ProfileTooltip.IsSkinned = true
		end
	end)
end

AS:RegisterSkin('RaiderIO')
