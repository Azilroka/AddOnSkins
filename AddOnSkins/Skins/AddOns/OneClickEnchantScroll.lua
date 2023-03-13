local AS, L, S, R = unpack(AddOnSkins)

function R:OneClickEnchantScroll(_, addon)
	if addon == 'OneClickEnchantScroll' then
		S:HandleButton(TradeSkillCreateScrollButton, true)
		TradeSkillCreateScrollButton:ClearAllPoints()
		TradeSkillCreateScrollButton:SetPoint('RIGHT', TradeSkillFrame.DetailsFrame.CreateButton, 'LEFT', -2, 0)
		AS:UnregisterSkinEvent('OneClickEnchantScroll', 'ADDON_LOADED')
		AS:UnregisterSkinEvent('OneClickEnchantScroll', 'TRADE_SKILL_SHOW')
	end
end

AS:RegisterSkin('OneClickEnchantScroll', nil, 'ADDON_LOADED')
