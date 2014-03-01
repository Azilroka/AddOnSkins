local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TradeTabs') then return end

local name = 'TradeTabsSkin'
function AS:SkinTradeTabs(event, addon)
	hooksecurefunc(TradeTabs, 'CreateTab', function(self, i, parent, spellID)
		AS:SkinIconButton(_G["TradeTabsTab"..i])
		_G["TradeTabsTab"..i]:SetNormalTexture(select(3, GetSpellInfo(spellID)))
	end)
end

AS:RegisterSkin(name, AS.SkinTradeTabs)