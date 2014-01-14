local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('OneClickEnchantScroll') then return end

local name = "OneClickEnchantScrollSkin"
function AS:SkinOneClickEnchantScroll()
	AS:SkinButton(TradeSkillCreateScrollButton, true)
	TradeSkillCreateScrollButton:ClearAllPoints()
	TradeSkillCreateScrollButton:Point("RIGHT", TradeSkillCreateButton, "LEFT", -2, 0)
end

AS:RegisterSkin(name, AS.SkinOneClickEnchantScroll)