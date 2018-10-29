local AS = unpack(AddOnSkins)

function AS:Blizzard_GarrisonUI(event, addon)
	if addon ~= 'Blizzard_GarrisonUI' then return end

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

	AS:SkinArrowButton(GarrisonCapacitiveDisplayFrame.DecrementButton)
	AS:SkinArrowButton(GarrisonCapacitiveDisplayFrame.IncrementButton)
	AS:SkinEditBox(GarrisonCapacitiveDisplayFrame.Count)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_ItemUpgradeUI(event, addon)
	if addon ~= 'Blizzard_ItemUpgradeUI' then return end

	AS:SkinFrame(ItemUpgradeFrame)
	--ItemUpgradeFrameShadows:Kill()
	--ItemUpgradeFrameInset:Kill()

	AS:SkinCloseButton(ItemUpgradeFrameCloseButton)

	AS:SkinIconButton(ItemUpgradeFrame.ItemButton, true)

	hooksecurefunc('ItemUpgradeFrame_Update', function()
		if GetItemUpgradeItemInfo() then
			ItemUpgradeFrame.ItemButton.IconTexture:SetAlpha(1)
			AS:SkinTexture(ItemUpgradeFrame.ItemButton.IconTexture)
		else
			ItemUpgradeFrame.ItemButton.IconTexture:SetAlpha(0)
		end
	end)

	ItemUpgradeFrameMoneyFrame:StripTextures()
	AS:SkinButton(ItemUpgradeFrameUpgradeButton, true)
	ItemUpgradeFrame.FinishedGlow:Kill()
	ItemUpgradeFrame.ButtonFrame:DisableDrawLayer('BORDER')

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_GarrisonUI', AS.Blizzard_GarrisonUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_ItemUpgradeUI", AS.Blizzard_ItemUpgradeUI, 'ADDON_LOADED')