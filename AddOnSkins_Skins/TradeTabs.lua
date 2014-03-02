local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TradeTabs') then return end

local name = 'TradeTabsSkin'
function AS:SkinTradeTabs(event, addon)
	if addon ~= 'TradeTabs' then return end
	local Frame = ATSWFrame or MRTSkillFrame or SkilletFrame or TradeSkillFrame
	for i = 1, Frame:GetNumChildren() do
		local Child = select(i, Frame:GetChildren())
		if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
			Child:CreateBackdrop()
			AS:SkinTexture(Child:GetNormalTexture())
			Child:StyleButton()
			Child:DisableDrawLayer('BACKGROUND')
			Child.IsSkinned = true
		end
	end
end

AS:RegisterSkin(name, AS.SkinTradeTabs, 'ADDON_LOADED')