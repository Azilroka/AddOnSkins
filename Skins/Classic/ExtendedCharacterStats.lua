
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtendedCharacterStats') then return end

function AS:ExtendedCharacterStats()
	AS:SkinFrame(ECS_StatsFrame)
	AS:SkinCloseButton(ECS_StatsFrame.CloseButton)
	AS:SkinScrollBar(ECSMainWindow.ScrollFrame.ScrollBar)
end

AS:RegisterSkin('ExtendedCharacterStats', AS.ExtendedCharacterStats)
