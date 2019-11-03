if AddOnSkins.Classic then return end
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

	AS:Kill(GarrisonCapacitiveDisplayFramePortrait)
	GarrisonCapacitiveDisplayFrameLeft:SetTexture()
	GarrisonCapacitiveDisplayFrameMiddle:SetTexture()
	GarrisonCapacitiveDisplayFrameRight:SetTexture()

	GarrisonCapacitiveDisplayFrame.CapacitiveDisplay.IconBG:SetTexture()
	AS:SkinTexture(GarrisonCapacitiveDisplayFrame.CapacitiveDisplay.ShipmentIconFrame.Icon)
	AS:SetInside(GarrisonCapacitiveDisplayFrame.CapacitiveDisplay.ShipmentIconFrame.Icon)

	AS:SkinArrowButton(GarrisonCapacitiveDisplayFrame.DecrementButton, 'left')
	AS:SkinArrowButton(GarrisonCapacitiveDisplayFrame.IncrementButton, 'right')
	AS:SkinEditBox(GarrisonCapacitiveDisplayFrame.Count)

	hooksecurefunc('GarrisonCapacitiveDisplayFrame_Update', function(self)
		for _, Reagent in ipairs(self.CapacitiveDisplay.Reagents) do
			if not Reagent.Backdrop then
				Reagent.NameFrame:SetTexture('')
				AS:SkinTexture(Reagent.Icon, true)
				AS:CreateBackdrop(Reagent)
				Reagent.Backdrop:SetPoint('TOPLEFT', Reagent.Icon, 'TOPRIGHT', -1, 0)
				Reagent.Backdrop:SetPoint('BOTTOMLEFT', Reagent.Icon, 'BOTTOMRIGHT', -1, 0)
				Reagent.Backdrop:SetPoint('RIGHT', Reagent, 'RIGHT', -5, 0)
			end
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_ItemUpgradeUI(event, addon)
	if addon ~= 'Blizzard_ItemUpgradeUI' then return end

	AS:SkinFrame(ItemUpgradeFrame)
	--AS:Kill(ItemUpgradeFrameShadows)

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

	AS:StripTextures(ItemUpgradeFrameMoneyFrame)
	AS:SkinButton(ItemUpgradeFrameUpgradeButton, true)
	AS:Kill(ItemUpgradeFrame.FinishedGlow)
	ItemUpgradeFrame.ButtonFrame:DisableDrawLayer('BORDER')

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_GarrisonUI', AS.Blizzard_GarrisonUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_ItemUpgradeUI", AS.Blizzard_ItemUpgradeUI, 'ADDON_LOADED')
