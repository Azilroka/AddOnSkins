local AS = unpack(AddOnSkins)

function AS:SkinAchievement(Achievement, BiggerIcon)
	AS:StripTextures(Achievement, true)
	AS:CreateBackdrop(Achievement, nil, true)
	Achievement.Backdrop:SetInside()
	AS:SetTemplate(Achievement.icon)
	Achievement.icon:SetSize(BiggerIcon and 54 or 36, BiggerIcon and 54 or 36)
	Achievement.icon:ClearAllPoints()
	Achievement.icon:SetPoint("LEFT", 8, 0)
	Achievement.icon.bling:Kill()
	Achievement.icon.frame:Kill()
	AS:SkinTexture(Achievement.icon.texture)
	Achievement.icon.texture:SetInside()

	if Achievement.highlight then
		AS:StripTextures(Achievement.highlight)
		Achievement:HookScript('OnEnter', function(self) self.Backdrop:SetBackdropBorderColor(1, 1, 0) end)
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
	StatusBar:SetStatusBarColor(4/255, 179/255, 30/255)

	if StatusBar.title then
		StatusBar.title:SetPoint("LEFT", 4, 0)
	end

	if StatusBar.label then
		StatusBar.label:SetPoint("LEFT", 4, 0)
	end

	if StatusBar.text then
		StatusBar.text:SetPoint("RIGHT", -4, 0)
	end
end

