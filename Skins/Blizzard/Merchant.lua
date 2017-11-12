local AS = unpack(AddOnSkins)

function AS:Blizzard_Merchant()
	AS:SkinFrame(MerchantFrame, nil, nil, true)

	AS:StripTextures(MerchantFrameInset)
	AS:StripTextures(MerchantMoneyBg)
	AS:StripTextures(MerchantMoneyInset)
	AS:SkinDropDownBox(MerchantFrameLootFilter)

	AS:StripTextures(MerchantExtraCurrencyBg)
	AS:StripTextures(MerchantExtraCurrencyInset)

	-- skin tabs
	for i = 1, 2 do
		AS:SkinTab(_G["MerchantFrameTab"..i])
	end

	for i = 1, 12 do
		local Slot = _G["MerchantItem"..i]
		local Button = _G["MerchantItem"..i.."ItemButton"]
		AS:SkinBackdropFrame(Slot, nil, nil, true)
		AS:SkinFrame(Button)
		AS:StyleButton(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()

		Button:SetPoint("TOPLEFT", Slot, "TOPLEFT", 4, -4)

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:Point("BOTTOMLEFT", Button, "BOTTOMRIGHT", 3, 0)

		for j = 1, 3 do
			AS:CreateBackdrop(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j])
			_G["MerchantItem"..i.."AltCurrencyFrameItem"..j].Backdrop:SetOutside(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
			AS:SkinTexture(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
		end
	end

	hooksecurefunc('MerchantFrame_UpdateMerchantInfo', function()
		local numMerchantItems = GetMerchantNumItems()
		for i = 1, MERCHANT_ITEMS_PER_PAGE, 1 do
			local index = (((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i)
			local itemButton = _G["MerchantItem"..i.."ItemButton"]
			local merchantButton = _G["MerchantItem"..i]
			local merchantMoney = _G["MerchantItem"..i.."MoneyFrame"]
			local merchantAltCurrency = _G["MerchantItem"..i.."AltCurrencyFrame"]
			if ( index <= numMerchantItems ) then
				local name, texture, price, stackCount, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(index)
				local link = GetMerchantItemLink(index)
				if link then
					local quality = select(3, GetItemInfo(link))
					if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						itemButton:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b)
					else
						itemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end
				local Point = _G["MerchantItem"..i.."AltCurrencyFrame"]:GetPoint()
				if Point == "BOTTOMLEFT" then
					_G["MerchantItem"..i.."AltCurrencyFrame"]:SetPoint("BOTTOMLEFT", _G["MerchantItem"..i.."NameFrame"], "BOTTOMLEFT", 2, 37)
				elseif Point == "LEFT" then
					_G["MerchantItem"..i.."AltCurrencyFrame"]:SetPoint("LEFT", merchantMoney:GetName(), "RIGHT", -14, 0)
				end
			end
		end
		local buybackName, buybackTexture, buybackPrice, buybackQuantity, buybackNumAvailable, buybackIsUsable = GetBuybackItemInfo(GetNumBuybackItems())
		MerchantBuyBackItemItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
		if ( buybackName ) then
			local link = GetBuybackItemInfo(GetNumBuybackItems())
			if link then
				local quality = select(3, GetItemInfo(link))
				if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
					MerchantBuyBackItemItemButton:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b)
				else
					MerchantBuyBackItemItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end
	end)

	hooksecurefunc('MerchantFrame_UpdateBuybackInfo', function()
		local numBuybackItems = GetNumBuybackItems()
		local itemButton, buybackButton
		local buybackName, buybackTexture, buybackPrice, buybackQuantity, buybackNumAvailable, buybackIsUsable
		for i = 1, BUYBACK_ITEMS_PER_PAGE do
			itemButton = _G["MerchantItem"..i.."ItemButton"]
			buybackButton = _G["MerchantItem"..i]
			if ( i <= numBuybackItems ) then
				buybackName, buybackTexture, buybackPrice, buybackQuantity, buybackNumAvailable, buybackIsUsable = GetBuybackItemInfo(i)
				local link = GetBuybackItemInfo(i)
				if link then
					local quality = select(3, GetItemInfo(link))
					if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						itemButton:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b)
					else
						itemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end
			end
		end
	end)

	hooksecurefunc('MerchantFrame_UpdateCurrencies', function()
		for i = 1, MAX_MERCHANT_CURRENCIES do
			if _G["MerchantToken"..i] then
				AS:CreateBackdrop(_G["MerchantToken"..i])
				_G["MerchantToken"..i].Backdrop:SetOutside(_G["MerchantToken"..i].icon)
				AS:SkinTexture(_G["MerchantToken"..i].icon)
				_G["MerchantToken"..i].icon:SetPoint("LEFT", _G["MerchantToken"..i].count, "RIGHT", 2, 0)
			end
		end
	end)

	AS:SkinBackdropFrame(MerchantBuyBackItem)
	MerchantBuyBackItem.Backdrop:SetOutside(MerchantBuyBackItem, 6, 6)

	AS:SkinFrame(MerchantBuyBackItemItemButton)
	AS:StyleButton(MerchantBuyBackItemItemButton)
	AS:SkinTexture(MerchantBuyBackItemItemButtonIconTexture)
	MerchantBuyBackItemItemButtonIconTexture:SetInside()

	AS:StyleButton(MerchantRepairItemButton)
	AS:SetTemplate(MerchantRepairItemButton, 'Default', true)
	MerchantRepairItemButton:GetRegions():SetTexCoord(0.04, 0.24, 0.06, 0.5)
	MerchantRepairItemButton:GetRegions():SetInside()

	AS:StyleButton(MerchantGuildBankRepairButton)
	AS:SetTemplate(MerchantGuildBankRepairButton, 'Default', true)
	MerchantGuildBankRepairButtonIcon:SetTexCoord(0.61, 0.82, 0.1, 0.52)
	MerchantGuildBankRepairButtonIcon:SetInside()

	AS:StyleButton(MerchantRepairAllButton)
	AS:SetTemplate(MerchantRepairAllButton, 'Default', true)
	MerchantRepairAllIcon:SetTexCoord(0.34, 0.1, 0.34, 0.535, 0.535, 0.1, 0.535, 0.535)
	MerchantRepairAllIcon:SetInside()

	-- Skin misc frames
	MerchantFrame:SetWidth(345)
	AS:SkinCloseButton(MerchantFrameCloseButton)
	AS:SkinNextPrevButton(MerchantNextPageButton)
	AS:SkinNextPrevButton(MerchantPrevPageButton)
end

AS:RegisterSkin('Blizzard_Merchant', AS.Blizzard_Merchant)