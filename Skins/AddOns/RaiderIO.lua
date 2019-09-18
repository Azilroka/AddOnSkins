local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('RaiderIO') then return end

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:RaiderIO()
	AS:SkinTooltip(RaiderIO_CustomDropDownListMenuBackdrop)
	_G.RaiderIO_ProfileTooltip:SetScript("OnShow", function()
		AS:SkinTooltip(_G.RaiderIO_ProfileTooltip)
	end)
end

AS:RegisterSkin('RaiderIO', AS.RaiderIO)
