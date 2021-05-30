local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtendedCharacterStats') then return end

function AS:ExtendedCharacterStats()
	AS:SkinFrame(ECS_StatsFrame)
	AS:SkinButton(ECS_StatsFrame.configButton)
	AS:SkinButton(ECS_ToggleButton)
	AS:SkinCloseButton(ECS_StatsFrame.CloseButton)
	AS:SkinScrollBar(ECS_StatsFrame.ScrollFrame.ScrollBar)
	ECS_StatsFrame.ScrollFrame.ScrollBar:Point('Right', ECS_StatsFrame, -1, -1)
end

AS:RegisterSkin('ExtendedCharacterStats', AS.ExtendedCharacterStats)
