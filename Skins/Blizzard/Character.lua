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
		Slot.IconBorder:SetAlpha(0)
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

	EquipmentFlyoutFrameHighlight:Kill()

	local function ColorizeStatPane(frame)
		if(frame.leftGrad) then return end
		local color = RAID_CLASS_COLORS[AS.MyClass]
		local r, g, b = color.r, color.g, color.b
		frame.leftGrad = frame:CreateTexture(nil, "BORDER")
		frame.leftGrad:SetWidth(80)
		frame.leftGrad:SetHeight(frame:GetHeight())
		frame.leftGrad:SetPoint("LEFT", frame, "CENTER")
		frame.leftGrad:SetTexture(AS.Blank)
		frame.leftGrad:SetGradientAlpha("Horizontal", r, g, b, 0.35, r, g, b, 0)

		frame.rightGrad = frame:CreateTexture(nil, "BORDER")
		frame.rightGrad:SetWidth(80)
		frame.rightGrad:SetHeight(frame:GetHeight())
		frame.rightGrad:SetPoint("RIGHT", frame, "CENTER")
		frame.rightGrad:SetTexture(AS.Blank)
		frame.rightGrad:SetGradientAlpha("Horizontal", r, g, b, 0, r, g, b, 0.35)
	end

	CharacterStatsPane.ItemLevelFrame.Background:SetAlpha(0)
	ColorizeStatPane(CharacterStatsPane.ItemLevelFrame)

	hooksecurefunc("PaperDollFrame_UpdateStats", function()
		local level = UnitLevel("player");
		local categoryYOffset = -5;
		local statYOffset = 0;

		if ( level >= MIN_PLAYER_LEVEL_FOR_ITEM_LEVEL_DISPLAY ) then
			PaperDollFrame_SetItemLevel(CharacterStatsPane.ItemLevelFrame, "player");
			CharacterStatsPane.ItemLevelFrame.Value:SetTextColor(GetItemLevelColor());
			CharacterStatsPane.ItemLevelCategory:Show();
			CharacterStatsPane.ItemLevelFrame:Show();
			CharacterStatsPane.AttributesCategory:SetPoint("TOP", 0, -76);
		else
			CharacterStatsPane.ItemLevelCategory:Hide();
			CharacterStatsPane.ItemLevelFrame:Hide();
			CharacterStatsPane.AttributesCategory:SetPoint("TOP", 0, -20);
			categoryYOffset = -12;
			statYOffset = -6;
		end

		local spec = GetSpecialization();
		local role = GetSpecializationRole(spec);

		CharacterStatsPane.statsFramePool:ReleaseAll();
		local statFrame = CharacterStatsPane.statsFramePool:Acquire();

		local lastAnchor;

		for catIndex = 1, #PAPERDOLL_STATCATEGORIES do
			local catFrame = CharacterStatsPane[PAPERDOLL_STATCATEGORIES[catIndex].categoryFrame];
			local numStatInCat = 0;
			for statIndex = 1, #PAPERDOLL_STATCATEGORIES[catIndex].stats do
				local stat = PAPERDOLL_STATCATEGORIES[catIndex].stats[statIndex];
				local showStat = true;
				if ( showStat and stat.primary ) then
					local primaryStat = select(6, GetSpecializationInfo(spec, nil, nil, nil, UnitSex("player")));
					if ( stat.primary ~= primaryStat ) then
						showStat = false;
					end
				end
				if ( showStat and stat.roles ) then
					local foundRole = false;
					for _, statRole in pairs(stat.roles) do
						if ( role == statRole ) then
							foundRole = true;
							break;
						end
					end
					showStat = foundRole;
				end
				if ( showStat ) then
					statFrame.onEnterFunc = nil;
					PAPERDOLL_STATINFO[stat.stat].updateFunc(statFrame, "player");
					if ( not stat.hideAt or stat.hideAt ~= statFrame.numericValue ) then
						if ( numStatInCat == 0 ) then
							if ( lastAnchor ) then
								catFrame:SetPoint("TOP", lastAnchor, "BOTTOM", 0, categoryYOffset);
							end
							lastAnchor = catFrame;
							statFrame:SetPoint("TOP", catFrame, "BOTTOM", 0, -2);
						else
							statFrame:SetPoint("TOP", lastAnchor, "BOTTOM", 0, statYOffset);
						end
						numStatInCat = numStatInCat + 1;
						statFrame.Background:SetShown(false);
						ColorizeStatPane(statFrame)
						statFrame.leftGrad:SetShown((numStatInCat % 2) == 0)
						statFrame.rightGrad:SetShown((numStatInCat % 2) == 0)
						lastAnchor = statFrame;
						statFrame = CharacterStatsPane.statsFramePool:Acquire();
					end
				end
			end
			catFrame:SetShown(numStatInCat > 0);
		end
		CharacterStatsPane.statsFramePool:Release(statFrame);
	end)

	local function StatsPane(type)
		AS:StripTextures(CharacterStatsPane[type])
	end

	StatsPane("EnhancementsCategory")
	StatsPane("ItemLevelCategory")
	StatsPane("AttributesCategory")

	local function SkinItemFlyouts()
		AS:StripTextures(EquipmentFlyoutFrame.buttonFrame)
		for i = 1, #EquipmentFlyoutFrame.buttons do
			local button = _G["EquipmentFlyoutFrameButton"..i]
			if not button.isStyled then
				AS:SetTemplate(button)
				AS:StyleButton(button)
				button.IconBorder:SetAlpha(0)
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
	GearManagerDialogPopup:SetPoint("LEFT", PaperDollFrame, "RIGHT", 4, 0)
	AS:StripTextures(GearManagerDialogPopupScrollFrame)
	AS:SkinEditBox(GearManagerDialogPopupEditBox)
	AS:SkinButton(GearManagerDialogPopupOkay)
	AS:SkinButton(GearManagerDialogPopupCancel)
	PaperDollEquipmentManagerPaneEquipSet:SetWidth(PaperDollEquipmentManagerPaneEquipSet:GetWidth() - 8)
	PaperDollEquipmentManagerPaneSaveSet:SetWidth(PaperDollEquipmentManagerPaneSaveSet:GetWidth() - 8)
	PaperDollEquipmentManagerPaneEquipSet:SetPoint("TOPLEFT", PaperDollEquipmentManagerPane, "TOPLEFT", 8, 0)
	PaperDollEquipmentManagerPaneSaveSet:SetPoint("LEFT", PaperDollEquipmentManagerPaneEquipSet, "RIGHT", 4, 0)
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
		AS:StyleButton(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
	end

	for i = 1, 3 do
		AS:SkinTab(_G["CharacterFrameTab"..i])
	end

	for i = 1, #PAPERDOLL_SIDEBARS do
		local tab = _G["PaperDollSidebarTab"..i]
		tab.Highlight:SetColorTexture(1, 1, 1, 0.3)
		tab.Highlight:SetPoint("TOPLEFT", 3, -4)
		tab.Highlight:SetPoint("BOTTOMRIGHT", -1, 0)
		tab.Hider:SetColorTexture(0.4,0.4,0.4,0.4)
		tab.Hider:SetPoint("TOPLEFT", 3, -4)
		tab.Hider:SetPoint("BOTTOMRIGHT", -1, 0)
		tab.TabBg:Kill()
		AS:CreateBackdrop(tab, 'Default')
		tab.Backdrop:SetPoint("TOPLEFT", 1, -2)
		tab.Backdrop:SetPoint("BOTTOMRIGHT", 1, -2)

		if i == 1 then
			for i = 1, tab:GetNumRegions() do
				local region = select(i, tab:GetRegions())
				region:SetTexCoord(0.16, 0.86, 0.16, 0.86)
				region.SetTexCoord = AS.Noop
			end
		end
	end

--[[
	-- Pet
	AS:CreateBackdrop(PetModelFrame, 'Default')
	AS:SkinNextPrevButton(PetModelFrameRotateRightButton)
	AS:SkinNextPrevButton(PetModelFrameRotateLeftButton)
	PetModelFrameRotateRightButton:ClearAllPoints()
	PetModelFrameRotateRightButton:SetPoint("LEFT", PetModelFrameRotateLeftButton, "RIGHT", 4, 0)

	AS:CreateBackdrop(PetPaperDollPetInfo, 'Default')
	PetPaperDollPetInfo:SetSize(24, 24)
	PetPaperDollPetInfo:GetRegions():SetTexCoord(.12, .63, .15, .55)
]]

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
	ReputationDetailFrame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", 4, -28)
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
	TokenFramePopup:SetPoint("TOPLEFT", TokenFrame, "TOPRIGHT", 4, -28)				
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