if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function AS:SkinAchievement(Achievement, BiggerIcon)
	if Achievement.Backdrop then return end
	AS:SkinBackdropFrame(Achievement, nil, nil, true)
	AS:SetInside(Achievement.Backdrop, Achievement)

	AS:SetTemplate(Achievement.icon)
	local Size = BiggerIcon and 56 or 38
	Achievement.icon:SetSize(Size, Size)
	Achievement.icon:ClearAllPoints()
	Achievement.icon:SetPoint("LEFT", 6, 0)

	AS:Kill(Achievement.icon.bling)
	AS:Kill(Achievement.icon.frame)

	AS:SkinTexture(Achievement.icon.texture)
	AS:SetInside(Achievement.icon.texture)

	if Achievement.label then
		Achievement.label:SetTextColor(1, .8, .1)
		hooksecurefunc(Achievement.label, 'SetVertexColor', function(s, r, g, b) if r == 1 and g == 1 and b == 1 then s:SetTextColor(1, .8, .1) end end)
	end

	if Achievement.highlight then
		AS:StripTextures(Achievement.highlight, true)
		Achievement:HookScript('OnEnter', function(s) s.Backdrop:SetBackdropBorderColor(1, .8, .1) end)
		Achievement:HookScript('OnLeave', function(s) s.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	end

	if Achievement.description then
		Achievement.description:SetTextColor(1, 1, 1)
		hooksecurefunc(Achievement.description, 'SetTextColor', function(s, r, g, b) if r == 0 and g == 0 and b == 0 then s:SetTextColor(1, 1, 1) end end)
	end

	if Achievement.hiddenDescription then
		Achievement.hiddenDescription:SetTextColor(1, 1, 1)
	end

	if Achievement.tracked then
		AS:SkinCheckBox(Achievement.tracked)
		Achievement.tracked:GetRegions():SetTextColor(1, 1, 1)
		Achievement.tracked:ClearAllPoints()
		Achievement.tracked:SetPoint('TOPLEFT', Achievement.icon, 'BOTTOMLEFT', 0, 0)
	end
end

function AS:SkinAchievementStatusBar(StatusBar)
	AS:SkinStatusBar(StatusBar)

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

	local TooltipBorders = { _G.AchievementFrameStats, _G.AchievementFrameSummary, _G.AchievementFrameAchievements, _G.AchievementFrameComparison }

	for _, Frame in pairs(TooltipBorders) do
		for i = 1, Frame:GetNumChildren() do
			local Child = select(i, Frame:GetChildren())
			if Child and Child:IsObjectType('Frame') and not Child:GetName() then
				Child:SetBackdrop(nil)
			end
		end
	end

	AS:SkinBackdropFrame(_G.AchievementFrame, nil, nil, true)
	_G.AchievementFrame.Backdrop:SetPoint('TOPLEFT', 0, 3)
	_G.AchievementFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, 0)

	AS:SkinCloseButton(_G.AchievementFrameCloseButton)
	_G.AchievementFrameCloseButton:SetPoint("TOPRIGHT", _G.AchievementFrame, "TOPRIGHT", 5, 6)

	AS:SkinBackdropFrame(_G.AchievementFrameCategories, nil, nil, true)
	_G.AchievementFrameCategories.Backdrop:SetPoint('TOPLEFT', _G.AchievementFrameCategories, 'TOPLEFT', 2, -2)
	_G.AchievementFrameCategories.Backdrop:SetPoint('BOTTOMRIGHT', _G.AchievementFrameCategories, 'BOTTOMRIGHT', -2, 2)
	_G.AchievementFrameCategories.SetBackdrop = AS.Noop

	AS:StripTextures(_G.AchievementFrameHeader, true)
	AS:SkinBackdropFrame(_G.AchievementFrameSummary, nil, nil, true)
	_G.AchievementFrameSummary.Backdrop:SetPoint('TOPLEFT', 1, -3)
	_G.AchievementFrameSummary.Backdrop:SetPoint('BOTTOMRIGHT', -1, 2)

	AS:StripTextures(_G.AchievementFrameSummaryCategoriesHeader, true)
	AS:StripTextures(_G.AchievementFrameSummaryAchievementsHeader, true)
	AS:StripTextures(_G.AchievementFrameAchievements, true)
	AS:StripTextures(_G.AchievementFrameComparison, true)
	AS:StripTextures(_G.AchievementFrameStatsBG, true)

	AS:StripTextures(_G.AchievementFrameComparisonSummaryPlayer, true)
	AS:StripTextures(_G.AchievementFrameComparisonSummaryFriend, true)
	AS:StripTextures(_G.AchievementFrameComparisonHeader, true)

	AS:SkinDropDownBox(_G.AchievementFrameFilterDropDown, 130)
	_G.AchievementFrameFilterDropDownText:SetJustifyH('RIGHT')
	_G.AchievementFrameFilterDropDownText:ClearAllPoints()
	_G.AchievementFrameFilterDropDownText:SetPoint('RIGHT', _G.AchievementFrameFilterDropDown, 'RIGHT', -34, 0)
	_G.AchievementFrameFilterDropDown:ClearAllPoints()
	_G.AchievementFrameFilterDropDown:SetPoint("TOPLEFT", _G.AchievementFrame, "TOPLEFT", 98, 7)
	_G.AchievementFrameFilterDropDownButton:ClearAllPoints()
	_G.AchievementFrameFilterDropDownButton:SetPoint("TOPRIGHT", _G.AchievementFrameFilterDropDown, "TOPRIGHT", -14, -8)
	_G.AchievementFrameFilterDropDownButton.SetWidth = AS.Noop

	_G.AchievementFrameComparisonHeader:SetPoint("BOTTOMRIGHT", _G.AchievementFrameComparison, "TOPRIGHT", 45, -20)

	_G.AchievementFrameHeaderTitle:ClearAllPoints()
	_G.AchievementFrameHeaderTitle:SetPoint("TOPLEFT", _G.AchievementFrame, "TOP", -200, -3)
	_G.AchievementFrameHeaderPoints:ClearAllPoints()
	_G.AchievementFrameHeaderPoints:SetPoint("LEFT", _G.AchievementFrameHeaderTitle, "RIGHT", 2, 0)
	AS:SkinEditBox(_G.AchievementFrame.searchBox)
	_G.AchievementFrame.searchBox:SetHeight(16)
	_G.AchievementFrame.searchBox:ClearAllPoints()
	_G.AchievementFrame.searchBox:SetPoint("LEFT", _G.AchievementFrameHeaderPoints, "RIGHT", 50, 0)

	AS:SkinAchievementStatusBar(_G.AchievementFrameSummaryCategoriesStatusBar)
	_G.AchievementFrameSummaryCategoriesStatusBarTitle:SetTextColor(1, 1, 1)

	AS:SkinAchievementStatusBar(_G.AchievementFrameComparisonSummaryPlayerStatusBar)
	AS:SkinAchievementStatusBar(_G.AchievementFrameComparisonSummaryFriendStatusBar)

	AS:SkinBackdropFrame(_G.AchievementFrameAchievementsContainer, nil, nil, true)
	_G.AchievementFrameAchievementsContainer.Backdrop:SetPoint('TOPLEFT', _G.AchievementFrameAchievementsContainer, 'TOPLEFT', -2, 1)
	_G.AchievementFrameAchievementsContainer.Backdrop:SetPoint('BOTTOMRIGHT', _G.AchievementFrameAchievementsContainer, 'BOTTOMRIGHT', 0, -3)

	AS:SkinBackdropFrame(_G.AchievementFrameComparisonContainer, nil, nil, true)
	_G.AchievementFrameComparisonContainer.Backdrop:SetPoint('TOPLEFT', _G.AchievementFrameComparisonContainer, 'TOPLEFT', -2, 1)
	_G.AchievementFrameComparisonContainer.Backdrop:SetPoint('BOTTOMRIGHT', _G.AchievementFrameComparisonContainer, 'BOTTOMRIGHT', 0, -3)

	AS:SkinScrollBar(_G.AchievementFrameCategoriesContainerScrollBar)
	AS:SkinScrollBar(_G.AchievementFrameAchievementsContainerScrollBar)
	AS:SkinScrollBar(_G.AchievementFrameStatsContainerScrollBar)
	AS:SkinScrollBar(_G.AchievementFrameComparisonContainerScrollBar)
	AS:SkinScrollBar(_G.AchievementFrameComparisonStatsContainerScrollBar)

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

	for _, Achievement in pairs(_G.AchievementFrameAchievementsContainer.buttons) do
		AS:SkinAchievement(Achievement, true)
	end

	for _, Stats in pairs(_G.AchievementFrameStatsContainer.buttons) do
		AS:StripTextures(Stats)
		Stats.background:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
		Stats.background:SetTexCoord(0, 1, 0, 1)
		Stats.background.SetTexCoord = AS.Noop
		Stats.background:SetAlpha(.3)
		Stats.background.SetAlpha = AS.Noop
		hooksecurefunc(Stats.background, 'SetBlendMode', function(self, blend) if blend == 'BLEND' then self:Hide() else self:Show() end end)
	end

	for _, Achievement in pairs(_G.AchievementFrameComparisonContainer.buttons) do
		AS:SkinAchievement(Achievement.player)
		AS:SkinAchievement(Achievement.friend)
	end

	local function setAchievementColor(frame)
		if frame and frame.Backdrop then
			if frame.accountWide then
				frame.Backdrop:SetBackdropColor(.1, .2, .3)
			else
				frame.Backdrop:SetBackdropColor(unpack(AS.BackdropColor))
			end
		end
	end

	hooksecurefunc('AchievementButton_DisplayAchievement', setAchievementColor)

	hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function()
		for _, Achievement in pairs(_G.AchievementFrameSummaryAchievements.buttons) do
			AS:SkinAchievement(Achievement)
			setAchievementColor(Achievement)
		end
	end)

	hooksecurefunc('AchievementFrameCategories_Update', function()
		for _, Category in pairs(_G.AchievementFrameCategoriesContainer.buttons) do
			if not Category.isSkinned then
				AS:SkinFrame(Category)
				Category:HookScript('OnEnter', function(s) s:SetBackdropColor(unpack(AS.Color)) end)
				Category:HookScript('OnLeave', function(s)
					if s.isSelected then
						s:SetBackdropColor(1, .82, 0)
					else
						s:SetBackdropColor(unpack(AS.BackdropColor))
					end
				end)
				hooksecurefunc(Category, 'LockHighlight', function(self) self:SetBackdropColor(1, .82, 0) end)
				hooksecurefunc(Category, 'UnlockHighlight', function(self) self:SetBackdropColor(unpack(AS.BackdropColor)) end)
				Category.label:SetTextColor(1, 1, 1)
				Category.isSkinned = true
			end
		end
	end)

	hooksecurefunc('AchievementButton_GetProgressBar', function(index)
		local frame = _G['AchievementFrameProgressBar'..index]
		if frame and not frame.Backdrop then
			AS:SkinStatusBar(frame)
		end
	end)

	hooksecurefunc('AchievementObjectives_DisplayCriteria', function(objectivesFrame, id)
		local numCriteria = GetAchievementNumCriteria(id)
		local textStrings, metas, criteria, object = 0, 0
		for i = 1, numCriteria do
			local _, criteriaType, completed, _, _, _, _, assetID = GetAchievementCriteriaInfo(id, i)

			if ( criteriaType == _G.CRITERIA_TYPE_ACHIEVEMENT and assetID ) then
				metas = metas + 1
				criteria, object = AchievementButton_GetMeta(metas), 'label'
			elseif criteriaType ~= 1 then
				textStrings = textStrings + 1
				criteria, object = AchievementButton_GetCriteria(textStrings), 'name'
			end

			local r, g, b, x, y = .6, .6, .6, 1, -1
			if ( objectivesFrame.completed and completed ) then
				r, g, b, x, y = 1, 1, 1, 0, 0
			elseif ( completed ) then
				r, g, b, x, y = 0, 1, 0, 1, -1
			end

			criteria[object]:SetTextColor(r, g, b)
			criteria[object]:SetShadowOffset(x, y)
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_AchievementUI", AS.Blizzard_AchievementUI, 'ADDON_LOADED')
