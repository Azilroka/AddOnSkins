local AS = unpack(AddOnSkins)

function AS:Blizzard_VoidStorage(event, addon)
	if addon ~= "Blizzard_VoidStorageUI" then return end

	AS:StripTextures(VoidStorageBorderFrame)
	AS:StripTextures(VoidStorageDepositFrame)
	AS:StripTextures(VoidStorageWithdrawFrame)
	AS:StripTextures(VoidStorageCostFrame)
	AS:StripTextures(VoidStorageStorageFrame)

	VoidStoragePurchaseFrame:SetFrameLevel(VoidStorageFrame:GetFrameLevel() + 10)

	AS:SkinFrame(VoidStorageFrame)
	VoidStorageFrame:CreateShadow()
	AS:SkinFrame(VoidStoragePurchaseFrame)

	AS:SkinButton(VoidStoragePurchaseButton)
	AS:SkinButton(VoidStorageHelpBoxButton)
	AS:SkinButton(VoidStorageTransferButton)

	-- dress
	AS:SkinFrame(SideDressUpFrame, nil, nil, true)
	VoidStorageFrame:HookScript('OnShow', function(self)
		SideDressUpFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 2, -15)
	end)
	AS:SkinButton(SideDressUpModelResetButton)
	AS:SkinCloseButton(SideDressUpModelCloseButton)

	AS:SkinCloseButton(VoidStorageBorderFrame.CloseButton)
	AS:SkinEditBox(VoidItemSearchBox)

	AS:SkinButton(VoidStorageFrame.Page1, true)
	AS:StyleButton(VoidStorageFrame.Page1)
	VoidStorageFrame.Page1:SetNormalTexture("Interface\\Icons\\INV_Enchant_EssenceCosmicGreater")
	VoidStorageFrame.Page1:SetPoint("LEFT", "$parent", "TOPRIGHT", 2, -60)
	AS:SkinTexture(VoidStorageFrame.Page1:GetNormalTexture())
	VoidStorageFrame.Page1:GetNormalTexture():SetInside()

	AS:SkinButton(VoidStorageFrame.Page2, true)
	AS:StyleButton(VoidStorageFrame.Page2)
	VoidStorageFrame.Page2:SetNormalTexture("Interface\\Icons\\INV_Enchant_EssenceArcaneLarge")
	AS:SkinTexture(VoidStorageFrame.Page2:GetNormalTexture())
	VoidStorageFrame.Page2:GetNormalTexture():SetInside()

	for _, StorageType in pairs( {'Deposit', 'Withdraw'} ) do
		for i = 1, 9 do
			local Button = _G["VoidStorage"..StorageType.."Button"..i]
			_G["VoidStorage"..StorageType.."Button"..i.."Bg"]:Hide()
			AS:SkinFrame(Button, nil, true)
			AS:StyleButton(Button)
			AS:SkinTexture(Button.icon)
			Button.icon:SetInside()
			Button.IconBorder:SetAlpha(0)
			hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b)
				Button:SetBackdropBorderColor(r, g, b)
			end)
			hooksecurefunc(Button.IconBorder, 'Hide', function(self, r, g, b)
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end
	end

	for i = 1, 80 do
		local Button = _G["VoidStorageStorageButton"..i]
		_G["VoidStorageStorageButton"..i.."Bg"]:Hide()
		AS:SkinFrame(Button, nil, true)
		AS:StyleButton(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
		Button.IconBorder:SetAlpha(0)
		hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b)
			Button:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Button.IconBorder, 'Hide', function(self)
			Button:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
	end
end

AS:RegisterSkin("Blizzard_VoidStorage", AS.Blizzard_VoidStorage, 'ADDON_LOADED')