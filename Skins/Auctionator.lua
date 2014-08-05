local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Auctionator') then return end

local name = 'AuctionatorSkin'
function AS:SkinAuctionator(event)
	if addon == 'Blizzard_TradeSkillUI' or IsAddOnLoaded('Blizzard_TradeSkillUI') then 
		TradeSkillFrame:HookScript('OnShow', function() AS:SkinButton(Auctionator_Search, true) end)
		AS:UnregisterSkinEvent(name, event)
	end
	if event == 'PLAYER_ENTERING_WORLD' then return end
	if event == 'AUCTION_HOUSE_SHOW' then
		AS:SkinFrame(Atr_BasicOptionsFrame)
		AS:SkinFrame(Atr_TooltipsOptionsFrame)
		AS:SkinFrame(Atr_UCConfigFrame)
		AS:SkinFrame(Atr_StackingOptionsFrame)
		AS:SkinFrame(Atr_ScanningOptionsFrame)
		AS:SkinFrame(AuctionatorResetsFrame)
		AS:SkinFrame(Atr_ShpList_Options_Frame)
		AS:SkinFrame(AuctionatorDescriptionFrame)
		AS:SkinFrame(Atr_Stacking_List)
		AS:SkinFrame(Atr_ShpList_Frame)
		AS:SkinCheckBox(AuctionatorOption_Enable_Alt_CB)
		AS:SkinCheckBox(AuctionatorOption_Open_All_Bags_CB)
		AS:SkinCheckBox(AuctionatorOption_Show_StartingPrice_CB)
		AS:SkinCheckBox(ATR_tipsVendorOpt_CB)
		AS:SkinCheckBox(ATR_tipsAuctionOpt_CB)
		AS:SkinCheckBox(ATR_tipsDisenchantOpt_CB)
		AS:SkinDropDownBox(AuctionatorOption_Deftab)
		AS:SkinDropDownBox(Atr_tipsShiftDD)
		AS:SkinDropDownBox(Atr_deDetailsDD)
		AS:SkinDropDownBox(Atr_scanLevelDD)
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
			AS:SkinEditBox(_G[moneyEditBoxes[i]..'Gold'])
			AS:SkinEditBox(_G[moneyEditBoxes[i]..'Silver'])
			AS:SkinEditBox(_G[moneyEditBoxes[i]..'Copper'])
		end

		AS:SkinEditBox(Atr_Starting_Discount)
		AS:SkinEditBox(Atr_ScanOpts_MaxHistAge)
		AS:SkinButton(Atr_UCConfigFrame_Reset)
		AS:SkinButton(Atr_StackingOptionsFrame_Edit)
		AS:SkinButton(Atr_StackingOptionsFrame_New)

		for i = 1, Atr_ShpList_Options_Frame:GetNumChildren() do
			local object = select(i, Atr_ShpList_Options_Frame:GetChildren())
			if object:IsObjectType('Button') then
				AS:SkinButton(object)
			end
		end
		for i = 1, AuctionatorResetsFrame:GetNumChildren() do
			local object = select(i, AuctionatorResetsFrame:GetChildren())
			if object:IsObjectType('Button') then
				AS:SkinButton(object)
			end
		end

		AS:SkinDropDownBox(Atr_Duration)
		AS:SkinDropDownBox(Atr_DropDownSL)
		AS:SkinDropDownBox(Atr_ASDD_Class)
		AS:SkinDropDownBox(Atr_ASDD_Subclass)

		AS:SkinButton(Atr_Search_Button, true)
		AS:SkinButton(Atr_Back_Button, true)
		AS:SkinButton(Atr_Buy1_Button, true)
		AS:SkinButton(Atr_Adv_Search_Button, true)
		AS:SkinButton(Atr_FullScanButton, true)
		AS:SkinButton(Auctionator1Button, true)
		AS:SkinFrame(Atr_ListTabsTab1)
		AS:SkinFrame(Atr_ListTabsTab2)
		AS:SkinFrame(Atr_ListTabsTab3)
		AS:SkinButton(Atr_CreateAuctionButton, true)
		AS:SkinButton(Atr_RemFromSListButton, true)
		AS:SkinButton(Atr_AddToSListButton, true)
		AS:SkinButton(Atr_SrchSListButton, true)
		AS:SkinButton(Atr_MngSListsButton, true)
		AS:SkinButton(Atr_NewSListButton, true)
		AS:SkinButton(Atr_CheckActiveButton, true)
		AS:SkinButton(AuctionatorCloseButton, true)
		AS:SkinButton(Atr_CancelSelectionButton, true)
		AS:SkinButton(Atr_FullScanStartButton, true)
		AS:SkinButton(Atr_FullScanDone, true)
		AS:SkinButton(Atr_CheckActives_Yes_Button, true)
		AS:SkinButton(Atr_CheckActives_No_Button, true)
		AS:SkinButton(Atr_Adv_Search_ResetBut, true)
		AS:SkinButton(Atr_Adv_Search_OKBut, true)
		AS:SkinButton(Atr_Adv_Search_CancelBut, true)
		AS:SkinButton(Atr_Buy_Confirm_OKBut, true)
		AS:SkinButton(Atr_Buy_Confirm_CancelBut, true)
		AS:SkinButton(Atr_SaveThisList_Button, true)
		AS:SkinEditBox(Atr_StackPriceGold)
		AS:SkinEditBox(Atr_StackPriceSilver)
		AS:SkinEditBox(Atr_StackPriceCopper)
		AS:SkinEditBox(Atr_StartingPriceGold)
		AS:SkinEditBox(Atr_StartingPriceSilver)
		AS:SkinEditBox(Atr_StartingPriceCopper)
		AS:SkinEditBox(Atr_ItemPriceGold)
		AS:SkinEditBox(Atr_ItemPriceSilver)
		AS:SkinEditBox(Atr_ItemPriceCopper)
		AS:SkinEditBox(Atr_Batch_NumAuctions)
		AS:SkinEditBox(Atr_Batch_Stacksize)
		AS:SkinEditBox(Atr_Search_Box)
		AS:SkinEditBox(Atr_AS_Searchtext)
		AS:SkinEditBox(Atr_AS_Minlevel)
		AS:SkinEditBox(Atr_AS_Maxlevel)
		AS:SkinEditBox(Atr_AS_MinItemlevel)
		AS:SkinEditBox(Atr_AS_MaxItemlevel)
		AS:SkinFrame(Atr_FullScanResults)
		AS:SkinFrame(Atr_Adv_Search_Dialog)
		AS:SkinFrame(Atr_FullScanFrame)
		AS:SkinFrame(Atr_HeadingsBar, 'Default')
		Atr_HeadingsBar:Height(19)
		AS:SkinFrame(Atr_Error_Frame)
		AS:SkinFrame(Atr_Hlist, 'Default')
		Atr_Hlist:Width(196)
		Atr_Hlist:ClearAllPoints()
		Atr_Hlist:Point('TOPLEFT', -195, -75)
		AS:SkinFrame(Atr_Buy_Confirm_Frame, 'Default')
		AS:SkinFrame(Atr_CheckActives_Frame, 'Default')
		Atr_SrchSListButton:Width(196)
		Atr_MngSListsButton:Width(196)
		Atr_NewSListButton:Width(196)
		Atr_CheckActiveButton:Width(196)
		AS:SkinScrollBar(Atr_Hlist_ScrollFrameScrollBar)
		Atr_ListTabs:Point('BOTTOMRIGHT', Atr_HeadingsBar, 'TOPRIGHT', 8, 1)
		Atr_Back_Button:Point('TOPLEFT', Atr_HeadingsBar, 'TOPLEFT', 0, 19)

		AuctionatorCloseButton:ClearAllPoints()
		AuctionatorCloseButton:Point('BOTTOMLEFT', Atr_Main_Panel, 'BOTTOMRIGHT', -17, 10)
		Atr_Buy1_Button:Point('RIGHT', AuctionatorCloseButton, 'LEFT', -5, 0)
		Atr_CancelSelectionButton:Point('RIGHT', Atr_Buy1_Button, 'LEFT', -5, 0)
		Atr_SellControls_Tex:StripTextures()
		Atr_SellControls_Tex:StyleButton()
		Atr_SellControls_Tex:SetTemplate('Default', true)
		AS:UnregisterSkinEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinAuctionator, 'AUCTION_HOUSE_SHOW', 'ADDON_LOADED')