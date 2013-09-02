﻿local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "SkilletSkin"
function AS:SkinSkillet()
	local function SkinButton(ButtonOrSpellID)
		if not ButtonOrSpellID then return end
		local button
		if type(ButtonOrSpellID) == "number" then
			local player = UnitName("player")
			local buttonName = "SkilletFrameTradeButton-"..player.."-"..tostring(ButtonOrSpellID)
			button = _G[buttonName]
		else
			button = ButtonOrSpellID
		end
		if not button then return end
		local texture = button:GetNormalTexture()
		if not texture then
			texture = _G[button:GetName().."Icon"]
		end
		if not texture then return end
		button:SetTemplate()
		texture:SetDrawLayer('OVERLAY')
		texture:ClearAllPoints()
		texture:SetInside()
		AS:SkinTexture(texture)
		button:SetHighlightTexture(nil)
	end

	local function SkinGuildRecipes(ButtonOrSpellID)
		if not ButtonOrSpellID then return end
		local button
		if type(ButtonOrSpellID) == "number" then
			local buttonName = "SkilletFrameTradeButton-Guild Recipes-"..tostring(ButtonOrSpellID)
			button = _G[buttonName]
		else
			button = ButtonOrSpellID
		end
		if not button then return end
		local texture = button:GetNormalTexture()
		if not texture then
			texture = _G[button:GetName().."Icon"]
			button:ClearAllPoints()
			button:SetPoint("BOTTOMLEFT", SkilletRankFrame, "TOPLEFT", 0, 3)
		end
		if not texture then return end
		button:SetTemplate()
		texture:SetDrawLayer('OVERLAY')
		texture:ClearAllPoints()
		texture:SetInside()
		AS:SkinTexture(texture)
		button:SetHighlightTexture(nil)
	end

	local function SkinReagentButton(ButtonName)
		if not ButtonName then return end
		local button = ButtonName
		if not button then return end
		local texture = button:GetNormalTexture()
		if not texture then
			texture = _G[button:GetName().."Icon"]
		end
		if not texture then return end
		button:SetTemplate()
		texture:SetDrawLayer('OVERLAY')
		texture:ClearAllPoints()
		texture:SetInside()
		AS:SkinTexture(texture)
	end

	local function SkinIcon(self)

		if SkilletDoBasic_Campfire then SkinButton(SkilletDoBasic_Campfire) end
		if SkilletDoProspecting then SkinButton(SkilletDoProspecting) end
		if SkilletDoDisenchant then SkinButton(SkilletDoDisenchant) end
		if SkilletDoMilling then SkinButton(SkilletDoMilling) end

		if 2259 then SkinButton(2259) end -- Alchemy	
		if 2018 then SkinButton(2018) end -- Blacksmithing
		if 7411 then SkinButton(7411) end -- Enchanting
		if 4036 then SkinButton(4036) end -- Engineering	
		if 45357 then SkinButton(45357) end -- Inscription
		if 25229 then SkinButton(25229) end -- Jewelcrafting
		if 2108 then SkinButton(2108) end -- Leatherworking
		if 2656 then SkinButton(2656) end -- Smelting
		if 3908 then SkinButton(3908) end -- Tailoring
		if 2550 then SkinButton(2550) end -- Cooking
		if 3273 then SkinButton(3273) end -- Firstaid
		if 53428 then SkinButton(53428) end -- Runeforging

		_G["SkilletHideUncraftableRecipes"]:SetScript("OnUpdate", nil)

		SkinButton(SkilletHideUncraftableRecipes)
		SkinButton(SkilletRecipeDifficultyButton)
		SkinButton(SkilletExpandAllButton)
		SkinButton(SkilletCollapseAllButton)
		AS:SkinButton(SkilletShowOptionsButton)
		SkilletShowOptionsButton:SetHeight(16)
		SkilletShowOptionsButton:SetWidth(12)
		SkilletShowOptionsButton:SetPoint("RIGHT", SkilletFrameCloseButton, "LEFT", 3, 0)
		
		if not SkilletShowOptionsButton.text then
			SkilletShowOptionsButton.text = SkilletShowOptionsButton:CreateFontString(nil, 'OVERLAY')
			SkilletShowOptionsButton.text:SetFont(AS.Font, 12, 'OUTLINE')
			SkilletShowOptionsButton.text:SetText(" ?")
			SkilletShowOptionsButton.text:SetTextColor(1, 0, 0)	
			SkilletShowOptionsButton.text:SetJustifyH('CENTER')
			SkilletShowOptionsButton.text:SetPoint('CENTER', SkilletShowOptionsButton, 'CENTER')
		end
	end

	local function SkinShopping(self)
		AS:SkinFrame(SkilletShoppingList)
		AS:SkinFrame(SkilletShoppingListParent,"Default")
		AS:SkinCloseButton(SkilletShoppingListCloseButton)
		AS:SkinCheckBox(SkilletShowQueuesFromAllAlts)
		AS:SkinScrollBar(SkilletShoppingListListScrollBar)
	end

	local function SkinPluginButtons(self)
		AS:SkinButton(_G["SkilletPluginDropdown1"])
		AS:SkinButton(_G["SkilletPluginDropdown2"])
	end	

	local function SkilletFrameOnShow(self)
		local StripAllTextures = {
			"SkilletFrame",
			"SkilletSkillListParent",
			"SkilletReagentParent",
			"SkilletQueueParent",
			"SkilletRecipeNotesFrame",
			"SkilletQueueManagementParent",
			"SkilletSkillTooltip",
			"SkilletStandalonQueue",
			"SkilletViewCraftersParent",
		}

		for _, object in pairs(StripAllTextures) do
			_G[object]:StripTextures()
		end	

		local SetTemplateD = {
			"SkilletSkillListParent",
			"SkilletReagentParent",
			"SkilletQueueParent",
			"SkilletQueueManagementParent",
			"SkilletViewCraftersParent",
		}

		local SetTemplateT = {
			"SkilletFrame",
			"SkilletRecipeNotesFrame",
			"SkilletSkillTooltip",
			"SkilletStandalonQueue",
		}	

		for _, object in pairs(SetTemplateD) do
			AS:SkinFrame(_G[object],"Default")
		end	

		for _, object in pairs(SetTemplateT) do
			AS:SkinFrame(_G[object])
		end	

		AS:SkinCloseButton(SkilletNotesCloseButton)
		SkilletSkillListParent:SetPoint("TOPLEFT", SkilletFrame, "TOPLEFT", 5, -100)
		SkilletRankFrame:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", -12, -57)
		SkilletRankFrameRed:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", -12, -70)
		SkilletRankFrameOrange:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", -12, -70)
		SkilletRankFrameYellow:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", -12, -70)
		SkilletRankFrameGreen:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", -12, -70)
		SkilletRankFrameGray:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", -12, -70)
		SkilletRecipeGroupDropdown:SetPoint("BOTTOMLEFT", SkilletSkillListParent, "TOPLEFT", 45, 43)
		SkilletRecipeGroupOperations:SetPoint("LEFT", SkilletRecipeGroupDropdownButton, "RIGHT", 4, 0)
		SkilletSortAscButton:SetPoint("LEFT", SkilletSortDropdownButton, "RIGHT", 4, 0)
		SkilletSortDescButton:SetPoint("LEFT", SkilletSortDropdownButton, "RIGHT", 4, 0)
		SkilletSearchFilterClear:SetPoint("LEFT", SkilletFilterBox, "RIGHT", -2, 0)
		SkilletQueueSaveButton:SetPoint("LEFT", SkilletQueueSaveEditBox, "RIGHT", 5, 0)
		SkilletQueueLoadButton:SetPoint("LEFT", SkilletQueueLoadDropdownButton, "RIGHT", 5, 0)
		SkilletQueueDeleteButton:SetPoint("LEFT", SkilletQueueLoadButton, "RIGHT", 2, 0)
		SkilletHideUncraftableRecipes:SetPoint("BOTTOMRIGHT", SkilletSkillListParent, "TOPRIGHT", -5, 5)
		SkilletFrameCloseButton:ClearAllPoints()
		SkilletFrameCloseButton:SetPoint("TOPRIGHT", SkilletFrame, "TOPRIGHT", 0, 0)
		SkilletTradeSkillLinkButton:SetPoint("RIGHT", SkilletShowOptionsButton, "LEFT", 0, 0)
		SkilletViewCraftersButton:SetPoint("RIGHT", SkilletQueueManagementButton, "LEFT", -5, 0)

		AS:SkinTooltip(SkilletTradeskillTooltip)
		AS:SkinScrollBar(SkilletQueueListScrollBar)

		for i = 1, 3 do
			local queDelete = _G["SkilletQueueButton"..i.."DeleteButton"]
			AS:SkinButton(queDelete)
			queDelete:SetWidth(14)
			queDelete:SetHeight(14)
		end

		if Enchantrix_BarkerOptions_Frame then
			AS:SkinFrame(Enchantrix_BarkerOptions_Frame)
			Enchantrix_BarkerOptions_Frame:SetHeight(480)
			for i = 1, 4 do 
				tabs = _G["Enchantrix_BarkerOptions_FrameTab"..i]
				AS:SkinTab(tabs)
			end
			Enchantrix_BarkerOptions_FrameTab1:ClearAllPoints()
			Enchantrix_BarkerOptions_FrameTab1:SetPoint("TOPLEFT", Enchantrix_BarkerOptions_Frame, "BOTTOMLEFT", 11, 1)
			Enchantrix_BarkerOptions_CloseButton:SetPoint("TOPRIGHT", Enchantrix_BarkerOptions_Frame, "TOPRIGHT", -5, -2)
			AS:SkinButton(Enchantrix_BarkerOptionsBark_Button)
			AS:SkinButton(Enchantrix_BarkerOptionsReset_Button)
			AS:SkinButton(Enchantrix_BarkerOptionsTest_Button)
			AS:SkinCloseButton(Enchantrix_BarkerOptions_CloseButton)
		end
	end

	local function SkinReagentIcon(self, event, ...)
		local ReagentIcons = {
			"SkilletSkillIcon",
			"SkilletReagent1Icon",
			"SkilletReagent2Icon",
			"SkilletReagent3Icon",
			"SkilletReagent4Icon",
			"SkilletReagent5Icon",
			"SkilletReagent6Icon",
			"SkilletReagent7Icon",
			"SkilletReagent8Icon",
			"SkilletReagent9Icon",
			"SkilletReagent10Icon",
		}

		for _, button in pairs(ReagentIcons) do
			SkinReagentButton(_G[button])
		end
	end

	local function SkilletFrameOnUpdate(self, event, ...)
		SkilletRecipeNotesButton:SetPoint("BOTTOMRIGHT", SkilletReagentParent, "TOPRIGHT", 0, 2)
		SkilletQueueManagementButton:SetPoint("RIGHT", SkilletRecipeNotesButton, "LEFT", -5, 0)
		SkilletItemCountInputBox:SetPoint("BOTTOM", SkilletCreateCountSlider, "TOP", 0, 2)	

		if SkilletDoBasic_Campfire then
			SkilletDoBasic_Campfire:ClearAllPoints()
			SkilletDoBasic_Campfire:SetPoint("BOTTOMRIGHT", SkilletRankFrame, "TOPRIGHT", 0, 3)
		end
		if SkilletDoDisenchant then
			SkilletDoDisenchant:ClearAllPoints()
			SkilletDoDisenchant:SetPoint("BOTTOMRIGHT", SkilletRankFrame, "TOPRIGHT", -26, 3)
		end	
		if SkilletDoProspecting then
			SkilletDoProspecting:ClearAllPoints()
			SkilletDoProspecting:SetPoint("BOTTOMRIGHT", SkilletRankFrame, "TOPRIGHT", -52, 3)
		end
		if SkilletDoMilling then
			SkilletDoMilling:ClearAllPoints()
			SkilletDoMilling:SetPoint("BOTTOMRIGHT", SkilletRankFrame, "TOPRIGHT", -78, 3)
		end

		SkinGuildRecipes(2259)
		SkinGuildRecipes(2018)
		SkinGuildRecipes(7411)
		SkinGuildRecipes(4036)
		SkinGuildRecipes(45357)
		SkinGuildRecipes(25229)
		SkinGuildRecipes(2108)
		SkinGuildRecipes(2656)
		SkinGuildRecipes(3908)
		SkinGuildRecipes(53428)
		SkinGuildRecipes(3273)
		SkinGuildRecipes(2550)

		local Skillet = _G.Skillet
		local x = 0
		local player = UnitName("player")
		local icon = "SkilletFrameTradeButtons-"..player
		local template = "SkilletTradeButtonTemplate"
		local tradeSkillList = Skillet.tradeSkillList
		local nonLinkingTrade = { [2656] = true, [53428] = true }
		for i = 1, #tradeSkillList, 1 do
			local tradeID = Skillet.tradeSkillList[i]
			local ranks = Skillet:GetSkillRanks(player, tradeID)
			local tradeLink

			if Skillet.db.realm.linkDB[player] then
				tradeLink = Skillet.db.realm.linkDB[player][tradeID]
				if nonLinkingTrade[tradeID] then
					tradeLink = nil
				end
			end
			if ranks then
				local spellName, _, spellIcon = GetSpellInfo(tradeID)
				local buttonName = "SkilletFrameTradeButton-"..player.."-"..tradeID
				local bName = _G[buttonName]
				if not bName then
					bName = CreateFrame("CheckButton",bName,nil,UIParent)--CreateFrame("CheckButton", buttonName, frame, "SkilletTradeButtonTemplate")
				end 
				bName:ClearAllPoints()
				bName:SetPoint("BOTTOMLEFT", SkilletRankFrame, "TOPLEFT", x, 3)
				x = x + bName:GetWidth() + 1
			end
		end

		if SkilletQueueButton13DeleteButton then
			for i = 1, 13 do
				local queDelete = _G["SkilletQueueButton"..i.."DeleteButton"]
				AS:SkinButton(queDelete)
				queDelete:SetWidth(14)
				queDelete:SetHeight(14)
			end
		end
	end
	local buttons = {
		"SkilletQueueAllButton",
		"SkilletCreateAllButton",
		"SkilletQueueButton",
		"SkilletCreateButton",
		"SkilletQueueManagementButton",
		"SkilletPluginButton",
		"SkilletShoppingListButton",
		"SkilletEmptyQueueButton",
		"SkilletStartQueueButton",
		"SkilletQueueOnlyButton",
		"SkilletQueueLoadButton",
		"SkilletQueueDeleteButton",
		"SkilletQueueSaveButton",
		"SkilletRecipeNotesButton",
		"SkilletViewCraftersButton",
		"SkilletMerchantBuyFrameButton",
	}

	for _, button in pairs(buttons) do
		AS:SkinButton(_G[button])
	end	

	AS:SkinCloseButton(SkilletFrameCloseButton)
	AS:SkinCloseButton(SkilletStandalonQueueCloseButton)
	AS:SkinDropDownBox(SkilletRecipeGroupDropdown)
	AS:SkinDropDownBox(SkilletSortDropdown)
	AS:SkinDropDownBox(SkilletQueueLoadDropdown)
	AS:Desaturate(SkilletSearchFilterClear)
	SkilletSortAscButton:StripTextures()
	SkilletSortAscButton:SetTemplate("Default", true)
	if not SkilletSortAscButton.text then
		SkilletSortAscButton.text = SkilletSortAscButton:CreateFontString(nil, 'OVERLAY')
		SkilletSortAscButton.text:SetFont(AS.PixelFont, 12)
		SkilletSortAscButton.text:Point("CENTER", 0, 0)
		SkilletSortAscButton.text:SetText("^")
	end
	SkilletSortDescButton:StripTextures()
	SkilletSortDescButton:SetTemplate("Default", true)
	if not SkilletSortDescButton.text then
		SkilletSortDescButton.text = SkilletSortDescButton:CreateFontString(nil, 'OVERLAY')
		SkilletSortDescButton.text:SetFont(AS.PixelFont, 12)
		SkilletSortDescButton.text:Point("CENTER", 0, 0)
		SkilletSortDescButton.text:SetText("^")
	end
	AS:SkinNextPrevButton(SkilletRecipeGroupOperations)
	AS:SkinEditBox(SkilletItemCountInputBox)
	AS:SkinEditBox(SkillButtonNameEdit)
	AS:SkinEditBox(GroupButtonNameEdit)
	AS:SkinEditBox(SkilletFilterBox)
	SkilletFilterBox:SetHeight(20)
	AS:SkinEditBox(SkilletQueueSaveEditBox)
	SkilletRankFrameBorder:StripTextures()
	AS:SkinStatusBar(SkilletRankFrame)
	SkilletRankFrame:SetHeight(10)		
	AS:SkinScrollBar(SkilletSkillListScrollBar, 5)

	_G["SkilletSkillListParent"]:SetScript("OnShow", SkilletFrameOnShow)
	_G["SkilletSkillListParent"]:SetScript("OnUpdate", SkilletFrameOnUpdate)
	_G["SkilletShoppingList"]:SetScript("OnShow", SkinShopping)
	_G["SkilletHideUncraftableRecipes"]:SetScript("OnUpdate", SkinIcon)
	_G["SkilletReagentParent"]:SetScript("OnUpdate", SkinReagentIcon)
	_G["SkilletPluginButton"]:SetScript("PostClick", SkinPluginButtons)
end

AS:RegisterSkin(name, AS.SkinSkillet)