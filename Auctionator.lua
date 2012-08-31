if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Auctionator") then return end
local AtrSkin = CreateFrame("Frame")
AtrSkin:RegisterEvent("AUCTION_HOUSE_SHOW")
AtrSkin:SetScript('OnEvent', function(self)
if (UISkinOptions.AuctionatorSkin ~= "Enabled") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
	
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
	cSkinNextPrevButton(BrowseNextPageButton)
	cSkinNextPrevButton(BrowsePrevPageButton)
	BrowseNextPageButton:Size(20, 20)
	BrowsePrevPageButton:Size(20, 20)

cSkinFrame(Atr_BasicOptionsFrame)
cSkinFrame(Atr_TooltipsOptionsFrame)
cSkinFrame(Atr_UCConfigFrame)
cSkinFrame(Atr_StackingOptionsFrame)
cSkinFrame(Atr_ScanningOptionsFrame)
cSkinFrame(AuctionatorResetsFrame)
cSkinFrame(Atr_ShpList_Options_Frame)
cSkinFrame(AuctionatorDescriptionFrame)
cSkinFrame(Atr_Stacking_List)
cSkinFrame(Atr_ShpList_Frame)
	
cSkinCheckBox(AuctionatorOption_Enable_Alt_CB)
cSkinCheckBox(AuctionatorOption_Open_All_Bags_CB)
cSkinCheckBox(AuctionatorOption_Show_StartingPrice_CB)
cSkinCheckBox(ATR_tipsVendorOpt_CB)
cSkinCheckBox(ATR_tipsAuctionOpt_CB)
cSkinCheckBox(ATR_tipsDisenchantOpt_CB)
	
cSkinDropDownBox(AuctionatorOption_Deftab)
cSkinDropDownBox(Atr_tipsShiftDD)
cSkinDropDownBox(Atr_deDetailsDD)
cSkinDropDownBox(Atr_scanLevelDD)
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
	cSkinEditBox(_G[moneyEditBoxes[i]..'Gold'])
	cSkinEditBox(_G[moneyEditBoxes[i]..'Silver'])
	cSkinEditBox(_G[moneyEditBoxes[i]..'Copper'])
end

cSkinEditBox(Atr_Starting_Discount)
cSkinEditBox(Atr_ScanOpts_MaxHistAge)
	
cSkinButton(Atr_UCConfigFrame_Reset)
cSkinButton(Atr_StackingOptionsFrame_Edit)
cSkinButton(Atr_StackingOptionsFrame_New)

for i = 1, Atr_ShpList_Options_Frame:GetNumChildren() do
	local object = select(i, Atr_ShpList_Options_Frame:GetChildren())
	if object:GetObjectType() == 'Button' then
		cSkinButton(object)
	end
end
	
for i = 1, AuctionatorResetsFrame:GetNumChildren() do
	local object = select(i, AuctionatorResetsFrame:GetChildren())
	if object:GetObjectType() == 'Button' then
		cSkinButton(object)
	end
end

	cSkinDropDownBox(Atr_Duration)
	cSkinDropDownBox(Atr_DropDownSL)
	cSkinDropDownBox(Atr_ASDD_Class)
	cSkinDropDownBox(Atr_ASDD_Subclass)

	cSkinButton(Atr_Search_Button, true)
	cSkinButton(Atr_Back_Button, true)
	cSkinButton(Atr_Buy1_Button, true)
	cSkinButton(Atr_Adv_Search_Button, true)
	cSkinButton(Atr_FullScanButton, true)
	cSkinButton(Auctionator1Button, true)
	cSkinButton(Atr_ListTabsTab1, true)
	cSkinButton(Atr_ListTabsTab2, true)
	cSkinButton(Atr_ListTabsTab3, true)
	cSkinButton(Atr_CreateAuctionButton, true)
	cSkinButton(Atr_RemFromSListButton, true)
	cSkinButton(Atr_AddToSListButton, true)
	cSkinButton(Atr_SrchSListButton, true)
	cSkinButton(Atr_MngSListsButton, true)
	cSkinButton(Atr_NewSListButton, true)
	cSkinButton(Atr_CheckActiveButton, true)
	cSkinButton(AuctionatorCloseButton, true)
	cSkinButton(Atr_CancelSelectionButton, true)
	cSkinButton(Atr_FullScanStartButton, true)
	cSkinButton(Atr_FullScanDone, true)
	cSkinButton(Atr_CheckActives_Yes_Button, true)
	cSkinButton(Atr_CheckActives_No_Button, true)
	cSkinButton(Atr_Adv_Search_ResetBut, true)
	cSkinButton(Atr_Adv_Search_OKBut, true)
	cSkinButton(Atr_Adv_Search_CancelBut, true)
	cSkinButton(Atr_Buy_Confirm_OKBut, true)
	cSkinButton(Atr_Buy_Confirm_CancelBut, true)
	cSkinButton(Atr_SaveThisList_Button, true)
	cSkinEditBox(Atr_StackPriceGold)
	cSkinEditBox(Atr_StackPriceSilver)
	cSkinEditBox(Atr_StackPriceCopper)
	cSkinEditBox(Atr_StartingPriceGold)
	cSkinEditBox(Atr_StartingPriceSilver)
	cSkinEditBox(Atr_StartingPriceCopper)
	cSkinEditBox(Atr_ItemPriceGold)
	cSkinEditBox(Atr_ItemPriceSilver)
	cSkinEditBox(Atr_ItemPriceCopper)
	cSkinEditBox(Atr_Batch_NumAuctions)
	cSkinEditBox(Atr_Batch_Stacksize)
	cSkinEditBox(Atr_Search_Box)
	cSkinEditBox(Atr_AS_Searchtext)
	cSkinEditBox(Atr_AS_Minlevel)
	cSkinEditBox(Atr_AS_Maxlevel)
	cSkinEditBox(Atr_AS_MinItemlevel)
	cSkinEditBox(Atr_AS_MaxItemlevel)
	cSkinFrame(Atr_FullScanResults)
	cSkinFrame(Atr_Adv_Search_Dialog)
	cSkinFrame(Atr_FullScanFrame)
	cSkinFrameD(Atr_HeadingsBar)
	Atr_HeadingsBar:Height(19)
	cSkinFrame(Atr_Error_Frame)
	cSkinFrameD(Atr_Hlist)
	Atr_Hlist:Width(196)
	Atr_Hlist:ClearAllPoints()
	Atr_Hlist:Point("TOPLEFT", -195, -75)
	cSkinFrameD(Atr_Buy_Confirm_Frame)
	cSkinFrameD(Atr_CheckActives_Frame)
	Atr_SrchSListButton:Width(196)
	Atr_MngSListsButton:Width(196)
	Atr_NewSListButton:Width(196)
	Atr_CheckActiveButton:Width(196)
	cSkinScrollBar(Atr_Hlist_ScrollFrameScrollBar)

	AuctionatorCloseButton:ClearAllPoints()
	AuctionatorCloseButton:Point("BOTTOMLEFT", Atr_Main_Panel, "BOTTOMRIGHT", -17, 10)
	Atr_Buy1_Button:Point("RIGHT", AuctionatorCloseButton, "LEFT", -5, 0)
	Atr_CancelSelectionButton:Point("RIGHT", Atr_Buy1_Button, "LEFT", -5, 0)
	Atr_SellControls_Tex:StripTextures()
	Atr_SellControls_Tex:StyleButton()
	Atr_SellControls_Tex:SetTemplate("Default", true)

	for i = 1, AuctionFrame.numTabs do
		cSkinTab(_G["AuctionFrameTab"..i])
	end
	AuctionFrameTab1:Point("TOPLEFT", AuctionFrame, "BOTTOMLEFT", 5, 2)
	self:UnregisterEvent("AUCTION_HOUSE_SHOW")
	end)