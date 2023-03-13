local AS, L, S, R = unpack(AddOnSkins)

function R:CollectionShop(_, addon)
	if addon ~= 'Blizzard_AuctionUI' then return end
	AS:Delay(.1, function()
		for i = 1, AuctionFrame.numTabs do
			S:HandleTab(_G["AuctionFrameTab"..i])
		end
		-- AuctionFrameCollectionShop
		S:StripTextures(AuctionFrameCollectionShop_FlyoutPanelButton)
		S:HandleNextPrevButton(AuctionFrameCollectionShop_FlyoutPanelButton, AuctionFrameCollectionShop_FlyoutPanelButton.FlyoutPanel:IsShown() and 'left' or 'right')
		AuctionFrameCollectionShop_FlyoutPanelButton:HookScript('PostClick', function(s)
			if s.FlyoutPanel:IsShown() then
				S:HandleNextPrevButton(s, 'left')
			else
				S:HandleNextPrevButton(s, 'right')
			end
		end)
		AuctionFrameCollectionShop_FlyoutPanelButton.SetNormalTexture = S.noop
		AuctionFrameCollectionShop_FlyoutPanelButton.SetHightlightTexture = S.noop
		AuctionFrameCollectionShop_FlyoutPanelButton.SetPushedTexture = S.noop

		S:HandleCheckBox(AuctionFrameCollectionShop_LiveCheckButton)
		S:HandleCheckBox(AuctionFrameCollectionShop_UndressCharacterCheckButton)

		S:HandleButton(AuctionFrameCollectionShop_ScanButton)
		S:HandleButton(AuctionFrameCollectionShop_ShopButton)
		S:HandleButton(AuctionFrameCollectionShop_BuyAllButton)
		S:HandleButton(AuctionFrameCollectionShop_CloseButton)

		S:HandleButton(AuctionFrameCollectionShop_NameSortButton)
		AuctionFrameCollectionShop_NameSortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
		S:HandleButton(AuctionFrameCollectionShop_LvlSortButton)
		AuctionFrameCollectionShop_LvlSortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
		S:HandleButton(AuctionFrameCollectionShop_CategorySortButton)
		AuctionFrameCollectionShop_CategorySortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
		S:HandleButton(AuctionFrameCollectionShop_ItemPriceSortButton)
		AuctionFrameCollectionShop_ItemPriceSortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
	end)
end

AS:RegisterSkin('CollectionShop', nil, 'ADDON_LOADED')
