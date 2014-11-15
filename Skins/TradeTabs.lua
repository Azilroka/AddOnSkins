local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TradeTabs') then return end

function AS:TradeTabs(event, addon)
	if addon ~= 'TradeTabs' then return end
	local Frame = ATSWFrame or MRTSkillFrame or SkilletFrame or TradeSkillFrame
	for i = 1, Frame:GetNumChildren() do
		local Child = select(i, Frame:GetChildren())
		if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
			AS:CreateBackdrop(Child)
			AS:SkinTexture(Child:GetNormalTexture())
			AS:StyleButton(Child)
			Child:DisableDrawLayer('BACKGROUND')
			Child.IsSkinned = true
		end
	end
end

AS:RegisterSkin('TradeTabs', AS.TradeTabs, 'ADDON_LOADED')