local AS, L, S, R = unpack(AddOnSkins)

--Compatibility helpers for bag APIs
local function AS_GetContainerItemInfo(bag, slot)
    -- Retail C_Container API (Dragonflight / The War Within)
    if C_Container and C_Container.GetContainerItemInfo then
        local info = C_Container.GetContainerItemInfo(bag, slot)
        if not info then
            return
        end

        local icon      = info.iconFileID
        local count     = info.stackCount
        local locked    = info.isLocked
        local quality   = info.quality
        local readable  = info.isReadable
        local itemLink  = C_Container.GetContainerItemLink(bag, slot)
        local itemID    = info.itemID

        -- Return values in the same order as the old API where it matters
        -- texture, itemCount, locked, quality, readable, lootable,
        -- itemLink, isFiltered, hasNoValue, itemID
        return icon, count, locked, quality, readable, nil, itemLink, nil, nil, itemID
    end

    -- Older / Classic clients
    if GetContainerItemInfo then
        return GetContainerItemInfo(bag, slot)
    end
end

local function AS_GetContainerItemLink(bag, slot)
    if C_Container and C_Container.GetContainerItemLink then
        return C_Container.GetContainerItemLink(bag, slot)
    end

    if GetContainerItemLink then
        return GetContainerItemLink(bag, slot)
    end
end

function R:Baggins()
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
		if not frame.backdrop then
			S:HandleFrame(frame, true)
			S:SetInside(frame.backdrop)
		end

		S:HandleCloseButton(frame.closebutton)

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

		S:SetTemplate(button)
		S:StyleButton(button)

		S:HandleIcon(button.icon)
		S:SetInside(button.icon)

		button.IconBorder:SetAlpha(0)

		if AS:CheckAddOn('ElvUI') then
			_G.ElvUI[1]:RegisterCooldown(_G[button:GetName().."Cooldown"])
		end

		button.IsSkinned = true
	end

	local BankColor = { 0, .5, 1 }

	local function GetASThemeColors()
		-- Prefer ElvUI theme if present, fall back to AddOnSkins defaults
		if AS:CheckAddOn('ElvUI') and _G.ElvUI and _G.ElvUI[1] then
			local media = _G.ElvUI[1].media or {}
			local border = media.bordercolor or media.borderColor
			local backdrop = media.backdropfadecolor or media.backdropFadeColor or media.backdropcolor or media.backdropColor
			if border or backdrop then
				return border or { 1, 1, 1, 1 }, backdrop or { 0, 0, 0, 0.5 }
			end
		end

		return AS.BorderColor or AS.Color or { 1, 1, 1, 1 }, AS.BackdropColor or { 0, 0, 0, 0.5 }
	end

	function AddOnSkins_BagginsSkin:SetBankVisual(frame, isBank)
		if not frame or not frame.backdrop then
            return
        end

		local borderColor, backdropColor = GetASThemeColors()

		frame.backdrop:SetBackdropColor(unpack(backdropColor))

		if isBank then
			borderColor = BankColor
		end

        frame.backdrop:SetBackdropBorderColor(unpack(borderColor))
    end

	function AddOnSkins_BagginsSkin:SkinSection(frame)
		frame.title:SetVertexColor(1, 1, 1, 1)
		frame.title:SetText("")
		frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		frame.title:SetHeight(13)
	end

	Baggins:RegisterSkin('AddOnSkins', AddOnSkins_BagginsSkin)

	hooksecurefunc(Baggins, "CreateMoneyFrame", function(self)
		local p = self.db.profile
		if p.skin and p.skin == 'AddOnSkins' then
			BagginsCopperText:ClearAllPoints()
			BagginsGoldText:ClearAllPoints()
			BagginsSilverText:ClearAllPoints()
			BagginsCopperText:SetPoint("RIGHT", BagginsCopperIcon, "LEFT")
			BagginsSilverText:SetPoint("RIGHT", BagginsSilverIcon, "LEFT")
			BagginsGoldText:SetPoint("RIGHT", BagginsGoldIcon, "LEFT")
		end
	end)

	hooksecurefunc(Baggins, "UpdateItemButton", function(self, _, button, bag, slot)
		local p = self.db.profile
		if p.skin and p.skin == 'AddOnSkins' then
			local texture, _, _, quality = AS_GetContainerItemInfo(bag, slot)
			local link = AS_GetContainerItemLink(bag, slot)
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
				local borderColor = GetASThemeColors()
            	button:SetBackdropBorderColor(unpack(borderColor))
			end

			button.Count:ClearAllPoints()
			button.Count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT")
		end
	end)
end

AS:RegisterSkinForPreload('Baggins')
