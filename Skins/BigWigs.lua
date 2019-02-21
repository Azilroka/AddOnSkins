local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BigWigs') then return end

function AS:BigWigs(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		if BigWigsLoader then
			BigWigsLoader.RegisterMessage('AddOnSkins', "BigWigs_FrameCreated", function(event, frame, name)
				if name == "QueueTimer" then
					AS:SkinStatusBar(frame, {1, 0, 0})
					frame:ClearAllPoints()
					frame:SetPoint('TOP', '$parent', 'BOTTOM', 0, AS:AdjustForTheme(-2))
					frame:SetHeight(16)
				end
			end)
		end
	end

	if event == 'ADDON_LOADED' and addon == 'BigWigs_Plugins' then
		local buttonsize = 19
		local FreeBackgrounds = {}

		local CreateBG = function()
			local BG = CreateFrame('Frame')
			AS:SkinFrame(BG)
			return BG
		end

		local function FreeStyle(bar, FreeBackgrounds)
			local bg = bar:Get('bigwigs:AddOnSkins:bg')
			if bg then
				bg:ClearAllPoints()
				bg:SetParent(UIParent)
				bg:Hide()
				FreeBackgrounds[#FreeBackgrounds + 1] = bg
			end

			local ibg = bar:Get('bigwigs:AddOnSkins:ibg')
			if ibg then
				ibg:ClearAllPoints()
				ibg:SetParent(UIParent)
				ibg:Hide()
				FreeBackgrounds[#FreeBackgrounds + 1] = ibg
			end

			bar.candyBarIconFrame:ClearAllPoints()
			bar.candyBarIconFrame:SetPoint('TOPLEFT')
			bar.candyBarIconFrame:SetPoint('BOTTOMLEFT')

			bar.candyBarBar:ClearAllPoints()
			bar.candyBarBar.SetPoint = nil
			bar.candyBarBar:SetPoint('TOPRIGHT')
			bar.candyBarBar:SetPoint('BOTTOMRIGHT')
		end

		local function GetBG(FreeBackgrounds)
			if #FreeBackgrounds > 0 then
				return tremove(FreeBackgrounds)
			else
				return CreateBG()
			end
		end

		local function SetupBG(bg, bar, ibg)
			bg:SetParent(bar)
			bg:SetFrameStrata(bar:GetFrameStrata())
			bg:SetFrameLevel(bar:GetFrameLevel() - 1)
			bg:ClearAllPoints()
			if ibg then
				bg:SetOutside(bar.candyBarIconFrame)
				bg:SetBackdropColor(0, 0, 0, 0)
			else
				bg:SetOutside(bar)
				bg:SetBackdropColor(unpack(AS.BackdropColor))
			end
			bg:Show()
		end

		local function ApplyStyle(bar, FreeBackgrounds, buttonsize)
			bar:SetHeight(buttonsize)

			local bg = GetBG(FreeBackgrounds)
			SetupBG(bg, bar)
			bar:Set('bigwigs:AddOnSkins:bg', bg)

			if bar.candyBarIconFrame:GetTexture() then
				local ibg = GetBG(FreeBackgrounds)
				SetupBG(ibg, bar, true)
				bar:Set('bigwigs:AddOnSkins:ibg', ibg)
			end

			bar.candyBarBar:ClearAllPoints()
			bar.candyBarBar:SetAllPoints(bar)
			bar.candyBarBar.SetPoint = AS.Noop
			bar.candyBarBar:SetStatusBarTexture(AS.NormTex)
			bar.candyBarBackground:SetTexture(AS.NormTex)

			bar.candyBarIconFrame:ClearAllPoints()
			bar.candyBarIconFrame:SetPoint('BOTTOMRIGHT', bar, 'BOTTOMLEFT', -7, 0)
			bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
			AS:SkinTexture(bar.candyBarIconFrame)

			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("LEFT", bar, "LEFT", 2, 0)
			bar.candyBarLabel:SetPoint("RIGHT", bar, "RIGHT", -2, 0)

			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("LEFT", bar, "LEFT", 2, 0)
			bar.candyBarDuration:SetPoint("RIGHT", bar, "RIGHT", -2, 0)
		end

		local function ApplyStyleHalfBar(bar, FreeBackgrounds, buttonsize)
			local bg = GetBG(FreeBackgrounds)
			SetupBG(bg, bar)
			bar:Set('bigwigs:AddOnSkins:bg', bg)

			if bar.candyBarIconFrame:GetTexture() then
				local ibg = GetBG(FreeBackgrounds)
				SetupBG(ibg, bar, true)
				bar:Set('bigwigs:AddOnSkins:ibg', ibg)
			end

			bar:SetHeight(buttonsize / 2)

			bar.candyBarBar:ClearAllPoints()
			bar.candyBarBar:SetAllPoints(bar)
			bar.candyBarBar.SetPoint = AS.Noop
			bar.candyBarBar:SetStatusBarTexture(AS.NormTex)
			bar.candyBarBackground:SetTexture(unpack(AS.BackdropColor))

			bar.candyBarIconFrame:ClearAllPoints()
			bar.candyBarIconFrame:SetPoint('BOTTOMRIGHT', bar, 'BOTTOMLEFT', -7, 0)
			bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
			AS:SkinTexture(bar.candyBarIconFrame)

			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("LEFT", bar, "LEFT", 2, AS:AdjustForTheme(10))
			bar.candyBarLabel:SetPoint("RIGHT", bar, "RIGHT", -2, AS:AdjustForTheme(10))

			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("LEFT", bar, "LEFT", 2, AS:AdjustForTheme(10))
			bar.candyBarDuration:SetPoint("RIGHT", bar, "RIGHT", -2, AS:AdjustForTheme(10))

			AS:SkinTexture(bar.candyBarIconFrame)
		end

		local BigWigsBars = BigWigs:GetPlugin('Bars')
		BigWigsBars:RegisterBarStyle('AddOnSkins', {
			apiVersion = 1,
			version = 1,
			GetSpacing = function() return 3 end,
			ApplyStyle = function(bar) ApplyStyle(bar, FreeBackgrounds, buttonsize) end,
			BarStopped = function(bar) FreeStyle(bar, FreeBackgrounds) end,
			GetStyleName = function() return 'AddOnSkins' end,
		})
		BigWigsBars:RegisterBarStyle('AddOnSkins Half-Bar', {
			apiVersion = 1,
			version = 1,
			GetSpacing = function() return 13 end,
			ApplyStyle = function(bar) ApplyStyleHalfBar(bar, FreeBackgrounds, buttonsize) end,
			BarStopped = function(bar) FreeStyle(bar, FreeBackgrounds) end,
			GetStyleName = function() return 'AddOnSkins Half-Bar' end,
		})

		AS:UnregisterSkinEvent('BigWigs', event)
	end
end

AS:RegisterSkin('BigWigs', AS.BigWigs, 'ADDON_LOADED')
AS:RegisterSkinForPreload('BigWigs_Plugins', AS.BigWigs)
