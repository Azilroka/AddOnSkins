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

local function AS_GetContainerItemQuestInfo(bag, slot)
	if C_Container and C_Container.GetContainerItemQuestInfo then
		return C_Container.GetContainerItemQuestInfo(bag, slot)
	end

	if GetContainerItemQuestInfo then
		local isQuestItem, questID, isActive = GetContainerItemQuestInfo(bag, slot)
		-- Normalize to a table so we can treat retail/classic the same
		return { isQuestItem = isQuestItem, questID = questID, isActive = isActive }
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
		-- Use flat color fallback for empty slots
		EmptySlotTexture = nil,
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
		if button.isSkinned then return end

		S:HandleItemButton(button, true)

		if button.IconBorder then
			button.IconBorder:SetAlpha(0)
		end

		if AS:CheckAddOn('ElvUI') then
			local cooldown = _G[button:GetName().."Cooldown"]
			if cooldown then
				_G.ElvUI[1]:RegisterCooldown(cooldown)
			end
		end
	end

	local BankColor = { 0, .5, 1 }

	local function SetFrameBorderColor(frame, color)
		if not frame then return end
		local target = frame
		if not target.SetBackdropBorderColor then
			target = frame.backdrop or frame.Backdrop
		end
		if target and target.SetBackdropBorderColor then
			target:SetBackdropBorderColor(unpack(color))
		end
	end

	local function SetFrameBackdropColor(frame, color)
		if not frame then return end
		local target = frame.backdrop or frame.Backdrop or frame
		if target and target.SetBackdropColor then
			target:SetBackdropColor(unpack(color))
		end
	end

	local function GetButtonIcon(btn)
		return btn and (btn.icon or btn.Icon or btn.IconTexture or btn.iconTexture or (btn.GetName and _G[btn:GetName() .. "IconTexture"]))
	end

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

	local function GetIconTexCoords()
		-- Prefer AddOnSkins coord, then ElvUI TexCoords, then default crop
		if S.IconCoord then
			return S.IconCoord
		end

		if AS:CheckAddOn('ElvUI') and _G.ElvUI and _G.ElvUI[1] and _G.ElvUI[1].TexCoords then
			return _G.ElvUI[1].TexCoords
		end

		return { 0.08, 0.92, 0.08, 0.92 }
	end

	function AddOnSkins_BagginsSkin:SetBankVisual(frame, isBank)
		if not frame or not frame.backdrop then
            return
        end

		local borderColor, backdropColor = GetASThemeColors()

		if isBank then
			borderColor = BankColor
		end

		SetFrameBackdropColor(frame.backdrop, backdropColor)
        SetFrameBorderColor(frame.backdrop, borderColor)
    end

	function AddOnSkins_BagginsSkin:SkinSection(frame)
		frame.title:SetVertexColor(1, 1, 1, 1)
		frame.title:SetText("")
		frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		frame.title:SetHeight(13)
	end

	local function SkinBankControls()
		local frame = _G.BagginsBankControlFrame
		if not frame then return end

		local function skin(btn)
			if btn and not btn.isSkinned then
				S:HandleButton(btn)
				btn.isSkinned = true
			end
		end

		skin(frame.radeposit)
		skin(frame.rabuy)
		skin(frame.slotbuy)
	end

	local function SkinSearchBox()
		local edit = _G.BagginsSearch_EditBox
		if not edit or edit.isSkinned then return end

		-- Strip default backdrop/background so only our skin shows
		if edit.SetBackdrop then
			edit:SetBackdrop(nil)
		end
		if edit.Background then
			edit.Background:SetTexture(nil)
			edit.Background:Hide()
		end
		S:StripTextures(edit, true)

		S:HandleEditBox(edit)
		local _, backdropColor = GetASThemeColors()
		if edit.SetBackdropColor and backdropColor then
			edit:SetBackdropColor(unpack(backdropColor))
		end

		if edit.SetTextColor then
			edit:SetTextColor(1, 1, 1)
		end

		edit.isSkinned = true
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

	hooksecurefunc(Baggins, "UpdateBankControlFrame", function()
		SkinBankControls()
	end)

	hooksecurefunc(Baggins, "Baggins_RefreshBags", function()
		SkinSearchBox()
	end)

	hooksecurefunc(Baggins, "UpdateItemButton", function(self, _, button, bag, slot)
		local p = self.db.profile
		if p.skin and p.skin == 'AddOnSkins' then
			local texture, _, _, quality, _, _, _, _, _, itemID = AS_GetContainerItemInfo(bag, slot)
			local link = AS_GetContainerItemLink(bag, slot)
			local borderColor, backdropColor = GetASThemeColors()
			local questInfo = AS_GetContainerItemQuestInfo(bag, slot)
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
				SetFrameBorderColor(button, { r, g, b, 1 })
			else
            	SetFrameBorderColor(button, borderColor)
			end

			local icon = GetButtonIcon(button)
			if button.IconBorder then
				button.IconBorder:SetAlpha(0)
			end
			if button.Border then
				button.Border:SetAlpha(0)
			end
			if icon then
				local texCoord = GetIconTexCoords()
				if texture then
					icon:SetTexture(texture)
					icon:SetTexCoord(unpack(texCoord))
					icon:SetAlpha(1)
				else
					icon:SetTexture(nil)
					icon:SetColorTexture(backdropColor[1], backdropColor[2], backdropColor[3], backdropColor[4] or 0.5)
					icon:SetTexCoord(unpack(texCoord))
					icon:SetAlpha(1)
				end
			end

			-- Restore quest overlays (bang/border) if present
			if button.IconQuestTexture and questInfo then
				local tex = button.IconQuestTexture
				if questInfo.questID and not questInfo.isActive then
					tex:SetTexture(TEXTURE_ITEM_QUEST_BANG)
					tex:Show()
				elseif questInfo.questID or questInfo.isQuestItem then
					tex:SetTexture(TEXTURE_ITEM_QUEST_BORDER)
					tex:Show()
				else
					tex:Hide()
				end
			end

			button.Count:ClearAllPoints()
			button.Count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT")
		end
	end)
end

AS:RegisterSkinForPreload('Baggins')
