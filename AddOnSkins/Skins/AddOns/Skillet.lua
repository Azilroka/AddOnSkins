local AS, L, S, R = unpack(AddOnSkins)

function R:Skillet()
	local function SkinButton(ButtonOrSpellID, Guild)
		if not ButtonOrSpellID then return end

		local button = type(ButtonOrSpellID) == 'number' and _G[format('SkilletFrameTradeButton-%s-'..ButtonOrSpellID, Guild and 'Guild Recipes' or AS.MyName)] or _G[ButtonOrSpellID]

		if not button then return end

		local texture = button:GetName() and _G[button:GetName()..'Icon'] or button:GetNormalTexture()

		S:HandleButton(button)

		S:StyleButton(button)

		if Guild then
			button:ClearAllPoints()
			button:SetPoint('BOTTOMLEFT', SkilletRankFrame, 'TOPLEFT', 0, 3)
		end

		if texture then
			texture:ClearAllPoints()
			S:SetInside(texture)
			S:HandleIcon(texture)
		end
	end

	local function SkinShopping(self)
		S:HandleFrame(SkilletShoppingList)
		S:HandleFrame(SkilletShoppingListParent,'Default')
		S:HandleCloseButton(SkilletShoppingListCloseButton)
		S:HandleCheckBox(SkilletShowQueuesFromAllAlts)
		S:HandleScrollBar(SkilletShoppingListListScrollBar)
	end

	local function SkinPluginButtons(self)
		local index = 1
		while _G['SkilletPluginDropdown'..index] do
			S:HandleButton(_G['SkilletPluginDropdown'..index])
			index = index + 1
		end
	end

	local Frames = { SkilletFrame, SkilletRecipeNotesFrame, SkilletSkillTooltip, SkilletStandaloneQueue, SkilletIgnoreList }
	local Backdrops = { SkilletSkillListParent, SkilletReagentParent, SkilletQueueParent, SkilletQueueManagementParent }
	local ReagentIcons = { SkilletSkillIcon, SkilletReagent1Icon, SkilletReagent2Icon, SkilletReagent3Icon, SkilletReagent4Icon, SkilletReagent5Icon, SkilletReagent6Icon, SkilletReagent7Icon, SkilletReagent8Icon, SkilletReagent9Icon, SkilletReagent10Icon }

	local function SkilletFrameOnShow(self)
		SkinButton('SkilletDoBasic_Campfire')
		SkinButton(SkilletDoProspecting)
		SkinButton(SkilletDoDisenchant)
		SkinButton(SkilletDoMilling)

		SkinButton(2259)
		SkinButton(2018)
		SkinButton(7411)
		SkinButton(4036)
		SkinButton(45357)
		SkinButton(25229)
		SkinButton(2108)
		SkinButton(2656)
		SkinButton(3908)
		SkinButton(53428)
		SkinButton(3273)
		SkinButton(2550)

		_G['SkilletHideUncraftableRecipes']:SetScript('OnUpdate', nil)

		SkinButton(SkilletHideUncraftableRecipes)
		SkinButton(SkilletRecipeDifficultyButton)
		SkinButton(SkilletExpandAllButton)
		SkinButton(SkilletCollapseAllButton)

		for _, object in pairs(Frames) do
			S:HandleFrame(object)
		end

		for _, object in pairs(Backdrops) do
			S:HandleFrame(object, true)
			S:SetInside(object.backdrop)
		end

		S:HandleCloseButton(SkilletNotesCloseButton)

		S:HandleTooltip(SkilletTradeskillTooltip)
		S:HandleScrollBar(SkilletQueueListScrollBar)

		for i = 1, 2 do
			local queDelete = _G['SkilletQueueButton'..i..'DeleteButton']
			if queDelete then
				S:HandleButton(queDelete)
				queDelete:SetSize(14, 14)
			end
		end

		if Enchantrix_BarkerOptions_Frame then
			S:HandleFrame(Enchantrix_BarkerOptions_Frame)
			Enchantrix_BarkerOptions_Frame:SetHeight(480)

			for i = 1, 4 do
				S:HandleTab(_G['Enchantrix_BarkerOptions_FrameTab'..i])
			end

			Enchantrix_BarkerOptions_FrameTab1:ClearAllPoints()
			Enchantrix_BarkerOptions_FrameTab1:SetPoint('TOPLEFT', Enchantrix_BarkerOptions_Frame, 'BOTTOMLEFT', 11, 1)
			Enchantrix_BarkerOptions_CloseButton:SetPoint('TOPRIGHT', Enchantrix_BarkerOptions_Frame, 'TOPRIGHT', -5, -2)
			S:HandleButton(Enchantrix_BarkerOptionsBark_Button)
			S:HandleButton(Enchantrix_BarkerOptionsReset_Button)
			S:HandleButton(Enchantrix_BarkerOptionsTest_Button)
			S:HandleCloseButton(Enchantrix_BarkerOptions_CloseButton)
		end
	end

	local function SkinReagentIcon(self, event, ...)
		for _, button in pairs(ReagentIcons) do
			SkinButton(button)
		end
	end

	local function SkilletFrameOnUpdate(self, event, ...)
		if SkilletQueueButton13DeleteButton then
			for i = 1, 13 do
				local queDelete = _G['SkilletQueueButton'..i..'DeleteButton']
				if queDelete then
					S:HandleButton(queDelete)
					queDelete:SetWidth(14)
					queDelete:SetHeight(14)
				end
			end
		end
	end

	local Buttons = {
		SkilletQueueAllButton,
		SkilletCreateAllButton,
		SkilletQueueButton,
		SkilletCreateButton,
		SkilletQueueManagementButton,
		SkilletPluginButton,
		SkilletShoppingListButton,
		SkilletEmptyQueueButton,
		SkilletStartQueueButton,
		SkilletQueueOnlyButton,
		SkilletQueueLoadButton,
		SkilletQueueDeleteButton,
		SkilletQueueSaveButton,
		SkilletRecipeNotesButton,
		SkilletIgnoredMatsButton,
		SkilletMerchantBuyFrameButton,
	}

	for _, button in pairs(Buttons) do
		S:HandleButton(button)
	end

	S:HandleCloseButton(SkilletFrameCloseButton)
	S:HandleCloseButton(SkilletStandaloneQueueCloseButton)

	S:HandleDropDownBox(SkilletRecipeGroupDropdown, 155)
	SkilletRecipeGroupDropdownText:SetPoint('RIGHT', SkilletRecipeGroupDropdownRight, 'RIGHT', -40, -2)
	S:HandleDropDownBox(SkilletSortDropdown, 155)
	SkilletSortDropdownText:SetPoint('RIGHT', SkilletSortDropdownRight, 'RIGHT', -40, -2)
	S:HandleDropDownBox(SkilletQueueLoadDropdown, 160)
	SkilletQueueLoadDropdownText:SetPoint('RIGHT', SkilletQueueLoadDropdownRight, 'RIGHT', -40, -2)
	SkilletQueueLoadButton:SetPoint('LEFT', SkilletQueueLoadDropdown, 'RIGHT', -10, 0)
	SkilletQueueDeleteButton:SetPoint('LEFT', SkilletQueueLoadButton, 'RIGHT', 2, 0)

	if SkilletSearchFilterClear then
		S:Desaturate(SkilletSearchFilterClear)
	end

	S:HandleNextPrevButton(SkilletSortAscButton)
	S:HandleNextPrevButton(SkilletSortDescButton)
	S:HandleNextPrevButton(SkilletRecipeGroupOperations)

	S:HandleEditBox(SkilletItemCountInputBox)
	S:HandleEditBox(SkillButtonNameEdit)
	S:HandleEditBox(GroupButtonNameEdit)
	S:HandleEditBox(SkilletQueueSaveEditBox)
	SkilletQueueSaveEditBox.backdrop:SetAllPoints()
	SkilletQueueSaveButton:SetPoint('LEFT', SkilletQueueSaveEditBox, 'RIGHT', 2, 0)

	S:StripTextures(SkilletRankFrameBorder)

	S:HandleStatusBar(SkilletRankFrame)
	SkilletRankFrame:SetHeight(10)
	S:HandleScrollBar(SkilletSkillListScrollBar)

	_G['SkilletSkillListParent']:SetScript('OnShow', SkilletFrameOnShow)
	_G['SkilletSkillListParent']:SetScript('OnUpdate', SkilletFrameOnUpdate)
	_G['SkilletShoppingList']:SetScript('OnShow', SkinShopping)
	_G['SkilletReagentParent']:SetScript('OnUpdate', SkinReagentIcon)
	_G['SkilletPluginButton']:SetScript('PostClick', SkinPluginButtons)
end

AS:RegisterSkin('Skillet')
