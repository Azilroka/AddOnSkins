local AS = unpack(AddOnSkins)

function AS:Blizzard_Character()
	CHARACTERFRAME_EXPANDED_WIDTH = 580

	AS:SkinFrame(CharacterFrame)
	AS:SkinCloseButton(CharacterFrame.CloseButton)

	CharacterFrame:HookScript('OnShow', function() PaperDollBgDesaturate(false) end)

	AS:SkinBackdropFrame(CharacterModelFrame)
	CharacterModelFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -2)
	AS:CreateShadow(CharacterModelFrame.Backdrop, true)

	AS:Kill(CharacterFramePortrait)

	PaperDollSidebarTabs:SetPoint('BOTTOMRIGHT', CharacterFrameInsetRight, 'TOPRIGHT', -29, -1)

	local function UpdateAzerite(self)
		self.AzeriteTexture:SetAtlas("AzeriteIconFrame")
		self.AzeriteTexture:SetOutside()
		self.AzeriteTexture:SetDrawLayer("BORDER", 1)
	end

	for _, Slot in pairs({PaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType("Button") then
			AS:SkinTexture(Slot.icon)
			AS:SkinFrame(Slot)
			AS:StyleButton(Slot)
			AS:CreateShadow(Slot, true)
			Slot.icon:SetInside()

			hooksecurefunc(Slot, "DisplayAsAzeriteItem", UpdateAzerite)
			hooksecurefunc(Slot, "DisplayAsAzeriteEmpoweredItem", UpdateAzerite)

			if Slot.popoutButton:GetPoint() == 'TOP' then
				Slot.popoutButton:SetPoint("TOP", Slot, "BOTTOM", 0, 2)
			else
				Slot.popoutButton:SetPoint("LEFT", Slot, "RIGHT", -2, 0)
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
		AS:Kill(tab.TabBg)
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
				self.Backdrop:SetBackdropBorderColor(1, .8, .1)
				self.icon.Backdrop:SetBackdropBorderColor(1, .8, .1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		hooksecurefunc(Button.SelectedBar, "Show", function() Button.Backdrop:SetBackdropBorderColor(1, .8, .1) Button.icon.Backdrop:SetBackdropBorderColor(1, .8, .1) end)
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
		for i = 1, NUM_FACTIONS_DISPLAYED do
			local FactionName = _G["ReputationBar"..i.."FactionName"]
			local Button = _G["ReputationBar"..i.."ExpandOrCollapseButton"]
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
		if TokenFrameContainer.buttons then
			for _, Button in pairs(TokenFrameContainer.buttons) do
				Button.categoryMiddle:SetAlpha(0)
				Button.categoryLeft:SetAlpha(0)
				Button.categoryRight:SetAlpha(0)
				Button.highlight:SetAlpha(0)
				Button.stripe:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
				Button.stripe:SetAlpha(.1)
				AS:SkinTexture(Button.icon)
			end
		end
	end)
end

function AS:Blizzard_DeathRecap(event, addon)
	if addon ~= 'Blizzard_DeathRecap' then return end

	AS:SkinFrame(DeathRecapFrame)
	AS:SkinCloseButton(DeathRecapFrame.CloseXButton)
	AS:SkinButton(DeathRecapFrame.CloseButton)

	for _, Recap in pairs(DeathRecapFrame.DeathRecapEntry) do
		AS:SkinTexture(Recap.SpellInfo.Icon, true)
		Recap.SpellInfo.IconBorder:SetAlpha(0)
	end

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_DressUpFrame()
	AS:SkinFrame(SideDressUpFrame, nil, nil, true)
	AS:SkinButton(SideDressUpModelResetButton)
	AS:SkinCloseButton(SideDressUpModelCloseButton)

	hooksecurefunc("SetUpSideDressUpFrame", function(parentFrame, closedWidth, openWidth, point, relativePoint, offsetX, offsetY)
		if parentFrame == AuctionFrame then
			SideDressUpFrame:SetPoint(point, parentFrame, relativePoint, 2, offsetY)
		end
	end)

	AS:SkinBackdropFrame(DressUpFrame)
	AS:SkinCloseButton(DressUpFrame.CloseButton)
	AS:SkinButton(DressUpFrame.ResetButton)

	DressUpFrame.portrait:SetAlpha(0)

	AS:SkinMaxMinFrame(MaximizeMinimizeFrame)

	AS:SkinButton(DressUpFrameCancelButton)
	DressUpFrame.ResetButton:SetPoint("RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0)

	AS:SkinDropDownBox(DressUpFrame.OutfitDropDown)

	AS:SkinButton(DressUpFrame.OutfitDropDown.SaveButton)
	DressUpFrame.OutfitDropDown.SaveButton:SetHeight(20)
	DressUpFrame.OutfitDropDown.SaveButton:SetPoint("LEFT", DressUpFrame.OutfitDropDown, 'RIGHT', -10, -5)
end

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end

	AS:SkinFrame(InspectFrame)
	AS:SkinCloseButton(InspectFrame.CloseButton)
	InspectFrame.portrait:SetAlpha(0)

	for i = 1, 4 do
		AS:SkinTab(_G["InspectFrameTab"..i])
	end

	AS:SkinButton(InspectPaperDollFrame.ViewButton)
	AS:SkinBackdropFrame(InspectModelFrame)

	local Slots = { 'Head', 'Neck', 'Shoulder', 'Back', 'Chest', 'Shirt', 'Tabard', 'Wrist', 'Hands', 'Waist', 'Legs', 'Feet', 'Finger0', 'Finger1', 'Trinket0', 'Trinket1', 'MainHand', 'SecondaryHand' }

	for _, Slot in pairs(Slots) do
		local Button = _G['Inspect'..Slot..'Slot']
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
		Button.IconBorder:SetAlpha(0)
		Button:SetFrameLevel(Button:GetFrameLevel() + 2)
		hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		AS:StyleButton(Button)
	end

	AS:StripTextures(InspectPVPFrame)

	for _, Button in pairs(InspectPVPFrame.Slots) do
		AS:CreateBackdrop(Button.Texture)

		Button.Arrow:SetAlpha(0)
		Button.Border:Hide()

		hooksecurefunc(Button, "Update", function(self)
			if (not self.slotIndex) or (not INSPECTED_UNIT) then
				return
			end

			local slotInfo = C_SpecializationInfo.GetInspectSelectedPvpTalent(INSPECTED_UNIT, self.slotIndex)

			if (slotInfo) then
				AS:SkinTexture(self.Texture)
				self.Texture:SetDesaturated(false)
				self.Texture.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			else
				self.Texture:SetTexture([[Interface\PetBattles\PetBattle-LockIcon]])
				self.Texture:SetTexCoord(0, 1, 0, 1)
				self.Texture:SetDesaturated(true)
				self.Texture:Show()
				self.Texture.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
			end
		end)
	end

	AS:StripTextures(InspectTalentFrame)
	InspectTalentFrame.InspectSpec.ring:SetTexture('')
	AS:SkinTexture(InspectTalentFrame.InspectSpec.specIcon, true)

	InspectTalentFrame.InspectSpec:HookScript('OnShow', function(self)
		local Spec, Sex
		if (INSPECTED_UNIT ~= nil) then
			Spec = GetInspectSpecialization(INSPECTED_UNIT)
			Sex = UnitSex(INSPECTED_UNIT)
		end
		if(Spec ~= nil and Spec > 0 and Sex ~= nil) then
			local Role = GetSpecializationRoleByID(Spec)
			if (Role ~= nil) then
				self.specIcon:SetTexture(select(4, GetSpecializationInfoByID(Spec, Sex)))
			end
		end
	end)

	for i = 1, MAX_TALENT_TIERS do
		for j = 1, NUM_TALENT_COLUMNS do
			local Button = InspectTalentFrame.InspectTalents['tier'..i]["talent"..j]
			AS:StripTextures(Button)
			AS:SkinTexture(Button.icon, true)
			hooksecurefunc(Button.border, 'SetShown', function(self, value)
				if value == true then
					Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end
	end

	InspectGuildFrameBG:SetTexture('')

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_ItemSocketingUI(event, addon)
	if addon ~= 'Blizzard_ItemSocketingUI' then return end

	AS:SkinFrame(ItemSocketingFrame)
	ItemSocketingFrame.portrait:SetAlpha(0)
	AS:SkinFrame(ItemSocketingScrollFrame)
	AS:SkinCloseButton(ItemSocketingFrame.CloseButton)

	for i = 1, MAX_NUM_SOCKETS do
		local button = _G["ItemSocketingSocket"..i]
		AS:SkinFrame(button)
		AS:StyleButton(button)
		AS:SkinTexture(button.icon)
		button.icon:ClearAllPoints()
		button.icon:SetInside()
		_G["ItemSocketingSocket"..i.."BracketFrame"]:SetAlpha(0)
		_G["ItemSocketingSocket"..i.."Background"]:SetAlpha(0)
	end

	hooksecurefunc("ItemSocketingFrame_Update", function()
		for i = 1, GetNumSockets() do
			local color = GEM_TYPE_INFO[GetSocketTypes(i)]
			_G["ItemSocketingSocket"..i]:SetBackdropColor(color.r, color.g, color.b, 0.15)
			_G["ItemSocketingSocket"..i]:SetBackdropBorderColor(color.r, color.g, color.b)
		end
	end)

	ItemSocketingSocketButton:ClearAllPoints()
	ItemSocketingSocketButton:SetPoint("BOTTOMRIGHT", ItemSocketingFrame, "BOTTOMRIGHT", -5, 5)
	AS:SkinButton(ItemSocketingSocketButton)
	AS:SkinScrollBar(ItemSocketingScrollFrameScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_TradeWindow()
	AS:SkinFrame(TradeFrame, nil, nil, true)
	AS:StripTextures(TradeRecipientMoneyBg)
	AS:SkinFrame(TradeRecipientMoneyInset)
	AS:SkinButton(TradeFrameTradeButton, true)
	AS:SkinButton(TradeFrameCancelButton, true)
	AS:SkinCloseButton(TradeFrameCloseButton)

	AS:SkinEditBox(TradePlayerInputMoneyFrameGold)
	AS:SkinEditBox(TradePlayerInputMoneyFrameSilver)
	AS:SkinEditBox(TradePlayerInputMoneyFrameCopper)

	AS:StripTextures(TradePlayerInputMoneyInset)
	TradePlayerInputMoneyFrame:SetPoint('TOPLEFT', 8, -59)
	TradePlayerItem1:SetPoint('TOPLEFT', 8, -89)

	for _, Inset in pairs({ TradePlayerItemsInset, TradeRecipientItemsInset, TradePlayerEnchantInset, TradeRecipientEnchantInset }) do
		AS:SkinFrame(Inset)
	end

	for _, Highlight in pairs({ TradeHighlightPlayer, TradeHighlightRecipient, TradeHighlightPlayerEnchant, TradeHighlightRecipientEnchant }) do
		Highlight:StripTextures()
	end

	for _, Frame in pairs({"TradePlayerItem", "TradeRecipientItem"}) do
		for i = 1, 7 do
			local ItemBackground = _G[Frame..i]
			local ItemButton = _G[Frame..i.."ItemButton"]

			AS:StripTextures(ItemBackground)
			AS:SkinFrame(ItemButton)
			AS:StyleButton(ItemButton)

			AS:SkinTexture(ItemButton.icon)
			ItemButton.icon:SetInside()
			AS:CreateBackdrop(ItemButton)
			ItemButton.Backdrop:SetBackdropColor(0, 0, 0, 0)
			ItemButton.Backdrop:SetPoint("TOPLEFT", ItemButton, "TOPRIGHT", 4, 0)
			ItemButton.Backdrop:SetPoint("BOTTOMRIGHT", _G[Frame..i.."NameFrame"], "BOTTOMRIGHT", -1, 14)
		end
	end

	hooksecurefunc('TradeFrame_SetAcceptState', function(playerState, targetState)
		if ( playerState == 1 ) then
			TradePlayerItemsInset:SetBackdropBorderColor(0, 1, 0)
			TradePlayerEnchantInset:SetBackdropBorderColor(0, 1, 0)
		else
			TradePlayerItemsInset:SetBackdropBorderColor(unpack(AS.BorderColor))
			TradePlayerEnchantInset:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
		if ( targetState == 1 ) then
			TradeRecipientItemsInset:SetBackdropBorderColor(0, 1, 0)
			TradeRecipientEnchantInset:SetBackdropBorderColor(0, 1, 0)
			TradeRecipientMoneyInset:SetBackdropBorderColor(0, 1, 0)
		else
			TradeRecipientItemsInset:SetBackdropBorderColor(unpack(AS.BorderColor))
			TradeRecipientEnchantInset:SetBackdropBorderColor(unpack(AS.BorderColor))
			TradeRecipientMoneyInset:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	hooksecurefunc('TradeFrame_UpdatePlayerItem', function(id)
		local tradeItem = _G["TradePlayerItem"..id.."ItemButton"]
		tradeItem:SetBackdropBorderColor(unpack(AS.BorderColor))
		local Link = GetTradePlayerItemLink(id)
		if Link then
			local Quality = select(3, GetItemInfo(Link))
			if Quality and Quality > 1 then
				tradeItem:SetBackdropBorderColor(GetItemQualityColor(Quality))
			end
		end
	end)

	hooksecurefunc('TradeFrame_UpdateTargetItem', function(id)
		local tradeItem = _G["TradeRecipientItem"..id.."ItemButton"]
		tradeItem:SetBackdropBorderColor(unpack(AS.BorderColor))
		local Link = GetTradeTargetItemLink(id)
		if Link then
			local Quality = select(3, GetItemInfo(Link))
			if Quality and Quality > 1 then
				tradeItem:SetBackdropBorderColor(GetItemQualityColor(Quality))
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_Character', AS.Blizzard_Character)
AS:RegisterSkin('Blizzard_DeathRecap', AS.Blizzard_DeathRecap, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)
AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_ItemSocketingUI', AS.Blizzard_ItemSocketingUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_TradeWindow', AS.Blizzard_TradeWindow)