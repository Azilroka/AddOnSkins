local AS, L, S, R = unpack(AddOnSkins)

function R:ExtendedCharacterStats()
	-- Main frame
	ECS_StatsFrame:ClearAllPoints()
	ECS_StatsFrame:Point('RIGHT', _G.CharacterFrame, 149, 32)
	ECS_StatsFrame:SetHeight(424)
	S:HandleFrame(ECS_StatsFrame)

	-- Misc buttons
	S:HandleButton(ECS_StatsFrame.configButton)
	S:HandleButton(ECS_ToggleButton)

	-- Close button
	S:HandleCloseButton(ECS_StatsFrame.CloseButton)
	ECS_StatsFrame.CloseButton:ClearAllPoints()
	ECS_StatsFrame.CloseButton:Point('TOPRIGHT', ECS_StatsFrame, 1, 3)

	-- Scrollbar
	S:HandleScrollBar(ECS_StatsFrame.ScrollFrame.ScrollBar)
	ECS_StatsFrame.ScrollFrame.ScrollBar:Point('RIGHT', ECS_StatsFrame, -1, -1)
end

AS:RegisterSkin('ExtendedCharacterStats')
