local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('DBM-Core') and AS:CheckAddOn('DBM-StatusBarTimers')) then return end

function AS:DBM(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		local function SkinBars(self)
			for bar in self:GetBarIterator() do
				if not bar.injected then
					hooksecurefunc(bar, "Update", function()
						local sparkEnabled = DBT.Options.Spark
						if not (AS:CheckOption('DBMSkinHalf') and sparkEnabled) then return end
						local spark = _G[bar.frame:GetName().."BarSpark"]
						spark:SetSize(12, (bar.enlarged and DBT.Options.HugeHeight or DBT.Options.Height)*3/2 - 2)
						local a, b, c, d = spark:GetPoint()
						spark:SetPoint(a, b, c, d, 0)
					end)
					hooksecurefunc(bar, "ApplyStyle", function()
						local frame = bar.frame
						local tbar = _G[frame:GetName()..'Bar']
						local icon1 = _G[frame:GetName()..'BarIcon1']
						local icon2 = _G[frame:GetName()..'BarIcon2']
						local name = _G[frame:GetName()..'BarName']
						local timer = _G[frame:GetName()..'BarTimer']
						local iconSize = bar.enlarged and DBT.Options.HugeHeight or DBT.Options.Height
						if AS:CheckOption('DBMSkinHalf') then
							iconSize = iconSize * 3
						end

						AS:SkinTexture(icon1, true)
						icon1:ClearAllPoints()
						icon1:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', AS:AdjustForTheme(-2), 1)
						icon1:SetSize(iconSize, iconSize)

						AS:SkinTexture(icon2, true)
						icon2:ClearAllPoints()
						icon2:SetPoint('BOTTOMLEFT', frame, 'BOTTOMRIGHT', AS:AdjustForTheme(2), 1)
						icon2:SetSize(iconSize, iconSize)

						AS:SetInside(tbar, frame)

						AS:SetTemplate(frame)

						name:ClearAllPoints()
						name:SetWidth(165)
						name:SetHeight(8)
						name:SetJustifyH('LEFT')
						name:SetShadowColor(0, 0, 0, 0)

						timer:ClearAllPoints()
						timer:SetJustifyH('RIGHT')
						timer:SetShadowColor(0, 0, 0, 0)

						if AS:CheckOption('DBMSkinHalf') then
							name:SetPoint('BOTTOMLEFT', frame, 'TOPLEFT', 0, 3)
							timer:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', -1, 1)
						else
							name:SetPoint('LEFT', frame, 'LEFT', 4, 0)
							timer:SetPoint('RIGHT', frame, 'RIGHT', -4, 0)
						end

						if DBT.Options.IconLeft then icon1.Backdrop:Show() else icon1.Backdrop:Hide() end
						if DBT.Options.IconRight then icon2.Backdrop:Show() else icon2.Backdrop:Hide() end

						bar.injected = true
					end)
					bar:ApplyStyle()
				end
			end
		end

		local function SkinRange(self, range, filter, forceshow, redCircleNumPlayers)
			if DBM.Options.DontShowRangeFrame and not forceshow then return end
			if DBMRangeCheck then
				AS:SetTemplate(DBMRangeCheck)
				AS:SetTemplate(DBMRangeCheckRadar)
			end
		end

		local function SkinInfo(self, maxLines, event, ...)
			if DBM.Options.DontShowInfoFrame and (event or 0) ~= "test" then return end
			if DBMInfoFrame then
				AS:SetTemplate(DBMInfoFrame)
			end
		end

		hooksecurefunc(DBT, 'CreateBar', SkinBars)
		hooksecurefunc(DBM.RangeCheck, 'Show', SkinRange)
		hooksecurefunc(DBM.InfoFrame, 'Show', SkinInfo)

		if AS:CheckOption('DBMSkinHalf') then
			local halfBarskin = DBT:RegisterSkin("AddOnSkins Half-Bar")
			if DBT.Options.BarYOffset < 18 then
				halfBarskin.Options.BarYOffset = 18
			end
			if DBT.Options.HugeBarYOffset < 18 then
				halfBarskin.Options.HugeBarYOffset = 18
			end
			halfBarskin.Defaults.Height = DBT.Options.Height / 3
			halfBarskin.Defaults.HugeHeight = DBT.Options.HugeHeight / 3
			halfBarskin.Options.IconLocked = true
			DBT:SetSkin("AddOnSkins Half-Bar")
		else
			local skin = DBT:RegisterSkin("AddOnSkins")
			skin.Defaults.Height = DBT.Options.Height + 2
			skin.Defaults.HugeHeight = DBT.Options.HugeHeight + 2
			skin.Options.IconLocked = true
			DBT:SetSkin("AddOnSkins")
		end
	end

	if addon == 'DBM-GUI' then
		DBM_GUI_OptionsFrame:HookScript('OnShow', function()
			AS:SkinFrame(DBM_GUI_OptionsFrame)
			AS:SkinFrame(DBM_GUI_OptionsFrameList)
			AS:SkinFrame(DBM_GUI_OptionsFrameBossMods)
			AS:SkinFrame(DBM_GUI_OptionsFrameDBMOptions)
			AS:SkinFrame(DBM_GUI_OptionsFramePanelContainer)
		end)

		AS:SkinTab(DBM_GUI_OptionsFrameTab1)
		AS:SkinTab(DBM_GUI_OptionsFrameTab2)
		AS:SkinButton(DBM_GUI_OptionsFrameOkay, true)
		AS:SkinButton(DBM_GUI_OptionsFrameWebsiteButton, true)
		AS:SkinScrollBar(DBM_GUI_OptionsFramePanelContainerFOVScrollBar)
		AS:UnregisterSkinEvent('DBM-Core', event)
	end
end

AS:RegisterSkin('DBM-Core', AS.DBM, 'ADDON_LOADED')
