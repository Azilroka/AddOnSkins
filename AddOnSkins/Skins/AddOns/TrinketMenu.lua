local AS, L, S, R = unpack(AddOnSkins)

function R:TrinketMenu()
	-- Config Panel
	S:HandleFrame(TrinketMenu_OptFrame)
	TrinketMenu_OptFrame:SetWidth(380)
	S:HandleFrame(TrinketMenu_SubOptFrame)
	TrinketMenu_SubOptFrame:SetWidth(340)

	TrinketMenu_Trinket0Check:ClearAllPoints()
	TrinketMenu_Trinket0Check:SetPoint('LEFT', TrinketMenu_Tab3, 'RIGHT', -32, 0)
	TrinketMenu_Trinket1Check:ClearAllPoints()
	TrinketMenu_Trinket1Check:SetPoint('LEFT', TrinketMenu_Tab2, 'RIGHT', -32, 0)

	-- Config Tabs
	for i = 1, 3 do
		local tabs = _G['TrinketMenu_Tab'..i]
		S:HandleTab(tabs)
		tabs:SetWidth(124)
	end

	-- Config Checkboxes
	local checkboxes = {
		-- Left Row
		TrinketMenu_OptCooldownCount,
		TrinketMenu_OptDisableToggle,
		TrinketMenu_OptHidePetBattle,
		TrinketMenu_OptLargeCooldown,
		TrinketMenu_OptLocked,
		TrinketMenu_OptRedRange,
		TrinketMenu_OptShowHotKeys,
		TrinketMenu_OptShowIcon,
		TrinketMenu_OptShowTooltips,
		TrinketMenu_OptSquareMinimap,
		TrinketMenu_OptStopOnSwap,
		TrinketMenu_OptTinyTooltips,
		TrinketMenu_OptTooltipFollow,
		-- Right Row
		TrinketMenu_OptKeepDocked,
		TrinketMenu_OptKeepOpen,
		TrinketMenu_OptMenuOnShift,
		TrinketMenu_OptMenuOnRight,
		TrinketMenu_OptNotify,
		TrinketMenu_OptNotifyThirty,
		TrinketMenu_OptNotifyChatAlso,
		TrinketMenu_OptSetColumns,
		-- Top Row
		TrinketMenu_Trinket0Check,
		TrinketMenu_Trinket1Check,
	}

	for _, checkbox in pairs(checkboxes) do
		S:HandleCheckBox(checkbox)
	end

	-- Config Sliders
	local sliders = {
		TrinketMenu_OptColumnsSlider,
		TrinketMenu_OptMainScaleSlider,
		TrinketMenu_OptMenuScaleSlider,
	}

	for _, slider in pairs(sliders) do
		S:HandleSliderFrame(slider)
	end

	-- TrinketMenu buttons inherit ActionButtonTemplate. The icon is $parentIcon
	-- (e.g. TrinketMenu_Trinket0Icon, TrinketMenu_Menu3Icon).
	-- HandleItemButton calls StripTextures which wipes the icon before TrinketMenu
	-- sets it, leaving an empty texture. Skin without touching the icon texture.
	local function SkinTrinketButton(button)
		if not button or button._tmSkinned then return end
		button._tmSkinned = true

		local name = button:GetName()
		local icon = name and _G[name .. 'Icon']

		-- Strip only non-icon regions.
		for _, region in next, { button:GetRegions() } do
			if region and region ~= icon and region.IsObjectType and region:IsObjectType('Texture') then
				region:SetTexture('')
			end
		end

		S:CreateBackdrop(button, nil, true, nil, nil, nil, nil, nil, true)
		S:StyleButton(button)

		if icon then
			S:HandleIcon(icon)
			S:SetInside(icon, button)
			icon:SetParent(button.backdrop or button)
		end
	end

	-- Main Frame (equipped trinkets)
	SkinTrinketButton(TrinketMenu_Trinket0)
	SkinTrinketButton(TrinketMenu_Trinket1)

	-- Menu buttons (inventory trinkets) - created dynamically
	local TrinketMenu = _G.TrinketMenu
	for i = (TrinketMenu.NumberOfTrinkets + 1), TrinketMenu.MaxTrinkets do
		SkinTrinketButton(_G['TrinketMenu_Menu'..i])
	end
end

AS:RegisterSkin('TrinketMenu')
