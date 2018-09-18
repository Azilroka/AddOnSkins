local AS = unpack(AddOnSkins)

function AS:Blizzard_VoidStorage(event, addon)
	if addon ~= "Blizzard_VoidStorageUI" then return end

	AS:SkinFrame(VoidStorageFrame)
	AS:CreateShadow(VoidStorageFrame)

	AS:SkinFrame(VoidStoragePurchaseFrame)
	VoidStoragePurchaseFrame:SetFrameLevel(VoidStorageFrame:GetFrameLevel() + 10)

	AS:StripTextures(VoidStorageBorderFrame)
	AS:StripTextures(VoidStorageDepositFrame)
	AS:StripTextures(VoidStorageWithdrawFrame)
	AS:StripTextures(VoidStorageCostFrame)
	AS:StripTextures(VoidStorageStorageFrame)

	AS:SkinButton(VoidStoragePurchaseButton)
	AS:SkinButton(VoidStorageHelpBoxButton)
	AS:SkinButton(VoidStorageTransferButton)

	AS:SkinCloseButton(VoidStorageBorderFrame.CloseButton)
	AS:SkinEditBox(VoidItemSearchBox)

	for _, Frame in pairs({ 'Page1', 'Page2' }) do
		AS:SkinButton(VoidStorageFrame[Frame], true)
		AS:StyleButton(VoidStorageFrame[Frame])
		AS:SkinTexture(VoidStorageFrame[Frame]:GetNormalTexture())
		VoidStorageFrame[Frame]:GetNormalTexture():SetInside()
	end

	VoidStorageFrame.Page1:SetNormalTexture("Interface\\Icons\\INV_Enchant_EssenceCosmicGreater")
	VoidStorageFrame.Page1:SetPoint("LEFT", "$parent", "TOPRIGHT", 1, -60)

	VoidStorageFrame.Page2:SetNormalTexture("Interface\\Icons\\INV_Enchant_EssenceArcaneLarge")

	for StorageType, NumSlots  in pairs({ ['Deposit'] = 9, ['Withdraw'] = 9, ['Storage'] = 80 }) do
		for i = 1, NumSlots do
			local Button = _G["VoidStorage"..StorageType.."Button"..i]
			AS:SkinFrame(Button)
			AS:StyleButton(Button)
			AS:SkinTexture(Button.icon)
			Button.icon:SetInside()
			Button.IconBorder:SetAlpha(0)
			hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:SkinFrame(SideDressUpFrame, nil, nil, true)
	VoidStorageFrame:HookScript('OnShow', function(self) SideDressUpFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 2, -15) end)
	AS:SkinButton(SideDressUpModelResetButton)
	AS:SkinCloseButton(SideDressUpModelCloseButton)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_VoidStorage", AS.Blizzard_VoidStorage, 'ADDON_LOADED')
