if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Merchant()
	AS:SkinFrame(MerchantFrame, nil, nil, true)
	AS:SkinCloseButton(MerchantFrame.CloseButton)

	AS:StripTextures(MerchantMoneyBg)
	AS:StripTextures(MerchantMoneyInset)
	AS:SkinDropDownBox(MerchantFrameLootFilter)

	AS:StripTextures(MerchantExtraCurrencyBg)
	AS:StripTextures(MerchantExtraCurrencyInset)

	for i = 1, 2 do
		AS:SkinTab(_G["MerchantFrameTab"..i])
	end

	for i = 1, 12 do
		local Slot = _G["MerchantItem"..i]
		AS:SkinBackdropFrame(Slot, nil, nil, true)
		AS:SkinFrame(Slot.ItemButton)
		AS:StyleButton(Slot.ItemButton)
		AS:SkinTexture(Slot.ItemButton.icon)
		AS:SetInside(Slot.ItemButton.icon)
		Slot.ItemButton:SetPoint("TOPLEFT", Slot, "TOPLEFT", 4, -4)
		Slot.ItemButton.IconBorder:SetAlpha(0)

		hooksecurefunc(Slot.ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b) Slot.ItemButton:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(Slot.ItemButton.IconBorder, 'Hide', function(self) Slot.ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:SetPoint("BOTTOMLEFT", Slot.ItemButton, "BOTTOMRIGHT", 3, 0)

		for j = 1, 3 do
			AS:SkinTexture(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"], true)
		end
	end

	AS:SkinBackdropFrame(MerchantBuyBackItem)
	AS:SetOutside(MerchantBuyBackItem.Backdrop, MerchantBuyBackItem, 6, 6)

	AS:SkinFrame(MerchantBuyBackItem.ItemButton)
	AS:StyleButton(MerchantBuyBackItem.ItemButton)
	AS:SkinTexture(MerchantBuyBackItem.ItemButton.icon)
	AS:SetInside(MerchantBuyBackItem.ItemButton.icon)
	MerchantBuyBackItem.ItemButton.IconBorder:SetAlpha(0)
	hooksecurefunc(MerchantBuyBackItem.ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b) MerchantBuyBackItem.ItemButton:SetBackdropBorderColor(r, g, b) end)
	hooksecurefunc(MerchantBuyBackItem.ItemButton.IconBorder, 'Hide', function(self) MerchantBuyBackItem.ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

	AS:SkinButton(MerchantRepairItemButton)
	local RepairTexture = MerchantRepairItemButton:GetRegions()
	RepairTexture:SetTexCoord(0.04, 0.24, 0.06, 0.5)
	AS:SetInside(RepairTexture)

	AS:SkinButton(MerchantGuildBankRepairButton)
	MerchantGuildBankRepairButtonIcon:SetTexCoord(0.61, 0.82, 0.1, 0.52)
	AS:SetInside(MerchantGuildBankRepairButtonIcon)

	AS:SkinButton(MerchantRepairAllButton)
	MerchantRepairAllIcon:SetTexCoord(0.34, 0.1, 0.34, 0.535, 0.535, 0.1, 0.535, 0.535)
	AS:SetInside(MerchantRepairAllIcon)

	MerchantFrame:SetWidth(345)
	AS:SkinArrowButton(MerchantNextPageButton)
	AS:SkinArrowButton(MerchantPrevPageButton)

	hooksecurefunc('MerchantFrame_UpdateMerchantInfo', function()
		for i = 1, MERCHANT_ITEMS_PER_PAGE do
			local Frame = _G["MerchantItem"..i.."AltCurrencyFrame"]
			local Point = Frame:GetPoint()
			if Point == "BOTTOMLEFT" then
				Frame:SetPoint("BOTTOMLEFT", _G["MerchantItem"..i.."NameFrame"], "BOTTOMLEFT", 2, 35)
			elseif Point == "LEFT" then
				Frame:SetPoint("LEFT", _G["MerchantItem"..i.."MoneyFrame"], "RIGHT", -14, 0)
			end
		end
	end)

	hooksecurefunc('MerchantFrame_UpdateCurrencyButton', function(tokenButton)
		AS:SkinTexture(tokenButton.icon)
	end)
end

function AS:Blizzard_StackSplit()
	AS:SkinFrame(StackSplitFrame)
	AS:CreateShadow(StackSplitFrame)
	AS:SkinButton(StackSplitFrame.OkayButton)
	AS:SkinButton(StackSplitFrame.CancelButton)
	AS:SkinArrowButton(StackSplitFrame.LeftButton)
	AS:SkinArrowButton(StackSplitFrame.RightButton)
end

AS:RegisterSkin('Blizzard_Merchant', AS.Blizzard_Merchant)
AS:RegisterSkin('Blizzard_StackSplit', AS.Blizzard_StackSplit)
