if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local select, unpack = select, unpack
--WoW API / Variables
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
			AS:SetInside(ItemButton.icon)

			ItemButton.IconBorder:SetAlpha(0)
			ItemButton.NewItemTexture:SetAtlas(nil)
			ItemButton.NewItemTexture.SetAtlas = AS.Noop

			_G["ContainerFrame"..i.."Item"..j..'IconQuestTexture']:SetAlpha(0)

			ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
			ItemButton.searchOverlay:SetColorTexture(0, 0, 0, .8)

			ItemButton:SetNormalTexture('')
			AS:StyleButton(ItemButton)
			hooksecurefunc(ItemButton.IconBorder, 'SetVertexColor', function(_, r, g, b, a)
				local Quality = select(4, GetContainerItemInfo(ItemButton:GetParent():GetID(), ItemButton:GetID()))
				local isQuestItem = GetContainerItemQuestInfo(ItemButton:GetParent():GetID(), ItemButton:GetID())
				if Quality and Quality > Enum.ItemQuality.Good then
					ItemButton:SetBackdropBorderColor(r, g, b)
				elseif isQuestItem then
					ItemButton:SetBackdropBorderColor(1, .82, 0)
				else
					ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			hooksecurefunc(ItemButton.IconBorder, 'Hide', function()
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
		if Bag.PortraitButton.Highlight then
			AS:Kill(Bag.PortraitButton.Highlight)
		end
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
				AS:SetInside(Portrait:GetNormalTexture())
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
			AS:SetInside(ItemButton.icon)

			ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
			ItemButton.searchOverlay:SetTexture(0, 0, 0, .8)

			ItemButton:SetNormalTexture(nil)
			AS:StyleButton(ItemButton)
		end
	end

	if AS.Retail then
		AS:SkinEditBox(_G.BagItemSearchBox)

		AS:SkinEditBox(_G.BankItemSearchBox)
		_G.BankItemSearchBox:SetSize(159, 16)

		AS:StripTextures(_G.BackpackTokenFrame)

		for i = 1, 3 do
			local Token = _G["BackpackTokenFrameToken"..i]
			AS:SkinTexture(Token.icon, true)
			--Token.icon:SetPoint("LEFT", Token.count, "RIGHT", 3, 0)
		end

		for _, Button in pairs({ _G.BagItemAutoSortButton, _G.BankItemAutoSortButton }) do
			AS:SkinButton(Button)
			Button:SetNormalTexture("Interface\\ICONS\\INV_Pet_Broom")
			Button:SetPushedTexture("Interface\\ICONS\\INV_Pet_Broom")
			AS:SkinTexture(Button:GetNormalTexture())
			AS:SetInside(Button:GetNormalTexture())
			AS:SkinTexture(Button:GetPushedTexture())
			AS:SetInside(Button:GetPushedTexture())
			Button:SetSize(22, 22)
		end

		_G.BankItemAutoSortButton:SetPoint("LEFT", _G.BankItemSearchBox, "RIGHT", 4, 0)
		_G.BagItemAutoSortButton:SetScript('OnShow', function(self)
			local a, b, c, d, e = self:GetPoint()
			self:SetPoint(a, b, c, d - 3, e - 1)
			self.SetPoint = AS.Noop
			self:SetScript('OnShow', nil)
		end)

		-- Reagent Bank
		AS:SkinButton(_G.ReagentBankFrame.DespositButton)
		_G.ReagentBankFrame:HookScript('OnShow', function(self)
			if _G.ReagentBankFrame.slots_initialized and not _G.ReagentBankFrame.isSkinned then
				for i = 1, 98 do
					local ItemButton = _G["ReagentBankFrameItem"..i]
					AS:SkinFrame(ItemButton)
					AS:SkinTexture(ItemButton.icon)
					AS:SetInside(ItemButton.icon)

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
end

AS:RegisterSkin('Blizzard_Bags', AS.Blizzard_Bags)
