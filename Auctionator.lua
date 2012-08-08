local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

local function LoadSkin()
	
	if IsAddOnLoaded("ElvUI") then if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.auctionhouse ~= true then return end end

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
	
	cSkinButton(Atr_UCConfigFrame_Reset, true)
	cSkinButton(Atr_StackingOptionsFrame_Edit, true)
	cSkinButton(Atr_StackingOptionsFrame_New, true)
	
	for i = 1, Atr_ShpList_Options_Frame:GetNumChildren() do
		local object = select(i, Atr_ShpList_Options_Frame:GetChildren())
		if object:GetObjectType() == 'Button' then
			cSkinButton(object, true)
		end
	end
	
	for i = 1, AuctionatorResetsFrame:GetNumChildren() do
		local object = select(i, AuctionatorResetsFrame:GetChildren())
		if object:GetObjectType() == 'Button' then
			cSkinButton(object)
		end
	end
	-- Main window skinning
	local AtrSkin = CreateFrame('Frame')
	AtrSkin:RegisterEvent('AUCTION_HOUSE_SHOW')
	AtrSkin:SetScript('OnEvent', function(self)
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

		-- resize some buttons to fit
		Atr_SrchSListButton:Width(196)
		Atr_MngSListsButton:Width(196)
		Atr_NewSListButton:Width(196)
		Atr_CheckActiveButton:Width(196)

		-- Button Positions
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

		self:UnregisterEvent('AUCTION_HOUSE_SHOW')
	end)
end

if IsAddOnLoaded("ElvUI") then
s:RegisterSkin('Auctionator', LoadSkin)
end