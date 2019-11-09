local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtendedCharacterStats') then return end

function AS:ExtendedCharacterStats()
	AS:SkinFrame(ECS_StatsFrame)
	AS:SkinCloseButton(ECS_StatsFrame.CloseButton)
	AS:SkinScrollBar(ECS_StatsFrame.ScrollFrame.ScrollBar)
end

AS:RegisterSkin('ExtendedCharacterStats', AS.ExtendedCharacterStats)
