local AS = unpack(AddOnSkins)

function AS:Blizzard_RaidUI(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		AS:SkinButton(RaidFrameConvertToRaidButton)
		AS:SkinButton(RaidFrameRaidInfoButton)
		AS:SkinCheckBox(RaidFrameAllAssistCheckButton)

		AS:SkinFrame(RaidInfoFrame)
		AS:SkinScrollBar(RaidInfoScrollFrameScrollBar)
		AS:SkinCloseButton(RaidInfoCloseButton)
		AS:SkinButton(RaidInfoExtendButton)
		AS:SkinButton(RaidInfoCancelButton)
		AS:StripTextures(RaidInfoInstanceLabel)
		AS:StripTextures(RaidInfoIDLabel)
	end
	if addon == 'Blizzard_RaidUI' or IsAddOnLoaded('Blizzard_RaidUI') then
		for i = 1, 8 do
			AS:SkinFrame(_G["RaidGroup"..i])
			for j = 1, 5 do
				AS:StripTextures(_G["RaidGroup"..i.."Slot"..j])
			end
		end

		for i = 1, 40 do
			AS:SkinFrame(_G["RaidGroupButton"..i], 'Default')
		end
		AS:UnregisterSkinEvent("Blizzard_RaidUI", 'ADDON_LOADED')
	end
end

AS:RegisterSkin("Blizzard_RaidUI", AS.Blizzard_RaidUI, 'ADDON_LOADED')
