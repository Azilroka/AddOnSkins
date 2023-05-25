local AS, L, S, R = unpack(AddOnSkins)

function R:BigWigs(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		if BigWigsLoader then
			BigWigsLoader.RegisterMessage('AddOnSkins', "BigWigs_FrameCreated", function(event, frame, name)
				if name == "QueueTimer" then
					S:HandleStatusBar(frame, {1, 0, 0})
					frame:ClearAllPoints()
					frame:SetPoint('TOP', frame:GetParent(), 'BOTTOM', 0, S:AdjustForTheme(-2))
					frame:SetHeight(16)
				end
			end)
		end
		return
	end

	if event == 'ADDON_LOADED' and addon == 'BigWigs' then
		local function FreeStyle(bar)
			local bd = bar.candyBarBackdrop
			local iconBd = bar.candyBarIconFrameBackdrop

			bd:Hide()
			local height = bar:Get("bigwigs:restoreheight")
			if height then
				bar:SetHeight(height)
			end

			local tex = bar:Get("bigwigs:restoreicon")
			if tex then
				bar:SetIcon(tex)
				bar:Set("bigwigs:restoreicon", nil)

				iconBd:Hide()
			end

			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("TOPLEFT", bar.candyBarBar, "TOPLEFT", 2, 0)
			bar.candyBarDuration:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "BOTTOMRIGHT", -2, 0)

			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("TOPLEFT", bar.candyBarBar, "TOPLEFT", 2, 0)
			bar.candyBarLabel:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "BOTTOMRIGHT", -2, 0)

			if AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel' then
				S:ToggleBorders(bd, false)
				S:ToggleBorders(iconBd, false)
			end
		end

		local function ApplyStyle(bar)
			local bd = bar.candyBarBackdrop

			S:SetTemplate(bd)
			S:SetOutside(bd, bar)

			local tex = bar:GetIcon()
			if tex then
				local icon = bar.candyBarIconFrame
				bar:SetIcon(nil)
				icon:SetTexture(tex)
				icon:Show()
				icon:ClearAllPoints()
				if bar.iconPosition == "RIGHT" then
					icon:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", (S.PixelMode and 1 or 5), 0)
				else
					icon:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", (S.PixelMode and -1 or -5), 0)
				end
				icon:SetSize(bar:GetHeight(), bar:GetHeight())
				bar:Set("bigwigs:restoreicon", tex)
				S:HandleIcon(icon)

				local iconBd = bar.candyBarIconFrameBackdrop
				S:SetTemplate(iconBd)
				S:SetOutside(iconBd, icon)

				iconBd:Show()
				S:ToggleBorders(iconBd, AS:CheckOption('Theme') == 'ThickBorder')
			end

			bd:Show()
			S:ToggleBorders(bd, AS:CheckOption('Theme') == 'ThickBorder')
		end

		local function ApplyStyleHalfBar(bar)
			local bd = bar.candyBarBackdrop

			S:SetTemplate(bd)
			bd:SetOutside(bar)

			local tex = bar:GetIcon()
			if tex then
				local icon = bar.candyBarIconFrame
				bar:SetIcon(nil)
				icon:SetTexture(tex)
				icon:Show()
				if bar.iconPosition == "RIGHT" then
					icon:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", (S.PixelMode and 1 or 5), 0)
				else
					icon:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", (S.PixelMode and -1 or -5), 0)
				end
				icon:SetSize(bar:GetHeight() * 2, bar:GetHeight() * 2)
				bar:Set("bigwigs:restoreicon", tex)
				S:HandleIcon(icon)

				local iconBd = bar.candyBarIconFrameBackdrop
				S:SetTemplate(iconBd)
				iconBd:SetOutside(icon)

				iconBd:Show()
				S:ToggleBorders(iconBd, AS:CheckOption('Theme') == 'ThickBorder')
			end

			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("LEFT", bar, "LEFT", 2, AS:AdjustForTheme(12))
			bar.candyBarLabel:SetPoint("RIGHT", bar, "RIGHT", -2, AS:AdjustForTheme(12))

			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("LEFT", bar, "LEFT", 2, AS:AdjustForTheme(12))
			bar.candyBarDuration:SetPoint("RIGHT", bar, "RIGHT", -2, AS:AdjustForTheme(12))

			bd:Show()
			S:ToggleBorders(bd, AS:CheckOption('Theme') == 'ThickBorder')
		end

		BigWigsAPI:RegisterBarStyle('AddOnSkins', {
			apiVersion = 1, version = 10,
			barSpacing = 3,
			barHeight = 20,
			ApplyStyle = function(bar) ApplyStyle(bar) end,
			BarStopped = function(bar) FreeStyle(bar) end,
			GetStyleName = function() return 'AddOnSkins' end,
		})
		BigWigsAPI:RegisterBarStyle('AddOnSkins Half-Bar', {
			apiVersion = 1, version = 10,
			barSpacing = 13,
			barHeight = 10,
			ApplyStyle = function(bar) ApplyStyleHalfBar(bar) end,
			BarStopped = function(bar) FreeStyle(bar) end,
			GetStyleName = function() return 'AddOnSkins Half-Bar' end,
		})

		AS:UnregisterSkinEvent('BigWigs', event)
	end
end

AS:RegisterSkin('BigWigs')
AS:RegisterSkinForPreload('BigWigs')
