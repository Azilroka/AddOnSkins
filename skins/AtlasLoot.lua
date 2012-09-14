if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("AtlasLoot_Loader") then return end
local U = unpack(select(2,...))
local function AL_OnShow(self, event, ...)
	AtlasLootPanel:Point("TOP", AtlasLootDefaultFrame, "BOTTOM", 0, -1)
	AtlasLootQuickLooksButton:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", 53, 33)
	AtlasLootPanelSearch_Box:ClearAllPoints()
	AtlasLootPanelSearch_Box:Point("TOP", AtlasLoot_PanelButton_7, "BOTTOM", 80, -10)
	AtlasLootPanelSearch_SearchButton:Point("LEFT", AtlasLootPanelSearch_Box, "RIGHT", 5, 0)
	AtlasLootPanelSearch_SelectModuel:Point("LEFT", AtlasLootPanelSearch_SearchButton, "RIGHT", 5, 0)
	AtlasLootPanelSearch_ClearButton:Point("LEFT", AtlasLootPanelSearch_SelectModuel, "RIGHT", 5, 0)
	AtlasLootPanelSearch_LastResultButton:Point("LEFT", AtlasLootPanelSearch_ClearButton, "RIGHT", 5, 0)
	AtlasLoot10Man25ManSwitch:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", -130, 4)
	AtlasLootServerQueryButton:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", 130, 4)
	
	if AtlasLoot_PanelButton_2 then AtlasLoot_PanelButton_2:Point("LEFT", AtlasLoot_PanelButton_1, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_3 then AtlasLoot_PanelButton_3:Point("LEFT", AtlasLoot_PanelButton_2, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_4 then AtlasLoot_PanelButton_4:Point("LEFT", AtlasLoot_PanelButton_3, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_5 then AtlasLoot_PanelButton_5:Point("LEFT", AtlasLoot_PanelButton_4, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_6 then AtlasLoot_PanelButton_6:Point("LEFT", AtlasLoot_PanelButton_5, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_8 then AtlasLoot_PanelButton_8:Point("LEFT", AtlasLoot_PanelButton_7, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_9 then AtlasLoot_PanelButton_9:Point("LEFT", AtlasLoot_PanelButton_8, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_10 then AtlasLoot_PanelButton_10:Point("LEFT", AtlasLoot_PanelButton_9, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_11 then AtlasLoot_PanelButton_11:Point("LEFT", AtlasLoot_PanelButton_10, "RIGHT", 1, 0) end
	if AtlasLoot_PanelButton_12 then AtlasLoot_PanelButton_12:Point("LEFT", AtlasLoot_PanelButton_11, "RIGHT", 1, 0) end

	AtlasLootCompareFrameSortButton_Rarity:Point("LEFT", AtlasLootCompareFrameSortButton_Name, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_1:Point("LEFT", AtlasLootCompareFrameSortButton_Rarity, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_2:Point("LEFT", AtlasLootCompareFrameSortButton_1, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_3:Point("LEFT", AtlasLootCompareFrameSortButton_2, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_4:Point("LEFT", AtlasLootCompareFrameSortButton_3, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_5:Point("LEFT", AtlasLootCompareFrameSortButton_4, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_6:Point("LEFT", AtlasLootCompareFrameSortButton_5, "RIGHT", 1, 0)
	AtlasLootCompareFrame_CloseButton2:Point("BOTTOMRIGHT", AtlasLootCompareFrame, "BOTTOMRIGHT", -7, 10)
	AtlasLootCompareFrame_WishlistButton:Point("RIGHT", AtlasLootCompareFrame_CloseButton2, "LEFT", -1, 0)
	AtlasLootCompareFrameSearch_SearchButton:Point("LEFT", AtlasLootCompareFrameSearch_Box, "RIGHT", 5, 0)
	AtlasLootCompareFrameSearch_SelectModuel:Point("LEFT", AtlasLootCompareFrameSearch_SearchButton, "RIGHT", 5, 0)
	AtlasLootDefaultFrame_CloseButton:ClearAllPoints()
	AtlasLootDefaultFrame_CloseButton:SetPoint("TOPRIGHT",  AtlasLootDefaultFrame, "TOPRIGHT", -5 -2)

	AtlasLootDefaultFrame:SetFrameStrata("Medium")
	AtlasLootItemsFrame:SetFrameStrata("High")

	for i = 1, 30 do
		if _G["AtlasLootDefaultFrame_ScrollLine"..i] then _G["AtlasLootDefaultFrame_ScrollLine"..i]:SetFrameStrata("HIGH") end
	end
	AtlasLootDefaultFrame_ModuleSelect:SetFrameStrata("High")
	AtlasLootDefaultFrame_InstanceSelect:SetFrameStrata("High")
	AtlasLoot_AtlasInfoFrame_ToggleALButton:SetFrameStrata("High")
	AtlasLootDefaultFrame_CompareFrame:SetFrameStrata("High")

	local AL = ""
		if AL == "" then
			AtlasLootPanelSearch_Box:SetHeight(16)
			AtlasLootPanel:SetWidth(921)
		end
		
				U.Desaturate(AtlasLootDefaultFrame_LockButton)
				
end

local function Nine_IsThere(Self, event, ...)
	for i = 1, 9 do 
		local f = _G["AtlasLootCompareFrameSortButton_"..i]
		f:SetWidth(44.44)
	end
				
	local StripAllTextures = {
		"AtlasLootCompareFrameSortButton_7",
		"AtlasLootCompareFrameSortButton_8",
		"AtlasLootCompareFrameSortButton_9",
		}

	local SetTemplateD = { 
		"AtlasLootCompareFrameSortButton_7",
		"AtlasLootCompareFrameSortButton_8",
		"AtlasLootCompareFrameSortButton_9",
		}

	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end	

	for _, object in pairs(SetTemplateD) do
		_G[object]:SetTemplate("Default")
	end		

	AtlasLootCompareFrameSortButton_7:Point("LEFT", AtlasLootCompareFrameSortButton_6, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_8:Point("LEFT", AtlasLootCompareFrameSortButton_7, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_9:Point("LEFT", AtlasLootCompareFrameSortButton_8, "RIGHT", 1, 0)
				
end

local function Compare_OnShow(self, event, ...)
	for i = 1, 6 do 
		local f = _G["AtlasLootCompareFrameSortButton_"..i]
		f:SetWidth(67.17)
	end
	
	local Nine = AtlasLootCompareFrameSortButton_9
		if Nine ~= nil then
			Nine:SetScript("OnUpdate", Nine_IsThere)
			else
			end	
		U.SkinScrollBar(AtlasLootCompareFrame_ScrollFrameItemFrameScrollBar)
		U.SkinScrollBar(AtlasLootCompareFrame_WishlistScrollFrameScrollBar)
end

local name = 'AtlasLootSkin'
local function SkinAL(self)
	LoadAddOn("AtlasLoot")

	local FrameShow = AtlasLootDefaultFrame
	FrameShow:SetScript("OnUpdate", AL_OnShow)
		
	local CompareFrameShow = AtlasLootCompareFrame
	CompareFrameShow:SetScript("OnUpdate", Compare_OnShow)

	local StripAllTextures = {
                "AtlasLootDefaultFrame",
                "AtlasLootItemsFrame",
		"AtlasLootPanel",
		"AtlasLootCompareFrame",
		"AtlasLootCompareFrame_ScrollFrameMainFilterScrollChildFrame",
		"AtlasLootCompareFrame_ScrollFrameItemFrame",
		"AtlasLootCompareFrame_ScrollFrameMainFilter",
		"AtlasLootCompareFrameSortButton_Name",
		"AtlasLootCompareFrameSortButton_Rarity",
		"AtlasLootCompareFrameSortButton_1",
		"AtlasLootCompareFrameSortButton_2",
		"AtlasLootCompareFrameSortButton_3",
		"AtlasLootCompareFrameSortButton_4",
		"AtlasLootCompareFrameSortButton_5",
		"AtlasLootCompareFrameSortButton_6",
		}

	local SetTemplateD = {
                "AtlasLootItemsFrame",
		"AtlasLootCompareFrameSortButton_Name",
		"AtlasLootCompareFrameSortButton_Rarity",
		"AtlasLootCompareFrameSortButton_1",
		"AtlasLootCompareFrameSortButton_2",
		"AtlasLootCompareFrameSortButton_3",
		"AtlasLootCompareFrameSortButton_4",
		"AtlasLootCompareFrameSortButton_5",
		"AtlasLootCompareFrameSortButton_6",
		}

	local SetTemplateT = {
                "AtlasLootDefaultFrame",
                "AtlasLootPanel",
		"AtlasLootCompareFrame",
		}	
	
	local buttons = {
                "AtlasLoot_AtlasInfoFrame_ToggleALButton",
                "AtlasLootServerQueryButton",
                "AtlasLootPanelSearch_SearchButton",
                "AtlasLootDefaultFrame_CompareFrame",
		"AtlasLootPanelSearch_ClearButton",
		"AtlasLootPanelSearch_LastResultButton",
		"AtlasLoot10Man25ManSwitch",
		"AtlasLootItemsFrame_BACK",
		"AtlasLootCompareFrameSearch_ClearButton",
		"AtlasLootCompareFrameSearch_SearchButton",
		"AtlasLootCompareFrame_WishlistButton",
		"AtlasLootCompareFrame_CloseButton2",
		}
							
	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end	

	for _, object in pairs(SetTemplateD) do
		_G[object]:SetTemplate("Default")
	end	

	for _, object in pairs(SetTemplateT) do
		_G[object]:SetTemplate("Transparent")
	end			

	for _, button in pairs(buttons) do
		U.SkinButton(_G[button])
	end	

	if AtlasLoot_PanelButton_1 then U.SkinButton(AtlasLoot_PanelButton_1) end
	if AtlasLoot_PanelButton_2 then U.SkinButton(AtlasLoot_PanelButton_2) end
	if AtlasLoot_PanelButton_3 then U.SkinButton(AtlasLoot_PanelButton_3) end
	if AtlasLoot_PanelButton_4 then U.SkinButton(AtlasLoot_PanelButton_4) end
	if AtlasLoot_PanelButton_5 then U.SkinButton(AtlasLoot_PanelButton_5) end
	if AtlasLoot_PanelButton_6 then U.SkinButton(AtlasLoot_PanelButton_6) end
	if AtlasLoot_PanelButton_7 then U.SkinButton(AtlasLoot_PanelButton_7) end
	if AtlasLoot_PanelButton_8 then U.SkinButton(AtlasLoot_PanelButton_8) end
	if AtlasLoot_PanelButton_9 then U.SkinButton(AtlasLoot_PanelButton_9) end
	if AtlasLoot_PanelButton_10 then U.SkinButton(AtlasLoot_PanelButton_10) end
	if AtlasLoot_PanelButton_11 then U.SkinButton(AtlasLoot_PanelButton_11) end
	if AtlasLoot_PanelButton_12 then U.SkinButton(AtlasLoot_PanelButton_12) end
					
	for i = 1, 15 do
		local f = _G["AtlasLootCompareFrameMainFilterButton"..i]
		f:StripTextures()
	end

	U.SkinCloseButton(AtlasLootDefaultFrame_CloseButton)
	U.SkinCloseButton(AtlasLootCompareFrame_CloseButton)
	U.SkinCloseButton( AtlasLootCompareFrame_CloseButton_Wishlist)

	U.Desaturate(AtlasLootDefaultFrame_LockButton)

	U.SkinNextPrevButton(AtlasLootQuickLooksButton)
	U.SkinNextPrevButton(AtlasLootItemsFrame_NEXT)
	AtlasLootItemsFrame_NEXT:SetWidth(25)
	AtlasLootItemsFrame_NEXT:SetHeight(25)
	U.SkinNextPrevButton(AtlasLootItemsFrame_PREV)
	AtlasLootItemsFrame_PREV:SetWidth(25)
	AtlasLootItemsFrame_PREV:SetHeight(25)
	U.SkinNextPrevButton(AtlasLootPanelSearch_SelectModuel)	
	U.SkinNextPrevButton(AtlasLootCompareFrameSearch_SelectModuel)		

	U.SkinDropDownBox(AtlasLootDefaultFrame_ModuleSelect)
	AtlasLootDefaultFrame_ModuleSelect:SetWidth(240)
	AtlasLootDefaultFrame_ModuleSelect:SetPoint("TOPLEFT", AtlasLootDefaultFrame, "TOPLEFT", 50, -50)
	U.SkinDropDownBox(AtlasLootDefaultFrame_InstanceSelect)
	AtlasLootDefaultFrame_InstanceSelect:SetWidth(240)
	U.SkinDropDownBox(AtlasLootCompareFrameSearch_StatsListDropDown)
	AtlasLootCompareFrameSearch_StatsListDropDown:SetWidth(240)
	U.SkinDropDownBox(AtlasLootCompareFrame_WishlistDropDown)
	AtlasLootCompareFrame_WishlistDropDown:SetWidth(240)

	U.SkinEditBox(AtlasLootPanelSearch_Box)
	U.SkinEditBox(AtlasLootCompareFrameSearch_Box)

	U.SkinCheckBox(AtlasLootFilterCheck)
	U.SkinCheckBox(AtlasLootItemsFrame_Heroic)
	U.SkinCheckBox(AtlasLootCompareFrameSearch_FilterCheck)
	U.SkinCheckBox(AtlasLootItemsFrame_RaidFinder)

	local Frame = AtlasLootPanel
	Frame.Titel:SetTextColor(23/255, 132/255, 209/255)
	Frame.Titel:SetPoint("BOTTOM", Frame.TitelBg, "BOTTOM", 0, 40)
end

U.RegisterSkin(name,SkinAL)