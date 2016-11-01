local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('OneClickEnchantScroll') then return end

function AS:OneClickEnchantScroll(event, addon)
	if addon == 'OneClickEnchantScroll' or event == 'TRADE_SKILL_SHOW' then
		AS:SkinButton(TradeSkillCreateScrollButton, true)
		TradeSkillCreateScrollButton:ClearAllPoints()
		TradeSkillCreateScrollButton:SetPoint('RIGHT', TradeSkillFrame.DetailsFrame.CreateButton, 'LEFT', -2, 0)
		AS:UnregisterSkinEvent('OneClickEnchantScroll', 'ADDON_LOADED')
		AS:UnregisterSkinEvent('OneClickEnchantScroll', 'TRADE_SKILL_SHOW')
	end
end

AS:RegisterSkin('OneClickEnchantScroll', AS.OneClickEnchantScroll, 'ADDON_LOADED', 'TRADE_SKILL_SHOW')