local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('OneClickEnchantScroll') then return end

function R:OneClickEnchantScroll(event, addon)
	if addon == 'OneClickEnchantScroll' then
		S:HandleButton(TradeSkillCreateScrollButton, true)
		TradeSkillCreateScrollButton:ClearAllPoints()
		TradeSkillCreateScrollButton:SetPoint('RIGHT', TradeSkillFrame.DetailsFrame.CreateButton, 'LEFT', -2, 0)
		AS:UnregisterSkinEvent('OneClickEnchantScroll', 'ADDON_LOADED')
		AS:UnregisterSkinEvent('OneClickEnchantScroll', 'TRADE_SKILL_SHOW')
	end
end

AS:RegisterSkin('OneClickEnchantScroll', R.OneClickEnchantScroll, 'ADDON_LOADED')
