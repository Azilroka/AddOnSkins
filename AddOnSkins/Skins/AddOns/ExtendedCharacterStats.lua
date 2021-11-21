local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtendedCharacterStats') then return end

function AS:ExtendedCharacterStats()

	-- Main frame
	ECS_StatsFrame:ClearAllPoints()
	ECS_StatsFrame:Point('RIGHT', _G.CharacterFrame, 149, 32)
	ECS_StatsFrame:SetHeight(424)
	AS:SkinFrame(ECS_StatsFrame)

	-- Misc buttons
	AS:SkinButton(ECS_StatsFrame.configButton)
	AS:SkinButton(ECS_ToggleButton)

	-- Close button
	AS:SkinCloseButton(ECS_StatsFrame.CloseButton)
	ECS_StatsFrame.CloseButton:ClearAllPoints()
	ECS_StatsFrame.CloseButton:Point('TOPRIGHT', ECS_StatsFrame, 1, 3)

	-- Scrollbar
	AS:SkinScrollBar(ECS_StatsFrame.ScrollFrame.ScrollBar)
	ECS_StatsFrame.ScrollFrame.ScrollBar:Point('RIGHT', ECS_StatsFrame, -1, -1)
end

AS:RegisterSkin('ExtendedCharacterStats', AS.ExtendedCharacterStats)
