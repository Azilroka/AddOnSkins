local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "GuildMemberInfo_TradeSkillsSkin"
function AS:SkinGuildMemberInfo_TradeSkills()
	AS:SkinFrame(GMIFrame)
	AS:SkinIconButton(GMItsButton1, true)
	AS:SkinIconButton(GMItsButton2, true)
	GMItsIcon1:SetTexCoord(0.12, 0.88, 0.12, 0.88)
	GMItsIcon2:SetTexCoord(0.12, 0.88, 0.12, 0.88)
end
AS:RegisterSkin(name, AS.SkinGuildMemberInfo_TradeSkills)