function AS:Blizzard_AchievementUI(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		hooksecurefunc('HybridScrollFrame_CreateButtons', function(frame, template)
			if template == "AchievementCategoryTemplate" then
				for _, button in pairs(frame.buttons) do
					AS:StripTextures(button, true)
					AS:StyleButton(button)
				end
			end
			if template == "AchievementTemplate" then
				for _, Achievement in pairs(frame.buttons) do
					AS:SkinAchievement(Achievement, true)
				end
			end
			if template == "ComparisonTemplate" then
				for _, Achievement in pairs(frame.buttons) do
					AS:SkinAchievement(Achievement.player)
					AS:SkinAchievement(Achievement.friend)

					hooksecurefunc(Achievement.player, 'Saturate', function()
						if Achievement.player.accountWide then
							Achievement.player.Backdrop:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
							Achievement.friend.Backdrop:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
						else
							Achievement.player.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
							Achievement.friend.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
						end
					end)
				end
			end
			if template == "StatTemplate" then
				for _, Stats in pairs(frame.buttons) do
					AS:StripTextures(Stats, true)
					AS:StyleButton(Stats)
				end
			end
		end)
	end
	if addon == 'Blizzard_AchievementUI' then
		AS:UnregisterSkinEvent('Blizzard_AchievementUI', 'ADDON_LOADED')
		AS:SkinFrame(AchievementFrame, nil, nil, true)
		AS:SkinCloseButton(AchievementFrameCloseButton)

--		AS:SkinDropDownBox(AchievementFrameFilterDropDown)
		AchievementFrameFilterDropDown:ClearAllPoints()
		AchievementFrameFilterDropDown:SetPoint("TOPRIGHT", AchievementFrame, "TOPRIGHT", -44, 0)

		AS:SkinBackdropFrame(AchievementFrameCategories, nil, nil, true)
		AchievementFrameCategories.Backdrop:SetInside()
		AS:StripTextures(AchievementFrameSummary, true)

		AS:StripTextures(AchievementFrameHeader, true)
		AS:StripTextures(AchievementFrameSummaryCategoriesHeader, true)
		AS:StripTextures(AchievementFrameSummaryAchievementsHeader, true)
		AS:StripTextures(AchievementFrameAchievements, true)
		AS:StripTextures(AchievementFrameComparison, true)
		AS:StripTextures(AchievementFrameStatsBG, true)

		AS:StripTextures(AchievementFrameComparisonSummaryPlayer, true)
		AS:StripTextures(AchievementFrameComparisonSummaryFriend, true)
		AS:StripTextures(AchievementFrameComparisonHeader, true)
		AchievementFrameComparisonHeader:SetPoint("BOTTOMRIGHT", AchievementFrameComparison, "TOPRIGHT", 45, -20)

		local TooltipBorders = {
			AchievementFrameStats,
			AchievementFrameSummary,
			AchievementFrameAchievements,
			AchievementFrameComparison
		}

		for _, Frame in pairs(TooltipBorders) do
			for i = 1, Frame:GetNumChildren() do
				local Child = select(i, Frame:GetChildren())
				if Child and Child:IsObjectType('Frame') and not Child:GetName() then
					Child:SetBackdrop(nil)
				end
			end
		end

		AchievementFrameHeaderTitle:ClearAllPoints()
		AchievementFrameHeaderTitle:SetPoint("TOPLEFT", AchievementFrame, "TOP", -50, -6)
		AchievementFrameHeaderPoints:ClearAllPoints()
		AchievementFrameHeaderPoints:SetPoint("LEFT", AchievementFrameHeaderTitle, "RIGHT", 2, 0)
		AS:SkinEditBox(AchievementFrame.searchBox)
		AchievementFrame.searchBox:SetHeight(18)
		AchievementFrame.searchBox:ClearAllPoints()
		AchievementFrame.searchBox:SetPoint("RIGHT", AchievementFrameHeaderTitle, "LEFT", -1, -1)

		for i = 1, 3 do
			AS:SkinTab(_G["AchievementFrameTab"..i])
		end

		AS:SkinAchievementStatusBar(AchievementFrameSummaryCategoriesStatusBar)
		AS:SkinAchievementStatusBar(AchievementFrameComparisonSummaryPlayerStatusBar)
		AS:SkinAchievementStatusBar(AchievementFrameComparisonSummaryFriendStatusBar)

		for i = 1, 12 do
			local StatusBar = "AchievementFrameSummaryCategoriesCategory"..i
			AS:SkinAchievementStatusBar(_G[StatusBar])

			AS:StripTextures(_G[StatusBar.."ButtonHighlight"])
			_G[StatusBar.."Button"]:HookScript('OnEnter', function(self) self:GetParent().Backdrop:SetBackdropBorderColor(1, 1, 0) end)
			_G[StatusBar.."Button"]:HookScript('OnLeave', function(self) self:GetParent().Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end

		hooksecurefunc('AchievementButton_DisplayAchievement', function(Achievement)
			if Achievement.Backdrop then
				if Achievement.accountWide then
					Achievement.Backdrop:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
				else
					Achievement.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end)

		hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function(...)
			for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
				local Achievement = _G["AchievementFrameSummaryAchievement"..i]
				if not Achievement.isSkinned then
					AS:SkinAchievement(Achievement)
					Achievement.isSkinned = true
				end

				if Achievement.isSkinned then
					if Achievement.accountWide then
						Achievement.Backdrop:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
					else
						Achievement.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
					end
				end
			end
		end)

--		Disabled for now
--
--		AS:SkinBackdropFrame(AchievementFrameAchievementsContainer, nil, nil, true)
--		AchievementFrameAchievementsContainer.Backdrop:SetPoint('TOPLEFT', AchievementFrameCategories, 'TOPRIGHT', 2, 0)
--		AchievementFrameAchievementsContainer.Backdrop:SetPoint('BOTTOMLEFT', AchievementFrameCategories, 'BOTTOMRIGHT', 2, 0)

		-- ScrollBars
		AS:SkinScrollBar(AchievementFrameCategoriesContainerScrollBar)
		AS:SkinScrollBar(AchievementFrameAchievementsContainerScrollBar)
		AS:SkinScrollBar(AchievementFrameStatsContainerScrollBar)
		AS:SkinScrollBar(AchievementFrameComparisonContainerScrollBar)
		AS:SkinScrollBar(AchievementFrameComparisonStatsContainerScrollBar)

		hooksecurefunc("AchievementButton_GetProgressBar", function(index)
			local frame = _G["AchievementFrameProgressBar"..index]
			if frame then
				if not frame.skinned then
					AS:SkinStatusBar(frame)
					frame:SetStatusBarColor(4/255, 179/255, 30/255)

					frame.text:ClearAllPoints()
					frame.text:SetPoint("CENTER", frame, "CENTER", 0, -1)
					frame.text:SetJustifyH("CENTER")

					if index > 1 then
						frame:ClearAllPoints()
						frame:SetPoint("TOP", _G["AchievementFrameProgressBar"..index-1], "BOTTOM", 0, -5)
						frame.SetPoint = function() end
						frame.ClearAllPoints = function() end
					end

					frame.skinned = true
				end
			end
		end)

		hooksecurefunc("AchievementObjectives_DisplayCriteria", function(objectivesFrame, id)
			local numCriteria = GetAchievementNumCriteria(id)
			local textStrings, metas = 0, 0
			for i = 1, numCriteria do
				local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString = GetAchievementCriteriaInfo(id, i)

				if ( criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID ) then
					metas = metas + 1
					local metaCriteria = AchievementButton_GetMeta(metas)
					if ( objectivesFrame.completed and completed ) then
						metaCriteria.label:SetShadowOffset(0, 0)
						metaCriteria.label:SetTextColor(1, 1, 1, 1)
					elseif ( completed ) then
						metaCriteria.label:SetShadowOffset(1, -1)
						metaCriteria.label:SetTextColor(0, 1, 0, 1)
					else
						metaCriteria.label:SetShadowOffset(1, -1)
						metaCriteria.label:SetTextColor(.6, .6, .6, 1)
					end
				elseif criteriaType ~= 1 then
					textStrings = textStrings + 1
					local criteria = AchievementButton_GetCriteria(textStrings)
					if ( objectivesFrame.completed and completed ) then
						criteria.name:SetTextColor(1, 1, 1, 1)
						criteria.name:SetShadowOffset(0, 0)
					elseif ( completed ) then
						criteria.name:SetTextColor(0, 1, 0, 1)
						criteria.name:SetShadowOffset(1, -1)
					else
						criteria.name:SetTextColor(.6, .6, .6, 1)
						criteria.name:SetShadowOffset(1, -1)
					end
				end
			end
		end)
	end
end

AS:RegisterSkin("Blizzard_AchievementUI", AS.Blizzard_AchievementUI, 'ADDON_LOADED')