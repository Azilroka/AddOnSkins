local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ProfessionTabs') then return end

local name = 'ProfessionTabsSkin'
function AS:SkinProfessionTabs(event, addon)
	function ProfessionTabs:CreateTab(Table, Parent)
		local Tab = CreateFrame('CheckButton', nil, Parent, 'SpellBookSkillLineTabTemplate SecureActionButtonTemplate')
		Tab:SetPoint('TOPLEFT', Parent, 'TOPRIGHT', (Parent == ATSWFrame or Parent == TradeFrame) and -32 or 2, (Parent == TradeFrame and -32 or -24) + -44 * #Table)
		AS:SkinIconButton(Tab)

		Tab:SetScript('OnEnter', Tab_OnEnter)
		Tab:SetScript('OnLeave', Tab_OnLeave)
		
		Table[#Table + 1] = Tab
		return Tab
	end
end

AS:RegisterSkin(name, AS.SkinProfessionTabs)
