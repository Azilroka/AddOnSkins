local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next
local select = select
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local GetAchievementNumCriteria = GetAchievementNumCriteria
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo

local function SetupButtonHighlight(button, backdrop)
	if not button then return end

	button:SetHighlightTexture(S.Media.StatusBar)

	local hl = button:GetHighlightTexture()
	hl:SetVertexColor(0.8, 0.8, 0.8, .25)
	S:SetInside(hl, backdrop)
end

local function StyleSearchButton(button)
	if not button then return end

	S:HandleFrame(button)
	local icon = button.icon or button.Icon
	if icon then
		S:HandleIcon(icon)
	end

	button:SetHighlightTexture(S.Media.StatusBar)
	local hl = button:GetHighlightTexture()
	hl:SetVertexColor(0.8, 0.8, 0.8, .25)
	S:SetInside(hl)
end

local function UpdateDisplayObjectives(frame)
	local objectives = frame:GetObjectiveFrame()
	if objectives and objectives.progressBars then
		for _, bar in next, objectives.progressBars do
			if not bar.isSkinned then
				S:HandleStatusBar(bar)
				bar.isSkinned = true
			end
		end
	end
end

local function UpdateAccountString(button)
	if button.DateCompleted:IsShown() then
		if button.accountWide then
			button.Label:SetTextColor(0, .6, 1)
		else
			button.Label:SetTextColor(.9, .9, .9)
		end
	elseif button.accountWide then
		button.Label:SetTextColor(0, .3, .5)
	else
		button.Label:SetTextColor(.65, .65, .65)
	end
end

local function HideBackdrop(frame)
	if frame.NineSlice then frame.NineSlice:SetAlpha(0) end
	if frame.SetBackdrop then frame:SetBackdrop(nil) end
end

local function SkinStatusBar(statusBar)
	S:HandleStatusBar(statusBar)

	local StatusBarName = statusBar:GetName()

	local title = _G[StatusBarName..'Title']
	if title then S:Point(title, 'LEFT', 4, 0) end

	local label = _G[StatusBarName..'Label']
	if label then S:Point(label, 'LEFT', 4, 0) end

	local text = _G[StatusBarName..'Text']
	if text then S:Point(text, 'RIGHT', -4, 0) end
end

local function HandleSummaryBar(frame)
	S:StripTextures(frame)
	local statusBar = frame.StatusBar
	S:HandleStatusBar(statusBar)
	statusBar.Title:SetTextColor(1, 1, 1)
	S:Point(statusBar.Title, 'LEFT', statusBar, 'LEFT', 6, 0)
	S:Point(statusBar.Text, 'RIGHT', statusBar, 'RIGHT', -5, 0)
end

local function HandleCompareCategory(button)
	button:DisableDrawLayer('BORDER')
	HideBackdrop(button)
	button.Background:Hide()
	S:CreateBackdrop(button)
	S:SetInside(button.backdrop, button, 2, 2)

	button.TitleBar:Hide()
	button.Glow:Hide()
	button.Icon.frame:Hide()
	S:HandleIcon(button.Icon.texture)
end

