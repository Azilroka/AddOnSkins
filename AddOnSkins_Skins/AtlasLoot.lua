local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AtlasLoot') then return end

local name = 'AtlasLootSkin'
function AS:SkinAtlasLoot(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	if addon ~= 'AtlasLoot' then return end

	local function AL_OnShow(self, event, ...)
		AtlasLootPanel:SetPoint('TOP', AtlasLootDefaultFrame, 'BOTTOM', 0, -1)
		AtlasLootQuickLooksButton:SetPoint('BOTTOM', AtlasLootItemsFrame, 'BOTTOM', 53, 33)
		AtlasLootPanelSearch_Box:ClearAllPoints()
		AtlasLootPanelSearch_Box:SetPoint('TOP', AtlasLoot_PanelButton_7, 'BOTTOM', 80, -10)
		AtlasLootPanelSearch_SearchButton:SetPoint('LEFT', AtlasLootPanelSearch_Box, 'RIGHT', 5, 0)
		AtlasLootPanelSearch_SelectModuel:SetPoint('LEFT', AtlasLootPanelSearch_SearchButton, 'RIGHT', 5, 0)
		AtlasLootPanelSearch_ClearButton:SetPoint('LEFT', AtlasLootPanelSearch_SelectModuel, 'RIGHT', 5, 0)
		AtlasLootPanelSearch_LastResultButton:SetPoint('LEFT', AtlasLootPanelSearch_ClearButton, 'RIGHT', 5, 0)
		AtlasLoot10Man25ManSwitch:SetPoint('BOTTOM', AtlasLootItemsFrame, 'BOTTOM', -130, 4)

		for i = 2, 12 do
			local frame = _G['AtlasLoot_PanelButton_'..i]
			if frame and i ~= 7 then
				frame:SetPoint('LEFT', _G['AtlasLoot_PanelButton_'..(i-1)], 'RIGHT', 2, 0)
				frame.SetPoint = AS.Noop
			end
		end

		AtlasLootDefaultFrame_CloseButton:ClearAllPoints()
		AtlasLootDefaultFrame_CloseButton:SetPoint('TOPRIGHT', AtlasLootDefaultFrame, 'TOPRIGHT', -5 -2)

		AtlasLootDefaultFrame:SetFrameLevel(0)
		AtlasLootItemsFrame:SetFrameLevel(1)

		for i = 1, 30 do
			if _G['AtlasLootDefaultFrame_ScrollLine'..i] then _G['AtlasLootDefaultFrame_ScrollLine'..i]:SetFrameLevel(1) end
		end

		AtlasLootDefaultFrame_ModuleSelect:SetFrameLevel(1)
		AtlasLootDefaultFrame_InstanceSelect:SetFrameLevel(1)
		AtlasLoot_AtlasInfoFrame_ToggleALButton:SetFrameLevel(1)
		AtlasLootDefaultFrame_CompareFrame:SetFrameLevel(1)

		AtlasLootPanelSearch_Box:SetHeight(16)
		AtlasLootPanel:SetWidth(AtlasLootDefaultFrame:GetWidth())
	end

	local function Nine_IsThere(self, event, ...)
		for i = 1, 9 do 
			local f = _G['AtlasLootCompareFrameSortButton_'..i]
			f:Width(44)
		end

		local nineisthere = {
			AtlasLootCompareFrameSortButton_7,
			AtlasLootCompareFrameSortButton_8,
			AtlasLootCompareFrameSortButton_9,
		}

		for _, object in pairs(nineisthere) do
			AS:SkinFrame(object)
		end	

		AtlasLootCompareFrameSortButton_7:Point('LEFT', AtlasLootCompareFrameSortButton_6, 'RIGHT', 1, 0)
		AtlasLootCompareFrameSortButton_8:Point('LEFT', AtlasLootCompareFrameSortButton_7, 'RIGHT', 1, 0)
		AtlasLootCompareFrameSortButton_9:Point('LEFT', AtlasLootCompareFrameSortButton_8, 'RIGHT', 1, 0)
	end

	local function Compare_OnShow(self, event, ...)
		for i = 1, 6 do 
			_G['AtlasLootCompareFrameSortButton_'..i]:SetWidth(40)
		end

		AtlasLootCompareFrameSortButton_Rarity:SetPoint('LEFT', AtlasLootCompareFrameSortButton_Name, 'RIGHT', 2, 0)
		AtlasLootCompareFrameSortButton_Rarity:Width(80)
		AtlasLootCompareFrameSortButton_Name:Width(80)

		for i = 1, 6 do
			_G['AtlasLootCompareFrameSortButton_'..i]:SetPoint('LEFT', i == 1 and AtlasLootCompareFrameSortButton_Rarity or _G['AtlasLootCompareFrameSortButton_'..(i - 1)], 'RIGHT', 2, 0)
		end

		AtlasLootCompareFrame_CloseButton2:SetPoint('BOTTOMRIGHT', AtlasLootCompareFrame, 'BOTTOMRIGHT', -7, 10)
		AtlasLootCompareFrame_WishlistButton:SetPoint('RIGHT', AtlasLootCompareFrame_CloseButton2, 'LEFT', -1, 0)
		AtlasLootCompareFrameSearch_SearchButton:SetPoint('LEFT', AtlasLootCompareFrameSearch_Box, 'RIGHT', 5, 0)
		AtlasLootCompareFrameSearch_SelectModuel:SetPoint('LEFT', AtlasLootCompareFrameSearch_SearchButton, 'RIGHT', 5, 0)

		AtlasLootCompareFrameSortButton_9:SetScript('OnUpdate', Nine_IsThere)
	end

	local StripAllTextures = {
		AtlasLootCompareFrame_ScrollFrameMainFilterScrollChildFrame,
		AtlasLootCompareFrame_ScrollFrameItemFrame,
		AtlasLootCompareFrame_ScrollFrameMainFilter,
	}

	local SetTemplateD = {
		AtlasLootItemsFrame,
		AtlasLootCompareFrameSortButton_Name,
		AtlasLootCompareFrameSortButton_Rarity,
		AtlasLootCompareFrameSortButton_1,
		AtlasLootCompareFrameSortButton_2,
		AtlasLootCompareFrameSortButton_3,
		AtlasLootCompareFrameSortButton_4,
		AtlasLootCompareFrameSortButton_5,
		AtlasLootCompareFrameSortButton_6,
	}

	local SetTemplateT = {
		AtlasLootDefaultFrame,
		AtlasLootPanel,
		AtlasLootCompareFrame,
	}	
	
	local Buttons = {
		AtlasLoot_AtlasInfoFrame_ToggleALButton,
		AtlasLootPanelSearch_SearchButton,
		AtlasLootDefaultFrame_CompareFrame,
		AtlasLootPanelSearch_ClearButton,
		AtlasLootPanelSearch_LastResultButton,
		AtlasLoot10Man25ManSwitch,
		AtlasLootItemsFrame_BACK,
		AtlasLootCompareFrameSearch_ClearButton,
		AtlasLootCompareFrameSearch_SearchButton,
		AtlasLootCompareFrame_WishlistButton,
		AtlasLootCompareFrame_CloseButton2,
		AtlasLoot_PanelButton_1,
		AtlasLoot_PanelButton_2,
		AtlasLoot_PanelButton_3,
		AtlasLoot_PanelButton_4,
		AtlasLoot_PanelButton_5,
		AtlasLoot_PanelButton_6,
		AtlasLoot_PanelButton_7,
		AtlasLoot_PanelButton_8,
		AtlasLoot_PanelButton_9,
		AtlasLoot_PanelButton_10,
		AtlasLoot_PanelButton_11,
		AtlasLoot_PanelButton_12,
	}

	for _, object in pairs(StripAllTextures) do
		object:StripTextures()
	end

	for _, object in pairs(SetTemplateD) do
		AS:SkinFrame(object, 'Default')
	end

	for _, object in pairs(SetTemplateT) do
		AS:SkinFrame(object)
	end

	for _, button in pairs(Buttons) do
		AS:SkinButton(button)
	end

	local CloseButtons = {
		AtlasLootDefaultFrame_CloseButton,
		AtlasLootCompareFrame_CloseButton,
		AtlasLootCompareFrame_CloseButton_Wishlist,
	}

	for _, object in pairs(CloseButtons) do
		AS:SkinCloseButton(object)
	end

	local NextPrevButtons = {
		AtlasLootQuickLooksButton,
		AtlasLootItemsFrame_NEXT,
		AtlasLootItemsFrame_PREV,
		AtlasLootPanelSearch_SelectModuel,
		AtlasLootCompareFrameSearch_SelectModuel,
	}

	for _, object in pairs(NextPrevButtons) do
		AS:SkinNextPrevButton(object)
	end

	AS:Desaturate(AtlasLootDefaultFrame_LockButton)
	AtlasLootDefaultFrame_LockButton.Left:Kill()
	AtlasLootDefaultFrame_LockButton.Middle:Kill()
	AtlasLootDefaultFrame_LockButton.Right:Kill()

	AtlasLootItemsFrame_NEXT:SetSize(25, 25)
	AtlasLootItemsFrame_PREV:SetSize(25, 25)

	AS:SkinDropDownBox(AtlasLootDefaultFrame_ModuleSelect)
	AtlasLootDefaultFrame_ModuleSelect:SetWidth(240)
	AtlasLootDefaultFrame_ModuleSelect:SetPoint('TOPLEFT', AtlasLootDefaultFrame, 'TOPLEFT', 50, -50)

	AS:SkinDropDownBox(AtlasLootDefaultFrame_InstanceSelect)
	AtlasLootDefaultFrame_InstanceSelect:SetWidth(240)

	AS:SkinDropDownBox(AtlasLootCompareFrameSearch_StatsListDropDown)
	AtlasLootCompareFrameSearch_StatsListDropDown:SetWidth(240)

	AS:SkinDropDownBox(AtlasLootCompareFrame_WishlistDropDown)
	AtlasLootCompareFrame_WishlistDropDown:SetWidth(240)

	AS:SkinEditBox(AtlasLootPanelSearch_Box)
	AS:SkinEditBox(AtlasLootCompareFrameSearch_Box)

	local CheckBoxes = {
		AtlasLootFilterCheck,
		AtlasLootItemsFrame_Heroic,
		AtlasLootCompareFrameSearch_FilterCheck,
		AtlasLootItemsFrame_RaidFinder,
		AtlasLootItemsFrame_Thunderforged,
		AtlasLootItemsFrame_Flexible,
	}

	for _, object in pairs(CheckBoxes) do
		if object then
			AS:SkinCheckBox(object)
		end
	end

	AtlasLootPanel.Titel:SetTextColor(23/255, 132/255, 209/255)
	AtlasLootPanel.Titel:SetPoint('BOTTOM', AtlasLootPanel.TitelBg, 'BOTTOM', 0, 40)

	AS:SkinScrollBar(AtlasLootCompareFrame_ScrollFrameItemFrameScrollBar)
	AS:SkinScrollBar(AtlasLootCompareFrame_WishlistScrollFrameScrollBar)
	AtlasLootDefaultFrame:HookScript('OnShow', AL_OnShow)
	AtlasLootCompareFrame:HookScript('OnShow', Compare_OnShow)
	AtlasLootPanel:HookScript('OnUpdate', function(self) self:SetWidth(AtlasLootDefaultFrame:GetWidth()) end)
	if AtlasLootTooltip:GetName() ~= 'GameTooltip' then AS:SkinTooltip(AtlasLootTooltip) end

	for i = 1, 15 do
		local f = _G['AtlasLootCompareFrameMainFilterButton'..i]
		f:StripTextures()
	end

	for i = 1, 30 do
		_G['AtlasLootItem_'..i].Icon:SetTexCoord(unpack(AS.TexCoords))
		_G['AtlasLootItem_'..i].MenuIcon:SetTexCoord(unpack(AS.TexCoords))
		_G['AtlasLootItem_'..i].MenuIcon:SetSize(25, 25)
		_G['AtlasLootItem_'..i].MenuIconBorder:SetTexture(nil)
	end

	AtlasLootItemsFrame_EncounterJournalIcon:SetTexCoord(unpack(AS.TexCoords))
	AtlasLootItemsFrame_EncounterJournalIcon:SetInside()
	AtlasLootItemsFrame_EncounterJournalRing:SetTexture(nil)
	AtlasLootItemsFrame_EncounterJournal:SetHighlightTexture(nil)
end

AS:RegisterSkin(name, AS.SkinAtlasLoot, 'ADDON_LOADED')