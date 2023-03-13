local AS, L, S, R = unpack(AddOnSkins)

function R:TrinketMenu()
	-- Config Panel
	local TrinketMenu = _G.TrinketMenu
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
		S:HandleSlideBar(slider)
	end

	-- Main Frame
	S:HandleItemButton(TrinketMenu_Trinket0)
	S:HandleItemButton(TrinketMenu_Trinket1)

	for i = (TrinketMenu.NumberOfTrinkets + 1), TrinketMenu.MaxTrinkets do
		local trinkets = _G['TrinketMenu_Menu'..i]
		S:HandleItemButton(trinkets)
	end
end

AS:RegisterSkin('TrinketMenu')
