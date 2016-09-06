local AS = unpack(AddOnSkins)

function AS:Blizzard_Garrison(event, addon)
	if (addon == 'Blizzard_GarrisonUI' or event == "PLAYER_ENTERING_WORLD" and IsAddOnLoaded('Blizzard_GarrisonUI')) then
		AS:SkinFrame(GarrisonMissionFrame, nil, nil, true)
		AS:StripTextures(GarrisonMissionFrame.GarrCorners)
		AS:SkinCloseButton(GarrisonMissionFrame.CloseButton)

		for i = 1, 2 do
			AS:SkinTab(_G["GarrisonMissionFrameTab"..i])
			AS:SkinTab(_G["GarrisonMissionFrameMissionsTab"..i])
		end

		AS:StripTextures(GarrisonMissionFrameMissions.MaterialFrame)
		GarrisonMissionFrameMissions.MaterialFrame.Icon:SetAtlas('GarrMission_CurrencyIcon-Material')
		AS:SkinScrollBar(GarrisonMissionFrameMissionsListScrollFrameScrollBar)
		AS:StripTextures(GarrisonMissionFrameMissions)

		AS:StripTextures(GarrisonCapacitiveDisplayFrame, nil, nil, true)
		AS:CreateBackdrop(GarrisonCapacitiveDisplayFrame)
		AS:StripTextures(GarrisonCapacitiveDisplayFrameInset)
		AS:SkinCloseButton(GarrisonCapacitiveDisplayFrame.CloseButton)
		AS:SkinButton(GarrisonCapacitiveDisplayFrame.StartWorkOrderButton, true)
		AS:SkinButton(GarrisonCapacitiveDisplayFrame.CreateAllWorkOrdersButton, true)

		GarrisonCapacitiveDisplayFramePortrait:Kill()
		GarrisonCapacitiveDisplayFrameLeft:SetTexture(nil)
		GarrisonCapacitiveDisplayFrameMiddle:SetTexture(nil)
		GarrisonCapacitiveDisplayFrameRight:SetTexture(nil)

		GarrisonCapacitiveDisplayFrame.CapacitiveDisplay.IconBG:SetTexture(nil)

		AS:SkinNextPrevButton(GarrisonCapacitiveDisplayFrame.DecrementButton)
		AS:SkinNextPrevButton(GarrisonCapacitiveDisplayFrame.IncrementButton)
		AS:SkinEditBox(GarrisonCapacitiveDisplayFrame.Count)
		AS:UnregisterSkinEvent('Blizzard_Garrison', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_Garrison', AS.Blizzard_Garrison, 'ADDON_LOADED')