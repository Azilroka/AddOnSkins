local AS, L, S, R = unpack(AddOnSkins)

function R:AppearanceTooltip()
	S:HandleFrame(AppearanceTooltipTooltip, true)
	S:SetInside(AppearanceTooltipTooltip.backdrop)
end

AS:RegisterSkin('AppearanceTooltip')
