if AddOnSkins.Retail then return end
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
	if AS:CheckAddOn('Tukui') and Tukui[2]["Bags"]["Enable"] then return end
	if AS:CheckAddOn('ElvUI') and ElvUI[1].private.bags.enable then return end

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
				Portrait:SetNormalTexture("Interface\\Buttons\\Button-Backpack-Up")
			elseif i <= 5 and i >= 2 then
				Portrait:SetNormalTexture(_G["CharacterBag"..(i - 2).."SlotIconTexture"]:GetTexture())
			elseif i <= 12 and i >= 6 then
				if _G.BankSlotsFrame["Bag"..(i-5)] and _G.BankSlotsFrame["Bag"..(i-5)].icon:GetTexture() then
					Portrait:SetNormalTexture(_G.BankSlotsFrame["Bag"..(i-5)].icon:GetTexture())
				end
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

	AS:SkinFrame(_G.BankFrame, nil, nil, true)
	AS:SkinCloseButton(_G.BankCloseButton)

	AS:StripTextures(_G.BankSlotsFrame)

	AS:SkinButton(_G.BankFramePurchaseButton)
	_G.BankFramePurchaseButton:SetHeight(22)

	-- Bank Slots
	for _, ItemButton in pairs({_G.BankSlotsFrame:GetChildren()}) do
		if ItemButton:IsObjectType("Button") then
			AS:SkinFrame(ItemButton)
			AS:SkinTexture(ItemButton.icon)
			ItemButton.icon:SetInside()

			ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
			ItemButton.searchOverlay:SetTexture(0, 0, 0, .8)

			ItemButton:SetNormalTexture(nil)
			AS:StyleButton(ItemButton)
		end
	end
end

AS:RegisterSkin('Blizzard_Bags', AS.Blizzard_Bags)
