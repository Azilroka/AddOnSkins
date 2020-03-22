local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('DBM-Core') and AS:CheckAddOn('DBM-StatusBarTimers') and AS:CheckAddOn('DBM-DefaultSkin')) then return end

function AS:DBM(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		local function SkinBars(self)
			for bar in self:GetBarIterator() do
				if not bar.injected then
					hooksecurefunc(bar, "Update", function()
						local sparkEnabled = bar.owner.options.Style ~= "BigWigs" and bar.owner.options.Spark
						if not (AS:CheckOption('DBMSkinHalf') and sparkEnabled) then return end
						local spark = _G[bar.frame:GetName().."BarSpark"]
						spark:SetSize(12, bar.owner.options.Height*3/2 - 2)
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

						AS:SkinTexture(icon1, true)
						icon1:ClearAllPoints()
						icon1:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', AS:AdjustForTheme(-2), 1)

						AS:SkinTexture(icon2, true)
						icon2:ClearAllPoints()
						icon2:SetPoint('BOTTOMLEFT', frame, 'BOTTOMRIGHT', AS:AdjustForTheme(2), 1)

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
							if (not bar.owner.options.BarYOffset or bar.owner.options.BarYOffset and bar.owner.options.BarYOffset < 13) then
								bar.owner.options.BarYOffset = 13
							end

							if (not bar.owner.options.HugeBarYOffset or bar.owner.options.HugeBarYOffset and bar.owner.options.HugeBarYOffset < 13) then
								bar.owner.options.HugeBarYOffset = 13
							end

							frame:SetHeight(bar.owner.options.Height / 3)
							name:SetPoint('BOTTOMLEFT', frame, 'TOPLEFT', 0, 3)
							timer:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', -1, 1)
						else
							frame:SetHeight(bar.owner.options.Height + 2)
							name:SetPoint('LEFT', frame, 'LEFT', 4, 0)
							timer:SetPoint('RIGHT', frame, 'RIGHT', -4, 0)
						end

						timer:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
						name:SetFont(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))

						if bar.owner.options.IconLeft then icon1.Backdrop:Show() else icon1.Backdrop:Hide() end
						if bar.owner.options.IconRight then icon2.Backdrop:Show() else icon2.Backdrop:Hide() end

						bar.injected = true
					end)
					bar:ApplyStyle()
				end
			end
		end

		local function SkinRange(self, range, filter, forceshow, redCircleNumPlayers)
			if DBM.Options.DontShowRangeFrame and not forceshow then return end
			if DBMRangeCheck then
				if AS:CheckOption('DBMRadarTrans') then
					DBMRangeCheckRadar.background:Hide()
				else
					AS:SetTemplate(DBMRangeCheck)
					AS:SetTemplate(DBMRangeCheckRadar)
				end
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
	end

	if addon == 'DBM-GUI' then
		DBM_GUI_OptionsFrame:HookScript('OnShow', function()
			AS:SkinFrame(DBM_GUI_OptionsFrame)
			AS:SkinFrame(DBM_GUI_OptionsFrameBossMods)
			AS:SkinFrame(DBM_GUI_OptionsFrameDBMOptions)
			AS:SkinFrame(DBM_GUI_OptionsFramePanelContainer)
		end)
		AS:SkinTab(DBM_GUI_OptionsFrameTab1)
		AS:SkinTab(DBM_GUI_OptionsFrameTab2)
		AS:SkinButton(DBM_GUI_OptionsFrameOkay, true)
		AS:SkinButton(DBM_GUI_OptionsFrameWebsiteButton, true)
		AS:SkinScrollBar(DBM_GUI_OptionsFramePanelContainerFOVScrollBar)
		AS:UnregisterSkinEvent('DBM', event)
	end
end

AS:RegisterSkin('DBM-Core', AS.DBM, 'ADDON_LOADED')
