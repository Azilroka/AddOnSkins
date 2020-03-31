local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AutoCarrot') then return end

function AS:AutoCarrot()
	AS:SkinIconButton(AutoCarrotButton)
end

AS:RegisterSkin('AutoCarrot', AS.AutoCarrot)