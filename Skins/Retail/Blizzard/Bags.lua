if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local select, unpack = select, unpack
--WoW API / Variables
local BAG_ITEM_QUALITY_COLORS = BAG_ITEM_QUALITY_COLORS
local BankFrameItemButton_Update = BankFrameItemButton_Update
local GetContainerItemInfo = GetContainerItemInfo
local GetContainerItemQuestInfo = GetContainerItemQuestInfo
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function AS:Blizzard_Bags()
	if Tukui and Tukui[2]["Bags"]["Enable"] then return end

	for i = 1, 12 do -- There is 13 Total..
		local Bag = _G["ContainerFrame"..i]
		AS:SkinBackdropFrame(Bag, nil, true)
		for j = 1, 36 do
			local ItemButton = _G["ContainerFrame"..i.."Item"..j]
			--AS:SkinTexture(_G["ContainerFrame"..i.."Item"..j..'IconQuestTexture'])
			AS:SetTemplate(ItemButton)
			AS:SkinTexture(ItemButton.icon)
			ItemButton:SetNormalTexture('')
			ItemButton:SetPushedTexture('')
			ItemButton.icon:SetInside()

			ItemButton.IconBorder:SetAlpha(0)
			ItemButton.NewItemTexture:SetAtlas(nil)
			ItemButton.NewItemTexture.SetAtlas = AS.Noop

			_G["ContainerFrame"..i.."Item"..j..'IconQuestTexture']:SetAlpha(0)

			-- This shit is hax.
			AS:CreateBackdrop(ItemButton)
			AS:CreateShadow(ItemButton.Backdrop)
			ItemButton.Backdrop:Hide()
			hooksecurefunc(ItemButton.NewItemTexture, 'Show', function()
				ItemButton.Backdrop:Show()
			end)
			hooksecurefunc(ItemButton.NewItemTexture, 'Hide', function()
				ItemButton.Backdrop:Hide()
			end)
			ItemButton.Backdrop:SetAllPoints()
			ItemButton.Backdrop:SetFrameStrata(ItemButton:GetFrameStrata())
			ItemButton.Backdrop:SetFrameLevel(ItemButton:GetFrameLevel() + 4)
			ItemButton.Backdrop:SetBackdropColor(0, 0, 0, 0)
			ItemButton.Backdrop:SetScript('OnUpdate', function(self)
				local isQuestItem, questId, isActive = GetContainerItemQuestInfo(ItemButton:GetParent():GetID(), ItemButton:GetID())
				local Quality = select(4, GetContainerItemInfo(ItemButton:GetParent():GetID(), ItemButton:GetID()))
				local QualityColor = Quality and BAG_ITEM_QUALITY_COLORS[Quality] or nil
				ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				if QualityColor then
					self:SetBackdropBorderColor(QualityColor.r, QualityColor.g, QualityColor.b)
					self.Shadow:SetBackdropBorderColor(QualityColor.r, QualityColor.g, QualityColor.b)
				elseif isQuestItem then
					self:SetBackdropBorderColor(1, .82, 0)
					self.Shadow:SetBackdropBorderColor(1, .82, 0)
				else
					self:SetBackdropBorderColor(1, 1, 1)
					self.Shadow:SetBackdropBorderColor(1, 1, 1)
				end
				self:SetAlpha(self:GetParent().NewItemTexture:GetAlpha())
			end)
			ItemButton.Backdrop:SetScript('OnHide', function(self)
				local Quality = select(4, GetContainerItemInfo(ItemButton:GetParent():GetID(), ItemButton:GetID()))
				local isQuestItem, questId, isActive = GetContainerItemQuestInfo(ItemButton:GetParent():GetID(), ItemButton:GetID())
				local QualityColor = Quality and BAG_ITEM_QUALITY_COLORS[Quality] or nil
				if (Quality > _G.LE_ITEM_QUALITY_COMMON and QualityColor) then
					ItemButton:SetBackdropBorderColor(QualityColor.r, QualityColor.g, QualityColor.b)
				elseif isQuestItem then
					ItemButton:SetBackdropBorderColor(1, .82, 0)
				else
					ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			-- End of hax.

			ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
			ItemButton.searchOverlay:SetColorTexture(0, 0, 0, .8)

			ItemButton:SetNormalTexture('')
			AS:StyleButton(ItemButton)
			hooksecurefunc(ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b, a)
				local Quality = select(4, GetContainerItemInfo(ItemButton:GetParent():GetID(), ItemButton:GetID()))
				local isQuestItem = GetContainerItemQuestInfo(ItemButton:GetParent():GetID(), ItemButton:GetID())
				if Quality and Quality > _G.LE_ITEM_QUALITY_COMMON then
					ItemButton:SetBackdropBorderColor(r, g, b)
				elseif isQuestItem then
					ItemButton:SetBackdropBorderColor(1, .82, 0)
				else
					ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			hooksecurefunc(ItemButton.IconBorder, 'Hide', function(self)
				ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end

		Bag.Backdrop:SetPoint("TOPLEFT", 4, -2)
		Bag.Backdrop:SetPoint("BOTTOMRIGHT", 1, 1)
		AS:Kill(_G["ContainerFrame"..i.."BackgroundTop"])
		AS:Kill(_G["ContainerFrame"..i.."BackgroundMiddle1"])
		AS:Kill(_G["ContainerFrame"..i.."BackgroundMiddle2"])
		AS:Kill(_G["ContainerFrame"..i.."BackgroundBottom"])
		AS:SkinCloseButton(_G["ContainerFrame"..i.."CloseButton"])
		AS:SkinButton(Bag.PortraitButton)
		AS:Kill(Bag.PortraitButton.Highlight)
	end

	local function UpdateBagIcon()
		for i = 1, 12 do
			local Portrait = _G["ContainerFrame"..i.."PortraitButton"]
			if i == 1 then
				Portrait:SetNormalTexture("Interface\\ICONS\\INV_Misc_Bag_36")
			elseif i <= 5 and i >= 2 then
				Portrait:SetNormalTexture(_G["CharacterBag"..(i - 2).."SlotIconTexture"]:GetTexture())
			elseif i <= 12 and i >= 6 then
				Portrait:SetNormalTexture(_G.BankSlotsFrame["Bag"..(i-5)].icon:GetTexture())
			end
			if Portrait:GetNormalTexture() then
				AS:SkinTexture(Portrait:GetNormalTexture())
				Portrait:GetNormalTexture():SetInside()
			end
			for j = 1, 30 do
				local ItemButton = _G["ContainerFrame"..i.."Item"..j]
				if ItemButton then
					local QuestIcon = _G["ContainerFrame"..i.."Item"..j.."IconQuestTexture"]
					local QuestTexture = QuestIcon:GetTexture()
					if QuestTexture == _G.TEXTURE_ITEM_QUEST_BANG then
						QuestIcon:SetAlpha(1)
					else
						QuestIcon:SetAlpha(0)
					end
				end
			end
		end
	end

	hooksecurefunc('BankFrameItemButton_Update', UpdateBagIcon)
	hooksecurefunc('ContainerFrame_Update', UpdateBagIcon)

	AS:SkinEditBox(_G.BagItemSearchBox)
	AS:StripTextures(_G.BackpackTokenFrame)

	AS:SkinButton(_G.BagItemAutoSortButton)
	_G.BagItemAutoSortButton:SetNormalTexture("Interface\\ICONS\\INV_Pet_Broom")
	_G.BagItemAutoSortButton:SetPushedTexture("Interface\\ICONS\\INV_Pet_Broom")
	AS:SkinTexture(_G.BagItemAutoSortButton:GetNormalTexture())
	_G.BagItemAutoSortButton:GetNormalTexture():SetInside()
	AS:SkinTexture(_G.BagItemAutoSortButton:GetPushedTexture())
	_G.BagItemAutoSortButton:GetPushedTexture():SetInside()
	_G.BagItemAutoSortButton:SetSize(22, 22)

	_G.BagItemAutoSortButton:SetScript('OnShow', function(self)
		local a, b, c, d, e = self:GetPoint()
		self:SetPoint(a, b, c, d - 3, e - 1)
		self.SetPoint = AS.Noop
		self:SetScript('OnShow', nil)
	end)

	for i = 1, 3 do
		local Token = _G["BackpackTokenFrameToken"..i]
		AS:SkinTexture(Token.icon)
		AS:CreateBackdrop(Token, 'Default')
		Token.Backdrop:SetOutside(Token.icon)
		Token.icon:SetPoint("LEFT", Token.count, "RIGHT", 3, 0)
	end

	AS:SkinFrame(_G.BankFrame, nil, nil, true)
	AS:SkinCloseButton(_G.BankFrameCloseButton)
	AS:StripTextures(_G.BankFrameMoneyFrameBorder)
	AS:StripTextures(_G.BankFrameMoneyFrameInset)
	AS:StripTextures(_G.BankSlotsFrame)

	AS:SkinButton(_G.BankFramePurchaseButton)
	_G.BankFramePurchaseButton:SetHeight(22)

	_G.BankItemSearchBox:SetSize(159, 16)
	AS:SkinEditBox(_G.BankItemSearchBox)

	AS:SkinButton(_G.BankItemAutoSortButton)
	_G.BankItemAutoSortButton:SetNormalTexture("Interface\\ICONS\\INV_Pet_Broom")
	_G.BankItemAutoSortButton:SetPushedTexture("Interface\\ICONS\\INV_Pet_Broom")
	AS:SkinTexture(_G.BankItemAutoSortButton:GetNormalTexture())
	_G.BankItemAutoSortButton:GetNormalTexture():SetInside()
	AS:SkinTexture(_G.BankItemAutoSortButton:GetPushedTexture())
	_G.BankItemAutoSortButton:GetPushedTexture():SetInside()
	_G.BankItemAutoSortButton:SetSize(20, 20)
	_G.BankItemAutoSortButton:SetPoint("LEFT", _G.BankItemSearchBox, "RIGHT", 4, 0)

	-- Bank Bags
	for i = 1, 7 do
		local BankBag = _G.BankSlotsFrame['Bag'..i]
		AS:SkinFrame(BankBag)
		AS:StyleButton(BankBag)
		AS:SkinTexture(BankBag.icon)
		BankBag.icon:SetInside()
		hooksecurefunc(BankBag.IconBorder, 'SetVertexColor', function(self, r, g, b, a)
			BankBag:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(BankBag.IconBorder, 'Hide', function(self)
			BankBag:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
	end

	-- Bank Slots
	for i = 1, 28 do
		local ItemButton = _G["BankFrameItem"..i]
		AS:SkinFrame(ItemButton)
		AS:SkinTexture(ItemButton.icon)
		ItemButton.icon:SetInside()

		ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
		ItemButton.searchOverlay:SetTexture(0, 0, 0, .8)

		ItemButton:SetNormalTexture(nil)
		AS:StyleButton(ItemButton)
		hooksecurefunc(ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b, a)
			ItemButton:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(ItemButton.IconBorder, 'Hide', function(self)
			ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
	end

	-- Reagent Bank
	AS:SkinButton(_G.ReagentBankFrame.DespositButton)
	_G.ReagentBankFrame:HookScript('OnShow', function(self)
		if _G.ReagentBankFrame.slots_initialized and not _G.ReagentBankFrame.isSkinned then
			for i = 1, 98 do
				local ItemButton = _G["ReagentBankFrameItem"..i]
				AS:SkinFrame(ItemButton)
				AS:SkinTexture(ItemButton.icon)
				ItemButton.icon:SetInside()

				ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
				ItemButton.searchOverlay:SetTexture(0, 0, 0, .8)

				ItemButton:SetNormalTexture(nil)
				AS:StyleButton(ItemButton)
				hooksecurefunc(ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b, a)
					ItemButton:SetBackdropBorderColor(r, g, b)
				end)
				hooksecurefunc(ItemButton.IconBorder, 'Hide', function(self)
					ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				end)
				BankFrameItemButton_Update(ItemButton)
			end
			AS:StripTextures(_G.ReagentBankFrame, true)
			self.isSkinned = true
		end
	end)

	AS:SkinTab(_G.BankFrameTab1)
	AS:SkinTab(_G.BankFrameTab2)
end

AS:RegisterSkin('Blizzard_Bags', AS.Blizzard_Bags)
