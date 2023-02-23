local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('AppearanceTooltip') then return end

function R:AppearanceTooltip()
	S:HandleFrame(AppearanceTooltipTooltip, true)
	S:SetInside(AppearanceTooltipTooltip.backdrop)
end

AS:RegisterSkin('AppearanceTooltip', R.AppearanceTooltip)
