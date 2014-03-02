local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ProfessionTabs') then return end

local name = 'ProfessionTabsSkin'
function AS:SkinProfessionTabs(event, addon)
	if addon ~= 'Blizzard_TradeSkillUI' then return end
	local Frame = ATSWFrame or MRTSkillFrame or SkilletFrame or TradeSkillFrame
	Frame:HookScript('OnUpdate', function(self)
		for i = 1, self:GetNumChildren() do
			local Child = select(i, self:GetChildren())
			if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
				Child:CreateBackdrop()
				AS:SkinTexture(Child:GetNormalTexture())
				Child:StyleButton()
				Child:DisableDrawLayer('BACKGROUND')
				Child.IsSkinned = true
			end
		end
	end)
end

AS:RegisterSkin(name, AS.SkinProfessionTabs, 'ADDON_LOADED')
