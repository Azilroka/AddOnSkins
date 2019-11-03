if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_PVPUI(event, addon)
	if addon ~= "Blizzard_PVPUI" then return end

	AS:StripTextures(PVPUIFrame)
	AS:StripTextures(PVPQueueFrame.HonorInset)

	for i = 1, 3 do
		local Button = PVPQueueFrame['CategoryButton'..i]
		AS:SkinBackdropFrame(Button, nil, true)
		Button.Background:SetTexture('')
		Button.Ring:SetTexture('')
		Button.Icon:SetSize(45, 45)
		AS:SkinTexture(Button.Icon, true)

		Button.Name:SetTextColor(1, 1, 1)

		Button:SetHighlightTexture('')
		Button:HookScript('OnEnter', function(self)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
			self.Icon.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self:GetID() == self.isSelected then
				self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				self.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc('PVPQueueFrame_SelectButton', function(index)
		for i = 1, 3 do
			local Button = PVPQueueFrame["CategoryButton"..i]
			Button.isSelected = index
			if ( i == index ) then
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				Button.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:SkinDropDownBox(HonorFrameTypeDropDown)

	AS:SkinScrollBar(HonorFrameSpecificFrameScrollBar)
	AS:SkinButton(HonorFrameQueueButton, true)
	AS:StripTextures(HonorFrame.BonusFrame)
	AS:StripTextures(HonorFrame.BonusFrame.ShadowOverlay)

	local Buttons = { ['RandomBGButton'] = HonorFrame.BonusFrame, ['RandomEpicBGButton'] = HonorFrame.BonusFrame, ['Arena1Button'] = HonorFrame.BonusFrame, ['BrawlButton'] = HonorFrame.BonusFrame, ['RatedBG'] = ConquestFrame, ['Arena2v2'] = ConquestFrame, ['Arena3v3'] = ConquestFrame }

	for Section, Parent in pairs(Buttons) do
		local Button = Parent[Section]
		AS:SkinButton(Button)
		Button.SelectedTexture:SetTexture('')
		Button.SelectedTexture:Hide()

		AS:SkinTexture(Button.Reward.Icon, true)
		Button.Reward.Border:Hide()
		Button.Reward.CircleMask:Hide()

		AS:StripTextures(Button.Reward.EnlistmentBonus)
		AS:SetTemplate(Button.Reward.EnlistmentBonus)
		Button.Reward.EnlistmentBonus:SetSize(20, 20)
		Button.Reward.EnlistmentBonus:SetPoint("TOPRIGHT", 2, 2)

		local EnlistmentBonusIcon = Button.Reward.EnlistmentBonus:CreateTexture()
		EnlistmentBonusIcon:SetPoint("TOPLEFT", Button.Reward.EnlistmentBonus, "TOPLEFT", 2, -2)
		EnlistmentBonusIcon:SetPoint("BOTTOMRIGHT", Button.Reward.EnlistmentBonus, "BOTTOMRIGHT", -2, 2)
		EnlistmentBonusIcon:SetTexture("Interface\\Icons\\achievement_guildperk_honorablemention_rank2")
		EnlistmentBonusIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedTexture:IsShown() then
				self:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	hooksecurefunc('PVPUIFrame_ConfigureRewardFrame', function(rewardFrame, honor, experience, itemRewards, currencyRewards)
		local rewardTexture, rewardQuaility, _ = nil, 1

		if currencyRewards then
			for _, reward in ipairs(currencyRewards) do
				local name, _, texture, _, _, _, _, quality = GetCurrencyInfo(reward.id)
				if quality == LE_ITEM_QUALITY_ARTIFACT then
					_, rewardTexture, _, rewardQuaility = CurrencyContainerUtil.GetCurrencyContainerInfo(reward.id, reward.quantity, name, texture, quality)
				end
			end
		end

		if not rewardTexture and itemRewards then
			local reward = itemRewards[1]
			if reward then
				_, _, rewardQuaility, _, _, _, _, _, _, rewardTexture = GetItemInfo(reward.id)
			end
		end

		if rewardTexture then
			rewardFrame.Icon:SetTexture(rewardTexture)
			if rewardFrame.Icon.Backdrop then
				rewardFrame.Icon.Backdrop:SetBackdropBorderColor(GetItemQualityColor(rewardQuaility))
			end
		end
	end)

	for _, func in pairs({ 'ConquestFrame_UpdateJoinButton', 'HonorFrame_UpdateQueueButtons' }) do
		hooksecurefunc(func, function()
			for Section, Parent in pairs(Buttons) do
				local Button = Parent[Section]
				if Button.SelectedTexture:IsShown() then
					Button:SetBackdropBorderColor(unpack(AS.Color))
				else
					Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end)
	end

	PVPQueueFrame.CategoryButton1.Icon:SetTexture([[Interface\Icons\achievement_bg_winwsg]])
	PVPQueueFrame.CategoryButton2.Icon:SetTexture([[Interface\Icons\achievement_bg_killxenemies_generalsroom]])
	PVPQueueFrame.CategoryButton3.Icon:SetTexture([[Interface\Icons\ability_warrior_offensivestance]])

	AS:SkinButton(ConquestJoinButton, true)
	AS:StripTextures(ConquestFrame.ShadowOverlay)
	AS:SkinFrame(ConquestTooltip)

	for _, Frame in pairs({ HonorFrame, ConquestFrame }) do
		AS:StripTextures(Frame)
		AS:StripTextures(Frame.Inset)

		AS:SkinCheckBox(Frame.DPSIcon.checkButton, true)
		AS:SkinCheckBox(Frame.TankIcon.checkButton, true)
		AS:SkinCheckBox(Frame.HealerIcon.checkButton, true)

		AS:SkinStatusBar(Frame.ConquestBar, AS.Faction == "Alliance" and {0.05, 0.15, 0.36} or {0.63, 0.09, 0.09})
		Frame.ConquestBar.Reward.Ring:Hide()
		Frame.ConquestBar.Reward.CircleMask:Hide()
		AS:SkinTexture(Frame.ConquestBar.Reward.Icon, true)

		Frame.ConquestBar.Reward:SetPoint("LEFT", Frame.ConquestBar, "RIGHT", -8, 0)

		hooksecurefunc(Frame.ConquestBar.Reward.Icon, 'SetTexture', function(self) -- Code taken from :GetConquestLevelInfo the function isn't returning the correct id somehow.
			local Quality
			for _, questID in ipairs(C_QuestLine.GetQuestLineQuests(782)) do
				if not IsQuestFlaggedCompleted(questID) and not C_QuestLog.IsOnQuest(questID) then
					break
				end
				if HaveQuestRewardData(questID) then
					local itemID = select(6, GetQuestLogRewardInfo(1, questID))
					Quality = select(3, GetItemInfo(itemID))
				else
					C_TaskQuest.RequestPreloadRewardData(questID) -- Taken from WorldMapFrame
				end
			end
			if Quality then
				self.Backdrop:SetBackdropBorderColor(GetItemQualityColor(Quality))
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_BattlefieldMap(event, addon)
	if addon ~= 'Blizzard_BattlefieldMap' then return end

	local function GetOpacity()
		return 1 - (BattlefieldMapOptions and BattlefieldMapOptions.opacity or 1)
	end

	local oldAlpha = GetOpacity()

	AS:SkinBackdropFrame(BattlefieldMapFrame)
	AS:SetOutside(BattlefieldMapFrame.Backdrop, BattlefieldMapFrame.ScrollContainer)
	BattlefieldMapFrame.Backdrop:SetBackdropColor(0, 0, 0, oldAlpha)

	BattlefieldMapFrame:SetClampedToScreen(true)
	BattlefieldMapFrame:EnableMouse(true)
	BattlefieldMapFrame:SetMovable(true)
	BattlefieldMapFrame:SetFrameStrata('LOW')

	BattlefieldMapFrame.BorderFrame.CloseButton:SetFrameLevel(BattlefieldMapFrame.BorderFrame.CloseButton:GetFrameLevel()+1)
	AS:SkinCloseButton(BattlefieldMapFrame.BorderFrame.CloseButton)
	AS:Kill(BattlefieldMapTab)

	local function InitializeOptionsDropDown()
		BattlefieldMapTab:InitializeOptionsDropDown()
	end

	BattlefieldMapFrame.ScrollContainer:HookScript("OnMouseUp", function(_, btn)
		if btn == "LeftButton" then
			BattlefieldMapTab:StopMovingOrSizing()
			BattlefieldMapTab:SetUserPlaced(true)
		elseif btn == "RightButton" then
			UIDropDownMenu_Initialize(BattlefieldMapTab.OptionsDropDown, InitializeOptionsDropDown, "MENU")
			ToggleDropDownMenu(1, nil, BattlefieldMapTab.OptionsDropDown, BattlefieldMapFrame:GetName(), 0, -4)
		end

		if OpacityFrame:IsShown() then
			OpacityFrame:Hide()
		end
	end)

	BattlefieldMapFrame.ScrollContainer:HookScript("OnMouseDown", function(_, btn)
		if btn == "LeftButton" and (BattlefieldMapOptions and not BattlefieldMapOptions.locked) then
			BattlefieldMapTab:StartMoving()
		end
	end)

	local function setBackdropAlpha()
		if BattlefieldMapFrame.Backdrop then
			BattlefieldMapFrame.Backdrop:SetBackdropColor(0, 0, 0, GetOpacity())
		end
	end

	hooksecurefunc(BattlefieldMapFrame, "SetGlobalAlpha", setBackdropAlpha)
	hooksecurefunc(BattlefieldMapFrame, "RefreshAlpha", function()
		oldAlpha = GetOpacity()
	end)

	local function setOldAlpha()
		if oldAlpha then
			BattlefieldMapFrame:SetGlobalAlpha(oldAlpha)
			oldAlpha = nil
		end
	end

	local function setRealAlpha()
		oldAlpha = GetOpacity()
		BattlefieldMapFrame:SetGlobalAlpha(1)
	end

	BattlefieldMapFrame:HookScript('OnShow', setBackdropAlpha)
	BattlefieldMapFrame.ScrollContainer:HookScript('OnLeave', setOldAlpha)
	BattlefieldMapFrame.ScrollContainer:HookScript('OnEnter', setRealAlpha)
	BattlefieldMapFrame.BorderFrame.CloseButton:HookScript('OnLeave', setOldAlpha)
	BattlefieldMapFrame.BorderFrame.CloseButton:HookScript('OnEnter', setRealAlpha)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_PVPMatch()
	-- Macro to show the PVPMatchScoreboard: /run PVPMatchScoreboard:Show()
	-- Macro to show the PVPMatchResults: /run PVPMatchResults:Show()
	local PVPMatchScoreboard = _G.PVPMatchScoreboard
	AS:SkinFrame(PVPMatchScoreboard)
	AS:SkinCloseButton(PVPMatchScoreboard.CloseButton)

	AS:StripTextures(PVPMatchScoreboard.Content)
	AS:SkinScrollBar(PVPMatchScoreboard.Content.ScrollFrame.ScrollBar)

	for _, tab in pairs({PVPMatchScoreboard.Content.TabContainer.TabGroup:GetChildren()}) do
		AS:SkinTab(tab)
	end

	local PVPMatchResults = _G.PVPMatchResults
	AS:SkinFrame(PVPMatchResults)

	AS:StripTextures(PVPMatchResults.content)
	AS:StripTextures(PVPMatchResults.content.tabContainer)

	AS:SkinScrollBar(PVPMatchResults.content.scrollFrame.scrollBar)
	AS:SkinCloseButton(PVPMatchResults.CloseButton)
	AS:SkinButton(PVPMatchResults.buttonContainer.leaveButton)

	for _, tab in pairs({PVPMatchResults.content.tabContainer.tabGroup:GetChildren()}) do
		AS:SkinTab(tab)
	end
end

AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_PVPMatch", AS.Blizzard_PVPMatch)
AS:RegisterSkin("Blizzard_BattlefieldMap", AS.Blizzard_BattlefieldMap, 'ADDON_LOADED')
