local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('CollectionShop') then return end

function AS:CollectionShop(event, addon)
	if addon ~= 'Blizzard_AuctionUI' then return end
	AS:Delay(.1, function()
		for i = 1, AuctionFrame.numTabs do
			AS:SkinTab(_G["AuctionFrameTab"..i])
		end
		-- AuctionFrameCollectionShop
		AS:StripTextures(AuctionFrameCollectionShop_FlyoutPanelButton)
		AS:SkinArrowButton(AuctionFrameCollectionShop_FlyoutPanelButton, AuctionFrameCollectionShop_FlyoutPanelButton.FlyoutPanel:IsShown() and 'left' or 'right')
		AuctionFrameCollectionShop_FlyoutPanelButton:HookScript('PostClick', function(self)
			if self.FlyoutPanel:IsShown() then
				AS:SkinArrowButton(self, 'left')
			else
				AS:SkinArrowButton(self, 'right')
			end
		end)
		AuctionFrameCollectionShop_FlyoutPanelButton.SetNormalTexture = AS.Noop
		AuctionFrameCollectionShop_FlyoutPanelButton.SetHightlightTexture = AS.Noop
		AuctionFrameCollectionShop_FlyoutPanelButton.SetPushedTexture = AS.Noop

		AS:SkinCheckBox(AuctionFrameCollectionShop_LiveCheckButton)
		AS:SkinCheckBox(AuctionFrameCollectionShop_UndressCharacterCheckButton)

		AS:SkinButton(AuctionFrameCollectionShop_ScanButton)
		AS:SkinButton(AuctionFrameCollectionShop_ShopButton)
		AS:SkinButton(AuctionFrameCollectionShop_BuyAllButton)
		AS:SkinButton(AuctionFrameCollectionShop_CloseButton)

		AS:SkinButton(AuctionFrameCollectionShop_NameSortButton)
		AuctionFrameCollectionShop_NameSortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
		AS:SkinButton(AuctionFrameCollectionShop_LvlSortButton)
		AuctionFrameCollectionShop_LvlSortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
		AS:SkinButton(AuctionFrameCollectionShop_CategorySortButton)
		AuctionFrameCollectionShop_CategorySortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
		AS:SkinButton(AuctionFrameCollectionShop_ItemPriceSortButton)
		AuctionFrameCollectionShop_ItemPriceSortButtonArrow:SetTexture([[Interface\Buttons\UI-SortArrow]])
	end)
end

AS:RegisterSkin('CollectionShop', AS.CollectionShop, 'ADDON_LOADED')
