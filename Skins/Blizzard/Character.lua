local AS = unpack(AddOnSkins)

function AS:Blizzard_CharacterFrame()
	AS:SkinCloseButton(CharacterFrameCloseButton)
	AS:SkinFrame(CharacterFrame)
	AS:SkinFrame(CharacterModelFrame)
	CharacterModelFrame:SetBackdropColor(0,0,0,0)
	CharacterFramePortrait:Kill()
	PaperDollSidebarTabs:SetPoint('BOTTOMRIGHT', CharacterFrameInsetRight, 'TOPRIGHT', -29, -1)

	local CharacterSlots = {
		CharacterHeadSlot,
		CharacterNeckSlot,
		CharacterShoulderSlot,
		CharacterBackSlot,
		CharacterChestSlot,
		CharacterShirtSlot,
		CharacterTabardSlot,
		CharacterWristSlot,
		CharacterHandsSlot,
		CharacterWaistSlot,
		CharacterLegsSlot,
		CharacterFeetSlot,
		CharacterFinger0Slot,
		CharacterFinger1Slot,
		CharacterTrinket0Slot,
		CharacterTrinket1Slot,
		CharacterMainHandSlot,
		CharacterSecondaryHandSlot,
	}
	
	for _, Slot in pairs(CharacterSlots) do
		AS:SkinTexture(Slot.icon)
		AS:SkinFrame(Slot)
		Slot.icon:SetInside()
		Slot.ignoreTexture:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])
		Slot.IconBorder:SetTexture(nil)
		hooksecurefunc(Slot.IconBorder, 'SetVertexColor', function(self, r, g, b)
			Slot:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Slot.IconBorder, 'Hide', function(self)
			Slot:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
		AS:StyleButton(Slot)
	end

	AS:StripTextures(CharacterFrameInset)
	AS:StripTextures(CharacterFrameInsetRight)
	AS:StripTextures(CharacterStatsPane)

	CharacterFrameExpandButton:Size(CharacterFrameExpandButton:GetWidth() - 5, CharacterFrameExpandButton:GetHeight() - 5)
	AS:SkinNextPrevButton(CharacterFrameExpandButton)
	CharacterFrameExpandButton:SetPoint('BOTTOMRIGHT', CharacterFrameInset, 'BOTTOMRIGHT', -4, 4)

	EquipmentFlyoutFrameHighlight:Kill()

	local function SkinItemFlyouts()
		AS:StripTextures(EquipmentFlyoutFrame.buttonFrame)
		for i = 1, #EquipmentFlyoutFrame.buttons do
			local button = _G["EquipmentFlyoutFrameButton"..i]
			if not button.isStyled then
				AS:SetTemplate(button)
				AS:StyleButton(button)
				button.IconBorder:SetTexture(nil)
				button:HookScript('OnUpdate', function(self)
					if self.IconBorder:IsShown() then
						self:SetBackdropBorderColor(self.IconBorder:GetVertexColor())
					end
				end)
				button:HookScript('OnHide', function(self)
					self.IconBorder:Hide() -- Apparently not getting hidden by blizzard?
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end)

				AS:SkinTexture(button.icon)
				button:GetNormalTexture():SetTexture(nil)

				button.icon:SetInside()
				button.isStyled = true
			end
		end
	end

	-- Swap item flyout frame (shown when holding alt over a slot)
	hooksecurefunc("EquipmentFlyout_Show", SkinItemFlyouts)

	local ScrollBars = {
		PaperDollTitlesPaneScrollBar,
		PaperDollEquipmentManagerPaneScrollBar,
		CharacterStatsPaneScrollBar,
		ReputationListScrollFrameScrollBar,
	}

	for _, ScrollBar in pairs(ScrollBars) do
		AS:SkinScrollBar(ScrollBar)
	end

	--Titles
	PaperDollTitlesPane:HookScript('OnShow', function(self)
		for x, object in pairs(PaperDollTitlesPane.buttons) do
			if not object.isStyled then
				object.BgTop:SetTexture(nil)
				object.BgBottom:SetTexture(nil)
				object.BgMiddle:SetTexture(nil)
				object.SelectedBar:SetTexture(nil)
				object:SetHighlightTexture(nil)
				object:HookScript('OnEnter', function(self) self.text:SetTextColor(0, 0.44, .87) end)
				object:HookScript('OnLeave', function(self) self.text:SetTextColor(1, .82, 0) end)
				object.isStyled = true
			end

			object.text:SetFont(AS.Font, 12)
		end
	end)

	--Equipement Manager
	AS:SkinButton(PaperDollEquipmentManagerPaneEquipSet)
	AS:SkinButton(PaperDollEquipmentManagerPaneSaveSet)
	AS:SkinScrollBar(GearManagerDialogPopupScrollFrameScrollBar)
	AS:SkinFrame(GearManagerDialogPopup)
	GearManagerDialogPopup:Point("LEFT", PaperDollFrame, "RIGHT", 4, 0)
	AS:StripTextures(GearManagerDialogPopupScrollFrame)
	AS:SkinEditBox(GearManagerDialogPopupEditBox)
	AS:SkinButton(GearManagerDialogPopupOkay)
	AS:SkinButton(GearManagerDialogPopupCancel)
	PaperDollEquipmentManagerPaneEquipSet:Width(PaperDollEquipmentManagerPaneEquipSet:GetWidth() - 8)
	PaperDollEquipmentManagerPaneSaveSet:Width(PaperDollEquipmentManagerPaneSaveSet:GetWidth() - 8)
	PaperDollEquipmentManagerPaneEquipSet:Point("TOPLEFT", PaperDollEquipmentManagerPane, "TOPLEFT", 8, 0)
	PaperDollEquipmentManagerPaneSaveSet:Point("LEFT", PaperDollEquipmentManagerPaneEquipSet, "RIGHT", 4, 0)
	PaperDollEquipmentManagerPaneEquipSet.ButtonBackground:SetTexture(nil)
	PaperDollEquipmentManagerPane:HookScript("OnShow", function(self)
		for x, object in pairs(PaperDollEquipmentManagerPane.buttons) do
			AS:SetTemplate(object)
			object.BgTop:SetTexture(nil)
			object.HighlightBar:SetInside()
			object.SelectedBar:SetInside()
			object.BgBottom:SetTexture(nil)
			object.BgMiddle:SetTexture(nil)

			AS:SkinTexture(object.icon)
		end
	end)

	for i = 1, NUM_GEARSET_ICONS_SHOWN do
		local Button = _G["GearManagerDialogPopupButton"..i]
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
	end

	for i = 1, 4 do
		AS:SkinTab(_G["CharacterFrameTab"..i])
	end

	for i = 1, #PAPERDOLL_SIDEBARS do
		local tab = _G["PaperDollSidebarTab"..i]
		tab.Highlight:SetTexture(1, 1, 1, 0.3)
		tab.Highlight:Point("TOPLEFT", 3, -4)
		tab.Highlight:Point("BOTTOMRIGHT", -1, 0)
		tab.Hider:SetTexture(0.4,0.4,0.4,0.4)
		tab.Hider:Point("TOPLEFT", 3, -4)
		tab.Hider:Point("BOTTOMRIGHT", -1, 0)
		tab.TabBg:Kill()
		AS:CreateBackdrop(tab, 'Default')
		tab.Backdrop:Point("TOPLEFT", 1, -2)
		tab.Backdrop:Point("BOTTOMRIGHT", 1, -2)

		if i == 1 then
			for i = 1, tab:GetNumRegions() do
				local region = select(i, tab:GetRegions())
				region:SetTexCoord(0.16, 0.86, 0.16, 0.86)
				region.SetTexCoord = AS.Noop
			end
		end
	end

	for i = 1, 7 do
		local Frame = _G["CharacterStatsPaneCategory"..i]
		Frame.BgTop:SetTexture(nil)
		Frame.BgBottom:SetTexture(nil)
		Frame.BgMiddle:SetTexture(nil)
		Frame.BgMinimized:SetTexture(nil)
		AS:SkinFrame(Frame, nil, true)
	end

	-- Pet
	AS:CreateBackdrop(PetModelFrame, 'Default')
	AS:SkinNextPrevButton(PetModelFrameRotateRightButton)
	AS:SkinNextPrevButton(PetModelFrameRotateLeftButton)
	PetModelFrameRotateRightButton:ClearAllPoints()
	PetModelFrameRotateRightButton:Point("LEFT", PetModelFrameRotateLeftButton, "RIGHT", 4, 0)

	AS:CreateBackdrop(PetPaperDollPetInfo, 'Default')
	PetPaperDollPetInfo:Size(24, 24)
	PetPaperDollPetInfo:GetRegions():SetTexCoord(.12, .63, .15, .55)

	-- Reputation
	for i = 1, 15 do
		AS:SkinStatusBar(_G["ReputationBar"..i.."ReputationBar"])
		_G["ReputationBar"..i.."Background"]:SetTexture(nil)
		_G["ReputationBar"..i.."ReputationBarHighlight1"]:SetTexture(nil)
		_G["ReputationBar"..i.."ReputationBarHighlight2"]:SetTexture(nil)	
		_G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:SetTexture(nil)
		_G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:SetTexture(nil)
		_G["ReputationBar"..i.."ReputationBarLeftTexture"]:SetTexture(nil)
		_G["ReputationBar"..i.."ReputationBarRightTexture"]:SetTexture(nil)
		_G["ReputationBar"..i.."ExpandOrCollapseButton"]:SetNormalTexture("Interface\\Buttons\\UI-PlusMinus-Buttons")
		_G["ReputationBar"..i.."ExpandOrCollapseButton"].SetNormalTexture = function() end
		_G["ReputationBar"..i.."ExpandOrCollapseButton"]:GetNormalTexture():SetInside()
		_G["ReputationBar"..i.."ExpandOrCollapseButton"]:SetHighlightTexture(nil)
	end

	local function UpdateFaction()
		local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)
		local numFactions = GetNumFactions()
		for i = 1, NUM_FACTIONS_DISPLAYED, 1 do
			local Bar = _G["ReputationBar"..i]
			local Button = _G["ReputationBar"..i.."ExpandOrCollapseButton"]
			local FactionName = _G["ReputationBar"..i.."FactionName"]
			local factionIndex = factionOffset + i
			if ( factionIndex <= numFactions ) then
				local name, _, _, _, _, _, atWarWith, canToggleAtWar, _, isCollapsed = GetFactionInfo(factionIndex);

				if isCollapsed then
					Button:GetNormalTexture():SetTexCoord(0, 0.4375, 0, 0.4375)
				else
					Button:GetNormalTexture():SetTexCoord(0.5625, 1, 0, 0.4375)
				end

				FactionName:SetText(name)
				if atWarWith and canToggleAtWar then
					FactionName:SetFormattedText("%s|TInterface\\Buttons\\UI-CheckBox-SwordCheck:16:16:%d:0:32:32:0:16:0:16|t", name, -(16 + FactionName:GetStringWidth()))
				end
			end
		end
	end

	AS:StripTextures(ReputationListScrollFrame)
	AS:SkinFrame(ReputationDetailFrame)
	ReputationDetailFrame:Point("TOPLEFT", ReputationFrame, "TOPRIGHT", 4, -28)
	hooksecurefunc("ReputationFrame_Update", UpdateFaction)
	AS:SkinCloseButton(ReputationDetailCloseButton)
	AS:SkinCheckBox(ReputationDetailAtWarCheckBox)
	ReputationDetailAtWarCheckBox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-SwordCheck")
	AS:SkinCheckBox(ReputationDetailLFGBonusReputationCheckBox)
	AS:SkinCheckBox(ReputationDetailInactiveCheckBox)
	AS:SkinCheckBox(ReputationDetailMainScreenCheckBox)

	--Currency
	AS:SkinFrame(TokenFramePopup)
	AS:SkinScrollBar(TokenFrameContainerScrollBar)
	AS:SkinCloseButton(TokenFramePopupCloseButton)
	AS:SkinCheckBox(TokenFramePopupInactiveCheckBox)
	AS:SkinCheckBox(TokenFramePopupBackpackCheckBox)
	TokenFramePopup:Point("TOPLEFT", TokenFrame, "TOPRIGHT", 4, -28)				
	hooksecurefunc('TokenFrame_Update', function()
		for i = 1, GetCurrencyListSize() do
			local button = _G["TokenFrameContainerButton"..i]
			if button and not button.isSkinned then
				button.highlight:Kill()
				button.categoryMiddle:Kill()
				button.categoryLeft:Kill()
				button.categoryRight:Kill()
				AS:SkinTexture(button.icon)
				button.isSkinned = true
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_CharacterFrame', AS.Blizzard_CharacterFrame)