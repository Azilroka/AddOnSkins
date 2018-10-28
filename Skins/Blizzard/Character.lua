local AS = unpack(AddOnSkins)

function AS:Blizzard_ArtifactUI(event, addon)
	if addon ~= 'Blizzard_ArtifactUI' then return end

	AS:SkinBackdropFrame(ArtifactFrame)
	AS:SkinCloseButton(ArtifactFrame.CloseButton)

	for i = 1, 2 do
		AS:SkinTab(_G["ArtifactFrameTab" .. i])
	end

--	ArtifactFrameTab1:SetPoint("TOPLEFT", ArtifactFrame, "BOTTOMLEFT", 0, 0)

	ArtifactFrame.ForgeBadgeFrame.ItemIcon:Hide()
	ArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:ClearAllPoints()
	ArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:SetPoint("TOPLEFT", ArtifactFrame)

	ArtifactFrame.AppearancesTab:HookScript("OnShow", function(self)
		for i = 1, self:GetNumChildren() do
			local child = select(i, self:GetChildren())
			if child and child.appearanceID and not child.Backdrop then
				AS:SkinTexture(child.SwatchTexture, true)
				child.Border:SetAlpha(0)
				child.Background:SetAlpha(0)
				child.HighlightTexture:SetAlpha(0)
				child.HighlightTexture.SetAlpha = AS.Noop

				if child.Selected:IsShown() then
					child.backdrop:SetBackdropBorderColor(1,1,1)
				end

				child.Selected:SetAlpha(0)
				child.Selected.SetAlpha = AS.Noop

				hooksecurefunc(child.Selected, "SetShown", function(_, isActive)
					if isActive then
						child.backdrop:SetBackdropBorderColor(1,1,1)
					else
						child.backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))
					end
				end)
			end
		end
	end)
end

function AS:Blizzard_AzeriteUI(event, addon)
	if addon ~= 'Blizzard_AzeriteUI' then return end

	AS:SkinBackdropFrame(AzeriteEmpoweredItemUI)
	AS:StripTextures(AzeriteEmpoweredItemUI.BorderFrame)
	AzeriteEmpoweredItemUI.portrait:SetAlpha(0)

	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()
	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.KeyOverlay.Shadow:Hide()

	AS:SkinCloseButton(AzeriteEmpoweredItemUICloseButton)
end

local function SkinEtheralFrame(frame)
	frame.CornerTL:Hide()
	frame.CornerTR:Hide()
	frame.CornerBL:Hide()
	frame.CornerBR:Hide()

	local name = frame:GetName()
	_G[name.."LeftEdge"]:Hide()
	_G[name.."RightEdge"]:Hide()
	_G[name.."TopEdge"]:Hide()
	_G[name.."BottomEdge"]:Hide()

	local bg = select(23, frame:GetRegions())
	bg:ClearAllPoints()
	bg:SetPoint("TOPLEFT", -50, 25)
	bg:SetPoint("BOTTOMRIGHT")
	bg:SetTexture([[Interface\Transmogrify\EtherealLines]], true, true)
	bg:SetHorizTile(true)
	bg:SetVertTile(true)
	bg:SetAlpha(0.5)
end

function AS:Blizzard_AzeriteRespecUI(event, addon)
	if addon ~= 'Blizzard_AzeriteRespecUI' then return end

	local AzeriteRespecFrame = _G["AzeriteRespecFrame"]
	AzeriteRespecFrame:SetClipsChildren(true)
	AzeriteRespecFrame.Background:Hide()
	SkinEtheralFrame(AzeriteRespecFrame)

	AzeriteRespecFramePortraitFrame:Hide()
	AzeriteRespecFramePortrait:Hide()
	AzeriteRespecFrameTitleBg:Hide()
	AzeriteRespecFrameTopBorder:Hide()
	AzeriteRespecFrameTopRightCorner:Hide()
	AzeriteRespecFrameRightBorder:Hide()
	AzeriteRespecFrameLeftBorder:Hide()
	AzeriteRespecFrameBottomBorder:Hide()
	AzeriteRespecFrameBotRightCorner:Hide()
	AzeriteRespecFrameBotLeftCorner:Hide()
	AzeriteRespecFrameBg:Hide()

	local ItemSlot = AzeriteRespecFrame.ItemSlot
	ItemSlot:SetSize(64, 64)
	ItemSlot:SetPoint("CENTER", AzeriteRespecFrame)
	ItemSlot.Icon:ClearAllPoints()
	ItemSlot.Icon:SetPoint("TOPLEFT", 1, -1)
	ItemSlot.Icon:SetPoint("BOTTOMRIGHT", -1, 1)
	ItemSlot.GlowOverlay:SetAlpha(0)

	AzeriteRespecFrame.ItemSlot:CreateBackdrop("Transparent")
	AzeriteRespecFrame.ItemSlot.backdrop:SetBackdropColor(153/255, 0/255, 153/255, 0.5)
	AS:SkinTexture(AzeriteRespecFrame.ItemSlot.Icon)

	local ButtonFrame = AzeriteRespecFrame.ButtonFrame
	ButtonFrame:GetRegions():Hide()
	ButtonFrame.ButtonBorder:Hide()
	ButtonFrame.ButtonBottomBorder:Hide()

	ButtonFrame.MoneyFrameEdge:Hide()
	ButtonFrame.MoneyFrame:ClearAllPoints()
	ButtonFrame.MoneyFrame:SetPoint("BOTTOMRIGHT", ButtonFrame.MoneyFrameEdge, 7, 5)

	AzeriteRespecFrame:CreateBackdrop("Transparent")
	AzeriteRespecFrame.backdrop:SetAllPoints()

	AS:SkinButton(AzeriteRespecFrame.ButtonFrame.AzeriteRespecButton)
	AS:SkinCloseButton(AzeriteRespecFrameCloseButton)
end

function AS:Blizzard_Character()
	CHARACTERFRAME_EXPANDED_WIDTH = 580

	AS:SkinFrame(CharacterFrame)
	AS:SkinCloseButton(CharacterFrame.CloseButton)

	CharacterFrame:HookScript('OnShow', function() PaperDollBgDesaturate(false) end)

	AS:SkinBackdropFrame(CharacterModelFrame)
	CharacterModelFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -2)
	AS:CreateShadow(CharacterModelFrame.Backdrop, true)

	CharacterFramePortrait:Kill()

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

function AS:Blizzard_TradeWindow(event, addon)
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

AS:RegisterSkin("Blizzard_ArtifactUI", AS.Blizzard_ArtifactUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_AzeriteUI", AS.Blizzard_AzeriteUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_AzeriteRespecUI", AS.Blizzard_AzeriteRespecUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_Character', AS.Blizzard_Character)
AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)
AS:RegisterSkin('Blizzard_ItemSocketingUI', AS.Blizzard_ItemSocketingUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_TradeWindow', AS.Blizzard_TradeWindow)