local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Symbiosis') then return end

local name = 'SymbiosisSkin'
function AS:SkinSymbiosis()
	AS:Delay(4, function()
		SymbiosisButton:SetTemplate()
		SymbiosisButton:StyleButton()
		AS:SkinTexture(SymbiosisButton.icon)
		SymbiosisButton.icon:SetInside()
	end)
end

AS:RegisterSkin(name, AS.SkinSymbiosis)