local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'DBMSkin'
function AS:SkinDBM(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		local croprwicons = true
		local buttonsize = 22
		local function SkinBars(self)
			for bar in self:GetBarIterator() do
				if not bar.injected then
					bar.ApplyStyle = function()
						local frame = bar.frame
						local tbar = _G[frame:GetName()..'Bar']
						local spark = _G[frame:GetName()..'BarSpark']
						local texture = _G[frame:GetName()..'BarTexture']
						local icon1 = _G[frame:GetName()..'BarIcon1']
						local icon2 = _G[frame:GetName()..'BarIcon2']
						local name = _G[frame:GetName()..'BarName']
						local timer = _G[frame:GetName()..'BarTimer']

						if not icon1.overlay then
							icon1.overlay = CreateFrame('Frame', '$parentIcon1Overlay', tbar)
							icon1.overlay:SetTemplate()
							icon1.overlay:SetFrameLevel(0)
							icon1.overlay:Size(buttonsize)
							icon1.overlay:Point('BOTTOMRIGHT', frame, 'BOTTOMLEFT', -(ElvUI[1].PixelMode and 2 or 3), 0)
						end

						if not icon2.overlay then
							icon2.overlay = CreateFrame('Frame', '$parentIcon2Overlay', tbar)
							icon2.overlay:SetTemplate()
							icon2.overlay:SetFrameLevel(0)
							icon2.overlay:Size(buttonsize)
							icon2.overlay:Point('BOTTOMLEFT', frame, 'BOTTOMRIGHT', (ElvUI[1].PixelMode and 2 or 3), 0)
						end

						if bar.color then
							tbar:SetStatusBarColor(bar.color.r, bar.color.g, bar.color.b)
						else
							tbar:SetStatusBarColor(bar.owner.options.StartColorR, bar.owner.options.StartColorG, bar.owner.options.StartColorB)
						end

						if bar.enlarged then
							frame:SetWidth(bar.owner.options.HugeWidth)
							tbar:SetWidth(bar.owner.options.HugeWidth)
							frame:SetScale(bar.owner.options.HugeScale)
						else
							frame:SetWidth(bar.owner.options.Width)
							tbar:SetWidth(bar.owner.options.Width)
							frame:SetScale(bar.owner.options.Scale)
						end

						spark:SetAlpha(0)
						spark:SetTexture(nil)

						icon1:SetTexCoord(unpack(AS.TexCoords))
						icon1:ClearAllPoints()
						icon1:SetInside(icon1.overlay)

						icon2:SetTexCoord(unpack(AS.TexCoords))
						icon2:ClearAllPoints()
						icon2:SetInside(icon2.overlay)

						texture:SetTexture(AS.NormTex)
						--tbar:SetStatusBarTexture(AS.NormTex)

						tbar:SetInside(frame)

						frame:SetTemplate()

						name:ClearAllPoints()
						name:SetWidth(165)
						name:SetHeight(8)
						name:SetJustifyH('LEFT')
						name:SetShadowColor(0, 0, 0, 0)

						timer:ClearAllPoints()
						timer:SetJustifyH('RIGHT')
						timer:SetShadowColor(0, 0, 0, 0)

						if AS:CheckOption('DBMSkinHalf') then
							frame:SetHeight(buttonsize / 3)
							name:Point('BOTTOMLEFT', frame, 'TOPLEFT', 0, 4)
							timer:Point('BOTTOMRIGHT', frame, 'TOPRIGHT', -1, 2)
						else
							frame:SetHeight(buttonsize)
							name:Point('LEFT', frame, 'LEFT', 4, 0)
							timer:Point('RIGHT', frame, 'RIGHT', -4, 0)
						end

						name:FontTemplate(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
						timer:FontTemplate(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
						name:SetTextColor(bar.owner.options.TextColorR, bar.owner.options.TextColorG, bar.owner.options.TextColorB)
						timer:SetTextColor(bar.owner.options.TextColorR, bar.owner.options.TextColorG, bar.owner.options.TextColorB)

						if bar.owner.options.IconLeft then icon1:Show() icon1.overlay:Show() else icon1:Hide() icon1.overlay:Hide() end
						if bar.owner.options.IconRight then icon2:Show() icon2.overlay:Show() else icon2:Hide() icon2.overlay:Hide() end
						tbar:SetAlpha(1)
						frame:SetAlpha(1)
						texture:SetAlpha(1)
						frame:Show()
						bar:Update(0)
						bar.injected = true
					end
					bar:ApplyStyle()
				end
			end
		end
		 
		local SkinBossTitle = function()
			local anchor = DBMBossHealthDropdown:GetParent()
			if not anchor.styled then
				local header = {anchor:GetRegions()}
				if header[1]:IsObjectType('FontString') then
					header[1]:FontTemplate(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
					header[1]:SetTextColor(1, 1, 1)
					header[1]:SetShadowColor(0, 0, 0, 0)
					anchor.styled = true	
				end
				header = nil
			end
			anchor = nil
		end

		local SkinBoss = function()
			local count = 1
			while _G[format('DBM_BossHealth_Bar_%d', count)] do
				local bar = _G[format('DBM_BossHealth_Bar_%d', count)]
				local background = _G[bar:GetName()..'BarBorder']
				local progress = _G[bar:GetName()..'Bar']
				local name = _G[bar:GetName()..'BarName']
				local timer = _G[bar:GetName()..'BarTimer']
				local prev = _G[format('DBM_BossHealth_Bar_%d', count-1)]	
				local _, anch, _ ,_, _ = bar:GetPoint()

				bar:ClearAllPoints()
				if count == 1 then
					if DBM_SavedOptions.HealthFrameGrowUp then
						bar:Point('BOTTOM', anch, 'TOP' , 0 , 12)
					else
						bar:Point('TOP', anch, 'BOTTOM' , 0, -buttonsize)
					end
				else
					if DBM_SavedOptions.HealthFrameGrowUp then
						bar:Point('TOPLEFT', prev, 'TOPLEFT', 0, buttonsize + 4)
					else
						bar:Point('TOPLEFT', prev, 'TOPLEFT', 0, -(buttonsize + 4))
					end
				end

				bar:SetTemplate('Transparent')

				background:SetNormalTexture(nil)

				progress:SetStatusBarTexture(AS.NormTex)
				progress:ClearAllPoints()
				progress:SetInside(bar)

				name:ClearAllPoints()
				name:SetJustifyH('LEFT')
				name:SetShadowColor(0, 0, 0, 0)

				timer:ClearAllPoints()
				timer:SetJustifyH('RIGHT')
				timer:SetShadowColor(0, 0, 0, 0)

				if AS:CheckOption('DBMSkinHalf') then
					bar:SetHeight(buttonsize / 3)
					name:Point('BOTTOMLEFT', bar, 'TOPLEFT', 4, 0)
					timer:Point('BOTTOMRIGHT', bar, 'TOPRIGHT', -4, 0)
				else
					bar:SetHeight(buttonsize)
					name:Point('LEFT', bar, 'LEFT', 4, 0)
					timer:Point('RIGHT', bar, 'RIGHT', -4, 0)
				end

				name:FontTemplate(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))
				timer:FontTemplate(AS.LSM:Fetch('font', AS:CheckOption('DBMFont')), AS:CheckOption('DBMFontSize'), AS:CheckOption('DBMFontFlag'))

				count = count + 1
			end
		end

		hooksecurefunc(DBT, 'CreateBar', SkinBars)
		hooksecurefunc(DBM.BossHealth, 'Show', SkinBossTitle)
		hooksecurefunc(DBM.BossHealth, 'AddBoss', SkinBoss)
		hooksecurefunc(DBM.BossHealth, 'UpdateSettings', SkinBoss)
		if not DBM_SavedOptions['DontShowRangeFrame'] then
			DBM.RangeCheck:Show()
			DBM.RangeCheck:Hide()
			DBMRangeCheck:HookScript('OnShow', function(self) self:SetTemplate('Transparent') end)
			DBMRangeCheckRadar:SetTemplate('Transparent')
		end
		if not DBM_SavedOptions['DontShowInfoFrame'] then
			DBM.InfoFrame:Show(5, 'test')
			DBM.InfoFrame:Hide()
			DBMInfoFrame:HookScript('OnShow', function(self) self:SetTemplate('Transparent') end)
		end
		if croprwicons then
			local RaidNotice_AddMessage_ = RaidNotice_AddMessage
			RaidNotice_AddMessage = function(noticeFrame, textString, colorInfo)
				if textString:find(' |T') then
					textString = gsub(textString,'(:12:12)',':18:18:0:0:64:64:5:59:5:59')
				end
				return RaidNotice_AddMessage_(noticeFrame, textString, colorInfo)
			end
		end
	end
	if addon == 'DBM-GUI' then
		DBM_GUI_OptionsFrame:HookScript('OnShow', function()
			AS:SkinFrame(DBM_GUI_OptionsFrame)
			AS:SkinFrame(DBM_GUI_OptionsFrameBossMods)
			AS:SkinFrame(DBM_GUI_OptionsFrameDBMOptions)
			AS:SkinFrame(DBM_GUI_OptionsFramePanelContainer, 'Transparent', true)
		end)
		AS:SkinTab(DBM_GUI_OptionsFrameTab1)
		AS:SkinTab(DBM_GUI_OptionsFrameTab2)
		AS:SkinButton(DBM_GUI_OptionsFrameOkay, true)
		AS:SkinButton(DBM_GUI_OptionsFrameWebsiteButton, true)
		AS:SkinScrollBar(DBM_GUI_OptionsFramePanelContainerFOVScrollBar)
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinDBM, 'ADDON_LOADED')