if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_RaidUI(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		AS:SkinFrame(RaidInfoFrame)
		AS:SkinScrollBar(RaidInfoScrollFrameScrollBar)
		AS:SkinCloseButton(RaidInfoCloseButton)

		AS:StripTextures(RaidInfoInstanceLabel)
		AS:StripTextures(RaidInfoIDLabel)
		AS:SkinButton(RaidFrameConvertToRaidButton)
		AS:SkinButton(RaidFrameRaidInfoButton)
		AS:SkinCheckBox(RaidFrameAllAssistCheckButton)
	end

	if addon ~= 'Blizzard_RaidUI' then return end

	for i = 1, 8 do
		AS:SkinFrame(_G["RaidGroup"..i])
		for j = 1, 5 do
			AS:StripTextures(_G["RaidGroup"..i.."Slot"..j])
		end
	end

	for i = 1, 40 do
		AS:SkinFrame(_G["RaidGroupButton"..i], 'Default')
	end

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_RaidUI", AS.Blizzard_RaidUI, 'ADDON_LOADED')