function R:Blizzard_AchievementUI()
	if not AS:IsSkinEnabled('Blizzard_AchievementUI', 'achievement') then return end

	local AchievementFrame = _G.AchievementFrame
	S:HandleFrame(AchievementFrame)

	S:StripTextures(AchievementFrame.Header)
	AchievementFrame.Header.Title:Hide()
	S:Point(AchievementFrame.Header.Points, 'TOP', AchievementFrame, 0, -3)

	S:HandleEditBox(AchievementFrame.SearchBox)
	AchievementFrame.SearchBox:ClearAllPoints()
	S:Point(AchievementFrame.SearchBox, 'TOPRIGHT', AchievementFrame, 'TOPRIGHT', -25, -2)
	S:Point(AchievementFrame.SearchBox, 'BOTTOMLEFT', AchievementFrame, 'TOPRIGHT', -130, -20)

	S:HandleDropDownBox(_G.AchievementFrameFilterDropDown)
	_G.AchievementFrameFilterDropDown:ClearAllPoints()
	S:Point(_G.AchievementFrameFilterDropDown, 'RIGHT', AchievementFrame.SearchBox, 'LEFT', 5, -5)

	-- Bottom Tabs
	for i = 1, 3 do
		local tab = _G['AchievementFrameTab'..i]
		S:HandleTab(tab)
		tab:ClearAllPoints()
	end

	-- Reposition Tabs
	S:Point(_G.AchievementFrameTab1, 'TOPLEFT', _G.AchievementFrame, 'BOTTOMLEFT', -3, 0)
	S:Point(_G.AchievementFrameTab2, 'TOPLEFT', _G.AchievementFrameTab1, 'TOPRIGHT', -5, 0)
	S:Point(_G.AchievementFrameTab3, 'TOPLEFT', _G.AchievementFrameTab2, 'TOPRIGHT', -5, 0)

	local PreviewContainer = AchievementFrame.SearchPreviewContainer
	local ShowAllSearchResults = PreviewContainer.ShowAllSearchResults
	S:HandleFrame(PreviewContainer, true, nil, -3, 3)
	PreviewContainer:ClearAllPoints()
	S:Point(PreviewContainer, 'TOPLEFT', AchievementFrame, 'TOPRIGHT', 7, -2)
	S:Point(PreviewContainer.backdrop, 'BOTTOMRIGHT', ShowAllSearchResults, 3, -3)

	for i = 1, 5 do
		StyleSearchButton(PreviewContainer['SearchPreview'..i])
	end
	StyleSearchButton(ShowAllSearchResults)

	local Result = AchievementFrame.SearchResults
	S:Point(Result, 'BOTTOMLEFT', AchievementFrame, 'BOTTOMRIGHT', 15, -1)
	S:HandleFrame(Result, true, nil, -10)
	S:HandleTrimScrollBar(Result.ScrollBar)

	hooksecurefunc(Result.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if not child.isSkinned then
				S:HandleFrame(child, true)
				S:HandleIcon(child.Icon)
				S:SetInside(child.backdrop)
				SetupButtonHighlight(child, child.backdrop)

				child.isSkinned = true
			end
		end
	end)

	S:HandleTrimScrollBar(_G.AchievementFrameCategories.ScrollBar)
	S:HandleTrimScrollBar(_G.AchievementFrameAchievements.ScrollBar)

	_G.AchievementFrameSummaryAchievementsHeaderHeader:SetVertexColor(1, 1, 1, .25)
	_G.AchievementFrameSummaryCategoriesHeaderTexture:SetVertexColor(1, 1, 1, .25)
	_G.AchievementFrameWaterMark:SetAlpha(0)

	hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function()
		for i = 1, _G.ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
			local bu = _G['AchievementFrameSummaryAchievement'..i]
			if bu.accountWide then
				bu.Label:SetTextColor(0, .6, 1)
			else
				bu.Label:SetTextColor(.9, .9, .9)
			end

			if not bu.isSkinned then
				S:StripTextures(bu, true)
				bu:DisableDrawLayer('BORDER')
				HideBackdrop(bu)

				local bd = bu.Background
				bd:SetTexture(S.Media.StatusBar)
				bd:SetVertexColor(0, 0, 0, .25)

				bu.TitleBar:Hide()
				bu.Glow:Hide()
				bu.Highlight:SetAlpha(0)
				bu.Icon.frame:Hide()
				S:HandleIcon(bu.Icon.texture, true)

				S:CreateBackdrop(bu)
				S:SetInside(bu.backdrop)

				bu.isSkinned = true
			end

			bu.Description:SetTextColor(.9, .9, .9)
		end
	end)

	if AS:CheckOption('Parchment') then
		_G.AchievementFrameCategories.NineSlice:SetCenterColor(unpack(S.Media.transparentBackdrop))
		select(3, _G.AchievementFrameAchievements:GetRegions()):Hide()
	else
		S:StripTextures(_G.AchievementFrameAchievements)
		select(3, _G.AchievementFrameAchievements:GetChildren()):Hide()
		S:StripTextures(_G.AchievementFrameCategories)

		S:StripTextures(_G.AchievementFrameSummary)
		_G.AchievementFrameSummary:GetChildren():Hide()

		hooksecurefunc(_G.AchievementFrameCategories.ScrollBox, 'Update', function(frame)
			for _, child in next, { frame.ScrollTarget:GetChildren() } do
				local button = child.Button
				if button and not button.IsSkinned then
					S:HandleFrame(button, true, nil, 0, -1)
					SetupButtonHighlight(button, button.backdrop)

					button.IsSkinned = true
				end
			end
		end)

		_G.AchievementFrameStatsBG:Hide()

		select(4, _G.AchievementFrameStats:GetChildren()):Hide()
		hooksecurefunc(_G.AchievementFrameStats.ScrollBox, 'Update', function(frame)
			for _, child in next, { frame.ScrollTarget:GetChildren() } do
				if not child.IsSkinned then
					S:HandleFrame(child, true, nil, 2, -S.mult, 4, S.mult)
					SetupButtonHighlight(child, child.backdrop)

					child.IsSkinned = true
				end
			end
		end)

		local Comparison = _G.AchievementFrameComparison
		hooksecurefunc(Comparison.AchievementContainer.ScrollBox, 'Update', function(frame)
			for _, child in next, { frame.ScrollTarget:GetChildren() } do
				if not child.isSkinned then
					HandleCompareCategory(child.Player)
					child.Player.Description:SetTextColor(.9, .9, .9)
					child.Player.Description.SetTextColor = S.noop
					HandleCompareCategory(child.Friend)

					child.isSkinned = true
				end
			end
		end)

		S:StripTextures(Comparison)
		select(5, Comparison:GetChildren()):Hide()

		hooksecurefunc(Comparison.StatContainer.ScrollBox, 'Update', function(frame)
			for _, child in next, { frame.ScrollTarget:GetChildren() } do
				if not child.isSkinned then
					S:HandleFrame(child, true, nil, 2, -S.mult, 6, S.mult)
					child.isSkinned = true
				end
			end
		end)
	end

	for i = 1, 12 do
		local name = 'AchievementFrameSummaryCategoriesCategory'..i
		local statusBar = _G[name]
		S:HandleStatusBar(statusBar)

		statusBar.Label:SetTextColor(1, 1, 1)
		S:Point(statusBar.Label, 'LEFT', statusBar, 'LEFT', 6, 0)
		S:Point(statusBar.Text, 'RIGHT', statusBar, 'RIGHT', -5, 0)

		_G[name..'ButtonHighlight']:SetAlpha(0)
	end

	hooksecurefunc(_G.AchievementFrameAchievements.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if not child.isSkinned then
				S:StripTextures(child, true)
				child.Background:SetAlpha(0)
				child.Highlight:SetAlpha(0)
				child.Icon.frame:Hide()
				child.Description:SetTextColor(.9, .9, .9)
				child.Description.SetTextColor = S.noop

				S:CreateBackdrop(child)
				S:Point(child.backdrop, 'TOPLEFT', 1, -1)
				S:Point(child.backdrop, 'BOTTOMRIGHT', 0, 2)
				S:HandleIcon(child.Icon.texture, true)

				S:HandleCheckBox(child.Tracked)
				child.Tracked:SetSize(20, 20)
				child.Check:SetAlpha(0)

				hooksecurefunc(child, 'UpdatePlusMinusTexture', UpdateAccountString)
				hooksecurefunc(child, 'DisplayObjectives', UpdateDisplayObjectives)

				child.isSkinned = true
			end
		end
	end)

	hooksecurefunc('AchievementObjectives_DisplayCriteria', function(objectivesFrame, id)
		local numCriteria = GetAchievementNumCriteria(id)
		local textStrings, metas, criteria, object = 0, 0
		for i = 1, numCriteria do
			local _, criteriaType, completed, _, _, _, _, assetID = GetAchievementCriteriaInfo(id, i)
			if assetID and criteriaType == _G.CRITERIA_TYPE_ACHIEVEMENT then
				metas = metas + 1
				criteria, object = objectivesFrame:GetMeta(metas), 'Label'
			elseif criteriaType ~= 1 then
				textStrings = textStrings + 1
				criteria, object = objectivesFrame:GetCriteria(textStrings), 'Name'
			end

			local text = criteria and criteria[object]
			if text then
				local r, g, b, x, y
				if completed then
					if objectivesFrame.completed then
						r, g, b, x, y = 1, 1, 1, 0, 0
					else
						r, g, b, x, y = 0, 1, 0, 1, -1
					end
				else
					r, g, b, x, y = .6, .6, .6, 1, -1
				end

				text:SetTextColor(r, g, b)
				text:SetShadowOffset(x, y)
			end
		end
	end)

	SkinStatusBar(_G.AchievementFrameSummaryCategoriesStatusBar)
	_G.AchievementFrameSummaryAchievementsEmptyText:SetText('')
	_G.AchievementFrameStatsBG:SetInside(_G.AchievementFrameStats.ScrollBox, 1, 1)
	S:HandleTrimScrollBar(_G.AchievementFrameStats.ScrollBar)

	-- Comparison
	local Comparison = _G.AchievementFrameComparison
	_G.AchievementFrameComparisonHeaderBG:Hide()
	_G.AchievementFrameComparisonHeaderPortrait:Hide()
	_G.AchievementFrameComparisonHeaderPortraitBg:Hide()
	S:Point(_G.AchievementFrameComparisonHeader, 'BOTTOMRIGHT', Comparison, 'TOPRIGHT', 39, 26)
	S:CreateBackdrop(_G.AchievementFrameComparisonHeader)
	S:Point(_G.AchievementFrameComparisonHeader.backdrop, 'TOPLEFT', 20, -20)
	S:Point(_G.AchievementFrameComparisonHeader.backdrop, 'BOTTOMRIGHT', -28, -5)

	S:HandleTrimScrollBar(Comparison.AchievementContainer.ScrollBar)

	HandleSummaryBar(Comparison.Summary.Player)
	HandleSummaryBar(Comparison.Summary.Friend)

	S:HandleTrimScrollBar(Comparison.StatContainer.ScrollBar)

	-- The section below is usually handled in our hook but another addon
	-- may have loaded the AchievementUI before we were ready. <Categories>
	local index = 1
	local button = _G['AchievementFrameCategoriesContainerButton'..index]
	while button do
		if not button.isSkinned then
			S:StripTextures(button, true)
			S:StyleButton(button)

			button.isSkinned = true
		end

		index = 1
		button = _G['AchievementFrameCategoriesContainerButton'..index]
	end
end

AS:RegisterSkin('Blizzard_AchievementUI', nil, 'ADDON_LOADED')
