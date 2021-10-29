local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('RaiderIO') then return end

local _G = _G

function AS:RaiderIO()
	if _G.RaiderIO_CustomDropDownListMenuBackdrop then
		AS:SkinTooltip(_G.RaiderIO_CustomDropDownListMenuBackdrop)
	end

	_G.PVEFrame:HookScript("OnShow", function(self)
		if not _G.RaiderIO_ProfileTooltip.IsSkinned then
			AS:SkinFrame(_G.RaiderIO_ProfileTooltip)

			_G.RaiderIO_ProfileTooltip.IsSkinned = true
		end
	end)
end

AS:RegisterSkin('RaiderIO', AS.RaiderIO)
