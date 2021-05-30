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
		return
	end

	if event == 'ADDON_LOADED' and addon == 'BigWigs_Plugins' then
		local function FreeStyle(bar)
			local bd = bar.candyBarBackdrop
			local iconBd = bar.candyBarIconFrameBackdrop

			local height = bar:Get("bigwigs:restoreheight")
			if height then
				bar:SetHeight(height)
			end

			local tex = bar:Get("bigwigs:restoreicon")
			if tex then
				bar:SetIcon(tex)
				bar:Set("bigwigs:restoreicon", nil)
			end

			bd:Hide()
			iconBd:Hide()
			if AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel' then
				bd.InsideBorder:Hide()
				bd.OutsideBorder:Hide()
				iconBd.InsideBorder:Hide()
				iconBd.OutsideBorder:Hide()
			end
		end

		local function ApplyStyle(bar)
			local bd = bar.candyBarBackdrop

			AS:SetTemplate(bd)
			bd:SetOutside(bar)

			local tex = bar:GetIcon()
			if tex then
				local icon = bar.candyBarIconFrame
				bar:SetIcon(nil)
				icon:SetTexture(tex)
				icon:Show()
				icon:ClearAllPoints()
				icon:SetPoint('BOTTOMRIGHT', bar, 'BOTTOMLEFT', -7, 0)
				icon:SetSize(bar:GetHeight(), bar:GetHeight())
				bar:Set("bigwigs:restoreicon", tex)
				AS:SkinTexture(icon)

				local iconBd = bar.candyBarIconFrameBackdrop
				AS:SetTemplate(iconBd)
				iconBd:SetOutside(icon)

				iconBd:Show()
				if AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel' then
					iconBd.InsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel')
					iconBd.OutsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder')
				end
			end

			bd:Show()
			if AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel' then
				bd.InsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel')
				bd.OutsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder')
			end
		end

		local function ApplyStyleHalfBar(bar)
			local bd = bar.candyBarBackdrop

			AS:SetTemplate(bd)
			bd:SetOutside(bar)

			local tex = bar:GetIcon()
			if tex then
				local icon = bar.candyBarIconFrame
				bar:SetIcon(nil)
				icon:SetTexture(tex)
				icon:Show()
				icon:ClearAllPoints()
				icon:SetPoint('BOTTOMRIGHT', bar, 'BOTTOMLEFT', -7, 0)
				icon:SetSize(bar:GetHeight() * 2, bar:GetHeight() * 2)
				bar:Set("bigwigs:restoreicon", tex)
				AS:SkinTexture(icon)

				local iconBd = bar.candyBarIconFrameBackdrop
				AS:SetTemplate(iconBd)
				iconBd:SetOutside(icon)

				iconBd:Show()
				if AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel' then
					iconBd.InsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel')
					iconBd.OutsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder')
				end
			end

			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:Point("LEFT", bar, "LEFT", 2, AS:AdjustForTheme(12))
			bar.candyBarLabel:Point("RIGHT", bar, "RIGHT", -2, AS:AdjustForTheme(12))

			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:Point("LEFT", bar, "LEFT", 2, AS:AdjustForTheme(12))
			bar.candyBarDuration:Point("RIGHT", bar, "RIGHT", -2, AS:AdjustForTheme(12))

			bd:Show()
			if AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel' then
				bd.InsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder' or AS:CheckOption('Theme') == 'TwoPixel')
				bd.OutsideBorder:SetShown(AS:CheckOption('Theme') == 'ThickBorder')
			end
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

AS:RegisterSkin('BigWigs', AS.BigWigs, 'ADDON_LOADED')
AS:RegisterSkinForPreload('BigWigs_Plugins', AS.BigWigs, 'BigWigs')
