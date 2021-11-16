local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtendedCharacterStats') then return end

function AS:ExtendedCharacterStats()
	ECS_StatsFrame:ClearAllPoints()
	ECS_StatsFrame:Point('Right', _G.CharacterFrame, 169, 32)
	ECS_StatsFrame:SetHeight(424)
	AS:SkinFrame(ECS_StatsFrame)
	AS:SkinButton(ECS_StatsFrame.configButton)
	AS:SkinButton(ECS_ToggleButton)
	AS:SkinCloseButton(ECS_StatsFrame.CloseButton)
	AS:SkinScrollBar(ECS_StatsFrame.ScrollFrame.ScrollBar)
	ECS_StatsFrame.ScrollFrame.ScrollBar:Point('Right', ECS_StatsFrame, -1, -1)
end

AS:RegisterSkin('ExtendedCharacterStats', AS.ExtendedCharacterStats)
