local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ProfessionTabs') then return end

local name = 'ProfessionTabsSkin'
function AS:SkinProfessionTabs(event, addon)
	local Frame = ATSWFrame or MRTSkillFrame or SkilletFrame or TradeSkillFrame
	Frame:HookScript('OnShow', function(self)
		for i = 1, self:GetNumChildren() do
			local Child = select(i, self:GetChildren())
			if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
				AS:SkinIconButton(Child)
				Child.IsSkinned = true
			end
		end
	end)
end

AS:RegisterSkin(name, AS.SkinProfessionTabs)
