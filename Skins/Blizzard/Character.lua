local AS = unpack(AddOnSkins)

function AS:Blizzard_CharacterFrame()
	CHARACTERFRAME_EXPANDED_WIDTH = 580

	AS:SkinFrame(CharacterFrame)
	AS:StripTextures(CharacterFrame.Inset)
	AS:SkinCloseButton(CharacterFrame.CloseButton)

	CharacterFrame:HookScript('OnShow', function() PaperDollBgDesaturate(false) end)

	AS:SkinBackdropFrame(CharacterModelFrame)
	CharacterModelFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -2)
	AS:CreateShadow(CharacterModelFrame.Backdrop, true)

	CharacterFramePortrait:Kill()

	PaperDollSidebarTabs:SetPoint('BOTTOMRIGHT', CharacterFrameInsetRight, 'TOPRIGHT', -29, -1)

	for _, Slot in pairs({PaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType("Button") then
			AS:SkinTexture(Slot.icon)
			AS:SkinFrame(Slot)
			AS:StyleButton(Slot)
			AS:CreateShadow(Slot, true)
			Slot.icon:SetInside()

			if Slot.popoutButton:GetPoint() == 'TOP' then
				Slot.popoutButton:SetPoint("TOP", Slot, "BOTTOM", 0, 2);
			else
				Slot.popoutButton:SetPoint("LEFT", Slot, "RIGHT", -2, 0);
			end

			Slot.ignoreTexture:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])
			Slot.IconBorder:SetAlpha(0)
			hooksecurefunc(Slot.IconBorder, 'SetVertexColor', function(self, r, g, b) Slot:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Slot.IconBorder, 'Hide', function(self) Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:StripTextures(CharacterFrameInsetRight)
	AS:StripTextures(CharacterStatsPane)

	CharacterStatsPane.ClassBackground:ClearAllPoints()
	CharacterStatsPane.ClassBackground:SetTexture([[Interface\AddOns\AddOnSkins\Media\ClassIcons\]]..AS.MyClass)
	CharacterStatsPane.ClassBackground:SetPoint('BOTTOM')
	CharacterStatsPane.ClassBackground:SetSize(128, 128)
	CharacterStatsPane.ClassBackground:SetAlpha(.5)

	local function CharacterStatFrameCategoryTemplate(Button)
		local bg = Button.Background
		bg:SetTexture([[Interface\LFGFrame\UI-LFG-SEPARATOR]])
		bg:SetTexCoord(0, 0.6640625, 0, 0.3125)
		bg:ClearAllPoints()
		bg:SetPoint("CENTER", 0, -5)
		bg:SetSize(210, 30)
		local r, g, b = unpack(AS.Color)
		bg:SetVertexColor(r * .7, g * .7, b * .7)
	end

	CharacterStatFrameCategoryTemplate(CharacterStatsPane.EnhancementsCategory)
	CharacterStatFrameCategoryTemplate(CharacterStatsPane.ItemLevelCategory)
	CharacterStatFrameCategoryTemplate(CharacterStatsPane.AttributesCategory)

	CharacterStatsPane.ItemLevelFrame.Background:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
	CharacterStatsPane.ItemLevelFrame.Background:SetVertexColor(unpack(AS.Color))

	for i = 1, 3 do
		AS:SkinTab(_G["CharacterFrameTab"..i])
	end

	for i = 1, #PAPERDOLL_SIDEBARS do
		local tab = _G["PaperDollSidebarTab"..i]
		tab.Highlight:SetColorTexture(1, 1, 1, 0.3)
		tab.Highlight:SetPoint("TOPLEFT", 3, -4)
		tab.Highlight:SetPoint("BOTTOMRIGHT", -1, 0)
		tab.Hider:SetColorTexture(0, 0, 0, .8)
		tab.Hider:SetPoint("TOPLEFT", 3, -4)
		tab.Hider:SetPoint("BOTTOMRIGHT", -1, 0)
		tab.TabBg:Kill()
		AS:CreateBackdrop(tab)
		tab.Backdrop:SetPoint("TOPLEFT", 2, -3)
		tab.Backdrop:SetPoint("BOTTOMRIGHT", 0, -1)
		AS:CreateShadow(tab.Backdrop, true)
	end

	hooksecurefunc("PaperDollFrame_UpdateStats", function()
		for _, Table in ipairs({CharacterStatsPane.statsFramePool:EnumerateActive()}) do
			if type(Table) == 'table' then
				for statFrame in pairs(Table) do
					statFrame.Background:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
					statFrame.Background:SetVertexColor(unpack(AS.Color))
					statFrame.Background:SetInside()
				end
			end
		end
	end)

	hooksecurefunc("EquipmentFlyout_CreateButton", function()
		for _, Button in pairs(EquipmentFlyoutFrame.buttons) do
			if not Button.isStyled then
				AS:SkinTexture(Button.icon)
				AS:SkinFrame(Button)
				AS:StyleButton(Button)
				Button.icon:SetInside()
				Button.IconBorder:SetAlpha(0)
				hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button:SetBackdropBorderColor(r, g, b) end)
				hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
				Button.isStyled = true
			end
		end
	end)

	hooksecurefunc("EquipmentFlyout_Show", function()
		AS:SkinBackdropFrame(EquipmentFlyoutFrame.buttonFrame)
		EquipmentFlyoutFrame.buttonFrame.Backdrop:SetPoint('BOTTOMRIGHT', 5, -2)
	end)

	PaperDollTitlesPane:SetWidth(PaperDollTitlesPane:GetWidth() + 45)
	AS:SkinScrollBar(PaperDollTitlesPane.scrollBar)

	--Titles
	hooksecurefunc('PaperDollTitlesPane_Update', function()
		for _, Title in pairs(PaperDollTitlesPane.buttons) do
			if not Title.isStyled then
				AS:StripTextures(Title)
				Title:SetWidth(Title:GetWidth() + 30)
				Title.Stripe:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
				Title.Stripe.SetColorTexture = AS.Noop
				Title.Check:SetTexture([[Interface\Buttons\UI-CheckBox-Check]])
				Title.text:SetTextColor(1, 1, 1)
				Title:HookScript('OnEnter', function(self) self.text:SetTextColor(unpack(AS.Color)) end)
				Title:HookScript('OnLeave', function(self) self.text:SetTextColor(1, 1, 1) end)
				Title.isStyled = true
			end

			--Title.text:SetFont(AS.Font, 12)
		end
	end)

	--Equipement Manager
	PaperDollEquipmentManagerPane:SetPoint('TOPLEFT', CharacterFrameInsetRight, 'TOPLEFT', 40, -4)
	PaperDollEquipmentManagerPane:SetWidth(PaperDollEquipmentManagerPane:GetWidth() + 9)

	AS:SkinButton(PaperDollEquipmentManagerPane.EquipSet, true)
	AS:SkinButton(PaperDollEquipmentManagerPane.SaveSet)
	AS:SkinScrollBar(PaperDollEquipmentManagerPane.scrollBar)
	PaperDollEquipmentManagerPane.EquipSet:SetPoint("TOPLEFT", PaperDollEquipmentManagerPane, "TOPLEFT", 0, -2)
	PaperDollEquipmentManagerPane.SaveSet:SetPoint("LEFT", PaperDollEquipmentManagerPane.EquipSet, "RIGHT", 4, 0)

	for _, Button in pairs(PaperDollEquipmentManagerPane.buttons) do
		AS:SkinBackdropFrame(Button)
		Button.Check:SetTexture([[Interface\Buttons\UI-CheckBox-Check]])
		AS:SkinTexture(Button.icon, true)
		AS:SkinTexture(Button.SpecIcon)
		Button:HookScript('OnEnter', function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedBar:IsShown() then
				self.Backdrop:SetBackdropBorderColor(1, .9, .1)
				self.icon.Backdrop:SetBackdropBorderColor(1, .9, .1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		hooksecurefunc(Button.SelectedBar, "Show", function() Button.Backdrop:SetBackdropBorderColor(1, .9, .1) Button.icon.Backdrop:SetBackdropBorderColor(1, .9, .1) end)
		hooksecurefunc(Button.SelectedBar, "Hide", function() Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	end

	hooksecurefunc("GearSetButton_SetSpecInfo", function(self, specID)
		if ( specID and specID > 0 ) then
			self.SpecIcon:SetTexture(select(4, GetSpecializationInfoByID(specID)))
		end
	end)

	-- Reputation
	AS:StripTextures(ReputationListScrollFrame)
	AS:SkinScrollBar(ReputationListScrollFrame.ScrollBar)
	AS:SkinFrame(ReputationDetailFrame)
	ReputationDetailFrame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", 4, -28)
	hooksecurefunc("ReputationFrame_Update", function()
		local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)
		local numFactions = GetNumFactions()
		for i = 1, NUM_FACTIONS_DISPLAYED, 1 do
			local FactionName = _G["ReputationBar"..i.."FactionName"]
			local factionIndex = factionOffset + i
			if ( factionIndex <= numFactions ) then
				local name, _, _, _, _, _, atWarWith, canToggleAtWar, isHeader, isCollapsed = GetFactionInfo(factionIndex)
				if isHeader then
					FactionName:SetTextColor(.9, .8, 0)
				else
					if atWarWith and canToggleAtWar then
						FactionName:SetTextColor(1, .1, .1)
					else
						FactionName:SetTextColor(1, 1, 1)
					end
				end
			end
		end
	end)

	AS:SkinCloseButton(ReputationDetailCloseButton)
	AS:SkinCheckBox(ReputationDetailAtWarCheckBox)
	ReputationDetailAtWarCheckBox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-SwordCheck")
	AS:SkinCheckBox(ReputationDetailLFGBonusReputationCheckBox)
	AS:SkinCheckBox(ReputationDetailInactiveCheckBox)
	AS:SkinCheckBox(ReputationDetailMainScreenCheckBox)

	for i = 1, 15 do
		AS:StripTextures(_G["ReputationBar"..i])
		AS:SkinStatusBar(_G["ReputationBar"..i.."ReputationBar"])
	end

	-- Gear Manager
	AS:SkinFrame(GearManagerDialogPopup)
	AS:StripTextures(GearManagerDialogPopup.BorderBox)
	AS:SkinEditBox(GearManagerDialogPopupEditBox)
	AS:SkinButton(GearManagerDialogPopupOkay)
	AS:SkinButton(GearManagerDialogPopupCancel)

	AS:StripTextures(GearManagerDialogPopupScrollFrame)
	AS:SkinScrollBar(GearManagerDialogPopupScrollFrame.ScrollBar)

	GearManagerDialogPopup:SetPoint("LEFT", PaperDollFrame, "RIGHT", 4, 0)
	GearManagerDialogPopup:SetHeight(GearManagerDialogPopup:GetHeight() + 15)
	GearManagerDialogPopupScrollFrame:SetHeight(GearManagerDialogPopupScrollFrame:GetHeight() + 16)

	for i = 1, NUM_GEARSET_ICONS_SHOWN do
		local Button = _G["GearManagerDialogPopupButton"..i]
		AS:SetTemplate(Button)
		AS:StyleButton(Button)
		Button:SetCheckedTexture(nil)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
		hooksecurefunc(Button, 'SetChecked', function(self, value)
			if value == true then
				self:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	--Currency
	AS:SkinFrame(TokenFramePopup)
	AS:SkinScrollBar(TokenFrameContainerScrollBar)
	AS:SkinCloseButton(TokenFramePopupCloseButton)
	AS:SkinCheckBox(TokenFramePopupInactiveCheckBox)
	AS:SkinCheckBox(TokenFramePopupBackpackCheckBox)
	TokenFramePopup:SetPoint("TOPLEFT", TokenFrame, "TOPRIGHT", 4, -28)

	hooksecurefunc('TokenFrame_Update', function()
		for _, Button in pairs(TokenFrameContainer.buttons) do
			Button.categoryMiddle:SetAlpha(0)
			Button.categoryLeft:SetAlpha(0)
			Button.categoryRight:SetAlpha(0)
			Button.highlight:SetAlpha(0)
			Button.stripe:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
			Button.stripe:SetAlpha(.1)
			AS:SkinTexture(Button.icon)
		end
	end)
end

AS:RegisterSkin('Blizzard_CharacterFrame', AS.Blizzard_CharacterFrame)
