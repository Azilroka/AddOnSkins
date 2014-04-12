local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('OneClickEnchantScroll') then return end

local name = 'OneClickEnchantScrollSkin'
function AS:SkinOneClickEnchantScroll(event, addon)
	if addon == 'OneClickEnchantScroll' or event == 'TRADE_SKILL_SHOW' then
		AS:SkinButton(TradeSkillCreateScrollButton, true)
		TradeSkillCreateScrollButton:ClearAllPoints()
		TradeSkillCreateScrollButton:Point('RIGHT', TradeSkillCreateButton, 'LEFT', -2, 0)
		AS:UnregisterSkinEvent(name, 'ADDON_LOADED')
		AS:UnregisterSkinEvent(name, 'TRADE_SKILL_SHOW')
	end
end

AS:RegisterSkin(name, AS.SkinOneClickEnchantScroll, 'ADDON_LOADED', 'TRADE_SKILL_SHOW')