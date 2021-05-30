local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AppearanceTooltip') then return end

function AS:AppearanceTooltip()
	AS:SkinBackdropFrame(AppearanceTooltipTooltip)
	AS:SetInside(AppearanceTooltipTooltip.Backdrop)
end

AS:RegisterSkin('AppearanceTooltip', AS.AppearanceTooltip)
