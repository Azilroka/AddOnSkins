local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DoubleWideTradeSkills') then return end

local name = 'DoubleWideTradeSkillsSkin'
function AS:SkinDoubleWideTradeSkills(event, addon)
	if addon ~= 'DoubleWideTradeSkills' then return end
	AS:SkinFrame(TradeSkillFrame)
	AS:SkinStatusBar(TradeSkillRankFrame)
	TradeSkillListScrollFrame:StripTextures()
end

AS:RegisterSkin(name, AS.SkinDoubleWideTradeSkills, 'ADDON_LOADED')