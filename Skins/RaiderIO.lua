local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaiderIO') then return end

function AS:RaiderIO()
	RaiderIO_ProfileTooltip:SetScript("OnShow", function()
				AS:SkinTooltip(RaiderIO_ProfileTooltip)
	end)
end

AS:RegisterSkin('RaiderIO', AS.RaiderIO)
