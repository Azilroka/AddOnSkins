local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Foglight') then return end

function AS:Foglight()
	AS:SkinDropDownBox(foglightmenu)

	--Reposition Menu
	foglightmenu:ClearAllPoints()
	foglightmenu:Point('TOPLEFT', -19, 3)
end

AS:RegisterSkin('Foglight', AS.Foglight)