if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Auctionator") then return end
local U = unpack(select(2,...))
local name = "AuctionatorSkin"
local function AtrSkin(self,event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	local s = U.s
	local c = U.c
		
	if IsAddOnLoaded("ElvUI") then if c.private.skins.blizzard.enable ~= true or c.private.skins.blizzard.auctionhouse ~= true then return end end
	AuctionsCancelAuctionButton:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 554, 0)
	AuctionsCloseButton:ClearAllPoints()
	AuctionsCloseButton:Point("RIGHT", AuctionsCancelAuctionButton, "RIGHT", 86, 0)
	BidBuyoutButton:Point("RIGHT", BidCloseButton, "LEFT", -4, 0)
	BidBidButton:Point("RIGHT", BidBuyoutButton, "LEFT", -4, 0)
	AuctionsItemButton:StripTextures()
	AuctionsItemButton:StyleButton()
	AuctionsItemButton:SetTemplate("Transparent", true)
	BrowseName:Point("TOPLEFT", AuctionFrameBrowse, "TOPLEFT", 22, -56)
	BrowseMinLevel:ClearAllPoints()
	BrowseMinLevel:Point("RIGHT", BrowseName, "RIGHT", 42, 0)
	BrowseMaxLevel:ClearAllPoints()
	BrowseMaxLevel:Point("RIGHT", BrowseMinLevel, "RIGHT", 36, 0)
	BrowseDropDown:ClearAllPoints()
	BrowseDropDown:Point("RIGHT", BrowseMaxLevel, "RIGHT", 150, -3)
	BrowseResetButton:ClearAllPoints()
	BrowseResetButton:Point("LEFT", BrowseName, "LEFT", -2, -26)
	BrowseSearchButton:ClearAllPoints()
	BrowseSearchButton:Point("RIGHT", BrowseResetButton, "RIGHT", 83, 0)
	BrowseResetButton:Width(80)
	BrowseNameText:Point("TOPLEFT", 20, -41)
	BrowseLevelText:Point("TOPLEFT", 184, -45)
	BrowseLevelHyphen:Point("LEFT", BrowseMinLevel, "RIGHT", 4, 0)

	AuctionFrameMoneyFrame:ClearAllPoints()
	AuctionFrameMoneyFrame:Point("TOPLEFT", AuctionFrame, "BOTTOMLEFT", 55, 24)	
	BrowseBidPrice:ClearAllPoints()
	BrowseBidPrice:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 340, 0)
	BrowseCloseButton:ClearAllPoints()
	BrowseCloseButton:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 640, 0)
	BrowseBuyoutButton:Point("RIGHT", BrowseCloseButton, "LEFT", -4, 0)
	BrowseBidButton:Point("RIGHT", BrowseBuyoutButton, "LEFT", -4, 0)
	BidBidPrice:ClearAllPoints()
	BidBidPrice:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 340, 0)
	BidCloseButton:ClearAllPoints()
	BidCloseButton:Point("RIGHT", AuctionFrameMoneyFrame, "RIGHT", 640, 0)
	BidBuyoutButton:Point("RIGHT", BrowseCloseButton, "LEFT", -4, 0)
	BidBidButton:Point("RIGHT", BrowseBuyoutButton, "LEFT", -4, 0)
	AuctionsQualitySort:Point("TOPLEFT", AuctionFrameAuctions, "TOPLEFT", 219, -48)
	BidQualitySort:Point("TOPLEFT", AuctionFrameBid, "TOPLEFT", 65, -50)
	AuctionFrameTab1:ClearAllPoints()
	AuctionFrameTab1:Point("TOPLEFT", AuctionFrame, "BOTTOMLEFT", -5, 2)
	U.SkinNextPrevButton(BrowseNextPageButton)
	U.SkinNextPrevButton(BrowsePrevPageButton)
	BrowseNextPageButton:Size(20, 20)
	BrowsePrevPageButton:Size(20, 20)

	U.SkinFrame(Atr_BasicOptionsFrame)
	U.SkinFrame(Atr_TooltipsOptionsFrame)
	U.SkinFrame(Atr_UCConfigFrame)
	U.SkinFrame(Atr_StackingOptionsFrame)
	U.SkinFrame(Atr_ScanningOptionsFrame)
	U.SkinFrame(AuctionatorResetsFrame)
	U.SkinFrame(Atr_ShpList_Options_Frame)
	U.SkinFrame(AuctionatorDescriptionFrame)
	U.SkinFrame(Atr_Stacking_List)
	U.SkinFrame(Atr_ShpList_Frame)
		
	U.SkinCheckBox(AuctionatorOption_Enable_Alt_CB)
	U.SkinCheckBox(AuctionatorOption_Open_All_Bags_CB)
	U.SkinCheckBox(AuctionatorOption_Show_StartingPrice_CB)
	U.SkinCheckBox(ATR_tipsVendorOpt_CB)
	U.SkinCheckBox(ATR_tipsAuctionOpt_CB)
	U.SkinCheckBox(ATR_tipsDisenchantOpt_CB)
		
	U.SkinDropDownBox(AuctionatorOption_Deftab)
	U.SkinDropDownBox(Atr_tipsShiftDD)
	U.SkinDropDownBox(Atr_deDetailsDD)
	U.SkinDropDownBox(Atr_scanLevelDD)
	Atr_deDetailsDDText:SetJustifyH('RIGHT')

	local moneyEditBoxes = {
		'UC_5000000_MoneyInput',
		'UC_1000000_MoneyInput',
		'UC_200000_MoneyInput',
		'UC_50000_MoneyInput',
		'UC_10000_MoneyInput',
		'UC_2000_MoneyInput',
		'UC_500_MoneyInput',
	}

	for i = 1, #moneyEditBoxes do
		U.SkinEditBox(_G[moneyEditBoxes[i]..'Gold'])
		U.SkinEditBox(_G[moneyEditBoxes[i]..'Silver'])
		U.SkinEditBox(_G[moneyEditBoxes[i]..'Copper'])
	end

	U.SkinEditBox(Atr_Starting_Discount)
	U.SkinEditBox(Atr_ScanOpts_MaxHistAge)
		
	U.SkinButton(Atr_UCConfigFrame_Reset)
	U.SkinButton(Atr_StackingOptionsFrame_Edit)
	U.SkinButton(Atr_StackingOptionsFrame_New)

	for i = 1, Atr_ShpList_Options_Frame:GetNumChildren() do
		local object = select(i, Atr_ShpList_Options_Frame:GetChildren())
		if object:GetObjectType() == 'Button' then
			U.SkinButton(object)
		end
	end
		
	for i = 1, AuctionatorResetsFrame:GetNumChildren() do
		local object = select(i, AuctionatorResetsFrame:GetChildren())
		if object:GetObjectType() == 'Button' then
			U.SkinButton(object)
		end
	end

	U.SkinDropDownBox(Atr_Duration)
	U.SkinDropDownBox(Atr_DropDownSL)
	U.SkinDropDownBox(Atr_ASDD_Class)
	U.SkinDropDownBox(Atr_ASDD_Subclass)

	U.SkinButton(Atr_Search_Button, true)
	U.SkinButton(Atr_Back_Button, true)
	U.SkinButton(Atr_Buy1_Button, true)
	U.SkinButton(Atr_Adv_Search_Button, true)
	U.SkinButton(Atr_FullScanButton, true)
	U.SkinButton(Auctionator1Button, true)
	U.SkinFrame(Atr_ListTabsTab1)
	U.SkinFrame(Atr_ListTabsTab2)
	U.SkinFrame(Atr_ListTabsTab3)
	U.SkinButton(Atr_CreateAuctionButton, true)
	U.SkinButton(Atr_RemFromSListButton, true)
	U.SkinButton(Atr_AddToSListButton, true)
	U.SkinButton(Atr_SrchSListButton, true)
	U.SkinButton(Atr_MngSListsButton, true)
	U.SkinButton(Atr_NewSListButton, true)
	U.SkinButton(Atr_CheckActiveButton, true)
	U.SkinButton(AuctionatorCloseButton, true)
	U.SkinButton(Atr_CancelSelectionButton, true)
	U.SkinButton(Atr_FullScanStartButton, true)
	U.SkinButton(Atr_FullScanDone, true)
	U.SkinButton(Atr_CheckActives_Yes_Button, true)
	U.SkinButton(Atr_CheckActives_No_Button, true)
	U.SkinButton(Atr_Adv_Search_ResetBut, true)
	U.SkinButton(Atr_Adv_Search_OKBut, true)
	U.SkinButton(Atr_Adv_Search_CancelBut, true)
	U.SkinButton(Atr_Buy_Confirm_OKBut, true)
	U.SkinButton(Atr_Buy_Confirm_CancelBut, true)
	U.SkinButton(Atr_SaveThisList_Button, true)
	U.SkinEditBox(Atr_StackPriceGold)
	U.SkinEditBox(Atr_StackPriceSilver)
	U.SkinEditBox(Atr_StackPriceCopper)
	U.SkinEditBox(Atr_StartingPriceGold)
	U.SkinEditBox(Atr_StartingPriceSilver)
	U.SkinEditBox(Atr_StartingPriceCopper)
	U.SkinEditBox(Atr_ItemPriceGold)
	U.SkinEditBox(Atr_ItemPriceSilver)
	U.SkinEditBox(Atr_ItemPriceCopper)
	U.SkinEditBox(Atr_Batch_NumAuctions)
	U.SkinEditBox(Atr_Batch_Stacksize)
	U.SkinEditBox(Atr_Search_Box)
	U.SkinEditBox(Atr_AS_Searchtext)
	U.SkinEditBox(Atr_AS_Minlevel)
	U.SkinEditBox(Atr_AS_Maxlevel)
	U.SkinEditBox(Atr_AS_MinItemlevel)
	U.SkinEditBox(Atr_AS_MaxItemlevel)
	U.SkinFrame(Atr_FullScanResults)
	U.SkinFrame(Atr_Adv_Search_Dialog)
	U.SkinFrame(Atr_FullScanFrame)
	U.SkinFrameD(Atr_HeadingsBar)
	Atr_HeadingsBar:Height(19)
	U.SkinFrame(Atr_Error_Frame)
	U.SkinFrameD(Atr_Hlist)
	Atr_Hlist:Width(196)
	Atr_Hlist:ClearAllPoints()
	Atr_Hlist:Point("TOPLEFT", -195, -75)
	U.SkinFrameD(Atr_Buy_Confirm_Frame)
	U.SkinFrameD(Atr_CheckActives_Frame)
	Atr_SrchSListButton:Width(196)
	Atr_MngSListsButton:Width(196)
	Atr_NewSListButton:Width(196)
	Atr_CheckActiveButton:Width(196)
	U.SkinScrollBar(Atr_Hlist_ScrollFrameScrollBar)
	Atr_ListTabs:Point("BOTTOMRIGHT", Atr_HeadingsBar, "TOPRIGHT", 8, 1)
	Atr_Back_Button:Point("TOPLEFT", Atr_HeadingsBar, "TOPLEFT", 0, 19)

	AuctionatorCloseButton:ClearAllPoints()
	AuctionatorCloseButton:Point("BOTTOMLEFT", Atr_Main_Panel, "BOTTOMRIGHT", -17, 10)
	Atr_Buy1_Button:Point("RIGHT", AuctionatorCloseButton, "LEFT", -5, 0)
	Atr_CancelSelectionButton:Point("RIGHT", Atr_Buy1_Button, "LEFT", -5, 0)
	Atr_SellControls_Tex:StripTextures()
	Atr_SellControls_Tex:StyleButton()
	Atr_SellControls_Tex:SetTemplate("Default", true)

	for i = 1, AuctionFrame.numTabs do
		U.SkinTab(_G["AuctionFrameTab"..i])
	end
	AuctionFrameTab1:Point("TOPLEFT", AuctionFrame, "BOTTOMLEFT", 5, 2)
	U.UnregisterEvent(name,self,"AUCTION_HOUSE_SHOW")
end

U.RegisterSkin(name,AtrSkin,'AUCTION_HOUSE_SHOW')