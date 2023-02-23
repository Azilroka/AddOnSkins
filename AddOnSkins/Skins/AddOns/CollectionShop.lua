local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('CollectionShop') then return end

function AS:CollectionShop(event, addon)
	if addon ~= 'Blizzard_AuctionUI' then return end
	AS:Delay(.1, function()
		for i = 1, AuctionFrame.numTabs do
			S:HandleTab(_G["AuctionFrameTab"..i])
		end
		-- AuctionFrameCollectionShop
		S:StripTextures(AuctionFrameCollectionShop_FlyoutPanelButton)
		S:HandleNextPrevButton(AuctionFrameCollectionShop_FlyoutPanelButton, AuctionFrameCollectionShop_FlyoutPanelButton.FlyoutPanel:IsShown() and 'left' or 'right')
		AuctionFrameCollectionShop_FlyoutPanelButton:HookScript('PostClick', function(self)
			if self.FlyoutPanel:IsShown() then
				S:HandleNextPrevButton(self, 'left')
			else
				S:HandleNextPrevButton(self, 'right')
			end
		end)
		AuctionFrameCollectionShop_FlyoutPanelButton.SetNormalTexture = AS.Noop
		AuctionFrameCollectionShop_FlyoutPanelButton.SetHightlightTexture = AS.Noop
		AuctionFrameCollectionShop_FlyoutPanelButton.SetPushedTexture = AS.Noop

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

AS:RegisterSkin('CollectionShop', AS.CollectionShop, 'ADDON_LOADED')
