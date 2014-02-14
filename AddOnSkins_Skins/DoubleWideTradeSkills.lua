local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DoubleWideTradeSkills') then return end

local name = 'DoubleWideTradeSkillsSkin'
function AS:SkinDoubleWideTradeSkills(event, addon)
	TradeSkillListScrollFrame:StripTextures()
	AS:SkinFrame(TradeSkillFrame)
	AS:SkinStatusBar(TradeSkillRankFrame)
end

AS:RegisterSkin(name, AS.SkinDoubleWideTradeSkills)