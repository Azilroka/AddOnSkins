local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('RaiderIO') then return end

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:RaiderIO()
	if _G.RaiderIO_CustomDropDownListMenuBackdrop then
		AS:SkinTooltip(_G.RaiderIO_CustomDropDownListMenuBackdrop)
	end

	_G.PVEFrame:HookScript("OnShow", function(self)
		if not _G.RaiderIOProfileTooltip.IsSkinned then
			AS:SkinFrame(_G.RaiderIOProfileTooltip)

			_G.RaiderIOProfileTooltip.IsSkinned = true
		end
	end)
end

AS:RegisterSkin('RaiderIO', AS.RaiderIO)
