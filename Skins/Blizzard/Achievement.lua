local AS = unpack(AddOnSkins)

function AS:SkinAchievement(Achievement, BiggerIcon)
	if Achievement.Backdrop then return end
	AS:SkinBackdropFrame(Achievement, nil, nil, true)

	Achievement:SetBackdrop(nil)
	Achievement.SetBackdrop = AS.Noop
	Achievement.Backdrop:SetInside(Achievement, 2, 2)

	AS:SetTemplate(Achievement.icon)
	local Size = BiggerIcon and 54 or 38
	Achievement.icon:SetSize(Size, Size)
	Achievement.icon:ClearAllPoints()
	Achievement.icon:SetPoint("LEFT", 6, 0)

	AS:Kill(Achievement.icon.bling)
	AS:Kill(Achievement.icon.frame)

	AS:SkinTexture(Achievement.icon.texture)

	Achievement.icon.texture:SetInside()

	if Achievement.titleBar then
		hooksecurefunc(Achievement.titleBar, 'SetTexture', function(self, texture)
			if texture == [[Interface\AchievementFrame\AccountLevel-AchievementHeader]] then
				Achievement.Backdrop:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
			else
				Achievement.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	if Achievement.highlight then
		AS:StripTextures(Achievement.highlight, true)
		Achievement:HookScript('OnEnter', function(self) self.Backdrop:SetBackdropBorderColor(1, .8, .1) end)
		Achievement:HookScript('OnLeave', function(self)
			if (self.player and self.player.accountWide or self.accountWide) then
				self.Backdrop:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	if Achievement.label then
		Achievement.label:SetTextColor(1, 1, 1)
	end

	if Achievement.description then
		Achievement.description:SetTextColor(.6, .6, .6)
		hooksecurefunc(Achievement.description, 'SetTextColor', function(self, r, g, b)
			if r == 0 and g == 0 and b == 0 then
				Achievement.description:SetTextColor(.6, .6, .6)
			end
		end)
	end

	if Achievement.hiddenDescription then
		Achievement.hiddenDescription:SetTextColor(1, 1, 1)
	end

	if Achievement.tracked then
		AS:SkinCheckBox(Achievement.tracked)
		Achievement.tracked:ClearAllPoints()
		Achievement.tracked:SetPoint('TOPLEFT', Achievement.icon, 'BOTTOMLEFT', 0, 0)
	end
end

function AS:SkinAchievementStatusBar(StatusBar)
	AS:SkinStatusBar(StatusBar)
	StatusBar:SetStatusBarColor(.1, .39, .1)

	local StatusBarName = StatusBar:GetName()
	local title, label, text = StatusBar.title or _G[StatusBarName..'Title'], StatusBar.label or _G[StatusBarName..'Label'], StatusBar.text or _G[StatusBarName..'Text']

	if title then
		title:SetPoint("LEFT", 4, 0)
		title:SetTextColor(1, 1, 1)
	end

	if label then
		label:SetPoint("LEFT", 4, 0)
		label:SetTextColor(1, 1, 1)
	end

	if text then
		if not (title and label) then
			text:SetPoint("CENTER", StatusBar, "CENTER", 0, -1)
		else
			text:SetPoint("RIGHT", -4, 0)
		end
		text:SetTextColor(1, 1, 1)
	end
end

function AS:Blizzard_AchievementUI(event, addon)
	if addon ~= 'Blizzard_AchievementUI' then return end

	local TooltipBorders = { AchievementFrameStats, AchievementFrameSummary, AchievementFrameAchievements, AchievementFrameComparison }

	for _, Frame in pairs(TooltipBorders) do
		for i = 1, Frame:GetNumChildren() do
			local Child = select(i, Frame:GetChildren())
			if Child and Child:IsObjectType('Frame') and not Child:GetName() then
				Child:SetBackdrop(nil)
			end
		end
	end

	AS:SkinBackdropFrame(AchievementFrame, nil, nil, true)
	AchievementFrame.Backdrop:SetPoint('TOPLEFT', 0, 3)
	AchievementFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, 0)

	AS:SkinCloseButton(AchievementFrameCloseButton)
	AchievementFrameCloseButton:SetPoint("TOPRIGHT", AchievementFrame, "TOPRIGHT", 5, 6)

	AS:SkinBackdropFrame(AchievementFrameCategories, nil, nil, true)
	AchievementFrameCategories.Backdrop:SetPoint('TOPLEFT', AchievementFrameCategories, 'TOPLEFT', 2, -2)
	AchievementFrameCategories.Backdrop:SetPoint('BOTTOMRIGHT', AchievementFrameCategories, 'BOTTOMRIGHT', -2, 2)
	AchievementFrameCategories.SetBackdrop = AS.Noop

	AS:StripTextures(AchievementFrameHeader, true)
	AS:SkinBackdropFrame(AchievementFrameSummary, nil, nil, true)
	AchievementFrameSummary.Backdrop:SetPoint('TOPLEFT', 1, -3)
	AchievementFrameSummary.Backdrop:SetPoint('BOTTOMRIGHT', -1, 2)

	AS:StripTextures(AchievementFrameSummaryCategoriesHeader, true)
	AS:StripTextures(AchievementFrameSummaryAchievementsHeader, true)
	AS:StripTextures(AchievementFrameAchievements, true)
	AS:StripTextures(AchievementFrameComparison, true)
	AS:StripTextures(AchievementFrameStatsBG, true)

	AS:StripTextures(AchievementFrameComparisonSummaryPlayer, true)
	AS:StripTextures(AchievementFrameComparisonSummaryFriend, true)
	AS:StripTextures(AchievementFrameComparisonHeader, true)

	AS:SkinDropDownBox(AchievementFrameFilterDropDown, 130)
	AchievementFrameFilterDropDownText:SetJustifyH('RIGHT')
	AchievementFrameFilterDropDownText:ClearAllPoints()
	AchievementFrameFilterDropDownText:SetPoint('RIGHT', AchievementFrameFilterDropDown, 'RIGHT', -34, 0)
	AchievementFrameFilterDropDown:ClearAllPoints()
	AchievementFrameFilterDropDown:SetPoint("TOPLEFT", AchievementFrame, "TOPLEFT", 98, 7)
	AchievementFrameFilterDropDownButton:ClearAllPoints()
	AchievementFrameFilterDropDownButton:SetPoint("TOPRIGHT", AchievementFrameFilterDropDown, "TOPRIGHT", -14, -8)
	AchievementFrameFilterDropDownButton.SetWidth = AS.Noop

	AchievementFrameComparisonHeader:SetPoint("BOTTOMRIGHT", AchievementFrameComparison, "TOPRIGHT", 45, -20)

	AchievementFrameHeaderTitle:ClearAllPoints()
	AchievementFrameHeaderTitle:SetPoint("TOPLEFT", AchievementFrame, "TOP", -200, -3)
	AchievementFrameHeaderPoints:ClearAllPoints()
	AchievementFrameHeaderPoints:SetPoint("LEFT", AchievementFrameHeaderTitle, "RIGHT", 2, 0)
	AS:SkinEditBox(AchievementFrame.searchBox)
	AchievementFrame.searchBox:SetHeight(16)
	AchievementFrame.searchBox:ClearAllPoints()
	AchievementFrame.searchBox:SetPoint("LEFT", AchievementFrameHeaderPoints, "RIGHT", 50, 0)

	AS:SkinAchievementStatusBar(AchievementFrameSummaryCategoriesStatusBar)
	AchievementFrameSummaryCategoriesStatusBarTitle:SetTextColor(1, 1, 1)

	AS:SkinAchievementStatusBar(AchievementFrameComparisonSummaryPlayerStatusBar)
	AS:SkinAchievementStatusBar(AchievementFrameComparisonSummaryFriendStatusBar)

	AS:SkinBackdropFrame(AchievementFrameAchievementsContainer, nil, nil, true)
	AchievementFrameAchievementsContainer.Backdrop:SetPoint('TOPLEFT', AchievementFrameAchievementsContainer, 'TOPLEFT', -2, 1)
	AchievementFrameAchievementsContainer.Backdrop:SetPoint('BOTTOMRIGHT', AchievementFrameAchievementsContainer, 'BOTTOMRIGHT', 0, -3)

	AS:SkinBackdropFrame(AchievementFrameComparisonContainer, nil, nil, true)
	AchievementFrameComparisonContainer.Backdrop:SetPoint('TOPLEFT', AchievementFrameComparisonContainer, 'TOPLEFT', -2, 1)
	AchievementFrameComparisonContainer.Backdrop:SetPoint('BOTTOMRIGHT', AchievementFrameComparisonContainer, 'BOTTOMRIGHT', 0, -3)

	AS:SkinScrollBar(AchievementFrameCategoriesContainerScrollBar)
	AS:SkinScrollBar(AchievementFrameAchievementsContainerScrollBar)
	AS:SkinScrollBar(AchievementFrameStatsContainerScrollBar)
	AS:SkinScrollBar(AchievementFrameComparisonContainerScrollBar)
	AS:SkinScrollBar(AchievementFrameComparisonStatsContainerScrollBar)

	for i = 1, 3 do
		AS:SkinTab(_G["AchievementFrameTab"..i])
	end

	for i = 1, 12 do
		local StatusBar = "AchievementFrameSummaryCategoriesCategory"..i
		AS:SkinAchievementStatusBar(_G[StatusBar])

		AS:StripTextures(_G[StatusBar.."ButtonHighlight"])
		_G[StatusBar.."Button"]:HookScript('OnEnter', function(self) _G[StatusBar].Backdrop:SetBackdropBorderColor(1, .8, .1) end)
		_G[StatusBar.."Button"]:HookScript('OnLeave', function(self) _G[StatusBar].Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	end

	for _, Achievement in pairs(AchievementFrameAchievementsContainer.buttons) do
		AS:SkinAchievement(Achievement, true)
	end

	for _, Stats in pairs(AchievementFrameStatsContainer.buttons) do
		AS:StripTextures(Stats)
		Stats.background:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
		Stats.background:SetTexCoord(0, 1, 0, 1)
		Stats.background.SetTexCoord = AS.Noop
		Stats.background:SetAlpha(.3)
		Stats.background.SetAlpha = AS.Noop
		hooksecurefunc(Stats.background, 'SetBlendMode', function(self, blend) if blend == 'BLEND' then self:Hide() else self:Show() end end)
	end

	for _, Achievement in pairs(AchievementFrameComparisonContainer.buttons) do
		AS:SkinAchievement(Achievement.player)
		AS:SkinAchievement(Achievement.friend)
	end

	hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function()
		for _, Achievement in pairs(AchievementFrameSummaryAchievements.buttons) do
			AS:SkinAchievement(Achievement)
		end
	end)

	hooksecurefunc("AchievementFrameCategories_Update", function()
		for _, Category in pairs(AchievementFrameCategoriesContainer.buttons) do
			if not Category.isSkinned then
				AS:SkinFrame(Category)
				Category:HookScript('OnEnter', function(self) self:SetBackdropBorderColor(unpack(AS.Color)) end)
				Category:HookScript('OnLeave', function(self)
					if self.isSelected then
						self:SetBackdropBorderColor(1, .82, 0)
					else
						self:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end)
				hooksecurefunc(Category, 'LockHighlight', function(self) self:SetBackdropBorderColor(1, .82, 0) end)
				hooksecurefunc(Category, 'UnlockHighlight', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
				Category.label:SetTextColor(1, 1, 1)
				Category.isSkinned = true
			end
		end
	end)

	hooksecurefunc("AchievementButton_GetProgressBar", function(index)
		local frame = _G["AchievementFrameProgressBar"..index]
		if frame and not frame.Backdrop then
			AS:SkinStatusBar(frame)
		end
	end)

	hooksecurefunc("AchievementObjectives_DisplayCriteria", function(objectivesFrame, id)
		local numCriteria = GetAchievementNumCriteria(id)
		local textStrings, metas, criteria, object = 0, 0
		for i = 1, numCriteria do
			local _, criteriaType, completed, _, _, _, _, assetID = GetAchievementCriteriaInfo(id, i)

			if ( criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID ) then
				metas = metas + 1
				criteria, object = AchievementButton_GetMeta(metas), 'label'
			elseif criteriaType ~= 1 then
				textStrings = textStrings + 1
				criteria, object = AchievementButton_GetCriteria(textStrings), 'name'
			end

			if ( objectivesFrame.completed and completed ) then
				criteria[object]:SetTextColor(1, 1, 1)
			elseif ( completed ) then
				criteria[object]:SetTextColor(0, 1, 0)
			else
				criteria[object]:SetTextColor(.6, .6, .6)
			end
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_AchievementUI", AS.Blizzard_AchievementUI, 'ADDON_LOADED')