local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Baggins') then return end

function AS:Baggins(event)
	local AddOnSkins_BagginsSkin = {
		BagLeftPadding = 10,
		BagRightPadding = 10,
		BagTopPadding = 32,
		BagBottomPadding = 10,
		TitlePadding = 32 + 48,
		SectionTitleHeight = 13,
		EmptySlotTexture = 'Interface\\AddOns\\Baggins\\Textures\\EmptySlot',
	}

	function AddOnSkins_BagginsSkin:SkinBag(frame)
		if not frame.Backdrop then
			AS:SkinBackdropFrame(frame)
			frame.Backdrop:SetInside()
		end

		AS:SkinCloseButton(frame.closebutton)

		frame.closebutton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)

		frame.compressbutton:ClearAllPoints()
		frame.compressbutton:SetPoint("TOPRIGHT", frame.closebutton, "TOPLEFT", -4, -2)

		frame.title:SetVertexColor(1, 1, 1, 1)
		frame.title:ClearAllPoints()
		frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
		frame.title:SetPoint("RIGHT", frame.closebutton, "LEFT", 0, 0)
		frame.title:SetHeight(12)
		frame.title:SetJustifyH('LEFT')
	end

	function AddOnSkins_BagginsSkin:SkinItem(button)
		if button.IsSkinned then return end

		button:SetNormalTexture("")
		button:SetPushedTexture("")

		AS:SetTemplate(button)
		AS:StyleButton(button)

		AS:SkinTexture(button.icon)
		button.icon:SetInside()

		button.IconBorder:SetAlpha(0)

		if AS:CheckAddOn('ElvUI') then
			_G.ElvUI[1]:RegisterCooldown(_G[button:GetName().."Cooldown"])
		end

		button.IsSkinned = true
	end

	local BankColor = { 0, .5, 1 }

	function AddOnSkins_BagginsSkin:SetBankVisual(frame, isBank)
		frame.Backdrop:SetBackdropBorderColor(unpack(isBank and BankColor or AS.BorderColor))
	end

	function AddOnSkins_BagginsSkin:SkinSection(frame)
		frame.title:SetVertexColor(1, 1, 1, 1)
		frame.title:SetText("")
		frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		frame.title:SetHeight(13)
	end

	Baggins:RegisterSkin('AddOnSkins', AddOnSkins_BagginsSkin)

	hooksecurefunc(Baggins, "CreateMoneyFrame", function()
		BagginsCopperText:ClearAllPoints()
		BagginsGoldText:ClearAllPoints()
		BagginsSilverText:ClearAllPoints()
		BagginsCopperText:SetPoint("RIGHT", BagginsCopperIcon, "LEFT")
		BagginsSilverText:SetPoint("RIGHT", BagginsSilverIcon, "LEFT")
		BagginsGoldText:SetPoint("RIGHT", BagginsGoldIcon, "LEFT")
	end)

	hooksecurefunc(Baggins, "UpdateItemButton", function(self, _, button, bag, slot)
		local p = self.db.profile
		local texture, _, _, quality = GetContainerItemInfo(bag, slot)
		local link = GetContainerItemLink(bag, slot)
		if link then
			local qual = select(3, GetItemInfo(link))
			quality = qual or quality
		end
		if p.qualitycolor and texture and quality >= p.qualitycolormin then
			local r, g, b = GetItemQualityColor(quality)
			local glowTexture = button.glow:GetTexture()
			if glowTexture ~= TEXTURE_ITEM_QUEST_BANG and glowTexture ~= TEXTURE_ITEM_QUEST_BORDER then
				button.glow:Hide()
			end
			button:SetBackdropBorderColor(r, g, b, 1)
		else
			button:SetBackdropBorderColor(unpack(AS.BorderColor))
		end

		button.Count:ClearAllPoints()
		button.Count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT")
	end)
end

AS:RegisterSkinForPreload('Baggins', AS.Baggins)
