if not Tukui then return end
local AS = unpack(AddOnSkins)

local name = 'Blizzard_Bags'
function AS:Blizzard_Bags()
	for i = 1, 12 do -- There is 13 Total..
		local Bag = _G["ContainerFrame"..i]
		AS:SkinBackdropFrame(Bag, nil, true)
		for j = 1, 36 do
			local ItemButton = _G["ContainerFrame"..i.."Item"..j]
			AS:SkinFrame(ItemButton)
			AS:SkinTexture(ItemButton.icon)
			ItemButton.icon:SetInside()

			ItemButton.NewItemTexture:SetAtlas(nil)
			ItemButton.NewItemTexture.SetAtlas = AS.Noop

			-- This shit is hax.
			ItemButton:CreateBackdrop()
			local Backdrop = ItemButton.Backdrop or ItemButton.backdrop
			hooksecurefunc(ItemButton.NewItemTexture, 'Show', function()
				Backdrop:Show()
			end)
			hooksecurefunc(ItemButton.NewItemTexture, 'Hide', function()
				Backdrop:Hide()
			end)
			Backdrop:SetAllPoints()
			Backdrop:SetFrameStrata(ItemButton:GetFrameStrata())
			Backdrop:SetFrameLevel(ItemButton:GetFrameLevel() + 4)
			Backdrop:SetScript('OnUpdate', function(self)
				local r, g, b = ItemButton.IconBorder:GetVertexColor()
				local a = ItemButton.NewItemTexture:GetAlpha()
				ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
				self:SetBackdropBorderColor(r, g, b, a)
				self:SetBackdropColor(0, 0, 0, 0)
			end)
			Backdrop:SetScript('OnHide', function(self)
				ItemButton:SetBackdropBorderColor(ItemButton.IconBorder:GetVertexColor())
			end)
			-- End of hax.

			ItemButton.searchOverlay:SetAllPoints(ItemButton.icon)
			ItemButton.searchOverlay:SetTexture(0, 0, 0, .8)

			ItemButton:SetNormalTexture(nil)
			ItemButton:StyleButton()
			hooksecurefunc(ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b, a)
				ItemButton:SetBackdropBorderColor(r, g, b)
			end)
			hooksecurefunc(_G["ContainerFrame"..i.."Item"..j].IconBorder, 'Hide', function(self)
				ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end

		Bag.Backdrop:Point("TOPLEFT", 4, -2)
		Bag.Backdrop:Point("BOTTOMRIGHT", 1, 1)
		_G["ContainerFrame"..i.."BackgroundTop"]:Kill()
		_G["ContainerFrame"..i.."BackgroundMiddle1"]:Kill()
		_G["ContainerFrame"..i.."BackgroundMiddle2"]:Kill()
		_G["ContainerFrame"..i.."BackgroundBottom"]:Kill()
		AS:SkinCloseButton(_G["ContainerFrame"..i.."CloseButton"])
		AS:SkinButton(Bag.PortraitButton)
		Bag.PortraitButton.Highlight:Kill()
	end

	local function UpdateBagIcon()
		for i = 1, 12 do
			local Portrait = _G["ContainerFrame"..i.."PortraitButton"]
			if i == 1 then
				Portrait:SetNormalTexture("Interface\\ICONS\\INV_Misc_Bag_36")
			elseif i <= 5 and i >= 2 then
				Portrait:SetNormalTexture(_G["CharacterBag"..(i - 2).."SlotIconTexture"]:GetTexture())
			elseif i <= 12 and i >= 6 then
				Portrait:SetNormalTexture(BankSlotsFrame["Bag"..(i-5)].icon:GetTexture())
			end
			if Portrait:GetNormalTexture() then
				AS:SkinTexture(Portrait:GetNormalTexture())
				Portrait:GetNormalTexture():SetInside()
			end
		end
	end

	hooksecurefunc('BankFrameItemButton_Update', UpdateBagIcon)
	hooksecurefunc('ContainerFrame_Update', UpdateBagIcon)

	AS:SkinEditBox(BagItemSearchBox)
	BackpackTokenFrame:StripTextures()

	AS:SkinButton(BagItemAutoSortButton)
	BagItemAutoSortButton:SetNormalTexture("Interface\\ICONS\\INV_Pet_Broom")
	BagItemAutoSortButton:SetPushedTexture("Interface\\ICONS\\INV_Pet_Broom")
	AS:SkinTexture(BagItemAutoSortButton:GetNormalTexture())
	BagItemAutoSortButton:GetNormalTexture():SetInside()
	AS:SkinTexture(BagItemAutoSortButton:GetPushedTexture())
	BagItemAutoSortButton:GetPushedTexture():SetInside()
	BagItemAutoSortButton:Size(22)

	BagItemAutoSortButton:SetScript('OnShow', function(self)
		local a, b, c, d, e = self:GetPoint()
		self:SetPoint(a, b, c, d - 3, e - 1)
		self.SetPoint = AS.Noop
		self:SetScript('OnShow', nil)
	end)

	for i = 1, 3 do
		AS:SkinTexture(_G["BackpackTokenFrameToken"..i].icon)
		_G["BackpackTokenFrameToken"..i]:CreateBackdrop("Default")
		_G["BackpackTokenFrameToken"..i].Backdrop:SetOutside(_G["BackpackTokenFrameToken"..i].icon)
		_G["BackpackTokenFrameToken"..i].icon:Point("LEFT", _G["BackpackTokenFrameToken"..i].count, "RIGHT", 3, 0)
	end
	-- BAGS
	--[[
	for i = 1, 5 do
		local bag = _G["ContainerFrame"..i]
		if bag then
			bag:StripTextures(true)

			_G["ContainerFrame"..i.."CloseButton"]:SkinCloseButton(_G["ContainerFrame"..i.."CloseButton"].backdrop)

			--Slots
			for j = 1, 36 do
				local icon = _G["ContainerFrame"..i.."Item"..j.."IconTexture"]
				local slots = _G["ContainerFrame"..i.."Item"..j]

				slots:SkinButton()
				icon:SetTexCoord(.08, .92, .08, .92)
				icon:ClearAllPoints()
				icon:SetAllPoints()
				icon:Point("TOPLEFT", slots, 2, -2)
				icon:Point("BOTTOMRIGHT", slots, -2, 2)
			end
		end
		
	end
	
	BagItemSearchBox:Size(159, 15)
	BagItemSearchBox:ClearAllPoints()
	BagItemSearchBox:Point("TOPLEFT", 19, -29)
	BagItemSearchBox.ClearAllPoints = T.dummy
	BagItemSearchBox.SetPoint = T.dummy
	BagItemSearchBox:SkinEditBox()

	-- BANK
	local bank = BankFrame
	if bank then
		bank:StripTextures(true)
		bank:CreateBackdrop("Default")
		bank.backdrop:CreateShadow("Default")
		BankFrameCloseButton:SkinCloseButton(BankFrameCloseButton.backdrop)
		BankFrameMoneyFrameBorder:StripTextures()
		BankFrameMoneyFrameInset:StripTextures()

		BankFramePurchaseButton:SkinButton()
		BankFramePurchaseButton:Height(22)
		
		BankItemSearchBox:Size(159, 15)
		BankItemSearchBox:ClearAllPoints()
		BankItemSearchBox:Point("BOTTOMRIGHT", -29, 70)
		BankItemSearchBox.ClearAllPoints = T.dummy
		BankItemSearchBox.SetPoint = T.dummy
		BankItemSearchBox:SkinEditBox()

		-- Bank Bags
		for i = 1, 7 do
			local bankbags = _G["BankFrameBag"..i]
			local highlight = _G["BankFrameBag"..i.."HighlightFrameTexture"];
			local icon = _G["BankFrameBag"..i.."IconTexture"]

			bankbags:SkinButton()
			bankbags:StyleButton()
			highlight:Kill()
			icon:SetTexCoord(.08, .92, .08, .92)
			icon:ClearAllPoints()
			icon:SetAllPoints()
			icon:Point("TOPLEFT", bankbags, 2, -2)
			icon:Point("BOTTOMRIGHT", bankbags, -2, 2)
		end

		-- Bank Slots
		for i = 1, 28 do
			local slots = _G["BankFrameItem"..i]
			local icon = _G["BankFrameItem"..i.."IconTexture"]
			slots:SkinButton()
			icon:SetTexCoord(.08, .92, .08, .92)
			icon:ClearAllPoints()
			icon:SetAllPoints()
			icon:Point("TOPLEFT", slots, 2, -2)
			icon:Point("BOTTOMRIGHT", slots, -2, 2)
		end

		-- Bank Bags Frame
		for i = 6, 12 do
			local bag = _G["ContainerFrame"..i]
			if bag then
				bag:StripTextures(true)
				bag:CreateBackdrop("Default")
				bag.backdrop:CreateShadow("Default")
				bag.backdrop:Point("TOPLEFT", 4, -2)
				bag.backdrop:Point("BOTTOMRIGHT", 1, 1)
				_G["ContainerFrame"..i.."CloseButton"]:SkinCloseButton(_G["ContainerFrame"..i.."CloseButton"].backdrop)

				--Slots
				for j = 1, 36 do
					local icon = _G["ContainerFrame"..i.."Item"..j.."IconTexture"]
					local slots = _G["ContainerFrame"..i.."Item"..j]

					slots:SkinButton()
					icon:SetTexCoord(.08, .92, .08, .92)
					icon:ClearAllPoints()
					icon:SetAllPoints()
					icon:Point("TOPLEFT", slots, 2, -2)
					icon:Point("BOTTOMRIGHT", slots, -2, 2)
				end
			end
		end
	end]]
end

AS:RegisterSkin(name, AS.Blizzard_Bags)