local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GuildMemberInfo_TradeSkills') then return end

function AS:GuildMemberInfo_TradeSkills()
	AS:SkinFrame(GMIFrame)
	AS:SkinIconButton(GMItsButton1)
	AS:SkinIconButton(GMItsButton2)
	AS:SkinTexture(GMItsIcon1)
	AS:SkinTexture(GMItsIcon2)
end

AS:RegisterSkin('GuildMemberInfo_TradeSkills', AS.GuildMemberInfo_TradeSkills)